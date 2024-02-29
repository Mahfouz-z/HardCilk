#ifndef HARDCILK_MEMPARAMS_HPP_INCLUDED
#define HARDCILK_MEMPARAMS_HPP_INCLUDED

#include <hardcilk/ArgParser.hpp>
#include <hardcilk/Context.hpp>

#include <string>

#include <systemc>

namespace hardcilk {

/**
 * @brief Stores memory-related parameters.
 * 
 * @todo Should we also include the memory size here?
 * 
 */
struct MemParams {
    std::string prefix;
    double delay_ns;
    unsigned numParallelRequests;

    void toArgParser(ArgParser& argParser) &&;
    void toContext(Context& context) &&;

    static MemParams fromContext(const std::string& prefix, Context const& context);
};

} /* namespace hardcilk */

#endif /* HARDCILK_MEMPARAMS_HPP_INCLUDED */
