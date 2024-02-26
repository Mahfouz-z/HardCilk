#define SC_INCLUDE_DYNAMIC_PROCESSES
#include <systemc>

using namespace sc_core;
using namespace sc_dt;
using namespace std;

#include <tlm>

using namespace tlm;

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

#include <VSimpleMemoryMappedDevice.h>
#include <tlm-bridges/tlm2axilite-bridge.h>
#include <traffic-generators/tg-tlm.h>
#include <traffic-generators/traffic-desc.h>

#include <test-modules/signals-axilite.h>
#include <test-modules/utils.h>

#include "SimpleMemoryMappedDevice.h"
#include <VSimpleMemoryMappedDevice__Syms.h>

using namespace utils;

#include <verilated_vcd_sc.h>

#include <fmt/core.h>
#include <memory>

#include "tlm_enabled.h"

// Top simulation module.
SC_MODULE(Top)
{
    sc_clock clk;
    sc_signal<bool> rst_n, rst_p;

    SimpleMemoryMappedDevice dut;
    MemoryInterfaceTester<32> interfaceTester;

    SC_HAS_PROCESS(Top);

    Top(sc_module_name name) : clk("clk", sc_time(1, SC_US)),
                               rst_n("rst_n"),
                               rst_p("rst_p"),
                               dut("dut"),
                               interfaceTester(dut.getTargetSocket<32>("SAXIL"))
    {
        dut.clock(clk);
        dut.reset(rst_p); // TODO must be negated

        SC_THREAD(writer_thread);

        SC_THREAD(observer_thread);
        sensitive << clk.negedge_event();
    }

    void writer_thread()
    {
        fmt::print("{}\n", __PRETTY_FUNCTION__);

        interfaceTester.write32(0, 89);
        fmt::print("{}\n", interfaceTester.read32(0));
        fmt::print("{}\n", interfaceTester.read32(0x8));
    }

    void observer_thread()
    {
        fmt::print("{}\n", __PRETTY_FUNCTION__);

        while (true)
        {
            if (clk.negedge())
            {
                // fmt::print("[t = {:8d}] reg1 = {}\n", sc_time_stamp().value() / 500000, dut.rootp->SimpleMemoryMappedDevice__DOT__reg1);
                // fmt::print("[t = {:8d}] reg2 = {}\n", sc_time_stamp().value() / 500000, dut.rootp->SimpleMemoryMappedDevice__DOT__reg2);
                // fmt::print("[t = {:8d}] resetn = {}\n", sc_time_stamp().value() / 500000, dut.reset_n);
            }

            wait();
        }
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

    /*
    top.dut.saxil.Trace(trace_fp);
    sc_trace(trace_fp, top.clk, top.clk.name());
    sc_trace(trace_fp, top.rst_n, top.rst_n.name());
    sc_trace(trace_fp, , top.name());
    */

    // Reset is active low. Emit a reset cycle.
    top.rst_n.write(false);
    top.rst_p.write(true);
    sc_start(4, SC_US);
    top.rst_n.write(true);
    top.rst_p.write(false);

    sc_start(140, SC_US);
    sc_stop();

    tfp->close();
    return 0;
}
