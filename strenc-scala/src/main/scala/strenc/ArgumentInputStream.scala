package strenc

import strenc._

import java.io._
import java.util.InputMismatchException
import java.nio.charset.StandardCharsets

class ArgumentInputStream(inputStream: InputStream) {
  private val is = new PushbackInputStream(inputStream)
  private val os = new ByteArrayOutputStream()

  private def unpopByte(b: Int): Unit = {
    is.unread(b)
  }

  private[strenc] def popByte(): Int = {
    val read = is.read()
    if (read < 0)
      throw new EOFException
    read
  }

  private[strenc] def popByteDecodeLength(): Array[Byte] = {
    val length = popLong().toInt
    popSubfield()
    popFixedLength(length)
  }

  private[strenc] def expectByte(x: Int): Unit = {
    val poppedByte = popByte()
    if (poppedByte != x)
      throw new InputMismatchException(
        f"expected byte: ${x.toChar} (0x${x.toHexString}), encountered ${poppedByte.toChar} (0x${poppedByte.toHexString})"
      )
  }

  private[strenc] def popUntilSeparator(): Array[Byte] = {
    os.reset()

    var b = popByte()

    while (b >= 0 && b != Separators.field && b != Separators.subfield) {
      os.write(b)
      b = popByte()
    }

    if (b >= 0)
      // place the separator back
      unpopByte(b)

    os.toByteArray()
  }

  private[strenc] def popFixedLength(length: Int): Array[Byte] = {
    val result = new Array[Byte](length)
    val actualLength = is.read(result, 0, length)
    if (actualLength != length)
      throw new InputMismatchException(
        f"expected number of bytes = ${length}, actual number of read bytes = ${actualLength}"
      )
    result
  }

  private[strenc] def popString(): String = {
    new String(popUntilSeparator(), StandardCharsets.UTF_8)
  }

  private[strenc] def popStringDecodeLength(): String = {
    new String(popByteDecodeLength(), StandardCharsets.UTF_8)
  }

  private[strenc] def popLong(): Long = {
    // TODO make sure that toLong is locale-independent
    popString().toLong
  }

  private[strenc] def popDouble(): Double = {
    popString().toDouble
  }

  private[strenc] def popField() = {
    expectByte(Separators.field)
  }

  private[strenc] def popSubfield() = {
    expectByte(Separators.subfield)
  }

  def pop[T: Decoder]: T = {
    implicitly[Decoder[T]].decode(this)
  }

  def close(): Unit = {
    is.close()
    os.close()
  }
}
