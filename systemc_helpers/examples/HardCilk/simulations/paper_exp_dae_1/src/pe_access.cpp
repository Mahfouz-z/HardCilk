#include <fmt/core.h>
#include <pe_access.hpp>

#define LOG(format, ...)                                                                                                                             \
    if (logEnabled)                                                                                                                                  \
        fmt::print("[{:>12}] [{}] [{}] " format "\n", sc_core::sc_time_stamp().to_string(), name(), __PRETTY_FUNCTION__ __VA_OPT__(, ) __VA_ARGS__); \
    else                                                                                                                                             \
        ;

namespace paper_exp_dae_1 {

void pe_access::thread_main() {
    bool logEnabled = context.get<bool>("logEnabled");

    unsigned i = 0;

    while (true) {
        auto access = taskIn.read<task_access>();
        LOG("received: {}", access.str());

        /* buffer the incoming task to one of the queues */
        request_queues_[i]->write(request { access, sc_core::sc_time_stamp().to_seconds() });

        i = (i + 1) % request_queues_.size();
    }
}

void pe_access::thread_queue(unsigned idx) {
    bool logEnabled = context.get<bool>("logEnabled");

    auto& remainingTasks = context.get<int>("remainingTasks");

    while (true) {
        auto request = request_queues_[idx]->read();
        LOG("[idx = {}] received: {}", idx, request.str());

        wait(delay_);
        // T1 += delay_.to_seconds(); // This is wrong, because mem delay is not part of the execution time

        auto execute = task_execute { .n_ptr = request.access.n_ptr };

        LOG("[idx = {}] pushed: {}", idx, execute.str());
        task_out_queue_.write(execute);

        --remainingTasks;

        auto& T_end = context.get<double>("T_end");
        T_end = sc_core::sc_time_stamp().to_seconds();
    }
}

void pe_access::thread_task_out() {
    while (true) {
        auto execute = task_out_queue_.read();
        taskOut_execute.write(execute);
    }
}

} /* namespace paper_exp_dae_1 */
