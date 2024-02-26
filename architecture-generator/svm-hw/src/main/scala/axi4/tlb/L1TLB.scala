package axi4.tlb

import axi4.{Config, Slave, Master}
import axi4.full.{AddressChannel}

import chisel3._
import chisel3.util._
import utils.ContentAddressableMemory
import axi4.lite

/** Defines a TLB entry. The implementation should provide the necessary status
  * flags.
  *
  * @note
  *   0.U.asTypeOf(tlbEntry) must be an invalid TLB entry.
  *
  * @param wStatus
  *   Width of status, should be at least 1
  * @param wTagFrom
  *   Width of the address to be translated
  * @param wTagTo
  *   Width of the resulting translated address
  * @param wOffset
  *   Offset width of the pages
  */
class TLBEntry(
    val wStatus: Int = 1,
    val wTagFrom: Int = 52,
    val wTagTo: Int = 52,
    val wOffset: Int = 12
) extends Bundle {
  assert(wStatus >= 1, "status should have at least a valid bit")

  val enableExtendedFields = wStatus >= 4

  /** status flags */
  val status = UInt(wStatus.W)

  /** tag of the address to be translated */
  val tagFrom = UInt(wTagFrom.W)

  /** tag of the resulting translated address */
  val tagTo = UInt(wTagTo.W)

  /** number of qwords (64-bit) this entry needs to encode/decode */
  def numQwords: Int = 2

  /** is this entry valid? */
  def valid: Bool = status(0)

  /** is this entry write protected? */
  def writeProtected: Bool = if (enableExtendedFields) status(1) else false.B

  /** is this entry read protected? */
  def readProtected: Bool = if (enableExtendedFields) status(2) else false.B

  /** is this entry owned exclusively? */
  def exclusive: Bool = if (enableExtendedFields) status(3) else true.B

  private def defaultImplChecks_() = {
    assert(wStatus <= 8, "too many status bits") 
    assert(wTagFrom <= 52, "too wide tag, too small page size?")
  }

  /** encode the entry into Seq[UInt] */
  def encode(): Seq[UInt] = {
    defaultImplChecks_()
    val byte0 = tagTo.asTypeOf(UInt(64.W))
    val byte1 = Cat(status.asTypeOf(UInt(8.W)), tagFrom.asTypeOf(UInt(52.W)))
    Seq(byte0, byte1)
  }

  /** decode the entry from a given Seq[UInt] */
  def decode(v: Seq[UInt]): TLBEntry = {
    defaultImplChecks_()
    tagTo := v(0)
    tagFrom := v(1)(51, 0).asTypeOf(tagFrom)
    status := v(1)(63, 52).asTypeOf(status)
    this
  }
}

object TLBEntry extends strenc.UserTypeCompanion[TLBEntry] {
  import strenc._
  import strenc.EncodersDecoders._

  def encode(t: TLBEntry, os: ArgumentOutputStream): Unit = {
    os.push(t.wStatus)
    os.push(t.wTagFrom)
    os.push(t.wTagTo)
    os.push(t.wOffset)
  }

  def decode(is: ArgumentInputStream): TLBEntry = {
    new TLBEntry(
      is.pop[Int],
      is.pop[Int],
      is.pop[Int],
      is.pop[Int]
    )
  }
}

/** Simple L1TLB. Processes transactions in-order.
  *
  * @note
  *   In case of a TLB fault, stops processing transactions and raises the
  *   interrupt flag for one cycle.
  *
  * @note
  *   Everything is QWORD-aligned, AXI4-Lite interface has a data width of 64
  *   bits.
  *
  * @note
  *   The maximum width of the supported address is 64 bits.
  *
  * @note
  *   CONFIG(0): if 1, protection fault should not interrupt.
  *
  * @param numEntries
  *   Number of entries in the TLB
  * @param genTLBEntry
  *   Generator for the TLB entry
  * @param cfgAxi
  *   AXI4 configuration for translation
  * @param writeTLB
  *   True if a write TLB
  */
