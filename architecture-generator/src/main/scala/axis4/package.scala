import chisel3._
import chisel3.util._
import chisel3.experimental.dataview._

package object axis4 {

  implicit class viewInterfaceAs(x: Interface) {
    import axis4.BasicChannel._
    import axis4.FullChannel._

    def lite = x.viewAs[DecoupledIO[Bits]]
    def full = x.viewAs[DecoupledIO[FullChannel]]
  }
}
