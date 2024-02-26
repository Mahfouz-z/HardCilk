from flexitask.exp import BulkEntryBase, Context, ExperimentWrapper
from functools import cache
from typing import *  # type: ignore

from matplotlib import pyplot as plt
from matplotlib.axes import Axes
from matplotlib.figure import Figure
import matplotlib.lines as mp_lines


def dict_create_path(d, factory: Callable, *path) -> Any:
    """
    A utility function that creates a path in a dictionary of dictionary of (...).
    """
    last: Dict = d

    for p in path[:-1]:
        if p not in last:
            dd = {}
            last[p] = dd
            last = dd
        else:
            last = last[p]

    p = path[-1]

    if p not in last:
        dd = factory()
        last[p] = dd
        last = dd
    else:
        last = last[p]

    return last


class BulkEntry(BulkEntryBase):
    NAME = "dae"

    def __init__(self, context: Context, resultsDir: str = "./results/") -> None:
        super().__init__(context, resultsDir)

        self.addEntryExternal("paper_exp_dae_0/run_exp.py")
        self.addEntryExternal("paper_exp_dae_1/run_exp.py")

    @cache
    def _parse_results(self):
        """
        Returns a dictionary (`d`) that stores the results in a structured format:

        ```
        d[dae/no-dae][computeTime_ns][peCount] = [(memoryDelay_ns, executionTime_ms)]
        ```
        """
        r: Dict[bool, Dict[int, Dict[int, List[Tuple[int, float]]]]] = {}

        def _parse_results(expw: ExperimentWrapper) -> Tuple[int, float]:
            results = eval("{%s}" % (expw.readStdOut()[2]))
            pe_count = results.get("peCount")
            return (results.get("peCount"), results.get("executionTime") * 1000)

        for expw in self.context.experiments():
            if expw.experiment.simulationName not in ["paper_exp_dae_0", "paper_exp_dae_1"]:
                continue

            is_dae = expw.experiment.simulationName.endswith("1")

            exp = expw.experiment
            peCount, executionTime_ms = _parse_results(expw)

            peCount: int
            executionTime_ms: float

            if is_dae:
                computeTime_ns: int = exp.arguments["pe_execute.computeTime_ns"]
                memoryDelay_ns: int = exp.arguments["pe_access.delay_ns"]

                l: List[Tuple[int, float]] = \
                    dict_create_path(r, list, True, computeTime_ns, peCount)

                l.append((memoryDelay_ns, executionTime_ms))

            else:
                computeTime_ns: int = exp.arguments["pe_execute.computeTime_ns"]
                memoryDelay_ns: int = exp.arguments["pe_execute.memoryDelay_ns"]

                l: List[Tuple[int, float]] = \
                    dict_create_path(r, list, False, computeTime_ns, peCount)

                l.append((memoryDelay_ns, executionTime_ms))

        # import pprint
        # pprint.pprint(r)

        return r

    def _plots_1(self) -> None:
        def plot(fname, title, data: Dict[int, List[Tuple[int, float]]]) -> None:
            figure: Figure = plt.figure()
            axes: Axes = figure.add_axes((0.1, 0.1, 0.8, 0.8))

            for peCount in sorted(data.keys()):
                l = data[peCount]
                x, y = list(zip(*l))
                axes.plot(x, y, label=f"peCount = {peCount}")

            axes.set_title(title)
            axes.loglog(base=2)
            axes.legend()
            axes.grid()

            axes.set_xlabel("Memory Latency (ns)")
            axes.set_ylabel("Execution Time (ms)")

            figure.savefig(self.path(f"{fname}.pdf"))

        d0 = self._parse_results()

        for dae, d1 in d0.items():
            for computeTime_ns, d2 in d1.items():
                fname = f"dae_{dae}_computeTime_ns_{computeTime_ns}"
                title = f"DAE = {dae}, computeTime_ns = {computeTime_ns}"

                plot(fname, title, d2)

    def _plots_2(self) -> None:
        d0 = self._parse_results()
        computeTime_ns = 128

        figure: Figure = plt.figure()
        axes: Axes = figure.add_axes((0.1, 0.1, 0.8, 0.8))

        xticks = [2 ** x for x in range(1, 14)]
        xticklabels = map(str, xticks)

        colors = ["red", "green", "blue", "orange"]
        peCount_v = list(sorted(d0[False][16].keys()))

        marker_dae = "."
        marker_no_dae = "v"

        markersize_dae = 10
        markersize_no_dae = 8

        def plot(marker: str, markersize: float, data: Dict[int, List[Tuple[int, float]]]) -> None:
            for peCount, color in zip(sorted(data.keys()), colors):
                l = data[peCount]
                x, y = list(zip(*l))
                axes.plot(
                    x, y, color=color, marker=marker,
                    markersize=markersize, linestyle="solid")

        plot(marker_dae, markersize_dae, d0[True][computeTime_ns])
        plot(marker_no_dae, markersize_no_dae, d0[False][computeTime_ns])

        axes.set_xlabel("Memory Latency (ns)")
        axes.set_ylabel("Execution Time (ms)")

        axes.semilogx(base=2)
        axes.semilogy()
        axes.grid()

        axes.set_xticks(xticks)
        axes.set_xticklabels(xticklabels)

        # create the custom legend
        def custom_legend():
            handles = []

            handles.append(mp_lines.Line2D(
                [], [], color="black", linestyle="none",
                marker=marker_dae, markersize=markersize_dae, label="DAE")
            )

            handles.append(mp_lines.Line2D(
                [], [], color="black", linestyle="none",
                marker=marker_no_dae, markersize=markersize_no_dae, label="Blocking")
            )

            for color, peCount in zip(colors, peCount_v):
                handles.append(mp_lines.Line2D(
                    [], [], color=color, linestyle="solid",
                    label=f"{peCount} PEs")
                )

            artist = plt.legend(handles=handles, loc=2)
            axes.add_artist(artist)

        custom_legend()

        figure.savefig(self.path(f"figure.pdf"))

    def process(self) -> None:
        self.makeDirs()

        # self._plots_1()
        self._plots_2()


if __name__ == "__main__":
    import sys
    BulkEntry.main(sys.argv[1:])
