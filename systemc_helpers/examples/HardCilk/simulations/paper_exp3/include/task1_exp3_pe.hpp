#ifndef FLEXITASK_SIMULATION_PAPER_EXP3_TASK1_EXP3_PE_HPP_INCLUDED
#define FLEXITASK_SIMULATION_PAPER_EXP3_TASK1_EXP3_PE_HPP_INCLUDED

#include <systemc>
#include <tlm>

#include <sctlm/tlm_lib/drivers/memory.hpp>
#include <sctlm/tlm_lib/drivers/stream.hpp>
#include <sctlm/tlm_lib/tlm_module.hpp>

#include <fmt/core.h>

#include <flexitask/Defs.hpp>
#include <flexitask/Desc.hpp>
#include <flexitask/Top.hpp>

#include "tasks.hpp"

namespace paper_exp3 {

namespace drivers = sctlm::tlm_lib::drivers;

struct task1Exp3_pe : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(task1Exp3_pe);

    sc_core::sc_in<bool> clock { "clock" };
    sc_core::sc_in<bool> reset { "reset" };

    drivers::memory_interface mem { "mem" };
    drivers::stream_sink taskIn { "taskIn", 1 };
    drivers::stream_source taskOut { "taskOut" };
    drivers::stream_source taskOut_task2Exp3 { "taskOut_task2Exp3" };

    flexitask::Context& context;

    task1Exp3_pe(sc_core::sc_module_name const& module_name, flexitask::Context& context)
        : sc_core::sc_module(module_name)
        , context { context }
        , fifo_0_to_1 { "fifo_0_to_1", 5 }
        , fifo_0_to_2 { "fifo_0_to_2", 5 } {
        set("reset", reset);
        set("clock", clock);

        SC_THREAD(thread0);
        SC_THREAD(thread1);
        SC_THREAD(thread2);
    }

    /* clang-format off */
    SCTLM_TLM_MODULE()

    SCTLM_TLM_BEGIN_PORTS()
        SCTLM_TLM_DRIVER_PORT(mem)
        SCTLM_TLM_DRIVER_PORT(taskIn)
        SCTLM_TLM_DRIVER_PORT(taskOut)
        SCTLM_TLM_DRIVER_PORT(taskOut_task2Exp3)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */

private:
    void thread0();
    void thread1();
    void thread2();

    sc_core::sc_fifo<task_task1Exp3> fifo_0_to_1;
    sc_core::sc_fifo<task_task2Exp3> fifo_0_to_2;

    int logCounter_ = 0;
};

} /* namespace paper_exp3 */

#endif /* FLEXITASK_SIMULATION_PAPER_EXP3_TASK1_EXP3_PE_HPP_INCLUDED */
