import dataclasses
import os
import sys
import abc
import argparse
from typing import *

Path = Union[str, os.PathLike]


class Task(abc.ABC):
    @abc.abstractmethod
    def run(self):
        ...


@dataclasses.dataclass
class TaskEntry:
    name: str
    t: type
    parse_fn: Callable[[List[str]], Task]


TASKS: Dict[str, TaskEntry] = {}


def register_task(name: str):
    def f(t):
        assert name not in TASKS
        TASKS[name] = TaskEntry(name, t, t.parse)
        return t
    return f


def _check(o: Any) -> None:
    for field in dataclasses.fields(o):
        field_name = field.name
        field_value = getattr(o, field_name)

        if field_value is None:
            raise RuntimeError(f"Required argument is not set: {field_name}")


@register_task("wrapper")
@dataclasses.dataclass
class WrapperTask(Task):
    pathInputJson: Path = None  # type: ignore
    pathInputTxt: Path = None  # type: ignore
    pathOutputCpp: Path = None  # type: ignore
    pathOutputHpp: Path = None  # type: ignore
    moduleName: str = None  # type: ignore
    className: str = None  # type: ignore
    namespace: str = None  # type: ignore
    verilatedTraceMacro: str = None  # type: ignore

    def run(self) -> None:
        from . import wrapper

        _check(self)

        moduleOptions = wrapper.ModuleOptions(
            moduleName=self.className,
            className=self.moduleName,
            namespace=self.namespace,
            hppInclude=f'"{str(self.pathOutputHpp).split("/")[-1]}"',
            verilatedTraceMacro=self.verilatedTraceMacro
        )

        desc = wrapper.from_file(self.pathInputJson, self.pathInputTxt)
        module = wrapper.to_module(desc, moduleOptions)

        hpp, cpp = module.generate()

        with open(self.pathOutputHpp, "w") as f:
            f.write(hpp)

        with open(self.pathOutputCpp, "w") as f:
            f.write(cpp)

    @staticmethod
    def parse(argv: List[str]) -> "WrapperTask":
        p = argparse.ArgumentParser(prog="hardcilk wrapper")
        # fmt: off
        p.add_argument("--input-json", help="Path to the input json file.", required=False)
        p.add_argument("--input-txt", help="Path to the input txt file.", required=False)
        p.add_argument("--input", help="Base for both json and txt inputs.", required=False)
        p.add_argument("--output-cpp", help="Output cpp file.", required=False)
        p.add_argument("--output-hpp", help="Output hpp file.", required=False)
        p.add_argument("--output", help="Base for both cpp and hpp outputs.", required=False)
        p.add_argument("--namespace", help="Namespace of the output file.", default="hardcilk::generated", required=False)
        p.add_argument("--module-name", help="Name of the Verilator module (starts with V, usually).", default="VfullSysGen", required=False)
        p.add_argument("--class-name", help="Name of the generated classes.", default="FullSystem", required=False)
        p.add_argument("--verilated-trace-macro", help="Name of the preprocessor macro to enable/disable tracing.", default="{}_TRACE_ENABLED", required=False)
        # fmt: on

        args = p.parse_args(argv)

        wrapperTask = WrapperTask()

        if args.input is not None:
            wrapperTask.pathInputJson = f"{args.input}.json"
            wrapperTask.pathInputTxt = f"{args.input}.txt"

        if args.output is not None:
            wrapperTask.pathOutputCpp = f"{args.output}.cpp"
            wrapperTask.pathOutputHpp = f"{args.output}.hpp"

        if args.input_json is not None:
            wrapperTask.pathInputJson = args.input_json

        if args.input_txt is not None:
            wrapperTask.pathInputTxt = args.input_txt

        if args.output_cpp is not None:
            wrapperTask.pathOutputCpp = args.output_cpp

        if args.output_hpp is not None:
            wrapperTask.pathOutputHpp = args.output_hpp

        wrapperTask.namespace = args.namespace
        wrapperTask.moduleName = args.module_name
        wrapperTask.className = args.class_name
        wrapperTask.verilatedTraceMacro = args.verilated_trace_macro

        return wrapperTask


