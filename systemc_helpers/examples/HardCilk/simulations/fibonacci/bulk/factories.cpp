#include "factories.hpp"

/* BEGIN include directories */
#include <fib_pe.hpp>
#include <sum_pe.hpp>
#include <processor.hpp>
#include "wrappers/fibonacci__peCountFib_4__peCountSum_4.hpp"
#include "wrappers/fibonacci__peCountFib_8__peCountSum_8.hpp"
#include "wrappers/fibonacci__peCountFib_16__peCountSum_16.hpp"
#include "wrappers/fibonacci__peCountFib_32__peCountSum_32.hpp"
/* END */

namespace fibonacci
{

hardcilk::Factory factories[4] = {
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::fibonacci__peCountFib_4__peCountSum_4>();
        factory.registerProcessor<fibonacci::Processor>();
        factory.registerProcessingElement<fibonacci::fib_pe>("fib_pe");
        factory.registerProcessingElement<fibonacci::sum_pe>("sum_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::fibonacci__peCountFib_8__peCountSum_8>();
        factory.registerProcessor<fibonacci::Processor>();
        factory.registerProcessingElement<fibonacci::fib_pe>("fib_pe");
        factory.registerProcessingElement<fibonacci::sum_pe>("sum_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::fibonacci__peCountFib_16__peCountSum_16>();
        factory.registerProcessor<fibonacci::Processor>();
        factory.registerProcessingElement<fibonacci::fib_pe>("fib_pe");
        factory.registerProcessingElement<fibonacci::sum_pe>("sum_pe");
        return factory;
    }(),
    [] /* immediately invoked lambda expression */ {
        hardcilk::Factory factory;
        factory.registerSystem<generated::fibonacci__peCountFib_32__peCountSum_32>();
        factory.registerProcessor<fibonacci::Processor>();
        factory.registerProcessingElement<fibonacci::fib_pe>("fib_pe");
        factory.registerProcessingElement<fibonacci::sum_pe>("sum_pe");
        return factory;
    }()
};

} /* namespace fibonacci */

