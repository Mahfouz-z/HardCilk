#include "utils.h"
#include <xil_cache.h>

void fill_pattern(char *tgt, unsigned len) {
    for (unsigned i = 0; i < len; ++i) {
        tgt[i] = ('0' + (i % 64));
    }
}

int compare_memory(char *a, char *b, unsigned len) {
    Xil_DCacheInvalidateRange((uintptr_t) a, len);
    Xil_DCacheInvalidateRange((uintptr_t) b, len);

    for (unsigned i = 0; i < len; ++i) {
        if (a[i] != b[i])
            return 0;
    }
    return 1;
}
