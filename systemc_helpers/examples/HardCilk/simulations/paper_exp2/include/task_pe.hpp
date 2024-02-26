#ifndef FLEXITASK_SIMULATION_PAPER_EXP2_TASK_PE_HPP_INCLUDED
#define FLEXITASK_SIMULATION_PAPER_EXP2_TASK_PE_HPP_INCLUDED

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

namespace paper_exp2 {

namespace drivers = sctlm::tlm_lib::drivers;

struct task_pe : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
    SC_HAS_PROCESS(task_pe);

    sc_core::sc_in<bool> clock { "clock" };
    sc_core::sc_in<bool> reset { "reset" };

    drivers::memory_interface mem { "mem" };
    drivers::stream_sink taskIn { "taskIn", 1 };
    drivers::stream_source taskOut { "taskOut" };
    drivers::stream_sink addrIn_task { "addrIn_task", 1 };
    drivers::stream_source contOut_task { "contOut_task" };

    flexitask::Context& context;

    task_pe(sc_core::sc_module_name const& module_name, flexitask::Context& context)
        : sc_core::sc_module(module_name)
        , context { context }
        , fifo_0_to_1 { "fifo0", 5 }
        , fifo_0_to_2 { "fifo1", 5 }
        , fifo_1_to_2 { "fifo2", 5 } {
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
        SCTLM_TLM_DRIVER_PORT(addrIn_task)
        SCTLM_TLM_DRIVER_PORT(contOut_task)
    SCTLM_TLM_END_PORTS()
    /* clang-format on */

private:
    void thread0(); // do the main work bulk
    void thread1(); // do the spawn_next work
    void thread2(); // do the spawn work
    
    void wait_cycles(int cycles);

    sc_core::sc_fifo<data_0_to_1> fifo_0_to_1;
    sc_core::sc_fifo<task_task> fifo_0_to_2;
    sc_core::sc_fifo<task_task> fifo_1_to_2;

    int logCounter_ = 0;
};

} /* namespace paper_exp2 */

#endif /* FLEXITASK_SIMULATION_PAPER_EXP2_TASK_PE_HPP_INCLUDED */

// #ifndef CF3B62EA_A113_49A8_AEA2_78AD0D975ED1
// #define CF3B62EA_A113_49A8_AEA2_78AD0D975ED1
// #ifndef FLEXITASK_SIMULATION_PAPER_EXP2_TASK_PE_HPP_INCLUDED
// #define FLEXITASK_SIMULATION_PAPER_EXP2_TASK_PE_HPP_INCLUDED

// #include <systemc>
// #include <tlm>

// #include <sctlm/tlm_lib/drivers/memory.hpp>
// #include <sctlm/tlm_lib/drivers/stream.hpp>
// #include <sctlm/tlm_lib/tlm_module.hpp>

// #include <fmt/core.h>

// #include <flexitask/Defs.hpp>
// #include <flexitask/Desc.hpp>
// #include <flexitask/Top.hpp>
// #include <mutex>

// #include "tasks.hpp"

// namespace paper_exp2 {

// namespace drivers = sctlm::tlm_lib::drivers;

// struct task_pe : sc_core::sc_module, sctlm::tlm_lib::tlm_module {
//     SC_HAS_PROCESS(task_pe);

//     sc_core::sc_in<bool> clock { "clock" };
//     sc_core::sc_in<bool> reset { "reset" };

//     drivers::memory_interface mem { "mem" };
//     drivers::stream_sink taskIn { "taskIn", 1};
//     drivers::stream_source taskOut { "taskOut" };
//     drivers::stream_sink addrIn_task { "addrIn_task", 1};
//     drivers::stream_source contOut_task { "contOut_task" };

//     flexitask::Top& top;

//     task_pe(sc_core::sc_module_name const& module_name, flexitask::Top& top)
//         : sc_core::sc_module(module_name)
//         , top { top } {
//         set("reset", reset);
//         set("clock", clock);

//         SC_THREAD(thread0);
//         SC_THREAD(thread1);
//     }

//     /* clang-format off */
//     SCTLM_TLM_MODULE()

//     SCTLM_TLM_BEGIN_PORTS()
//         SCTLM_TLM_DRIVER_PORT(mem)
//         SCTLM_TLM_DRIVER_PORT(taskIn)
//         SCTLM_TLM_DRIVER_PORT(taskOut)
//         SCTLM_TLM_DRIVER_PORT(addrIn_task)
//         SCTLM_TLM_DRIVER_PORT(contOut_task)
//     SCTLM_TLM_END_PORTS()
//     /* clang-format on */

// private:
//     void loop();
//     void thread0();
//     void thread1();
//     std::mutex taskInMutex;
//     std::mutex memMutex;
//     std::mutex taskOutMutex;
//     std::mutex contOutMutex;

// };

// } /* namespace paper_exp2 */

// #endif /* FLEXITASK_SIMULATION_PAPER_EXP2_TASK_PE_HPP_INCLUDED */

// #endif /* CF3B62EA_A113_49A8_AEA2_78AD0D975ED1 */
