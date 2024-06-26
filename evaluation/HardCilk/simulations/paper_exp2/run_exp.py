from hardcilk.exp import EntryBase, Experiment, Simulation, Context

SIMULATION_NAME = "paper_exp2"
GROUP_NAMES = ["paper_exp2_effficiency", "paper_exp2_scalability", "paper_exp2_argServers"]



class Entry(EntryBase):
    def __init__(self, context: Context = ..., resultsDir: str = "./results/") -> None:
        super().__init__(context, resultsDir)

    def register(self) -> None:
        sim = Simulation(
            name=SIMULATION_NAME,
            executable="simulation_paper_exp2",
            parameters={
                "delayCycles": int,
                "factoryIndex": int,
                "systemMemory.numParallelRequests": int
            },
            extraArguments=[
                "--clockPeriod_ns", 2
            ]
        )

        exps = [[
                # efficiency experiments
                Experiment(SIMULATION_NAME, {"delayCycles": 8, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32}),  # The factory index coresponding to 28 PEs, 8 arg routing servers
                Experiment(SIMULATION_NAME, {"delayCycles": 16, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32}),
                Experiment(SIMULATION_NAME, {"delayCycles": 32, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32}),
                Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32}),
                Experiment(SIMULATION_NAME, {"delayCycles": 128, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32}),
                Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32}),
                Experiment(SIMULATION_NAME, {"delayCycles": 512, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32})
            ],
            [
                #scalability experiments
                Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 1, "systemMemory.numParallelRequests" : 32}), # 8 PEs
                Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 2, "systemMemory.numParallelRequests" : 32}), # 16 PEs
                Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 3, "systemMemory.numParallelRequests" : 32}), # 32 PEs
                Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 4, "systemMemory.numParallelRequests" : 32}), # 64 PEs
                Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 5, "systemMemory.numParallelRequests" : 32}), # 128 PEs
                Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 6, "systemMemory.numParallelRequests" : 2048})  # 256 PEs
            ],
            [
                # Argument routing servers count experiment
                Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 7, "systemMemory.numParallelRequests" : 32}),  # 28 PEs, 2 Argument Routing Servers
                Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 8, "systemMemory.numParallelRequests" : 32}),  # 28 PEs, 4 Argument Routing Servers
                Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 0, "systemMemory.numParallelRequests" : 32}),  # 28 PEs, 8 Argument Routing Servers
                Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 9, "systemMemory.numParallelRequests" : 32})  # 28 PEs, 16 Argument Routing Servers 
            ]
        ]
        
        self.context.addSimulation(sim)

        # for processing easily, define groups of experiments
        for i in range(len(GROUP_NAMES)):
            self.context.beginGroup(GROUP_NAMES[i])
            self.context.addExperiments(exps[i])
            self.context.endGroup()


    def process(self) -> None:
        for name in GROUP_NAMES:
            for e in self.context.experiments(group=name):
                print(e.experiment.simulationName)
        


if __name__ == "__main__":
    import sys
    Entry.main(sys.argv[1:])
