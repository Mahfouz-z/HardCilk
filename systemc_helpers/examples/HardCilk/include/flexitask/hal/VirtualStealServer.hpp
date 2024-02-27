#ifndef HARDCILK_MODULES_VIRTUALSTEALSERVER_HPP_INCLUDED
#define HARDCILK_MODULES_VIRTUALSTEALSERVER_HPP_INCLUDED

#include <hardcilk/Allocator.hpp>
#include <hardcilk/MemoryInterface.hpp>

#include <hardcilk/Desc.hpp>

namespace hardcilk {
namespace hal {

template<typename Allocator, typename MemoryInterface = DefaultMemoryInterface>
struct VirtualStealServer : protected Allocator,
                            protected MemoryInterface {
    desc::VirtualStealServer const& desc;

    VirtualStealServer(
        desc::VirtualStealServer const& desc,
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
        REG_ADDR_TASKS = 0x00000008,
        REG_LENGTH_MAX = 0x00000010,
        REG_TAIL = 0x00000018,
        REG_HEAD = 0x00000020,
        REG_PROC_INTERRUPT = 0x00000028
    };

    /**
     * @brief Initializes the virtual stealing server.
     *
     * @param numReservedTasks Number of tasks to be reserved.
     * @return addr_type A pointer to the tasks array.
     */
    addr_type initialize(size_type numReservedTasks) {
        static_assert(sizeof(addr_type) == 8, "64-bit addresses required.");

        addr_type addr_tasks = allocate(desc.capacity * desc.numBytesTask, desc.numBytesTask);

        writeReg(REG_ADDR_TASKS, addr_tasks);
        writeReg(REG_LENGTH_MAX, desc.capacity);
        writeReg(REG_TAIL, numReservedTasks);

        return addr_tasks;
    }

    void handle() {
        abort("VirtualStealServer::handle not yet implemented.");

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
} /* hardcilk */

#endif /* HARDCILK_MODULES_VIRTUALSTEALSERVER_HPP_INCLUDED */
