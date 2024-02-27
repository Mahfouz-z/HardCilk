#ifndef FIBONACCI_INCLUDE_PROCESSOR_HPP_INCLUDED
#define FIBONACCI_INCLUDE_PROCESSOR_HPP_INCLUDED

#include <hardcilk/Processor.hpp>

namespace fibonacci {

struct Processor : hardcilk::Processor {
    using hardcilk::Processor::Processor;

protected:
    void setup() override;
};

} /* namespace fibonacci */

#endif /* FIBONACCI_INCLUDE_PROCESSOR_HPP_INCLUDED */
