#include <fmt/core.h>
#include <task_pe.hpp>

#define LOG(format, ...) \
    fmt::print("[{:>12}] [{}] [{}] " format "\n", sc_core::sc_time_stamp().to_string(), name(), __PRETTY_FUNCTION__ __VA_OPT__(, ) __VA_ARGS__)

namespace paper_exp1 {

void task_pe::thread0() {
    /* auto & is important, otherwise you decrement a copy of the variable! */
    auto& clockPeriod_ns = context.get<unsigned int>("clockPeriod_ns");

    auto& branchFactor = context.get<unsigned int>("branchFactor");

    auto& T1 = context.get<double>("T1");
    auto& delayCycles = context.get<unsigned int>("delayCycles");
    auto& remainingTasks = context.get<int>("remainingTasks");

    auto& logCounterPeriod = context.get<unsigned int>("logCounterPeriod");
    auto& nodesProcessed = context.get<unsigned int>("nodesProcessed");

    while (true) {
        auto task = taskIn.read<task_task>();

        logCounter_ = (logCounter_ + 1) % logCounterPeriod;
        nodesProcessed++;

        if (logCounter_ == 0)
            LOG("received task: depth = {}, delay = {}, nodes processed = {}", task.depth, delayCycles, nodesProcessed);

        if (task.depth != 0) {
            for (std::uint32_t i = 0; i < branchFactor; ++i) {
                wait(sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS));
            }

            for (std::uint32_t i = 0; i < branchFactor; ++i) {
                T1 += sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS).to_seconds();
                ++remainingTasks;

                auto new_task = task_task { task.depth - 1 };
                fifo_.write(new_task);
            }
        } else {
            wait(sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS));

            T1 += sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS).to_seconds();
        }

        --remainingTasks;
        if (remainingTasks == 0) {
            auto& T_end = context.get<double>("T_end");
            T_end = sc_core::sc_time_stamp().to_seconds();
        }
    }
}

void task_pe::thread1() {
    while (true) {
        taskOut.write(fifo_.read());
    }
}

} /* namespace paper_exp1 */
