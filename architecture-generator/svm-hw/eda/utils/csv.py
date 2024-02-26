import dataclasses
import builtins
from typing import Any, List, Tuple, Type, Union


@dataclasses.dataclass(frozen=True)
class Field:
    name: str
    t: type


class Flatten:
    def __init__(self) -> None:
        self._fields: Tuple[Field] = None

    @property
    def fields(self) -> Tuple[Field]:
        return self._fields

    def _init_fields(self, obj: Any) -> None:
        if self._fields is not None:
            return

        l: List[Field] = []

        def add_field(name: str, obj: Any) -> None:
            if dataclasses.is_dataclass(obj):
                for field in dataclasses.fields(obj):
                    add_field(
                        f"{name}.{field.name}",
                        getattr(obj, field.name))
            else:
                l.append(Field(name, type(obj)))

        add_field(obj.__class__.__name__, obj)
        self._fields = tuple(l)

    def flattenobj(self, obj: Any) -> Tuple[Any]:
        self._init_fields(obj)

        l: List[Any] = []

        def add_obj(obj: Any) -> None:
            if dataclasses.is_dataclass(obj):
                for field in dataclasses.fields(obj):
                    add_obj(getattr(obj, field.name))
            else:
                l.append(obj)

        add_obj(obj)
        return tuple(l)

    def __call__(self, obj: Any) -> Tuple[Any]:
        return self.flattenobj(obj)


class CSV:
    def __init__(self, separator: str = ";", newline: str = "\n") -> None:
        self._flatten = Flatten()
        self._separator: str = separator
        self._newline: str = newline
        self._lines: List[str] = []
        self._header = None

    @property
    def separator(self) -> str:
        return self._separator

    @property
    def newline(self) -> str:
        return self._newline

    @property
    def header(self) -> str:
        if self._header is None:
            self._header = self.separator.join([
                x.name for x in self._flatten.fields
            ])
        return self._header

    def contents(self) -> str:
        return self.newline.join(self._lines)

    def reset(self) -> None:
        self._lines.clear()

    def add_line(self, obj: Any) -> None:
        flattened = [str(x) for x in self._flatten(obj)]
        all([
            self.newline not in x and self.separator not in x
            for x in flattened
        ])
        self._lines.append(self.separator.join(flattened))
