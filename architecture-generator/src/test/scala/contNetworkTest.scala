
import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import continuationSide._


object contNetworkTester {

    def VCASPushAddresses(clock : Clock, io : contNetworkIO, addresses : Seq[Int]): Unit = {
        for (i <- 0 until addresses.length) {
            while (!io.connVCAS.ready.peek().litToBoolean) {
                clock.step()
            }
            io.connVCAS.bits.poke(addresses(i).U)
            io.connVCAS.valid.poke(true.B)
            clock.step()
            io.connVCAS.valid.poke(false.B)
        }
    }

    def PEReadAddresses(clock : Clock, io : contNetworkIO, peNum : Int, addresses : Seq[Int]): Unit = {
        for (i <- 0 until addresses.length) {
            io.connPE(peNum).ready.poke(true.B)
            while (!io.connPE(peNum).valid.peek().litToBoolean) {
                clock.step()
            }
            io.connPE(peNum).bits.expect(addresses(i).U)
            println(io.connPE(peNum).bits.peek().litValue)
            clock.step()
            io.connPE(peNum).ready.poke(false.B)
        }
    }

    def runTest(clock : Clock, io : contNetworkIO): Unit = {
        //  Each queue has 3 entries and CAS has an internal register.
        VCASPushAddresses(clock, io, Seq(1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12))
        clock.step(40)
        PEReadAddresses(clock, io, 0, Seq(1, 3, 5, 7))
        PEReadAddresses(clock, io, 1, Seq(2, 6, 9, 11))
        PEReadAddresses(clock, io, 2, Seq(4, 8, 10, 12))
    }
}

class contNetworkTest extends AnyFlatSpec with ChiselScalatestTester {
    it should "Provide a network capable of supplying continuations to PEs." in {
        // Params (peCount: Int, taskWidth: Int, queueMaxLength:Int, qRamReadLatency: Int, qRamWriteLatency: Int)
        val annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
        test(new contNetwork(32, 3, 3)).withAnnotations(annos) { dut =>
            contNetworkTester.runTest(dut.clock, dut.io)
        }
    }
}