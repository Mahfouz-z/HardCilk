import matplotlib.lines as mp_lines
from matplotlib.figure import Figure
from matplotlib.axes import Axes
from matplotlib import pyplot as plt
import pprint
import dataclasses
from typing import *
import re

REGEX_BLOCK = r'^(\s+).*?\[\s*BLOCK\s+([^\]\s]+)\s*\]'
REGEX_END_BLOCK = r'^(\s+).*?\[\s*END_BLOCK\s*\]'


class LineProcessor:
    """A simple utility class to match and replace blocks of strings.

    Raises:
        IndexError: In case a block is not found during replacement.
    """

    STATE_NONE = 0
    STATE_COPY = 1
    STATE_SKIP = 2

    def __init__(self) -> None:
        self._result: List[str] = None  # type: ignore
        self._state: int = LineProcessor.STATE_NONE
        self._blocks: Dict[str, str] = {}

    def process(self, s: str) -> str:
        self._result: List[str] = []
        self._state = LineProcessor.STATE_COPY

        for line in s.splitlines():
            self._process_line(line)

        result = "\n".join(self._result)

        del self._result
        self._result = None
        self._state: int = LineProcessor.STATE_NONE

        return result

    @property
    def blocks(self) -> Dict[str, str]:
        """Replacement blocks. A dictionary from block ID to new block.

        Returns:
            Dict[str, str]: Write to this dictionary.
        """
        return self._blocks

    def _process_line(self, line) -> bool:
        assert self._state != LineProcessor.STATE_NONE

        if self._state == LineProcessor.STATE_COPY:
            m = re.match(REGEX_BLOCK, line)
            if m is not None:
                self._state = LineProcessor.STATE_SKIP

                ws = m.groups()[0]
                block_id = m.groups()[1]

                if block_id not in self.blocks:
                    raise IndexError(f"Block ID '{block_id}' is not found!")

                for new_line in self.blocks[block_id].splitlines():
                    self._result.append(ws + new_line)

            else:
                self._result.append(line)

        elif self._state == LineProcessor.STATE_SKIP:
            m = re.match(REGEX_END_BLOCK, line)

            if m is not None:
                self._state = LineProcessor.STATE_COPY


@dataclasses.dataclass
class Entry:
    name: str = ""
    values: Dict[str, Any] = dataclasses.field(default_factory=dict)
    subEntries: Dict[str, "Entry"] = dataclasses.field(default_factory=dict)
    parent: Optional["Entry"] = None
    table: Optional["Entry"] = None


@dataclasses.dataclass
class Table:
    name: str = ""
    headers: List[str] = dataclasses.field(default_factory=list)
    entries: Dict[str, Entry] = dataclasses.field(default_factory=dict)
    report: Optional["Report"] = None


@dataclasses.dataclass
class Report:
    tables: Dict[str, Table] = dataclasses.field(default_factory=dict)
    metadata: Dict[str, str] = dataclasses.field(default_factory=dict)


def entryFromPath(table: Table, *path: str) -> Optional[Entry]:
    if len(path) == 0:
        return None

    current = table.entries[path[0]]

    for x in path[1:]:
        current = current.subEntries[x]

    return current


REGEX_METADATA = r"^\| ([\w ]+) : (.*)$"
REGEX_ROW_LEVEL = r"^ ((?:  )*)\S"


