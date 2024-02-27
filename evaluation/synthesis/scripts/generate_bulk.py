from typing import *  # type: ignore
from itertools import product
import os
import hardcilk.hdl as hdl


def init() -> None:
    os.system("rm -rf ./hdl/")


def getHardwareConfiguration(
        peCount: int = 24,
        vssNumber: int = 1,
        vcasNumber: int = 1,
        arsNumber: int = 1) -> Dict:
    # encode the name
    name = "fullSysGen"

    return {
        "fullSysGenName": name,
        "taskList": [
            {
                "isRoot": True,
                "name": "task",
                "type": "continuation",
                "argBitSize": 256,
                "peCount": peCount,
                "virtualStealServersNumber": vssNumber,
                "stealQueueSize": 32,
                "virtualStealQueueSize": 100000,
                "continuationServersNumber": vcasNumber,
                "continuationQueueSize": 8,
                "virtualContinuationQueueSize": int(10000000/vcasNumber),
                "argRouteServersNumber": arsNumber,
                "argRouteServersQueueSize": 32
            }
        ],
        "spawnList": {
            "task": ["task"]
        },
        "spawnNextList": {
            "task": ["task"]
        },
        "sendArgumentList": {
            "task": ["task"]
        },
        "systemAddressWidth": 64,
        "continuationCounterWidth": 32
    }


def main() -> None:
    init()

    # add more hardware configurations here
    peCount_v = [8, 16, 32, 64, 128]
    vssNumber_v = [1]
    vcasNumber_v = [1]
    arsNumber_v = [2]

    # make sure that the order of variables matches the argument list
    for x in product(peCount_v, vssNumber_v, vcasNumber_v, arsNumber_v):
        config = getHardwareConfiguration(*x)
        dir = "hdl_" + "_".join([str(xx) for xx in x])
        hdl.emit_verilog(config, f"./hdl/{dir}")
        os.system(f"ln -s ../../constraints.xdc ./hdl/{dir}/constraints.xdc")


if __name__ == "__main__":
    print("Please run this script from the $repo_root/synthesis directory!")
    print("Please note that the server should be executed in the Synthesis mode.")
    print('Use the following command to do so: HARDCILK_GENERATION_TYPE=Synthesis sbt "runMain fullSysGen.ServerEmitter"')

    main()
