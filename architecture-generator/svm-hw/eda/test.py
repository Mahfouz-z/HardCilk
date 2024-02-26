from stager import *
from dataclasses import dataclass
import time
import random
from tasks import ChiselCodegen
from modules import axi4
from fsobj import *

def main():
    objectstore = ObjectStore("./artifacts")
    stageman = StageManager(cfg={
        "rootNode": objectstore.frompath("root"),
        "chiselServer": {
            "address": "127.0.0.1",
            "portnumber": 9100
        }
    })

    ChiselCodegen(axi4.tlb.Translator(8, 10, axi4.Config()), "Translator").stage(stageman)

    with StageExecutor(stageman) as exec:
        exec.run()

def main1():
    class DummyStage(Stage):
        def __init__(self, stageman: StageManager, task: "Task") -> None:
            super().__init__(stageman, task)
        
        def execute(self) -> None:
            time.sleep(random.random() * 0.5)
            if len(self._dependencies) > 0:
                assert(self._dependencies[0].executed)
            print(f"Executed: {self.task}", flush=True)
            return super().execute()

    @dataclass(frozen=True)
    class TestTask1(Task):
        name: str

        @Stage.factory
        def stage(self, stageman: StageManager) -> Stage:
            return DummyStage(stageman, self)

    @dataclass(frozen=True)
    class TestTask2(Task):
        name: str

        @Stage.factory
        def stage(self, stageman: StageManager) -> Stage:
            task = TestTask1(self.name)
            s2 = DummyStage(stageman, self)
            s1 = task.stage(stageman)
            s2.depends(s1)
            return s2
    
    stageman = StageManager()
    TestTask2("taskA").stage(stageman)
    TestTask2("taskB").stage(stageman)
    TestTask2("taskC").stage(stageman)
    TestTask2("taskD").stage(stageman)

    with StageExecutor(stageman, 8) as executor:
        executor.run()

if __name__ == "__main__":
    main()

