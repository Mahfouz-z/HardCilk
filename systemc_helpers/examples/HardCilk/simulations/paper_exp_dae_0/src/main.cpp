#include <flexitask/ArgParser.hpp>
#include <flexitask/Context.hpp>
#include <flexitask/Graph.hpp>
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

    constexpr const char* name = "paper_exp_dae_0";

    Context context;

    ArgParser argParser(context);

    argParser.arg<unsigned int>("factoryIndex", 0);
    argParser.arg<unsigned int>("clockPeriod_ns", 2);

    argParser.arg<unsigned int>("pe_execute.memoryDelay_ns", 70);
    argParser.arg<unsigned int>("pe_execute.computeTime_ns", 64);

    argParser.arg<bool>("logEnabled", true);

    graph::Graph::registerArgParser("graph", argParser);

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

    auto& factory = paper_exp_dae_0::factories[context.get<unsigned int>("factoryIndex")];

    context.set<Factory*>("factory", &factory);
    auto const& hwConf = *context.set<flexitask::desc::FlexiTaskSystem*>("description", factory.hardwareDescription());

    auto peCount = hwConf.tasks.at("execute").numProcessingElements;

    auto g = graph::Graph::fromContext("graph", context);
    context.set<graph::node*>("rootNode", g->root());

    auto& remainingTasks = context.set<int>("remainingTasks", g->size());
    auto& nodesProcessed = context.set<unsigned int>("nodesProcessed", 0);

    auto& T_start = context.set<double>("T_start", 0.0);
    auto& T_end = context.set<double>("T_end", 0.0);

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
        sc_start(100, SC_NS);

    sc_stop();

#ifdef VERILATED_TRACE_ENABLED
    tfp->close();
#endif

    fmt::print("\"peCount\": {}, \"executionTime\": {}\n", peCount, T_end - T_start);

    return 0;
}
