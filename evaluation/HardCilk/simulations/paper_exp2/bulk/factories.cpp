#include "factories.hpp"

/* BEGIN include directories */
#include <task_pe.hpp>
#include <processor.hpp>
#include "wrappers/paper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8.hpp"
/* END */

namespace paper_exp2
{

hardcilk::Factory factories[1] = {
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::paper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8>();
        factory.registerProcessor<paper_exp2::Processor>();
        factory.registerProcessingElement<paper_exp2::task_pe>("task_pe");
        return factory;
    }()
};

} /* namespace paper_exp2 */

