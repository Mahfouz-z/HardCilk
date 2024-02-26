#include <fmt/core.h>
#include <task2_exp3_pe.hpp>

#define LOG(format, ...) \
    fmt::print("[{:>12}] [{}] [{}] " format "\n", sc_core::sc_time_stamp().to_string(), name(), __PRETTY_FUNCTION__ __VA_OPT__(, ) __VA_ARGS__)

namespace paper_exp3 {

void task2Exp3_pe::thread() {
    auto& clockPeriod_ns = context.get<unsigned int>("clockPeriod_ns");

    auto& T1 = context.get<double>("T1");
    auto& remainingTasks = context.get<int>("remainingTasks");

    auto& logCounterPeriod = context.get<unsigned int>("logCounterPeriod");

    while (true) {
        auto task = taskIn.read<task_task2Exp3>();

        logCounter_ = (logCounter_ + 1) % logCounterPeriod;
        if (logCounter_ == 0)
            LOG("received task: delay = {}", task.delay);

        wait(sc_core::sc_time(clockPeriod_ns * task.delay / 2, sc_core::SC_NS));
        T1 += sc_core::sc_time(clockPeriod_ns * task.delay / 2, sc_core::SC_NS).to_seconds();

        --remainingTasks;
        if (remainingTasks == 0) {
            auto& T_end = context.get<double>("T_end");
            T_end = sc_core::sc_time_stamp().to_seconds();
        }
    }
}

} /* namespace paper_exp3 */
