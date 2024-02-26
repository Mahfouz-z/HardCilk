# you should install the python package first
# cd into the python directory, run the following command:
# python3 -m pip install -e .

from systemc_helpers import *

def main() -> None:
    module = Module("DMA_Wrapped")
    module.new_interface("S_AXI", is_slave=True, config=Axi4liteConfig(7, 64))
    module.new_interface("M_AXI", is_slave=False, config=Axi4liteConfig(32, 64))
    module.write_systemc_wrapper()

if __name__ == "__main__":
    main()
