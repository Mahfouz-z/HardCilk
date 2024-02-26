#ifndef PAPER_EXP1_INCLUDE_PROCESSOR_HPP_INCLUDED
#define PAPER_EXP1_INCLUDE_PROCESSOR_HPP_INCLUDED

#include <flexitask/Processor.hpp>

namespace paper_exp1 {

struct Processor : flexitask::Processor {
    using flexitask::Processor::Processor;

protected:
    void setup() override;
};

} /* namespace paper_exp1 */

#endif /* PAPER_EXP1_INCLUDE_PROCESSOR_HPP_INCLUDED */
