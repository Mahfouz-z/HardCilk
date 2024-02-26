package axi4.lite

import chisel3._
import chisel3.util._
import axi4._

class SimpleMemoryMappedDevice extends Module {
  private val regBlock = new axi4.lite.RegisterBlock(32, 32, 8)
  implicit val axiConfig = regBlock.axiConfig

  val SAXIL = IO(axi4.Slave(axiConfig))

  SAXIL.liteRW <> regBlock.saxil

  private val reg1 = RegInit(0.U(8.W))
  private val reg2 = RegInit(0.U(32.W))

  regBlock.base(0x00)
  regBlock.reg(reg1, read = true, write = true, desc = "REG1")
  regBlock.reg(reg2, read = true, write = true, desc = "REG2")
  regBlock.reg(48.U, read = true, write = false, desc = "CONST")

  private val region1 = regBlock.reserve(64, desc = "REGION")

  regBlock.saveRegisterMap("output", "SimpleMemoryMapped.registers")

  when(regBlock.rdReq) {
    when(regBlock.rdAddr >= region1.U) {
      // return the address - offset as the read data
      regBlock.rdOk(regBlock.rdAddr - region1.U)
    }.otherwise {
      // return the previously registered wire as the read data
      regBlock.rdOk()
    }
  }

  when(regBlock.wrReq) {
    // accept any write
    regBlock.wrOk()

    // regBlock.wrData // or, do a custom thing with the write data
  }
}

object main extends App {
  import chisel3.stage.ChiselStage

  (new ChiselStage).emitVerilog(new SimpleMemoryMappedDevice, Array("--target-dir", "output/"))
}

