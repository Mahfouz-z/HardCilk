from fsobj import *
from modules import *
from chisel3.interface.net import connect as chisel_connect

CHISEL_SERVER_CONFIG = {
    "address": "127.0.0.1",
    "portnumber": 9100
}

def main() -> None:
    objectstore = ObjectStore("./artifacts")

    # TODO auto alias with __str__ for .alias()
    ipnode = objectstore.frompath("ip").alias()

    # create a register block to be used with pcie interrupts
    with chisel_connect(**CHISEL_SERVER_CONFIG) as chisel:
        chisel.emitverilog(
            axi4.lite.RegisterLogic(32, 32, "registerLogicPCIe"),
            targetdir=ipnode.child("registerLogicPCIe").alias().path
        )

if __name__ == "__main__":
    main()
