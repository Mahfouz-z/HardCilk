set(SIM paper_exp2)
set(SIM_TARGET simulation_${SIM})

add_executable(
    ${SIM_TARGET}
    src/main.cpp
    src/task_pe.cpp
    src/processor.cpp
    src/verilated.cpp
)

verilate(
    ${SIM_TARGET}
    SYSTEMC
    INCLUDE_DIRS "hdl"
    SOURCES "hdl/paper_exp2.v" "hdl/DualPortBRAM_sim.v"
)

config_bulk(${SIM_TARGET})

# target_compile_definitions(${SIM_TARGET} PUBLIC VERILATED_TRACE_ENABLED)
target_include_directories(${SIM_TARGET} PUBLIC include/)
target_link_libraries(${SIM_TARGET} PUBLIC hardcilk sctlm fmt::fmt)
verilator_link_systemc(${SIM_TARGET})
