from dataclasses import dataclass
from typing import Tuple, Any, List
from strenc import *

@dataclass
class Address:
    typ: str = "Home"
    line1: str = "<line1>"
    line2: str = "<line2>"

register_dataclass(Address)

@dataclass
class Student:
    name: str
    surname: str
    age: int
    height: int
    grades: Tuple[int, int, int]
    specialStatus: Optional[str]
    flags: List[str]
    address: Address

register_dataclass(Student)

@dataclass
class Rectangle:
    dim1: int
    dim2: int

    def area(self) -> int:
        return self.dim1 * self.dim2

register_dataclass(Rectangle)

@dataclass
class Square:
    dim: int

    def area(self) -> int:
        return self.dim * self.dim

register_dataclass(Square)

def verify(obj: object, type: Any) -> None:
    print(f"Object: {obj}")
    print(f"Encoding: {encodebytes(obj)}\n")
    assert decodebytes(encodebytes(obj), type) == obj

def verifyTyped(obj: Typed) -> None:
    print(f"Object: {obj}")
    print(f"Encoding: {encodebytes(obj)}\n")
    assert decodebytes(encodebytes(obj), Typed) == obj


def main() -> None:
    student1 = Student(
        "Canberk",
        "Sönmez",
        25,
        180,
        (4, 4, 6),
        "CS",
        ["student", "assistant"],
        Address("home", "ch de geneve", "suisse")
    )

    student2 = Student(
        "Berkcan",
        "Mezson",
        23,
        173,
        (4, 4, 5),
        "EE",
        [ "student", "assistant" ],
        Address("home", "ch de lausanne", "suisse")
    )

    square = Square(4)
    rectangle = Rectangle(2, 4)


    verify(student1, Student)

    verifyTyped(typed("Canberk"))
    verifyTyped(typed(b"Canberk"))
    verifyTyped(typed("Canberk", Optional[str]))
    verifyTyped(typed(None, Optional[Any]))
    verifyTyped(typed([student1, student2], List[Student]))
    verifyTyped(typed(student1))

    squaredecoded: Typed = decodebytes(encodebytes(typed(square)), Typed)
    rectangledecoded: Typed = decodebytes(encodebytes(typed(rectangle)), Typed)
    assert squaredecoded.obj.area() == 16
    assert rectangledecoded.obj.area() == 8

    verify([typed(rectangle), typed(square)], List[Typed])

if __name__ == "__main__":
    main()