class UtilizationReportParser:
    def __init__(self) -> None:
        self._lines: List[str]
        self._line_idx: int

    def parse(self, rpt: str) -> Report:
        report = Report()

        self._lines = rpt.splitlines()
        self._line_idx = 0

        # skip copyright
        self._next()

        # parse metadata
        report.metadata = self._parse_metadata()

        # skip directly to TOC
        self._next(3)

        toc = self._parse_toc()

        self._next()

        for section_name in toc:
            self._parse_section(section_name)

            table = self._parse_table()
            table.name = section_name
            table.report = report

            report.tables[section_name] = table

        return report

    @property
    def _current(self) -> str:
        if self._line_idx >= len(self._lines):
            raise RuntimeError("Input consumed already!")

        return self._lines[self._line_idx]

    def _next(self, n=1) -> None:
        self._line_idx += n

    def _parse_metadata(self) -> None:
        result: Dict[str, str] = {}

        assert self._current.startswith("----")
        self._next()

        while self._current.startswith("|"):
            m = re.match(REGEX_METADATA, self._current)
            assert m is not None

            key = m.groups()[0].strip()
            value = m.groups()[1].strip()

            result[key] = value

            self._next()

        assert self._current.startswith("----")
        self._next()

        return result

    def _parse_toc(self) -> None:
        result: List[str] = []

        assert self._current == "Table of Contents"
        self._next()

        assert self._current.startswith("----")
        self._next()

        while self._current:
            result.append(self._current)
            self._next()

        return result

    def _parse_section(self, section_name) -> None:
        """
        Skips to the section with the given name.
        """

        while self._current != section_name:
            self._next()

        self._next()

    def _parse_table(self) -> Table:
        def parse_header() -> List[str]:
            header = [x.strip() for x in self._current.split("|")]
            del header[0]
            del header[-1]

            self._next()

            return header

        def parse_row() -> Tuple[int, str, List[str]]:
            row = [x for x in self._current.split("|")]
            del row[0]
            del row[-1]

            m = re.match(REGEX_ROW_LEVEL, row[0])
            assert m is not None

            level = len(m.groups()[0]) // 2

            name = row[0].strip()
            values = [x.strip() for x in row]

            self._next()

            return (level, name, values)

        table = Table()

        # find the table
        while not self._current.startswith("+----"):
            self._next()

        self._next()
        table.headers = parse_header()
        self._next()

        last_entry: Entry = None  # type: ignore
        last_level: int = 0

        parsed_any: bool = False

        while self._current.startswith("|"):
            parsed_any = True

            level, name, values = parse_row()

            entry = Entry()
            entry.name = name

            for key, value in zip(table.headers, values):
                entry.values[key] = value

            if level > last_level:
                assert level == last_level + 1
                assert last_entry

                last_entry.subEntries[name] = entry
                entry.parent = last_entry

            else:
                while last_level > level:
                    last_entry = last_entry.parent
                    last_level -= 1

                # last_level == level

                if last_entry and last_entry.parent:
                    last_entry.parent.subEntries[name] = entry
                    entry.parent = last_entry.parent

                if not last_entry:
                    assert level == 0

            last_entry = entry
            last_level = level

            entry.table = table

            if level == 0:
                table.entries[name] = entry

        if parsed_any:
            assert self._current.startswith("+----")
            self._next()

        return table


@dataclasses.dataclass(frozen=True)
class Utilization:
    lut: int
    ff: int
    bram: int

    lut_percent: float
    ff_percent: float
    bram_percent: float


