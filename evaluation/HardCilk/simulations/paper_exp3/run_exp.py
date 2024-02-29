from hardcilk.exp import EntryBase, Experiment, Simulation, Context

try:
    import matplotlib.pyplot as plt
except ImportError:
    import subprocess
    import sys
    subprocess.check_call([sys.executable, "-m", "pip", "install", 'matplotlib'])
    import matplotlib.pyplot as plt

import os

SIMULATION_NAME = "paper_exp3"
GROUP_NAME = ["paper_exp3_effficiency", "paper_exp3_scalability"]



class Entry(EntryBase):
    def __init__(self, context: Context = ..., resultsDir: str = "./results/") -> None:
        super().__init__(context, resultsDir)

    def register(self) -> None:
        sim = Simulation(
            name=SIMULATION_NAME,
            executable="simulation_paper_exp3",
            parameters={
                "delayCycles": int,
                "factoryIndex": int
            },
            extraArguments=[
                "--clockPeriod_ns", 2
            ]
        )

        exps = [[
            Experiment(SIMULATION_NAME, {"delayCycles": 8, "factoryIndex" : 0}),  # The factory index coresponding to 28 PEs
            Experiment(SIMULATION_NAME, {"delayCycles": 16, "factoryIndex" : 0}),
            Experiment(SIMULATION_NAME, {"delayCycles": 32, "factoryIndex" : 0}),
            Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 0}),
            Experiment(SIMULATION_NAME, {"delayCycles": 128, "factoryIndex" : 0}),
            Experiment(SIMULATION_NAME, {"delayCycles": 256, "factoryIndex" : 0}),
            Experiment(SIMULATION_NAME, {"delayCycles": 512, "factoryIndex" : 0})
        ],
        [
            Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 1}), # 8 PEs
            Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 2}), # 16 PEs
            Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 3}), # 32 PEs
            Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 4}), # 64 PEs
            Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 5}), # 128 PEs
            Experiment(SIMULATION_NAME, {"delayCycles": 64, "factoryIndex" : 6})  # 256 PEs
        ]
        ]
        
        self.context.addSimulation(sim)

        # for processing easily, define groups of experiments
        self.context.beginGroup(GROUP_NAME[0])
        self.context.addExperiments(exps[0])
        self.context.endGroup()

        self.context.beginGroup(GROUP_NAME[1])
        self.context.addExperiments(exps[1])
        self.context.endGroup()

    def process(self) -> None:   
        # Get efficiency experiment results
        GraphTitle = "Efficiency of the scheduler with different delay cycles (28 PEs)"
        xLabel = "Delay Cycles"
        yLabel = "Efficiency %"
        xData = []
        yData = []

        for e in self.context.experiments(group=GROUP_NAME[0]):
            result = e.readStdOut()[-1]
            efficiency = float(result.split(",")[-2].split(" ")[-1][:-1])
            yData.append(efficiency)
            xData.append(e.experiment.arguments["delayCycles"])

        
        # Plot the efficiency graph with min y value equal to minimum efficiency value - 5%
        min_efficiency = min(yData)
        min_y_value = min_efficiency - 3
        
        plt.figure(figsize=(8, 6))
        plt.plot(xData, yData, marker='o', linestyle='-')
        plt.title(GraphTitle)
        plt.xlabel(xLabel)
        plt.ylabel(yLabel)
        plt.ylim(min_y_value, 100.1)  # Set the y-axis limit
        plt.grid(True, linestyle='--', color='lightgray', alpha=0.7)  # Adjust grid appearance

    
        # Save the plot under pwd/run/results/ directory
        save_dir = os.path.join(os.getcwd(), 'run', 'results')
        if not os.path.exists(save_dir):
            os.makedirs(save_dir)
        
        save_path = os.path.join(save_dir, 'efficiency_graph.png')
        plt.savefig(save_path)
        plt.close()

        # Get scalability experiment results
        GraphTitle = "Scalability of the scheduler with different number of PEs (64 delay cycles)"
        xLabel = "Number of PEs"
        yLabel = "Speedup"
        xData = [8, 16, 32, 64, 128, 256]
        yData = []
        for e in self.context.experiments(group=GROUP_NAME[1]):
            result = e.readStdOut()[-1]
            speedup = float(result.split(",")[-1].split(" ")[-1])
            yData.append(speedup)
        
        plt.figure(figsize=(8, 6))
        plt.plot(xData, yData, marker='o', linestyle='-')
        plt.title(GraphTitle)
        plt.xlabel(xLabel)
        plt.ylabel(yLabel)
        plt.grid(True, linestyle='--', color='lightgray', alpha=0.7)  # Adjust grid appearance


        save_path = os.path.join(save_dir, 'scalability_graph.png')
        plt.savefig(save_path)
        plt.close()
        


if __name__ == "__main__":
    import sys
    Entry.main(sys.argv[1:])
