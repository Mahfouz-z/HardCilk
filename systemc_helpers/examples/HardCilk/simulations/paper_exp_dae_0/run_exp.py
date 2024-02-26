from flexitask.exp import EntryBase, Experiment, Simulation, Context

SIMULATION_NAME = "paper_exp_dae_0"
GROUP_NAME = "paper_exp_dae_0"


class Entry(EntryBase):
    NAME = "paper_exp_dae_2"

    def __init__(self, context: Context = ..., resultsDir: str = "./results/") -> None:
        super().__init__(context, resultsDir)

        self._computeTime_ns_v = [16, 32, 64, 128]
        self._factoryIndex_v = [0, 1, 2, 3]
        self._memoryDelay_ns_v = [
            2, 4, 8, 16, 32, 64, 128, 256, 512, 1024, 2048, 4096, 8192
        ]
        self._peCount_v = [1, 2, 4, 8]

    def register(self) -> None:
        sim = Simulation(
            name=SIMULATION_NAME,
            executable="simulation_paper_exp_dae_0",
            parameters={
                "pe_execute.computeTime_ns": int,
                "pe_execute.memoryDelay_ns": int,
                "graph.depth": int,
                "graph.breadth": int,
                "factoryIndex": int,
            },
            extraArguments=[
                "--clockPeriod_ns", 2,
                "--logEnabled", 0
            ]
        )

        exps = []

        for factoryIndex in self._factoryIndex_v:
            for computeTime_ns in self._computeTime_ns_v:
                for memoryDelay_ns in self._memoryDelay_ns_v:
                    exps.append(
                        Experiment(
                            SIMULATION_NAME, {
                                "factoryIndex": factoryIndex,
                                "pe_execute.computeTime_ns": computeTime_ns,
                                "pe_execute.memoryDelay_ns": memoryDelay_ns,
                                "graph.breadth": 2048,
                                "graph.depth": 1
                            }
                        )
                    )

        self.context.addSimulation(sim)

        # for processing easily, define groups of experiments
        self.context.beginGroup(GROUP_NAME)
        self.context.addExperiments(exps)
        self.context.endGroup()

    def process(self) -> None:
        # self._print_results()
        self._do_plots()

    def _print_results(self) -> None:
        print("results for no-DAE:")
        for e in self.context.experiments(group=GROUP_NAME):
            memoryDelay_ns = e.experiment.arguments["pe_access.delay_ns"]
            results = eval("{%s}" % (e.readStdOut()[2]))
            pe_count = results.get("peCount")
            executionTime_ms = results.get("executionTime") * 1000
            print(
                f"peCount = {pe_count}; delay_ns = {memoryDelay_ns}; execTime_ms = {executionTime_ms:.4f}"
            )

    def _do_plots(self) -> None:
        from matplotlib import pyplot as plt
        from matplotlib.axes import Axes
        from matplotlib.figure import Figure

        executionTime_ms_v_v = []

        assert len(self._peCount_v) == len(self._factoryIndex_v)

        expw_v = self.context.experiments(group=GROUP_NAME)
        idx = 0

        for peCount in self._peCount_v:
            executionTime_ms_v = []
            for memoryDelay_ns in self._memoryDelay_ns_v:
                expw = expw_v[idx]

                results = eval("{%s}" % (expw.readStdOut()[2]))

                peCount_1 = results.get("peCount")
                executionTime_ms = results.get("executionTime") * 1000

                # just to be extra safe
                assert peCount == peCount_1

                executionTime_ms_v.append(executionTime_ms)
                idx += 1

            executionTime_ms_v_v.append(executionTime_ms_v)

        figure: Figure = plt.figure()
        axes: Axes = figure.add_axes([0.1, 0.1, 0.8, 0.8])

        for idx, peCount in enumerate(self._peCount_v):
            axes.plot(
                self._memoryDelay_ns_v,
                executionTime_ms_v_v[idx], label=f"peCount = {peCount}"
            )

        axes.set_title("Blocking Execute PE")
        axes.loglog(base=2)
        axes.set_ylim([0.01, 17.5])
        axes.legend()
        axes.grid()

        axes.set_xlabel("Memory Latency (ns)")
        axes.set_ylabel("Execution Time (ms)")

        self.makeDirs()
        figure.savefig(self.path("figure_2.pdf"))


if __name__ == "__main__":
    import sys
    Entry.main(sys.argv[1:])
