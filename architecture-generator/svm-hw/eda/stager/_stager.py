from typing import Dict, Iterator, Any, List, Union
from pathlib import Path


class StageManager:
    def __init__(self, cfg: Dict[str, Any] = {}) -> None:
        self._cfg: Dict[str, Any] = cfg
        self._stages: Dict["Task", "Stage"] = {}

    @property
    def config(self) -> Dict[str, Any]:
        """Configuration."""
        return self._cfg

    @property
    def stages(self) -> Dict[str, "Stage"]:
        return self._stages


class Stage:
    def __init__(self, stageman: StageManager, task: "Task") -> None:
        self._stageman = stageman
        self._task = task
        self._prepared = False
        self._executed = False
        self._dependencies: List["Stage"] = []
        self._children = []

    def _checkexecuted(self, file: Union[Path, str]) -> None:
        if Path(file).exists():
            if not self.stageman.config.get("doClean", False):
                self._executed = True
                self._prepared = True

    @property
    def stageman(self) -> StageManager:
        """Associated stage manager."""
        return self._stageman

    @property
    def task(self) -> "Task":
        """The task corresponding to this stage."""
        return self._task

    @property
    def prepared(self) -> bool:
        """`True` if the stage is prepared."""
        return self._prepared

    @property
    def executed(self) -> bool:
        """`True` if the stage is executed."""
        return self._executed

    def clean(self) -> None:
        """Cleans the stage."""
        self._prepared = False
        self._executed = False

    def prepare(self) -> None:
        """Prepares the stage."""
        self.clean()
        self._prepared = True

    def execute(self) -> None:
        """Executes the stage. Prepares if necessary."""
        if not self.prepared:
            self.prepare()

        self._executed = True

    @property
    def executable(self) -> None:
        """`True` if all the dependencies are executed."""
        return all(x.executed for x in self.dependencies)

    def depends(self, parent: "Stage") -> "Stage":
        """Register a dependency."""
        parent._children.append(self)
        self._dependencies.append(parent)
        return self

    @property
    def dependencies(self) -> List["Stage"]:
        return self._dependencies

    def children(self) -> Iterator["Stage"]:
        """Stages that depend on this stage."""
        return iter(self._children)

    @staticmethod
    def factory(function):
        """Marks a method as Stage factory."""

        def wrap(self, stageman: StageManager):
            if stage := stageman.stages.get(self):
                return stage
            else:
                stage = function(self, stageman)
                stageman.stages[self] = stage
                return stage
        return wrap

    def run(self, numworkers) -> None:
        pass


class Task:
    @Stage.factory
    def stage(self, stageman: StageManager) -> Stage:
        """Creates a `Stage` from this `Task`."""
        return Stage(stageman)


def main():
    t = Task()
    sman = StageManager()
    print(id(t.stage(sman)))
    print(id(t.stage(sman)))
    print(id(t.stage(sman)))


if __name__ == "__main__":
    main()
