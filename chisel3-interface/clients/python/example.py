from chisel3.interface.net import connect
import dataclasses
import strenc
from pathlib import Path

SERVER_ADDRESS = "127.0.0.1"
SERVER_PORT = 9100


@strenc.register_dataclass
@dataclasses.dataclass
class BasicModule:
    data: int


@strenc.register_dataclass
@dataclasses.dataclass
class ExtraModule:
    data: int


def main() -> None:
    with connect(SERVER_ADDRESS, SERVER_PORT) as chisel:
        chisel.emitverilog(BasicModule(0x0DEADB00), targetdir=Path("output/"))
        print(chisel.emitverilog(ExtraModule(0x0DEADABC), targetdir=Path("output/")))


if __name__ == "__main__":
    main()
