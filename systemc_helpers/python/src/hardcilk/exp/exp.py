import dataclasses
import concurrent.futures
import os
import argparse
import time
import datetime
import subprocess
import abc
import importlib.util
import sys
from typing import *  # type: ignore


def _check_arguments(parameters: Dict[str, type], arguments: Dict[str, Any]) -> None:
    msg = f"Arguments and parameters do not match: parameters = {parameters}, arguments = {arguments}"
    assert list(sorted(parameters.keys())) == \
        list(sorted(arguments.keys())), \
        msg

    for name, type in parameters.items():
        assert isinstance(arguments[name], type), msg


@dataclasses.dataclass(frozen=True)
class Simulation:
    name: str
    executable: str
    parameters: Dict[str, type] = dataclasses.field(default_factory=dict)
    extraArguments: List[Any] = dataclasses.field(default_factory=list)


@dataclasses.dataclass(frozen=True)
class Experiment:
    simulationName: str
    arguments: Dict[str, Any] = dataclasses.field(default_factory=dict)
    extraArguments: List[Any] = dataclasses.field(default_factory=list)
    stdin: List[str] = dataclasses.field(default_factory=list)

    def _encode_name(self) -> str:
        # TODO encode it better
        # TODO PATH_MAX might be a problem
        # TODO find a "short" and nice encoding

        l = [self.simulationName]

        for name, value in self.arguments.items():
            l.append(f"{name}_{value}")

        return "__".join(l)


_EXPERIMENT_JSON = "_EXPERIMENT.json"
_SIMULATION_JSON = "_SIMULATION.json"
_COMPLETED = "__COMPLETED"
_STDIN = "__STDIN"
_STDOUT = "__STDOUT"
_STDERR = "__STDERR"


class ExperimentWrapper:
    def __init__(self, context: "Context", experimentDir: str, experiment: Optional[Experiment]) -> None:
        assert experimentDir.endswith("/")
        os.makedirs(experimentDir, exist_ok=True)

        self._context = context
        self._experimentDir = experimentDir

        if experiment is None:
            self._experiment = self._load_experiment()
        else:
            self._experiment = experiment
            self._write_experiment(experiment)

        self._experiment: Experiment
        self._simulation: Simulation = \
            context.getSimulation(self._experiment.simulationName)
        self._write_simulation(self._simulation)

        _check_arguments(
            self._simulation.parameters,
            self._experiment.arguments)

    def run(self) -> None:
        args: List[str] = []

        execPath = os.path.abspath(
            f"{self.context.executablesDir}{self.simulation.executable}"
        )

        args.append(execPath)

        for name, value in self.experiment.arguments.items():
            args.append(f"--{name}")
            args.append(str(value))

        for arg in self.experiment.extraArguments:
            args.append(str(arg))

        for arg in self.simulation.extraArguments:
            args.append(str(arg))

        with open(self.path(_STDIN), "w") as stdin:
            stdin.writelines(self.experiment.stdin)

        with open(self.path(_STDIN), "r") as stdin:
            with open(self.path(_STDOUT), "w+") as stdout:
                with open(self.path(_STDERR), "w+") as stderr:
                    a_s = time.time()
                    a_dt = datetime.datetime.now()

                    process = subprocess.Popen(
                        args,
                        stdin=stdin,
                        stdout=stdout,
                        stderr=stderr,
                        shell=False,
                        cwd=self.experimentDir
                    )

        returnCode = process.wait()

        if returnCode != 0:
            print(f"WARNING: returnCode != 0 for {self.experiment}")

        b_s = time.time()
        b_dt = datetime.datetime.now()

        delta = b_s - a_s

        lines = [
            f"started: timestamp = {a_s} s ; date+time = {a_dt}",
            f"completed: timestamp = {b_s} s ; date+time = {b_dt}",
            f"delta = {delta} s",
            f"returnCode = {returnCode}",
            "========",
            ""
        ]

        with open(self.path(_COMPLETED), "w+") as completed:
            completed.write("\n".join(lines))

    @property
    def context(self) -> "Context":
        return self._context

    @property
    def isCompleted(self) -> bool:
        return os.path.exists(self.path(_COMPLETED))

    def reset(self) -> None:
        def rm(fname: str) -> None:
            fpath = self.path(fname)
            if os.path.exists(fpath):
                os.remove(fpath)

        rm(_COMPLETED)
        rm(_STDERR)
        rm(_STDOUT)
        rm(_EXPERIMENT_JSON)
        rm(_SIMULATION_JSON)

    @property
    def experimentDir(self) -> str:
        return self._experimentDir

    @property
    def experiment(self) -> Experiment:
        return self._experiment

    @property
    def simulation(self) -> Simulation:
        return self._simulation

    def readStdOut(self) -> List[str]:
        return self.readTextFile(_STDOUT)

    def readStdErr(self) -> List[str]:
        return self.readTextFile(_STDERR)

    def readTextFile(self, fname: str) -> List[str]:
        """
        Reads the lines of a text file located in the experiment directory.
        """
        with open(self.path(fname), "r") as f:
            return f.readlines()

    def path(self, fname: str, /) -> str:
        """
        Creates a file path from the given file name (relative to the experiment directory).
        """
        return f"{self.experimentDir}{fname}"

    def _load_experiment(self) -> Experiment:
        import json
        with open(self.path(_EXPERIMENT_JSON), "r") as f:
            d: Dict = json.load(f)
            return Experiment(**d)

    def _write_experiment(self, experiment: Experiment) -> None:
        if os.path.exists(self.path(_EXPERIMENT_JSON)):
            # it is already written
            return

        import json

        with open(self.path(_EXPERIMENT_JSON), "w") as f:
            json.dump(dataclasses.asdict(experiment), f)

    def _write_simulation(self, simulation: Simulation) -> None:
        if os.path.exists(self.path(_SIMULATION_JSON)):
            # it is already written
            return

        import json

        with open(self.path(_SIMULATION_JSON), "w") as f:
            d = dataclasses.asdict(simulation)

            # TODO find a better way to encode types
            dd: Dict[str, Any] = d["parameters"]
            for name, value in dd.items():
                dd[name] = str(value)

            json.dump(d, f)


