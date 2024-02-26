from typing import *  # type: ignore
from itertools import product
import os


def init() -> None:
    os.system("rm -rf ./bulk/")
    os.system("mkdir -p ./bulk/hdl")
    os.system("mkdir -p ./bulk/wrappers")


def getHardwareConfiguration(
        peCount: int = 24,
        vssNumber: int = 5,
        vcasNumber: int = 1,
        arsNumber: int = 8) -> Dict:
    # encode the name
    name = "__".join([
        "paper_exp2",
        f"peCount_{peCount}",
        f"vssNumber_{vssNumber}",
        f"vcasNumber_{vcasNumber}",
        f"arsNumber_{arsNumber}"
    ])

    return {
        "fullSysGenName": name,
        "className": name,
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
    from flexitask import bulk

    hwConfs = bulk.HardwareConfigurations()

    hwConfs.processingElementTypes.append(
        bulk.TypeNameMappedName("paper_exp2::task_pe", "task_pe")
    )

    hwConfs.processorTypeName = "paper_exp2::Processor"
    hwConfs.wrapperInclude = '"{}.hpp"'
    hwConfs.namespace = "paper_exp2"
    hwConfs.factoriesSelfHppInclude = '"factories.hpp"'
    hwConfs.factoriesWrapperInclude = '"wrappers/{}.hpp"'
    hwConfs.pathOutputDirHardware = "./bulk/hdl"
    hwConfs.pathOutpurDirWrappers = "./bulk/wrappers"
    hwConfs.pathOutputHpp = "./bulk/factories.hpp"
    hwConfs.pathOutputCpp = "./bulk/factories.cpp"

    hwConfs.cppIncludes.append("<task_pe.hpp>")
    hwConfs.cppIncludes.append("<processor.hpp>")

    # add more hardware configurations here
    peCount_v = [8, 16, 32]
    vssNumber_v = [6]
    vcasNumber_v = [1]
    arsNumber_v = [8]

    experiments_list = [(28, 1, 1, 8), 
                        (8, 1, 1, 8), 
                        (16, 1, 1, 8), 
                        (32, 1, 1, 8), 
                        (64, 2, 2, 8), 
                        (128, 4, 4, 8), 
                        (256, 8, 8, 8),
                        (28, 1, 1, 2),
                        (28, 1, 1, 4),
                        (28, 1, 1, 16),
                        ] #(peCount, vssNumber, vcasNumber, argRouteServersNumber)
    #experiments_list = [(64, 2, 1, 8)]
    # make sure that the order of variables matches the argument list
    for x in experiments_list:
        hwConfs.append(getHardwareConfiguration(*x))

    hwConfs.write()


if __name__ == "__main__":
    main()
