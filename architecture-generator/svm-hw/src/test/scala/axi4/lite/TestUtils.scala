package axi4.lite

import chisel3._
import chisel3.util._
import chiseltest._
import chisel3.experimental.BundleLiterals._

object TestUtils {
  implicit class axiLiteReadInterfaceLiterals(iface: HasReadInterface) {
    implicit private val cfgAxi_ = iface.getConfig

    def initReadInterface(clock: Clock) = {
      // source
      iface.ar.initSource()

      iface.ar.setSourceClock(clock)

      // sink
      iface.r.initSink()
      iface.r.ready.poke(true)

      iface.r.setSinkClock(clock)
    }

    def readRegister(addr: Long): Long = {
      iface.ar.enqueue(
        (new AddressChannel)
          .Lit(_.addr -> addr.U, _.prot -> 0.U)
      )

      iface.r.waitForValid()
      val data = iface.r.bits.data.peekInt().toLong
      data
    }
  }

  implicit class axiLiteWriteInterfaceLiterals(iface: HasWriteInterface) {
    implicit private val cfgAxi_ = iface.getConfig

    private val wstrbOnes = ("b" + "1" * cfgAxi_.wStrobe).asUInt

    def initWriteInterface(clock: Clock) = {
      // source
      iface.aw.initSource()
      iface.w.initSource()

      iface.aw.setSourceClock(clock)
      iface.w.setSourceClock(clock)

      // sink
      iface.b.initSink()
      iface.b.ready.poke(true) // consume write responses

      iface.b.setSinkClock(clock)
    }

    def writeRegister(addr: Long, value: Long) = {
      iface.aw.enqueue(
        (new AddressChannel)
          .Lit(_.addr -> addr.U, _.prot -> 0.U)
      )
      iface.w.enqueue(
        (new WriteDataChannel)
          .Lit(_.data -> value.U, _.strb -> wstrbOnes)
      )
    }
  }
}
