from hardcilk.exp import BulkEntryBase, Context


class BulkEntry(BulkEntryBase):
    def __init__(self, context: Context = ..., resultsDir: str = "./results/") -> None:
        super().__init__(context, resultsDir)

        # add other experiments here...
        # self.addEntryExternal("paper_exp_dae/run_exp.py")

        self.addEntryExternal("paper_exp_dae_0/run_exp.py")
        self.addEntryExternal("paper_exp_dae_1/run_exp.py")
        self.addEntryExternal("paper_exp1/run_exp.py")
        self.addEntryExternal("paper_exp2/run_exp.py")
        self.addEntryExternal("paper_exp3/run_exp.py")


if __name__ == "__main__":
    import sys
    BulkEntry.main(sys.argv[1:])
