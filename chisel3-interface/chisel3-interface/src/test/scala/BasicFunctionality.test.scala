import chisel3._
import strenc._
import strenc.EncodersDecoders._
import strenc.Literals._

class BasicModule(val data: Int) extends Module {
  val output = IO(Output(UInt(32.W)))
  output := data.U(32.W)
}

object BasicModule extends UserTypeCompanion[BasicModule] {
  def encode(t: BasicModule, os: ArgumentOutputStream): Unit = {
    os.push(t.data)
  }

  def decode(is: ArgumentInputStream): BasicModule = {
    new BasicModule(is.pop[Int])
  }
}

class ExtraModule(val data: Int) extends Module with chisel3.interface.Extra {
  val output = IO(Output(UInt(32.W)))
  output := data.U(32.W)

  def getExtra: Typed = s"Extra data = ${data}".typed
}

object ExtraModule extends UserTypeCompanion[ExtraModule] {
  def encode(t: ExtraModule, os: ArgumentOutputStream): Unit = {
    os.push(t.data)
  }

  def decode(is: ArgumentInputStream): ExtraModule = {
    new ExtraModule(is.pop[Int])
  }
}

object BasicFunctionality extends App {
  Typed.registerUserType[BasicModule]("BasicModule")
  Typed.registerUserType[ExtraModule]("ExtraModule")
  new chisel3.interface.net.Server(9100).run()
}
