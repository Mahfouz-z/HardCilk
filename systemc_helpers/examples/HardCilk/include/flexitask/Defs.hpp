#ifndef FLEXITASK_DEFS_HPP_INCLUDED
#define FLEXITASK_DEFS_HPP_INCLUDED

#include <cstddef>
#include <cstdint>

namespace flexitask {

using width_type = std::uint32_t;

#if defined(FLEXITASK_SYSTEMC)

using addr_type = std::uint64_t;
using size_type = std::uint64_t;
using width_type = std::uint32_t;
using counter_type = std::uint32_t;

#elif defined(FLEXITASK_MICROBLAZE32)

using addr_type = std::uint32_t;
using size_type = std::uint32_t;

#elif defined(FLEXITASK_MICROBLAZE64)

using addr_type = std::uint64_t;
using size_type = std::uint64_t;

#else
#    error "Please define the platform."
#endif

}

#endif /* FLEXITASK_DEFS_HPP_INCLUDED */