class Context:
    def __init__(self, experimentsDir: str = "./run/", executablesDir: str = "./run/bin/") -> None:

        self._simulations: Dict[str, Simulation] = {}
        self._experiments: List[Experiment] = []
        self._experimentsDir: str = experimentsDir
        self._executablesDir: str = executablesDir

        self._groups: Dict[str, List] = {}
        self._current_group: Optional[List] = None

    def addSimulation(self, simulation: Simulation) -> None:
        assert simulation.name not in self._simulations, f"Simulation with the same name already added: {simulation.name}"
        self._simulations[simulation.name] = simulation

    def getSimulation(self, simulation_name: str) -> Simulation:
        return self._simulations[simulation_name]

    def beginGroup(self, name: str) -> None:
        assert name not in self._groups, f"Group with the same name already added: {name}"
        l = []
        self._groups[name] = l
        self._current_group = l

    def endGroup(self) -> None:
        self._current_group = None

    def group(self, name: str) -> List:
        return self._groups[name]

    def addExperiments(self, experiments: Iterable[Experiment]) -> None:
        assert all(
            [x.simulationName in self._simulations for x in experiments]
        ), "Simulations of some experiments are not known (add them first?)."

        self._experiments.extend(experiments)

        if self._current_group is not None:
            self._current_group.extend(experiments)

    @property
    def experimentsDir(self) -> str:
        return self._experimentsDir

    @property
    def executablesDir(self) -> str:
        return self._executablesDir

    def run(
            self,
            force: bool = False,
            experiments: Optional[List[Experiment]] = None,
            group: Optional[str] = None,
            executor: concurrent.futures.Executor = concurrent.futures.ThreadPoolExecutor()) -> None:
        """
        Runs the experiments.
        """
        futures: Dict[concurrent.futures.Future, Experiment] = {}

        for e in self.experiments(experiments, group):
            if not e.isCompleted or force:
                futures[executor.submit(e.run)] = e.experiment

        for future, experiment in futures.items():
            try:
                # waits
                future.result()
                print(f"Experiment completed: {experiment}")
            except Exception as exc:
                print(f"Exception while executing {experiment}: {exc}")

    def experiments(
            self,
            experiments: Optional[List[Experiment]] = None,
            group: Optional[str] = None) -> List[ExperimentWrapper]:

        def process(experiments: List[Experiment]) -> List[ExperimentWrapper]:
            l: List[ExperimentWrapper] = []
            for experiment in experiments:
                experimentsDir = f"{self.experimentsDir}{experiment._encode_name()}/"
                l.append(ExperimentWrapper(self, experimentsDir, experiment))

            return l

        if experiments is not None:
            return process(experiments)

        if group is not None:
            return process(self._groups[group])

        return process(self._experiments)


