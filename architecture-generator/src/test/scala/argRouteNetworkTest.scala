

import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import argRouting._


object argRouteNetworkTester {

    def VASReadAddresses(clock : Clock, io : argRouteNetworkIO, vasIndex:Int, base_addresses : Seq[Long]): Unit = {
        var addresses : Seq[Long] = Seq()
        if(vasIndex == 0) {
            addresses = Seq(base_addresses(0), base_addresses(0) + 24, base_addresses(0) + 48, base_addresses(0) + 72, base_addresses(1), base_addresses(1) + 24, base_addresses(1) + 48, base_addresses(1) + 72)
        } else {
            addresses = Seq(base_addresses(0) + 12, base_addresses(0) + 36, base_addresses(0) + 60, base_addresses(0) + 84, base_addresses(1) + 12, base_addresses(1) + 36, base_addresses(1) + 60, base_addresses(1) + 84)
        }

        for (i <- 0 until 8) {
            io.connVAS(vasIndex).ready(i).poke(true.B)
            while (io.connVAS(vasIndex).valid(i).peek().litToBoolean == false) {
                clock.step()
            }
            // assert bits is in addresses and remove it from addresses otherwise raise exception
            assert(addresses.contains(io.connVAS(vasIndex).bits(i).peek().litValue))
            addresses = addresses.filterNot(_ == io.connVAS(vasIndex).bits(i).peek().litValue)
        }
    }

    def PEWriteAddresses(clock : Clock, io : argRouteNetworkIO, peIndex : Int, base_address : Long): Unit = {
        // addresses should have a 12 increment
        var addresses = Seq(base_address, base_address + 12, base_address + 24, base_address + 36, base_address + 48, base_address + 60, base_address + 72, base_address + 84)

        for (i <- 0 until 8) {
            io.connPE(peIndex).bits.poke(addresses(i).U(64.W))
            io.connPE(peIndex).valid(i).poke(true.B)
            while (io.connPE(peIndex).ready(i).peek().litToBoolean == false) {
                clock.step()
            }
        }
    }

    def runTest(clock : Clock, io : argRouteNetworkIO): Unit = {
        // Write the addresses from the PE interface the sequence of addresses should 
        // each address is incremented by log(taskwidth/8) for each address
        
        // hex value of base address
        fork{
            PEWriteAddresses(clock, io, 0, 0xC000000C00000000L)
        }.fork{
            PEWriteAddresses(clock, io, 1, 0xA0000000000A0000L)
        }.fork{
            VASReadAddresses(clock, io, 0, Seq(0xC000000C00000000L, 0xA000000A00000000L))
        }.fork{
            VASReadAddresses(clock, io, 1, Seq(0xC000000C00000000L, 0xA000000A00000000L))
        }.join()

    }
}

class argRouteNetworkTest extends AnyFlatSpec with ChiselScalatestTester {
    it should "Provide a network capable of collecting cont addresses from the PEs." in {
        val annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
        test(new argRouteNetwork(addrWidth = 64, taskWidth = 128, peCount = 2, vasNum = 2, queueDepth = 3)).withAnnotations(annos) { dut =>
            argRouteNetworkTester.runTest(dut.clock, dut.io)
        }
    }
}