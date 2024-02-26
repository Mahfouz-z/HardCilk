#define DEBUG
#include "xaxicdma_hw.h"

#include <stddef.h>

#include "cdma.h"

#include "xaxicdma.h"
#include "xdebug.h"
#include "xil_cache.h"
#include "xparameters.h"

#define DMA_CTRL_DEVICE_ID  XPAR_AXICDMA_0_DEVICE_ID

// original source:
//   https://github.com/Xilinx/embeddedsw/blob/master/XilinxProcessorIPLib/drivers/axicdma/examples/xaxicdma_example_simple_intr.c

static XAxiCdma axi_cdma_instance;
static int cdma_reset();

int cdma_initialize() {
    XAxiCdma_Config *cfg;
    int status;

    cfg = XAxiCdma_LookupConfig(DMA_CTRL_DEVICE_ID);
    if (!cfg)
        return XST_FAILURE;

    status = XAxiCdma_CfgInitialize(&axi_cdma_instance, cfg, cfg->BaseAddress);

    if (status != XST_SUCCESS)
        return XST_FAILURE;

    XAxiCdma_IntrDisable(&axi_cdma_instance, XAXICDMA_XR_IRQ_ALL_MASK);

    return XST_SUCCESS;
}

static
int cdma_reset() {
    int timeout = 10;

    XAxiCdma_Reset(&axi_cdma_instance);

    while (timeout) {
        if (XAxiCdma_ResetIsDone(&axi_cdma_instance)) {
            break;
        }
        timeout--;
    }

    if (!timeout) {
        xdbg_printf(XDBG_DEBUG_ERROR, "Reset done failed\r\n");
        return XST_FAILURE;
    }

    return XST_SUCCESS;
}

int cdma_simple_transfer(void const *src, void *dest, int len) {
    Xil_DCacheFlushRange((INTPTR) src, len);
    Xil_DCacheFlushRange((INTPTR) dest, len);

    /* we do not retry in case a transfer fails */
    return XAxiCdma_SimpleTransfer(&axi_cdma_instance, (UINTPTR) src,
            (UINTPTR) dest, len, NULL, NULL);
}

int cdma_wait_busy() {
    while (XAxiCdma_IsBusy(&axi_cdma_instance)) {
        /* wait */
    }

    if (XAxiCdma_GetError(&axi_cdma_instance) != 0) {
        xdbg_printf(XDBG_DEBUG_ERROR, "[ERROR] CDMA: CDMASR        0x%lx\n", XAxiCdma_ReadReg(axi_cdma_instance.BaseAddr, XAXICDMA_SR_OFFSET));
        xdbg_printf(XDBG_DEBUG_ERROR, "[ERROR] CDMA: CURDESC_PNTR  0x%lx\n", XAxiCdma_ReadReg(axi_cdma_instance.BaseAddr, XAXICDMA_CDESC_OFFSET));
        xdbg_printf(XDBG_DEBUG_ERROR, "[ERROR] CDMA: BTT           0x%lx\n", XAxiCdma_ReadReg(axi_cdma_instance.BaseAddr, XAXICDMA_BTT_OFFSET));
        if (cdma_reset() == XST_FAILURE)
            return XST_FAILURE;
    }

    return XST_SUCCESS;
}
