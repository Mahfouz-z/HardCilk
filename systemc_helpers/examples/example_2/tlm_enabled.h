#ifndef TLM_ENABLED_H_INCLUDED
#define TLM_ENABLED_H_INCLUDED

#include <deque>
#include <tlm>
#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

using namespace tlm;

using addr_type = std::uint64_t;
using size_type = std::uint64_t;
using data_type = unsigned char;
using std::uint32_t;
using std::uint64_t;

struct TlmEnabled
{
    /**
     * Returns a TLM socket interface from the given name.
     */
    virtual tlm_base_socket_if *getSocket(const std::string &name = "") = 0;

    /**
     * Returns a TLM target socket from the given name.
     * A target socket corresponds to an AXI slave interface.
     */
    tlm_target_socket<> *getTargetSocket(const std::string &name = "")
    {
        return dynamic_cast<tlm_target_socket<> *>(getSocket(name));
    }

    /**
     * Returns a TLM initiator socket from the given name.
     * A target socket corresponds to an AXI master interface.
     */
    tlm_initiator_socket<> *getInitiatorSocket(const std::string &name = "")
    {
        return dynamic_cast<tlm_initiator_socket<> *>(getSocket(name));
    }

    virtual ~TlmEnabled() = default;
};

struct MemoryInterfaceDriver final
{
    MemoryInterfaceDriver(tlm_target_socket<> *tgt_socket)
    {
        socket_(*tgt_socket);
    }

    ~MemoryInterfaceDriver() = default;

    void read(addr_type addr, size_type size, data_type *data)
    {
        read_(addr, size, data);
    }

    void write(addr_type addr, size_type size, data_type const *data)
    {
        write_(addr, size, data);
    }

    /** @note Support for outputting serialized objects as well. */

    uint32_t read32(addr_type addr)
    {
        return read_<uint32_t>(addr);
    }

    void write32(addr_type addr, uint32_t data)
    {
        write_(addr, data);
    }

    uint64_t read64(addr_type addr)
    {
        return read_<uint64_t>(addr);
    }

    void write64(addr_type addr, uint64_t data)
    {
        write_(addr, data);
    }

protected:
    tlm_utils::simple_initiator_socket<MemoryInterfaceDriver> socket_;

    /** @todo also create a timeout parameter */
    ;

    void read_(addr_type addr, size_type size, data_type *data)
    {
        tlm_generic_payload trans;
        trans.set_address(addr);
        trans.set_command(tlm_command::TLM_READ_COMMAND);
        trans.set_data_ptr(data);
        trans.set_data_length(size);

        // the bridge module will handle the timing correctly
        // choosing streaming_width == size makes sure that
        // INCR burst type will be generated.
        trans.set_streaming_width(size);

        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm_response_status::TLM_INCOMPLETE_RESPONSE);

        sc_time t(10, SC_US); // TODO choose a better inifinity

        socket_->b_transport(trans, t);

        if (trans.is_response_error())
        {
            throw std::runtime_error("trans.is_response_error()");
        }
    }

    template <typename T>
    T read_(addr_type addr)
    {
        T result;
        read_(addr, sizeof(T), (data_type *)&result);
        return result;
    }

    void write_(addr_type addr, size_type size, data_type const *data)
    {
        tlm_generic_payload trans;
        trans.set_address(addr);
        trans.set_command(tlm_command::TLM_WRITE_COMMAND);
        trans.set_data_ptr(const_cast<data_type *>(data));
        trans.set_data_length(size);
        
        // Read the explanation above.
        trans.set_streaming_width(size);
        
        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm_response_status::TLM_INCOMPLETE_RESPONSE);

        sc_time t(10, SC_US); // TODO choose a better inifinity

        socket_->b_transport(trans, t);

        if (trans.is_response_error())
        {
            throw std::runtime_error("trans.is_response_error()");
        }
    }

    template <typename T>
    void write_(addr_type addr, T const &t)
    {
        write_(addr, sizeof(T), (data_type const *)&t);
    }
};

struct StreamInterfaceSource final
{
    StreamInterfaceSource(tlm_target_socket<> *tgt_socket)
    {
        socket_(*tgt_socket);
    }

    ~StreamInterfaceSource() = default;

    void write(size_type size, data_type const *data)
    {
        tlm_generic_payload trans;
        trans.set_address(0);
        trans.set_command(tlm_command::TLM_WRITE_COMMAND);
        trans.set_data_ptr(const_cast<data_type *>(data));
        trans.set_data_length(size);

        // streaming width does not matter much for AXI4-Lite either.
        trans.set_streaming_width(size);

        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm_response_status::TLM_INCOMPLETE_RESPONSE);

        sc_time t(10, SC_US); // TODO choose a better inifinity

        socket_->b_transport(trans, t);

        if (trans.is_response_error())
        {
            throw std::runtime_error("trans.is_response_error()");
        }
    }

protected:
    tlm_utils::simple_initiator_socket<StreamInterfaceSource> socket_;

    /** @todo also create a timeout parameter */
    ;
};

struct StreamInterfaceSink final
{
    StreamInterfaceSink(tlm_initiator_socket<> *tgt_socket)
    {
        socket_(*tgt_socket);
        socket_.register_b_transport(this, &StreamInterfaceSink::b_transport);
    }

    ~StreamInterfaceSink() = default;

    void read(size_type size, data_type *data)
    {
        while (dequeue_.size() < size)
            sc_core::wait(evt_);

        for (size_t i = 0; i < size; ++i)
        {
            data[i] = dequeue_.front();
            dequeue_.pop_front();
        }
    }

protected:
    tlm_utils::simple_target_socket<StreamInterfaceSink> socket_;

    /// @brief Storage for generated data.
    std::deque<uint8_t> dequeue_;

    /// @brief For waiting in case the queue storage is empty.
    sc_core::sc_event evt_;

    void b_transport(tlm_generic_payload &payload, sc_core::sc_time &time)
    {
        std::uint8_t *data = payload.get_data_ptr();

        for (size_t i = 0; i < payload.get_data_length(); ++i)
            dequeue_.push_back(data[i]);

        evt_.notify();
    }
};

#endif /* TLM_ENABLED_H_INCLUDED */
