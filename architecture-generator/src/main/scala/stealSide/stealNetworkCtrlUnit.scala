package stealSide
import chisel3._
import chisel3.util._
import commonInterfaces._
import os.truncate

// The interface connection for the stealing network ctrl unit.
class stealNetworkCtrlUnitIO extends Bundle {
    // Connections to other network ctrl units
      val reqTaskIn     = Input((Bool()))
      val reqTaskOut    = Output(Bool())

    // Connections to steal server
      val connSS = new stNwCtrlStSrvConn
}

class stealNetworkCtrlUnit extends Module {
  val io = IO(new stealNetworkCtrlUnitIO)

  val stealReqReg = RegInit(false.B)
  
  when(io.connSS.stealReq.valid){
    io.reqTaskOut := 1.U
  }.elsewhen(io.connSS.serveStealReq.valid){
    io.reqTaskOut := 0.U
  }.otherwise{
    io.reqTaskOut := stealReqReg
  }

  io.connSS.stealReq.ready      := ~stealReqReg
  io.connSS.serveStealReq.ready := stealReqReg    
  stealReqReg                   := io.reqTaskIn
}
