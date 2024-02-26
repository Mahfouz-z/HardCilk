import chisel3._
import chiseltest._
import org.scalatest.flatspec.AnyFlatSpec
import stealSide._
import commonInterfaces.dequeInterfaceConn
import scala.collection.mutable.ArrayDeque
import scala.collection.mutable.ArrayBuffer
import os.truncate
import java.io._
import scala.util.control.Breaks._
import os.write
import java.nio.file.Files
import java.nio.file.Paths
//import scala.collection.JavaConverters._
import scala.jdk.CollectionConverters._
//import com.github.sh0nk.matplotlib4j._

object simConsts {
    val vTaskQueueInitSize  = 1
    val peCount             = 100
    val taskWidth           = 32
    val queueMaxLength      = 32
    val taskMinCycles       = 20 
    val taskMaxCycles       = 100
    val probCreateTaskDecay = 0.978
    val qRamReadLatency     = 1
    val qRamWriteLatency    = 2
    val randomSeed          = 753
}

class clockCounter {
    var count = 0
    var done  = false
    def getValue(): Int = {
        count
    }
    def incrementClock: Unit = {
        count += 1
    }
    def setDone: Unit = {
        done = true
    }
}
class workerRecord {
    var popCycles  = 0
    var popCount   = 0
    var pushCycles = 0
    var pushCount  = 0
    var workCycles = 0
    var lock = 0
}
class ServerRecord {
    var tasksTakenCount = 0
    var tasksGivenCount = 0
}

object stealSideSimulator {
    def randInt(start:Int, end:Int, rnd:scala.util.Random): Int = {
        start + rnd.nextInt( (end - start) + 1 ) 
    }

    def createTasksArr(size: Int): ArrayDeque[BigInt] = {
        // Creats a list of random tasks to be
        // used in the simulation.
        var tasks = new ArrayDeque[BigInt](size)
        for (i <- 0 until size){
            tasks.addOne(100)
        }
        tasks
    }


    def virtServerSimulator(clock : Clock, 
                            io : stealNW_TQ_IO, 
                            clkCounter: clockCounter,
                            virtServerRecord: ServerRecord,
                            vTaskQueue: ArrayDeque[BigInt],
                            rnd:scala.util.Random): Unit = {
        var networkCongested     = false
        var networkUtilCounter   = 0
        

        while(!clkCounter.done){
            if (!io.connVSS.ctrl.serveStealReq.ready.peek().litToBoolean
               && io.connVSS.data.availableTask.valid.peek().litToBoolean
               && networkUtilCounter <= simConsts.peCount){
                networkUtilCounter += 1
            }  
            
            if (io.connVSS.ctrl.serveStealReq.ready.peek().litToBoolean  
               && !io.connVSS.data.availableTask.valid.peek().litToBoolean
               && !vTaskQueue.isEmpty) {
                // Decrease Network Utilization Counter
                if(networkUtilCounter > 0){
                    networkUtilCounter -= 1
                }
                // Take in the request.
                stealNW_TQ_tester.virtServerDigestStealRequest(clock, io)
                // Push a task to the network.
                stealNW_TQ_tester.virtServerGiveAwayTask(clock, io, vTaskQueue.removeLast(false).U)
                virtServerRecord.tasksGivenCount  += 1
            } else if (io.connVSS.ctrl.serveStealReq.ready.peek().litToBoolean  
               && io.connVSS.data.availableTask.valid.peek().litToBoolean) {
                // Take in the request, and let the task continue on the data network.
                stealNW_TQ_tester.virtServerDigestStealRequest(clock, io)
                // Decrease Network Utilization Counter
                if(networkUtilCounter > 0){
                    networkUtilCounter -= 1
                }
            } else if (networkCongested) {
                vTaskQueue.addOne(stealNW_TQ_tester.virtServerTakeInTask(clock, io))
                networkUtilCounter -= 1
                virtServerRecord.tasksTakenCount  += 1
            } else {
                clock.step(1)
            }

            if(networkUtilCounter > (simConsts.peCount/1.2).toInt){
                networkCongested     = true
            } else {
                networkCongested     = false
            }
        }
    }

