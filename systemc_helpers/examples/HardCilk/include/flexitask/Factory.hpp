#ifndef HARDCILK_FACTORY_HPP_INCLUDED
#define HARDCILK_FACTORY_HPP_INCLUDED

#include <sctlm/tlm_lib/tlm_module.hpp>
#include <util/factory.hpp>

#include <tuple>
#include <unordered_map>

#include <hardcilk/Context.hpp>
#include <hardcilk/Desc.hpp>

namespace hardcilk {

struct Top;

using tlm_module = sctlm::tlm_lib::tlm_module;

/**
 * @brief Factory allows generating modules on the fly.
 */
struct Factory : private ::util::factory<tlm_module> {
    using ptr = std::unique_ptr<tlm_module>;

    Factory();

    template<typename T>
    void registerProcessingElement(std::string const& typeName) {
        add<T(const char*, Context&)>(typeName);
    }

    auto instantiateProcessingElement(
        std::string const& typeName,
        std::string const& moduleName,
        Context& context
    ) const {
        return ptr { create(typeName, moduleName.c_str(), context) };
    }

    template<typename T>
    void registerProcessor() {
        add<T(const char*, Context&)>("@processor");
    }

    auto instantiateProcessor(
        std::string const& moduleName,
        Context& context
    ) const {
        return ptr { create("@processor", moduleName.c_str(), context) };
    }

    template<typename T>
    void registerSystem() {
        add<T(const char*)>("@system");
        hardwareDescription_ = &T::description;
    }

    auto instantiateSystem(std::string const& moduleName) const {
        return ptr { create("@system", moduleName.c_str()) };
    }

    auto instantiateTop(std::string const& moduleName, Context& context) const {
        return ptr { create("@top", moduleName.c_str(), context) };
    }

    desc::FlexiTaskSystem* hardwareDescription() const noexcept {
        return hardwareDescription_;
    }

private:
    desc::FlexiTaskSystem* hardwareDescription_ { nullptr };
};

} // namespace hardcilk

#endif /* HARDCILK_FACTORY_HPP_INCLUDED */
