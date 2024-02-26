# See the source code: https://github.com/antmicro/verilator-1/blob/master/examples/cmake_hello_c/CMakeLists.txt

project(flexitask)

SET(CMAKE_CXX_STANDARD 20)

cmake_minimum_required(VERSION 3.12)

find_package(verilator REQUIRED)
find_package(SystemCLanguage REQUIRED)
find_package(fmt REQUIRED)

# Note that the Xilinx library and TLM does not support wrong data types
# for generated code. Figure this one out later.
set(VERILATOR_ARGS --pins-bv 2 --trace -Wno-SYMRSVDWORD)
# set(VERILATOR_ARGS --pins-bv 2 -Wno-SYMRSVDWORD)

add_library(
    sctlm
    STATIC
    src/sctlm/tlm_lib/modules/iconnect.cpp
    src/sctlm/tlm_lib/modules/memory.cpp
)
target_include_directories(sctlm PUBLIC include)
target_link_libraries(sctlm PUBLIC fmt::fmt)

find_package(Boost 1.70 COMPONENTS program_options REQUIRED)

add_library(
    flexitask
    STATIC
    src/flexitask/Factory.cpp
    src/flexitask/Abort.cpp
    src/flexitask/Top.cpp
    src/flexitask/Processor.cpp
    src/flexitask/PerfFigures.cpp
    src/flexitask/MemParams.cpp
)
target_include_directories(flexitask PUBLIC include)
target_link_libraries(flexitask PUBLIC sctlm Boost::boost Boost::program_options)
target_compile_definitions(flexitask PUBLIC FLEXITASK_SYSTEMC)

add_subdirectory(simulations/)