class L1TLB(
    val numEntries: Int = 4,
    val genTLBEntry: TLBEntry = new TLBEntry(1, 20, 20, 12),
    val cfgAxi: axi4.Config = axi4.Config(wData = 64),
    val writeTLB: Boolean = false
) extends Module {
  assert(
    chisel3.util.isPow2(numEntries),
    "the number of entries must be a power of two"
  )
  assert(cfgAxi.wAddr <= 64, "the maximum supported address width is 64")
  assert(numEntries >= 4, "there must be at least four entries")

  /** log2ceil of numEntries */
  private val logNumEntries = chisel3.util.log2Ceil(numEntries)

  private implicit val cfgAxi_ = cfgAxi

  /** AXI4-Lite configuration for the management interface */
  val cfgMgmt = axi4.Config(wAddr = 32, wData = 64, lite = true)

  /** AXI4-Lite slave port for management */
  val mgmt = IO(axi4.lite.ReadWriteInterface.slave(cfgMgmt))

  /** true in case of faults (and not paused) */
  val fault = IO(Output(Bool()))

  /** Input AXI4 address channel for translation */
  val addrIn = IO(Flipped(Irrevocable(new axi4.full.AddressChannel)))

  /** Output AXI4 address channel for translation results */
  val addrOut = IO(Irrevocable(new axi4.full.AddressChannel))

  /** Determines when a transaction is complete */
  val transactionDone = IO(Input(Bool()))

  /** content addressable memory for holding the TLB entries */
  private val cam_ = Module(
    new ContentAddressableMemory[TLBEntry](
      genTLBEntry,
      numEntries,
      _.valid,
      _.tagFrom
    )
  )

  /** register block */
  private val regBlock_ = new axi4.lite.RegisterBlock(
    wAddr = cfgMgmt.wAddr,
    wData = cfgMgmt.wData,
    wMask = 7 // 128 bytes of register space, NOTE increase if necessary
  )

  /** TLB pause flag, start paused */
  private val rPause_ = RegInit(true.B)

  /** TLB configuration register */
  private val rConfig_ = RegInit(0.U(32.W))

  /** new entry */
  private val rNewEntry_ = Seq.fill(genTLBEntry.numQwords - 1) {
    RegInit(0.U(64.W))
  }

  /** overwrite entry */
  private val rOverwriteEntry_ = Seq.fill(genTLBEntry.numQwords - 1) {
    RegInit(0.U(64.W))
  }

  /** number of outstanding requests */
  private val rNumOutstandingRequests_ = RegInit(0.U(32.W))

  regBlock_.base(0x00)

  /** offset of PAUSE */
  val xPause = regBlock_.reg(rPause_, desc = "PAUSE")

  /** offset of CONFIG */
  val xConfig = regBlock_.reg(rConfig_, desc = "CONFIG")

  /** offset of INVALIDATE */
  val xInvalidateTag = regBlock_.reserve(8, desc = "INVALIDATE")

  /** offset of FAULT_ADDR */
  val xFaultAddr =
    regBlock_.reg(addrIn.bits.addr, write = false, desc = "FAULT_ADDR")

  /** fault type */
  private val faultType_ = Wire(UInt(32.W))

  /** offset of FAULT_TYPE */
  val xFaultType = regBlock_.reg(faultType_, write = false, desc = "FAULT_TYPE")

  /** offset of NUM_OUTSTANDING */
  val xNumOutstanding = regBlock_.reg(
    rNumOutstandingRequests_,
    write = false,
    desc = "NUM_OUTSTANDING"
  )

  /** offset of NEW_ENTRY_0 */
  val xNewEntry0 = regBlock_.nextAddr

  /* buffer for the new entry */
  for (i <- 0 until (genTLBEntry.numQwords - 1)) {
    regBlock_.reg(rNewEntry_(i), desc = f"NEW_ENTRY_$i")
  }

  /** offset of NEW_ENTRY */
  val xNewEntry = regBlock_.reserve(8, desc = "NEW_ENTRY")

  /** offset of OVERWRITE_ENTRY_0 */
  val xOverwriteEntry0 = regBlock_.nextAddr

  /* buffer for the overwritten entry */
  for (i <- 0 until (genTLBEntry.numQwords - 1)) {
    regBlock_.reg(rOverwriteEntry_(i), desc = f"OVERWRITE_ENTRY_$i")
  }

  /** offset of OVERWRITE_ENTRY */
  val xOverwriteEntry = regBlock_.reserve(8, desc = "OVERWRITE_ENTRY")

  /** current entry in encoded form for processor to access */
  private val currentEntryEncoded_ = cam_.rdEntry.encode()

  /** offset of CURRENT_ENTRY_0 */
  val xCurrentEntry0 = regBlock_.nextAddr

  for (i <- 0 until genTLBEntry.numQwords) {
    /* current entry is read-only */
    regBlock_.reg(
      currentEntryEncoded_(i),
      write = false,
      desc = f"CURRENT_ENTRY_$i"
    )
  }

  assert(regBlock_.nextAddr <= 256, "ran out of address space")

  /** saves the register map to a file given by `path`. */
  def saveRegisterMap(directory: String, name: String) =
    regBlock_.saveRegisterMap(directory, f"${name}.registers")

  /* connect to the axi management interface */
  regBlock_.saxil <> mgmt

  /** true in case of a protection fault */
  private val protectionFault_ = Wire(Bool())

  /** true in case of a coherency fault */
  private val coherencyFault_ = Wire(Bool())

  /** true in case of an invalid entry */
  private val invalidFault_ = Wire(Bool())

  /** true if a protection fault should not be translated */
  private val protectionFaultShouldInterrupt_ = !rConfig_(0)

  /** true in case of a fault */
  private val fault_ = Wire(Bool())

  fault := fault_ && !rPause_

  /** translation result */
  private val translatedResult_ = Wire(new axi4.full.AddressChannel)

  /** if protection fault, the request is translated to this address */
  private val protectionFallbackAddress_ = (-1).S(64.W).asUInt

  /** cast a uint to an output address */
  private def asAddr_(x: UInt) = x.asTypeOf(translatedResult_.addr)

  /** get the offset from an input address */
  private def getOffset_(x: UInt) = x.asTypeOf(UInt(genTLBEntry.wOffset.W))

  /* calculate the translation result */
  translatedResult_ := addrIn.bits
  when(protectionFault_) {
    translatedResult_.addr := asAddr_(protectionFallbackAddress_)
  }.otherwise {
    translatedResult_.addr := asAddr_(
      Cat(cam_.rdEntry.tagTo, getOffset_(addrIn.bits.addr))
    )
  }

  /** @note
    *   if we add support for an L2 TLB, make sure that writes to the PAUSE
    *   register block until L2 TLB lookup is over.
    *
    * @note
    *   In such a case, make sure that wrOk() depends on the value of wrAddr and
    *   xPause.
    */

  /** counts the next free index, good for a cold start */
  private val nextFreeIdx_ = RegInit(0.U((logNumEntries + 1).W))

  /** chooses a random index to evict */
  private val randomIdx_ = chisel3.util.random.LFSR(logNumEntries)

  /** next index to evict */
  private def evictIndex_ = {
    val result = Wire(UInt(logNumEntries.W))
    when(nextFreeIdx_ < numEntries.U) {
      result := nextFreeIdx_
      nextFreeIdx_ := nextFreeIdx_ + 1.U
    }.otherwise {
      result := randomIdx_
    }
    result
  }

  // TODO handle outstanding requests!!! important
  // TODO support for L2TLB (BRAM-based), somehow

  // faults

  protectionFault_ := writeTLB.B && cam_.rdEntry.writeProtected || !writeTLB.B && cam_.rdEntry.readProtected
  coherencyFault_ := writeTLB.B && !cam_.rdEntry.exclusive
  invalidFault_ := !cam_.rdValid

  fault_ := addrIn.valid && ((protectionFault_ && protectionFaultShouldInterrupt_) || coherencyFault_ || invalidFault_)
  faultType_ := Mux(
    fault_,
    Cat(
      1.B,
      if (writeTLB) 1.B else 0.B,
      cam_.rdEntry.writeProtected,
      cam_.rdEntry.readProtected,
      cam_.rdEntry.exclusive
    ),
    0.U
  )

  cam_.rdKey := (addrIn.bits.addr >> genTLBEntry.wOffset)

  /* no write by default */
  cam_.wrEnable := false.B

  cam_.wrEntry := DontCare
  cam_.wrIndex := DontCare

  addrIn.nodeq()
  addrOut.noenq()

  when(regBlock_.wrReq) {
    // TODO when pausing is not possible (in case of an L2 TLB)
    // do not call `.wrOk()`, instead wait until it is possible
    regBlock_.wrOk()

    // TODO should we discard writes to a register?
  }

  when(regBlock_.rdReq) {
    regBlock_.rdOk()
  }

  val fireTransfer_ = !rPause_ && !fault_ && addrIn.valid && addrOut.ready

  when(fireTransfer_) {
    addrIn.deq()
    addrOut.enq(translatedResult_)
  }

  // Number of outstanding requests logic
  when(fireTransfer_ && !transactionDone) {
    rNumOutstandingRequests_ := rNumOutstandingRequests_ + 1.U
  }

  when(!fireTransfer_ && transactionDone) {
    rNumOutstandingRequests_ := rNumOutstandingRequests_ - 1.U
  }

  // register write logic (when paused)
  when(rPause_ && regBlock_.wrReq) {
    when(regBlock_.wrAddr === xInvalidateTag.U) {
      cam_.rdKey := regBlock_.wrData

      when(cam_.rdValid) {
        cam_.wrIndex := cam_.rdIndex
        cam_.wrEntry := 0.U.asTypeOf(genTLBEntry)
        // -- TODO a better way to encode the invalid entry?
        cam_.wrEnable := true.B

        // TODO add this entry to the list of free spots
      }
    }

    when(regBlock_.wrAddr === xNewEntry.U) {
      cam_.wrIndex := evictIndex_

      val entry = Wire(genTLBEntry)
      entry.decode(rNewEntry_ :+ regBlock_.wrData)
      cam_.wrEntry := entry

      cam_.wrEnable := true.B
    }

    when(regBlock_.wrAddr === xOverwriteEntry.U) {
      when(cam_.rdValid) {
        cam_.wrIndex := cam_.rdIndex

        val entry = Wire(genTLBEntry)
        entry.decode(rOverwriteEntry_ :+ regBlock_.wrData)
        cam_.wrEntry := entry

        cam_.wrEnable := true.B
      }
    }
  }
}

