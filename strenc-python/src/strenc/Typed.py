from .ArgumentInputStream import decoder, ArgumentInputStream
from .ArgumentOutputStream import encoder, ArgumentOutputStream
from . import PRIMITIVE_TYPES
import dataclasses
from typing import Optional, Any, List, get_args, get_origin, Union


@dataclasses.dataclass(frozen=True)
class Typed:
    """Associates an object with a type. Use `typed(obj, t)` to construct."""

    #: The object is a primitive, such as `str` or `List[Typed]`
    primitive: bool

    #: Type of the object.
    #: For aggregate types, only `List[Typed]` and `Optional[Typed]` are allowed.
    #: For primitive objects, can never be a `str`.
    #: Not nullable.
    t: Any

    #: Wrapped object.
    obj: object

    #: returns the typename
    typename: str = None

    def __post_init__(self) -> None:
        global _PRIMITIVE_CHECK
        assert self.t is not None
        assert not self.primitive or self.primitive and not isinstance(
            self.t, str)
        assert not self.primitive or self.primitive and self.t in _PRIMITIVE_CHECK
        assert self.typename is not None


_PRIMITIVE_CHECK = [List[Typed], Optional[Typed], str, bytes, bool, float, int]


def typed(obj: Any, t: Optional[Any] = None) -> Typed:
    if isinstance(obj, Typed):
        # Calling typed on a typed should not do anything
        if t != Typed:
            assert obj.t == t
        return obj
    if t is None or t == Typed:
        return typed(obj, type(obj))

    if get_origin(t) == list:
        assert type(obj) == list or type(obj) == tuple
        return Typed(
            True,
            List[Typed],
            [typed(x, get_args(t)[0]) for x in obj],
            "List"
        )
    elif get_origin(t) == tuple:
        # Tuples must be converted to List[Typed]
        assert type(obj) == tuple
        return Typed(
            True,
            List[Typed],
            [typed(x, tt) for x, tt in zip(obj, get_args(t))],
            "List"
        )
    elif get_origin(t) == Union:
        # this should be an optional, check if that is the case
        assert len(get_args(t)) == 2 and get_args(t)[1] == type(None)
        if get_args(t)[0] == Typed:
            assert type(obj) == Typed
            return Typed(True, Optional[Typed], obj, "Option")
        else:
            if obj is not None:
                return Typed(True, Optional[Typed], typed(obj, get_args(t)[0]), "Option")
            else:
                return Typed(True, Optional[Typed], None, "Option")
    elif t == str:
        return Typed(True, t, obj, "String")
    elif t == bytes:
        return Typed(True, t, obj, "ByteArray")
    elif t == bool:
        return Typed(True, t, obj, "Boolean")
    elif t == int:
        return Typed(True, t, obj, "Long")
    elif t == float:
        return Typed(True, t, obj, "Double")
    elif t == list:
        assert all([type(x) == Typed for x in obj])
        return Typed(True, List[Typed], obj, "List")
    elif t == tuple:
        assert all([type(x) == Typed for x in obj])
        return Typed(True, List[Typed], list(obj), "List")
    elif isinstance(t, str):
        assert t != "List" and t != "Option", "List and Option require a type parameter"
        if t == "List" or t == "list":
            return typed(obj, list)
        elif t == "Option":
            return typed(obj, Optional[Any])
        elif x := PRIMITIVE_TYPES.get(t) is not None:
            return Typed(True, x, obj, t)
        else:
            return Typed(False, t, obj, t)
    else:
        return Typed(False, t, obj, t.__qualname__)


@encoder(Typed)
def _(t: Typed, output: ArgumentOutputStream) -> None:
    output.push(t.primitive, bool)
    output.push(t.typename, str)
    output.push(t.obj, t.t)


@decoder(Typed)
def _(input: ArgumentInputStream) -> Typed:
    primitive = input.pop(bool)
    typename = input.pop(str)

    if primitive:
        if typename == "List":
            return Typed(True, List[Typed], input.pop(List[Typed]), typename)
        elif typename == "Option":
            return Typed(True, Optional[Typed], input.pop(Optional[Typed]), typename)
        else:
            obj = input.pop(typename)
            return Typed(True, type(obj), obj, typename)
    else:
        obj = input.pop(typename)
        return Typed(False, type(obj), obj, typename)
