#ifndef SCTLM_TLM_LIB_DRIVERS_STREAM_HPP_INCLUDED
#define SCTLM_TLM_LIB_DRIVERS_STREAM_HPP_INCLUDED

#include "defs.hpp"

#include <systemc>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

namespace sctlm::tlm_lib::drivers {

struct stream_source final : sc_core::sc_module {
    tlm_utils::simple_initiator_socket<stream_source> socket;

    stream_source(sc_core::sc_module_name const& name = "stream_source")
        : sc_core::sc_module { name } {
    }

    ~stream_source() = default;

    void write(size_type size, data_type const* data) {
        tlm::tlm_generic_payload trans;
        trans.set_address(0);
        trans.set_command(tlm::tlm_command::TLM_WRITE_COMMAND);
        trans.set_data_ptr(const_cast<data_type*>(data));
        trans.set_data_length(size);

        // streaming width does not matter much for AXI4-Lite either.
        trans.set_streaming_width(size);

        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::tlm_response_status::TLM_INCOMPLETE_RESPONSE);

        sc_core::sc_time t(sc_core::SC_ZERO_TIME);

        socket->b_transport(trans, t);

        if (trans.is_response_error()) {
            throw std::runtime_error("trans.is_response_error()");
        }
    }

    template<typename T>
    void write(T const& t) {
        write(sizeof(T), (data_type const*)&t);
    }
};

struct stream_sink final : sc_core::sc_module {
    tlm_utils::simple_target_socket<stream_sink> socket;

    stream_sink(
        sc_core::sc_module_name const& name = "stream_sink",
        std::int64_t buffer_sz = -1 /* unlimited */
    )
        : sc_core::sc_module { name }
        , buffer_sz_ { buffer_sz } {
        socket.register_b_transport(this, &stream_sink::b_transport);
    }

    ~stream_sink() = default;

    void read(size_type size, data_type* data) {
        while (dequeue_.size() < size)
            sc_core::wait(evt_data_available_);

        for (size_t i = 0; i < size; ++i) {
            data[i] = dequeue_.front();
            dequeue_.pop_front();
        }

        if (buffer_sz_ >= 0) {
            buffer_sz_++;
            evt_buffer_available_.notify();
        }
    }

    template<typename T>
    T read() {
        T t;
        read(sizeof(T), (data_type*)&t);
        return t;
    }

protected:
    /// @brief Storage for generated data.
    std::deque<uint8_t> dequeue_;

    /// @brief For waiting in case the queue storage is empty.
    sc_core::sc_event evt_data_available_;

    /// @brief For waiting in case no buffer space is available.
    sc_core::sc_event evt_buffer_available_;

    /// @brief Buffer size available right now.
    std::int64_t buffer_sz_ { -1 };

    void b_transport(tlm::tlm_generic_payload& payload, sc_core::sc_time& time) {
        std::uint8_t* data = payload.get_data_ptr();

        for (size_t i = 0; i < payload.get_data_length(); ++i)
            dequeue_.push_back(data[i]);

        while (buffer_sz_ == 0)
            wait(evt_buffer_available_);
        
        if (buffer_sz_ > 0)
            buffer_sz_--;

        evt_data_available_.notify();
    }
};

} /* namespace sctlm::tlm_lib::drivers */

#endif /* SCTLM_TLM_LIB_DRIVERS_STREAM_HPP_INCLUDED */