object L1TLB extends strenc.UserTypeCompanion[L1TLB] {
  import strenc._
  import strenc.EncodersDecoders._

  override def encode(t: L1TLB, os: ArgumentOutputStream): Unit = {
    os.push(t.numEntries)
    os.push(t.genTLBEntry)
    os.push(t.cfgAxi)
    os.push(t.writeTLB)
  }

  override def decode(is: ArgumentInputStream): L1TLB = {
    new L1TLB(
      is.pop[Int],
      is.pop[TLBEntry],
      is.pop[axi4.Config],
      is.pop[Boolean]
    )
  }
}

class Translator(
    val numEntries: Int = 4,
    val logPageSize: Int = 22,
    val cfgAxi: axi4.Config = new axi4.Config(wId = 4, wAddr = 32, wData = 64)
) extends Module {
  assert(
    chisel3.util.isPow2(numEntries) && numEntries >= 2,
    "numEntries must be a power of two greater than 2"
  )
  assert(!cfgAxi.lite, "Only AXI4-Full interface is supported for translation.")
  assert(
    cfgAxi.read && cfgAxi.write,
    "Read and write channels must be both present."
  )

  val cfgMgmt = axi4.Config(wAddr = 32, wData = 64, lite = true)

  val mgmtRead = IO(axi4.Slave(cfgMgmt)).suggestName("S_AXIL_READ")
  val mgmtWrite = IO(axi4.Slave(cfgMgmt)).suggestName("S_AXIL_WRITE")
  val slave = IO(axi4.Slave(cfgAxi)).suggestName("S_AXI")
  val master = IO(axi4.Master(cfgAxi)).suggestName("M_AXI")
  val readFault = IO(Output(Bool())).suggestName("READ_FAULT")
  val writeFault = IO(Output(Bool())).suggestName("WRITE_FAULT")

  val wOffset = logPageSize
  val wTag = cfgAxi.wAddr - wOffset

  private def newTLB(write: Boolean = false) = Module(
    new L1TLB(
      numEntries = numEntries / 2,
      genTLBEntry = new TLBEntry(4, wTag, wTag, wOffset),
      cfgAxi = cfgAxi,
      writeTLB = write
    )
  )

  private val writeTLB_ = if (cfgAxi.write) {
    val slave_ = slave.fullW
    val master_ = master.fullW
    val tlb = newTLB(true)

    master_ <> slave_
    tlb.addrIn <> slave_.aw
    master_.aw <> tlb.addrOut

    tlb.mgmt <> mgmtWrite.liteRW

    tlb.transactionDone := slave_.b.ready && master_.b.valid

    writeFault := tlb.fault

    Some(tlb)
  } else {
    writeFault := false.B
    None
  }

  private val readTLB_ = if (cfgAxi.read) {
    val slave_ = slave.fullR
    val master_ = master.fullR
    val tlb = newTLB(false)

    master_ <> slave_
    tlb.addrIn <> slave_.ar
    master_.ar <> tlb.addrOut

    tlb.mgmt <> mgmtRead.liteRW
    // TODO bring a simple multiplexer and use the same mgmt for both
    // TODO make read/write interfaces optional

    tlb.transactionDone := slave_.r.ready && master_.r.valid && master_.r.bits.last

    readFault := tlb.fault

    Some(tlb)
  } else {
    readFault := false.B
    None
  }

  def saveRegisterMap(directory: String, name: String) = {
    writeTLB_.foreach { _.saveRegisterMap(directory, f"${name}.writeTLB") }
    readTLB_.foreach { _.saveRegisterMap(directory, f"${name}.readTLB") }
  }
}

