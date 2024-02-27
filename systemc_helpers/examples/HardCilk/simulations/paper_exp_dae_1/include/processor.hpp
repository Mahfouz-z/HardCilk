#ifndef PAPER_EXP1_INCLUDE_PROCESSOR_HPP_INCLUDED
#define PAPER_EXP1_INCLUDE_PROCESSOR_HPP_INCLUDED

#include <hardcilk/Processor.hpp>

namespace paper_exp_dae_1 {

struct Processor : hardcilk::Processor {
    using hardcilk::Processor::Processor;

protected:
    void setup() override;
};

} /* namespace paper_exp1 */

#endif /* PAPER_EXP1_INCLUDE_PROCESSOR_HPP_INCLUDED */
