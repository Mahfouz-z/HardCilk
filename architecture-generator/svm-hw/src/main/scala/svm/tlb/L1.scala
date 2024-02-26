package svm.tlb

import chisel3._
import chisel3.util._
import chisel3.experimental.dataview._
import svm.tlb.setZeros
import svm.tlb.setZeros
import svm.tlb.setZeros

case class TLB_L1_Config(
    val wTagFrom: Int,
    val wTagTo: Int,
    val wOffset: Int,
    val numEntries: Int,
    val cfgAxi: axi4.Config = axi4.Config(wAddr = 64)
) {
  assert(wTagFrom > 0)
  assert(wTagTo > 0)
  assert(wOffset >= 0)
  assert((wTagFrom + wOffset) <= cfgAxi.wAddr)
  assert((wTagTo + wOffset) <= cfgAxi.wAddr)
  assert(numEntries >= 4)
  assert(chisel3.util.isPow2(numEntries))
  assert(cfgAxi.wAddr <= 64)
}

/** AXI4-Lite management interface assumes that the reads and writes consist of
  * full 32 bits.
  *
  * @param cfg
  */
class TLB_L1(val cfg: TLB_L1_Config) extends Module {
  class Entry extends Bundle {
    val valid = Bool()
    val tagFrom = UInt(cfg.wTagFrom.W)
    val tagTo = UInt(cfg.wTagTo.W)

    def toWords: Vec[UInt] = {
      def addrOffset(tag: UInt): UInt = {
        val zeros = 56 - tag.getWidth - cfg.wOffset
        if (zeros > 0)
          Cat(0.U(zeros.W), tag, 0.U(cfg.wOffset.W))
        else
          Cat(tag, 0.U(cfg.wOffset.W))
      }

      val x = Cat(
        // (1) state bits
        0.U(1.W),
        valid,
        0.U(6.W),

        // (1) address + offset
        addrOffset(tagFrom),

        // (2) state bits
        0.U(8.W),

        // (2) address + offset
        addrOffset(tagTo)
      )

      assert(x.getWidth == 128)
      VecInit(Seq.tabulate(numWordsEntry) {
        //
        i => { x(32 * (i + 1) - 1, 32 * i) }
      })
    }
  }

  object Entry {
    def fromWords(x: Vec[UInt]): Entry = {
      // TODO implement properly
      val xx = x.asUInt
      assert(xx.getWidth == 128)

      val entry = Wire(new Entry)
      entry.valid := xx(126).asBool
      entry.tagFrom := xx(cfg.wOffset + cfg.wTagFrom - 1 + 64, cfg.wOffset + 64)
      entry.tagTo := xx(cfg.wOffset + cfg.wTagTo - 1, cfg.wOffset)

      entry
    }
  }

  /** generator for an entry */
  private val genEntry = new Entry

  /** number of words per address */
  val numWordsAddress = 2

  /** number of words per entry */
  val numWordsEntry = numWordsAddress * 2

  /** log2ceil of numEntries */
  private val logNumEntries = chisel3.util.log2Ceil(cfg.numEntries)

  /** AXI4 configuration */
  private implicit val cfgAxi_ = cfg.cfgAxi

  val mgmt = IO(axi4.lite.ReadWriteInterface.slave(TLB_L1.cfgMgmt))

  /** Input AXI4 address channel for translation */
  val addrIn = IO(Flipped(Irrevocable(new axi4.full.AddressChannel)))

  /** Output AXI4 address channel for translation results */
  val addrOut = IO(Irrevocable(new axi4.full.AddressChannel))

  /** Determines when a transaction is complete */
  val transactionDone = IO(Input(Bool()))

  /** Fault signal (used for interrupts) */
  val fault = IO(Output(Bool()))

  /** content addressable memory for holding the TLB entries */
  private val cam_ = Module(
    new CAM[Entry](
      genEntry,
      cfg.numEntries,
      _.valid,
      _.tagFrom
    )
  )

  /** register block */
  private val regBlock_ = new axi4.lite.RegisterBlock(
    wAddr = TLB_L1.cfgMgmt.wAddr,
    wData = TLB_L1.cfgMgmt.wData,
    wMask = TLB_L1.cfgMgmt.wAddr
  )

  private def asAddr_(x: UInt) = x.asTypeOf(addrOut.bits.addr)
  private def getOffset_(x: UInt) = x.asTypeOf(UInt(cfg.wOffset.W))

  /* Registers */

  private val pause_ = RegInit(true.B)

  private val rdIndex_ = RegInit(0.U(cam_.rdIndex.getWidth.W))
  private val rdEntry_ = Wire(Vec(numWordsEntry, UInt(32.W)))

