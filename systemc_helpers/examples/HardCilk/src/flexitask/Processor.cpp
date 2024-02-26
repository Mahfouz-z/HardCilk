#include <flexitask/Allocator.hpp>
#include <flexitask/Defs.hpp>
#include <flexitask/MemoryInterface.hpp>
#include <flexitask/Processor.hpp>

#include <sctlm/tlm_lib/modules/memory.hpp>

#include <fmt/core.h>

namespace flexitask {

void Processor::thread() {
    auto const& desc = *context.get<desc::FlexiTaskSystem*>("description");

    wait(reset.negedge_event());

    allocator.reset(new polymorphic::LinearAllocator { desc.memory.base, desc.memory.size });
    SystemcMemoryInterface memoryInterface { mem };

    for (auto& [_, descTask] : desc.tasks) {
        for (auto& [_, descVirtualStealServer] : descTask.virtualStealServers)
            virtualStealServerDrivers.emplace_back(descVirtualStealServer, *allocator, memoryInterface);

        for (auto& [_, descVirtualContinuationAddressServer] : descTask.virtualContinuationAddressServers)
            virtualContinuationAddressServerDrivers.emplace_back(descVirtualContinuationAddressServer, *allocator, memoryInterface);
    }

    auto &memory = *context.get<sctlm::tlm_lib::modules::memory*>("memory");
    
    memory.dmiEnable();
    mem.local_time();
    
    setup();
    
    memory.dmiDefault();
    mem.global_time();

    constexpr size_type timeout = 1024; // cycles

    /* check and fail if paused */
    while (1) {
        for (size_type i = 0; i < timeout; ++i)
            wait(clock.posedge_event());

        for (auto& virtualStealServerDriver : virtualStealServerDrivers)
            if (virtualStealServerDriver.paused())
                throw std::runtime_error(fmt::format("Processor: vssDriver->paused() for '{}'", virtualStealServerDriver.desc.path));

        for (auto& virtualStealServerDriver : virtualStealServerDrivers)
            if (virtualStealServerDriver.paused())
                throw std::runtime_error(fmt::format("Processor: vssDriver->paused() for '{}'", virtualStealServerDriver.desc.path));
    }
}

void Processor::setup() {
    for (auto& driver : virtualStealServerDrivers) {
        driver.initialize(0);
        driver.resume();
    }

    for (auto& driver : virtualContinuationAddressServerDrivers) {
        driver.initialize();
        driver.resume();
    }
}

} /* namespace flexitask */
