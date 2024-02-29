MACRO(subdirs result curdir)
    FILE(GLOB children ${curdir}/*)
    SET(dirlist "")

    FOREACH(child ${children})
        IF(IS_DIRECTORY ${child})
            get_filename_component(relative ${child} NAME)
            LIST(APPEND dirlist ${relative})
        ENDIF()
    ENDFOREACH()

    SET(${result} ${dirlist})
ENDMACRO()

MACRO(config_bulk target_name)
    message(STATUS "Configuring bulk for: ${target_name}")
    subdirs(hdl_targets ./bulk/hdl/)

    foreach(hdl_target ${hdl_targets})
        message(STATUS "Found HDL target: ${hdl_target}")

        # add Verilog files
        verilate(
            ${target_name}
            SYSTEMC
            INCLUDE_DIRS "./bulk/hdl/${hdl_target}"
            PREFIX V${hdl_target}
            SOURCES
            "./bulk/hdl/${hdl_target}/${hdl_target}.v"
            "./bulk/hdl/${hdl_target}/DualPortBRAM_sim.v"
        )

        # add cpp files
        target_sources(
            ${target_name}
            PRIVATE
            "./bulk/wrappers/${hdl_target}.cpp"
        )
    endforeach()

    target_sources(
        ${target_name}
        PRIVATE
        "./bulk/factories.cpp"
    )

    target_include_directories(${target_name} PUBLIC "./bulk/")
ENDMACRO()

add_subdirectory(paper_exp1/)
add_subdirectory(paper_exp2/)
add_subdirectory(paper_exp3/)
add_subdirectory(paper_exp_dae_0/)
add_subdirectory(paper_exp_dae_1/)
