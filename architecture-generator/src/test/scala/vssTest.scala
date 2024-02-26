// import chisel3._
// import chiseltest._
// import chiseltest.simulator.{PlusArgsAnnotation}
// import org.scalatest.flatspec.AnyFlatSpec
// import stealSide._
// import axi4.ResponseFlag
// import chisel3.experimental.BundleLiterals._
// import axi4.lite._
// import chisel3.util._
// import commonInterfaces._

// // There was a problem with wMask.

// object vssTesterRV {
//     def writeRegAxiLite(clock : Clock,  dut : vssWrapper, address : UInt, value : UInt): Unit = {
//         implicit val axiConfig = dut.vss.regBlock.axiConfig
//         fork{
//             dut.io.axi_mgmt.aw.enqueue((new AddressChannel).Lit(_.addr -> address, _.prot -> 0.U))
//             dut.io.axi_mgmt.w.enqueue((new WriteDataChannel).Lit(_.data -> value, _.strb -> 0xFF.U))
//         }.fork{
//             dut.io.axi_mgmt.b.expectDequeue((new WriteResponseChannel).Lit(_.resp -> ResponseFlag.OKAY))
//         }.join()  
//     }

//     def readRegAxiLite(clock : Clock,  dut : vssWrapper, address : UInt, expectedvalue : UInt): Unit = {
//         implicit val axiConfig = dut.vss.regBlock.axiConfig
//         fork{
//             dut.io.axi_mgmt.ar.enqueue((new AddressChannel).Lit(_.addr -> address, _.prot -> 0.U))
//         }.fork{
//             dut.io.axi_mgmt.r.expectDequeue((new ReadDataChannel).Lit(_.data -> expectedvalue, _.resp -> ResponseFlag.OKAY))
//         }.join()
//     }

//     def reportRegAxiLite(clock : Clock,  dut : vssWrapper, address : UInt): UInt = {
//         implicit val axiConfig = dut.vss.regBlock.axiConfig
//         var ret = 0.U
//         fork{
//             dut.io.axi_mgmt.ar.enqueue((new AddressChannel).Lit(_.addr -> address, _.prot -> 0.U))
//         }.fork{
//             ret = dut.io.axi_mgmt.r.bits.data.peek()
//             dut.io.axi_mgmt.r.ready.poke(true.B)
//         }.join()
//         ret
//     }

//     def runTest(clock : Clock,  dut : vssWrapper): Unit = {
//         val axiConfig = axi4.Config(
//             wAddr = 64,
//             wData = 64,
//             lite = false
//         )


//         // Make sure the module is paused
//         val io = dut.io
//         var rPause = reportRegAxiLite(clock, dut, 0x00000000.U).litValue
//         while(rPause == BigInt(0)){
//             clock.step(1)
//             rPause = reportRegAxiLite(clock, dut, 0x00000000.U).litValue
//         }
        
//         writeRegAxiLite(clock, dut, 0x00000008.U, 23.U) // rAddr (base address of the elements array)   
//         writeRegAxiLite(clock, dut, 0x00000010.U, 10.U) // maxLength
//         writeRegAxiLite(clock, dut, 0x00000018.U, 1.U)  // tailReg --> Added one element (Write to the tail, read from the head i.e FIFO)
//         writeRegAxiLite(clock, dut, 0x00000020.U, 0.U)  // headReg 
//         writeRegAxiLite(clock, dut, 0x00000000.U, 0.U)  // rPause  --> Resume module        

//         // Push the vss to send data to the virtual queue
//         // Then, Read the task from the Ready Valid side
//         for(i <-1 until 10){
//             io.connNetwork.data.availableTask.valid.poke(true.B)
//             io.connNetwork.ctrl.serveStealReq.ready.poke(false.B)
//             io.connNetwork.data.availableTask.bits.poke((8989 + i).U)
//             var x = io.write_address.valid.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.write_address.valid.peek().litValue
//             }
//             io.write_address.bits.expect((23 + i *8).U)
//             io.write_address.ready.poke(true.B)
            
//             x = io.write_data.valid.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.write_data.valid.peek().litValue
//             }
//             io.write_data.bits.expect((8989 + i).U)
//             io.write_data.ready.poke(true.B)
//             io.connNetwork.data.availableTask.valid.poke(false.B)
//             clock.step(1)
//         }

//         // Check that module is paused after writing 10 values
//         rPause = reportRegAxiLite(clock, dut, 0x00000000.U).litValue
//         while(rPause == BigInt(0)){
//             clock.step(1)
//             rPause = reportRegAxiLite(clock, dut, 0x00000000.U).litValue
//         }

//         writeRegAxiLite(clock, dut, 0x00000010.U, 20.U)   // maxLength --> extend length to 20
//         writeRegAxiLite(clock, dut, 0x00000018.U, 10.U)   // change tail position to the extended index
//         writeRegAxiLite(clock, dut, 0x00000000.U, 0.U)    // resume module execution.

