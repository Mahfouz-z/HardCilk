package axi4.lite

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

  /** the address of the first transfer */
  val addr = UInt(cfg.wAddr.W)

  /** protection flag */
  val prot = UInt(3.W)
}

/** Read data channel. (R)
  *
  * @param cfg
  *   configuration
  */
class ReadDataChannel(implicit cfg: Config) extends Bundle {

  /** data */
  val data = UInt(cfg.wData.W)

  /** response flag */
  val resp = UInt(2.W)
}

/** Write data channel. (W)
  *
  * @param cfg
  *   configuration
  */
class WriteDataChannel(implicit cfg: Config) extends Bundle {

  /** data */
  val data = UInt(cfg.wData.W)

  /** strobe */
  val strb = UInt(cfg.wStrobe.W)
}

/** Write response channel. (B)
  *
  * @param cfg
  *   configuration (not used)
  */
class WriteResponseChannel(implicit val cfg: Config) extends Bundle {

  /** response flag */
  val resp = UInt(2.W)
}

trait HasInterface extends Bundle {
  def getConfig: Config
}

trait HasReadInterface extends HasInterface {

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
      x.ARADDR -> Some(y.ar.bits.addr),
      x.ARPROT -> Some(y.ar.bits.prot),

      // R
      x.RREADY -> Some(y.r.ready),
      x.RVALID -> Some(y.r.valid),
      x.RDATA -> Some(y.r.bits.data),
      x.RRESP -> Some(y.r.bits.resp)
    )
      .filter { case (a, b) => a.nonEmpty && b.nonEmpty }
      .map { case (a, b) => a.get -> b.get }
}

trait HasWriteInterface extends HasInterface {

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
      x.AWADDR -> Some(y.aw.bits.addr),
      x.AWPROT -> Some(y.aw.bits.prot),

      // W
      x.WREADY -> Some(y.w.ready),
      x.WVALID -> Some(y.w.valid),
      x.WDATA -> Some(y.w.bits.data),
      x.WSTRB -> Some(y.w.bits.strb),

      // B
      x.BREADY -> Some(y.b.ready),
      x.BVALID -> Some(y.b.valid),
      x.BRESP -> Some(y.b.bits.resp)
    )
      .filter { case (a, b) => a.nonEmpty && b.nonEmpty }
      .map { case (a, b) => a.get -> b.get }
}

/** AXI4-Lite Read/Write interface.
  *
  * @param cfg
  *   configuration
  */
class ReadWriteInterface(implicit val cfg: Config)
    extends Bundle
    with HasReadInterface
    with HasWriteInterface {
  assert(
    cfg.read && cfg.write && cfg.lite,
    "cannot instantiate a lite.ReadWriteInterface when !(cfg.read && cfg.write && cfg.lite)"
  )

  def getConfig: Config = cfg

  val ar = Irrevocable(new AddressChannel)
  val r = Flipped(Irrevocable(new ReadDataChannel))
  val aw = Irrevocable(new AddressChannel)
  val w = Irrevocable(new WriteDataChannel)
  val b = Flipped(Irrevocable(new WriteResponseChannel))
}

/** AXI4-Lite Read-only interface.
  *
  * @param cfg
  *   configuration
  */
class ReadInterface(implicit val cfg: Config)
    extends Bundle
    with HasReadInterface {
  assert(
    cfg.read && cfg.lite,
    "cannot instantiate a lite.ReadInterface when !(cfg.read && cfg.lite)"
  )

  def getConfig: Config = cfg

  val ar = Irrevocable(new AddressChannel)
  val r = Flipped(Irrevocable(new ReadDataChannel))
}

/** AXI4-Lite Write-only interface.
  *
  * @param cfg
  *   configuration
  */
class WriteInterface(implicit val cfg: Config)
    extends Bundle
    with HasWriteInterface {
  assert(
    cfg.write && cfg.lite,
    "cannot instantiate a lite.WriteInterface when !(cfg.write && cfg.lite)"
  )

  def getConfig: Config = cfg

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
    private val cfg1 = axi4.Config(read = true, write = false, lite = true)
    private val cfg2 = axi4.Config(lite = true)

    val slave1 = IO(axi4.Slave(cfg1))
    val master1 = IO(axi4.Master(cfg1))

    val slave2 = IO(axi4.Slave(cfg2))
    val master2 = IO(axi4.Master(cfg2))

    val slave3 = IO(axi4.Slave(cfg2))
    val master3 = IO(axi4.Master(cfg2))

    slave1.driveDefaults
    master1.driveDefaults

    master1.liteR <> slave1.liteR
    master2.liteR <> slave2.liteR
    master2.liteW <> slave2.liteW

    slave3.liteRW <> master3.liteRW
  }
  println(ChiselStage.emitVerilog(new TestDevice))
}
