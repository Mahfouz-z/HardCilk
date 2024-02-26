# source this file

if [ -z "${XILINX_ROOT}" ]
then
    echo "Please set XILINX_ROOT first."
    return
fi

if [ -z "${XILINX_VERSION}" ]
then
    echo "Please set ${XILINX_VERSION} first."
    return
fi

export XILINX_VIVADO=${XILINX_ROOT}/Vivado/${XILINX_VERSION}
export XILINX_VITIS=${XILINX_ROOT}/Vitis/${XILINX_VERSION}

export PATH=${XILINX_ROOT}/DocNav:${PATH}
export PATH=${XILINX_ROOT}/Vivado/${XILINX_VERSION}/bin:${PATH}
export PATH=${XILINX_ROOT}/Vitis/${XILINX_VERSION}/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/microblaze/lin/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/arm/lin/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/microblaze/linux_toolchain/lin64_le/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/aarch32/lin/gcc-arm-linux-gnueabi/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/aarch32/lin/gcc-arm-none-eabi/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/aarch64/lin/aarch64-linux/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/aarch64/lin/aarch64-none/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/gnu/armr5/lin/gcc-arm-none-eabi/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/tps/lnx64/cmake-3.3.2/bin:${XILINX_ROOT}/Vitis/${XILINX_VERSION}/aietools/bin:${PATH}
export PATH=${XILINX_ROOT}/Model_Composer/${XILINX_VERSION}/bin:${PATH}
export PATH=${XILINX_ROOT}/Vitis_HLS/${XILINX_VERSION}/bin:${PATH}

