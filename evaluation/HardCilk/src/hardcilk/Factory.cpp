#include <hardcilk/Factory.hpp>
#include <hardcilk/Top.hpp>

namespace hardcilk {

Factory::Factory() {
    add<Top(const char*, Context&)>("@top");
}

} /* namespace hardcilk */
