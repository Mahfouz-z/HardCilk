import io
from typing import Dict, Union, Callable, Any, get_args, get_origin

from . import FIELD_SEPARATOR, SUBFIELD_SEPARATOR, PRIMITIVE_TYPES

DECODERS: Dict[str, Callable[["ArgumentInputStream"], Any]] = {}

class ArgumentInputStream:
    def __init__(self, io: io.BufferedReader, peeklen: int = 1) -> None:
        assert peeklen >= 1
        self._io = io
        self._peeklen = peeklen

    def _popbyte(self) -> int:
        res = self._io.read(1)
        if len(res) == 0:
            raise Exception("expected a byte to pop")
        return res[0]

    def _expectbyte(self, b: Union[bytes, int]) -> bool:
        def check(expected, other):
            if expected != other:
                raise Exception(f"unexpected byte {expected} != {other}")

        if isinstance(b, bytes):
            check(b[0], self._popbyte())
        else:
            check(b, self._popbyte())

    def _popuntilseparator(self) -> bytes:
        out = io.BytesIO()
        peeked = self._io.peek(self._peeklen)
        while len(peeked) > 0:
            idx1 = peeked.find(SUBFIELD_SEPARATOR)
            idx2 = peeked.find(FIELD_SEPARATOR)
            if idx1 < 0 and idx2 < 0:
                out.write(peeked)
                self._io.read(len(peeked))  # free the buffers
                peeked = self._io.peek(self._peeklen)
            else:
                idx = min(idx1, idx2) if idx1 >= 0 and idx2 >= 0 \
                    else max(idx1, idx2)
                out.write(peeked[0:idx])
                self._io.read(idx)
                break
        res = out.getvalue()
        out.close()
        return res

    def _popbytes(self) -> bytes:
        return self._popuntilseparator()

    def _popstring(self) -> str:
        return self._popbytes().decode("utf-8")

    def _popint(self) -> int:
        return int(self._popstring())

    def _popfloat(self) -> float:
        return float(self._popstring())

    def _popfixedlength(self, length: int) -> bytes:
        res = self._io.read(length)
        if len(res) != length:
            raise Exception(f"cannot read requested amount of data")
        return res

    def _popfield(self) -> None:
        self._expectbyte(FIELD_SEPARATOR)

    def _popsubfield(self) -> None:
        self._expectbyte(SUBFIELD_SEPARATOR)

    def pop(self, t: Any) -> Any:
        assert t is not None

        if get_origin(t) == list:
            length = self._popint()
            self._popsubfield()
            return list(self.pop(get_args(t)[0]) for _ in range(length))
        elif get_origin(t) == tuple:
            return tuple(self.pop(tt) for tt in get_args(t))
        elif get_origin(t) == Union:
            # this should be an optional, check if that is the case
            assert len(get_args(t)) == 2 and get_args(t)[1] == type(None)
            if self.pop(bool):
                return self.pop(get_args(t)[0])
            else:
                return None
        elif t == str:
            return self.pop(bytes).decode("utf-8")
        elif t == bytes:
            length = self._popint()
            self._popsubfield()
            return self._popfixedlength(length)
        elif t == bool:
            return self._popbyte() == ord("T")
        elif t == int:
            # TODO make sure that this is locale-independent
            result = self._popint()
            self._popfield()
            return result
        elif t == float:
            # TODO make sure that this is locale-independent
            result = self._popfloat()
            self._popfield()
            return result
        elif isinstance(t, str):
            # string, the type name was given explicitly
            if (tt := PRIMITIVE_TYPES.get(t)) is not None:
                return self.pop(tt)
            else:
                return DECODERS[t](self)
        else:
            return self.pop(t.__qualname__)

    def close(self) -> None:
        self._io.close()


def decoder(t: type):
    def wrapper(fn: Callable[["ArgumentInputStream"], Any]):
        DECODERS[t.__qualname__] = fn
        return fn
    return wrapper


def decodebytes(b: bytes, t: type) -> Any:
    input = ArgumentInputStream(
        io.BufferedReader(io.BytesIO(b), 32),
        peeklen=32
    )
    return input.pop(t)
