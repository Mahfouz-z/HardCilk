#include <flexitask/Factory.hpp>
#include <flexitask/Top.hpp>

namespace flexitask {

Factory::Factory() {
    add<Top(const char*, Context&)>("@top");
}

} /* namespace flexitask */
