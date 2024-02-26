FIELD_SEPARATOR = b'!'
SUBFIELD_SEPARATOR = b'?'

PRIMITIVE_TYPES = {
    "str": str,
    "String": str,
    "bytes": bytes,
    "ByteArray": bytes,
    "bool": bool,
    "Boolean": bool,
    "float": float,
    "Float": float,
    "double": float,
    "Double": float,
    "int": int,
    "Int": int,
    "long": int,
    "Long": int
}

# append includes below
# autopep8: off

from typing import *
from .Dataclass import register_dataclass
from .ArgumentInputStream import ArgumentInputStream, decoder, decodebytes
from .ArgumentOutputStream import ArgumentOutputStream, encoder, encodebytes
from .Typed import typed, Typed

# autopep8: on
