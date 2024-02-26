from pathlib import Path
import subprocess
from typing import Optional
from dataclasses import dataclass
from stager import *


@dataclass(frozen=True)
class BatchRun:
    vivadocmd: str = "vivado"

    def __call__(
            self,
            tclfile: Path,
            workingdir: Optional[Path] = None
    ) -> None:
        if workingdir is None:
            workingdir = Path(".")
        
        with open(workingdir / "vivado.out", "w") as fout:
            with open(workingdir / "vivado.err", "w") as ferr:
                subprocess.run(
                    [self.vivadocmd, "-mode", "batch", "-source", tclfile],
                    cwd=workingdir,
                    stdout=fout,
                    stderr=ferr
                )

