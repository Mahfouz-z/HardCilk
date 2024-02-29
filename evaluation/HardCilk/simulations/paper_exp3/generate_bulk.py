from typing import *  # type: ignore
from itertools import product
import os


def init() -> None:
    os.system("rm -rf ./bulk/")
    os.system("mkdir -p ./bulk/hdl")
    os.system("mkdir -p ./bulk/wrappers")


def getHardwareConfiguration(
        peCount1: int = 12,
        vssNumber1: int = 2,
        peCount2: int = 12,
        vssNumber2: int = 2) -> Dict:
    # encode the name
    name = "__".join([
        "paper_exp3",
        f"peCount1_{peCount1}",
        f"vssNumber1_{vssNumber1}",
        f"peCount2_{peCount2}",
        f"vssNumber2_{vssNumber2}",
    ])

    return {
        "fullSysGenName": name,
        "className": name,
        "taskList": [
            {
                "isRoot": True,
                "name": "task1Exp3",
                "type": "complete",
                "argBitSize": 32,
                "peCount": peCount1,
                "virtualStealServersNumber": vssNumber1,
                "stealQueueSize": 32,
                "virtualStealQueueSize": 10000000,
                "continuationServersNumber": 0,
                "continuationQueueSize": 0,
                "virtualContinuationQueueSize": 0,
                "argRouteServersNumber": 0,
                "argRouteServersQueueSize": 0
            },
            {
                "isRoot": False,
                "name": "task2Exp3",
                "type": "complete",
                "argBitSize": 32,
                "peCount": peCount2,
                "virtualStealServersNumber": vssNumber2,
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
            "task1Exp3": ["task1Exp3", "task2Exp3"]
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
    from hardcilk import bulk

    hwConfs = bulk.HardwareConfigurations()

    hwConfs.processingElementTypes.append(
        bulk.TypeNameMappedName("paper_exp3::task1Exp3_pe", "task1Exp3_pe")
    )
    
    hwConfs.processingElementTypes.append(
        bulk.TypeNameMappedName("paper_exp3::task2Exp3_pe", "task2Exp3_pe")
    )

    hwConfs.processorTypeName = "paper_exp3::Processor"
    hwConfs.wrapperInclude = '"{}.hpp"'
    hwConfs.namespace = "paper_exp3"
    hwConfs.factoriesSelfHppInclude = '"factories.hpp"'
    hwConfs.factoriesWrapperInclude = '"wrappers/{}.hpp"'
    hwConfs.pathOutputDirHardware = "./bulk/hdl"
    hwConfs.pathOutpurDirWrappers = "./bulk/wrappers"
    hwConfs.pathOutputHpp = "./bulk/factories.hpp"
    hwConfs.pathOutputCpp = "./bulk/factories.cpp"

    hwConfs.cppIncludes.append("<task1_exp3_pe.hpp>")
    hwConfs.cppIncludes.append("<task2_exp3_pe.hpp>")
    hwConfs.cppIncludes.append("<processor.hpp>")

    # add more hardware configurations here
    # peCount1_v = [12]
    # vssNumber1_v = [2]
    # peCount2_v = [12]
    # vssNumber2_v = [2]

    experiments_list = [     
                            # Experiment for efficiency
                            (28, 1, 28, 1),     # 0

                            # Experiments for scalability
                            (8, 1, 8, 1),       # 1
                            (16, 1, 16, 1),     # 2
                            (32, 1, 32, 1),     # 3
                            (64, 1, 64, 1),     # 4
                            (128, 4, 128, 4),   # 5
                            (256, 8, 256, 8),   # 6


                            # This experiment to get T1 for different delays
                            (1,1,1,1),           # 7

                        ] #(peCount1, vssNumber1, peCount2, vssCount2)

    # make sure that the order of variables matches the argument list
    for x in experiments_list:
        hwConfs.append(getHardwareConfiguration(*x))

    hwConfs.write()


if __name__ == "__main__":
    main()