class EntryBase(abc.ABC):
    """
    Entry point for the experiment.
    """

    NAME = "run_experiment"

    def __init__(self, context: Context = Context(), resultsDir: str = "./run/results/") -> None:
        super().__init__()

        assert resultsDir.endswith("/")

        self._context = context
        self._resultsDir = resultsDir

    @property
    def context(self) -> Context:
        return self._context

    @property
    def resultsDir(self) -> str:
        return self._resultsDir

    @abc.abstractmethod
    def register(self) -> None:
        """
        Adds simulations and experiments.
        """

    @abc.abstractmethod
    def process(self) -> None:
        """
        After the experiments are executed, this function processes the experiment results.
        """

    @classmethod
    def main(cls, argv: List[str]) -> None:
        p = argparse.ArgumentParser(prog=cls.NAME)

        # fmt: off
        p.add_argument("--experiments-dir", help="Directory to save experiment outputs.", required=False, default="./run/")
        p.add_argument("--executables-dir", help="Directory for the executables of the simulations.", required=False, default="./run/bin/")
        p.add_argument("--results-dir", help="Directory to save processed results.", default="./run/results/")
        p.add_argument("--num-workers", help="Number of parallel workers to run the experiments.", required=False, default=2, type=int)
        p.add_argument("--force", help="Force runs the experiments, even if there are experiment files generated.", required=False, default=False, action="store_true")
        p.add_argument("--run", help="Runs experiments.", required=False, default=False, action="store_true")
        p.add_argument("--process", help="Processes results.", required=False, default=False, action="store_true")
        # fmt: on

        args = p.parse_args(argv)

        context = Context(args.experiments_dir, args.executables_dir)
        entry = cls(context, args.results_dir)

        entry.makeDirs()

        entry.register()

        print("Hello, this is the default main function of the Entry.")

        if args.run:
            print("running")

            threadPoolExecutor = concurrent.futures.ThreadPoolExecutor(
                max_workers=args.num_workers
            )
            context.run(force=args.force, executor=threadPoolExecutor)

        if args.process:
            print("processing")
            entry.process()

        print("bye")

    def path(self, fname: str) -> str:
        """
        Creates a file path from the given file name (relative to the results directory).
        """
        return f"{self._resultsDir}{self.NAME}/{fname}"

    def makeDirs(self) -> None:
        """
        Makes the directories for the experiment results.
        """
        os.makedirs(self.resultsDir, exist_ok=True)
        os.makedirs(self.path(""), exist_ok=True)
        os.makedirs(self.context.experimentsDir, exist_ok=True)
        os.makedirs(self.context.executablesDir, exist_ok=True)


_loaded_modules = 0


def _load_module_external(fpath_pyfile) -> object:
    global _loaded_modules
    # see: https://stackoverflow.com/questions/2349991/how-do-i-import-other-python-files
    module_name = f"__external_module_{_loaded_modules}"

    spec = importlib.util.spec_from_file_location(module_name, fpath_pyfile)

    assert spec is not None
    module = importlib.util.module_from_spec(spec)

    sys.modules[module_name] = module

    assert spec.loader is not None
    spec.loader.exec_module(module)

    _loaded_modules += 1
    return module


class BulkEntryBase(EntryBase):
    """
    Entry point for a batch of different simulations.
    """

    def __init__(self, context: Context = Context(), resultsDir: str = "./results/") -> None:
        super().__init__(context, resultsDir)

        self._entries: List[EntryBase] = []

    def addEntry(self, entry_fn: Callable[[Context, str], EntryBase]) -> None:
        self._entries.append(entry_fn(self.context, self.resultsDir))

    def addEntryExternal(self, fpathPyFile: str) -> None:
        self.addEntry(_load_module_external(fpathPyFile).Entry)  # type: ignore

    @property
    def entries(self) -> Iterator[EntryBase]:
        return iter(self._entries)

    def register(self) -> None:
        for entry in self.entries:
            entry.register()

    def process(self) -> None:
        for entry in self.entries:
            entry.process()


__all__ = [
    "Simulation",
    "Experiment",
    "ExperimentWrapper",
    "Context",
    "EntryBase",
    "BulkEntryBase"
]
