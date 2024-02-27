from typing import *  # type: ignore
import enum
import dataclasses
import cpp_dump
import re
import os
import json
from .. import util
from systemc_helpers import Module, Axi4Config, Axi4liteConfig, AxisConfig


def _addr_field():
    return cpp_dump.Config(
        intFormat="addr_type(0x{:016x}ull)",
        intType="addr_type"
    ).field(default=None)


def _connections_field():
    return cpp_dump.Config(
        tupleFormat="std::pair<std::string, std::string>"
    ).field(default=None)


@dataclasses.dataclass
class AddressSpace:
    base: int = _addr_field()  # type: ignore
    size: int = _addr_field()  # type: ignore


class InterfaceProtocol(enum.Enum):
    Axi4 = "Axi4"
    Axi4lite = "Axi4lite"
    Axis = "Axis"


@dataclasses.dataclass
class Interface:
    name: str = None  # type: ignore
    parent: str = None  # type: ignore
    path: str = None  # type: ignore

    # port name is used to connect sockets
    portName: str = None  # type: ignore

    protocol: InterfaceProtocol = None  # type: ignore
    isSlave: bool = None  # type: ignore
    config: Union[AxisConfig, Axi4Config,
                  Axi4liteConfig] = None  # type: ignore

    addressSpace: AddressSpace = None  # type: ignore


@dataclasses.dataclass
class VirtualStealServer:
    name: str = None  # type: ignore
    parent: str = None  # type: ignore
    path: str = None  # type: ignore

    addressSpace: AddressSpace = None  # type: ignore
    pathInterface: str = None  # type: ignore

    capacity: int = None  # type: ignore
    numBytesTask: int = None  # type: ignore


@dataclasses.dataclass
class VirtualContinuationAddressServer:
    name: str = None  # type: ignore
    parent: str = None  # type: ignore
    path: str = None  # type: ignore

    addressSpace: AddressSpace = None  # type: ignore
    pathInterface: str = None  # type: ignore

    capacity: int = None  # type: ignore
    numBytesCont: int = None  # type: ignore


@dataclasses.dataclass
class ProcessingElement:
    # each PE name should be unique, maybe based on taskName
    name: str = None  # type: ignore
    parent: str = None  # type: ignore
    path: str = None  # type: ignore

    # used for interfacing with verilog
    portName: str = None  # type: ignore

    interfaces: Dict[str, Interface] = None  # type: ignore


@dataclasses.dataclass
class Task:
    name: str = None  # type: ignore
    parent: str = None  # type: ignore
    path: str = None  # type: ignore

    isRoot: bool = None  # type: ignore
    isCont: bool = None  # type: ignore

    # should it bits or bytes?
    widthTask: int = None  # type: ignore
    widthCont: int = None  # type: ignore
    widthArg: int = None  # type: ignore

    numProcessingElements: int = None  # type: ignore
    processingElements: Dict[str, ProcessingElement] = None  # type: ignore

    numVirtualStealServers: int = None  # type: ignore
    capacityVirtualStealQueue: int = None  # type: ignore
    virtualStealServers: Dict[str, VirtualStealServer] = None  # type: ignore

    numVirtualContinuationServers: int = None  # type: ignore
    capacityVirtualContinuationQueue: int = None  # type: ignore
    virtualContinuationAddressServers: Dict[str,
                                            VirtualContinuationAddressServer] = None  # type: ignore

    numArgRouteServers: int = None  # type: ignore
    capacityArgRouteServers: int = None  # type: ignore


@dataclasses.dataclass
class System:
    name: str = None  # type: ignore
    parent: str = None  # type: ignore
    path: str = None  # type: ignore

    interfaces: Dict[str, Interface] = None  # type: ignore


# to parse the AXI-Stream connections in the file
_REGEX_0 = r"(\S+)_(\S+)_(\S+)/(\S+) <--> (\S+); <(\S+)>"

# to parse the AXI4-Full and AXI4-Lite connections
_REGEX_1 = r"(\S+) <--> (\S+); <(\S+)>"

# to extract the trailing number
_REGEX_2 = r"^.*_(\d+)$"


@dataclasses.dataclass
class HardCilkSystem:
    tasks: Dict[str, Task] = None  # type: ignore
    system: System = None  # type: ignore
    connections: List[Tuple[str, str]] = _connections_field()  # type: ignore

    widthAddress: int = None  # type: ignore
    widthContinuationCounter: int = None  # type: ignore

    # maybe also have spawnList, spawnNextList, and sendArgumentList?
    # ...

    spawnList: Dict[str, List[str]] = None  # type: ignore
    spawnNextList: Dict[str, List[str]] = None  # type: ignore
    sendArgumentList: Dict[str, List[str]] = None  # type: ignore

    # for servers
    managementBase: int = _addr_field()  # type: ignore

    # for everything else
    memory: AddressSpace = None  # type: ignore

    # interconnect-related information
    interconnectMasters: int = None  # type: ignore
    interconnectSlaves: int = None  # type: ignore

    isElaborated: bool = False


