#!/bin/bash
source ../common/generate_common.sh

JSON=paper_exp1.json
NAMESPACE=paper_exp1

hardcilk wrapper_verilog \
    --input-json $JSON \
    --output-hdl hdl/ \
    --output-cpp src/verilated.cpp \
    --output-hpp include/verilated.hpp \
    --class-name VerilatedTlmModule \
    --namespace $NAMESPACE \
#    --verilated-trace-macro VERILATED_TRACE_ENABLED
