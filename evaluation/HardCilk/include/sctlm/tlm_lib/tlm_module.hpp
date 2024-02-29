#ifndef SCTLM_TLM_LIB_TLM_MODULE_HPP_INCLUDED
#define SCTLM_TLM_LIB_TLM_MODULE_HPP_INCLUDED

#include <any>
#include <stdexcept>
#include <string>
#include <type_traits>
#include <typeindex>
#include <unordered_map>
#include <verilated_vcd_sc.h>

#include <cassert>

#include <systemc>
#include <tlm>

namespace sctlm::tlm_lib {

struct tlm_module {
    /**
     * Returns a TLM socket interface from the given name.
     */
    virtual tlm::tlm_base_socket_if* get_socket(const std::string& name = "") = 0;

    /**
     * Returns a TLM target socket from the given name.
     * A target socket corresponds to an AXI slave interface.
     */
    tlm::tlm_target_socket<>* get_target_socket(const std::string& name = "") {
        return dynamic_cast<tlm::tlm_target_socket<>*>(get_socket(name));
    }

    /**
     * Returns a TLM initiator socket from the given name.
     * A target socket corresponds to an AXI master interface.
     */
    tlm::tlm_initiator_socket<>* get_initiator_socket(const std::string& name = "") {
        return dynamic_cast<tlm::tlm_initiator_socket<>*>(get_socket(name));
    }

    virtual void verilated_trace(VerilatedVcdC* tfp, int levels, int options = 0) {
        throw std::runtime_error("not implemented");
    }

    virtual void systemc_trace(sc_core::sc_trace_file* tfp) const {
        systemc_module()->trace(tfp);
    }

    template<typename T>
    T& get(const std::string& name) {
        auto const& x = nonowned_objects_.at(name);

        if (typeid(T) != x.type_index)
            throw std::runtime_error("not the expected type");

        return *((T*)x.ptr);
    }

    template<typename T>
    T const& get(const std::string& name) const {
        auto const& x = nonowned_objects_.at(name);

        if (typeid(T) != x.type_index)
            throw std::runtime_error("not the expected type");

        return *((T const*)x.ptr);
    }

    template<typename T>
    T& get_object(const std::string& name) {
        return *std::any_cast<T>(&owned_objects_.at(name));
    }

    template<typename T>
    T const& get_object(const std::string& name) const {
        return *std::any_cast<T>(&owned_objects_.at(name));
    }

    template<typename T>
    void set_object(const std::string& name, T&& t) {
        owned_objects_[name] = std::make_any<std::remove_cvref_t<T>>(std::forward<T>(t));
    }

    virtual sc_core::sc_module* systemc_module() noexcept = 0;
    virtual sc_core::sc_module const* systemc_module() const noexcept = 0;

    virtual ~tlm_module() = default;

protected:

    /** @note Non-owning. */
    template<typename T>
    void set(const std::string& name, T &t) {
        if (nonowned_objects_.count(name) != 0)
            throw std::runtime_error("an object with the given name already registered!");

        nonowned_objects_[name] = { (void*) &t, typeid(T) };
    }

private:
    std::unordered_map<std::string, std::any> owned_objects_;

    struct PointerTypeId {
        void* ptr;
        std::type_index type_index{typeid(void)};
    };

    std::unordered_map<std::string, PointerTypeId> nonowned_objects_;
};

/* clang-format off */

#define SCTLM_TLM_MODULE() \
    sc_core::sc_module* systemc_module() noexcept override { \
        return this; \
    } \
    \
    sc_core::sc_module const* systemc_module() const noexcept override { \
        return this; \
    }

#define SCTLM_TLM_BEGIN_PORTS() \
private: \
    std::unordered_map<std::string, tlm::tlm_base_socket_if*> socket_map_; \
\
public: \
    tlm::tlm_base_socket_if* get_socket(const std::string& name = "") override { \
        if (socket_map_.empty()) {

#define SCTLM_TLM_REGISTER_PORT(socket_ptr, socket_name) \
            socket_map_[socket_name] = socket_ptr;

#define SCTLM_TLM_MODULE_PORT(member) SCTLM_TLM_REGISTER_PORT(&(member), #member)
#define SCTLM_TLM_DRIVER_PORT(child) SCTLM_TLM_REGISTER_PORT(&(child).socket, #child)

#define SCTLM_TLM_END_PORTS() \
        } \
        \
        return socket_map_.at(name); \
    }

/* clang-format on */

} /* namespace sctlm::tlm_lib */

#endif /* SCTLM_TLM_LIB_TLM_MODULE_HPP_INCLUDED */
