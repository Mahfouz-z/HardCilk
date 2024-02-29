#include <fmt/format.h>
#include <sctlm/tlm_lib/modules/iconnect.hpp>

namespace sctlm::tlm_lib::modules {

iconnect::iconnect(sc_core::sc_module_name name, size_t num_initiators, size_t num_targets) {
    /* reserve space in vectors */
    target_sockets_.reserve(num_initiators);
    initiator_sockets_.reserve(num_targets);
    target_offsets_.reserve(num_initiators);

    size_t i;

    for (i = 0; i < num_initiators; i++) {
        target_offsets_.emplace_back(0);
        target_sockets_.emplace_back(new target_socket_t { fmt::format("target_socket_{}", i).c_str() });

        auto& target_socket = *target_sockets_.back();
        target_socket.register_b_transport(this, &iconnect::target_b_transport, i);
        target_socket.register_transport_dbg(this, &iconnect::target_transport_dbg, i);
        target_socket.register_get_direct_mem_ptr(this, &iconnect::target_get_direct_mem_ptr, i);
    }

    for (i = 0; i < num_targets; i++) {
        initiator_sockets_.emplace_back(new initiator_socket_t { fmt::format("initiator_socket_{}", i).c_str() });

        auto& initiator_socket = *initiator_sockets_.back();
        initiator_socket.register_invalidate_direct_mem_ptr(this, &iconnect::initiator_invalidate_direct_mem_ptr, i);
    }
}

unsigned int iconnect::map_address(
    sc_dt::uint64 addr,
    sc_dt::uint64& offset
) {
    unsigned int i;

    for (auto& entry : map_) {
        if (entry.check_address(addr, &offset))
            return entry.target_idx;
    }

    /* Did not find any slave !?!?  */
    throw std::runtime_error(fmt::format("Interconnect decode error: {}!", addr));
    return 0;
}

void iconnect::unmap_offset(
    unsigned int target_idx,
    sc_dt::uint64 offset,
    sc_dt::uint64& addr
) {
    if (target_idx >= initiator_sockets_.size())
        SC_REPORT_FATAL("TLM-2", "Invalid target_idx in iconnect\n");

    if (map_[target_idx].absolute) {
        addr = offset;
    } else {
        if (offset >= map_[target_idx].size) {
            printf("offset=%lx\n", (unsigned long)offset);
            SC_REPORT_FATAL("TLM-2", "Invalid range in iconnect\n");
        }

        addr = map_[target_idx].addr + offset;
    }
}

void iconnect::target_b_transport(int id, tlm::tlm_generic_payload& trans, sc_core::sc_time& delay) {
    if (id >= target_sockets_.size())
        SC_REPORT_FATAL("TLM-2", "Invalid socket tag in iconnect\n");

    sc_dt::uint64 addr;
    sc_dt::uint64 offset;
    unsigned int target_idx;

    addr = trans.get_address();
    addr += target_offsets_[id];
    target_idx = map_address(addr, offset);

    trans.set_address(offset);

    /* Forward the transaction.  */
    (*initiator_sockets_[target_idx])->b_transport(trans, delay);
    
    /* Restore the addresss.  */
    trans.set_address(addr);
}

bool iconnect::target_get_direct_mem_ptr(int id, tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data) {
    if (id >= target_sockets_.size())
        SC_REPORT_FATAL("TLM-2", "Invalid socket tag in iconnect\n");

    sc_dt::uint64 addr;
    sc_dt::uint64 offset;
    size_t target_idx;
    bool r;

    addr = trans.get_address();
    addr += target_offsets_[id];
    target_idx = map_address(addr, offset);

    trans.set_address(offset);
    /* Forward the transaction.  */
    r = (*initiator_sockets_[target_idx])->get_direct_mem_ptr(trans, dmi_data);

    unmap_offset(target_idx, dmi_data.get_start_address(), addr);
    dmi_data.set_start_address(addr);

    unmap_offset(target_idx, dmi_data.get_end_address(), addr);
    dmi_data.set_end_address(addr);

    return r;
}

unsigned int iconnect::target_transport_dbg(int id, tlm::tlm_generic_payload& trans) {
    if (id >= target_sockets_.size())
        SC_REPORT_FATAL("TLM-2", "Invalid socket tag in iconnect\n");

    sc_dt::uint64 addr;
    sc_dt::uint64 offset;
    unsigned int target_idx;

    addr = trans.get_address();
    addr += target_offsets_[id];
    target_idx = map_address(addr, offset);

    trans.set_address(offset);

    /* Forward the transaction.  */
    (*initiator_sockets_[target_idx])->transport_dbg(trans);
    /* Restore the addresss.  */

    trans.set_address(addr);
    return 0;
}

void iconnect::initiator_invalidate_direct_mem_ptr(int id, sc_dt::uint64 start_range, sc_dt::uint64 end_range) {
    if (id >= initiator_sockets_.size())
        SC_REPORT_FATAL("TLM-2", "Invalid socket tag in iconnect\n");

    sc_dt::uint64 start, end;
    unsigned int i;

    unmap_offset(id, start_range, start);
    unmap_offset(id, end_range, end);

    /* Reverse the offsetting.  */
    start -= target_offsets_[id];
    end -= target_offsets_[id];

    for (auto& target_socket : target_sockets_)
        (*target_socket)->invalidate_direct_mem_ptr(start, end);
}

} /* namespace sctlm::tlm_lib::modules */
