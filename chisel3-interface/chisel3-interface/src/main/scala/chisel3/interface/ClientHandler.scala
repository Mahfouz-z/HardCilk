package chisel3.interface

import java.io.InputStream
import java.io.OutputStream
import chisel3.stage.ChiselStage
import chisel3.RawModule
import strenc._
import strenc.EncodersDecoders._

class ClientHandler(
    val requests: ArgumentInputStream,
    val responses: ArgumentOutputStream
) {
  private val chiselStage = new ChiselStage

  private var stopped = false

  private def emitVerilog(request: Request): Unit = {
    val chiselStageArgs = requests.pop[Seq[String]]
    try {
      var extra = None.asInstanceOf[Option[Typed]]
      chiselStage.emitVerilog(
        {
          val module = requests.pop[Typed]
          if (module.obj.isInstanceOf[Extra]) {
            extra = Some(module.obj.asInstanceOf[Extra].getExtra)
          }
          module.get[RawModule]
        },
        chiselStageArgs.toArray
      )

      // Note: we assume that the following statements do not throw
      // If they throw, the server should die
      responses.push(Response(request.name, true, ""))
      responses.push(extra)
    } catch {
      case ex: Throwable => {
        responses.push(Response(request.name, false, ex.getMessage()))
      }
    }
  }

  private def emitSystemVerilog(request: Request): Unit = {
    val chiselStageArgs = requests.pop[Seq[String]]
    try {
      var extra = None.asInstanceOf[Option[Typed]]
      chiselStage.emitSystemVerilog(
        {
          val module = requests.pop[Typed]
          if (module.obj.isInstanceOf[Extra]) {
            extra = Some(module.obj.asInstanceOf[Extra].getExtra)
          }
          module.get[RawModule]
        },
        chiselStageArgs.toArray
      )

      // Note: we assume that the following statements do not throw
      // If they throw, the server should die
      responses.push(Response(request.name, true, ""))
      responses.push(extra)
    } catch {
      case ex: Throwable => {
        responses.push(Response(request.name, false, ex.getMessage()))
      }
    }
  }

  private def emitFirrtl(request: Request): Unit = {
    val chiselStageArgs = requests.pop[Seq[String]]
    try {
      var extra = None.asInstanceOf[Option[Typed]]
      chiselStage.emitFirrtl(
        {
          val module = requests.pop[Typed]
          if (module.obj.isInstanceOf[Extra]) {
            extra = Some(module.obj.asInstanceOf[Extra].getExtra)
          }
          module.get[RawModule]
        },
        chiselStageArgs.toArray
      )

      // Note: we assume that the following statements do not throw
      // If they throw, the server should die
      responses.push(Response(request.name, true, ""))
      responses.push(extra)
    } catch {
      case ex: Throwable => {
        responses.push(Response(request.name, false, ex.getMessage()))
      }
    }
  }

  private def emitChirrtl(request: Request): Unit = {
    val chiselStageArgs = requests.pop[Seq[String]]
    try {
      var extra = None.asInstanceOf[Option[Typed]]
      chiselStage.emitChirrtl(
        {
          val module = requests.pop[Typed]
          if (module.obj.isInstanceOf[Extra]) {
            extra = Some(module.obj.asInstanceOf[Extra].getExtra)
          }
          module.get[RawModule]
        },
        chiselStageArgs.toArray
      )

      // Note: we assume that the following statements do not throw
      // If they throw, the server should die
      responses.push(Response(request.name, true, ""))
      responses.push(extra)
    } catch {
      case ex: Throwable => {
        responses.push(Response(request.name, false, ex.getMessage()))
      }
    }
  }

  private def handleNext(): Unit = {
    val request = requests.pop[Request]
    println(
      f"Request '${request.name}' received, command: '${request.command}'"
    )

    request.command match {
      case "stop" => {
        stopped = true
      }
      case "emitVerilog" => {
        emitVerilog(request)
      }
      case "emitSystemVerilog" => {
        emitSystemVerilog(request)
      }
      case "emitFirrtl" => {
        emitFirrtl(request)
      }
      case "emitChirrtl" => {
        emitChirrtl(request)
      }
      case value: String => {
        throw new IllegalArgumentException(f"unknown command: ${value}")
      }
    }
  }

  def run() = {
    stopped = false
    while (!stopped) handleNext()
    requests.close()
    responses.close()
  }
}
