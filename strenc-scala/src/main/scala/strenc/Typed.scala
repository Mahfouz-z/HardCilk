package strenc

import scala.reflect.ClassTag
import java.nio.charset.StandardCharsets
import EncodersDecoders._
import Literals._

trait Typed {
  def isPrimitive: Boolean
  def typeName: String

  def obj: java.lang.Object
  def get[T]: T = obj.asInstanceOf[T]

  final def isString = isPrimitive && typeName == "String"
  final def isByteArray = isPrimitive && typeName == "ByteArray"
  final def isBoolean = isPrimitive && typeName == "Boolean"
  final def isFloat = isPrimitive && typeName == "Float"
  final def isDouble = isPrimitive && typeName == "Double"
  final def isInt = isPrimitive && typeName == "Int"
  final def isLong = isPrimitive && typeName == "Long"
  final def isSeq = isPrimitive && typeName == "List"
  final def isOption = isPrimitive && typeName == "Option"

  final def asString = get[String]
  final def asByteArray = get[Array[Byte]]
  final def asBoolean = get[Boolean]
  final def asFloat = get[Float]
  final def asDouble = get[Double]
  final def asInt = get[Int]
  final def asLong = get[Long]
  final def asSeq = get[Seq[Typed]]
  final def asOption = get[Option[Typed]]
}

case class PrimitiveTyped[T: PrimitiveTyped.Tag](val t: T) extends Typed {
  def isPrimitive: Boolean = true
  def typeName: String = implicitly[PrimitiveTyped.Tag[T]].str
  def obj: Object = t.asInstanceOf[Object]
}

object PrimitiveTyped {
  case class Tag[T](str: String)

  implicit def _string = Tag[String]("String")
  implicit def _byte = Tag[Byte]("Byte")
  implicit def _byteArray = Tag[Array[Byte]]("ByteArray")
  implicit def _boolean = Tag[Boolean]("Boolean")
  implicit def _float = Tag[Float]("Float")
  implicit def _double = Tag[Double]("Double")
  implicit def _int = Tag[Int]("Int")
  implicit def _long = Tag[Long]("Long")
  implicit def _list[T] = Tag[Seq[Typed]]("List")
  implicit def _option = Tag[Option[Typed]]("Option")
}

case class UserTyped[T](val t: T, val typeName: String) extends Typed {
  def isPrimitive: Boolean = false
  def obj: Object = t.asInstanceOf[Object]
}

object UserTyped {
  case class Tag[T]()
}

object Typed {
  implicit def typedEncoder = new Encoder[Typed] {
    def encode(t: Typed, os: ArgumentOutputStream): Unit = _encode(t, os)
  }

  implicit def typedDecoder = new Decoder[Typed] {
    def decode(is: ArgumentInputStream): Typed = _decode(is)
  }

  private val primitiveEncoders = Map(
    "String" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asString)
      }
    },
    "ByteArray" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asByteArray)
      }
    },
    "Boolean" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asBoolean)
      }
    },
    "Float" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asFloat)
      }
    },
    "Double" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asDouble)
      }
    },
    "Int" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asInt)
      }
    },
    "Long" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asLong)
      }
    },
    "List" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asSeq)
      }
    },
    "Option" -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.asOption)
      }
    }
  )

  private val primitiveDecoders = Map(
    "String" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed =
        PrimitiveTyped(is.pop[String])
    },
    "ByteArray" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed =
        PrimitiveTyped(is.pop[Array[Byte]])
    },
    "Boolean" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed =
        PrimitiveTyped(is.pop[Boolean])
    },
    "Float" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed =
        PrimitiveTyped(is.pop[Float])
    },
    "Double" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed =
        PrimitiveTyped(is.pop[Double])
    },
    "Int" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed =
        PrimitiveTyped(is.pop[Int])
    },
    "Long" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed =
        PrimitiveTyped(is.pop[Long])
    },
    "List" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed = {
        PrimitiveTyped(is.pop[Seq[Typed]])
      }
    },
    "Option" -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed = {
        PrimitiveTyped(is.pop[Option[Typed]])
      }
    }
  )

  private val userTypeEncoders =
    scala.collection.mutable.Map[String, Encoder[Typed]]()
  private val userTypeDecoders =
    scala.collection.mutable.Map[String, Decoder[Typed]]()

  def registerUserType[T: ClassTag: Encoder: Decoder]: Unit =
    registerUserType[T](implicitly[ClassTag[T]].runtimeClass.getName())

  def registerUserType[T: ClassTag: Encoder: Decoder](
      typeName: String
  ): Unit = {
    userTypeEncoders.addOne(typeName -> new Encoder[Typed] {
      def encode(t: Typed, os: ArgumentOutputStream): Unit = {
        os.push(t.get[T])
      }
    })

    userTypeDecoders.addOne(typeName -> new Decoder[Typed] {
      def decode(is: ArgumentInputStream): Typed = {
        UserTyped[T](is.pop[T], typeName)
      }
    })
  }

  def encode(t: Typed, os: ArgumentOutputStream): Unit = {
    os.push(t.isPrimitive)
    os.push(t.typeName)

    if (t.isPrimitive)
      primitiveEncoders.get(t.typeName) match {
        case Some(value) => value.encode(t, os)
        case None =>
          throw new Exception(
            f"encode: typeName (${t.typeName}) not registered as a primitive type"
          )
      }
    else
      userTypeEncoders.get(t.typeName) match {
        case Some(value) => value.encode(t, os)
        case None =>
          throw new Exception(
            f"encode: typeName (${t.typeName}) not registered as a user type"
          )
      }
  }

  def decode(is: ArgumentInputStream): Typed = {
    val isPrimitive = is.pop[Boolean]
    val typeName = is.pop[String]

    if (isPrimitive)
      primitiveDecoders.get(typeName) match {
        case Some(value) => value.decode(is)
        case None =>
          throw new Exception(
            f"decode: typeName (${typeName}) not registered as a primitive type"
          )
      }
    else
      userTypeDecoders.get(typeName) match {
        case Some(value) => value.decode(is)
        case None =>
          throw new Exception(
            f"decode: typeName (${typeName}) not registered as a user type"
          )
      }
  }

  private def _encode(t: Typed, os: ArgumentOutputStream): Unit = encode(t, os)
  private def _decode(is: ArgumentInputStream) = decode(is)
}

trait ED_Typed {
  implicit def typedEncoder = Typed.typedEncoder
  implicit def typedDecoder = Typed.typedDecoder
}
