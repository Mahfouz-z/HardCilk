#ifndef TLM_ENABLED_H_INCLUDED
#define TLM_ENABLED_H_INCLUDED

#include <tlm>

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
    template <unsigned BUSWIDTH = 32>
    tlm::tlm_target_socket<BUSWIDTH> *getTargetSocket(const std::string &name = "")
    {
        return dynamic_cast<tlm::tlm_target_socket<BUSWIDTH> *>(getSocket(name));
    }

    /**
     * Returns a TLM initiator socket from the given name.
     * A target socket corresponds to an AXI master interface.
     */
    template <unsigned BUSWIDTH = 32>
    tlm::tlm_initiator_socket<BUSWIDTH> *getInitiatorSocket(const std::string &name = "")
    {
        return dynamic_cast<tlm::tlm_target_socket<BUSWIDTH> *>(getSocket(name));
    }

    virtual ~TlmEnabled() = default;
};

template <unsigned BUSWIDTH = 32>
struct InterfaceTesterBase
{
    InterfaceTesterBase(tlm::tlm_target_socket<BUSWIDTH> *tgt_socket)
    {
        socket_(*tgt_socket);
    }

    /** @note no runtime polymorphism for this class */
    ~InterfaceTesterBase() = default;

protected:
    tlm_utils::simple_initiator_socket<InterfaceTesterBase, BUSWIDTH> socket_;

    /** @todo also create a timeout parameter */
    ;

    void read_(addr_type addr, size_type size, data_type *data)
    {
        tlm::tlm_generic_payload trans;
        trans.set_address(addr);
        trans.set_command(tlm::tlm_command::TLM_READ_COMMAND);
        trans.set_data_ptr(data);
        trans.set_data_length(size);
        trans.set_streaming_width(BUSWIDTH / 8);
        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::tlm_response_status::TLM_INCOMPLETE_RESPONSE);

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
        tlm::tlm_generic_payload trans;
        trans.set_address(addr);
        trans.set_command(tlm::tlm_command::TLM_WRITE_COMMAND);
        trans.set_data_ptr(const_cast<data_type *>(data));
        trans.set_data_length(size);
        trans.set_streaming_width(BUSWIDTH / 8);
        trans.set_byte_enable_ptr(nullptr);
        trans.set_dmi_allowed(false);
        trans.set_response_status(tlm::tlm_response_status::TLM_INCOMPLETE_RESPONSE);

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

template <unsigned BUSWIDTH = 32>
struct StreamInterfaceTester final : InterfaceTesterBase<BUSWIDTH>
{
    using base_type = InterfaceTesterBase<BUSWIDTH>;
    using base_type::base_type;

    /** @note Support for outputting serialized objects as well. */

    void read(size_type size, data_type *data)
    {
        base_type::read_(0, size, data);
    }

    void write(size_type size, data_type const *data)
    {
        base_type::write_(0, size, data);
    }
};

template <unsigned BUSWIDTH = 32>
struct MemoryInterfaceTester final : InterfaceTesterBase<BUSWIDTH>
{
    using base_type = InterfaceTesterBase<BUSWIDTH>;
    using base_type::base_type;

    void read(addr_type addr, size_type size, data_type *data)
    {
        base_type::read_(addr, size, data);
    }

    void write(addr_type addr, size_type size, data_type const *data)
    {
        base_type::write_(addr, size, data);
    }

    /** @note Support for outputting serialized objects as well. */

    uint32_t read32(addr_type addr)
    {
        return base_type::template read_<uint32_t>(addr);
    }

    void write32(addr_type addr, uint32_t data)
    {
        base_type::write_(addr, data);
    }

    uint64_t read64(addr_type addr)
    {
        return base_type::template read_<uint64_t>(addr);
    }

    void write64(addr_type addr, uint64_t data)
    {
        base_type::write_(addr, data);
    }
};

struct InterfaceTester
{
    template <unsigned BUSWIDTH>
    static auto stream(tlm::tlm_target_socket<BUSWIDTH> &socket)
    {
        return StreamInterfaceTester<BUSWIDTH>(&socket);
    }

    template <unsigned BUSWIDTH>
    static auto memory(tlm::tlm_target_socket<BUSWIDTH> &socket)
    {
        return MemoryInterfaceTester<BUSWIDTH>(&socket);
    }
};

#endif /* TLM_ENABLED_H_INCLUDED */
