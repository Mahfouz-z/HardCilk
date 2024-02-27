#!/usr/bin/python3
# you should install the python package first
# cd into the python directory, run the following command:
# python3 -m pip install -e .

import re
from systemc_helpers import *
import dataclasses
import sys
import json
from enum import Enum
import cpp_dump

from typing import *

# mgmt -> axi lite
# full -> full


def _addr_field():
    return cpp_dump.Config(
        intFormat="addr_type(0x{:016x}ull)",
        intType="addr_type"
    ).field(default=None)


def _connections_field():
    return cpp_dump.Config(
        tupleFormat="std::pair<std::string, std::string>"
    ).field(default=None)


class InterfaceProtocol(Enum):
    Axi4 = "Axi4"
    Axi4lite = "Axi4lite"
    Axis = "Axis"


@dataclasses.dataclass
class Interface:
    name: str = None
    parent: str = None
    path: str = None

    # port name is used to connect sockets
    portName: str = None

    protocol: InterfaceProtocol = None
    isSlave: bool = None
    config: Union[AxisConfig, Axi4Config, Axi4liteConfig] = None


@dataclasses.dataclass
class VirtualStealServer:
    name: str = None
    parent: str = None
    path: str = None

    baseAddress: int = _addr_field()
    capacity: int = None

    numBytesTask: int = None

    pathInterface: str = None


@dataclasses.dataclass
class VirtualContinuationAddressServer:
    name: str = None
    parent: str = None
    path: str = None

    baseAddress: int = _addr_field()
    capacity: int = None

    numBytesCont: int = None

    pathInterface: str = None


@dataclasses.dataclass
class ProcessingElement:
    # each PE name should be unique, maybe based on taskName
    name: str = None
    parent: str = None
    path: str = None

    # used for interfacing with verilog
    portName: str = None

    interfaces: Dict[str, Interface] = None


@dataclasses.dataclass
class Task:
    name: str = None
    parent: str = None
    path: str = None

    isRoot: bool = None
    isCont: bool = None

    # should it bits or bytes?
    widthTask: int = None
    widthCont: int = None
    widthArg: int = None

    numProcessingElements: int = None
    processingElements: Dict[str, ProcessingElement] = None

    numVirtualStealServers: int = None
    capacityVirtualStealQueue: int = None
    virtualStealServers: Dict[str, VirtualStealServer] = None

    numVirtualContinuationServers: int = None
    capacityVirtualContinuationQueue: int = None
    virtualContinuationAddressServers: Dict[str,
                                            VirtualContinuationAddressServer] = None

    numArgRouteServers: int = None
    capacityArgRouteServers: int = None


@dataclasses.dataclass
class System:
    name: str = None
    parent: str = None
    path: str = None

    interfaces: Dict[str, Interface] = None


_REGEX_0 = r"(\S+)_(\S+)_(\S+)/(\S+) <--> (\S+); <(\S+)>"
_REGEX_1 = r"(\S+) <--> (\S+); <(\S+)>"


