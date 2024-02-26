import strenc
import dataclasses


@dataclasses.dataclass(frozen=True)
class Request:
    name: str
    command: str


Request.__qualname__ = "chisel3.interface.Request"
strenc.register_dataclass(Request)


@dataclasses.dataclass(frozen=True)
class Response:
    name: str
    success: bool
    errorMsg: str


Response.__qualname__ = "chisel3.interface.Response"
strenc.register_dataclass(Response)
