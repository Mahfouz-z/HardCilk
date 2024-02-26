#!/bin/bash

function setup_packages() {
    if python3 -c 'import flexitask; import systemc_helpers; import cpp_dump;'
    then
        return
    else
        echo "Installing python packages."
    fi

    pushd ../../../../python > /dev/null
    python3 -m pip install -e .
    popd > /dev/null
}


function flexitask() {
    if [ ! -f CMakeLists.txt ]
    then
        echo "Not in the correct directory. Execute from the project directory."
        exit 1
    fi

    python3 -m flexitask "$@"
}

setup_packages
