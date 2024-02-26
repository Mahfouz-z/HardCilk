#ifndef FIBONACCI_INCLUDE_PROCESSOR_HPP_INCLUDED
#define FIBONACCI_INCLUDE_PROCESSOR_HPP_INCLUDED

#include <flexitask/Processor.hpp>

namespace fibonacci {

struct Processor : flexitask::Processor {
    using flexitask::Processor::Processor;

protected:
    void setup() override;
};

} /* namespace fibonacci */

#endif /* FIBONACCI_INCLUDE_PROCESSOR_HPP_INCLUDED */
