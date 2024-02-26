#ifndef FLEXITASK_SIMULATION_PAPER_EXP1_TASK_PE_HPP_INCLUDED
#define FLEXITASK_SIMULATION_PAPER_EXP1_TASK_PE_HPP_INCLUDED

#include <systemc>
#include <tlm>

#include <sctlm/tlm_lib/drivers/memory.hpp>
#include <sctlm/tlm_lib/drivers/stream.hpp>
#include <sctlm/tlm_lib/tlm_module.hpp>

#include <fmt/core.h>

#include <flexitask/Context.hpp>
#include <flexitask/Defs.hpp>
#include <flexitask/Desc.hpp>

#include "tasks.hpp"

namespace paper_exp1 {

namespace drivers = sctlm::tlm_lib::drivers;

struct task_pe : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(task_pe);

    sc_core::sc_in<bool> clock { "clock" };
    sc_core::sc_in<bool> reset { "reset" };

    drivers::memory_interface mem { "mem" };
    drivers::stream_sink taskIn { "taskIn", 1 };
    drivers::stream_source taskOut { "taskOut" };

    flexitask::Context& context;

    task_pe(sc_core::sc_module_name const& module_name, flexitask::Context& context)
        : sc_core::sc_module(module_name)
        , context { context }
        , fifo_ { "fifo", 5 } {
        set("reset", reset);
        set("clock", clock);

        SC_THREAD(thread0);
        SC_THREAD(thread1);
    }

    /* clang-format off */
    SCTLM_TLM_MODULE()

    SCTLM_TLM_BEGIN_PORTS()
        SCTLM_TLM_DRIVER_PORT(mem)
        SCTLM_TLM_DRIVER_PORT(taskIn)
        SCTLM_TLM_DRIVER_PORT(taskOut)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */

private:
    void thread0();
    void thread1();

    sc_core::sc_fifo<task_task> fifo_;
    int logCounter_ = 0;
};

} /* namespace paper_exp1 */

#endif /* FLEXITASK_SIMULATION_PAPER_EXP1_TASK_PE_HPP_INCLUDED */
