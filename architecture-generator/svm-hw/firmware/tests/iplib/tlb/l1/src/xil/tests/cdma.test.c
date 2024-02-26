#include "../utils.h"
#include "../cdma.h"

#include "../platform_config.h"

#include <embedtest/test.h>
#include <xil_printf.h>

#define CDMA_TRANSFER_LENGTH    32

ET_IMPLEMENT_TEST(basic) {
    cdma_wait_busy();

    fill_pattern((void *) MEM_BASE, CDMA_TRANSFER_LENGTH);

    cdma_simple_transfer((void *) MEM_BASE, (void *) MEM_BASE + 2 * CDMA_TRANSFER_LENGTH, CDMA_TRANSFER_LENGTH);
    cdma_wait_busy();

    if (!compare_memory((void *) MEM_BASE, (void *) MEM_BASE + 2 * CDMA_TRANSFER_LENGTH, CDMA_TRANSFER_LENGTH)) {
        xil_printf("[ERROR] CDMA transfer check pattern failed!\r\n");
        return ET_TEST_FAILURE;
    }

    return ET_TEST_SUCCESS;
}

ET_TEST_SUITE(cdma)
    ET_ADD_TEST(basic)
ET_END_TEST_SUITE()
