#include <flexitask/Abort.hpp>

#if defined(FLEXITASK_SYSTEMC)
#    include <stdexcept>
#elif defined(FLEXITASK_MICROBLAZE32) || defined(FLEXITASK_MICROBLAZE32)
#    include <xil_printf.h>
#endif

namespace flexitask {

#if defined(FLEXITASK_SYSTEMC)

void abort(const char* msg) {
    throw std::runtime_error(msg);
}

#elif defined(FLEXITASK_MICROBLAZE32) || defined(FLEXITASK_MICROBLAZE32)

void abort(const char* msg) {
    xil_printf("Aborted: %s\n", msg);
    while (1) ;
}

#endif

}
