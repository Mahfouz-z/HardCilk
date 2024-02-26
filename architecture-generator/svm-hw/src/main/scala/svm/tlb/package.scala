package svm

import chisel3._

package object tlb {
  def setZeros(x: Data): Unit = {
    x := 0.U(x.getWidth.W).asTypeOf(x)
  }
}
