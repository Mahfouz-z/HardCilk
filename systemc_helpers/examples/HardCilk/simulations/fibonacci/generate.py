import flexitask

desc = {
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


def main() -> None:
    connections = flexitask.hdl.emit_verilog(desc, "./hdl")
    flexiTaskSystem = flexitask.wrapper.elaborate(
        flexitask.wrapper.from_dict(desc),
        connections
    )

    moduleOptions = flexitask.wrapper.ModuleOptions(
        moduleName="Vfibonacci",
        className="VerilatedTlmModule",
        namespace="fibonacci",
        hppInclude="\"verilated.hpp\""
    )

    module = flexitask.wrapper.to_module(flexiTaskSystem, moduleOptions)
    hpp, cpp = module.generate()

    with open("src/verilated.cpp", "w") as f:
        f.write(cpp)

    with open("include/verilated.hpp", "w") as f:
        f.write(hpp)


if __name__ == "__main__":
    main()
