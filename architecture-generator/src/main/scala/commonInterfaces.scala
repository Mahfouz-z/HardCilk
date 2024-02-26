package commonInterfaces
import chisel3._
import chisel3.util._

// Connections between control steal network and steal server
class stNwCtrlStSrvConn extends Bundle {

    // Note: we consider the stealing server the producer for
    // both steal request and their serves.

    // Indicates to the steal server whether it should push an
    // available task to the data network or not. 
        val serveStealReq    = new readyValid
    
    // The steal server telling the network that it wants to
    // steal a task.
        val stealReq         = new readyValid
}

// Connections between data steal network and steal server
class stNwDataStSrvConn(taskWidth:Int) extends Bundle {
    // The task in the network seen by the steal server
        val availableTask      = Decoupled(UInt(taskWidth.W))            // Elastic Output of steal network
    // The task that is outputed from a queue to the communication network
        val qOutTask           = Flipped(Decoupled(UInt(taskWidth.W)))   // Elastic Input to steal network
}

class stNwStSrvConn(taskWidth:Int) extends Bundle {
    val ctrl = new stNwCtrlStSrvConn
    val data = new stNwDataStSrvConn(taskWidth)
}

class dequeInterfaceConn(taskWidth: Int, queueMaxLength: Int) extends Bundle {
    val currLength = Output(UInt((log2Ceil(queueMaxLength)+1).W))
    val push       = Flipped(DecoupledIO(UInt(taskWidth.W)))
    val pop        = DecoupledIO(UInt(taskWidth.W))
}

// A simple interface representing a simple ready-valid duo
// output a ready and wait for a valid to proceed.
class readyValid extends Bundle {
    val ready   = Output(Bool())        
    val valid   = Input(Bool())
}

// Generic IO interface
class genericIO(width:Int) extends Bundle {
    val in  = Input(UInt(width.W))        
    val out = Output(UInt(width.W))
}