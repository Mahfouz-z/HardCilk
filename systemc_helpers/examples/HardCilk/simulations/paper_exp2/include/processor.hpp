#ifndef PAPER_EXP2_INCLUDE_PROCESSOR_HPP_INCLUDED
#define PAPER_EXP2_INCLUDE_PROCESSOR_HPP_INCLUDED

#include <flexitask/Processor.hpp>

namespace paper_exp2 {

struct Processor : flexitask::Processor {
    using flexitask::Processor::Processor;

protected:
    void setup() override;
};

} /* namespace paper_exp2 */

#endif /* PAPER_EXP2_INCLUDE_PROCESSOR_HPP_INCLUDED */
