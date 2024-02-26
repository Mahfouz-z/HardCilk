#include "factories.hpp"

/* BEGIN include directories */
#include <task_pe.hpp>
#include <processor.hpp>
#include "wrappers/paper_exp1__peCount_8__vssNumber_6.hpp"
#include "wrappers/paper_exp1__peCount_16__vssNumber_6.hpp"
#include "wrappers/paper_exp1__peCount_32__vssNumber_6.hpp"
/* END */

namespace paper_exp1
{

flexitask::Factory factories[3] = {
    [] /* immediately invoked lambda expression */ {
        flexitask::Factory factory;
        factory.registerSystem<generated::paper_exp1__peCount_8__vssNumber_6>();
        factory.registerProcessor<paper_exp1::Processor>();
        factory.registerProcessingElement<paper_exp1::task_pe>("task_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        flexitask::Factory factory;
        factory.registerSystem<generated::paper_exp1__peCount_16__vssNumber_6>();
        factory.registerProcessor<paper_exp1::Processor>();
        factory.registerProcessingElement<paper_exp1::task_pe>("task_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        flexitask::Factory factory;
        factory.registerSystem<generated::paper_exp1__peCount_32__vssNumber_6>();
        factory.registerProcessor<paper_exp1::Processor>();
        factory.registerProcessingElement<paper_exp1::task_pe>("task_pe");
        return factory;
    }()
};

} /* namespace paper_exp1 */

