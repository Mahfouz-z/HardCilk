#include "factories.hpp"

/* BEGIN include files */
#include <pe_access.hpp>
#include <pe_execute.hpp>
#include <processor.hpp>
#include "wrappers/paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1.hpp"
#include "wrappers/paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_2__vssNumberExecute_1.hpp"
#include "wrappers/paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_4__vssNumberExecute_1.hpp"
#include "wrappers/paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_8__vssNumberExecute_1.hpp"
/* END */

namespace paper_exp_dae_1
{

hardcilk::Factory factories[4] = {
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1>();
        factory.registerProcessor<paper_exp_dae_1::Processor>();
        factory.registerProcessingElement<paper_exp_dae_1::pe_access>("access_pe");
        factory.registerProcessingElement<paper_exp_dae_1::pe_execute>("execute_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_2__vssNumberExecute_1>();
        factory.registerProcessor<paper_exp_dae_1::Processor>();
        factory.registerProcessingElement<paper_exp_dae_1::pe_access>("access_pe");
        factory.registerProcessingElement<paper_exp_dae_1::pe_execute>("execute_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_4__vssNumberExecute_1>();
        factory.registerProcessor<paper_exp_dae_1::Processor>();
        factory.registerProcessingElement<paper_exp_dae_1::pe_access>("access_pe");
        factory.registerProcessingElement<paper_exp_dae_1::pe_execute>("execute_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_8__vssNumberExecute_1>();
        factory.registerProcessor<paper_exp_dae_1::Processor>();
        factory.registerProcessingElement<paper_exp_dae_1::pe_access>("access_pe");
        factory.registerProcessingElement<paper_exp_dae_1::pe_execute>("execute_pe");
        return factory;
    }()
};

} /* namespace paper_exp_dae_1 */

