#ifndef PAPER_EXP2_INCLUDE_PROCESSOR_HPP_INCLUDED
#define PAPER_EXP2_INCLUDE_PROCESSOR_HPP_INCLUDED

#include <hardcilk/Processor.hpp>

namespace paper_exp2 {

struct Processor : hardcilk::Processor {
    using hardcilk::Processor::Processor;

protected:
    void setup() override;
};

} /* namespace paper_exp2 */

#endif /* PAPER_EXP2_INCLUDE_PROCESSOR_HPP_INCLUDED */