@register_task("verilog")
@dataclasses.dataclass
class VerilogTask(Task):
    pathInputJson: Path = None  # type: ignore
    pathOutputDirHdl: Path = None  # type: ignore
    pathOutputTxt: Path = None  # type: ignore

    def run(self) -> None:
        from . import hdl
        import json

        _check(self)

        with open(self.pathInputJson, "r") as f:
            d = json.load(f)

        txtData = hdl.emit_verilog(d, self.pathOutputDirHdl)  # type: ignore

        with open(self.pathOutputTxt, "w") as f:
            f.write(txtData)

    @staticmethod
    def parse(argv: List[str]) -> "VerilogTask":
        p = argparse.ArgumentParser(prog="hardcilk verilog")
        # fmt: off
        p.add_argument("--input-json", help="Path to the input json file.", required=True)
        p.add_argument("--output-hdl", help="Path to the output Verilog files.", required=True)
        p.add_argument("--output-txt", help="Path to the output txt file for connections.", required=True)
        # fmt: on

        args = p.parse_args(argv)

        verilogTask = VerilogTask()
        verilogTask.pathInputJson = args.input_json
        verilogTask.pathOutputDirHdl = args.output_hdl
        verilogTask.pathOutputTxt = args.output_txt

        return verilogTask


@register_task("wrapper_verilog")
@dataclasses.dataclass
class WrapperVerilogTask(Task):
    pathInputJson: Path = None  # type: ignore
    pathOutputDirHdl: Path = None  # type: ignore
    pathOutputCpp: Path = None  # type: ignore
    pathOutputHpp: Path = None  # type: ignore
    className: str = None  # type: ignore
    namespace: str = None  # type: ignore
    verilatedTraceMacro: str = None  # type: ignore

    def run(self) -> None:
        from . import wrapper
        from . import hdl
        import json

        _check(self)

        with open(self.pathInputJson, "r") as f:
            d: Dict = json.load(f)

        systemName = d.get("fullSysGenName", "fullSysGen")

        txtData = hdl.emit_verilog(d, self.pathOutputDirHdl)  # type: ignore

        desc = wrapper.elaborate(wrapper.from_dict(d), txtData.splitlines())

        moduleOptions = wrapper.ModuleOptions(
            moduleName=f"V{systemName}",
            className=self.className,
            namespace=self.namespace,
            hppInclude=f'"{str(self.pathOutputHpp).split("/")[-1]}"',
            verilatedTraceMacro=self.verilatedTraceMacro
        )

        module = wrapper.to_module(desc, moduleOptions)

        hpp, cpp = module.generate()

        with open(self.pathOutputHpp, "w") as f:
            f.write(hpp)

        with open(self.pathOutputCpp, "w") as f:
            f.write(cpp)

    @staticmethod
    def parse(argv: List[str]) -> "WrapperVerilogTask":
        p = argparse.ArgumentParser(prog="hardcilk wrapper_verilog")
        # fmt: off
        p.add_argument("--input-json", help="Path to the input json file.", required=True)
        p.add_argument("--output-hdl", help="Path to the output Verilog files.", required=True)
        p.add_argument("--output-base", help="Base for both cpp and hpp outputs.", required=False)
        p.add_argument("--output-cpp", help="Output cpp file (for wrapper).", required=False)
        p.add_argument("--output-hpp", help="Output hpp file (for wrapper).", required=False)
        p.add_argument("--namespace", help="Namespace of the output file.", default="hardcilk::generated", required=False)
        p.add_argument("--class-name", help="Name of the generated classes.", default="FullSystem", required=False)
        p.add_argument("--verilated-trace-macro", help="Name of the preprocessor macro to enable/disable tracing.", default="{}_TRACE_ENABLED", required=False)
        # fmt: on

        args = p.parse_args(argv)

        wrapperVerilogTask = WrapperVerilogTask()

        wrapperVerilogTask.pathInputJson = args.input_json
        wrapperVerilogTask.pathOutputDirHdl = args.output_hdl

        if args.output_base is not None:
            wrapperVerilogTask.pathOutputCpp = f"{args.output_base}.cpp"
            wrapperVerilogTask.pathOutputHpp = f"{args.output_base}.hpp"

        if args.output_cpp is not None:
            wrapperVerilogTask.pathOutputCpp = args.output_cpp

        if args.output_hpp is not None:
            wrapperVerilogTask.pathOutputHpp = args.output_hpp

        wrapperVerilogTask.namespace = args.namespace
        wrapperVerilogTask.className = args.class_name
        wrapperVerilogTask.verilatedTraceMacro = args.verilated_trace_macro

        return wrapperVerilogTask


def run(argv: List[str] = sys.argv) -> None:
    if len(argv) < 2:
        print("Usage: python3 -m hardcilk TASK_NAME")
        print("")
        print("Registered tasks:")
        for taskName in TASKS.keys():
            print(f"    {taskName}")
        sys.exit(1)

    taskName = argv[1]

    if taskName not in TASKS:
        print(f"Unrecognized task: {taskName}")
        sys.exit(1)

    task = TASKS[taskName].parse_fn(argv[2:])
    task.run()


__all__ = [
    "run"
]
