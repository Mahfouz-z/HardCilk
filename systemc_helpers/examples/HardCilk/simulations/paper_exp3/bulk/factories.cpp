#include "factories.hpp"

/* BEGIN include directories */
#include <task1_exp3_pe.hpp>
#include <task2_exp3_pe.hpp>
#include <processor.hpp>
#include "wrappers/paper_exp3__peCount1_12__vssNumber1_2__peCount2_12__vssNumber2_2.hpp"
/* END */

namespace paper_exp3
{

flexitask::Factory factories[1] = {
    [] /* immediately invoked lambda expression */ {
        flexitask::Factory factory;
        factory.registerSystem<generated::paper_exp3__peCount1_12__vssNumber1_2__peCount2_12__vssNumber2_2>();
        factory.registerProcessor<paper_exp3::Processor>();
        factory.registerProcessingElement<paper_exp3::task1Exp3_pe>("task1Exp3_pe");
        factory.registerProcessingElement<paper_exp3::task2Exp3_pe>("task2Exp3_pe");
        return factory;
    }()
};

} /* namespace paper_exp3 */

