class Dumper:
    def __init__(self, indentstr="    ") -> None:
        self._indentstr = indentstr
        self._num_indent = 0
        self._buffer = []

    def indent_in(self) -> None:
        self._num_indent += 1

    def indent_out(self) -> None:
        assert self._num_indent > 0
        self._num_indent -= 1

    def indent(self) -> None:
        self.write(self._indentstr * self._num_indent)

    def writeln(self, ln="") -> None:
        self.write(f"{ln}\n")

    def write(self, ln) -> None:
        self._buffer.append(ln)

    def unwrite(self) -> None:
        assert len(self._buffer) > 0
        self._buffer.pop()

    def generate(self) -> str:
        return "".join(self._buffer)
