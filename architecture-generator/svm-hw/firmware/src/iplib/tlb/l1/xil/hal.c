#include <xil_io.h>

#define TLB_L1_OUT32(addr, val) Xil_Out32((UINTPTR) (addr), (val))
#define TLB_L1_IN32(addr) Xil_In32((UINTPTR) (addr))

#include "../hal_common.i"

