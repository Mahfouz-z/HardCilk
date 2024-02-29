#ifndef HARDCILK_MEMORYINTERFACE_HPP_INCLUDED
#define HARDCILK_MEMORYINTERFACE_HPP_INCLUDED

#if defined(HARDCILK_SYSTEMC)
#    include <sctlm/tlm_lib/drivers/memory.hpp>
#elif defined(HARDCILK_MICROBLAZE32) || defined(HARDCILK_MICROBLAZE32)
#    include <xil_io.h>
#endif

namespace hardcilk {

#if defined(HARDCILK_SYSTEMC)

struct SystemcMemoryInterface {
    using memory_interface = sctlm::tlm_lib::drivers::memory_interface;

    SystemcMemoryInterface(memory_interface& interface)
        : interface_ { interface } {
        /* not marked explicit on purpose */
    }

    uint32_t read32(addr_type addr) {
        return interface_.read32(addr);
    }

    void write32(addr_type addr, uint32_t data) {
        interface_.write32(addr, data);
    }

    uint64_t read64(addr_type addr) {
        return interface_.read64(addr);
    }

    void write64(addr_type addr, uint64_t data) {
        interface_.write64(addr, data);
    }

private:
    memory_interface& interface_;
};

using DefaultMemoryInterface = SystemcMemoryInterface;

#elif defined(HARDCILK_MICROBLAZE32) || defined(HARDCILK_MICROBLAZE32)

struct MicroblazeMemoryInterface {
    uint32_t read32(addr_type addr) const noexcept {
        return Xil_In32(addr);
    }

    void write32(addr_type addr, uint32_t data) const noexcept {
        Xil_Out32(addr, data);
    }

    uint64_t read64(addr_type addr) const noexcept {
        return Xil_In64(addr);
    }

    void write64(addr_type addr, uint64_t data) const noexcept {
        Xil_Out64(addr, data);
    }
};

using DefaultMemoryInterface = SystemcMemoryInterface;

#endif

}

#endif /* HARDCILK_MEMORYINTERFACE_HPP_INCLUDED */
