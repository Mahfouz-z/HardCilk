#ifndef PROCESSOR_HPP_INCLUDED
#define PROCESSOR_HPP_INCLUDED

#include <unordered_map>

#include <systemc>
#include <tlm>

#include <sctlm/tlm_lib/drivers/memory.hpp>
#include <sctlm/tlm_lib/tlm_module.hpp>

#include <hardcilk/Allocator.hpp>
#include <hardcilk/Desc.hpp>
#include <hardcilk/Context.hpp>
#include <hardcilk/hal/VirtualContinuationAddressServer.hpp>
#include <hardcilk/hal/VirtualStealServer.hpp>

namespace hardcilk {

namespace drivers = sctlm::tlm_lib::drivers;

struct Processor : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(Processor);

    using VirtualStealServerDriver = hal::VirtualStealServer<
        polymorphic::PolymorphicAllocatorRef,
        SystemcMemoryInterface>;

    using VirtualContinuationAddressServerDriver = hal::VirtualContinuationAddressServer<
        polymorphic::PolymorphicAllocatorRef,
        SystemcMemoryInterface>;

    sc_core::sc_in<bool> clock;
    sc_core::sc_in<bool> reset;

    drivers::memory_interface mem;

    Context &context;

    Processor(sc_core::sc_module_name const& module_name, Context &context)
        : sc_core::sc_module(module_name)
        , context { context } {
        set("clock", clock);
        set("reset", reset);

        SC_THREAD(thread);
    }

    /* clang-format off */
    SCTLM_TLM_MODULE()

    SCTLM_TLM_BEGIN_PORTS()
        SCTLM_TLM_DRIVER_PORT(mem)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */
private:
    void thread();

protected:
    /** @brief Allocator object. */
    std::unique_ptr<polymorphic::PolymorphicAllocator> allocator;

    /** @brief Drivers to manage Virtual Steal Servers. */
    std::vector<VirtualStealServerDriver> virtualStealServerDrivers;

    /** @brief Drivers to manage Virtual Continuation Address Server. */
    std::vector<VirtualContinuationAddressServerDriver> virtualContinuationAddressServerDrivers;

    /** @brief Override this function to set up the VSS and VCAS differently. */
    virtual void setup();
};

} /* namespace hardcilk */

#endif /* PROCESSOR_HPP_INCLUDED */
