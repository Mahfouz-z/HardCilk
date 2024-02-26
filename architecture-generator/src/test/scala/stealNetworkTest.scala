import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import stealSide._


object tester {
    def serverRequestTask(clock : Clock, io : stealNetworkIO, qIndex : Int): Unit = {
        var state = io.connSS(qIndex).ctrl.stealReq.ready.peek()
        while(state.litValue != true.B.litValue){
            println("Stepping Clock, network couldn't pass the steal request!")
            clock.step(1)
            state = io.connSS(qIndex).ctrl.stealReq.ready.peek()
        }
        io.connSS(qIndex).ctrl.stealReq.valid.poke(true.B)
        clock.step(1)
        // network received the request, set low the request signal!
        io.connSS(qIndex).ctrl.stealReq.valid.poke(false.B)
    }

    def serverDigestStealRequest(clock : Clock, io : stealNetworkIO, qIndex : Int): Unit = {    
        var state = io.connSS(qIndex).ctrl.serveStealReq.ready.peek()
        while(state.litValue != true.B.litValue){
            println("Stepping Clock, no steal request to serve! Digest request")
            clock.step(1)
            state = io.connSS(qIndex).ctrl.serveStealReq.ready.peek()
        }
        io.connSS(qIndex).ctrl.serveStealReq.valid.poke(true.B)
        clock.step(1)
        // SS digested the request
        io.connSS(qIndex).ctrl.serveStealReq.valid.poke(false.B)
    }

    def serverGiveAwayTask(clock : Clock, io : stealNetworkIO, qIndex : Int , taskValue : UInt): Unit = {        
        var state = io.connSS(qIndex).data.qOutTask.ready.peek()
        while(state.litValue != true.B.litValue){
            println("Stepping Clock, network is not ready to take elements!")
            clock.step(1)
            state = io.connSS(qIndex).data.qOutTask.ready.peek()
        }
        io.connSS(qIndex).data.qOutTask.bits.poke(taskValue)
        io.connSS(qIndex).data.qOutTask.valid.poke(true.B)
        clock.step(1)
        // network received the element correctly, it is no longer valid!
        io.connSS(qIndex).data.qOutTask.valid.poke(false.B)
    }

    def serverTakeInTask(clock : Clock, io : stealNetworkIO, qIndex : Int): BigInt = {
        var state = io.connSS(qIndex).data.availableTask.valid.peek()
        while(state.litValue != true.B.litValue){
            println("Stepping Clock, no tasks available on the network!")
            clock.step(1)
            state = io.connSS(qIndex).data.availableTask.valid.peek()
        }
        io.connSS(qIndex).data.availableTask.ready.poke(true.B) // remove the task from the network
        var taskValue = io.connSS(qIndex).data.availableTask.bits.peek().litValue
        println("Task taken from network is: ", taskValue)
        clock.step(1)
        io.connSS(qIndex).data.availableTask.ready.poke(false.B)
        taskValue
    }

    def runTest(clock : Clock, io : stealNetworkIO): Unit = {

        // After updates to the code, comments are not necessairly true.
        
        // NW state Data: {NULL, NULL, NULL} Ctrl: {NULL, NULL, NULL}
        serverGiveAwayTask(clock, io, 0, 123456789.U) // Takes 1 cycle(s)

        // NW state Data: {NULL, 123456789, NULL} Ctrl: {NULL, NULL, NULL}
        serverGiveAwayTask(clock, io, 1, 102938475.U) // Takes 2 cycle(s)

        // NW state Data: {123456789, NULL, 102938475} Ctrl: {NULL, NULL, NULL}
        serverGiveAwayTask(clock, io, 2, 785642392.U) // Takes 2 cycle(s)

        // NW state Data: {785642392, 102938475, 123456789} Ctrl: {NULL, NULL, NULL}
        serverRequestTask(clock, io, 2) // Takes 1 cycle(s)

        // NW state Data: {123456789, 785642392, 102938475} Ctrl: {NULL, NULL, REQ}
        serverRequestTask(clock, io, 1) // Takes 2 cycle(s)

        // NW state Data: {785642392, 102938475, 123456789} Ctrl: {REQ, REQ, NULL}    
        serverRequestTask(clock, io, 0) // Takes 2 cycle(s)

        // NW state Data: {102938475, 123456789, 785642392} Ctrl: {REQ, REQ, REQ}     
        serverDigestStealRequest(clock, io, 0) // Takes 1 cycle(s)
        serverDigestStealRequest(clock, io, 0) // Takes 1 cycle(s)
        serverDigestStealRequest(clock, io, 0) // Takes 1 cycle(s)


        // NW state Data: {785642392, 102938475, 123456789} Ctrl: {REQ, NULL, REQ}
        serverRequestTask(clock, io, 1) // Takes 2 cycle(s)


        // NW state Data: {102938475, 123456789, 785642392} Ctrl: {REQ, REQ, REQ}
        assert(serverTakeInTask(clock, io, 0) == BigInt(785642392)) // Takes 1 cycle, prints out 102938475

        // NW state Data: {785642392, NULL, 123456789} Ctrl: {REQ, REQ, REQ}
        assert(serverTakeInTask(clock, io, 2) == BigInt(102938475)) //Takes 1 cycle, prints out 123456789

        // NW state Data: {NULL, 785642392, NULL} Ctrl: {REQ, REQ, REQ}
        assert(serverTakeInTask(clock, io, 0) == BigInt(123456789)) //Takes 3 cycles, prints out 785642392
        
        // NW state Data: {NULL, NULL, NULL} Ctrl: {REQ, REQ, REQ}
        
    }
}

class stealNetworkTest extends AnyFlatSpec with ChiselScalatestTester {
    it should "manage task stealing and communication correctly." in {
        test(new stealNetwork(32, 3)).withAnnotations(Seq(WriteVcdAnnotation)) { dut =>
            tester.runTest(dut.clock, dut.io)
        }
    }
}