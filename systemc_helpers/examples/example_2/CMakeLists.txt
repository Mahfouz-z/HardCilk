# See the source code: https://github.com/antmicro/verilator-1/blob/master/examples/cmake_hello_c/CMakeLists.txt

project(example_2)

SET(CMAKE_CXX_STANDARD 20)

cmake_minimum_required(VERSION 3.12)

find_package(verilator REQUIRED)
find_package(SystemCLanguage REQUIRED)
find_package(fmt REQUIRED)

# Note that the Xilinx library and TLM does not support wrong data types
# for generated code. Figure this one out later.
set(VERILATOR_ARGS --pins-bv 2 --trace)

add_executable(example_2 main.cpp $ENV{XILINX_SYSTEMC_INCLUDE}/libsystemctlm-soc/tests/test-modules/memory.cc)
verilate(example_2 SYSTEMC INCLUDE_DIRS "hdl" SOURCES "hdl/DMA_Wrapped.v")
verilator_link_systemc(example_2)
target_include_directories(example_2 PRIVATE $ENV{XILINX_SYSTEMC_INCLUDE}/libsystemctlm-soc $ENV{XILINX_SYSTEMC_INCLUDE}/libsystemctlm-soc/tests)
target_link_libraries(example_2 PRIVATE fmt::fmt)
