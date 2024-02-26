from dataclasses import dataclass
from strenc import register_dataclass
from typing import *


class axi4:
    @dataclass(frozen=True)
    class Config:
        wId: int = 4
        wAddr: int = 32
        wData: int = 32
        read: bool = True
        write: bool = True
        lite: bool = False
        wUserReq: int = 0
        wUserData: int = 0
        wUserResp: int = 0

    class tlb:
        @dataclass(frozen=True)
        class TLBEntry:
            wStatus: int
            wTagFrom: int
            wTagTo: int
            wOffset: int

        @dataclass(frozen=True)
        class L1TLB:
            numEntries: int
            tlbEntry: "axi4.components.TLBEntry"
            cfgAxi: "axi4.Config"
            writeTLB: bool

        @dataclass(frozen=True)
        class Translator:
            numEntries: int
            logPageSize: int
            cfgAxi: "axi4.Config"

    class lite:
        @dataclass(frozen=True)
        class RegisterLogic:
            wAddr: int
            wData: int
            customName: Optional[str] = None


register_dataclass(axi4.Config)
register_dataclass(axi4.tlb.L1TLB)
register_dataclass(axi4.tlb.TLBEntry)
register_dataclass(axi4.tlb.Translator)
register_dataclass(axi4.lite.RegisterLogic)

