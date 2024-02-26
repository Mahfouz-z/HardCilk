#!/bin/bash

mkdir -p vivado_workdir
pushd ./vivado_workdir

for x in ../hdl/*
do
    hdl=$(basename $x)
    echo "Running HDL synthesis for: $hdl"
    mkdir -p $hdl
    echo "source ../scripts/ooc_synth.tcl; ft_synth ../hdl/$hdl $hdl fullSysGen; exit" | vivado -mode tcl
done

popd
