package axi4

import chisel3._
import strenc.ArgumentOutputStream
import strenc.ArgumentInputStream

// TODO maybe bring in the `cache` flags
// TODO may support ACE as well?

object BurstFlag {
  val FIXED = 0x0.U(2.W)
  val INCR = 0x1.U(2.W)
  val WRAP = 0x2.U(2.W)
}

object ResponseFlag {
  val OKAY = 0x0.U(2.W)
  val EXOKAY = 0x1.U(2.W)
  val SLVERR = 0x2.U(2.W)
  val DECERR = 0x3.U(2.W)
}

/** AXI4 interface configuration.
  *
  * @param wId
  *   identification tag width
  * @param wAddr
  *   address width
  * @param wData
  *   data bus width
  * @param read
  *   enable read channels
  * @param write
  *   enable write channels
  * @param lite
  *   use AXI4-Lite variant
  * @param wUserReq
  *   data width for ARUSER and AWUSER (see p. A8-104 in ARM IHI 0022H.c)
  * @param wUserData
  *   user data width for RUSER and WUSER (see p. A8-104 in ARM IHI 0022H.c)
  * @param wUserResp
  *   user data width for RUSER and BUSER (see p. A8-104 in ARM IHI 0022H.c)
  */
case class Config(
    val wId: Int = 4,
    val wAddr: Int = 32,
    val wData: Int = 32,
    val read: Boolean = true,
    val write: Boolean = true,
    val lite: Boolean = false,
    val wUserReq: Int = 0,
    val wUserData: Int = 0,
    val wUserResp: Int = 0
) {
  assert(wData >= 8)
  assert(util.isPow2(wData))
  assert(!lite || (wData == 32 || wData == 64))

  /** user data width for the read data channel */
  val wUserReadData = wUserData + wUserResp

  /** width of the strobe signal for the write data channel */
  val wStrobe = wData / 8
}

object Config extends strenc.UserTypeCompanion[Config] {
  import strenc.EncodersDecoders._

  override def encode(t: Config, os: ArgumentOutputStream): Unit = {
    os.push(t.wId)
    os.push(t.wAddr)
    os.push(t.wData)
    os.push(t.read)
    os.push(t.write)
    os.push(t.lite)
    os.push(t.wUserReq)
    os.push(t.wUserData)
    os.push(t.wUserResp)
  }

  override def decode(is: ArgumentInputStream): Config = {
    Config(
      is.pop[Int],
      is.pop[Int],
      is.pop[Int],
      is.pop[Boolean],
      is.pop[Boolean],
      is.pop[Boolean],
      is.pop[Int],
      is.pop[Int],
      is.pop[Int]
    )
  }
}

/** AXI4 interface that complies with the standard naming convention.
  *
  * This interface is not supposed to be used directly. Please use
  * `.full[R/W/RW]` and `.lite[R/W/RW]` functions defined in corresponding
  * implicit classes.
  *
  * @param cfg
  *   configuration
  */
class Interface(slave: Boolean)(implicit val cfg: Config) extends Bundle {

  val ARREADY = if (cfg.read) Some(Input(Bool())) else None
  val ARVALID = if (cfg.read) Some(Output(Bool())) else None
  val ARID =
    if (cfg.read && !cfg.lite) Some(Output(UInt(cfg.wId.W))) else None
  val ARADDR = if (cfg.read) Some(Output(UInt(cfg.wAddr.W))) else None
  val ARLEN = if (cfg.read && !cfg.lite) Some(Output(UInt(8.W))) else None
  val ARSIZE = if (cfg.read && !cfg.lite) Some(Output(UInt(3.W))) else None
  val ARBURST = if (cfg.read && !cfg.lite) Some(Output(UInt(2.W))) else None
  val ARLOCK = if (cfg.read && !cfg.lite) Some(Output(Bool())) else None
  val ARCACHE = if (cfg.read && !cfg.lite) Some(Output(UInt(4.W))) else None
  val ARPROT = if (cfg.read) Some(Output(UInt(3.W))) else None
  val ARQOS = if (cfg.read && !cfg.lite) Some(Output(UInt(4.W))) else None
  val ARREGION = if (cfg.read && !cfg.lite) Some(Output(UInt(4.W))) else None
  val ARUSER =
    if (cfg.read && cfg.wUserReq > 0 && !cfg.lite)
      Some(Output(Bits(cfg.wUserReq.W)))
    else None

  val RREADY = if (cfg.read) Some(Output(Bool())) else None
  val RVALID = if (cfg.read) Some(Input(Bool())) else None
  val RID =
    if (cfg.read && !cfg.lite) Some(Input(UInt(cfg.wId.W))) else None
  val RDATA = if (cfg.read) Some(Input(Bits(cfg.wData.W))) else None
  val RRESP = if (cfg.read) Some(Input(UInt(2.W))) else None
  val RLAST = if (cfg.read && !cfg.lite) Some(Input(Bool())) else None
  val RUSER =
    if (cfg.read && cfg.wUserReadData > 0 && !cfg.lite)
      Some(Input(Bits(cfg.wUserReadData.W)))
    else None

