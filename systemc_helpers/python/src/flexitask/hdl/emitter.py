import chisel3.interface.net
import strenc
import dataclasses
import os
import json
import pathlib
from typing import *


@dataclasses.dataclass
class fullSysGen:
    taskDescriptionJson: str


fullSysGen.__qualname__ = "fullSysGen.fullSysGen"
strenc.register_dataclass(fullSysGen)


def _env_or_default(var: str, default: Any) -> Any:
    if var in os.environ:
        return type(default)(os.environ[var])
    else:
        return default


def _to_json(d: Dict) -> str:
    return json.dumps(d)


_server = (
    _env_or_default("HDLGEN_SERVER", "127.0.0.1"),
    _env_or_default("HDLGEN_PORT", 9215)
)


def emit_verilog(
        d: Dict,
        targetdir: Optional[Union[pathlib.Path, str]] = None,
        server: Tuple[str, int] = _server) -> str:  # type: ignore
    with chisel3.interface.net.connect(*server) as chisel:
        result = chisel.emitverilog(
            fullSysGen(_to_json(d)),
            targetdir=targetdir
        )
        assert result is not None
        assert isinstance(result.obj, str)
        return result.obj


__all__ = [
    "emit_verilog"
]
