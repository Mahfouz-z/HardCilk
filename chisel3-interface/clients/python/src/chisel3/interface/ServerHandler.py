import traceback
from strenc import ArgumentOutputStream, ArgumentInputStream, typed, Typed
from typing import Optional, List, Any, Union
from pathlib import Path
from .Messages import Request, Response


class ServerHandler:
    def __init__(
            self,
            requests: ArgumentOutputStream,
            responses: ArgumentInputStream) -> None:
        self._requests = requests
        self._responses = responses
        self._lastTask = 0

    def _nexttaskname(self, taskname: Optional[str] = None) -> str:
        res = f"Task{self._lastTask}"
        self._lastTask += 1
        return res if taskname is None else taskname

    def _emit(
            self,
            taskname: Optional[str],
            taskcommand: str,
            options: List[str],
            module: Any,
            targetdir: Optional[Union[Path, str]] = None) -> Optional[Typed]:
        assert taskname is None or isinstance(taskname, str)
        assert isinstance(options, list)
        assert all([isinstance(option, str) for option in options])

        if targetdir is None:
            targetdir = Path(".")
        elif isinstance(targetdir, str):
            targetdir = Path(targetdir)

        taskname = self._nexttaskname(taskname)

        self._requests.push(Request(taskname, taskcommand))
        self._requests.push(
            options + ["--target-dir", str(targetdir.absolute())])
        self._requests.push(typed(module))
        res: Response = self._responses.pop(Response)
        if not res.success:
            raise Exception(
                f"ServerHandler._emit failed: {res.errorMsg} (taskname = {taskname})")

        return self._responses.pop(Optional[Typed])

    def _stop(self) -> None:
        self._requests.push(Request(self._nexttaskname(), "stop"))

    def emitverilog(
            self,
            module: Any, options: List[str] = [],
            taskname=None,
            targetdir: Optional[Union[Path, str]] = None) -> Optional[Typed]:
        return self._emit(taskname, "emitVerilog", options, module, targetdir)

    def emitsystemverilog(
            self,
            module: Any, options: List[str] = [],
            taskname=None,
            targetdir: Optional[Union[Path, str]] = None) -> Optional[Typed]:
        return self._emit(taskname, "emitSystemVerilog", options, module, targetdir)

    def emitfirrtl(
            self,
            module: Any, options: List[str] = [],
            taskname=None,
            targetdir: Optional[Union[Path, str]] = None) -> Optional[Typed]:
        return self._emit(taskname, "emitFirrtl", options, module, targetdir)

    def emitchirrtl(
            self,
            module: Any, options: List[str],
            taskname=None,
            targetdir: Optional[Union[Path, str]] = None) -> Optional[Typed]:
        return self._emit(taskname, "emitChirrtl", options, module, targetdir)

    def __enter__(self) -> "ServerHandler":
        return self

    def __exit__(self, exc_type, exc_value, tb) -> bool:
        self.close()

        if exc_type is not None:
            traceback.print_exception(exc_type, exc_value, tb)
            return False
        return True

    def close(self) -> None:
        self._stop()
        self._requests.close()
        self._responses.close()
