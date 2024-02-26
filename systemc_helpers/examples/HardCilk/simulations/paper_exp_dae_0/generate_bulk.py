from typing import *  # type: ignore
from itertools import product
import os


def init() -> None:
    os.system("rm -rf ./bulk/")
    os.system("mkdir -p ./bulk/hdl")
    os.system("mkdir -p ./bulk/wrappers")


def getHardwareConfiguration(
        peCountExecute: int = 12,
        vssNumberExecute: int = 2) -> Dict:
    # encode the name
    name = "__".join([
        "paper_exp_dae_0",
        f"peCountExecute_{peCountExecute}",
        f"vssNumberExecute_{vssNumberExecute}",
    ])

    return {
        "fullSysGenName": name,
        "className": name,
        "taskList": [
            {
                "isRoot": True,
                "name": "execute",
                "type": "complete",
                "argBitSize": 64,
                "peCount": peCountExecute,
                "virtualStealServersNumber": vssNumberExecute,
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
            "execute": ["execute"]
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
        bulk.TypeNameMappedName("paper_exp_dae_0::pe_execute", "execute_pe")
    )

    hwConfs.processorTypeName = "paper_exp_dae_0::Processor"
    hwConfs.wrapperInclude = '"{}.hpp"'
    hwConfs.namespace = "paper_exp_dae_0"
    hwConfs.factoriesSelfHppInclude = '"factories.hpp"'
    hwConfs.factoriesWrapperInclude = '"wrappers/{}.hpp"'
    hwConfs.pathOutputDirHardware = "./bulk/hdl"
    hwConfs.pathOutpurDirWrappers = "./bulk/wrappers"
    hwConfs.pathOutputHpp = "./bulk/factories.hpp"
    hwConfs.pathOutputCpp = "./bulk/factories.cpp"

    hwConfs.cppIncludes.append("<pe_execute.hpp>")
    hwConfs.cppIncludes.append("<processor.hpp>")

    # add more hardware configurations here
    peCountExecute_v = [1, 2, 4, 8]
    vssNumberExecute_v = [1]

    # make sure that the order of variables matches the argument list
    for x in product(peCountExecute_v, vssNumberExecute_v):
        hwConfs.append(getHardwareConfiguration(*x))

    hwConfs.write()


if __name__ == "__main__":
    main()