  private val lookupMode_ = RegInit(0.U(1.W))
  private val lookupAddr_ = RegInit(VecInit(Seq.fill(numWordsAddress) {
    0.U(32.W)
  }))
  private val lookupEntryAxi_ = Wire(Vec(numWordsEntry, UInt(32.W)))

  private val wrEntryAxi_ = RegInit(VecInit(Seq.fill(numWordsEntry) {
    0.U(32.W)
  }))
  private val wrEntry_ = Entry.fromWords(wrEntryAxi_)

  private val numOutstanding_ = RegInit(0.U(32.W))

  /* CAM rd-interface */
  cam_.rdIndex := rdIndex_

  setZeros(rdEntry_)
  when(rdIndex_ < cfg.numEntries.U) {
    rdEntry_ := cam_.rdEntry.toWords
  }

  /* CAM lookup-interface */
  cam_.lookupKey := {
    val vec = VecInit(
      (addrIn.bits.addr >> cfg.wOffset)(cfg.wTagFrom - 1, 0),
      (lookupAddr_.asUInt >> cfg.wOffset)(cfg.wTagFrom - 1, 0)
    )

    vec(lookupMode_)
  }

  setZeros(lookupEntryAxi_)
  when(cam_.lookupFound) {
    lookupEntryAxi_ := cam_.lookupEntry.toWords
  }

  /* CAM wr-interface */
  private val wrIndex_ = RegInit(0.U(32.W))

  cam_.wrEnable := false.B
  cam_.wrIndex := 0.U
  setZeros(cam_.wrEntry)

  private val translatedAddr_ = asAddr_(
    Cat(cam_.lookupEntry.tagTo, getOffset_(addrIn.bits.addr))
  )

  /* add entry interface */

  /** counts the next free index, good for a cold start */
  private val nextFreeIndex_ = RegInit(0.U((logNumEntries + 1).W))

  /** chooses a random index to evict */
  private val randomIndex_ = chisel3.util.random.LFSR(logNumEntries)

  /** next index to evict */
  private def evictIndex_ = {
    val result = Wire(UInt(logNumEntries.W))
    when(nextFreeIndex_ < cfg.numEntries.U) {
      result := nextFreeIndex_
      nextFreeIndex_ := nextFreeIndex_ + 1.U
    }.otherwise {
      result := randomIndex_
    }
    result
  }

  fault := Mux(lookupMode_ === TLB_L1.LOOKUP_AXI_ADDR.U, !cam_.lookupFound, false.B)

  /* register block */
  regBlock_.base(0x00)
  val rPause = regBlock_.reg(pause_, desc = "PAUSE")

  val rRdIndex = regBlock_.reg(rdIndex_, desc = "RDINDEX")

  val rRdEntry0 = regBlock_.nextAddr
  rdEntry_.zipWithIndex.foreach { case (reg, idx) =>
    regBlock_.reg(reg, write = false, desc = f"RDENTRY_${idx}")
  }

  val rLookupMode = regBlock_.reg(lookupMode_, desc = "LOOKUP_MODE")

  val rLookupAddr0 = regBlock_.nextAddr
  lookupAddr_.zipWithIndex.foreach { case (reg, idx) =>
    regBlock_.reg(reg, desc = f"LOOKUP_ADDR_${idx}")
  }

  val rLookupEntry0 = regBlock_.nextAddr
  lookupEntryAxi_.zipWithIndex.foreach { case (reg, idx) =>
    regBlock_.reg(reg, write = false, desc = f"LOOKUP_ENTRY_${idx}")
  }

  val rLookupFound = regBlock_.nextAddr
  regBlock_.reg(cam_.lookupFound, write = false, desc = "LOOKUP_FOUND")

  val rLookupIndex = regBlock_.reg(cam_.lookupIndex, write = false, desc = "LOOKUP_INDEX")

  val rWrIndex = regBlock_.reg(wrIndex_, desc = "WRINDEX")

  val rWrEntry0 = regBlock_.nextAddr
  wrEntryAxi_.zipWithIndex.foreach { case (reg, idx) =>
    regBlock_.reg(reg, desc = f"WRENTRY_${idx}")
  }

  val rNumOutstanding =
    regBlock_.reg(numOutstanding_, desc = "NUM_OUTSTANDING")

  private val axiAddr_ =
    addrIn.bits.addr.asTypeOf(UInt((numWordsAddress * 32).W))

  val rAxiAddr0 = regBlock_.nextAddr
  for (i <- (0 until numWordsAddress)) {
    regBlock_.reg(
      axiAddr_(32 * (i + 1) - 1, 32 * i),
      write = false,
      desc = f"AXI_ADDR_${i}"
    )
  }

  val rCommand = regBlock_.reserve(4, "COMMAND")

  val rWaitLock = regBlock_.reserve(4, "WAITLOCK")

  assert(regBlock_.nextAddr <= 256)

