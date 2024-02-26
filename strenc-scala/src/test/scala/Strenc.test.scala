package strenc

import EncodersDecoders._
import Literals._

import org.scalatest.flatspec.AnyFlatSpec
import java.nio.charset.StandardCharsets

case class Address(
    val typ: String = "Home",
    val line1: String = "<line1>",
    val line2: String = "<line2>"
)

object Address extends UserTypeCompanion[Address] {
  def encode(t: Address, os: ArgumentOutputStream): Unit = {
    os.push(t.typ)
    os.push(t.line1)
    os.push(t.line2)
  }

  def decode(is: ArgumentInputStream): Address = {
    Address(
      is.pop[String],
      is.pop[String],
      is.pop[String]
    )
  }
}

case class Student(
    val name: String,
    val surname: String,
    val age: Int,
    val height: Int,
    val grades: (Int, Int, Int),
    val specialStatus: Option[String],
    val flags: Seq[String],
    val address: Address
)

trait Shape {
  def area: Int
}

object Shape extends UserTypeCompanion[Shape] {
  def encode(t: Shape, os: ArgumentOutputStream): Unit = {
    ???
  }

  def decode(is: ArgumentInputStream): Shape = {
    ???
  }
}

case class Square(val dim: Int) extends Shape {
  def area: Int = dim * dim
}

object Square extends UserTypeCompanion[Square] {
  def encode(t: Square, os: ArgumentOutputStream): Unit = {
    os.push(t.dim)
  }

  def decode(is: ArgumentInputStream): Square = {
    Square(is.pop[Int])
  }
}

case class Rectangle(val dim1: Int, val dim2: Int) extends Shape {
  def area: Int = dim1 * dim2
}

object Rectangle extends UserTypeCompanion[Rectangle] {
  def encode(t: Rectangle, os: ArgumentOutputStream): Unit = {
    os.push(t.dim1)
    os.push(t.dim2)
  }

  def decode(is: ArgumentInputStream): Rectangle = {
    Rectangle(is.pop[Int], is.pop[Int])
  }
}

case class ShapeCollection(
    val name: String = "collection1",
    val shapes: Seq[Typed] = Seq()
)

object ShapeCollection extends UserTypeCompanion[ShapeCollection] {
  def encode(t: ShapeCollection, os: ArgumentOutputStream): Unit = {
    os.push(t.name)
    os.push(t.shapes)
  }

  def decode(is: ArgumentInputStream): ShapeCollection = {
    ShapeCollection(is.pop[String], is.pop[Seq[Typed]])
  }
}

object Student extends UserTypeCompanion[Student] {
  def encode(s: Student, os: ArgumentOutputStream): Unit = {
    os.push(s.name)
    os.push(s.surname)
    os.push(s.age)
    os.push(s.height)
    os.push(s.grades)
    os.push(s.specialStatus)
    os.push(s.flags)
    os.push(s.address)
  }

  def decode(is: ArgumentInputStream): Student = {
    Student(
      is.pop[String],
      is.pop[String],
      is.pop[Int],
      is.pop[Int],
      is.pop[(Int, Int, Int)],
      is.pop[Option[String]],
      is.pop[Seq[String]],
      is.pop[Address]
    )
  }
}

class StrencFlatSpec extends AnyFlatSpec {
  implicit class toStringForByteArray(byteArray: Array[Byte]) {
    def asString = new String(byteArray, StandardCharsets.UTF_8)
  }

  def verify[T: Encoder: Decoder](t: T) = {
    println(f"Object: ${t}")
    println(f"Encoding: ${encode(t).asString}\n")
    val decoded = decode[T](encode(t))
    assert(decoded == t)
  }

  def verifyTyped(typed: Typed) = {
    println(f"Object: ${typed}")
    println(f"Encoding: ${encode(typed).asString}\n")
    val decoded = decode[Typed](encode(typed))

    assert(decoded.isPrimitive == typed.isPrimitive)
    assert(decoded.typeName == typed.typeName)

    if (decoded.isByteArray) {
      assert(decoded.get[Array[Byte]].sameElements(typed.get[Array[Byte]]))
    } else {
      assert(decoded.get[Object].equals(typed.get[Object]))
    }
  }

  // for runtime type information
  Typed.registerUserType[Student]
  Typed.registerUserType[Shape]
  Typed.registerUserType[Square]
  Typed.registerUserType[Rectangle]
  Typed.registerUserType[ShapeCollection]

  val student1 = Student(
    "Canberk",
    "Sönmez",
    25,
    180,
    (4, 4, 6),
    Some("CS"),
    Seq("student", "assistant"),
    Address("home", "ch de geneve", "suisse")
  )

  val student2 = Student(
    "Berkcan",
    "Mezson",
    23,
    173,
    (4, 4, 5),
    Some("EE"),
    Seq("student", "assistant"),
    Address("home", "ch de lausanne", "suisse")
  )

  val square = Square(4)
  val rectangle = Rectangle(2, 4)

  it should "perform static conversions" in {
    verify(student1)
  }

  it should "perform dynamic conversions" in {
    verifyTyped("Canberk".typed)
    verifyTyped("Canberk".getBytes(StandardCharsets.UTF_8).typed)
    verifyTyped(Option("Canberk".typed).typed)
    verifyTyped(Option.empty[Typed].typed)
    verifyTyped(Seq(student1.typed, student2.typed).typed)
    verifyTyped(student1.typed)
  }

  it should "play nicely with polymorphism" in {
    val squareTyped = decode[Typed](encode(square.typed))
    val rectangleTyped = decode[Typed](encode(rectangle.typed))

    assert(squareTyped.get[Shape].area == 16)
    assert(rectangleTyped.get[Shape].area == 8)
  }

  it should "static and dynamic types should play nicely" in {
    val collection =
      ShapeCollection(shapes = Seq(Rectangle(2, 8).typed, Square(4).typed))

    verifyTyped(collection.typed)
  }
}
