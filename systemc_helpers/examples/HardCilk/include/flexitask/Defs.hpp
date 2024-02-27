#ifndef HARDCILK_DEFS_HPP_INCLUDED
#define HARDCILK_DEFS_HPP_INCLUDED

#include <cstddef>
#include <cstdint>

namespace hardcilk {

using width_type = std::uint32_t;

#if defined(HARDCILK_SYSTEMC)

using addr_type = std::uint64_t;
using size_type = std::uint64_t;
using width_type = std::uint32_t;
using counter_type = std::uint32_t;

#elif defined(HARDCILK_MICROBLAZE32)

using addr_type = std::uint32_t;
using size_type = std::uint32_t;

#elif defined(HARDCILK_MICROBLAZE64)

using addr_type = std::uint64_t;
using size_type = std::uint64_t;

#else
#    error "Please define the platform."
#endif

}

#endif /* HARDCILK_DEFS_HPP_INCLUDED */