@dataclasses.dataclass
class HardCilkSystem:
    tasks: Dict[str, Task] = None
    system: System = None
    connections: List[Tuple[str, str]] = _connections_field()

    widthAddress: int = None
    widthContinuationCounter: int = None

    # maybe also have spawnList, spawnNextList, and sendArgumentList?
    # ...

    spawnList: Dict[str, List[str]] = None
    spawnNextList: Dict[str, List[str]] = None
    sendArgumentList: Dict[str, List[str]] = None

    # for servers
    managementBase: int = _addr_field()

    # for allocations
    heapBase: int = _addr_field()
    heapSize: int = _addr_field()

    isElaborated: bool = False

    def object_from_path(path: str) -> None:
        # can only have tasks.
        pass

    def from_dict(json: Dict) -> "HardCilkSystem":
        result = HardCilkSystem()

        result.widthAddress = json["systemAddressWidth"]
        result.widthContinuationCounter = json["continuationCounterWidth"]

        result.tasks = {}

        for json_task in json["taskList"]:
            taskName = json_task["name"]
            task = Task(
                name=taskName,
                parent="/tasks",
                path=f"/tasks/{taskName}",
                isRoot=json_task["isRoot"],
                isCont=(json_task["type"] == "continuation"),

                widthTask=int(json_task["argBitSize"]),
                widthCont=int(json_task["argBitSize"]),
                widthArg=int(json_task["argBitSize"]),
                # TODO are these three supposed to be the same all the time?

                numProcessingElements=json_task["peCount"],

                numVirtualStealServers=json_task["virtualStealServersNumber"],
                numVirtualContinuationServers=json_task["continuationServersNumber"],
                numArgRouteServers=json_task["argRouteServersNumber"],

                capacityVirtualStealQueue=json_task["virtualStealQueueSize"],
                capacityVirtualContinuationQueue=json_task["virtualContinuationQueueSize"],
                capacityArgRouteServers=json_task["argRouteServersQueueSize"]
            )

            result.tasks[task.name] = task

        result.system = System(name="system", parent="/",
                               path="/system", interfaces=[])

        result.spawnList = {}
        for name, targets in json["spawnList"].items():
            result.spawnList[name] = list(targets)

        result.spawnNextList = {}
        for name, targets in json["spawnNextList"].items():
            result.spawnNextList[name] = list(targets)

        result.sendArgumentList = {}
        for name, targets in json["sendArgumentList"].items():
            result.sendArgumentList[name] = list(targets)

        result.managementBase = json.get("managementBase", 0x3FF0_0000)

        result.heapBase = json.get("heapBase", 0x4000_0000)
        result.heapSize = json.get("heapSize", 0xC000_0000)

        return result

    def elaborate(self, connections_fpath: str = None) -> "HardCilkSystem":
        """
        This function returns an elaborated HardCilkSystem from a partial system description.
        """

        if self.isElaborated:
            return self

        self.isElaborated = True

        addr = self.managementBase

        for task in self.tasks.values():
            task.processingElements = {}
            task.virtualStealServers = {}
            task.virtualContinuationAddressServers = {}

            for i in range(task.numProcessingElements):
                processingElement = ProcessingElement(
                    name=f"pe_{i}",
                    parent=task.path,
                    path=f"{task.path}/processingElements:pe_{i}",
                    portName=f"{task.name}_PE_{i}",
                    interfaces={}
                )

                mem = Interface(
                    name=f"mem",
                    parent=processingElement.path,
                    path=f"{processingElement.path}/interfaces:mem",
                    portName=f"{processingElement.portName}_mem",
                    protocol=InterfaceProtocol.Axi4,
                    config=Axi4Config(ADDR_WIDTH, self.widthAddress)
                )

                processingElement.interfaces[mem.name] = mem

                # also, foreach processing element, create other interfaces
                # and connections (if possible)

                task.processingElements[processingElement.name] = processingElement

            for i in range(task.numVirtualStealServers):
                vss = VirtualStealServer(
                    name=f"vss_{i}",
                    parent=task.name,
                    path=f"{task.path}/virtualStealServers:vss_{i}",
                    baseAddress=addr,
                    capacity=task.capacityVirtualStealQueue,
                    numBytesTask=task.widthTask//8
                )

                addr += 0x10000
                task.virtualStealServers[vss.name] = vss

            for i in range(task.numVirtualContinuationServers):
                # TODO maybe change continuationServersNumber to virtualContinuationServersNumber?

                vcas = VirtualContinuationAddressServer(
                    name=f"vcas_{i}",
                    parent=task.name,
                    path=f"{task.path}/virtualContinuationServers:vcas_{i}",
                    baseAddress=addr,
                    capacity=task.capacityVirtualContinuationQueue,
                    numBytesCont=task.widthCont//8
                )

                addr += 0x10000
                task.virtualContinuationAddressServers[vcas.name] = vcas

        if connections_fpath is None:
            return self

        self.system.interfaces = {}
        self.connections = []

        def process_line0(line: str) -> None:
            """
            Processes connections from PEs to the System.
            """
            match = list(re.finditer(_REGEX_0, line))[0]

            taskName = match[1]
            processingElementName = f"{match[2]}_{match[3]}"

            task = self.tasks[taskName]
            processingElement = task.processingElements[processingElementName.lower(
            )]

            interfaceName = f"{match[4]}"
            connectsTo = match[5]
            widthData = int(match[6])

            # create the corresponding interface for the processing element
            interface1 = Interface(
                name=interfaceName,
                parent=processingElement.path,
                path=f"{processingElement.path}/interfaces:{interfaceName}",
                portName=f"{processingElement.portName}_{interfaceName}",
                protocol=InterfaceProtocol.Axis,
                isSlave="in" in interfaceName,
                config=AxisConfig(widthData, 0)
            )
            processingElement.interfaces[interface1.name] = interface1

            # and for the system
            interface2 = Interface(
                name=connectsTo,
                parent=self.system.path,
                path=f"{self.system.path}/interfaces:{connectsTo}",
                portName=connectsTo,
                isSlave="In" not in interfaceName,
                config=AxisConfig(widthData, 0)
            )
            self.system.interfaces[interface2.name] = interface2

            self.connections.append((interface1.path, interface2.path))

        def process_line1(line: str) -> None:
            """
            Processes connections from System to memory/microcontroller.
            """
            match = list(re.finditer(_REGEX_1, line))[0]

            connectsFrom = match[1]
            connectsTo = match[2]
            widthData = int(match[3])

            if "full" in connectsFrom:
                interfaceName = connectsFrom
                interface = Interface(
                    name=interfaceName,
                    parent=self.system.path,
                    path=f"{self.system.path}/interfaces:{interfaceName}",
                    portName=interfaceName,
                    isSlave=False,

                    # TODO make sure that width is always 6
                    config=Axi4Config(self.widthAddress, widthData)
                )
            elif "mgmt" in connectsFrom:
                interfaceName = connectsFrom
                interface = Interface(
                    name=interfaceName,
                    parent=self.system.path,
                    path=f"{self.system.path}/interfaces:{interfaceName}",
                    portName=interfaceName,
                    isSlave=True,

                    # TODO make sure that address width is always 6
                    config=Axi4liteConfig(6, widthData)
                )

                taskName = connectsFrom.split("_")[0]
                task = self.tasks[taskName]

                # for now, the number is not encoded yet.
                # Mohamed will do this later.
                assert task.numVirtualContinuationServers <= 1
                assert task.numVirtualStealServers <= 1

                if "vss" in connectsFrom:
                    task.virtualStealServers["vss_0"].pathInterface = interface.path
                elif "vcas" in connectsFrom:
                    task.virtualContinuationAddressServers["vcas_0"].pathInterface = interface.path

        with open(connections_fpath) as f:
            mode = 0

            for line in f.readlines():
                if mode == 0:
                    if line[0] == '-':
                        mode = 1
                        continue
                    process_line0(line)

                elif mode == 1:
                    if line[0] == '-':
                        mode = 2

                else:
                    process_line1(line)


def path_to_object(root, path: str) -> object:
    split = path.split('/')[1:]

    for s in split:
        try:
            root = root[s]
        except TypeError as e:
            root = getattr(root, s)

    return root


def main() -> None:
    import json

    json_file = "descriptor/fib_descriptor.json"
    txt_file = "descriptor/fib_descriptor.txt"

    with open(json_file) as f:
        hardCilkSystem = HardCilkSystem.from_dict(json.load(f))
    # pprint.pprint(hardCilkSystem)

    hardCilkSystem.elaborate(txt_file)
    # pprint.pprint(hardCilkSystem)

    dump = cpp_dump.Dumper()
    print(dump(hardCilkSystem))

if __name__ == "__main__":
    main()
