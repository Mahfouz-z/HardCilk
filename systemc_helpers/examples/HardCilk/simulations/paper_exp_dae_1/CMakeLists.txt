set(SIM paper_exp_dae_1)
set(SIM_TARGET simulation_${SIM})

add_executable(
    ${SIM_TARGET}
    src/main.cpp
    src/pe_access.cpp
    src/pe_execute.cpp
    src/processor.cpp
)

config_bulk(${SIM_TARGET})

# target_compile_definitions(${SIM_TARGET} PUBLIC VERILATED_TRACE_ENABLED)
target_include_directories(${SIM_TARGET} PUBLIC include/)
target_link_libraries(${SIM_TARGET} PUBLIC flexitask sctlm fmt::fmt)
verilator_link_systemc(${SIM_TARGET})
