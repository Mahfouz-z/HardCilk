#ifndef SCTLM_TLM_LIB_DRIVERS_MEMORY_HPP_INCLUDED
#define SCTLM_TLM_LIB_DRIVERS_MEMORY_HPP_INCLUDED

#include "defs.hpp"

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>

namespace sctlm::tlm_lib::drivers {

struct memory_interface final : sc_core::sc_module {
    tlm_utils::simple_initiator_socket<memory_interface> socket;

    memory_interface(sc_core::sc_module_name const& name = "memory_interface")
        : sc_core::sc_module { name } {
    }

    ~memory_interface() = default;

    /** @brief Use the local time for memory transactions. */
    void local_time() {
        local_time_ = true;
    }

    /** @brief Use the simulation time for memory transactions. */
    void global_time() {
        if (t_ > sc_core::SC_ZERO_TIME) {
            // TODO figure out if the condition is necessary or not
            wait(t_);
            t_ = sc_core::SC_ZERO_TIME;
        }

        local_time_ = false;
    }

    void read(addr_type addr, size_type size, data_type* data) {
        read_(addr, size, data);
    }

    void write(addr_type addr, size_type size, data_type const* data) {
        write_(addr, size, data);
    }

    template<typename T>
    T read(addr_type addr) {
        T t;
        read(addr, sizeof(T), (data_type*)&t);
        return t;
    }

    template<typename T>
    void write(addr_type addr, T const& t) {
        write(addr, sizeof(T), (data_type const*)&t);
    }

    /** @note Support for outputting serialized objects as well. */

    uint32_t read32(addr_type addr) {
        return read_<uint32_t>(addr);
    }

    void write32(addr_type addr, uint32_t data) {
        write_(addr, data);
    }

    uint64_t read64(addr_type addr) {
        return read_<uint64_t>(addr);
    }

    void write64(addr_type addr, uint64_t data) {
        write_(addr, data);
    }

protected:
    bool local_time_ { false };
    sc_core::sc_time t_ { sc_core::SC_ZERO_TIME };

    /** @todo also create a timeout parameter */
    ;

    void read_(addr_type addr, size_type size, data_type* data) {
        tlm::tlm_generic_payload trans;
        trans.set_address(addr);
        trans.set_command(tlm::tlm_command::TLM_READ_COMMAND);
        trans.set_data_ptr(data);
        trans.set_data_length(size);

        // the bridge module will handle the timing correctly
        // choosing streaming_width == size makes sure that
        // INCR burst type will be generated.
        trans.set_streaming_width(size);

        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::tlm_response_status::TLM_INCOMPLETE_RESPONSE);

        sc_core::sc_time t(sc_core::SC_ZERO_TIME);

        socket->b_transport(trans, t);

        if (trans.is_response_error())
            throw std::runtime_error("trans.is_response_error()");

        if (!local_time_)
            wait(t);
        else
            t_ += t;
    }

    template<typename T>
    T read_(addr_type addr) {
        T result;
        read_(addr, sizeof(T), (data_type*)&result);
        return result;
    }

    void write_(addr_type addr, size_type size, data_type const* data) {
        tlm::tlm_generic_payload trans;
        trans.set_address(addr);
        trans.set_command(tlm::tlm_command::TLM_WRITE_COMMAND);
        trans.set_data_ptr(const_cast<data_type*>(data));
        trans.set_data_length(size);

        // Read the explanation above.
        trans.set_streaming_width(size);

        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::tlm_response_status::TLM_INCOMPLETE_RESPONSE);

        sc_core::sc_time t(sc_core::SC_ZERO_TIME);

        socket->b_transport(trans, t);

        if (trans.is_response_error())
            throw std::runtime_error("trans.is_response_error()");

        if (!local_time_)
            wait(t);
        else
            t_ += t;
    }

    template<typename T>
    void write_(addr_type addr, T const& t) {
        write_(addr, sizeof(T), (data_type const*)&t);
    }
};

} /* namespace sctlm::tlm_lib::drivers */

#endif /* SCTLM_TLM_LIB_DRIVERS_MEMORY_HPP_INCLUDED */
