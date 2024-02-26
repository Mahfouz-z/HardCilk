from stager import *
from fsobj import *
from .codegen import ChiselCodegen
from typing import Callable
from dataclasses import dataclass
from pathlib import Path
from utils.resources import ModuleResources

_res = ModuleResources(__file__, "res")


@dataclass(frozen=True)
class VivadoTimingAnalysis(Task):
    module: object
    module_name: str
    part_name: str

    @Stage.factory
    def stage(self, stageman: StageManager) -> Stage:
        return _Stage(stageman, self).depends(
            ChiselCodegen(self.module, self.module_name).stage(stageman)
        )


class _Stage(Stage):
    def __init__(self, stageman: StageManager, task: "Task") -> None:
        super().__init__(stageman, task)
        self.task: VivadoTimingAnalysis

        rootnode: Node = stageman.config["rootNode"]
        modulenode: Node = rootnode.child(self.task.module)
        partnode: Node = modulenode.child(self.task.part_name)
        self._workingdir: Path = partnode.path

        self._checkexecuted(self._workingdir / "vivadotiming.done")

    @property
    def workingdir(self) -> Path:
        return self._workingdir

    def clean(self) -> None:
        super().clean()
        (self.workingdir / "hdl").unlink(missing_ok=True)

        generated_files = [
            "synthesize.tcl",
            "period.xdc",
            "syn.log",
            "utilization.postsyn.rpt",
            "timing.postsyn.rpt",
            "opt.log",
            "place.log",
            "phyopt1.log",
            "route.log",
            "phyopt2.log",
            "utilization.postpr.rpt",
            "timing.postpr.rpt",
            "vivadotiming.done"
        ]

        # also remove the journal files later

        for f in generated_files:
            ff = self.workingdir / f
            ff.unlink(missing_ok=True)

    def prepare(self) -> None:
        super().prepare()

        (self.workingdir / "hdl").symlink_to("..")

        maxthreads = self.stageman.config.get("vivadoMaxThreads", 8)

        synthesize_tcl = _res.text("vivadotiming.synthesize.tcl")
        period_xdc = _res.text("vivadotiming.period.xdc")

        with open(self.workingdir / "synthesize.tcl", "w") as f:
            f.write("# variables\n")
            f.write(f"set MAXTHREADS {maxthreads}\n")
            f.write(f"set TOP \"{self.task.module_name}\"\n")
            f.write(f"set PART \"{self.task.part_name}\"\n")
            f.write("\n")
            f.write("# synthesis\n")
            f.write(synthesize_tcl + "\n")

        with open(self.workingdir / "period.xdc", "w") as f:
            f.write(period_xdc)

    def execute(self) -> None:
        super().execute()

        vivado: Callable[[Path, Path], None] = self.stageman.config["vivadoCommand"]
        vivado("synthesize.tcl", self.workingdir)