@dataclasses.dataclass
class ModuleOptions:
    moduleName: str = None  # type: ignore
    className: str = None  # type: ignore
    namespace: str = None  # type: ignore
    hppInclude: str = None  # type: ignore
    verilatedTraceMacro: str = None  # type: ignore


def from_dict(d: Dict) -> HardCilkSystem:
    result = HardCilkSystem()

    result.widthAddress = d["systemAddressWidth"]
    result.widthContinuationCounter = d["continuationCounterWidth"]

    result.tasks = {}

    for json_task in d["taskList"]:
        taskName = json_task["name"]
        task = Task(
            name=taskName,
            parent="/tasks",
            path=f"/tasks:{taskName}",
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
                           path="/system", interfaces={})

    result.spawnList = {}
    for name, targets in d["spawnList"].items():
        result.spawnList[name] = list(targets)

    result.spawnNextList = {}
    for name, targets in d["spawnNextList"].items():
        result.spawnNextList[name] = list(targets)

    result.sendArgumentList = {}
    for name, targets in d["sendArgumentList"].items():
        result.sendArgumentList[name] = list(targets)

    result.managementBase = d.get("managementBase", 0x3FF0_0000)

    # TODO get this one from JSON file later
    result.memory = AddressSpace(0x4000_0000, 0xC000_0000)

    return result


def elaborate(hardCilkSystem: HardCilkSystem, txt: Optional[Union[str, List[str]]]) -> HardCilkSystem:
    """
    This function elaborates a partial HardCilkSystem description.
    """
    assert hardCilkSystem is not None

    if isinstance(txt, str):
        txt = txt.splitlines()

    if hardCilkSystem.isElaborated:
        return hardCilkSystem

    hardCilkSystem.isElaborated = True

    # 1 master for the microprocessor
    hardCilkSystem.interconnectMasters = 1

    # 1 slave for the memory
    hardCilkSystem.interconnectSlaves = 1

    addr = hardCilkSystem.managementBase

    for task in hardCilkSystem.tasks.values():
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

                # TODO do we really now if the mem port of a PE
                # is always 64-bits wide? Verify with Mohamed.
                config=Axi4Config(hardCilkSystem.widthAddress, 64)
            )

            processingElement.interfaces[mem.name] = mem
            hardCilkSystem.interconnectMasters += 1

            # TODO foreach processing element, create other interfaces
            # and connections (if possible)
            # instead of getting them from the txt_file

            task.processingElements[processingElement.name] = processingElement

        addressSpaceSize = 0x10000

        for i in range(task.numVirtualStealServers):
            vss = VirtualStealServer(
                name=f"vss_{i}",
                parent=task.name,
                path=f"{task.path}/virtualStealServers:vss_{i}",
                addressSpace=AddressSpace(addr, addressSpaceSize),
                capacity=task.capacityVirtualStealQueue,
                numBytesTask=task.widthTask//8
            )

            addr += addressSpaceSize
            task.virtualStealServers[vss.name] = vss

        for i in range(task.numVirtualContinuationServers):
            # TODO maybe change continuationServersNumber to virtualContinuationServersNumber?

            vcas = VirtualContinuationAddressServer(
                name=f"vcas_{i}",
                parent=task.name,
                path=f"{task.path}/virtualContinuationServers:vcas_{i}",
                addressSpace=AddressSpace(addr, addressSpaceSize),
                capacity=task.capacityVirtualContinuationQueue,
                numBytesCont=task.widthCont//8
            )

            addr += addressSpaceSize
            task.virtualContinuationAddressServers[vcas.name] = vcas

    if txt is None:
        return hardCilkSystem

    hardCilkSystem.system.interfaces = {}
    hardCilkSystem.connections = []

    def process_line0(line: str) -> None:
        """
        Processes connections from PEs to the System.
        """
        match = list(re.finditer(_REGEX_0, line))[0]

        taskName = match[1]
        processingElementName = f"{match[2]}_{match[3]}"

        task = hardCilkSystem.tasks[taskName]
        processingElement = task.processingElements[processingElementName.lower(
        )]

        interfaceName = f"{match[4]}"
        connectsTo = match[5]
        widthData = int(match[6])

        def checkSlave(name: str) -> bool:
            return "taskIn" in name or "addrIn" in name

        # create the corresponding interface for the processing element
        interface1 = Interface(
            name=interfaceName,
            parent=processingElement.path,
            path=f"{processingElement.path}/interfaces:{interfaceName}",
            portName=f"{processingElement.portName}_{interfaceName}",
            protocol=InterfaceProtocol.Axis,
            isSlave=checkSlave(interfaceName),
            config=AxisConfig(widthData, 0, True, True)
        )
        processingElement.interfaces[interface1.name] = interface1

        # and for the system
        interface2 = Interface(
            name=connectsTo,
            parent=hardCilkSystem.system.path,
            path=f"{hardCilkSystem.system.path}/interfaces:{connectsTo}",
            portName=connectsTo,
            protocol=InterfaceProtocol.Axis,
            isSlave=checkSlave(connectsTo),
            config=AxisConfig(widthData, 0, True, True)
        )
        hardCilkSystem.system.interfaces[interface2.name] = interface2

        assert interface1.isSlave != interface2.isSlave

        if not interface1.isSlave:
            hardCilkSystem.connections.append(
                (interface1.path, interface2.path))
        else:
            hardCilkSystem.connections.append(
                (interface2.path, interface1.path))

    def process_line1(line: str) -> None:
        """
        Processes connections from System to memory/microcontroller.
        """
        match = list(re.finditer(_REGEX_1, line))[0]

        connectsFrom = match[1]
        connectsTo = match[2]  # either microblaze or memory
        widthData = int(match[3])

        if "_axi_full" in connectsFrom:
            interfaceName = connectsFrom
            interface = Interface(
                name=interfaceName,
                parent=hardCilkSystem.system.path,
                path=f"{hardCilkSystem.system.path}/interfaces:{interfaceName}",
                portName=interfaceName,
                isSlave=False,

                # TODO make sure that width is always 6
                config=Axi4Config(hardCilkSystem.widthAddress, widthData)
            )
            hardCilkSystem.system.interfaces[interface.name] = interface
            hardCilkSystem.interconnectMasters += 1
        elif "_axi_mgmt_" in connectsFrom:
            interfaceName = connectsFrom
            interface = Interface(
                name=interfaceName,
                parent=hardCilkSystem.system.path,
                path=f"{hardCilkSystem.system.path}/interfaces:{interfaceName}",
                portName=interfaceName,
                isSlave=True,

                # TODO make sure that address width is always 6
                config=Axi4liteConfig(6, widthData)
            )
            hardCilkSystem.system.interfaces[interface.name] = interface
            hardCilkSystem.interconnectSlaves += 1

            taskName = connectsFrom.split("_")[0]
            task = hardCilkSystem.tasks[taskName]

            # for now, the number is not encoded yet.
            # Mohamed will do this later.
            # assert task.numVirtualContinuationServers <= 1

            if "_axi_mgmt_vss_" in connectsFrom:
                # the trailing number identifies the vss
                num = list(re.finditer(_REGEX_2, connectsFrom))[0][1]

                task.virtualStealServers[f"vss_{num}"].pathInterface = interface.path
                interface.addressSpace = task.virtualStealServers[f"vss_{num}"].addressSpace
            elif "_axi_mgmt_vcas_" in connectsFrom:
                num = list(re.finditer(_REGEX_2, connectsFrom))[0][1]

                task.virtualContinuationAddressServers[f"vcas_{num}"].pathInterface = interface.path
                interface.addressSpace = task.virtualContinuationAddressServers[
                    f"vcas_{num}"].addressSpace
            else:
                raise RuntimeError(f"'{connectsFrom=}' is not recognized.")

    mode = 0

    for line in txt:
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

    return hardCilkSystem


