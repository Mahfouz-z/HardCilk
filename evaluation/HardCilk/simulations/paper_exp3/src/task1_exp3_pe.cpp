#include <fmt/core.h>
#include <task1_exp3_pe.hpp>

#define LOG(format, ...) \
    fmt::print("[{:>12}] [{}] [{}] " format "\n", sc_core::sc_time_stamp().to_string(), name(), __PRETTY_FUNCTION__ __VA_OPT__(, ) __VA_ARGS__)

namespace paper_exp3 {

void task1Exp3_pe::thread0() {
    auto& clockPeriod_ns = context.get<unsigned int>("clockPeriod_ns");

    auto& branchFactor = context.get<unsigned int>("branchFactor");

    auto& T1 = context.get<double>("T1");
    auto& delayCycles = context.get<unsigned int>("delayCycles");
    auto& remainingTasks = context.get<int>("remainingTasks");
    auto& nodesProcessed = context.get<unsigned int>("nodesProcessed");

    while (true) {
        auto task = taskIn.read<task_task1Exp3>();

        nodesProcessed++;
        logCounter_ += 1;
        if (logCounter_ % 10000 == 0)
            LOG("received task: depth = {}, delay of both tasks = {}, nodes processed = {}", task.depth, delayCycles, nodesProcessed);

        if (task.depth != 0) {
            for (std::uint32_t i = 0; i < branchFactor; ++i) {

                wait(sc_core::sc_time(clockPeriod_ns * delayCycles / 2, sc_core::SC_NS));

                T1 += sc_core::sc_time(clockPeriod_ns * delayCycles / 2, sc_core::SC_NS).to_seconds();
                remainingTasks += 2;

                auto new_task1Exp3 = task_task1Exp3 { task.depth - 1 };
                auto new_task2Exp3 = task_task2Exp3 { delayCycles };

                fifo_0_to_2.write(new_task2Exp3);
                fifo_0_to_1.write(new_task1Exp3);
            }
        } else {
            wait(sc_core::sc_time(clockPeriod_ns * delayCycles / 2, sc_core::SC_NS));

            T1 += sc_core::sc_time(clockPeriod_ns * delayCycles / 2, sc_core::SC_NS).to_seconds();
        }

        --remainingTasks;
        if (remainingTasks == 0) {
            auto& T_end = context.get<double>("T_end");
            T_end = sc_core::sc_time_stamp().to_seconds();
        }
    }
}

void task1Exp3_pe::thread1() {
    while (true) {
        taskOut.write(fifo_0_to_1.read());
    }
}

void task1Exp3_pe::thread2() {
    while (true) {
        taskOut_task2Exp3.write(fifo_0_to_2.read());
    }
}

} /* namespace paper_exp3 */
