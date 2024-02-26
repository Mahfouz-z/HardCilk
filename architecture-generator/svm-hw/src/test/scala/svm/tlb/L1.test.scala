package svm.tlb

import axi4.lite.TestUtils._

import chisel3._
import chisel3.util._
import chiseltest._
import chisel3.experimental.BundleLiterals._
import scala.collection.mutable.HashMap
import scala.collection.mutable.ArrayBuffer
import org.scalatest.freespec.AnyFreeSpec
import svm.tlb.TLB_L1_Config

case class TestEntry(
    val tagFrom: Long,
    val tagTo: Long
)

class L1_HAL(dut: TLB_L1) {
  private val cfg = dut.cfg
  private val iface = dut.mgmt

  assert(dut.numWordsEntry == 4)
  assert(dut.numWordsAddress == 2)

  iface.initReadInterface(dut.clock)
  iface.initWriteInterface(dut.clock)

  dut.addrIn.initSource()
  dut.addrIn.setSourceClock(dut.clock)

  dut.addrOut.initSink()
  dut.addrOut.setSinkClock(dut.clock)

  private val mask32_ = (1L << 32) - 1
  private val mask56_ = (1L << 56) - 1
  private val offsetMask_ = (1L << cfg.wOffset) - 1
  private val wOffset_ = cfg.wOffset
  private val genAddrCh_ = new axi4.full.AddressChannel()(cfg.cfgAxi)

  private val entries_ = HashMap[Long, TestEntry]()
  private var paused_ = false

  /** Writes a value to the given 32-bit registedut.r */
  private def writeRegister(addr: Long, value: Long): Unit = {
    assert(addr % 4 == 0)
    iface.writeRegister(addr, value)
  }

  /** Reads a value from the given 32-bit registedut.r */
  private def readRegister(addr: Long): Long = {
    assert(addr % 4 == 0)
    iface.readRegister(addr)
  }

  private def entryToRegister(
      register: Long,
      testEntry: Option[TestEntry]
  ): Unit = {
    testEntry match {
      case Some(value) => {
        val lower = (value.tagTo << wOffset_)
        val higher = (1L << 62) | (value.tagFrom << wOffset_)

        writeRegister(register + 0, lower & mask32_)
        writeRegister(register + 4, lower >> 32)
        writeRegister(register + 8, higher & mask32_)
        writeRegister(register + 12, higher >> 32)
      }

      case None => {
        writeRegister(register + 0, 0)
        writeRegister(register + 4, 0)
        writeRegister(register + 8, 0)
        writeRegister(register + 12, 0)
      }
    }
  }

  private def entryFromRegister(register: Long): Option[TestEntry] = {
    val lower0 = readRegister(register + 0)
    val lower1 = readRegister(register + 4)
    val lower = (lower1 << 32) | lower0

    val higher0 = readRegister(register + 8)
    val higher1 = readRegister(register + 12)
    val higher = (higher1 << 32) | higher0

    val valid = (higher & (1L << 62)) > 0

    if (valid) {
      Some(
        TestEntry(
          (higher & mask56_) >> wOffset_,
          (lower & mask56_) >> wOffset_
        )
      )
    } else
      None
  }

  private def addrToRegister(register: Long, addr: Long): Unit = {
    assert(addr >= 0)
    writeRegister(register + 0, addr & mask32_)
    writeRegister(register + 4, addr >> 32)
  }

  private def addrFromRegister(register: Long): Long = {
    val lower = readRegister(register + 0)
    val higher = readRegister(register + 4)

    (higher << 32) | lower
  }

  def pause(): Unit = {
    assert(!paused_)
    paused_ = true
    writeRegister(dut.rPause, 1)
  }

  def resume(): Unit = {
    assert(paused_)
    paused_ = false
    writeRegister(dut.rPause, 0)
  }

  def isPaused(): Boolean = {
    assert((readRegister(dut.rPause) == 1) == paused_)
    paused_
  }

  /** Modifies the current entry based on the AXI-address. */
  def modifyEntry(testEntry: Option[TestEntry]) = {
    assert(isPaused())

    entryToRegister(dut.rWrEntry0, testEntry)
    writeRegister(dut.rCommand, TLB_L1.CMD_MODIFY_LOOKUP)
  }

