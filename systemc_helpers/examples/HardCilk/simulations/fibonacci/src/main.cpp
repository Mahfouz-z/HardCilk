#include <hardcilk/ArgParser.hpp>
#include <hardcilk/Context.hpp>
#include <hardcilk/Factory.hpp>
#include <hardcilk/Processor.hpp>
#include <hardcilk/Top.hpp>

#include <fmt/core.h>

#ifdef VERILATED_TRACE_ENABLED
#    include <verilated_vcd_sc.h>
#endif

#include <factories.hpp>

using namespace sc_core;
using namespace sc_dt;
using namespace hardcilk;

int sc_main(int argc, char* argv[]) {
#ifdef VERILATED_TRACE_ENABLED
    Verilated::traceEverOn(true);
#endif
    Verilated::commandArgs(argc, argv);

    constexpr const char* name = "fibonacci";

    Context context;

    ArgParser argParser { context };

    /* add other arguments here */
    argParser.arg<unsigned int>("factoryIndex", 0);
    argParser.arg<int>("runtimeMicros", 2.0);
    argParser.arg<unsigned int>("n", 5);

    if (!argParser.parse(argc, argv)) {
        argParser.helpText(std::cout);
        return 0;
    }

    /* choose the desired factory based on the command line parameter */
    auto& factory = fibonacci::factories[context.get<unsigned int>("factoryIndex")];

    context.set<Factory*>("factory", &factory);
    context.set<hardcilk::desc::HardCilkSystem*>("description", factory.hardwareDescription());

    auto top = factory.instantiateTop("top", context);

    sc_clock clock { "clock", 2.0, sc_core::SC_NS };
    sc_signal<bool> reset;

    top->get<sc_in<bool>>("clock").bind(clock);
    top->get<sc_in<bool>>("reset").bind(reset);

    sc_start(SC_ZERO_TIME);

#ifdef VERILATED_TRACE_ENABLED
    auto tfp = std::make_unique<VerilatedVcdSc>();
    top->verilated_trace(tfp.get(), 99);
    tfp->open(fmt::format("{}_{}.vcd", argv[0], name).c_str());
#endif

    reset.write(true);
    sc_start(4, SC_NS);
    reset.write(false);

    sc_start(context.get<int>("runtimeMicros"), SC_US);
    sc_stop();

#ifdef VERILATED_TRACE_ENABLED
    tfp->close();
#endif

    return 0;
}
