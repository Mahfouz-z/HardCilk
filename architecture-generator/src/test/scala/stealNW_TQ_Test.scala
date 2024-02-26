import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import stealSide._
import commonInterfaces.dequeInterfaceConn


object stealNW_TQ_tester {
    def virtServerRequestTask(clock : Clock, io : stealNW_TQ_IO, print : Boolean = false): Unit = {
        var state = io.connVSS.ctrl.stealReq.ready.peek()
        while(state.litValue != true.B.litValue){
            if(print)
                println("Stepping Clock, network couldn't pass the steal request!")
            clock.step(1)
            state = io.connVSS.ctrl.stealReq.ready.peek()
        }
        io.connVSS.ctrl.stealReq.valid.poke(true.B)
        clock.step(1)
        // network received the request, set low the request signal!
        io.connVSS.ctrl.stealReq.valid.poke(false.B)
    }

    def virtServerDigestStealRequest(clock : Clock, io : stealNW_TQ_IO, print : Boolean = false): Unit = {    
        var state = io.connVSS.ctrl.serveStealReq.ready.peek()
        while(state.litValue != true.B.litValue){
            if(print)
                println("Stepping Clock, no steal request to serve! Digest request")
            clock.step(1)
            state = io.connVSS.ctrl.serveStealReq.ready.peek()
        }
        io.connVSS.ctrl.serveStealReq.valid.poke(true.B)
        clock.step(1)
        // SS digested the request
        io.connVSS.ctrl.serveStealReq.valid.poke(false.B)
    }

    def virtServerGiveAwayTask(clock : Clock, io : stealNW_TQ_IO , taskValue : UInt, print : Boolean = false): Unit = {        
        var state = io.connVSS.data.qOutTask.ready.peek()
        while(state.litValue != true.B.litValue){
            if(print)
                println("Stepping Clock, network is not ready to take elements!")
            clock.step(1)
            state = io.connVSS.data.qOutTask.ready.peek()
        }
        io.connVSS.data.qOutTask.bits.poke(taskValue)
        io.connVSS.data.qOutTask.valid.poke(true.B)
        clock.step(1)
        // network received the element correctly, it is no longer valid!
        io.connVSS.data.qOutTask.valid.poke(false.B)
    }

    def virtServerTakeInTask(clock : Clock, io : stealNW_TQ_IO, print : Boolean = false): BigInt = {
        var state = io.connVSS.data.availableTask.valid.peek()
        while(state.litValue != true.B.litValue){
            if(print)
                println("Stepping Clock, no tasks available on the network!")
            clock.step(1)
            state = io.connVSS.data.availableTask.valid.peek()
        }
        io.connVSS.data.availableTask.ready.poke(true.B) // remove the task from the network
        var taskValue = io.connVSS.data.availableTask.bits.peek().litValue
        if(print)
            println("Task taken from network is: ", taskValue)
        clock.step(1)
        io.connVSS.data.availableTask.ready.poke(false.B)
        taskValue
    }

    def pushTaskPE(clock : Clock, connPE : dequeInterfaceConn, task : Int, print : Boolean = false): Unit = {
        connPE.push.valid.poke(true.B)
        connPE.push.bits.poke(task)
        clock.step(1)
        while(connPE.push.ready.peek().litValue != BigInt(1)){
            clock.step(1)
            //connPE.push.valid.poke(true.B)
            //connPE.push.bits.poke(task)
        }
        connPE.push.valid.poke(false.B)
        var currLength = connPE.currLength.peek().litValue
        if(print){
            println("____________")
            println("Current length of the queue: ", currLength)
        }
        clock.step(1)
    }

    def popTaskPE(clock : Clock, connPE : dequeInterfaceConn, done : => Boolean = false, print : Boolean = false): BigInt = {
        connPE.pop.ready.poke(true.B)
        while(connPE.pop.valid.peek().litValue != BigInt(1)){
            clock.step(1)
            if(done){
                return -1
            }
            //connPE.pop.ready.poke(true.B)
        }
        connPE.pop.ready.poke(false.B)
        var currLength = connPE.currLength.peek().litValue
        if(print){
            println("____________")
            println("Current length of the queue: ", currLength)
        }
        var poppedTask = connPE.pop.bits.peek().litValue
        if(print)
            println("Popped task Value: ", poppedTask)
        clock.step(1)
        poppedTask
    } 

    def runTest(clock : Clock, io : stealNW_TQ_IO): Unit = {
        // Test if stealing requests are passed correctly up the network 
        // Naurally, we expect 3 requests from the 3 SS.
        var reqCount = 0
        while(reqCount < 3){
            virtServerDigestStealRequest(clock, io)
            reqCount = reqCount + 1
        }

        // Push some tasks through the virtual server and expect them from
        // the task queues.
        virtServerGiveAwayTask(clock, io, 123456789.U)
        virtServerGiveAwayTask(clock, io, 499922203.U)
        virtServerGiveAwayTask(clock, io, 349988823.U)

        assert(popTaskPE(clock, io.connPE(0)) == BigInt(123456789))
        assert(popTaskPE(clock, io.connPE(1)) == BigInt(499922203))
        assert(popTaskPE(clock, io.connPE(2)) == BigInt(349988823))

        // Push some tasks through the virtual server and pop them
        // through a single PE with the order of the stealing.
        virtServerGiveAwayTask(clock, io, 123457878.U)
        virtServerGiveAwayTask(clock, io, 499927878.U)
        virtServerGiveAwayTask(clock, io, 349987878.U)

        assert(popTaskPE(clock, io.connPE(1)) == BigInt(499927878))
        assert(popTaskPE(clock, io.connPE(1)) == BigInt(349987878))
        assert(popTaskPE(clock, io.connPE(1)) == BigInt(123457878))

        reqCount = 0
        while(reqCount < 3){
            virtServerDigestStealRequest(clock, io)
            reqCount = reqCount + 1
        }

        // Test overflowing the queues. Would the steal server giveaway tasks?
        for (i <- 0 until 4){
            for (j <- 0 until 3){
                pushTaskPE(clock, io.connPE(j), 9999990+i)
            }
        }

        // Expect three tasks of value 9999990
        assert(virtServerTakeInTask(clock, io) == BigInt(9999990))
        assert(virtServerTakeInTask(clock, io) == BigInt(9999990))
        assert(virtServerTakeInTask(clock, io) == BigInt(9999990))
       
        // Push another 3 tasks
        for (j <- 0 until 3){
            pushTaskPE(clock, io.connPE(j), 111111)
        }
                
        // Expect three tasks of value 9999991
        assert(virtServerTakeInTask(clock, io) == BigInt(9999991))
        assert(virtServerTakeInTask(clock, io) == BigInt(9999991))
        assert(virtServerTakeInTask(clock, io) == BigInt(9999991))

        print("_______________\n")
        // Virtual Server request task and expect other servers (with 3 tasks each) to provide it
        for(i <- 0 until 9){
            // Take in all the tasks passed to the task queues from the PE side.
            clock.step(1)
            virtServerRequestTask(clock, io)
            virtServerTakeInTask(clock, io)
        }
        

    }
}

class stealNW_TQ_Test extends AnyFlatSpec with ChiselScalatestTester {
    it should "Provide a set of task queues with task stealing management." in {
        // Params (peCount: Int, taskWidth: Int, queueMaxLength:Int, qRamReadLatency: Int, qRamWriteLatency: Int)
        val annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
        test(new stealNW_TQ(3, 1, 32, 4, 1, 2)).withAnnotations(annos) { dut =>
            stealNW_TQ_tester.runTest(dut.clock, dut.io)
        }
    }
}