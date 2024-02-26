#ifndef FLEXITASK_MODULES_VIRTUALCONTINUATIONSERVER_HPP_INCLUDED
#define FLEXITASK_MODULES_VIRTUALCONTINUATIONSERVER_HPP_INCLUDED

#include <flexitask/Allocator.hpp>
#include <flexitask/MemoryInterface.hpp>

#include <flexitask/Desc.hpp>

namespace flexitask {
namespace hal {

template<typename Allocator, typename MemoryInterface = DefaultMemoryInterface>
struct VirtualContinuationAddressServer : protected Allocator,
                                          protected MemoryInterface {
    desc::VirtualContinuationAddressServer const& desc;

    VirtualContinuationAddressServer(
        desc::VirtualContinuationAddressServer const& desc,
        Allocator const& allocator,
        MemoryInterface const& memoryInterface = MemoryInterface()
    )
        : Allocator { allocator }
        , MemoryInterface { memoryInterface }
        , desc { desc } {
    }

    /** @brief Offsets of hardware registers. */
    enum : addr_type {
        REG_PAUSE = 0x00000000,
        REG_ADDR_CLOSURES = 0x00000008,
        REG_LENGTH_AVAILABLE = 0x00000010
    };

    void initialize() {
        addr_type addr_conts = allocate(desc.capacity * desc.numBytesCont, desc.numBytesCont);
        addr_type addr_cont_ptrs = allocate(desc.capacity * sizeof(addr_type), sizeof(addr_type));

        // initialize the continuation array
        for (size_type i = 0; i < desc.capacity; ++i)
            if constexpr (sizeof(addr_type) == 8)
                write64(addr_cont_ptrs + i * sizeof(addr_type), addr_conts + i * desc.numBytesCont);
            else
                write32(addr_cont_ptrs + i * sizeof(addr_type), addr_conts + i * desc.numBytesCont);

        writeReg(REG_ADDR_CLOSURES, addr_cont_ptrs);
        writeReg(REG_LENGTH_AVAILABLE, desc.capacity);
    }

    void handle() {
        abort("VirtualContinuationAddressServer::handle not yet implemented.");

        resume();
    }

    void resume() {
        writeReg(REG_PAUSE, 0);
    }

    bool paused() {
        return readReg(REG_PAUSE) != 0;
    }

private:
    using Allocator::allocate;
    using MemoryInterface::read32;
    using MemoryInterface::read64;
    using MemoryInterface::write32;
    using MemoryInterface::write64;

    void writeReg(addr_type offset, uint64_t data) {
        write64(desc.addressSpace.base + offset, data);
    }

    std::uint64_t readReg(addr_type offset) {
        return read64(desc.addressSpace.base + offset);
    }
};

} /* modules */
} /* flexitask */

#endif /* FLEXITASK_MODULES_VIRTUALCONTINUATIONSERVER_HPP_INCLUDED */
