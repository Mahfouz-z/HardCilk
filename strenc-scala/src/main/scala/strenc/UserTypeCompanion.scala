package strenc

import scala.reflect.ClassTag
import java.nio.charset.StandardCharsets

abstract class UserTypeCompanion[T: ClassTag] {
  implicit def encoder = new Encoder[T] {
    def encode(t: T, os: ArgumentOutputStream): Unit = _encode(t, os)
  }

  implicit def decoder = new Decoder[T] {
    def decode(is: ArgumentInputStream): T = _decode(is)
  }

  implicit val _userTypeTag = UserTyped.Tag[T]

  def encode(t: T, os: ArgumentOutputStream): Unit
  def decode(is: ArgumentInputStream): T

  private def _encode(t: T, os: ArgumentOutputStream): Unit = encode(t, os)
  private def _decode(is: ArgumentInputStream) = decode(is)
}
