#include <flexitask/MemParams.hpp>

#include <stdexcept>

namespace flexitask {

void MemParams::toArgParser(ArgParser& argParser) && {
    if (prefix.empty())
        throw std::invalid_argument("MemParams::prefix shall not be empty!");

    argParser.arg(prefix + ".delay_ns", delay_ns);
    argParser.arg(prefix + ".numParallelRequests", numParallelRequests);
}

void MemParams::toContext(Context& context) && {
    context.set(prefix + ".delay_ns", delay_ns);
    context.set(prefix + ".numParallelRequests", numParallelRequests);
}

MemParams MemParams::fromContext(const std::string& prefix, Context const& context) {
    auto const& delay_ns = context.get<double>(prefix + ".delay_ns");
    auto const& numParallelRequests = context.get<unsigned>(prefix + ".numParallelRequests");
    return {
        .prefix = prefix,
        .delay_ns = delay_ns,
        .numParallelRequests = numParallelRequests
    };
}

} /* namespace flexitask */
