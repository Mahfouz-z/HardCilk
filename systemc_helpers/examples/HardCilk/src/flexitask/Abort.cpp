#include <hardcilk/Abort.hpp>

#if defined(HARDCILK_SYSTEMC)
#    include <stdexcept>
#elif defined(HARDCILK_MICROBLAZE32) || defined(HARDCILK_MICROBLAZE32)
#    include <xil_printf.h>
#endif

namespace hardcilk {

#if defined(HARDCILK_SYSTEMC)

void abort(const char* msg) {
    throw std::runtime_error(msg);
}

#elif defined(HARDCILK_MICROBLAZE32) || defined(HARDCILK_MICROBLAZE32)

void abort(const char* msg) {
    xil_printf("Aborted: %s\n", msg);
    while (1) ;
}

#endif

}
