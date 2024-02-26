package axi4.full

import chisel3._
import chisel3.util.{IrrevocableIO, Irrevocable}
import chisel3.experimental.dataview.PartialDataView

import axi4.{Interface, Config}

/** Address channel. (AR and AW)
  *
  * @param cfg
  *   configuration
  */
class AddressChannel(implicit cfg: Config) extends Bundle {

  /** identification tag */
  val id = UInt(cfg.wId.W)

  /** the address of the first transfer */
  val addr = UInt(cfg.wAddr.W)

  /** the exact number of data transfers */
  val len = UInt(8.W)

  /** the number of bytes in each data transfer */
  val size = UInt(3.W)

  /** burst type */
  val burst = UInt(2.W)

  /** atomic access */
  val lock = Bool()

  /** cache flag */
  val cache = UInt(4.W)

  /** protection flag */
  val prot = UInt(3.W)

  /** quality-of-service */
  val qos = UInt(4.W)

  /** region identifier */
  val region = UInt(4.W)

  /** user-defined data */
  val user = if (cfg.wUserReq > 0) Some(Bits(cfg.wUserReq.W)) else None
}

/** Read data channel. (R)
  *
  * @param cfg
  *   configuration
  */
class ReadDataChannel(implicit cfg: Config) extends Bundle {

  /** identification tag */
  val id = UInt(cfg.wId.W)

  /** data */
  val data = Bits(cfg.wData.W)

  /** response flag */
  val resp = UInt(2.W)

  /** last burst */
  val last = Bool()

  /** user-defined data */
  val user =
    if (cfg.wUserReadData > 0) Some(Bits(cfg.wUserReadData.W)) else None
}

/** Write data channel. (W)
  *
  * @param cfg
  *   configuration
  */
class WriteDataChannel(implicit cfg: Config) extends Bundle {

  /** identification tag */
  val id = UInt(cfg.wId.W)

  /** data */
  val data = Bits(cfg.wData.W)

  /** strobe */
  val strb = UInt(cfg.wStrobe.W)

  /** last burst */
  val last = Bool()

  /** user-defined data */
  val user =
    if (cfg.wUserData > 0) Some(Bits(cfg.wUserData.W)) else None
}

/** Write response channel. (B)
  *
  * @param cfg
  *   configuration
  */
class WriteResponseChannel(implicit cfg: Config) extends Bundle {

  /** identification tag */
  val id = UInt(cfg.wId.W)

  /** response flag */
  val resp = UInt(2.W)

  /** user-defined data */
  val user =
    if (cfg.wUserResp > 0) Some(Bits(cfg.wUserResp.W)) else None
}

trait HasInterfaceBase extends Bundle {
  def getConfig: Config
}

trait HasReadInterface extends HasInterfaceBase {

  /** read address channel */
  val ar: IrrevocableIO[AddressChannel]

  /** read data channel */
  val r: IrrevocableIO[ReadDataChannel]
}

object HasReadInterface {

  /** pairs for DataView */
  def pairs(
      x: Interface,
      y: HasReadInterface
  ): Iterable[(Data, Data)] =
    Seq[(Option[Data], Option[Data])](
      // AR
      x.ARREADY -> Some(y.ar.ready),
      x.ARVALID -> Some(y.ar.valid),
      x.ARID -> Some(y.ar.bits.id),
      x.ARADDR -> Some(y.ar.bits.addr),
      x.ARLEN -> Some(y.ar.bits.len),
      x.ARSIZE -> Some(y.ar.bits.size),
      x.ARBURST -> Some(y.ar.bits.burst),
      x.ARLOCK -> Some(y.ar.bits.lock),
      x.ARCACHE -> Some(y.ar.bits.cache),
      x.ARPROT -> Some(y.ar.bits.prot),
      x.ARQOS -> Some(y.ar.bits.qos),
      x.ARREGION -> Some(y.ar.bits.region),
      x.ARUSER -> y.ar.bits.user,

      // R
      x.RREADY -> Some(y.r.ready),
      x.RVALID -> Some(y.r.valid),
      x.RID -> Some(y.r.bits.id),
      x.RDATA -> Some(y.r.bits.data),
      x.RRESP -> Some(y.r.bits.resp),
      x.RLAST -> Some(y.r.bits.last),
      x.RUSER -> y.r.bits.user
    )
      .filter { case (a, b) => a.nonEmpty && b.nonEmpty }
      .map { case (a, b) => a.get -> b.get }
}

trait HasWriteInterface extends HasInterfaceBase {

  /** write address channel */
  val aw: IrrevocableIO[AddressChannel]

  /** write data channel */
  val w: IrrevocableIO[WriteDataChannel]

  /** write response channel */
  val b: IrrevocableIO[WriteResponseChannel]
}

object HasWriteInterface {

