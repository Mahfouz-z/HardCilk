package strenc

import strenc._

import java.io.OutputStream
import java.nio.charset.StandardCharsets

class ArgumentOutputStream(outputStream: OutputStream) {
  private val os = outputStream

  private[strenc] def pushByte(x: Byte): Unit = {
    os.write(x)
  }

  private[strenc] def pushBytes(x: Array[Byte]): Unit = {
    os.write(x)
  }

  private[strenc] def pushBytesEncodeLength(x: Array[Byte]): Unit = {
    pushLong(x.size)
    pushSubfield()
    os.write(x)
  }

  private[strenc] def pushString(x: String): Unit = {
    pushBytes(x.getBytes(StandardCharsets.UTF_8))
  }

  private[strenc] def pushStringEncodeLength(x: String): Unit = {
    pushBytesEncodeLength(x.getBytes(StandardCharsets.UTF_8))
  }

  private[strenc] def pushStringChecked(x: String): Unit = {
    assert(!x.contains(Separators.field) && !x.contains(Separators.subfield))
    pushString(x)
  }

  private[strenc] def pushLong(x: Long): Unit = {
    // TODO make sure that toString() is locale-independent
    pushString(x.toString())
  }

  private[strenc] def pushDouble(x: Double): Unit = {
    // TODO make sure that toString() is locale-independent
    // TODO add a specialized double encoder/decoder
    pushString(x.toString())
  }

  private[strenc] def pushField(): Unit = {
    pushByte(Separators.field)
  }

  private[strenc] def pushSubfield(): Unit = {
    pushByte(Separators.subfield)
  }

  def push[T: Encoder](t: T): this.type = {
    implicitly[Encoder[T]].encode(t, this)
    this
  }

  def close(): Unit = {
    os.close()
  }
}
