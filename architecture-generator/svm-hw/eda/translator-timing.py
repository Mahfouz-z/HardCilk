from modules import *
from typing import *
from fsobj import *
from stager import *
from tasks import VivadoTimingAnalysis
from vivado import BatchRun
from typing import Iterator, Any


def parts() -> Iterator[str]:
    yield "xcu280-fsvh2892-2L-e"  # alveo u280, ultrascale+ hbm
    yield "xc7k160tfbg484-2"  # kintex 7
    yield "xc7vx690tffg1157-3"  # virtex 7


def modules() -> Iterator[Any]:
    for numEntries in [8, 16, 32, 64, 128]:
        for logPageSize in [12, 16, 21, 30]:
            for cfgAxi in [
                # axi4.Config(wAddr=64, wId=8, wData=64),

                # 128-bits because HBM
                axi4.Config(wAddr=64, wId=8, wData=128)
            ]:
                yield axi4.tlb.Translator(
                    numEntries, logPageSize, cfgAxi)


def main():
    objectstore = ObjectStore("./artifacts")
    stageman = StageManager(cfg={
        "doClean": False,  # set to True to remove all the generated files first
        "rootNode": objectstore.frompath("translator"),
        "chiselServer": {
            "address": "127.0.0.1",
            "portnumber": 9100
        },
        "vivadoCommand": BatchRun("vivado")
    })

    for part in parts():
        for module in modules():
            VivadoTimingAnalysis(module, "Translator", part).stage(stageman)

    # all the necessary paths are created, output them to the disk
    objectstore.todisk()

    with StageExecutor(stageman) as exec:
        exec.run()


if __name__ == "__main__":
    main()
