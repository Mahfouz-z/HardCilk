#ifndef HARDCILK_ALLOCATOR_HPP_INCLUDED
#define HARDCILK_ALLOCATOR_HPP_INCLUDED

#include "Abort.hpp"
#include "Defs.hpp"
#include "Misc.hpp"

#include <utility>

namespace hardcilk {

/**
 * @brief Basic linear allocator.
 */
struct LinearAllocator {
    LinearAllocator(addr_type base, size_type size)
        : base_ { base }
        , size_ { size } {
    }

    addr_type allocate(size_type size, size_type alignment = sizeof(addr_type)) {
        if (!util::has_single_bit(alignment))
            abort("invalid alignment");

        addr_type next = util::align(next_, alignment);

        if (next > this->size_)
            abort("not enough memory");

        addr_type result = base_ + next;

        next_ = next + size;
        num_++;

        return result;
    }

    void deallocate(addr_type ptr) {
        HARDCILK_UNUSED(ptr);

        num_--;

        if (num_ == 0) {
            next_ = 0;
        }
    }

private:
    addr_type base_;
    addr_type next_ = 0;
    size_t size_;
    size_type num_ = 0;
};

template<typename Allocator>
struct AllocatorRef {
    AllocatorRef(Allocator& allocator)
        : allocator_ { allocator } {}

    addr_type allocate(size_type size, size_type alignment = sizeof(addr_type)) {
        return allocator_.allocate(size, alignment);
    }

    void deallocate(addr_type ptr) {
        allocator_.deallocate(ptr);
    }

private:
    Allocator& allocator_;
};

namespace polymorphic {

struct PolymorphicAllocator {
    virtual addr_type allocate(size_type size, size_type alignment = sizeof(addr_type)) = 0;
    virtual void deallocate(addr_type ptr) = 0;
    virtual ~PolymorphicAllocator() = default;
};

template<typename Allocator>
struct WrappedPolymorphicAllocator : public PolymorphicAllocator, private Allocator {
    template<typename... Args>
    WrappedPolymorphicAllocator(Args&&... args)
        : Allocator { std::forward<Args>(args)... } {}

    addr_type allocate(size_type size, size_type alignment = sizeof(addr_type)) override {
        return Allocator::allocate(size, alignment);
    }

    void deallocate(addr_type ptr) override {
        Allocator::deallocate(ptr);
    }
};

using LinearAllocator = WrappedPolymorphicAllocator<hardcilk::LinearAllocator>;
using PolymorphicAllocatorRef = AllocatorRef<PolymorphicAllocator>;

}

}

#endif /* HARDCILK_ALLOCATOR_HPP_INCLUDED */
