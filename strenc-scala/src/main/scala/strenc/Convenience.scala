package strenc

import java.nio.charset.StandardCharsets
import java.io.ByteArrayOutputStream

object Literals {
  implicit class typedSuffixUserType[T: UserTyped.Tag](t: T) {
    def typed: Typed = UserTyped(t, t.getClass().getName())
    def typed(typeName: String): Typed = UserTyped(t, typeName)
  }

  implicit class typedSuffixPrimitiveType[T: PrimitiveTyped.Tag](t: T) {
    def typed: Typed = PrimitiveTyped(t)
  }
}

object EncodersDecoders extends Object with ED_Primitives with ED_Typed
