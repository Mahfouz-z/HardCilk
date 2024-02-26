#ifndef SCTLM_DEFS_HPP_INCLUDED
#define SCTLM_DEFS_HPP_INCLUDED

#include <cstdint>
#include <cstddef>

#include <tlm>
#include <tlm_utils/simple_target_socket.h>
#include <tlm_utils/simple_initiator_socket.h>

namespace tlm_modules {

using addr_type = std::uint64_t;
using size_type = std::uint64_t;

using std::size_t;
using std::ptrdiff_t;

};

#endif /* SCTLM_DEFS_HPP_INCLUDED */
