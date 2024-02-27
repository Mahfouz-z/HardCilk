from typing import *  # type: ignore
import os


def init() -> None:
    os.system("rm -rf ./bulk/")
    os.system("mkdir -p ./bulk/hdl")
    os.system("mkdir -p ./bulk/wrappers")


def getHardwareConfiguration(
        peCountFib: int = 1,
        peCountSum: int = 1) -> Dict:
    name = f"fibonacci__peCountFib_{peCountFib}__peCountSum_{peCountSum}"
    return {
        "fullSysGenName": name,
        "className": name,
        "taskList": [
            {
                "isRoot": True,
                "name": "fib",
                "type": "complete",
                "argBitSize": 128,
                "peCount": peCountFib,
                "virtualStealServersNumber": 4,
                "stealQueueSize": 32,
                "virtualStealQueueSize": 16384,
                "continuationServersNumber": 0,
                "continuationQueueSize": 0,
                "virtualContinuationQueueSize": 0,
                "argRouteServersNumber": 0,
                "argRouteServersQueueSize": 0
            },
            {
                "isRoot": False,
                "name": "sum",
                "type": "continuation",
                "argBitSize": 256,
                "peCount": peCountSum,
                "virtualStealServersNumber": 1,
                "stealQueueSize": 32,
                "virtualStealQueueSize": 16384,
                "continuationServersNumber": 1,
                "continuationQueueSize": 8,
                "virtualContinuationQueueSize": 16384,
                "argRouteServersNumber": 4,
                "argRouteServersQueueSize": 32
            }
        ],
        "spawnList": {
            "fib": ["fib"]
        },
        "spawnNextList": {
            "fib": ["sum"]
        },
        "sendArgumentList": {
            "fib": ["sum"],
            "sum": ["sum"]
        },
        "systemAddressWidth": 64,
        "continuationCounterWidth": 32
    }


def main() -> None:
    init()
    from hardcilk import bulk

    hwConfs = bulk.HardwareConfigurations()

    hwConfs.processingElementTypes.append(
        bulk.TypeNameMappedName("fibonacci::fib_pe", "fib_pe"))
    hwConfs.processingElementTypes.append(
        bulk.TypeNameMappedName("fibonacci::sum_pe", "sum_pe"))

    hwConfs.processorTypeName = "fibonacci::Processor"
    hwConfs.wrapperInclude = '"{}.hpp"'
    hwConfs.namespace = "fibonacci"
    hwConfs.factoriesSelfHppInclude = '"factories.hpp"'
    hwConfs.factoriesWrapperInclude = '"wrappers/{}.hpp"'
    hwConfs.pathOutputDirHardware = "./bulk/hdl"
    hwConfs.pathOutpurDirWrappers = "./bulk/wrappers"
    hwConfs.pathOutputHpp = "./bulk/factories.hpp"
    hwConfs.pathOutputCpp = "./bulk/factories.cpp"

    hwConfs.cppIncludes.append("<fib_pe.hpp>")
    hwConfs.cppIncludes.append("<sum_pe.hpp>")
    hwConfs.cppIncludes.append("<processor.hpp>")

    for peCount in [4, 8, 16, 32]:
        # note: I do not know why this one fails for peCount
        # is equal to 1 and 2.
        hwConfs.append(getHardwareConfiguration(peCount, peCount))

    hwConfs.write()


if __name__ == "__main__":
    main()
