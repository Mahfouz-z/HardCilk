package chisel3.interface

import strenc.Typed

/** @brief
  *   A module can implement this interface to provide extra information.
  */
trait Extra {
  def getExtra: Typed
}
