#include <fmt/core.h>
#include <pe_execute.hpp>

#define LOG(format, ...)                                                                                                                             \
    if (logEnabled)                                                                                                                                  \
        fmt::print("[{:>12}] [{}] [{}] " format "\n", sc_core::sc_time_stamp().to_string(), name(), __PRETTY_FUNCTION__ __VA_OPT__(, ) __VA_ARGS__); \
    else                                                                                                                                             \
        ;

namespace paper_exp_dae_1 {

void pe_execute::thread() {
    bool logEnabled = context.get<bool>("logEnabled");

    auto& clockPeriod_ns = context.get<unsigned int>("clockPeriod_ns");
    auto& remainingTasks = context.get<int>("remainingTasks");
    auto executeTime = sc_core::sc_time(context.get<unsigned int>("pe_execute.computeTime_ns"), sc_core::SC_NS);

    while (true) {
        auto execute = taskIn.read<task_execute>();
        wait(executeTime);

        auto& node = *execute.n_ptr;

        LOG("received: {}", execute.str());

        if (!node.visited) {
            node.visited = true;

            for (auto n_ptr : node.adj) {
                auto access = task_access { n_ptr };
                LOG("pushed: {}", access.str());
                taskOut_access.write(access);
            }
        }

        --remainingTasks;

        auto& T_end = context.get<double>("T_end");
        T_end = sc_core::sc_time_stamp().to_seconds();
    }
}

} /* namespace paper_exp_dae_1 */
