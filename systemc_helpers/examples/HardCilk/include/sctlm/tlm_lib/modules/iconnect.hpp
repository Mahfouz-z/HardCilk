#ifndef SCTLM_TLM_ICONNECT_HPP_INCLUDED
#define SCTLM_TLM_ICONNECT_HPP_INCLUDED

#include <cstdint>
#include <memory>
#include <vector>

#include <systemc>
#include <tlm>

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

namespace sctlm::tlm_lib::modules {

class iconnect
    : public sc_core::sc_module {
private:
    using addr_type = std::uint64_t;
    using size_type = std::uint64_t;

    struct address_space {
        addr_type addr = 0;
        size_type size = 0;

        template<typename T>
        bool check_address(T x) {
            return (x >= addr) && (x < (addr + size));
        }
    };

    struct memmap_entry : address_space {
        std::size_t target_idx = 0;

        /// @brief `true` if the address mode is absolute, relative otherwise.
        bool absolute = false;

        template<typename T>
        bool check_address(T x, std::type_identity_t<T>* offset = nullptr) {
            if (address_space::check_address(x)) {
                if (offset) {
                    if (absolute)
                        *offset = x;
                    else
                        *offset = x - addr;
                }
                return true;
            }

            return false;
        }
    };

public:
    SC_HAS_PROCESS(iconnect);

    iconnect(sc_core::sc_module_name name, std::size_t num_initiators, std::size_t num_targets);

    void target_offset(std::size_t idx, addr_type offset) {
        target_offsets_.at(idx) = offset;
    }

    addr_type target_offset(std::size_t idx) {
        return target_offsets_.at(idx);
    }

    tlm::tlm_initiator_socket<>* memmap(addr_type addr, size_type size, std::size_t idx, bool absolute = false) {
        map_.emplace_back(memmap_entry { address_space { addr, size }, idx, absolute });
        return initiator_sockets_.at(idx).get();
    }

    tlm::tlm_target_socket<>* target_socket(std::size_t idx) {
        return target_sockets_.at(idx).get();
    }

    tlm::tlm_initiator_socket<>* initiator_socket(std::size_t idx) {
        return initiator_sockets_.at(idx).get();
    }

private:
    using target_socket_t = tlm_utils::simple_target_socket_tagged<iconnect>;
    using initiator_socket_t = tlm_utils::simple_initiator_socket_tagged<iconnect>;

    std::vector<std::unique_ptr<target_socket_t>> target_sockets_;
    std::vector<std::unique_ptr<initiator_socket_t>> initiator_sockets_;
    std::vector<memmap_entry> map_;
    std::vector<addr_type> target_offsets_;

    /* target socket interface */
    void target_b_transport(int id, tlm::tlm_generic_payload& trans, sc_core::sc_time& delay);
    bool target_get_direct_mem_ptr(int id, tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data);
    unsigned int target_transport_dbg(int id, tlm::tlm_generic_payload& trans);

    /* initiator socket interface */
    void initiator_invalidate_direct_mem_ptr(int id, sc_dt::uint64 start_range, sc_dt::uint64 end_range);

    unsigned int map_address(sc_dt::uint64 addr, sc_dt::uint64& offset);
    void unmap_offset(unsigned int target_idx, sc_dt::uint64 offset, sc_dt::uint64& addr);
};

} /* namespace sctlm::tlm_lib::modules */

#endif /* SCTLM_TLM_ICONNECT_HPP_INCLUDED */
