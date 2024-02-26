#ifndef FLEXITASK_MEMPARAMS_HPP_INCLUDED
#define FLEXITASK_MEMPARAMS_HPP_INCLUDED

#include <flexitask/ArgParser.hpp>
#include <flexitask/Context.hpp>

#include <string>

#include <systemc>

namespace flexitask {

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

} /* namespace flexitask */

#endif /* FLEXITASK_MEMPARAMS_HPP_INCLUDED */
