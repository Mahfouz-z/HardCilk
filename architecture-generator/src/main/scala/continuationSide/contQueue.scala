package continuationSide

import chisel3._
import chisel3.util._

class contQueueIO(addrWidth: Int) extends Bundle {
    val addressIn  = Flipped(DecoupledIO(UInt(addrWidth.W)))
    val addressOut = DecoupledIO(UInt(addrWidth.W))
}

class contQueue(addrWidth: Int, queueDepth: Int) extends Module {
    val io = IO(new contQueueIO(addrWidth))
    val q = Module(new Queue(UInt(), queueDepth))

    q.io.enq <> io.addressIn
    io.addressOut <> q.io.deq
}