  def modifyEntryLookup(tagFrom: Int, testEntry: Option[TestEntry]) = {
    assert(isPaused())

    writeRegister(dut.rLookupMode, TLB_L1.LOOKUP_USER)
    addrToRegister(dut.rLookupAddr0, tagFrom.toLong << cfg.wOffset)
    entryToRegister(dut.rWrEntry0, testEntry)
    writeRegister(dut.rCommand, TLB_L1.CMD_MODIFY_LOOKUP)
    writeRegister(dut.rLookupMode, TLB_L1.LOOKUP_AXI_ADDR)
  }

  def modifyEntryIndex(index: Int, testEntry: Option[TestEntry]) = {
    assert(isPaused())

    entryToRegister(dut.rWrEntry0, testEntry)
    writeRegister(dut.rCommand, TLB_L1.CMD_MODIFY_INDEX)
  }

  def getEntryLookup(tagFrom: Int): Option[(Int, TestEntry)] = {
    assert(isPaused())

    writeRegister(dut.rLookupMode, TLB_L1.LOOKUP_USER)
    addrToRegister(dut.rLookupAddr0, tagFrom << cfg.wOffset)
    val entry = entryFromRegister(dut.rLookupEntry0)
    val found = readRegister(dut.rLookupFound) == 1
    val index = readRegister(dut.rLookupIndex).toInt
    writeRegister(dut.rLookupMode, TLB_L1.LOOKUP_AXI_ADDR)

    if (found) {
      assert(entry.nonEmpty)
      Some((index, entry.get))
    } else
      None
  }

  def getAxiAddress(): Long = {
    addrFromRegister(dut.rAxiAddr0)
  }

  def getEntryIndex(index: Int): Option[TestEntry] = {
    assert(index >= 0 && index < cfg.numEntries)

    writeRegister(dut.rRdIndex, index)
    entryFromRegister(dut.rRdEntry0)
  }

  def getEntries(): Seq[TestEntry] = {
    val ab = new ArrayBuffer[TestEntry]

    for (i <- (0 until cfg.numEntries)) {
      getEntryIndex(i) match {
        case Some(value) => ab.addOne(value)
        case None        => { /* skip */ }
      }
    }

    ab.toSeq
  }

  def addEntry(testEntry: TestEntry): Unit = {
    assert(isPaused())
    // assert(!entries_.contains(testEntry.tagFrom))

    entries_.addOne((testEntry.tagFrom, testEntry))

    entryToRegister(dut.rWrEntry0, Some(testEntry))
    writeRegister(dut.rCommand, TLB_L1.CMD_ADD)
  }

  def numOutstanding(): Long = {
    readRegister(dut.rNumOutstanding)
  }

  def verifyTranslation(addrIn: Long) = {
    val tagIn = addrIn >> cfg.wOffset
    val tagOut = entries_.get(tagIn)
    assert(tagOut.nonEmpty)
    val expectedAddr =
      (tagOut.get.tagTo << cfg.wOffset) | (addrIn & offsetMask_)
    fork {
      dut.addrIn.enqueue(
        genAddrCh_.Lit(
          _.id -> 0.U,
          _.addr -> addrIn.U,
          _.len -> 0.U,
          _.size -> 3.U /* 8 bytes */,
          _.burst -> axi4.BurstFlag.INCR,
          _.lock -> false.B,
          _.cache -> 0.U,
          _.prot -> 0.U,
          _.qos -> 0.U,
          _.region -> 0.U
        )
      )
    }.fork {
      dut.addrOut.expectDequeue(
        genAddrCh_.Lit(
          _.id -> 0.U,
          _.addr -> expectedAddr.U,
          _.len -> 0.U,
          _.size -> 3.U /* 8 bytes */,
          _.burst -> axi4.BurstFlag.INCR,
          _.lock -> false.B,
          _.cache -> 0.U,
          _.prot -> 0.U,
          _.qos -> 0.U,
          _.region -> 0.U
        )
      )
    }.joinAndStep(dut.clock)
  }

