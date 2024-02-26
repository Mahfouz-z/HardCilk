package emitter

import strenc._
import chisel3.interface.net.Server

object main extends App {
  // Hardware modules to be recognized
  Typed.registerUserType[axi4.tlb.Translator]
  Typed.registerUserType[axi4.lite.RegisterLogic]

  new Server(9100).run()
}