  regBlock_.saxil <> mgmt

  /* end register block */
  
  def saveRegisterMap(directory: String, name: String) =
    regBlock_.saveRegisterMap(directory, f"${name}.registers")

  addrIn.nodeq()
  addrOut.noenq()

  private val fireTransfer_ =
    !pause_ && lookupMode_ === TLB_L1.LOOKUP_AXI_ADDR.U && !fault && addrIn.valid && addrOut.ready

  private val translatedResult_ = Wire(new axi4.full.AddressChannel)
  translatedResult_ := addrIn.bits
  translatedResult_.addr := asAddr_(
    Cat(cam_.lookupEntry.tagTo, getOffset_(addrIn.bits.addr))
  )

  when(fireTransfer_) {
    addrIn.deq()
    addrOut.enq(translatedResult_)
  }

  // Number of outstanding requests logic
  when(fireTransfer_ && !transactionDone) {
    numOutstanding_ := numOutstanding_ + 1.U
  }

  when(!fireTransfer_ && transactionDone) {
    numOutstanding_ := numOutstanding_ - 1.U
  }

  // Register block logic

  when(regBlock_.wrReq) {
    regBlock_.wrOk()
  }

  when(regBlock_.rdReq) {
    when(
      pause_ && regBlock_.rdAddr === rWaitLock.U && numOutstanding_ > 0.U
    ) {
      // block
    }.otherwise {
      regBlock_.rdOk()
    }
  }

  when(pause_ && regBlock_.wrReq) {
    when(regBlock_.wrAddr === rCommand.U) {
      assert(regBlock_.wrStrb === 0xf.U)

      switch(regBlock_.wrData) {
        is(TLB_L1.CMD_MODIFY_LOOKUP.U) {
          cam_.wrEnable := RegNext(cam_.lookupFound)
          cam_.wrIndex := RegNext(cam_.lookupIndex)
          cam_.wrEntry := wrEntry_
        }

        is(TLB_L1.CMD_MODIFY_INDEX.U) {
          cam_.wrEnable := true.B
          cam_.wrIndex := wrIndex_
          cam_.wrEntry := wrEntry_
        }

        is(TLB_L1.CMD_ADD.U) {
          cam_.wrEnable := true.B
          cam_.wrIndex := evictIndex_
          cam_.wrEntry := wrEntry_
        }
      }
    }
  }
}

object TLB_L1 {
  val CMD_MODIFY_LOOKUP = 0x12
  val CMD_MODIFY_INDEX = 0x13
  val CMD_ADD = 0x32

  val LOOKUP_AXI_ADDR = 0
  val LOOKUP_USER = 1

  /** AXI4-Lite configuration for the management interface */
  val cfgMgmt = axi4.Config(wAddr = 7, wData = 32, lite = true)
}

class TLB_L1_RW(
    val numEntries: Int = 8,
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
  assert(numEntries >= 8)

  val cfgMgmt = TLB_L1.cfgMgmt

  val mgmtRead = IO(axi4.Slave(cfgMgmt)).suggestName("S_AXIL_READ")
  val mgmtWrite = IO(axi4.Slave(cfgMgmt)).suggestName("S_AXIL_WRITE")
  val slave = IO(axi4.Slave(cfgAxi)).suggestName("S_AXI")
  val master = IO(axi4.Master(cfgAxi)).suggestName("M_AXI")
  val readFault = IO(Output(Bool())).suggestName("READ_FAULT")
  val writeFault = IO(Output(Bool())).suggestName("WRITE_FAULT")

  val wOffset = logPageSize
  val wTag = cfgAxi.wAddr - wOffset

  private def newTLB() = Module(
    new TLB_L1(
      TLB_L1_Config(
        wTagFrom = wTag,
        wTagTo = wTag,
        wOffset = wOffset,
        numEntries = numEntries / 2,
        cfgAxi = cfgAxi
      )
    )
  )

  private val writeTLB_ = if (cfgAxi.write) {
    val slave_ = slave.fullW
    val master_ = master.fullW
    val tlb = newTLB()

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
    val tlb = newTLB()

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
    writeTLB_.foreach { _.saveRegisterMap(directory, f"${name}.W") }
    readTLB_.foreach { _.saveRegisterMap(directory, f"${name}.R") }
  }
}

object Emitter extends App {
  import chisel3.stage.ChiselStage

  val fnDevice = () =>
    new TLB_L1_RW(
      numEntries = 8,
      logPageSize = 12,
      cfgAxi = new axi4.Config(wId = 4, wAddr = 32, wData = 64)
    )

  (new ChiselStage).emitVerilog(
    {
      val dev = fnDevice()
      dev.saveRegisterMap("output/", "TLB_L1_RW")
      dev
    },
    Array("--target-dir", "output/")
  )
}
