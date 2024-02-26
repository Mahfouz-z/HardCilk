#define SC_INCLUDE_DYNAMIC_PROCESSES
#include <systemc>

using namespace sc_core;
using namespace sc_dt;
using namespace std;

#include <tlm>

using namespace tlm;

#include <traffic-generators/tg-tlm.h>
#include <traffic-generators/traffic-desc.h>

#include <test-modules/memory.h>
#include <test-modules/utils.h>

using namespace utils;

#include <verilated_vcd_sc.h>

#include <fmt/core.h>
#include <memory>

#include "DMA_Wrapped.h"

// Top simulation module.
SC_MODULE(Top)
{
    sc_clock clock;
    sc_signal<bool> reset;

    DMA_Wrapped dut;

    /** @brief sends management commands. */
    MemoryInterfaceDriver mgmt;

    std::vector<uint8_t> mem_storage;
    memory mem;

    SC_HAS_PROCESS(Top);

    Top(sc_module_name name) : clock("clk", sc_time(1, SC_US)),
                               reset("reset"),
                               dut("dut"),
                               mgmt(dut.getTargetSocket("S_AXI")),
                               mem_storage(1024, 0),
                               mem("memory", SC_ZERO_TIME, 1024, mem_storage.data())
    {
        dut.clock(clock);
        dut.reset(reset);

        dut.getInitiatorSocket("M_AXI")->bind(mem.socket);

        /* initiate the memory */
        uint8_t *data = mem_storage.data();
        for (int i = 0; i < 64; ++i)
            data[i] = i;

        SC_THREAD(initiator_thread);
    }

    void initiator_thread()
    {
        fmt::print("{}\n", __PRETTY_FUNCTION__);

        /* set up the DMA parameters */
        mgmt.write32(0x10, 0xDEAD);
        mgmt.write32(0x14, 0xBEEF);
        fmt::print("t = {}, source = 0x{:0>16x}\n", sc_time_stamp().to_string(), mgmt.read64(0x10));

#if 0
        mgmt.write32(2*0x0C, 16);
        fmt::print("t = {}, destination = {}\n", sc_time_stamp().to_string(), mgmt.read32(2*0x0C));

        mgmt.write32(2*0x10, 8);
        fmt::print("t = {}, length = {}\n", sc_time_stamp().to_string(), mgmt.read32(2*0x10));

        /* writing to the command register starts the DMA operation */
        mgmt.write32(0x00, 1);

        /* as long as the module is busy, wait. */
        while (mgmt.read32(0x04) /* status register */) {
            wait(sc_time(10, SC_US));
        }

        /* print the memory contents */
        uint8_t *data = mem_storage.data();

        fmt::print("t = {}, memory contents (starting from address 0x08):\n", sc_time_stamp().to_string());
        for (int i = 8; i < 24; ++i)
            fmt::print("{:02x} ", data[i]);
#endif
        fmt::print("\n");
        fmt::print("done.\n");
    }
};

int sc_main(int argc, char *argv[])
{
    Verilated::traceEverOn(true);
    Verilated::commandArgs(argc, argv);

    Top top("Top");
    sc_start(SC_ZERO_TIME);

    auto tfp = std::make_unique<VerilatedVcdSc>();
    top.dut.trace(tfp.get(), 99);

    tfp->open(fmt::format("{}.vcd", argv[0]).c_str());

    top.reset.write(true);
    sc_start(4, SC_US);
    top.reset.write(false);

    sc_start(140, SC_US);
    sc_stop();

    tfp->close();
    return 0;
}
