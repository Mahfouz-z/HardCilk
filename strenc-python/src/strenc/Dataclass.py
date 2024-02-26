import dataclasses as dc

from .ArgumentInputStream import decoder, ArgumentInputStream
from .ArgumentOutputStream import encoder, ArgumentOutputStream


def register_dataclass(t: type):
    assert isinstance(t, type)
    assert dc.is_dataclass(t)

    @encoder(t)
    def _(obj, output: ArgumentOutputStream) -> None:
        for field in dc.fields(t):
            output.push(getattr(obj, field.name), field.type)

    @decoder(t)
    def _(input: ArgumentInputStream) -> None:
        d = {}
        for field in dc.fields(t):
            d[field.name] = input.pop(field.type)
        return t(**d)

    return t
