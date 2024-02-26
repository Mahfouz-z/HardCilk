package strenc

import java.nio.charset.StandardCharsets
import java.io._

object Separators {
  val field = '!'.toByte
  val subfield = '?'.toByte
}

trait Encoder[T] {
  def encode(t: T, os: ArgumentOutputStream): Unit
}

trait Decoder[T] {
  def decode(is: ArgumentInputStream): T
}

object encode {
  def apply[T: Encoder](t: T, os: OutputStream): Unit =
    implicitly[Encoder[T]].encode(t, new ArgumentOutputStream(os))

  def apply[T: Encoder](t: T): Array[Byte] = {
    val byteOutputStream = new ByteArrayOutputStream
    apply(t, byteOutputStream)
    byteOutputStream.toByteArray()
  }
}

object decode {
  def apply[T: Decoder](is: InputStream): T =
    implicitly[Decoder[T]].decode(new ArgumentInputStream(is))

  def apply[T: Decoder](bytes: Array[Byte]): T = {
    apply(new ByteArrayInputStream(bytes))
  }
}
