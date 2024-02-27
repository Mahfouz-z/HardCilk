import dataclasses
from .. import hdl
from .. import wrapper
from ..util import Dumper
from typing import *  # type: ignore
import jinja2

PACKAGE_NAME = "hardcilk.bulk"


def list_field():
    return dataclasses.field(default_factory=list)


def is_unique(l: List) -> bool:
    return len(l) == len(set(l))


def is_optional(t) -> bool:
    args = get_args(t)
    return get_origin(t) == Union and len(args) == 2 and args[1] == type(None)


def check_dataclass(obj: Any):
    assert dataclasses.is_dataclass(obj)
    for field in dataclasses.fields(obj):
        if not is_optional(field.type):
            if getattr(obj, field.name) is None:
                raise RuntimeError(
                    f"dataclass field should not be None: {field}")


@dataclasses.dataclass
class Experiments(list):
    hppIncludes: List[str] = list_field()
    cppIncludes: List[str] = list_field()
    variableName: str = None  # type: ignore
    namespace: Optional[str] = None
    typeName: Optional[str] = None
    cppExtra: Optional[str] = None
    hppExtra: Optional[str] = None

    def generate(self) -> Tuple[str, str]:
        check_dataclass(self)
        raise NotImplementedError()


@dataclasses.dataclass
class TypeNameMappedName:
    typeName: str
    mappedName: str


@dataclasses.dataclass
class Factory:
    processingElementTypes: List[TypeNameMappedName] = list_field()
    processorTypeName: str = None  # type: ignore
    systemTypeName: str = None  # type: ignore

    def _dump(self, dumper: Dumper) -> None:
        dumper.indent()
        dumper.writeln("[] /* immediately invoked lambda expression */ {")

        dumper.indent_in()

        dumper.indent()
        dumper.writeln("hardcilk::Factory factory;")

        dumper.indent()
        dumper.writeln(f"factory.registerSystem<{self.systemTypeName}>();")

        dumper.indent()
        dumper.writeln(
            f"factory.registerProcessor<{self.processorTypeName}>();")

        for x in self.processingElementTypes:
            dumper.indent()
            dumper.writeln(
                f'factory.registerProcessingElement<{x.typeName}>("{x.mappedName}");')

        dumper.indent()
        dumper.writeln("return factory;")

        dumper.indent_out()

        dumper.indent()
        dumper.write("}()")


@dataclasses.dataclass
class Factories(list):
    hppIncludes: List[str] = list_field()
    cppIncludes: List[str] = list_field()

    selfHppInclude: str = '"Factories.hpp"'

    namespace: Optional[str] = None
    variableName: str = "factories"

    includeGuard: str = "__FACTORIES_INCLUDED__"

    def _dump_cpp_array(self, dumper: Dumper) -> None:
        dumper.writeln("{")
        dumper.indent_in()

        for factory in self:
            factory: Factory
            factory._dump(dumper)
            dumper.writeln(",")

        dumper.unwrite()  # remove the trailing ","
        dumper.indent_out()

        dumper.writeln()
        dumper.indent()
        dumper.write("}")

    def generate(self) -> Tuple[str, str]:
        check_dataclass(self)
        env = jinja2.Environment(
            loader=jinja2.loaders.PackageLoader(PACKAGE_NAME))
        dumper = Dumper()
        self._dump_cpp_array(dumper)
        d = {
            "factories": self,
            "cpp_array": dumper.generate()
        }
        template_hpp = env.get_template("Factories.hpp.in")
        template_cpp = env.get_template("Factories.cpp.in")
        return (template_hpp.render(d), template_cpp.render(d))


@dataclasses.dataclass
class HardwareConfigurations(list):
    processingElementTypes: List[TypeNameMappedName] = list_field()
    processorTypeName: str = None  # type: ignore

    wrapperClassName: str = "HardCilkSystem_{}"
    wrapperInclude: str = '<generated/{}.hpp>'

    hppIncludes: List[str] = list_field()
    cppIncludes: List[str] = list_field()
    namespace: Optional[str] = None

    factoriesVariableName: str = "factories"
    factoriesWrapperInclude: str = '<generated/{}.hpp>'
    factoriesIncludeGuard: str = "__FACTORIES_INCLUDED__"
    factoriesSelfHppInclude: str = '"factories.hpp"'

    pathOutputDirHardware: str = None  # type: ignore
    pathOutpurDirWrappers: str = None  # type: ignore
    pathOutputHpp: str = None  # type: ignore
    pathOutputCpp: str = None  # type: ignore

    verilatedTraceMacro: str = "VERILATED_TRACE_ENABLED"

    def _write_hdl_wrapper(self, desc: Dict[str, str], className: str) -> None:
        moduleName = desc.get("fullSysGenName", className)

        moduleOptions = wrapper.ModuleOptions(
            moduleName="V{}".format(moduleName),
            className=className,
            namespace="{}::generated".format(self.namespace),
            hppInclude=self.wrapperInclude.format(className),
            verilatedTraceMacro=self.verilatedTraceMacro
        )

        connections = hdl.emit_verilog(
            desc, "{}/{}/".format(self.pathOutputDirHardware, className))
        hardCilkSystem = wrapper.elaborate(
            wrapper.from_dict(desc),
            connections)
        module = wrapper.to_module(hardCilkSystem, moduleOptions)
        hpp, cpp = module.generate()

        # write the generated hardware
        fpathCpp = "{}/{}.cpp".format(self.pathOutpurDirWrappers, className)
        fpathHpp = "{}/{}.hpp".format(self.pathOutpurDirWrappers, className)

        with open(fpathHpp, "w") as f:
            f.write(hpp)

        with open(fpathCpp, "w") as f:
            f.write(cpp)

    def write(self) -> None:
        check_dataclass(self)
        classNames = []

        # generate class names and as well as the files
        for idx, desc in enumerate(self):
            desc: Dict

            className = self.wrapperClassName.format(idx)
            className = desc.get("className", className)
            classNames.append(className)

            self._write_hdl_wrapper(desc, className)

        assert is_unique(classNames)

        cppIncludes = self.cppIncludes + \
            [self.factoriesWrapperInclude.format(x) for x in classNames]

        # generate factories
        factories = Factories(
            hppIncludes=self.hppIncludes,
            cppIncludes=cppIncludes,
            selfHppInclude=self.factoriesSelfHppInclude,
            namespace=self.namespace,
            variableName=self.factoriesVariableName,
            includeGuard=self.factoriesIncludeGuard)

        for className in classNames:
            systemTypeName = "generated::{}".format(className)
            factory = Factory(
                processingElementTypes=self.processingElementTypes,
                processorTypeName=self.processorTypeName, systemTypeName=systemTypeName)
            factories.append(factory)

        hpp, cpp = factories.generate()

        with open(self.pathOutputCpp, "w") as f:
            f.write(cpp)

        with open(self.pathOutputHpp, "w") as f:
            f.write(hpp)


__all__ = [
    # "Experiments", # not properly implemented
    "TypeNameMappedName",
    "Factory",
    "Factories",
    "HardwareConfigurations"
]