  def failedTranslation(addrIn: Long) = {
    val tagIn = addrIn >> wOffset_
    val tagOut = entries_.get(tagIn)
    assert(tagOut.isEmpty)

    dut.addrIn.bits.poke(
      genAddrCh_.Lit(
        _.id -> 0.U,
        _.addr -> addrIn.U,
        _.len -> 0.U,
        _.size -> 3.U /* 8 bytes */,
        _.burst -> axi4.BurstFlag.INCR,
        _.lock -> false.B,
        _.cache -> 0.U,
        _.prot -> 0.U,
        _.qos -> 0.U,
        _.region -> 0.U
      )
    )
    dut.addrIn.valid.poke(true.B)

    while (
      !(dut.fault.peek().litToBoolean || //
        dut.addrOut.valid.peek().litToBoolean)
    ) {
      dut.clock.step(1)
    }

    assert(
      dut.fault.peek().litToBoolean && //
        !dut.addrOut.valid.peek().litToBoolean,
      "fault condition is not satisfied"
    )
  }
}

class L1_TestSpec extends AnyFreeSpec with ChiselScalatestTester {

  val cfg = TLB_L1_Config(
    44,
    44,
    12,
    8
  )

  "tlb.L1 management interface" in {
    test(new TLB_L1(cfg)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      {
        dut.saveRegisterMap("output/", "tlb.L1")

        val hal = new L1_HAL(dut)

        hal.pause()

        val te0 = TestEntry(0x3f, 0x4f)
        val te1 = TestEntry(0x2f, 0x5f)
        val te2 = TestEntry(0x1f, 0x6f)

        val te3 = TestEntry(0x2f, 0x9f)

        hal.addEntry(te0)
        hal.addEntry(te1)
        hal.addEntry(te2)

        assert(hal.getEntryIndex(0).get == te0)
        assert(hal.getEntryIndex(1).get == te1)
        assert(hal.getEntryIndex(2).get == te2)

        hal.modifyEntryLookup(0x2f, Some(te3))

        assert(hal.getEntryIndex(1).get == te3)

        hal.resume()
      }
    }
  }

  "tlb.L1 translation" in {
    test(new TLB_L1(cfg)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      {
        dut.saveRegisterMap("output/", "tlb.L1")

        val hal = new L1_HAL(dut)

        hal.pause()

        val te0 = TestEntry(0x3f, 0x4f)
        val te1 = TestEntry(0x2f, 0x5f)
        val te2 = TestEntry(0x1f, 0x6f)

        hal.addEntry(te0)
        hal.addEntry(te1)
        hal.addEntry(te2)

        hal.resume()

        hal.verifyTranslation(0x3f007)
        hal.verifyTranslation(0x2f097)
        hal.verifyTranslation(0x1f037)

        assert(hal.numOutstanding() == 3)

        dut.transactionDone.poke(true)
        dut.clock.step(1)
        dut.transactionDone.poke(false)

        assert(hal.numOutstanding() == 2)

        dut.transactionDone.poke(true)
        dut.clock.step(1)
        dut.transactionDone.poke(false)

        assert(hal.numOutstanding() == 1)
      }
    }
  }

  "tlb.L1 failed translation" in {
    test(new TLB_L1(cfg)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      {
        dut.saveRegisterMap("output/", "tlb.L1")

        val hal = new L1_HAL(dut)

        hal.pause()

        val te0 = TestEntry(0x3f, 0x4f)
        val te1 = TestEntry(0x2f, 0x5f)
        val te2 = TestEntry(0x1f, 0x6f)
        val te4 = TestEntry(0x4f, 0x9f)

        hal.addEntry(te0)
        hal.addEntry(te1)
        hal.addEntry(te2)

        hal.resume()

        hal.failedTranslation(0x4f007)

        assert(hal.getAxiAddress() == 0x4f007)

        hal.pause()

        hal.addEntry(te4)

        hal.resume()

        hal.verifyTranslation(0x4f600)
      }
    }
  }

  "tlb.L1 user lookup" in {
    test(new TLB_L1(cfg)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      {
        dut.saveRegisterMap("output/", "tlb.L1")

        val hal = new L1_HAL(dut)

        hal.pause()

        val te0 = TestEntry(0x3f, 0x4f)
        val te1 = TestEntry(0x2f, 0x5f)
        val te2 = TestEntry(0x1f, 0x6f)

        hal.addEntry(te0)
        hal.addEntry(te1)
        hal.addEntry(te2)

        print(hal.getEntryLookup(0x2f))

        hal.resume()
      }
    }
  }
}
