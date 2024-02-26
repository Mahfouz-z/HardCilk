from systemc_helpers import *


def main():
    module = Module("test", "VTest")
    module.new_interface("saxi", True, Axi4Config(32, 32))
    module.new_interface("saxil", True, Axi4liteConfig(32, 32))
    module.new_interface("saxil2", True, Axi4liteConfig(32, 32))

    hpp, cpp = module.generate()

    print("=== .hpp ===")
    print(hpp)

    print("=== .cpp ===")
    print(cpp)


if __name__ == "__main__":
    main()
