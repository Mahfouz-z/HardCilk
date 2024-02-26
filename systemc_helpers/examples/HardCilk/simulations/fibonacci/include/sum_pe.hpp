#ifndef FLEXITASK_SIMULATION_FIBONACCI_SUM_PE_HPP_INCLUDED
#define FLEXITASK_SIMULATION_FIBONACCI_SUM_PE_HPP_INCLUDED

#include <systemc>
#include <tlm>

#include <sctlm/tlm_lib/drivers/memory.hpp>
#include <sctlm/tlm_lib/drivers/stream.hpp>
#include <sctlm/tlm_lib/tlm_module.hpp>

#include <fmt/core.h>

#include <flexitask/Context.hpp>
#include <flexitask/Defs.hpp>
#include <flexitask/Desc.hpp>
#include <flexitask/Top.hpp>

#include "tasks.hpp"

namespace fibonacci {

namespace drivers = sctlm::tlm_lib::drivers;

struct sum_pe : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(sum_pe);

    sc_core::sc_in<bool> clock { "clock" };
    sc_core::sc_in<bool> reset { "reset" };

    drivers::memory_interface mem { "mem" };
    drivers::stream_sink taskIn { "taskIn" };
    drivers::stream_source contOut_sum { "contOut_sum" };

    flexitask::Context& context;

    sum_pe(sc_core::sc_module_name const& module_name, flexitask::Context& context)
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
        SCTLM_TLM_DRIVER_PORT(contOut_sum)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */

private:
    void loop();
    void thread();
};

} /* namespace fibonacci */

#endif /* FLEXITASK_SIMULATION_FIBONACCI_SUM_PE_HPP_INCLUDED */
