#!/bin/bash

# silent pushd/popd
pushd () {
    command pushd "$@" > /dev/null
}

popd () {
    command popd "$@" > /dev/null
}

REPO_DIR=~/repos/jnbrq
mkdir -p "$REPO_DIR"

eval "$(conda shell.bash hook)"

function print_name() {
    echo "=== Installing '$1' ==="
}

function print_error() {
    echo "Error: $@"
    exit 1
}

function setup_strenc_scala() {
    REPO=strenc-scala
    print_name $REPO
    pushd $REPO_DIR
        rm -rf $REPO 2>&1 > /dev/null
        git clone https://github.com/jnbrq/$REPO.git || print_error $REPO "git clone"
        pushd $REPO
            sbt publishLocal || print_error $REPO "sbt publishLocal"
        popd
    popd
}

function setup_strenc_python() {
    REPO=strenc-python
    print_name $REPO
    pushd $REPO_DIR
        rm -rf $REPO 2>&1 > /dev/null
        git clone https://github.com/jnbrq/$REPO.git || print_error $REPO "git clone"
        pushd $REPO
            conda activate hwdev || print_error $REPO "conda activate"
            python3 -m pip install -e . || print_error $REPO "pip install"
        popd
    popd
}

function setup_chisel3_interface() {
    REPO=chisel3-interface
    print_name $REPO
    pushd $REPO_DIR
        rm -rf $REPO 2>&1 > /dev/null
        git clone https://github.com/jnbrq/$REPO.git || print_error $REPO "git clone"
        pushd $REPO/chisel3-interface
            sbt publishLocal || print_error $REPO || print_error $REPO "sbt publishLocal"
        popd

        pushd $REPO/clients/python
            conda activate hwdev || print_error $REPO "conda activate"
            python3 -m pip install -e . || print_error $REPO "pip install"
        popd
    popd
}

setup_strenc_scala
setup_strenc_python
setup_chisel3_interface
