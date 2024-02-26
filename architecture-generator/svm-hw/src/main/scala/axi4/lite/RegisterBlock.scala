package axi4.lite

import defs.MemoryMappedLike
import axi4.{Slave, Config, ResponseFlag}

import chisel3._
import chisel3.util._
import scala.collection.mutable.ListBuffer
import java.io.PrintWriter

/** Defines an AXI4-Lite register block.
  *
  * @note
  *   Register block assumes that the address is always data-width aligned.
  *
  * @note
  *   If a register with `bitWidth < dataWidth` is mapped, it still occupies a
  *   `dataWidth` space in the memory space.
  *
  * @note
  *   Unaligned transfers are ignored by clearing the least significant bits.
  *
  * @note
  *   Overlapping assignments are OK, only the last one is effective.
  *
  * @param wAddr
  *   Address width of the AXI4-Lite interface.
  * @param wData
  *   Data width of the AXI4-Lite interface.
  * @param wMask
  *   Mask width. Determines the size of the assigned address space, which is
  *   `pow2(wMask)`.
  */
class RegisterBlock(
    val wAddr: Int = 32,
    val wData: Int = 32,
    val wMask: Int = 4,
    val numOutstandingReads: Int = 4,
    val numOutstandingWrites: Int = 4
) extends MemoryMappedLike {

  assert(chisel3.util.isPow2(wData))
  assert(wMask <= 31, "the implementation supports only 31-bit masks")
  assert(wMask >= (log2Ceil(wData) - 3))
  assert(numOutstandingReads >= 1)
  assert(numOutstandingWrites >= 1)

  /** address increment */
  val addrIncr = wData / 8

  /** corresponding AXI4-Lite configuration */
  val axiConfig = axi4.Config(
    wAddr = wAddr,
    wData = wData,
    lite = true
  )

  /** slave AXI4-Lite interface
    */
  val saxil = Wire(ReadWriteInterface.slave(axiConfig))

  /** @note
    *   Use `BigInt` to support masks larger than 31-bits.
    */
  private var lastAddr_ = 0: Int
  private var addrMap_ =
    ListBuffer.empty[
      (
          Int,
          Int,
          () => Bits,
          (Bits /* WDATA */, Bits /* WSTRB */ ) => Unit,
          String
      )
    ]

  /** Rebases the RegisterBlock address, the start value is 0x00.
    *
    * @param addr
    *   New base address.
    */
  def base(addr: Int): Unit = { lastAddr_ = addr }

  /** Returns the next address.
    *
    * @return
    *   next address
    */
  def nextAddr = lastAddr_

  /** Assigns a new register to the current address and increments the next
    * address by `addrIncr`.
    *
    * @param t
    *   Register to assign
    * @param read
    *   Read enable
    * @param write
    *   Write enable
    * @param desc
    *   Description
    *
    * @return
    *   Assigned address
    */
  def reg[T <: Data](
      t: T,
      read: Boolean = true,
      write: Boolean = true,
      desc: String = "<no description>"
  ): Int = {
    assert(t.getWidth <= wData)
    val ret = lastAddr_
    lastAddr_ = lastAddr_ + addrIncr
    val readFn = if (read) () => t.asUInt else () => (-1).S(wData.W).asUInt
    val writeFn =
      if (write) (wdata: Bits, wstrb: Bits) => {
        t := axi4.Util.writeStrobeLogic(t.asTypeOf(wdata), wdata, wstrb).asTypeOf(t)
      }
      else (wdata: Bits, wstrb: Bits) => ()
    addrMap_.addOne((ret, lastAddr_ - 1, readFn, writeFn, desc))
    ret
  }

  /** Reserves a region in the RegisterBlock.
    *
    * @param size
    *   Size of the region
    * @param desc
    *   Description
    * @return
    *   Assigned address
    */
  def reserve(size: Int, desc: String = "<no description>"): Int = {
    val ret = lastAddr_
    if (size % addrIncr == 0)
      lastAddr_ = lastAddr_ + size
    else
      lastAddr_ = lastAddr_ + (size / addrIncr + 1) * addrIncr
    addrMap_.addOne((ret, lastAddr_ - 1, () => 0.U, (_, _) => (), desc))
    ret
  }

  /** Export the register map to a file.
    *
    * @param path
    *   File path to save
    */
  def saveRegisterMap(directory: String, name: String) = {
    val write = new PrintWriter(f"${directory}/${name}.csv")
    write.println(s"sep=,")
    write.println(s"startAddr, endAddr, desc")
    addrMap_.foreach { case (startAddr, endAddr, _, _, desc) =>
      write.println(f"0x$startAddr%08x, 0x$endAddr%08x, $desc")
    }
    write.close()
  }

  val mask = (-1).S(wMask.W).asUInt() ^ (addrIncr - 1).U

  private val rdReq_ = Queue.irrevocable(saxil.ar, numOutstandingReads)
  private val rdResp_ = saxil.r

  private val wrReq_ = Queue.irrevocable(saxil.aw, numOutstandingWrites)
  private val wrReqData_ = Queue.irrevocable(saxil.w, numOutstandingWrites)
  private val wrResp_ = saxil.b

  rdReq_.nodeq()
  rdResp_.noenq()
  wrReq_.nodeq()
  wrReqData_.nodeq()
  wrResp_.noenq()

  /** Enqueues a read response.
    *
    * @param data
    *   Data of the response.
    * @param resp_flag
    *   Response flag.
    */
  private def do_rdResp(data: UInt, resp_flag: UInt): Unit = {
    assert(rdReq)

    rdReq_.deq()

    val resp = Wire(chiselTypeOf(rdResp_.bits))
    resp.data := data
    resp.resp := resp_flag
    rdResp_.enq(resp)
  }

  /** Enqueues a write response.
    *
    * @param resp_flag
    *   Response flag.
    */
  private def do_wrResp(resp_flag: UInt): Unit = {
    assert(wrReq)

    wrReq_.deq()
    wrReqData_.deq()

    val resp = Wire(chiselTypeOf(wrResp_.bits))
    resp.resp := resp_flag
    wrResp_.enq(resp)
  }

  // Trait implementation

  override val rdReq: Bool = (rdReq_.valid && rdResp_.ready)

  // override def rdReq: Bool = rdReqImpl_

  override val rdAddr: UInt = rdReq_.bits.addr & mask

  override def rdOk(): Unit = {
    val data = Wire(UInt(wData.W))

    // default, in case no address matches
    data := (-1).S(wData.W).asUInt

    addrMap_.foreach {
      case (addr, _, readFn, _, _) => {
        when(addr.asUInt === rdAddr) {
          data := readFn()
        }
      }
    }

    rdOk(data)
  }

  override def rdOk(data: Bits): Unit = {
    do_rdResp(data.asUInt, ResponseFlag.OKAY)
  }

  override def rdError(): Unit = {
    do_rdResp((-1).S(wData.W).asUInt(), ResponseFlag.SLVERR)
  }

  override val wrReq: Bool = wrReq_.valid && wrReqData_.valid && wrResp_.ready

  override val wrAddr: UInt = wrReq_.bits.addr & mask

  override val wrData: UInt = wrReqData_.bits.data

  override val wrStrb: UInt = wrReqData_.bits.strb

  override def wrOk(): Unit = {
    addrMap_.foreach {
      case (addr, _, _, writeFn, _) => {
        when(addr.asUInt === wrAddr) {
          writeFn(wrData, wrStrb)
        }
      }
    }
    do_wrResp(ResponseFlag.OKAY)
  }

  override def wrDiscard(): Unit = {
    do_wrResp(ResponseFlag.OKAY)
  }

  override def wrError(): Unit = {
    do_wrResp(ResponseFlag.SLVERR)
  }
}
