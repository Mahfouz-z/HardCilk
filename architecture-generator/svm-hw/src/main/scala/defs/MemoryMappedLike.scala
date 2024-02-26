package defs

import chisel3._

trait MemoryMappedLike {

  /** `True` if there is an incoming read request */
  def rdReq: Bool

  /** address of the incoming read request */
  def rdAddr: UInt

  /** accepts the incoming read request, returning the default values to the
    * requester.
    */
  def rdOk(): Unit

  /** accepts the incoming read request, returning the provided data as a
    * response to the requester.
    *
    * @param data
    *   data to return.
    */
  def rdOk(data: Bits): Unit

  /** fails the read request with an error. */
  def rdError(): Unit

  /** `True` if there is an incoming write request */
  def wrReq: Bool

  /** address of the incoming write request */
  def wrAddr: UInt

  /** data corresponding to the incoming write request */
  def wrData: UInt

  /** write strobe of the incoming write request */
  def wrStrb: UInt

  /** accepts the write request, performing the default action.
    */
  def wrOk(): Unit

  /** accepts the write request, does not do anything. */
  def wrDiscard(): Unit

  /** fails the write request. */
  def wrError(): Unit
}
