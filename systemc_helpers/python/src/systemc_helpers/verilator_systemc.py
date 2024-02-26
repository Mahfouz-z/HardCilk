import os
import jinja2
import dataclasses
import functools
from typing import *  # type: ignore

# TODO change this if the parent package name changes
PACKAGE_NAME = "systemc_helpers"


def _concat_all(*args) -> str:
    return ",".join(map(str, args))


@dataclasses.dataclass(frozen=True)
class Axi4Config:
    addr_width: int
    data_width: int
    id_width: int = 4
    axlen_width: int = 8
    axlock_width: int = 1
    awuser_width: int = 0
    aruser_width: int = 0
    wuser_width: int = 0
    ruser_width: int = 0
    buser_width: int = 0

    @functools.cached_property
    def skipped_signals(self):
        l = []
        for signal in ["awuser", "aruser", "wuser", "ruser", "buser"]:
            if getattr(self, f"{signal}_width") == 0:
                l.append(signal)

        return tuple(l)

    def _template_args(self) -> str:
        return _concat_all(
            self.addr_width,
            self.data_width,
            self.id_width,
            self.axlen_width,
            self.axlock_width,
            min(self.awuser_width, 1),
            min(self.aruser_width, 1),
            min(self.wuser_width, 1),
            min(self.ruser_width, 1),
            min(self.buser_width, 1)
        )


@dataclasses.dataclass(frozen=True)
class Axi4liteConfig:
    addr_width: int
    data_width: int

    def _template_args(self) -> str:
        return _concat_all(
            self.addr_width,
            self.data_width
        )


@dataclasses.dataclass(frozen=True)
class AxisConfig:
    data_width: int
    user_width: int
    no_tstrb: bool = False
    no_tlast: bool = False

    @functools.cached_property
    def skipped_signals(self):
        l = []

        if self.user_width == 0:
            l.append("tuser")

        if self.no_tstrb:
            l.append("tstrb")

        if self.no_tlast:
            l.append("tlast")

        return tuple(l)

    def _template_args(self) -> str:
        return _concat_all(
            self.data_width,
            min(self.user_width, 1),
            "true" if self.no_tstrb else "false",
            "true" if self.no_tlast else "false"
        )


@dataclasses.dataclass(frozen=True)
class Interface:
    name: str
    kind: str
    is_slave: bool
    config: Union[Axi4Config, Axi4liteConfig, AxisConfig]


@dataclasses.dataclass
class ClockReset:
    clock_name: str = "clock"
    reset_name: str = "reset"
    reset_active_high: bool = True


AXI4_SIGNALS = [
    "awvalid",
    "awready",
    "awaddr",
    "awprot",
    "awuser",
    "awregion",
    "awqos",
    "awcache",
    "awburst",
    "awsize",
    "awlen",
    "awid",
    "awlock",
    "wid",
    "wvalid",
    "wready",
    "wdata",
    "wstrb",
    "wuser",
    "wlast",
    "bvalid",
    "bready",
    "bresp",
    "buser",
    "bid",
    "arvalid",
    "arready",
    "araddr",
    "arprot",
    "aruser",
    "arregion",
    "arqos",
    "arcache",
    "arburst",
    "arsize",
    "arlen",
    "arid",
    "arlock",
    "rvalid",
    "rready",
    "rdata",
    "rresp",
    "ruser",
    "rid",
    "rlast",
]

AXI4LITE_SIGNALS = [
    "awvalid",
    "awready",
    "awaddr",
    "awprot",
    "wvalid",
    "wready",
    "wdata",
    "wstrb",
    "bvalid",
    "bready",
    "bresp",
    "arvalid",
    "arready",
    "araddr",
    "arprot",
    "rvalid",
    "rready",
    "rdata",
    "rresp"
]

AXIS_SIGNALS = [
    "tready",
    "tvalid",
    "tdata",
    "tstrb",
    "tuser",
    "tlast"
]