//         // Push the vss to get data from the virtual queue
//         // Then, Read the task from the qOutTask interface with the network
//         io.connNetwork.data.availableTask.valid.poke(false.B)
//         io.connNetwork.ctrl.serveStealReq.ready.poke(true.B)
//         for(i <-0 until 10){
//             var x = io.read_address.valid.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.read_address.valid.peek().litValue
//             }
//             io.read_address.bits.expect((23 + i *8).U)
//             io.read_address.ready.poke(true.B)

//             io.read_data.valid.poke(true.B)
//             io.read_data.bits.poke((8989 + i).U)
//             x = io.read_data.ready.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.read_data.ready.peek().litValue
//             }

//             io.connNetwork.data.qOutTask.ready.poke(true.B)
//             while(!io.connNetwork.data.qOutTask.valid.peek().litToBoolean){
//                 clock.step(1)
//             }
//             io.connNetwork.data.qOutTask.bits.expect((8989 + i).U)
//         }
        
//         // Push the vss to send data to the virtual queue
//         // Then, Read the task from the Ready Valid side
//         for(i <-0 until 18){
//             io.connNetwork.data.availableTask.valid.poke(true.B)
//             io.connNetwork.ctrl.serveStealReq.ready.poke(false.B)
//             io.connNetwork.data.availableTask.bits.poke((8989 + i).U)
//             var x = io.write_address.valid.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.write_address.valid.peek().litValue
//             }
//             io.write_address.bits.expect((23 + ((10 + i)%20)*8).U)
//             io.write_address.ready.poke(true.B)
            
//             x = io.write_data.valid.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.write_data.valid.peek().litValue
//             }
//             io.write_data.bits.expect((8989 + i).U)
//             io.write_data.ready.poke(true.B)
//             io.connNetwork.data.availableTask.valid.poke(false.B)
//             clock.step(1)
//         }
        
        
//         // Push the vss to get data from the virtual queue
//         // Then, Read the task from the qOutTask interface with the network
//         io.connNetwork.data.availableTask.valid.poke(false.B)
//         io.connNetwork.ctrl.serveStealReq.ready.poke(true.B)
//         for(i <-0 until 18){
//             var x = io.read_address.valid.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.read_address.valid.peek().litValue
//             }
//             io.read_address.bits.expect((23 + ((10 + i)%20)*8).U)
//             io.read_address.ready.poke(true.B)

//             io.read_data.valid.poke(true.B)
//             io.read_data.bits.poke((8989 + i).U)
//             x = io.read_data.ready.peek().litValue
//             while(x == BigInt(0)){
//                 clock.step(1)
//                 x = io.read_data.ready.peek().litValue
//             }

//             io.connNetwork.data.qOutTask.ready.poke(true.B)
//             while(!io.connNetwork.data.qOutTask.valid.peek().litToBoolean){
//                 clock.step(1)
//             }
//             io.connNetwork.data.qOutTask.bits.expect((8989 + i).U)
//         }

//         clock.step(10)
//     }
// }


// class vssTestRV extends AnyFlatSpec with ChiselScalatestTester {
//     val annos = Seq(VerilatorBackendAnnotation, WriteVcdAnnotation)
//     it should "implement a virtual stealing server" in {
//         test(new vssWrapper(64, 4, 8, 2)).withAnnotations(annos) { dut =>

//             dut.io.axi_mgmt.ar.initSource()
//             dut.io.axi_mgmt.ar.setSourceClock(dut.clock)

//             dut.io.axi_mgmt.r.initSink()
//             dut.io.axi_mgmt.r.setSinkClock(dut.clock)

//             dut.io.axi_mgmt.aw.initSource()
//             dut.io.axi_mgmt.aw.setSourceClock(dut.clock)

//             dut.io.axi_mgmt.w.initSource()
//             dut.io.axi_mgmt.w.setSourceClock(dut.clock)

//             dut.io.axi_mgmt.b.initSink()
//             dut.io.axi_mgmt.b.setSinkClock(dut.clock)
//             vssTesterRV.runTest(dut.clock, dut)
//         }
//     }
// } 

// class vssWrapper(taskWidth: Int, 
//                          contentionThreshold: Int,
//                          peCount: Int,
//                          contentionDelta: Int) extends Module {
//     val vss = Module(new virtualStealServer(taskWidth, contentionThreshold, peCount, contentionDelta))
//     val io = IO(new Bundle{
//         val connNetwork   = Flipped(new stNwStSrvConn(taskWidth))
//         val axi_mgmt      = axi4.lite.ReadWriteInterface.slave(vss.regBlock.axiConfig)
//         val read_address  = DecoupledIO(UInt(32.W)) 
//         val read_data     = Flipped(DecoupledIO(UInt(taskWidth.W)))
//         val write_address = DecoupledIO(UInt(32.W))
//         val write_data    = DecoupledIO(UInt(taskWidth.W))
//     })
//     vss.io.connNetwork <> io.connNetwork
//     vss.io.read_address <> io.read_address
//     vss.io.read_data <> io.read_data
//     vss.io.write_address <> io.write_address
//     vss.io.write_data <> io.write_data
//     vss.io.axi_mgmt.liteRW <> io.axi_mgmt
// }

