import abc
import os
import functools
from pathlib import Path
from typing import Union

cache = functools.lru_cache(None)


class GlobalResourceManager:
    """
    A global cache for resources.
    """

    @cache
    def text(self, respath: str) -> str:
        with open(respath, "r") as f:
            return f.read()

    @cache
    def binary(self, respath: str) -> bytes:
        with open(respath, "rb") as f:
            return f.read()


_global_resource_manager = GlobalResourceManager()


class ResourcesBase(abc.ABC):
    @abc.abstractmethod
    def respath(self, resname: str) -> Path:
        pass

    @abc.abstractmethod
    def resdir(self) -> Path:
        pass

    def text(self, resname: str) -> str:
        return _global_resource_manager.text(self.respath(resname))

    def binary(self, resname: str) -> bytes:
        return _global_resource_manager.binary(self.respath(resname))


class Resources(ResourcesBase):
    """
    Resources relative to given directory.

    Usage:

        resources = Resources(__file__)

    """

    def __init__(self, directory: Union[str, Path]) -> None:
        self._dir = Path(directory)

    def respath(self, resname: Union[str, Path]) -> Path:
        return self._dir / resname

    def resdir(self) -> Path:
        return self._dir


def ModuleResources(file: str, subdirectory: str = "res") -> Resources:
    return Resources(Path(file).parent / subdirectory)
