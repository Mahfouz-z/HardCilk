# See the source code: https://github.com/antmicro/verilator-1/blob/master/examples/cmake_hello_c/CMakeLists.txt

project(example_1)

SET(CMAKE_CXX_STANDARD 20)

cmake_minimum_required(VERSION 3.12)

find_package(verilator REQUIRED)
find_package(SystemCLanguage REQUIRED)
find_package(fmt REQUIRED)

# Note that the Xilinx library and TLM does not support wrong data types
# for generated code. Figure this one out later.
set(VERILATOR_ARGS --pins-bv 2 --trace)

add_executable(example_1 main.cpp)
verilate(example_1 SYSTEMC INCLUDE_DIRS "hdl" SOURCES "hdl/SimpleMemoryMappedDevice.v")
verilator_link_systemc(example_1)
target_include_directories(example_1 PRIVATE $ENV{XILINX_SYSTEMC_INCLUDE}/libsystemctlm-soc $ENV{XILINX_SYSTEMC_INCLUDE}/libsystemctlm-soc/tests)
target_link_libraries(example_1 PRIVATE fmt::fmt)
