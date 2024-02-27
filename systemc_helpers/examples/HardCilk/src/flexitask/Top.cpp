#include <hardcilk/Defs.hpp>
#include <hardcilk/Desc.hpp>
#include <hardcilk/Factory.hpp>
#include <hardcilk/MemParams.hpp>
#include <hardcilk/Processor.hpp>
#include <hardcilk/Top.hpp>

#include <tlm>

#include <unordered_map>

#include <sctlm/tlm_lib/modules/iconnect.hpp>
#include <sctlm/tlm_lib/modules/memory.hpp>

#include <cassert>
#include <cstddef>
#include <cstdint>

#include <fmt/format.h>

namespace hardcilk {

static bool isMemoryInterface(desc::Interface const& interface) {
    return interface.protocol == desc::InterfaceProtocol::Axi4 || interface.protocol == desc::InterfaceProtocol::Axi4lite;
}

Top::Top(sc_core::sc_module_name const& name, Context& context)
    : sc_core::sc_module { name }
    , context { context } {
    set("clock", clock);
    set("reset", reset);

    auto const& factory = *context.get<Factory*>("factory");
    auto const& desc = *context.get<desc::FlexiTaskSystem*>("description");

    /* interface path to socket object mapping, used for connections */
    std::unordered_map<std::string, tlm::tlm_target_socket<>*> targetSockets;
    std::unordered_map<std::string, tlm::tlm_initiator_socket<>*> initiatorSockets;

    /* for setting up the interconnect */
    size_type masterIdx = 0, slaveIdx = 0;

    system_ = factory.instantiateSystem("flexiTaskSystem");

    {
        auto& systemClock = system_->get<sc_core::sc_in<bool>>("clock");
        auto& systemReset = system_->get<sc_core::sc_in<bool>>("reset");

        systemClock(clock);
        systemReset(reset);
    }

    auto iconnect = std::make_unique<sctlm::tlm_lib::modules::iconnect>(
        "interconnect", desc.interconnectMasters, desc.interconnectSlaves
    );

    /* get system interfaces  */
    for (auto const& [_, descInterface] : desc.system.interfaces) {
        if (descInterface.isSlave) {
            auto& targetSocket = *system_->get_target_socket(descInterface.name);
            targetSockets[descInterface.path] = &targetSocket;

            if (isMemoryInterface(descInterface)) {
                auto const& addressSpace = descInterface.addressSpace;
                auto& interconnectInitatorSocket = *iconnect->memmap(addressSpace.base, addressSpace.size, slaveIdx++);
                interconnectInitatorSocket.bind(targetSocket);
            }
        } else {
            auto& initiatorSocket = *system_->get_initiator_socket(descInterface.name);
            initiatorSockets[descInterface.path] = &initiatorSocket;

            if (isMemoryInterface(descInterface)) {
                auto& interconnectTargetSocket = *iconnect->target_socket(masterIdx++);
                initiatorSocket.bind(interconnectTargetSocket);
            }
        }
    }

    /* create PEs */
    {
        for (auto const& [_, descTask] : desc.tasks) {
            for (auto const& [_, descPocessingElement] : descTask.processingElements) {
                auto processingElement = factory.instantiateProcessingElement(
                    fmt::format("{}_pe", descTask.name),
                    descPocessingElement.portName,
                    context
                );

                /* todo maybe find a better way to pass information later */
                processingElement->set_object("descFlexiTaskSystem", &desc);
                processingElement->set_object("descProcessingElement", &processingElement);

                {
                    auto& processingElementClock = processingElement->get<sc_core::sc_in<bool>>("clock");
                    processingElementClock(clock);

                    auto& processingElementReset = processingElement->get<sc_core::sc_in<bool>>("reset");
                    processingElementReset(reset);
                }

                for (auto const& [_, descInterface] : descPocessingElement.interfaces) {
                    if (descInterface.isSlave) {
                        assert(!isMemoryInterface(descInterface));

                        auto& targetSocket = *processingElement->get_target_socket(descInterface.name);
                        targetSockets[descInterface.path] = &targetSocket;
                    } else {
                        auto& initiatorSocket = *processingElement->get_initiator_socket(descInterface.name);
                        initiatorSockets[descInterface.path] = &initiatorSocket;

                        if (isMemoryInterface(descInterface)) {
                            auto& interconnectTargetSocket = *iconnect->target_socket(masterIdx++);
                            initiatorSocket.bind(interconnectTargetSocket);
                        }
                    }
                }

                tlm_modules_.emplace_back(std::move(processingElement));
            }
        }
    }

    /* the rest of the connections (Axis connections) */
    for (auto const& [pathInterface1, pathInterface2] : desc.connections) {
        // fmt::print("{} --> {}, ", pathInterface1, pathInterface2);
        auto& initiatorSocket = *initiatorSockets.at(pathInterface1);
        auto& targetSocket = *targetSockets.at(pathInterface2);
        // fmt::print("{} --> {}\n", initiatorSocket.name(), targetSocket.name());
        initiatorSocket.bind(targetSocket);
    }

    /* create processor */
    {
        auto processor = factory.instantiateProcessor("processor", context);

        auto& processorClock = processor->get<sc_core::sc_in<bool>>("clock");
        processorClock(clock);

        auto& processorReset = processor->get<sc_core::sc_in<bool>>("reset");
        processorReset(reset);

        auto& initiatorSocket = *(processor->get_initiator_socket("mem"));
        auto& interconnectTargetSocket = *iconnect->target_socket(masterIdx++);
        initiatorSocket.bind(interconnectTargetSocket);

        tlm_modules_.push_back(std::move(processor));
    }

    /* create memory */
    auto memParams = MemParams::fromContext("systemMemory", context);

    auto memory = std::make_unique<sctlm::tlm_lib::modules::memory>(
        "memory",
        sc_core::sc_time(memParams.delay_ns, sc_core::SC_NS /* verify */),
        desc.memory.size, /** @todo maybe, get this one from the context as well? */
        memParams.numParallelRequests
    );

    context.set<sctlm::tlm_lib::modules::memory*>("memory", memory.get());

    {
        auto& targetSocket = memory->socket;
        auto& interconnectInitiatorSocket = *iconnect->memmap(desc.memory.base, desc.memory.size, slaveIdx++);
        interconnectInitiatorSocket.bind(targetSocket);
    }

    assert(masterIdx == desc.interconnectMasters);
    assert(slaveIdx == desc.interconnectSlaves);

    modules_.emplace_back(std::move(iconnect));
    modules_.emplace_back(std::move(memory));
}

} /* namespace hardcilk */