  /** pairs for DataView */
  def pairs(
      x: Interface,
      y: HasWriteInterface
  ): Iterable[(Data, Data)] =
    Seq[(Option[Data], Option[Data])](
      // AW
      x.AWREADY -> Some(y.aw.ready),
      x.AWVALID -> Some(y.aw.valid),
      x.AWID -> Some(y.aw.bits.id),
      x.AWADDR -> Some(y.aw.bits.addr),
      x.AWLEN -> Some(y.aw.bits.len),
      x.AWSIZE -> Some(y.aw.bits.size),
      x.AWBURST -> Some(y.aw.bits.burst),
      x.AWLOCK -> Some(y.aw.bits.lock),
      x.AWCACHE -> Some(y.aw.bits.cache),
      x.AWPROT -> Some(y.aw.bits.prot),
      x.AWQOS -> Some(y.aw.bits.qos),
      x.AWREGION -> Some(y.aw.bits.region),
      x.AWUSER -> y.aw.bits.user,

      // W
      x.WREADY -> Some(y.w.ready),
      x.WVALID -> Some(y.w.valid),
      x.WID -> Some(y.w.bits.id),
      x.WDATA -> Some(y.w.bits.data),
      x.WSTRB -> Some(y.w.bits.strb),
      x.WLAST -> Some(y.w.bits.last),
      x.WUSER -> y.w.bits.user,

      // B
      x.BREADY -> Some(y.b.ready),
      x.BVALID -> Some(y.b.valid),
      x.BID -> Some(y.b.bits.id),
      x.BRESP -> Some(y.b.bits.resp),
      x.BUSER -> y.b.bits.user
    )
      .filter { case (a, b) => a.nonEmpty && b.nonEmpty }
      .map { case (a, b) => a.get -> b.get }
}

/** AXI4-Full Read/Write interface.
  *
  * @param cfg
  *   configuration
  */
class ReadWriteInterface(implicit val cfg: Config)
    extends Bundle
    with HasReadInterface
    with HasWriteInterface {
  assert(
    cfg.read && cfg.write,
    "cannot instantiate a full.ReadWriteInterface when !(cfg.read && cfg.write && !cfg.lite)"
  )

  def getConfig: Config = cfg

  val ar = Irrevocable(new AddressChannel)
  val r = Flipped(Irrevocable(new ReadDataChannel))
  val aw = Irrevocable(new AddressChannel)
  val w = Irrevocable(new WriteDataChannel)
  val b = Flipped(Irrevocable(new WriteResponseChannel))
}

/** AXI4-Full Read-only interface.
  *
  * @param cfg
  *   configuration
  */
class ReadInterface(implicit val cfg: Config)
    extends Bundle
    with HasReadInterface {
  assert(
    cfg.read,
    "cannot instantiate a full.ReadInterface when !(cfg.read && !cfg.lite)"
  )

  def getConfig: Config = cfg

  val ar = Irrevocable(new AddressChannel)
  val r = Flipped(Irrevocable(new ReadDataChannel))
}

/** AXI4-Full Write-only interface.
  *
  * @param cfg
  *   configuration
  */
class WriteInterface(implicit val cfg: Config)
    extends Bundle
    with HasWriteInterface {
  
  def getConfig: Config = cfg
  
  assert(
    cfg.write,
    "cannot instantiate a full.WriteInterface when !(cfg.write && !cfg.lite)"
  )

  val aw = Irrevocable(new AddressChannel)
  val w = Irrevocable(new WriteDataChannel)
  val b = Flipped(Irrevocable(new WriteResponseChannel))
}

object ReadWriteInterface {
  implicit val view1 = PartialDataView.mapping[Interface, ReadWriteInterface](
    (x) => new ReadWriteInterface()(x.cfg),
    (x, y) => HasReadInterface.pairs(x, y) ++ HasWriteInterface.pairs(x, y)
  )

  /** create a master `ReadWriteInterface` */
  def master(implicit cfg: Config) = new ReadWriteInterface

  /** create a slave `ReadWriteInterface` */
  def slave(implicit cfg: Config) = Flipped(new ReadWriteInterface)
}

object ReadInterface {
  implicit val view1 = PartialDataView.mapping[Interface, ReadInterface](
    (x) => new ReadInterface()(x.cfg),
    (x, y) => HasReadInterface.pairs(x, y)
  )

  implicit val view2 = PartialDataView[ReadWriteInterface, ReadInterface](
    (x) => new ReadInterface()(x.cfg),
    _.ar -> _.ar,
    _.r -> _.r
  )

  /** create a master `ReadInterface` */
  def master(implicit cfg: Config) = new ReadInterface

  /** create a slave `ReadInterface` */
  def slave(implicit cfg: Config) = Flipped(new ReadInterface)
}

object WriteInterface {
  implicit val view1 = PartialDataView.mapping[Interface, WriteInterface](
    (x) => new WriteInterface()(x.cfg),
    (x, y) => HasWriteInterface.pairs(x, y)
  )

  implicit val view2 = PartialDataView[ReadWriteInterface, WriteInterface](
    (x) => new WriteInterface()(x.cfg),
    _.aw -> _.aw,
    _.w -> _.w,
    _.b -> _.b
  )

  /** create a master `WriteInterface` */
  def master(implicit cfg: Config) = new WriteInterface

  /** create a slave `WriteInterface` */
  def slave(implicit cfg: Config) = Flipped(new WriteInterface)
}

object main extends App {
  import chisel3.stage.ChiselStage

  class TestDevice extends Module {
    private val cfg1 = axi4.Config(read = true, write = false)
    private val cfg2 = axi4.Config()

    val slave1 = IO(axi4.Slave(cfg1))
    val master1 = IO(axi4.Master(cfg1))

    val slave2 = IO(axi4.Slave(cfg2))
    val master2 = IO(axi4.Master(cfg2))

    val slave3 = IO(axi4.Slave(cfg2))
    val master3 = IO(axi4.Master(cfg2))

    slave1.driveDefaults
    master1.driveDefaults

    master1.fullR <> slave1.fullR
    master2.fullR <> slave2.fullR
    master2.fullW <> slave2.fullW

    slave3.fullRW <> master3.fullRW
  }
  println(ChiselStage.emitVerilog(new TestDevice))
}
