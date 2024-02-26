#!/bin/bash

function generate_files() {
    mkdir -p generated

    # add other generated systems here...
    python3 -m flexitask --input descriptors/fibonacci --output generated/fibonacci --input-name Vfibonacci --output-name FibonacciFlexiTask
    python3 -m flexitask --input descriptors/paper_exp1 --output generated/paper_exp1 --input-name Vpaper_exp1 --output-name PaperExp1FlexiTask
    # python3 -m flexitask --input descriptors/matmul --output generated/matmul --output-name MatmulFlexiTask
}

if [ ! -f CMakeLists.txt ]
then
    echo "Not in the correct directory. Execute from the project directory."
    exit 1
fi

function setup_packages() {
    if python3 -c 'import flexitask; import systemc_helpers; import cpp_dump;'
    then
        return
    else
        echo "Installing python packages."
    fi

    pushd ../../python > /dev/null
    python3 -m pip install -e .
    popd > /dev/null
}

setup_packages
generate_files
