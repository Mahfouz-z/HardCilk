package svm

import chisel3._
import strenc.ArgumentOutputStream
import strenc.ArgumentInputStream

/** Control block for the SVM hardware. Specialized for AXI4, MicroBlaze card
  * and PCIe host. All the interrupts are edge-triggered.
  *
  * @param cfgAxiMgmt
  *   Desired AXI4-Lite 32-bit configuration. Only address width might be
  *   choosed.
  */
class ControlBlock(
    val cfgAxiMgmt: axi4.Config =
      axi4.Config(wAddr = 32, wData = 32, lite = true)
) extends Module {
  assert(cfgAxiMgmt.lite, "Configuration port must use AXI4-Lite")
  assert(cfgAxiMgmt.wData == 32, "Configuration port must be 32-bits long")

  val mgmt = IO(axi4.Slave(cfgAxiMgmt)).suggestName("S_AXIL_MGMT")
  val io = IO(new Bundle {

    /** connected to the interrupt port of the card */
    val cardRequest = Output(Bool())

    /** connected to the interrupt port of the card */
    val hostRequestDone = Output(Bool())

    /** connected to the interrupt port of the host */
    val hostRequest = Output(Bool())

    /** connected to the interrupt port of the host */
    val cardRequestDone = Output(Bool())

    /** connected to the reset port of the card */
    val cardReset = Output(Bool())
  })

  private val registerBlock = new axi4.lite.RegisterBlock(
    wAddr = cfgAxiMgmt.wAddr,
    wData = cfgAxiMgmt.wData,
    wMask = 8,
    numOutstandingReads = 1,
    numOutstandingWrites = 1
  )

  val regCardRequest = RegInit(false.B)
  val regHostRequestDone = RegInit(false.B)
  val regHostRequest = RegInit(false.B)
  val regCardRequestDone = RegInit(false.B)
  val regCardReset = RegInit(true.B)

  io.cardRequest <> regCardRequest
  io.hostRequestDone <> regHostRequestDone
  io.hostRequest <> regHostRequest
  io.cardRequestDone <> regCardRequestDone
  io.cardReset <> regCardReset

  registerBlock.base(0x00)
  registerBlock.reg(
    regCardRequest,
    desc = "Request to card, written by the host"
  )
  registerBlock.reg(
    regHostRequestDone,
    desc = "Host completes the request, written by the host"
  )
  registerBlock.reg(
    regHostRequest,
    desc = "Request to host, written by the card"
  )
  registerBlock.reg(
    regCardRequestDone,
    desc = "Card completes the request, written by the card"
  )
  registerBlock.reg(
    regCardReset,
    desc = "Card reset, ACTIVE_HIGH, initially HIGH"
  )

  mgmt.liteRW <> registerBlock.saxil

  when(registerBlock.rdReq) {
    registerBlock.rdOk()
  }

  when(registerBlock.wrReq) {
    registerBlock.wrOk()
  }

  def saveRegisterMap(directory: String, name: String) = {
    registerBlock.saveRegisterMap(directory, name)
  }
}

object ControlBlock extends strenc.UserTypeCompanion[ControlBlock] {

  override def encode(t: ControlBlock, os: ArgumentOutputStream): Unit = {
    os.push(t.cfgAxiMgmt)
  }

  override def decode(is: ArgumentInputStream): ControlBlock = {
    new ControlBlock(is.pop[axi4.Config])
  }
}

object EmitControlBlock extends App {
  import chisel3.stage.ChiselStage

  val targetDir = "output/"
  val designName = "ControlBlock"

  (new java.io.File(targetDir)).mkdirs()

  def fnDevice = new ControlBlock

  (new ChiselStage).emitVerilog(
    {
      val dev = fnDevice
      dev.saveRegisterMap(targetDir, designName)
      dev
    },
    Array("--target-dir", targetDir)
  )
}
