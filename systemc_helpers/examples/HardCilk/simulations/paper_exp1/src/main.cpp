#include <flexitask/ArgParser.hpp>
#include <flexitask/Context.hpp>
#include <flexitask/MemParams.hpp>
#include <flexitask/Top.hpp>

#include <fmt/core.h>

#ifdef VERILATED_TRACE_ENABLED
#    include <verilated_vcd_sc.h>
#endif

#include <factories.hpp>

using namespace sc_core;
using namespace sc_dt;
using namespace flexitask;

int sc_main(int argc, char* argv[]) {
#ifdef VERILATED_TRACE_ENABLED
    Verilated::traceEverOn(true);
#endif
    Verilated::commandArgs(argc, argv);

    constexpr const char* name = "paper_exp1";

    Context context;

    ArgParser argParser(context);

    argParser.arg<unsigned int>("factoryIndex", 0);
    argParser.arg<unsigned int>("clockPeriod_ns", 2);
    argParser.arg<unsigned int>("delayCycles", 30);
    argParser.arg<unsigned int>("baseDepth", 2);
    argParser.arg<unsigned int>("branchFactor", 6);
    argParser.arg<unsigned int>("maxInitCount", 8);
    argParser.arg<unsigned int>("logCounterPeriod", 10000);

    MemParams {
        .prefix = "systemMemory",
        .delay_ns = 70,
        .numParallelRequests = 32
    }
        .toArgParser(argParser);

    if (!argParser.parse(argc, argv)) {
        argParser.helpText(std::cout);
        return 0;
    }

    auto& factory = paper_exp1::factories[context.get<unsigned int>("factoryIndex")];

    context.set<Factory*>("factory", &factory);
    auto const& hwConf = *context.set<flexitask::desc::FlexiTaskSystem*>("description", factory.hardwareDescription());

    auto peCount = hwConf.tasks.at("task").numProcessingElements;

    auto& remainingTasks = context.set<int>("remainingTasks", 1);
    auto& nodesProcessed = context.set<unsigned int>("nodesProcessed", 0);
    auto& T1 = context.set<double>("T1", 0);
    auto& T_start = context.set<double>("T_start", 0);
    auto& T_end = context.set<double>("T_end", 0);

    Top top("top", context);

    sc_clock clock { "clock", 2.0, sc_core::SC_NS };
    sc_signal<bool> reset;

    top.get<sc_in<bool>>("clock").bind(clock);
    top.get<sc_in<bool>>("reset").bind(reset);

    sc_start(SC_ZERO_TIME);

#ifdef VERILATED_TRACE_ENABLED
    auto tfp = std::make_unique<VerilatedVcdSc>();
    top.verilated_trace(tfp.get(), 99);
    tfp->open(fmt::format("{}_{}.vcd", argv[0], name).c_str());
#endif

    reset.write(true);
    sc_start(4, SC_NS);
    reset.write(false);

    while (remainingTasks > 0)
        sc_start(1, SC_US);

    if (remainingTasks > 0)
        T_end = sc_core::sc_time_stamp().to_seconds();

    sc_stop();

#ifdef VERILATED_TRACE_ENABLED
    tfp->close();
#endif

    fmt::print("T1 = {:.9f}, T_ideal[{}] = {:.9f}, T[{}] = {:.9f}, Efficiency = {:.2f}, speedUp = {:.2f}\n", T1, peCount, T1 / peCount, peCount, T_end - T_start, (T1 / peCount) * 100 / (T_end - T_start), T1 / (T_end - T_start));

    return 0;
}