object Translator extends strenc.UserTypeCompanion[Translator] {
  import strenc._
  import strenc.EncodersDecoders._

  def encode(t: Translator, os: ArgumentOutputStream): Unit = {
    os.push(t.numEntries)
    os.push(t.logPageSize)
    os.push(t.cfgAxi)
  }

  def decode(is: ArgumentInputStream): Translator = {
    new Translator(
      is.pop[Int],
      is.pop[Int],
      is.pop[axi4.Config]
    )
  }
}

private object Emit1 extends App {
  import chisel3.stage.ChiselStage

  val fnDevice = () =>
    new Translator(
      numEntries = 8,
      logPageSize = 12,
      cfgAxi = new axi4.Config(wId = 8, wAddr = 32, wData = 32)
    )

  (new ChiselStage).emitVerilog(
    {
      val dev = fnDevice()
      dev.saveRegisterMap("output/", "translator")
      dev
    },
    Array("--target-dir", "output/")
  )
}

private object Emit2 extends App {
  import chisel3.stage.ChiselStage
  import java.io._

  def createDirectory(path: String): Unit = {
    val dir = new File(path)
    if (!dir.exists())
      dir.mkdirs()
  }

  val fnDevice = (numEntries: Int) => {
    new Translator(
      numEntries = numEntries,
      logPageSize = 12,
      cfgAxi = axi4.Config(wId = 6, wAddr = 64, wData = 64)
    )
  }

  Seq(8, 16, 32, 64, 128).foreach { numEntries =>
    {
      val dir = f"output/translator_${numEntries}"
      createDirectory(dir)
      (new ChiselStage)
        .emitVerilog(fnDevice(numEntries), Array("--target-dir", dir))
    }
  }
}
