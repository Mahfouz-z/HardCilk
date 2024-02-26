package axi4.tlb

import axi4.lite.TestUtils._
import treadle.WriteVcdAnnotation

import chisel3._
import chisel3.util._
import chiseltest._

import org.scalatest.freespec.AnyFreeSpec
import chisel3.experimental.BundleLiterals._

import scala.collection.mutable.HashMap

class L1TLBDriver(dut: L1TLB) {
  dut.mgmt initReadInterface(dut.clock)
  dut.mgmt.initWriteInterface(dut.clock)

  dut.addrIn.initSource()
  dut.addrIn.setSourceClock(dut.clock)

  dut.addrOut.initSink()
  dut.addrOut.setSinkClock(dut.clock)

  private val entries_ = HashMap[Long, (Long, Int)]()
  private val wOffset_ = dut.genTLBEntry.wOffset
  private val wOffsetMask_ = (1L << wOffset_) - 1
  private implicit val cfgAxi_ = dut.cfgAxi
  private val genAddrCh_ = new axi4.full.AddressChannel

  def numOutstanding = dut.mgmt.readRegister(dut.xNumOutstanding)
  def faultAddr = dut.mgmt.readRegister(dut.xFaultAddr)
  def faultType = dut.mgmt.readRegister(dut.xFaultType)

  def writeEntryToOffset(
      base: Long,
      tagFrom: Long,
      tagTo: Long,
      status: Int = 1
  ) = {
    dut.mgmt.writeRegister(base, tagTo)
    dut.mgmt.writeRegister(base + 8, status.toLong << 52 | tagFrom)
  }

  def newEntry(tagFrom: Long, tagTo: Long, status: Int = 1) = {
    assert(!entries_.contains(tagFrom))
    entries_.addOne((tagFrom, (tagTo, status)))
    writeEntryToOffset(dut.xNewEntry0, tagFrom, tagTo)
  }

  def overwriteEntry(tagFrom: Long, tagTo: Long, status: Int = 1) = {
    entries_.addOne((tagFrom, (tagTo, status)))
    writeEntryToOffset(dut.xOverwriteEntry0, tagFrom, tagTo)
  }

  def invalidateTag(tag: Long) = {
    entries_.remove(tag)
    dut.mgmt.writeRegister(dut.xInvalidateTag, tag)
  }

  def currentEntry: (Long, Long, Int) = {
    val byte0 = dut.mgmt.readRegister(dut.xCurrentEntry0)
    val byte1 = dut.mgmt.readRegister(dut.xCurrentEntry0 + 8)
    ((byte1 << 8) >> 8, byte0, (byte1 >> 52).toInt)
  }

  def paused = dut.mgmt.readRegister(dut.xPause) == 1
  def pause() = dut.mgmt.writeRegister(dut.xPause, 1)
  def resume() = dut.mgmt.writeRegister(dut.xPause, 0)

  def verifyTranslation(addrIn: Long) = {
    val tagIn = addrIn >> wOffset_
    val tagOut = entries_.get(tagIn)
    assert(tagOut.nonEmpty)
    val expectedAddr =
      (tagOut.get._1 << wOffset_) | (addrIn & wOffsetMask_)
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

class L1TLBTestSpec extends AnyFreeSpec with ChiselScalatestTester {
  "L1TLB should write entries correctly" in {
    test(new L1TLB()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      {
        val driver = new L1TLBDriver(dut)

        driver.newEntry(0x3f, 0x4f)
        driver.newEntry(0x4d, 0x5d)
        driver.newEntry(0x8d, 0x9d)
        driver.newEntry(0xad, 0xbd)
        driver.resume()

        driver.verifyTranslation(0x3f007)
        driver.verifyTranslation(0x4d007)
        driver.verifyTranslation(0x8d007)
        driver.verifyTranslation(0xad007)

        driver.failedTranslation(0x3e007)

        assert(driver.numOutstanding == 4)

        dut.clock.step(2)
      }
    }
  }

  "L1TLB should invalidate entries" in {
    test(new L1TLB()).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
      {
        val driver = new L1TLBDriver(dut)

        driver.newEntry(0x3f, 0x4f)
        driver.resume()

        driver.verifyTranslation(0x3f007)

        driver.pause()
        driver.invalidateTag(0x3f)
        driver.resume()

        driver.failedTranslation(0x3f007)

        dut.clock.step(2)
      }
    }
  }
}