  val AWREADY = if (cfg.write) Some(Input(Bool())) else None
  val AWVALID = if (cfg.write) Some(Output(Bool())) else None
  val AWID =
    if (cfg.write && !cfg.lite) Some(Output(UInt(cfg.wId.W))) else None
  val AWADDR = if (cfg.write) Some(Output(UInt(cfg.wAddr.W))) else None
  val AWLEN = if (cfg.write && !cfg.lite) Some(Output(UInt(8.W))) else None
  val AWSIZE = if (cfg.write && !cfg.lite) Some(Output(UInt(3.W))) else None
  val AWBURST = if (cfg.write && !cfg.lite) Some(Output(UInt(2.W))) else None
  val AWLOCK = if (cfg.write && !cfg.lite) Some(Output(Bool())) else None
  val AWCACHE = if (cfg.write && !cfg.lite) Some(Output(UInt(4.W))) else None
  val AWPROT = if (cfg.write) Some(Output(UInt(3.W))) else None
  val AWQOS = if (cfg.write && !cfg.lite) Some(Output(UInt(4.W))) else None
  val AWREGION = if (cfg.write && !cfg.lite) Some(Output(UInt(4.W))) else None
  val AWUSER =
    if (cfg.write && cfg.wUserReq > 0 && !cfg.lite)
      Some(Output(Bits(cfg.wUserReq.W)))
    else None

  val WREADY = if (cfg.write) Some(Input(Bool())) else None
  val WVALID = if (cfg.write) Some(Output(Bool())) else None
  val WID =
    if (cfg.write && !cfg.lite) Some(Output(UInt(cfg.wId.W))) else None
  val WDATA = if (cfg.write) Some(Output(Bits(cfg.wData.W))) else None
  val WSTRB = if (cfg.write) Some(Output(UInt(cfg.wStrobe.W))) else None
  val WLAST = if (cfg.write && !cfg.lite) Some(Output(Bool())) else None
  val WUSER =
    if (cfg.write && cfg.wUserData > 0 && !cfg.lite)
      Some(Output(Bits(cfg.wUserData.W)))
    else None

  val BREADY = if (cfg.write) Some(Output(Bool())) else None
  val BVALID = if (cfg.write) Some(Input(Bool())) else None
  val BID =
    if (cfg.write && !cfg.lite) Some(Input(UInt(cfg.wId.W))) else None
  val BRESP = if (cfg.write) Some(Input(UInt(2.W))) else None
  val BUSER =
    if (cfg.write && cfg.wUserResp > 0 && !cfg.lite)
      Some(Input(Bits(cfg.wUserResp.W)))
    else None

  /** Drives the default (and safe) values. Works for both master and slave
    * interfaces.
    *
    * @note
    *   Required signals are not driven. (see p. A9-110 in ARM IHI 0022H.c)
    * @note
    *   Valid/ready signals are not driven.
    * @note
    *   User signals are not driven.
    * @note
    *   RLAST and WLAST are driven.
    */
  def driveDefaults = {
    val defaultStrobe = (-1).S(cfg.wStrobe.W).asUInt()

    if (cfg.lite) {
      if (!slave)
        if (cfg.write) WSTRB.get := defaultStrobe
    } else if (!slave) {
      if (cfg.read) {
        ARID.get := 0.U
        ARLEN.get := 1.U
        ARSIZE.get := cfg.wData.U
        ARBURST.get := BurstFlag.INCR
        ARLOCK.get := 0.U
        ARCACHE.get := 0.U
        ARQOS.get := 0.U
        ARREGION.get := 0.U
      }

      if (cfg.write) {
        AWID.get := 0.U
        AWLEN.get := 1.U
        AWSIZE.get := cfg.wData.U
        AWBURST.get := BurstFlag.INCR
        AWLOCK.get := 0.U
        AWCACHE.get := 0.U
        AWQOS.get := 0.U
        AWREGION.get := 0.U

        WID.get := 0.U
        WSTRB.get := defaultStrobe
        WLAST.get := true.B
      }
    } else {
      if (cfg.read) {
        RID.get := 0.U
        RRESP.get := ResponseFlag.OKAY
        RLAST.get := true.B
      }

      if (cfg.write) {
        BID.get := 0.U
        BRESP.get := ResponseFlag.OKAY
      }
    }
  }
}
object Master {

  /** create an AXI4 master interface with the given configuration. */
  def apply(implicit cfg: Config) = new Interface(false)(cfg)
}

object Slave {

  /** create an AXI4 slave interface with the given configuration. */
  def apply(implicit cfg: Config) = Flipped(new Interface(true)(cfg))
}

object Util {

  /** Implements logic for write strobe */
  def writeStrobeLogic(original: Bits, wdata: Bits, wstrb: Bits): Bits = {
    assert(original.getWidth == wdata.getWidth)
    assert(wstrb.getWidth == original.getWidth / 8)

    VecInit(
      wstrb.asBools.zipWithIndex.map{
        case (strobe, idx) => {
          val byte_wdata = wdata((idx + 1) * 8 - 1, idx * 8)
          val byte_original = original((idx + 1) * 8 - 1, idx * 8)
          Mux(strobe, byte_wdata, byte_original)
        }
      }
    ).asUInt
  }
}

