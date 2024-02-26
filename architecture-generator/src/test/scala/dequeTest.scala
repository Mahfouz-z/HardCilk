import chisel3._
import chiseltest._
import chiseltest.simulator.{PlusArgsAnnotation}
import org.scalatest.flatspec.AnyFlatSpec
import deque._



object dequeTester {
    def pushTask(clock : Clock, io : dequeIO, task : Int, port: Int): Unit = {
        io.connVec(port).push.valid.poke(1)
        io.connVec(port).push.bits.poke(task)
        while(io.connVec(port).push.ready.peek().litValue != BigInt(1)){
            clock.step(1)
        }
        io.connVec(port).push.valid.poke(0)
        clock.step(1)
        assert(io.connVec(1).currLength.peek().litValue == io.connVec(0).currLength.peek().litValue)

        var currLength = io.connVec(1).currLength.peek().litValue
        println("____________")
        println("Current length of the queue: ", currLength)
    }
    
    def popTask(clock : Clock, io : dequeIO, port: Int): BigInt = {
        io.connVec(port).pop.ready.poke(1)
        while(io.connVec(port).pop.valid.peek().litValue != BigInt(1)){
            clock.step(1)
        }
        io.connVec(port).pop.ready.poke(0)

         
        assert(io.connVec(1).currLength.peek().litValue == io.connVec(0).currLength.peek().litValue)

        var currLength = io.connVec(1).currLength.peek().litValue
        println("____________")
        println("Current length of the queue: ", currLength)
        
        var poppedTask = io.connVec(port).pop.bits.peek().litValue
        println("Popped task Value: ", poppedTask)
        clock.step(1)
        poppedTask
    }


    // TODO: Write a test for using both sides at the same time. 


    def runTest(clock : Clock, io : dequeIO): Unit = {
        pushTask(clock, io, 2040, 0)
        pushTask(clock, io, 2041, 0)
        pushTask(clock, io, 2042, 0)
        pushTask(clock, io, 2043, 0)
        pushTask(clock, io, 2044, 0)
        pushTask(clock, io, 2045, 1)
       
        assert(popTask(clock, io, 1) == BigInt(2045))
        assert(popTask(clock, io, 1) == BigInt(2040))
        assert(popTask(clock, io, 0) == BigInt(2044))
        assert(popTask(clock, io, 1) == BigInt(2041))
        assert(popTask(clock, io, 0) == BigInt(2043))
        assert(popTask(clock, io, 1) == BigInt(2042))
        popTask(clock, io, 0)
    }
}

class dequeTest extends AnyFlatSpec with ChiselScalatestTester{
    val annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
    it should "implement a cirular double ended queue" in {
        test(new deque(32, 16, 1, 2)).withAnnotations(annos) { dut =>
            dequeTester.runTest(dut.clock, dut.io)
        }
    }
}