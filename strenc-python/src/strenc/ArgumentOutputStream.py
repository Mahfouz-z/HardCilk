import io
from typing import Dict, Optional, Union, Callable, Any, BinaryIO, get_args, get_origin

from . import FIELD_SEPARATOR, SUBFIELD_SEPARATOR, PRIMITIVE_TYPES

ENCODERS: Dict[type, Callable[[Any, "ArgumentOutputStream"], None]] = {}


class ArgumentOutputStream:
    def __init__(self, io: BinaryIO) -> None:
        self._io = io

    def _pushbytes(self, x: bytes) -> None:
        self._io.write(x)

    def _pushstring(self, x: str) -> None:
        self._pushbytes(x.encode("utf-8"))

    def _pushint(self, x: int) -> None:
        # TODO make sure that this is locale independent
        self._pushstring(str(x))

    def _pushfloat(self, x: float) -> None:
        # TODO make sure that this is locale independent
        self._pushstring(str(x))

    def _pushfield(self) -> None:
        self._io.write(FIELD_SEPARATOR)

    def _pushsubfield(self) -> None:
        self._io.write(SUBFIELD_SEPARATOR)

    def push(self, obj: Any, t: Optional[Any] = None) -> "ArgumentOutputStream":
        if t is None:
            self.push(obj, type(obj))
        elif get_origin(t) == list:
            self._pushint(len(obj))
            self._pushsubfield()
            for x in obj:
                self.push(x, get_args(t)[0])
        elif get_origin(t) == tuple:
            for x, tt in zip(obj, get_args(t)):
                self.push(x, tt)
        elif get_origin(t) == Union:
            # this should be an optional, check if that is the case
            assert len(get_args(t)) == 2 and get_args(t)[1] == type(None)
            if obj is not None:
                self.push(True, bool)
                self.push(obj, get_args(t)[0])
            else:
                self.push(False, bool)
        elif t == str:
            self.push(obj.encode("utf-8"), bytes)
        elif t == bytes:
            self._pushint(len(obj))
            self._pushsubfield()
            self._pushbytes(obj)
        elif t == bool:
            self._pushbytes(b"T" if obj else b"F")
        elif t == int:
            # TODO make sure that this is locale-independent
            self._pushint(obj)
            self._pushfield()
        elif t == float:
            # TODO make sure that this is locale-independent
            self._pushfloat(obj)
            self._pushfield()
        elif t == list:
            # list, but the type is not known
            length = len(obj)
            self._pushint(length)
            self._pushsubfield()
            if length > 0:
                tt = type(obj[0])
                for x in obj:
                    assert type(x) == tt, \
                        "list elements should be all the same type"
                    self.push(x, type(x))
        elif t == tuple:
            for x in obj:
                self.push(x, type(x))
        elif isinstance(t, str):
            # string, the type name was given explicitly
            if (tt := PRIMITIVE_TYPES.get(t)) is not None:
                self.push(obj, tt)
            else:
                ENCODERS[t](obj, self)
        else:
            self.push(obj, t.__qualname__)

        return self

    def close(self) -> None:
        self._io.close()


def encoder(t: type):
    def wrapper(fn: Callable[[Any, "ArgumentOutputStream"], None]):
        ENCODERS[t.__qualname__] = fn
        return fn
    return wrapper


def encodebytes(obj: Any) -> bytes:
    bytesio = io.BytesIO()
    output = ArgumentOutputStream(bytesio)
    output.push(obj)
    return bytesio.getvalue()
