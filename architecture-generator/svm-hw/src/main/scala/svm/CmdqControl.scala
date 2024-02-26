package svm

import chisel3._
import strenc.{ArgumentInputStream, ArgumentOutputStream}

/** Command queue control block for implementing the Cmdq-protocol.
  *
  * @param cfgAxiMgmt
  *   Desired AXI4-Lite 32-bit configuration. Only address width might be
  *   choosed.
  */
class CmdqControl(
    val cfgAxiMgmt: axi4.Config =
      axi4.Config(wAddr = 32, wData = 32, lite = true)
) extends Module {
  assert(cfgAxiMgmt.lite, "Configuration port must use AXI4-Lite")
  assert(cfgAxiMgmt.wData == 32, "Configuration port must be 32-bits long")

  val mgmt = IO(axi4.Slave(cfgAxiMgmt)).suggestName("S_AXIL_MGMT")

  val irq = IO(new Bundle {
    val REQ = Output(Bool())
    val REQDONE = Output(Bool())
  }).suggestName("IRQ")

  private val regBlock = new axi4.lite.RegisterBlock(
    wAddr = cfgAxiMgmt.wAddr,
    wData = cfgAxiMgmt.wData,
    wMask = 8,
    numOutstandingReads = 1,
    numOutstandingWrites = 1
  )

  private val regRequest = RegInit(false.B)
  private val regRequestDone = RegInit(false.B)
  private val regLength = RegInit(0.U(32.W))

  regBlock.base(0x00)
  regBlock.reg(regRequest, desc = "Request")
  regBlock.reg(regRequestDone, desc = "Request done")
  regBlock.reg(regLength, desc = "Length of the command queue")

  irq.REQ <> regRequest
  irq.REQDONE <> regRequestDone

  mgmt.liteRW <> regBlock.saxil

  when(regBlock.rdReq) {
    regBlock.rdOk()
  }

  when(regBlock.wrReq) {
    regBlock.wrOk()
  }

  def saveRegisterMap(directory: String, name: String) = {
    regBlock.saveRegisterMap(directory, name)
  }
}

object CmdqControl extends strenc.UserTypeCompanion[CmdqControl] {

  override def encode(t: CmdqControl, os: ArgumentOutputStream): Unit = {
    os.push(t.cfgAxiMgmt)
  }

  override def decode(is: ArgumentInputStream): CmdqControl = {
    new CmdqControl(is.pop[axi4.Config])
  }
}

object EmitCmdqControl extends App {
  import chisel3.stage.ChiselStage

  val targetDir = "output/"
  val designName = "CmdqControl"

  (new java.io.File(targetDir)).mkdirs()

  def fnDevice = new CmdqControl

  (new ChiselStage).emitVerilog(
    {
      val dev = fnDevice
      dev.saveRegisterMap(targetDir, designName)
      dev
    },
    Array("--target-dir", targetDir)
  )
}
