#include "platform.h"   // init_platform, cleanup_platform
#include "cdma.h"       // cdma_initialize

#include <iplib/tlb/l1/hal.h>

#include <xstatus.h>
#include <xil_printf.h>
#include <embedtest/test.h>

#if 0

// TODO also try out everything with interrupts?

// for the interrupt system

#include "xparameters.h"
#include "xscugic.h"
#include "xil_exception.h"
#include "xil_printf.h"

#endif

struct tlb_l1_instance tlb_l1_read;
struct tlb_l1_instance tlb_l1_write;

// NOTE declare test suites here
ET_DECLARE_TEST_SUITE(cdma)
ET_DECLARE_TEST_SUITE(tlb)

ET_TEST_SUITE(root)
    // NOTE import test suites here
    ET_IMPORT_TEST_SUITE(cdma)
    ET_IMPORT_TEST_SUITE(tlb)
ET_END_TEST_SUITE()

int main() {
    init_platform();

    if (cdma_initialize() != XST_SUCCESS) {
        xil_printf("[ERROR] CDMA initialization failed!\r\n");
        return XST_FAILURE;
    }

    struct tlb_l1_config tlb_l1_cfg = {
            .num_entries = 4,
            .w_offset = 12,
            .w_tagfrom = 20,
            .w_tagto = 20
    };

    tlb_l1_create(&tlb_l1_read, READ_TLB_BASE, &tlb_l1_cfg);
    tlb_l1_create(&tlb_l1_write, WRITE_TLB_BASE, &tlb_l1_cfg);

    ET_RUN_TEST_SUITE(root);

    tlb_l1_destroy(&tlb_l1_write);
    tlb_l1_destroy(&tlb_l1_read);

    cleanup_platform();
    return 0;
}

