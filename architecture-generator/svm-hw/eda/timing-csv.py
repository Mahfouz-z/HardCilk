from fsobj import *
from typing import *
from dataclasses import dataclass
from utils import csv
from modules import axi4
from pathlib import Path
import re

@dataclass
class TimingResult:
    part: str
    module: axi4.tlb.Translator
    slack: float  # ns
    req: float  # ns
    fmax: float  # MHz


def timing_to_csv(n: Node, fpath: Union[Path, str]) -> None:
    csvfile = csv.CSV()
    regex_slack = re.compile(r"Slack[^\d-]*([\d.-]+)ns")


    for n1 in n.children:
        module: axi4.tlb.Translator = n1.obj
        
        for n2 in n1.children:
            part: str = n2.obj

            with open(n2.path / "timing.postpr.rpt") as f:
                slack = float(regex_slack.findall(f.read())[0])
                period = 1.000  # ns
                req = period - slack
                fmax = 1000.000 / req
                csvfile.add_line(TimingResult(
                    part, module, slack, req, fmax
                ))
    
    with open(fpath, "w") as f:
        f.write(csvfile.header)
        f.write(csvfile.newline)
        f.write(csvfile.contents())

def main() -> None:
    objectstore = ObjectStore("./artifacts")
    timing_to_csv(objectstore.frompath("translator"), "translator-timing.csv")

if __name__ == "__main__":
    main()
