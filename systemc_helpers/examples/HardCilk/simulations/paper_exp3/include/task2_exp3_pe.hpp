#ifndef HARDCILK_SIMULATION_PAPER_EXP3_TASK2_EXP3_PE_HPP_INCLUDED
#define HARDCILK_SIMULATION_PAPER_EXP3_TASK2_EXP3_PE_HPP_INCLUDED

#include <systemc>
#include <tlm>

#include <sctlm/tlm_lib/drivers/memory.hpp>
#include <sctlm/tlm_lib/drivers/stream.hpp>
#include <sctlm/tlm_lib/tlm_module.hpp>

#include <fmt/core.h>

#include <hardcilk/Defs.hpp>
#include <hardcilk/Desc.hpp>
#include <hardcilk/Top.hpp>

#include "tasks.hpp"

namespace paper_exp3 {

namespace drivers = sctlm::tlm_lib::drivers;

struct task2Exp3_pe : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(task2Exp3_pe);

    sc_core::sc_in<bool> clock { "clock" };
    sc_core::sc_in<bool> reset { "reset" };

    drivers::memory_interface mem { "mem" };
    drivers::stream_sink taskIn { "taskIn", 1 };
    //drivers::stream_source taskOut { "taskOut" };

    hardcilk::Context& context;

    task2Exp3_pe(sc_core::sc_module_name const& module_name, hardcilk::Context& context)
        : sc_core::sc_module(module_name)
        , context { context } {
        set("reset", reset);
        set("clock", clock);

        SC_THREAD(thread);
    }

    /* clang-format off */
    SCTLM_TLM_MODULE()

    SCTLM_TLM_BEGIN_PORTS()
        SCTLM_TLM_DRIVER_PORT(mem)
        SCTLM_TLM_DRIVER_PORT(taskIn)
        //SCTLM_TLM_DRIVER_PORT(taskOut)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */

private:
    void thread();

    int logCounter_ = 0;
};

} /* namespace paper_exp3 */

#endif /* HARDCILK_SIMULATION_PAPER_EXP3_TASK2_EXP3_PE_HPP_INCLUDED */
