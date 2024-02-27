#ifndef HARDCILK_SIMULATION_FIBONACCI_FIB_PE_HPP_INCLUDED
#define HARDCILK_SIMULATION_FIBONACCI_FIB_PE_HPP_INCLUDED

#include <systemc>
#include <tlm>

#include <sctlm/tlm_lib/drivers/memory.hpp>
#include <sctlm/tlm_lib/drivers/stream.hpp>
#include <sctlm/tlm_lib/tlm_module.hpp>

#include <fmt/core.h>

#include <hardcilk/Context.hpp>
#include <hardcilk/Defs.hpp>
#include <hardcilk/Desc.hpp>
#include <hardcilk/Top.hpp>

#include "tasks.hpp"

namespace fibonacci {

namespace drivers = sctlm::tlm_lib::drivers;

struct fib_pe : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(fib_pe);

    sc_core::sc_in<bool> clock { "clock" };
    sc_core::sc_in<bool> reset { "reset" };

    drivers::memory_interface mem { "mem" };
    drivers::stream_sink taskIn { "taskIn", 1 };
    drivers::stream_source taskOut { "taskOut" };
    drivers::stream_sink addrIn_sum { "addrIn_sum", 1 };
    drivers::stream_source contOut_sum { "contOut_sum" };

    hardcilk::Context& context;

    fib_pe(sc_core::sc_module_name const& module_name, hardcilk::Context& context)
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
        SCTLM_TLM_DRIVER_PORT(taskOut)
        SCTLM_TLM_DRIVER_PORT(addrIn_sum)
        SCTLM_TLM_DRIVER_PORT(contOut_sum)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */

private:
    void loop();
    void thread();
};

} /* namespace fibonacci */

#endif /* HARDCILK_SIMULATION_FIBONACCI_FIB_PE_HPP_INCLUDED */
