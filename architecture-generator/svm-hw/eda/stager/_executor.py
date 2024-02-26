import threading
import queue
from ._stager import StageManager, Stage, Task
from typing import List, MutableSet
from dataclasses import dataclass
import traceback
import io


@dataclass(frozen=False)
class _Request:
    stage: Stage
    stop: bool = False


@dataclass(frozen=False)
class _Response:
    stage: Stage
    exception: Exception = None
    traceback: str = None

    @property
    def success(self) -> bool:
        return self.exception is None


class StageExecutor:
    def __init__(self, stageman: StageManager, numworkers: int = 8) -> None:
        self._stageman = stageman
        self._numworkers: int = numworkers
        self._threads: List[threading.Thread] = \
            [threading.Thread(target=self._threadfn)
             for _ in range(numworkers)]
        self._taskqueue = queue.Queue()
        self._responsequeue = queue.Queue()
        self._scheduled: MutableSet[Stage] = set()

        for thread in self._threads:
            thread.start()

    def _threadfn(self) -> None:
        while task := self._taskqueue.get():
            task: _Request

            if task.stop:
                return
            else:
                stage = task.stage

                try:
                    stage.execute()
                    self._responsequeue.put(_Response(stage))
                except Exception as ex:
                    errors = io.StringIO()
                    traceback.print_exc(file=errors)
                    stage._executed = True  # stop in case of a problem
                    self._responsequeue.put(_Response(stage, ex, errors.getvalue()))
                    errors.close()

    def _dispatch(self) -> None:
        for _, stage in self.stageman.stages.items():
            if not stage.executed and stage.executable:
                if stage not in self._scheduled:
                    self._scheduled.add(stage)
                    self._taskqueue.put(_Request(stage))
        return len(self._scheduled) > 0

    @property
    def stageman(self) -> StageManager:
        return self._stageman

    @property
    def numworkers(self) -> int:
        return self._numworkers

    def run(self) -> None:
        while self._dispatch():
            response: _Response = self._responsequeue.get()
            self._scheduled.remove(response.stage)
            if not response.success:
                print(f"returned a response with exception: stage={response.stage}, exception={response.exception}")
                print(response.traceback)

    def close(self) -> None:
        for _ in range(self.numworkers):
            self._taskqueue.put(_Request(None, True))

    def __enter__(self) -> "StageExecutor":
        return self

    def __exit__(self, exc_type, exc_value, tb) -> bool:
        self.close()

        if exc_type is not None:
            traceback.print_exception(exc_type, exc_value, tb)
            return False
        return True