class Module:
    def __init__(
            self,
            name: str,
            clockreset: ClockReset = ClockReset(),
            namespace: str = "",
            verilated_name: str = "V{}",
            hpp_include_str: str = "\"{}.hpp\"",
            verilated_include_str: str = "\"{}.h\"",
            verilated_trace_macro: str = "{}_TRACE_ENABLED") -> None:
        self._name = name

        self._verilated_name = verilated_name.format(name)

        self._clockreset = clockreset
        self._namespace = namespace

        self._hpp_include_str = hpp_include_str.format(self._name)
        self._verilated_include_str = verilated_include_str.format(
            self._verilated_name)
        self._verilated_trace_macro = verilated_trace_macro.format(
            self._verilated_name)

        self._interfaces: List[Interface] = []
        self._hpp_includes: List[str] = []
        self._cpp_includes: List[str] = []
        self._init_blocks: List[str] = []
        self._exports: List[str] = []
        self._class_extra_hpp: List[str] = []
        self._class_extra_cpp: List[str] = []

    def new_interface(
            self,
            name: str,
            is_slave: bool,
            config: Union[Axi4Config, Axi4liteConfig, AxisConfig]) -> None:
        assert isinstance(config, Axi4Config) or \
            isinstance(config, Axi4liteConfig) or \
            isinstance(config, AxisConfig)

        kind = type(config).__name__.removesuffix("Config")
        self._interfaces.append(Interface(name, kind, is_slave, config))

    def add_include(self, include_str: str, is_hpp: bool = True, is_cpp: bool = False) -> None:
        """
        Adds a new include directory. `include_str` should be either
        '<...>' or '"..."'.
        """
        assert len(include_str) > 2
        assert (include_str[0] == '<' and include_str[-1] == '>') or \
            (include_str[0] == '"' and include_str[-1] == '"')

        if is_hpp:
            self._hpp_includes.append(include_str)

        if is_cpp:
            self._cpp_includes.append(include_str)

    def add_init_block(self, init_block) -> None:
        """
        Adds initialization code to the class. The code can use
        set_object(...). Called in the constructor.
        """
        self._init_blocks.append(init_block)

    def export(self, signal_name: str):
        self._exports.append(signal_name)

    @property
    def name(self):
        return self._name

    @property
    def verilated_name(self):
        return self._verilated_name

    @property
    def clockreset(self):
        return self._clockreset

    @property
    def namespace(self):
        return self._namespace

    @property
    def verilated_include_str(self):
        return self._verilated_include_str

    @property
    def hpp_include_str(self):
        return self._hpp_include_str

    @property
    def verilated_trace_macro(self):
        return self._verilated_trace_macro

    @property
    def interfaces(self):
        return self._interfaces

    @property
    def hpp_includes(self):
        return self._hpp_includes

    @property
    def cpp_includes(self):
        return self._cpp_includes

    @property
    def init_blocks(self):
        return self._init_blocks
    
    @property
    def class_extra_hpp(self):
        return self._class_extra_hpp
    
    @property
    def class_extra_cpp(self):
        return self._class_extra_cpp

    def generate(self) -> Tuple[str, str]:
        """
        Returns the header and implementation file contents.
        """

        env = jinja2.Environment(
            loader=jinja2.loaders.PackageLoader(PACKAGE_NAME))
        d = {
            "interfaces": self.interfaces,
            "hpp_includes": self._hpp_includes,
            "cpp_includes": self._cpp_includes,
            "init_blocks": self._init_blocks,
            "class_extra_hpp": self._class_extra_hpp,
            "class_extra_cpp": self._class_extra_cpp,
            "exports": self._exports,
            "module": self,
            "AXI4_SIGNALS": AXI4_SIGNALS,
            "AXI4LITE_SIGNALS": AXI4LITE_SIGNALS,
            "AXIS_SIGNALS": AXIS_SIGNALS
        }
        template_hpp = env.get_template("Module.hpp.in")
        template_cpp = env.get_template("Module.cpp.in")
        return (template_hpp.render(d), template_cpp.render(d))

    def write_systemc_wrapper(self, path):
        hpp, cpp = self.generate()

        with open(os.path.join(path, f"{self.name}.hpp"), "w") as f:
            f.write(hpp)

        with open(os.path.join(path, f"{self.name}.cpp"), "w") as f:
            f.write(cpp)