def from_file(json_fpath: Union[str, os.PathLike], txt_fpath: Union[str, os.PathLike]) -> HardCilkSystem:
    with open(json_fpath) as f:
        json_data = json.load(f)

    with open(txt_fpath) as f:
        txt_data = f.readlines()

    return elaborate(from_dict(json_data), txt_data)


def to_module(hardCilkSystem: HardCilkSystem, moduleOptions: ModuleOptions) -> Module:
    module = Module(
        name=moduleOptions.className,
        verilated_name=moduleOptions.moduleName,
        namespace=moduleOptions.namespace,
        hpp_include_str=moduleOptions.hppInclude,
        verilated_trace_macro=moduleOptions.verilatedTraceMacro)

    for _, interface in hardCilkSystem.system.interfaces.items():
        module.new_interface(interface.portName,
                             interface.isSlave, interface.config)

    module.export("clock")
    module.export("reset")
    module.export("description")

    module.add_include("<hardcilk/Desc.hpp>", is_hpp=True, is_cpp=False)

    module.class_extra_hpp.append("static hardcilk::desc::HardCilkSystem description;")

    dumper = util.Dumper()
    
    dumper.indent()
    dumper.writeln(f"hardcilk::desc::HardCilkSystem {module.name}::description = [] {{")

    dumper.indent_in()

    dumper.indent()
    dumper.writeln("using namespace hardcilk::desc;")

    cpp_dumper = cpp_dump.Dumper("    ")
    cpp_dumper.indent_in() # to match the indentation of the other module

    dumper.indent()
    dumper.writeln(f"auto description = {cpp_dumper(hardCilkSystem)};")

    dumper.indent()
    dumper.writeln("return description;")

    dumper.indent_out()

    dumper.indent()
    dumper.writeln("}();")

    module.class_extra_cpp.append(dumper.generate())

    return module


def path_to_object(root, path: str) -> object:
    split = path.split('/')[1:]

    for s in split:
        try:
            root = root[s]
        except TypeError as e:
            root = getattr(root, s)

    return root


__all__ = [
    "InterfaceProtocol",
    "Interface",
    "VirtualStealServer",
    "VirtualContinuationAddressServer",
    "ProcessingElement",
    "Task",
    "System",
    "HardCilkSystem",
    "ModuleOptions",

    "elaborate",
    "from_dict",
    "from_file",
    "to_module"
]
