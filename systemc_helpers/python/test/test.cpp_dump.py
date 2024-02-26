import cpp_dump
import dataclasses
from typing import *


@dataclasses.dataclass
class Student:
    name: str
    id: int
    grades: Dict[str, float] = cpp_dump.Config(
        floatFormat="{:.5f}f",
        floatType="float",
        mapFormat="std::unordered_map<{}, {}>"
    ).field()
    secret_codes: List[int] = cpp_dump.Config(
        intFormat="0x{:08x}u",
        intType="unsigned",
        listFormat="std::list<{}>"
    ).field()


@dataclasses.dataclass
class School:
    name: str
    location: str
    students: List[Student] = dataclasses.field(default_factory=lambda: [])


def main() -> None:
    school = School(
        name="School of Cloud 9",
        location="Cloud 9",
        students=[
            Student(
                name="John",
                id=987,
                grades={
                    "CS-100": 3.78,
                    "CS-230": 3.45
                },
                secret_codes=[0xDEADBEEF]
            ),
            Student(
                name="George",
                id=189,
                grades={
                    "CS-456": 3.23,
                    "CS-222": 3.10
                },
                secret_codes=[0xBEEFBEEF]
            )
        ]
    )

    dump = cpp_dump.Dumper()
    print(dump(school))


if __name__ == "__main__":
    main()
