from . import *


def main() -> None:
    print("flexitask.bulk test")

    import copy

    hwConfs = HardwareConfigurations()

    hwConfs.processingElementTypes.append(
        TypeNameMappedName("fibonacci::fib_pe", "fib_pe"))
    hwConfs.processingElementTypes.append(
        TypeNameMappedName("fibonacci::sum_pe", "sum_pe"))

    hwConfs.processorTypeName = "fibonacci::Processor"
    hwConfs.generatedClassName = "Fibonacci__N_{}"
    hwConfs.generatedClassInclude = '"{}.hpp"'
    hwConfs.namespace = "myNamespace"
    hwConfs.factoriesSelfHppInclude = '"factories.hpp"'
    hwConfs.pathOutputDirHardware = "/home/devel/test/hdl"
    hwConfs.pathOutpurDirWrappers = "/home/devel/test/wrappers"
    hwConfs.pathOutputHpp = "/home/devel/test/factories.hpp"
    hwConfs.pathOutputCpp = "/home/devel/test/factories.cpp"

    baseDesc = {
        "fullSysGenName": "fibonacci",
        "taskList": [
            {
                "isRoot": True,
                "name": "fib",
                "type": "complete",
                "argBitSize": 128,
                "peCount": 5,
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
                "peCount": 5,
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

    # for some reason, the architecture generator fails with this one
    # baseDesc["taskList"][0]["peCount"] = 2
    # baseDesc["className"] = "fibonacci_n2"
    # hwConfs.append(copy.deepcopy(baseDesc))

    baseDesc["taskList"][0]["peCount"] = 4
    baseDesc["className"] = "fibonacci_n4"
    hwConfs.append(copy.deepcopy(baseDesc))

    baseDesc["taskList"][0]["peCount"] = 8
    baseDesc["className"] = "fibonacci_n8"
    hwConfs.append(copy.deepcopy(baseDesc))

    baseDesc["taskList"][0]["peCount"] = 16
    baseDesc["className"] = "fibonacci_n16"
    hwConfs.append(copy.deepcopy(baseDesc))

    hwConfs.write()


main()
