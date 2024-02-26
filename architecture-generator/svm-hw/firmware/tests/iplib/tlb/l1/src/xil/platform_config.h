#ifndef __PLATFORM_CONFIG_H_
#define __PLATFORM_CONFIG_H_

#include "xparameters.h"

// Constants for memory-mapped devices
#define MEM_BASE            ((volatile uint32_t *) XPAR_MIG_7SERIES_0_BASEADDR)

// The constants below are not generated automatically
#define TRANSLATED_BASE     ((volatile uint32_t *) 0xC0000000)
#define READ_TLB_BASE       ((uintptr_t) 0xF0000000ull)
#define WRITE_TLB_BASE      ((uintptr_t) 0xF0001000ull)

#endif
