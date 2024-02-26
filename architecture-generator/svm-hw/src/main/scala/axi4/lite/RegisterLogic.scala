package axi4.lite

import chisel3._
import chisel3.util._
import strenc.EncodersDecoders._

class RegisterLogic(
    val wAddr: Int = 32,
    val wData: Int = 32,
    val customName: Option[String] = None
) extends Module {
  assert(
    wData == 32 || wData == 64,
    "Only 32-bit or 64-bit registers are supported."
  )
  private val regBlock = new axi4.lite.RegisterBlock(wAddr, wData, 4)

  override def desiredName: String = customName match {
    case Some(x) => x
    case None    => super.desiredName
  }

  val SAXIL = IO(axi4.Slave(regBlock.axiConfig))
  val input = IO(Input(UInt(wData.W)))
  val output = IO(Output(UInt(wData.W)))

  SAXIL.liteRW <> regBlock.saxil

  private val register = RegInit(0.U(wData.W))
  output := register

  regBlock.base(0x00)
  regBlock.reg(register, read = true, write = true, desc = "OUTPUT")

  regBlock.base(0x08)
  regBlock.reserve(8, desc = "INPUT")

  when(regBlock.rdReq) {
    when(regBlock.rdAddr === 0x08.U) {
      regBlock.rdOk(input)
    }.otherwise {
      regBlock.rdOk()
    }
  }

  when(regBlock.wrReq) {
    when(regBlock.wrAddr === 0x00.U) {
      register := regBlock.wrData
    }

    regBlock.wrOk()
  }
}

object RegisterLogic extends strenc.UserTypeCompanion[RegisterLogic] {

  override def encode(
      t: RegisterLogic,
      os: strenc.ArgumentOutputStream
  ): Unit = {
    os.push(t.wAddr)
    os.push(t.wData)
    os.push(t.customName)
  }

  override def decode(is: strenc.ArgumentInputStream): RegisterLogic = {
    new RegisterLogic(is.pop[Int], is.pop[Int], is.pop[Option[String]])
  }

}
