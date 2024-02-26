package axis4

import chisel3._
import chisel3.util._
import chisel3.experimental.dataview._

case class Config(
    val wData: Int,
    val onlyRV: Boolean = false,
    val wId: Int = 0,
    val wDest: Int = 0,
    val wUser: Int = 0
) {
  assert(wData % 8 == 0)

  val wStrobe = wData / 8
  val wKeep = wStrobe
}

class Interface(val slave: Boolean)(implicit val cfg: Config) extends Bundle {
  val TREADY = Input(Bool())
  val TVALID = Output(Bool())
  val TDATA = Output(UInt(cfg.wData.W))
  val TSTRB = if (!cfg.onlyRV) Some(Output(UInt(cfg.wStrobe.W))) else None
  val TKEEP = if (!cfg.onlyRV) Some(Output(UInt(cfg.wKeep.W))) else None
  val TLAST = if (!cfg.onlyRV) Some(Output(Bool())) else None
  val TID =
    if (!cfg.onlyRV && cfg.wId > 0) Some(Output(UInt(cfg.wId.W))) else None
  val TDEST =
    if (!cfg.onlyRV && cfg.wDest > 0) Some(Output(UInt(cfg.wDest.W))) else None
  val TUSER =
    if (!cfg.onlyRV && cfg.wUser > 0) Some(Output(UInt(cfg.wUser.W))) else None
}

object Master {

  /** create an AXI4-stream master interface with the given configuration. */
  def apply(implicit cfg: Config) = new Interface(false)(cfg)
}

object Slave {

  /** create an AXI4-stream slave interface with the given configuration. */
  def apply(implicit cfg: Config) = Flipped(new Interface(true)(cfg))
}

object Interface {

  implicit val view = DataView[Interface, DecoupledIO[UInt]](
    interface => DecoupledIO(UInt(interface.cfg.wData.W)),
    _.TREADY -> _.ready,
    _.TVALID -> _.valid,
    _.TDATA -> _.bits
  )
}

object app extends App {
  import Interface._

  // impliocit view is visible
  new Interface(false)(null).viewAs[DecoupledIO[UInt]]
}
