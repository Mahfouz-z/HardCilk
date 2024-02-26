import uartdbg
import dataclasses

UART_PARAMS = {"port": "/dev/ttyUSB0", "baudrate": 9600}

BASEADDR = 0xF0000000
OFFSET_PAUSE = 0x00000000
OFFSET_RDINDEX = 0x00000004
OFFSET_RDENTRY_0 = 0x00000008
OFFSET_RDENTRY_1 = 0x0000000c
OFFSET_RDENTRY_2 = 0x00000010
OFFSET_RDENTRY_3 = 0x00000014
OFFSET_LOOKUP_MODE = 0x00000018
OFFSET_LOOKUP_ADDR_0 = 0x0000001c
OFFSET_LOOKUP_ADDR_1 = 0x00000020
OFFSET_LOOKUP_ENTRY_0 = 0x00000024
OFFSET_LOOKUP_ENTRY_1 = 0x00000028
OFFSET_LOOKUP_ENTRY_2 = 0x0000002c
OFFSET_LOOKUP_ENTRY_3 = 0x00000030
OFFSET_LOOKUP_FOUND = 0x00000034
OFFSET_LOOKUP_INDEX = 0x00000038
OFFSET_WRINDEX = 0x0000003c
OFFSET_WRENTRY_0 = 0x00000040
OFFSET_WRENTRY_1 = 0x00000044
OFFSET_WRENTRY_2 = 0x00000048
OFFSET_WRENTRY_3 = 0x0000004c
OFFSET_NUM_OUTSTANDING = 0x00000050
OFFSET_AXI_ADDR_0 = 0x00000054
OFFSET_AXI_ADDR_1 = 0x00000058
OFFSET_COMMAND = 0x0000005c
OFFSET_WAITLOCK = 0x00000060

CMD_MODIFY_LOOKUP = 0x12
CMD_MODIFY_INDEX = 0x13
CMD_ADD = 0x32

LOOKUP_AXI_ADDR = 0
LOOKUP_USER = 1

PAGE_WOFFSET = 12

@dataclasses.dataclass
class Entry:
    valid: bool
    tag_from: int
    tag_to: int

    def encode(self) -> bytes:
        lower = self.tag_to << PAGE_WOFFSET
        higher = ((1 if self.valid else 0) << 62) | (self.tag_from << PAGE_WOFFSET)
        return lower.to_bytes(8, "little") + higher.to_bytes(8, "little")
    
    @staticmethod
    def decode(b: bytes) -> "Entry":
        assert len(b) == 16
        lower = int.from_bytes(b[0:8], "little")
        higher = int.from_bytes(b[8:16], "little")

        return Entry(
            valid=(higher & (1 << 62)) > 0,
            tag_from=(higher & ((1 << 56) - 1)) >> PAGE_WOFFSET,
            tag_to=(lower & ((1 << 56) - 1)) >> PAGE_WOFFSET
        )

    def __str__(self) -> str:
        return f"Entry({'V' if self.valid else 'I'}, {self.tag_from :x} -> {self.tag_to :x})"

def main() -> None:
    board = uartdbg.board(**UART_PARAMS)

    def write32(offset: int, value: int) -> None:
        board.write32(BASEADDR + offset, value)
    
    def writeentry(offset: int, entry: Entry) -> None:
        board.writebytes(BASEADDR + offset, entry.encode())
    
    def writeaddr(offset: int, addr: int) -> None:
        board.writebytes(BASEADDR + offset, addr.to_bytes(8, byteorder="little"))
    
    def read32(offset: int) -> int:
        return board.read32(BASEADDR + offset)

    def readentry(offset: int) -> Entry:
        return Entry.decode(board.readbytes(BASEADDR + offset, 16))

    def readaddr(offset: int) -> None:
        return int.from_bytes(board.readbytes(BASEADDR + offset, 8), "little")

    write32(OFFSET_PAUSE, 1)

    # add an entry to the zeroth index
    write32(OFFSET_WRINDEX, 0)
    writeentry(OFFSET_WRENTRY_0, Entry(True, 0xDEAD, 0xF00D))
    print(readentry(OFFSET_WRENTRY_0))
    write32(OFFSET_COMMAND, CMD_MODIFY_INDEX)

    # verify if the entry can be read
    write32(OFFSET_RDINDEX, 0)
    print(readentry(OFFSET_RDENTRY_0))

    # now, verify a translation
    write32(OFFSET_LOOKUP_MODE, LOOKUP_USER)
    writeaddr(OFFSET_LOOKUP_ADDR_0, 0xDEAD_123)
    print(f"{ readaddr(OFFSET_LOOKUP_ADDR_0) :x}")
    print(read32(OFFSET_LOOKUP_FOUND))
    print(read32(OFFSET_LOOKUP_INDEX))

    read32(OFFSET_PAUSE)


if __name__ == "__main__":
    main()