class Utilizations:
    def __init__(self, peCount_v: Iterable[int], format_str: str = "hdl_{}_1_1_2") -> None:
        self._line_processor = LineProcessor()
        self._peCount_v = list(peCount_v)
        self._reports: Dict[str, Report] = {}
        self._format_str = format_str

        self._available: Utilization = None
        self._component_util: Dict[str, Utilization] = {}
        self._system_util: Dict[int, Utilization] = {}

        assert len(self._peCount_v) > 0

        self._process_available()
        self._process_components()

        for peCount in self._peCount_v:
            self._process_peCount(peCount)

    @property
    def component_util(self) -> Dict[str, Utilization]:
        return self._component_util

    @property
    def system_util(self) -> Dict[int, Utilization]:
        """
        Maps from peCount to utilization.
        """
        return self._system_util

    @property
    def available(self) -> Utilization:
        return self._available

    @property
    def reports(self) -> Dict[str, Report]:
        return self._reports

    @property
    def peCount_v(self) -> List[int]:
        return self._peCount_v

    def _process_available(self):
        format_str = self._format_str
        peCount_v = self._peCount_v

        parser = UtilizationReportParser()

        for peCount in peCount_v:
            with open(f"vivado_workdir/{format_str.format(peCount)}/utilization_hier.post_pr.txt") as f:
                self._reports[peCount] = parser.parse(f.read())

        with open(f"vivado_workdir/{format_str.format(peCount_v[0])}/utilization.post_pr.txt") as f:
            report = parser.parse(f.read())

            table1 = report.tables["1. CLB Logic"]
            table2 = report.tables["3. BLOCKRAM"]

            self._available = Utilization(
                int(table1.entries["CLB LUTs"].values["Available"]),
                int(table1.entries["CLB Registers"].values["Available"]),
                int(table2.entries["Block RAM Tile"].values["Available"]),
                100.0,
                100.0,
                100.0
            )

    def _process_components(self) -> None:
        import math

        lut_total = self._available.lut
        ff_total = self._available.ff
        bram_total = self._available.bram

        def add_component(name: str, e: Entry, factor: Optional[float] = None) -> None:
            lut = int(e.values["Total LUTs"])
            ff = int(e.values["FFs"])

            bram = 0
            bram += int(e.values["RAMB36"])
            bram += int(e.values["RAMB18"])

            if factor is not None:
                assert factor <= 1.00
                lut = math.ceil(lut * factor)
                ff = math.ceil(ff * factor)
                bram = math.ceil(bram * factor)

            self._component_util[name] = Utilization(
                lut, ff, bram,
                lut / lut_total * 100, ff / ff_total * 100, bram / bram_total * 100
            )

        peCount = self._peCount_v[0]
        rpt = self._reports[peCount]
        util_table = rpt.tables["1. Utilization by Hierarchy"]

        e1 = entryFromPath(
            # , "casServers_0"
            util_table, "fullSysGen", "continuationAllocationSide", "continuationNetwork"
        )
        assert e1 is not None
        add_component("AllocC. + buf.", e1, 1/peCount)

        e2 = entryFromPath(
            util_table, "fullSysGen", "continuationAllocationSide", "vcas_0"
        )
        assert e2 is not None
        add_component("AllocS.", e2)

        e3 = entryFromPath(
            util_table, "fullSysGen", "stealSide", "stealNW_TQ"  # , "stealServers_0"
        )
        assert e3 is not None
        add_component("SchC. + q.", e3, 1/peCount)

        e4 = entryFromPath(
            util_table, "fullSysGen", "stealSide", "virtualStealServers_0"
        )
        assert e4 is not None
        add_component("SchS.", e4)

        e5 = entryFromPath(
            util_table, "fullSysGen", "syncSide", "argSide"
        )
        assert e5 is not None
        add_component("ArgC. + buf.", e5, 1/peCount)

        e6 = entryFromPath(
            util_table, "fullSysGen", "syncSide", "argRouteServers_0"
        )
        assert e6 is not None
        add_component("ArgS.", e6, 1)

    def _process_peCount(self, peCount: int) -> None:
        lut_total = self._available.lut
        ff_total = self._available.ff
        bram_total = self._available.bram

        table = self._reports[peCount].tables["1. Utilization by Hierarchy"]
        e = table.entries["fullSysGen"]

        lut = int(e.values["Total LUTs"])
        ff = int(e.values["FFs"])

        bram = 0
        bram += int(e.values["RAMB36"])
        bram += int(e.values["RAMB18"])

        self._system_util[peCount] = Utilization(
            lut, ff, bram,
            lut / lut_total * 100, ff / ff_total * 100, bram / bram_total * 100
        )