    def doneChecker(clock        : Clock,
                    io           : stealNW_TQ_IO,
                    vTaskQueue   : ArrayDeque[BigInt],
                    clkCounter   : clockCounter,
                    recordsArray : ArrayBuffer[workerRecord]): Unit = {
        while(!clkCounter.done){
            breakable{
                clock.step(1)
                for (conn <- io.connPE) {
                    if(conn.currLength.peek().litValue > 0){
                        break()
                    }
                }
                if(!vTaskQueue.isEmpty) {
                    break()
                }
                for (record <- recordsArray){
                    if(record.lock == 1)
                        break()
                }
                for(i<-0 until((simConsts.peCount +5) * 2)){
                    clock.step(1)
                }
                for (conn <- io.connPE) {
                    if(conn.currLength.peek().litValue > 0){
                        break()
                    }
                }
                if(!vTaskQueue.isEmpty) {
                    break()
                }
                for (record <- recordsArray){
                    if(record.lock == 1)
                        break()
                }
                clkCounter.done = true
            }
        }
        clkCounter.done = true
    }

    def peSimulator(clock : Clock,
                    connPE : dequeInterfaceConn,
                    clkCounter: clockCounter, 
                    record: => workerRecord,
                    rnd:scala.util.Random): Unit = {

        var clockStart = 0 
        var taskClockCount = 0
        var taskVal = BigInt(0)
        breakable{
            while(!clkCounter.done){
                // Pop a task from the task queue
                clockStart = clkCounter.getValue()
                taskVal = stealNW_TQ_tester.popTaskPE(clock, connPE, clkCounter.done)
                if(taskVal == -1) 
                    break()
                record.lock = 1
                record.popCycles += clkCounter.getValue() - clockStart - simConsts.qRamReadLatency
                record.popCount  += 1

                // Take random number of cycles in range [taskMinCycles:taskMaxCycles]
                // to simulate executing a task.
                taskClockCount    = randInt(simConsts.taskMinCycles, simConsts.taskMaxCycles, rnd)
                record.workCycles += taskClockCount
                clock.step(taskClockCount) 

                // If the PE did not create its maximum allowed, create
                // with a probTaskCreate% possibility.
                if(BigDecimal(Math.random()*100.0).toBigInt < taskVal){
                    clockStart = clkCounter.getValue()
                    val newTask = (simConsts.probCreateTaskDecay * taskVal.toInt).toInt
                    stealNW_TQ_tester.pushTaskPE(clock, connPE, newTask)
                    stealNW_TQ_tester.pushTaskPE(clock, connPE, newTask)
                    record.pushCycles += clkCounter.getValue() - clockStart - simConsts.qRamWriteLatency
                    record.pushCount  += 2
                }
                record.lock = 0
            }
        }

    }

    def counter(clock : Clock, clkCounter: clockCounter): Unit = {
        while(!clkCounter.done){
            clkCounter.incrementClock
            clock.step(1)
        }
    }

