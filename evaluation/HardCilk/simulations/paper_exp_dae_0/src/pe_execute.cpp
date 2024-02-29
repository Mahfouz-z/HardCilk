#include <fmt/core.h>
#include <pe_execute.hpp>

#define LOG(format, ...)                                                                                                                             \
    if (logEnabled)                                                                                                                                  \
        fmt::print("[{:>12}] [{}] [{}] " format "\n", sc_core::sc_time_stamp().to_string(), name(), __PRETTY_FUNCTION__ __VA_OPT__(, ) __VA_ARGS__); \
    else                                                                                                                                             \
        ;

namespace paper_exp_dae_0 {

void pe_execute::thread() {
    bool logEnabled = context.get<bool>("logEnabled");

    auto& clockPeriod_ns = context.get<unsigned int>("clockPeriod_ns");
    auto& remainingTasks = context.get<int>("remainingTasks");
    auto memoryDelay_ns = sc_core::sc_time(context.get<unsigned int>("pe_execute.memoryDelay_ns"), sc_core::SC_NS);
    auto executeTime = sc_core::sc_time(context.get<unsigned int>("pe_execute.computeTime_ns"), sc_core::SC_NS);

    while (true) {
        auto execute = taskIn.read<task_execute>();
        wait(executeTime);

        LOG("received: {}", execute.str());

        wait(memoryDelay_ns);
        // T1 += memoryDelay_ns.to_seconds(); // This is wrong, because mem delay is not part of the execution time
        LOG("loaded from memory: {}", execute.str());

        auto& node = *execute.n_ptr;

        if (!node.visited) {
            node.visited = true;

            for (auto n_ptr : node.adj) {
                auto execute = task_execute { n_ptr };
                LOG("pushed: {}", execute.str());
                taskOut.write(execute);
            }
        }

        --remainingTasks;

        auto& T_end = context.get<double>("T_end");
        T_end = sc_core::sc_time_stamp().to_seconds();
    }
}

} /* namespace paper_exp_dae_0 */