class LatexUtilizationTable:
    def __init__(self, utilizations: Utilizations) -> None:
        self._utilizations = utilizations
        self._line_processor = LineProcessor()
        self._lines: List[str] = []

        self._result = self._generate()

    @property
    def result(self) -> str:
        return self._result

    def _add_hline(self) -> None:
        self._lines.append("\\hline")

    def _add_item(self, name: str, utilization: Utilization) -> None:
        l = [
            name,
            f"{utilization.lut:,}",
            f"{utilization.lut_percent:.2f}\\%",
            f"{utilization.ff:,}",
            f"{utilization.ff_percent:.2f}\\%",
            f"{utilization.bram:,}",
            f"{utilization.bram_percent:.2f}\\%",
        ]

        self._lines.append(" & ".join(l) + "\\\\")

    def _process_available(self) -> None:
        self._add_item("Avail.", self._utilizations.available)

    def _process_components(self) -> None:
        for name, util in self._utilizations.component_util.items():
            self._add_item(name, util)

    def _process_peCounts(self) -> None:
        for peCount, util in self._utilizations.system_util.items():
            self._add_item(f"{peCount} PEs", util)

    def _generate(self) -> str:
        generator = LineProcessor()

        self._process_available()
        self._add_hline()

        self._process_components()
        self._add_hline()

        self._process_peCounts()

        generator.blocks["repl"] = "\n".join(self._lines)

        with open("table.tex") as f:
            return generator.process(f.read())


def plot_bars(
        axes: Axes,
        series: Iterable[str],
        x: Iterable[str],
        y: Iterable[List[float]],
        x_width: float = 1.0,
        bar_width: float = 1.0,
        **kwargs) -> None:

    import numpy as np

    y_v: List[float] = list(zip(*y))
    x = list(x)
    x_ = np.arange(len(x))

    c0 = 1.0 / (len(x))
    c1 = 1.0 / (len(x)) * x_width / (len(y_v))
    c2 = 1.0 / (len(x)) * x_width / (len(y_v)) * bar_width

    offset = (1.0 - x_width) * c0 / 2.0 + (1.0 - bar_width) * c1 / 2.0

    for idx, y in enumerate(y_v):
        xx = x_ * c0 + idx * c1 + offset
        axes.bar(xx, y, width=c2, align="edge", label=series[idx], **kwargs)

    axes.set_xlim([0.0, 1.0])

    axes.set_xticks(x_ / len(x) + c0 / 2.0)
    axes.set_xticklabels(x)


def utilization_figure(utilizations: Utilizations) -> None:
    figure: Figure = plt.figure(figsize=(5,3))
    axes: Axes = figure.add_axes([0.1, 0.2, 0.8, 0.7])

    baseline_peCount = utilizations.peCount_v[0]
    baseline_util = utilizations.system_util[baseline_peCount]

    normalized_utilizations: List[Tuple[float, float, float]] = []

    for peCount in utilizations.peCount_v:
        utilization = utilizations.system_util[peCount]
        normalized_utilizations.append((
            utilization.lut / baseline_util.lut,
            utilization.ff / baseline_util.ff,
            utilization.bram / baseline_util.bram,
        ))

    plot_bars(
        axes,
        ["LUT", "FF", "BRAM"],
        list(map(str, utilizations.peCount_v)),
        normalized_utilizations,
        x_width=0.8,
        bar_width=0.9,
        zorder=3,
        edgecolor='black'
    )

    axes.semilogy(base=2)
    axes.grid(linestyle="--", axis="y")

    y_ticks = list(map(lambda x: 2 ** x, range(5)))
    axes.set_yticks(y_ticks)
    axes.set_yticklabels(map(str, y_ticks))

    axes.set_xlabel("Number of PEs")
    axes.set_ylabel("Normalized Resource Utilization")

    axes.legend()

    figure.savefig("figure_util_rel.pdf")


if __name__ == "__main__":
    utilizations = Utilizations([8, 16, 32, 64, 128])
    latexUtilizationTable = LatexUtilizationTable(utilizations)
    print(latexUtilizationTable.result)
    utilization_figure(utilizations)
