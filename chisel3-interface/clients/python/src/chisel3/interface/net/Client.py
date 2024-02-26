from .. import ServerHandler
import socket
import io
from strenc import ArgumentInputStream, ArgumentOutputStream


class _ServerHandler(ServerHandler):
    def __init__(self, sock: socket.socket) -> None:
        self._sock = sock
        requests = ArgumentOutputStream(sock.makefile("wb", buffering=0))
        responses = ArgumentInputStream(
            io.BufferedReader(
                sock.makefile("rb", buffering=0), buffer_size=1),
            peeklen=1)
        super().__init__(requests, responses)

    def close(self) -> None:
        super().close()  # closes the streams
        self._sock.close()


def connect(address: str, portnumber: int) -> ServerHandler:
    sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
    sock.connect((address, portnumber))
    return _ServerHandler(sock)
