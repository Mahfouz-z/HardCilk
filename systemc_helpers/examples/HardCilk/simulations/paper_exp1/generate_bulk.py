from typing import *  # type: ignore
from itertools import product
import os


def init() -> None:
    os.system("rm -rf ./bulk/")
    os.system("mkdir -p ./bulk/hdl")
    os.system("mkdir -p ./bulk/wrappers")


def getHardwareConfiguration(
        peCount: int = 24,
        vssNumber: int = 5) -> Dict:
    # encode the name
    name = "__".join([
        "paper_exp2",
        f"peCount_{peCount}",
        f"vssNumber_{vssNumber}"
    ])

    return {
        "fullSysGenName": name,
        "className": name,
        "taskList": [
            {
                "isRoot": True,
                "name": "task",
                "type": "complete",
                "argBitSize": 32,
                "peCount": peCount,
                "virtualStealServersNumber": vssNumber,
                "stealQueueSize": 32,
                "virtualStealQueueSize": 10000000,
                "continuationServersNumber": 0,
                "continuationQueueSize": 0,
                "virtualContinuationQueueSize": 0,
                "argRouteServersNumber": 0,
                "argRouteServersQueueSize": 0
            }
        ],
        "spawnList": {
            "task": ["task"]
        },
        "spawnNextList": {
        },
        "sendArgumentList": {
        },
        "systemAddressWidth": 64,
        "continuationCounterWidth": 32
    }


def main() -> None:
    init()
    from flexitask import bulk

    hwConfs = bulk.HardwareConfigurations()

    hwConfs.processingElementTypes.append(
        bulk.TypeNameMappedName("paper_exp1::task_pe", "task_pe")
    )

    hwConfs.processorTypeName = "paper_exp1::Processor"
    hwConfs.wrapperInclude = '"{}.hpp"'
    hwConfs.namespace = "paper_exp1"
    hwConfs.factoriesSelfHppInclude = '"factories.hpp"'
    hwConfs.factoriesWrapperInclude = '"wrappers/{}.hpp"'
    hwConfs.pathOutputDirHardware = "./bulk/hdl"
    hwConfs.pathOutpurDirWrappers = "./bulk/wrappers"
    hwConfs.pathOutputHpp = "./bulk/factories.hpp"
    hwConfs.pathOutputCpp = "./bulk/factories.cpp"

    hwConfs.cppIncludes.append("<task_pe.hpp>")
    hwConfs.cppIncludes.append("<processor.hpp>")

    # add more hardware configurations here
    # peCount_v = [8, 16, 32]
    # vssNumber_v = [6]

    experiments_list = [(28,1), (8,1), (16,1), (32,1), (64,2), (128,4), (256,8)] #(peCount, vssNumber)
    
    # make sure that the order of variables matches the argument list
    for x in experiments_list:
        hwConfs.append(getHardwareConfiguration(*x))

    hwConfs.write()


if __name__ == "__main__":
    main()
