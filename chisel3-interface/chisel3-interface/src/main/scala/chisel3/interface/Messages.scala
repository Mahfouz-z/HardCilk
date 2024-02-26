package chisel3.interface

import strenc._
import strenc.EncodersDecoders._

case class Request(
    val name: String,
    val command: String
)

object Request extends UserTypeCompanion[Request] {
  def encode(t: Request, os: ArgumentOutputStream): Unit = {
    os.push(t.name)
    os.push(t.command)
  }

  def decode(is: ArgumentInputStream): Request = {
    Request(is.pop[String], is.pop[String])
  }

  Typed.registerUserType[Request]("chisel3.interface.Request")
}

case class Response(
  val name: String,
  val success: Boolean,
  val errorMsg: String
)

object Response extends UserTypeCompanion[Response] {
  def encode(t: Response, os: ArgumentOutputStream): Unit = {
    os.push(t.name)
    os.push(t.success)
    os.push(t.errorMsg)
  }

  def decode(is: ArgumentInputStream): Response = {
    Response(is.pop[String], is.pop[Boolean], is.pop[String])
  }

  Typed.registerUserType[Response]("chisel3.interface.Response")
}

