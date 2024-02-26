package utils

import chisel3._
import chisel3.util._

/** A combinational Content Addressable Memory with a single port.
  *
  * @note
  *   Synthesized using LUT blocks, not efficient for a very large number of
  *   entries.
  *
  * @note
  *   Does not forward the currently written value.
  *
  * @note
  *   Use `cam.rdValid` instead of `cam.rdEntry.valid` because CAM still outputs
  *   a valid entry even if there is not match.
  *
  * @param genEntry
  *   Generator for entry, 0.U should be an invalid entry
  * @param numEntries
  *   Number of entries
  * @param fnValid
  *   Extracts the valid field of an entry
  * @param fnIndex
  *   Extracts the index field of an entry
  */
class ContentAddressableMemory[T <: Data](
    val genEntry: T,
    val numEntries: Int,
    val fnValid: (T) => Bool,
    val fnKey: (T) => UInt
) extends Module {
  val delay = 0
  val genKey = chiselTypeOf(fnKey(0.asUInt.asTypeOf(genEntry)))
  val genIndex = UInt(chisel3.util.log2Ceil(numEntries).W)

  /** Index */
  val rdKey = IO(Input(genKey))

  /** Is valid? */
  val rdValid = IO(Output(Bool()))

  /** Output entry to read */
  val rdEntry = IO(Output(genEntry))

  /** Index of the read entry */
  val rdIndex = IO(Output(genIndex))

  /** Should write? */
  val wrEnable = IO(Input(Bool()))

  /** Write index */
  val wrIndex = IO(Input(genIndex))

  /** Input entry to write */
  val wrEntry = IO(Input(genEntry))

  /** storage */
  private val mem_ = RegInit(VecInit(Seq.fill(numEntries) {
    0.U.asTypeOf(genEntry)
  }))

  /** hit table */
  private val hitTable_ = VecInit(mem_.map { case (entry) =>
    fnValid(entry) && fnKey(entry) === rdKey
  }).asUInt

  /** index of the matching entry with the smallest index */
  private val rdIndex_ = PriorityEncoder(hitTable_)

  /** read entry */
  private val rdEntry_ = mem_(rdIndex_)

  rdIndex := rdIndex_

  /* assign read signals */
  rdValid := hitTable_(rdIndex_).asBool
  rdEntry := rdEntry_

  /* write if there is a write request */
  when(wrEnable) {
    mem_(wrIndex) := wrEntry
  }

}
