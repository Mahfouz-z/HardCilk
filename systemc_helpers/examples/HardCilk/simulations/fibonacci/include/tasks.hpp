#ifndef HARDCILK_SIMULATION_FIBONACCI_TASKS_HPP_INCLUDED
#define HARDCILK_SIMULATION_FIBONACCI_TASKS_HPP_INCLUDED

#include <hardcilk/Defs.hpp>

namespace fibonacci {

struct fib_task  {
    hardcilk::addr_type returnAddress;

    std::uint64_t n;
};

// note: the Entire struct must be 256-bits long (according to the size of the task). get this one correct
struct sum_task  {
    // make sure that the counter is (1) little endian,
    // (2) padded correctly
    // @todo: make sure that this never gets fucked up.
	hardcilk::counter_type counter;

	std::uint8_t padding [4];

    hardcilk::addr_type returnAddress;
	std::uint64_t x;
	std::uint64_t y; 
};


} /* namespace fibonacci */

#endif /* HARDCILK_SIMULATION_FIBONACCI_TASKS_HPP_INCLUDED */
