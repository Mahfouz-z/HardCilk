from stager import *
from typing import List
from pathlib import Path
from chisel3.interface.net import connect as chisel3
from dataclasses import dataclass
from fsobj import *


@dataclass(frozen=True)
class ChiselCodegen(Task):
    """Represents a Chisel3 code generation task"""
    module: object
    module_name: str

    @Stage.factory
    def stage(self, stageman: StageManager) -> Stage:
        return _Stage(stageman, self)


class _Stage(Stage):
    def __init__(self, stageman: StageManager, task: ChiselCodegen) -> None:
        super().__init__(stageman, task)
        self.task: ChiselCodegen
        rootnode: Node = stageman.config["rootNode"]
        modulenode: Node = rootnode.child(task.module)
        self._workingdir: Path = modulenode.path

        self._checkexecuted(self._workingdir / "chiselcodegen.done")
    
    @property
    def workingdir(self) -> Path:
        return self._workingdir

    def clean(self) -> None:
        super().clean()
        self.task: ChiselCodegen

        todelete: List[Path] = [
            self.workingdir / (self.task.module_name + ".anno.json"),
            self.workingdir / (self.task.module_name + ".fir"),
            self.workingdir / (self.task.module_name + ".v"),
            self.workingdir / "chiselcodegen.done"
        ]
        for f in todelete:
            f.unlink(missing_ok=True)

    def prepare(self) -> None:
        super().prepare()

    def execute(self) -> None:
        super().execute()
        self.task: ChiselCodegen

        chiselServerConfig = self.stageman.config.get(
            "chiselServer", {"address": "127.0.0.1", "portnumber": 9100})

        chiselOptions = self.stageman.config.get("chiselOptions", [])

        with chisel3(**chiselServerConfig) as chisel:
            chisel.emitverilog(
                self.task.module,
                chiselOptions,
                self.task.module_name,
                self.workingdir
            )
            with open(self.workingdir / "chiselcodegen.done", "w") as f:
                f.write("done\n")