    def runTest(clock : Clock, io : stealNW_TQ_IO): Unit = {
        // val rnd = new scala.util.Random(simConsts.randomSeed)
        // val x = NumpyUtils.linspace(0, simConsts.peCount, simConsts.peCount).asScala.toList
        // //val y = x.map(xi => Math.sin(xi) + Math.random()).map(Double.box)
        // var y   = new ArrayBuffer[Int](simConsts.peCount)
        // for(i <- 0 until(simConsts.peCount)){
        //     y += randInt(0, 95988, rnd)
        // }
        // val plt = Plot.create()
        // plt.plot().add(x.asJava, y.asJava, "o")
        // plt.title("scatter")
        // Files.createDirectories(Paths.get("test_run_dir/should_Simulate_the_stealing_side/plots"));
        
        // plt.savefig(f"test_run_dir/should_Simulate_the_stealing_side/plots/"+
        //                                  f"plot__${simConsts.peCount}_" +
        //                                  f"${simConsts.queueMaxLength}_" +
        //                                  f"${(simConsts.probCreateTaskDecay*1000).toInt}.png").dpi(200) 
        // plt.executeSilently();
        // //plt.show()
        clock.setTimeout(7000+(simConsts.peCount + 5)*2)
        val rnd = new scala.util.Random(simConsts.randomSeed)

        val clkCounter       = new clockCounter
        var recordsArray     = new ArrayBuffer[workerRecord](simConsts.peCount)
        var virtServerRecord = new ServerRecord
        var vTaskQueue       = createTasksArr(simConsts.vTaskQueueInitSize) 
    
        fork{
            virtServerSimulator(clock, io, clkCounter, virtServerRecord, vTaskQueue, rnd)
        }
        
        for(i <- 0 until(simConsts.peCount)){
            recordsArray += new workerRecord
            fork{
                peSimulator(clock, io.connPE(i), clkCounter, recordsArray(i), rnd)
            }
        }

        fork{
            counter(clock, clkCounter)
        }

        fork{
            doneChecker(clock, io, vTaskQueue, clkCounter, recordsArray)
        }.join()

        var tasksCountPeArr   = new ArrayBuffer[Int](simConsts.peCount)
        Files.createDirectories(Paths.get("test_run_dir/should_Simulate_the_stealing_side/simStats"));
        val writer    = new PrintWriter(new File(f"test_run_dir/should_Simulate_the_stealing_side/simStats/"+
                                        f"simStats_${simConsts.peCount}_" +
                                        f"${simConsts.queueMaxLength}_" +
                                        f"${(simConsts.probCreateTaskDecay*1000).toInt}.txt" ))
        // val csvWriter = new PrintWriter(new File("test_run_dir/should_Simulate_the_stealing_side/WorkCycles.csv"))
        writer.printf("Virtual Server Stats: \n" +
                "     Number of Taken Tasks:        %d,\n" +
                "     Number of Given Tasks:        %d,\n",
                virtServerRecord.tasksTakenCount,
                virtServerRecord.tasksGivenCount,
            ) 
        var sumWorkCycles = 0
        var sumCycles   = 0 
        var createdTasksTotal = 0
        var executedTasksTotal = 0
        for(i <- 0 until(simConsts.peCount)){
            // csvWriter.printf(f" ${recordsArray(i).workCycles},")
            sumWorkCycles      += recordsArray(i).workCycles
            sumCycles          += recordsArray(i).popCycles + recordsArray(i).pushCycles + recordsArray(i).workCycles
            // tasksCountPeArr    += recordsArray(i).popCount
            createdTasksTotal  += recordsArray(i).pushCount
            executedTasksTotal += recordsArray(i).popCount
            val totalCycles = (recordsArray(i).popCycles + recordsArray(i).pushCycles + recordsArray(i).workCycles).toFloat
            writer.printf("PE(%d): \n" +
                "     Executed Tasks Count:          %d,\n" +
                "     Executed Cycles Count:         %d,\n" +
                "     Execution Cycles Percentage:   %.2f%%,\n" +
                "     Push Tasks Cycles Percentage:  %.2f%%,\n" +
                "     Pop Tasks Cycles Percentage:   %.2f%%,\n" +
                "     Total Cycles:                  %.0f,\n" +
                "     Created Tasks Count:           %d,\n",
                i, 
                recordsArray(i).popCount, 
                recordsArray(i).workCycles,
                recordsArray(i).workCycles*100/totalCycles,
                recordsArray(i).pushCycles*100/totalCycles,
                recordsArray(i).popCycles*100/totalCycles,
                totalCycles,
                recordsArray(i).pushCount
              )     
        }


        

        var workCyclesMean = sumWorkCycles * 1.0 / simConsts.peCount 
        var sum = 0.0
        for(i <- 0 until(simConsts.peCount)){
            sum += (recordsArray(i).workCycles - workCyclesMean) * (recordsArray(i).workCycles - workCyclesMean)
        }
        var stdDev = math.sqrt(sum / simConsts.peCount)
        writer.printf("________\n" +
          f"Total Executed Tasks:        ${executedTasksTotal},\n" +
          f"Total Work Cycles:           ${sumWorkCycles},\n" +
          f"Work Cycles Percentage:      ${(sumWorkCycles*100.0/sumCycles)}%.2f,\n" +
          f"Mean Across PEs:             ${workCyclesMean}%.0f,\n" +
          f"stdDev Across PEs:           ${stdDev}%.0f, \n" +
          f"stdDev Percentage of mean:   ${stdDev*100.0/workCyclesMean}%.2f, \n") 
        writer.close()
        // csvWriter.close()
        println(executedTasksTotal)
        println(createdTasksTotal+simConsts.vTaskQueueInitSize)
        assert(executedTasksTotal == (createdTasksTotal+simConsts.vTaskQueueInitSize))
    }
}

class stealSideSim extends AnyFlatSpec with ChiselScalatestTester {
    it should "Simulate the stealing side." in {
        // Params (peCount: Int, taskWidth: Int, queueMaxLength:Int, qRamReadLatency: Int, qRamWriteLatency: Int)
        val annos = Seq(IcarusBackendAnnotation)//, WriteVcdAnnotation) //Seq(VerilatorBackendAnnotation)//
        test(new stealNW_TQ(simConsts.peCount, 
                            1,       
                            simConsts.taskWidth, 
                            simConsts.queueMaxLength, 
                            simConsts.qRamReadLatency, 
                            simConsts.qRamWriteLatency)).withAnnotations(annos) 
        { dut =>
            stealSideSimulator.runTest(dut.clock, dut.io)
        }
    }
}