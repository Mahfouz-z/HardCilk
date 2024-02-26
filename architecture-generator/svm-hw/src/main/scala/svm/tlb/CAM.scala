package svm.tlb

import chisel3._
import chisel3.util._

/** A combinational Content Addressable Memory with a single port.
  *
  * @note
  *   Synthesized using LUT blocks, not efficient for a very large number of
  *   entries.
  *
  * @note
  *   Does not forwalookup the currently written value.
  *
  * @note
  *   Use `cam.lookupFound` instead of `cam.lookupEntry.valid` because CAM still outputs
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
class CAM[T <: Data](
    val genEntry: T,
    val numEntries: Int,
    val fnValid: (T) => Bool,
    val fnKey: (T) => UInt
) extends Module {
  val delay = 0
  val genKey = chiselTypeOf(fnKey(0.asUInt.asTypeOf(genEntry)))
  val genIndex = UInt(chisel3.util.log2Ceil(numEntries).W)

  /** Key */
  val lookupKey = IO(Input(genKey))

  /** Is found? */
  val lookupFound = IO(Output(Bool()))

  /** Output entry, the lookup result */
  val lookupEntry = IO(Output(genEntry))

  /** Index of the lookup result */
  val lookupIndex = IO(Output(genIndex))

  /** Index of the read port */
  val rdIndex = IO(Input(genIndex))

  /** Read entry */
  val rdEntry = IO(Output(genEntry))

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
    fnValid(entry) && fnKey(entry) === lookupKey
  }).asUInt

  /** index of the matching entry with the smallest index */
  private val lookupIndex_ = PriorityEncoder(hitTable_)

  /** read entry */
  private val lookupEntry_ = mem_(lookupIndex_)

  lookupIndex := lookupIndex_

  /* assign read signals */
  lookupFound := hitTable_(lookupIndex_).asBool
  lookupEntry := lookupEntry_

  /* write if there is a write request */
  when(wrEnable) {
    mem_(wrIndex) := wrEntry
  }

  /* Read entry from the index */
  rdEntry := mem_(rdIndex)
}
