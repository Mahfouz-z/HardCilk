import dataclasses
import enum
from typing import *  # type: ignore


@dataclasses.dataclass
class Config:
    intFormat: str = "{}"
    floatFormat: str = "{}"
    mapFormat: str = "std::map<{}, {}>"
    listFormat: str = "std::vector<{}>"
    tupleFormat: str = "std::vector<{}>"
    intType: str = "int"
    floatType: str = "double"
    strType: str = "std::string"
    boolType: str = "bool"
    boolValues: Tuple[str, str] = ("false", "true")
    typeStrMap: Dict[type, str] = dataclasses.field(default_factory=lambda: {})

    # TODO also add a typeStr stack for more customization

    def field(self, *args, **kwargs) -> dataclasses.Field:
        if kwargs.get("metadata", None) is None:
            kwargs["metadata"] = {}

        kwargs["metadata"]["cpp_dump_config"] = self
        return dataclasses.field(*args, **kwargs)


class Dumper:
    def __init__(self, indentstr="    ") -> None:
        self._indentstr = indentstr
        self._num_indent = 0
        self._buffer = []
        self._config_stack = [Config()]

    def _type_str(self, obj) -> str:
        """
        Creates a type string for the object.
        """

        t = type(obj)

        for config in reversed(self._config_stack):
            x = config.typeStrMap.get(t, None)
            if x is not None:
                return x

        if isinstance(obj, bool):
            return self.config.boolType

        if isinstance(obj, str):
            return self.config.strType

        if isinstance(obj, int):
            return self.config.intType

        if isinstance(obj, float):
            return self.config.floatType

        if isinstance(obj, list):
            return self.config.listFormat.format(self._type_str(obj[0]))

        if isinstance(obj, tuple):
            return self.config.tupleFormat.format(self._type_str(obj[0]))

        if isinstance(obj, dict):
            x = next(iter(obj.items()))
            a = self._type_str(x[0])
            b = self._type_str(x[1])
            return self.config.mapFormat.format(a, b)

        return t.__name__

    def _process_metadata(self, meta) -> bool:
        """
        Process dataclass metadata. Returns True if a new config is pushed.
        """

        if "cpp_dump_config" in meta:
            config = meta["cpp_dump_config"]
            assert isinstance(config, Config)
            self.push_config(config)
            return True

        return False

    def indent_in(self) -> None:
        self._num_indent += 1

    def indent_out(self) -> None:
        assert self._num_indent > 0
        self._num_indent -= 1

    def _indent(self) -> None:
        self._write(self._indentstr * self._num_indent)

    def _writeln(self, ln="") -> None:
        self._write(f"{ln}\n")

    def _write(self, ln) -> None:
        self._buffer.append(ln)

    def _unwrite(self) -> None:
        assert len(self._buffer) > 0
        self._buffer.pop()

    def _process_dataclass(self, obj) -> bool:
        type_name = self._type_str(obj)
        fields = dataclasses.fields(obj)

        self._write(f"{type_name}{{\n")

        self.indent_in()

        written = False
        for field in fields:
            field_name = field.name
            field_value = getattr(obj, field_name)

            self._indent()
            self._write(f".{field_name} = ")

            should_pop = self._process_metadata(field.metadata)

            if self.process(field_value):
                self._writeln(",")
                written = True
            else:
                self._unwrite()
                self._unwrite()

            if should_pop:
                self.pop_config()

        self._unwrite()
        self.indent_out()
        self._writeln()

        if written:
            self._indent()
            self._write("}")
            return True
        else:
            self._unwrite()
            return False

    def _process_list(self, obj: Union[list, tuple]) -> bool:
        # assume by default we use vectors
        if len(obj) == 0:
            return False

        assert all(map(lambda x: type(obj[0]) == type(x), obj))
        self._writeln(f"{self._type_str(obj)}{{")

        self.indent_in()

        written = False
        for item in obj:
            self._indent()
            if self.process(item):
                self._writeln(",")
                written = True
            else:
                self._unwrite()

        self._unwrite()
        self._writeln()
        self.indent_out()

        if written:
            self._indent()
            self._write("}")
            return True
        else:
            self._unwrite()
            return False

    def _process_dict(self, obj: dict) -> bool:
        if len(obj) == 0:
            return False

        self._writeln(f"[]() {{")

        self.indent_in()
        self._indent()
        self._writeln(f"{self._type_str(obj)} r;")

        written = False
        for key, value in obj.items():
            self._indent()
            self._write(f'r["{key}"] = ')
            if not self.process(value):
                self._unwrite()
                self._unwrite()
                continue
            else:
                written = True
                self._writeln(";")

        if written:
            self._indent()
            self._writeln("return r;")

            self.indent_out()
            self._indent()
            self._write("}()")
            return True
        else:
            self._unwrite()
            self._unwrite()
            self._unwrite()
            return False

    def _process_enum(self, obj: enum.Enum) -> bool:
        type_str_1 = self._type_str(obj)
        value = obj.value
        self._write(f"{type_str_1}::{value}")
        return True

    def process(self, obj) -> bool:
        if dataclasses.is_dataclass(obj):
            return self._process_dataclass(obj)
        elif isinstance(obj, list) or isinstance(obj, tuple):
            return self._process_list(obj)
        elif isinstance(obj, dict):
            return self._process_dict(obj)
        elif isinstance(obj, enum.Enum):
            return self._process_enum(obj)
        elif isinstance(obj, bool):
            self._write(
                self.config.boolValues[1] if obj else self.config.boolValues[0])
        elif isinstance(obj, str):
            self._write(fr'"{obj}"')
        elif isinstance(obj, int):
            self._write(self.config.intFormat.format(obj))
        elif isinstance(obj, float):
            self._write(self.config.floatFormat.format(obj))
        elif obj is None:
            return False
        else:
            raise RuntimeError(f"Object type not known: {obj}")

        return True

    def push_config(self, config: Config) -> None:
        self._config_stack.append(config)

    def pop_config(self) -> None:
        assert len(self._config_stack) > 0
        self._config_stack.pop()

    @property
    def config(self) -> Config:
        return self._config_stack[-1]

    def generate(self) -> str:
        return "".join(self._buffer)

    def __call__(self, obj, /) -> str:
        self.process(obj)
        return self.generate()
