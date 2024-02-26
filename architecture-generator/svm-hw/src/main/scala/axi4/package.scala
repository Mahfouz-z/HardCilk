import chisel3.experimental.dataview._

import axi4.full
import axi4.lite

package object axi4 {
  implicit class viewInterfaceAs(x: Interface) {
    def fullRW = x.viewAs[full.ReadWriteInterface]
    def fullR = x.viewAs[full.ReadInterface]
    def fullW = x.viewAs[full.WriteInterface]

    def liteRW = x.viewAs[lite.ReadWriteInterface]
    def liteR = x.viewAs[lite.ReadInterface]
    def liteW = x.viewAs[lite.WriteInterface]
  }

  implicit class viewFullReadWriteInterfaceAs(x: full.ReadWriteInterface) {
    def r = x.viewAs[full.ReadInterface]
    def w = x.viewAs[full.WriteInterface]
  }

  implicit class viewLiteReadWriteInterfaceAs(x: lite.ReadWriteInterface) {
    def r = x.viewAs[lite.ReadInterface]
    def w = x.viewAs[lite.WriteInterface]
  }

  // TODO figure out backward casts as well, from ReadInterface -> Interface
}
