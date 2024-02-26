#ifndef INCLUDE_PE_ACCESS_HPP_INCLUDED
#define INCLUDE_PE_ACCESS_HPP_INCLUDED

#include <systemc>
#include <tlm>

#include <ios>
#include <vector>

#include <sctlm/tlm_lib/drivers/memory.hpp>
#include <sctlm/tlm_lib/drivers/stream.hpp>
#include <sctlm/tlm_lib/tlm_module.hpp>

#include <fmt/core.h>

#include <flexitask/Defs.hpp>
#include <flexitask/Desc.hpp>
#include <flexitask/Top.hpp>

#include "tasks.hpp"

namespace paper_exp_dae_1 {

namespace drivers = sctlm::tlm_lib::drivers;

struct pe_access : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(pe_access);

    sc_core::sc_in<bool> clock { "clock" };
    sc_core::sc_in<bool> reset { "reset" };

    drivers::memory_interface mem { "mem" };
    drivers::stream_sink taskIn { "taskIn", 1 };
    drivers::stream_source taskOut_execute { "taskOut_execute" };

    flexitask::Context& context;

    pe_access(
        sc_core::sc_module_name const& module_name,
        flexitask::Context& context
    )
        : sc_core::sc_module(module_name)
        , context { context }
        , delay_(context.get<unsigned int>("pe_access.delay_ns"), sc_core::SC_NS) {

        set("reset", reset);
        set("clock", clock);

        SC_THREAD(thread_main);

        auto queueSize = context.get<unsigned int>("pe_access.requestQueueSize");
        auto numQueues = context.get<unsigned int>("pe_access.numParallelRequests");

        for (unsigned i = 0; i < numQueues; ++i) {
            request_queues_.push_back(std::make_unique<sc_core::sc_fifo<request>>(queueSize));
            sc_core::sc_spawn(sc_bind(&pe_access::thread_queue, this, i));
        }

        SC_THREAD(thread_task_out);
    }

    /* clang-format off */
    SCTLM_TLM_MODULE()

    SCTLM_TLM_BEGIN_PORTS()
        SCTLM_TLM_DRIVER_PORT(mem)
        SCTLM_TLM_DRIVER_PORT(taskIn)
        SCTLM_TLM_DRIVER_PORT(taskOut_execute)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */

    struct request {
        task_access access;

        /** @brief When the task was dispatched. */
        double T;

        FLEXITASK_DECLARE_STR();
    };

private:
    void thread_main();
    void thread_queue(unsigned idx);
    void thread_task_out();

    /** @brief each queue represents a different memory channel. */
    std::vector<std::unique_ptr<sc_core::sc_fifo<request>>> request_queues_;

    /** @brief delay for each memory request. */
    sc_core::sc_time delay_;

    /** @brief task output queue. */
    sc_core::sc_fifo<task_execute> task_out_queue_;

    int logCounter_ = 0;
};

inline std::ostream& operator<<(std::ostream& os, pe_access::request const& request) {
    os << fmt::format("request(task = {}, T = {})", request.access.str(), request.T);
    return os;
}

FLEXITASK_DEFINE_STR(pe_access::request);

} /* namespace paper_exp_dae_1 */

#endif /* INCLUDE_PE_ACCESS_HPP_INCLUDED */
