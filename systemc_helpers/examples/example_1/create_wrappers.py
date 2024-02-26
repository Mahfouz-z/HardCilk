# you should install the python package first
# cd into the python directory, run the following command:
# python3 -m pip install -e .

from systemc_helpers import *

def main() -> None:
    module = Module("SimpleMemoryMappedDevice")
    module.new_interface("SAXIL", is_slave=True, config=Axi4liteConfig(32, 32))
    module.write_systemc_wrapper()

if __name__ == "__main__":
    main()
