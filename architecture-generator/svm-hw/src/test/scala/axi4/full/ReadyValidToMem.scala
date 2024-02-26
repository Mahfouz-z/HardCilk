package axi4.full

import chisel3._
import chisel3.util._

import axi4.lite.RegisterBlock
import axi4.BurstFlag

class ReadValidToMem[T <: Data](val gen: T, val axiFullCfg: axi4.Config) extends Module {
  private val regBlock = new RegisterBlock(wAddr = axiFullCfg.wAddr, wData = 64)

  val in = IO(Input(new IrrevocableIO(gen)))
  val axi_mgmt = IO(axi4.Slave(regBlock.axiConfig)).suggestName("S_AXI_MGMT")
  val axi = IO(axi4.Master(axiFullCfg))

  regBlock.saxil <> axi_mgmt.liteRW

  assert(axiFullCfg.wData >= gen.getWidth)
  assert(!axiFullCfg.lite)
  assert(axiFullCfg.wAddr <= 64)

  private val rPause = RegInit(false.B)
  private val rAddr = RegInit(0.U(64.W))

  // management registers
  regBlock.base(0x00)
  regBlock.reg(rPause, read = true, write = true, desc = "Paused or not.")
  regBlock.reg(rAddr, read = true, write = true, desc = "Address to start writing")
  
  private val axiData = axi.fullW
  
  private val doTransfer =
    !rPause && in.valid && axiData.aw.ready && axiData.w.ready

  in.ready := doTransfer

  axiData.aw.valid := doTransfer
  axiData.w.valid := doTransfer

  axiData.aw.bits.addr := rAddr
  axiData.aw.bits.burst := BurstFlag.INCR
  axiData.aw.bits.cache := 0.U
  axiData.aw.bits.id := 0.U
  axiData.aw.bits.len := 0.U
  axiData.aw.bits.lock := 0.U
  axiData.aw.bits.prot := 0.U
  axiData.aw.bits.qos := 0.U
  axiData.aw.bits.region := 0.U
  axiData.aw.bits.size := 7.U
  if (axiData.aw.bits.user.nonEmpty) {
    axiData.aw.bits.user.get := 0.U
  }

  axiData.w.bits.data := in.bits
  axiData.w.bits.id := 0.U
  axiData.w.bits.last := true.B
  axiData.w.bits.strb := (-1).S(axiFullCfg.wStrobe.W).asUInt
  if (axiData.w.bits.user.nonEmpty) {
    axiData.w.bits.user.get := 0.U
  }

  axiData.b.ready := true.B

  when (doTransfer) {
    rAddr := rAddr + (axiFullCfg.wData / 8).U
  }

  when (regBlock.rdReq) {
    regBlock.rdOk()
  }

  when (regBlock.wrReq) {
    regBlock.wrOk()
  }
}
