#include <processor.hpp>
#include <tasks.hpp>

namespace fibonacci {

void Processor::setup() {
    auto& n = context.get<unsigned int>("n");

    for (auto& driver : virtualContinuationAddressServerDrivers) {
        driver.initialize();
    }

    for (auto& driver : virtualStealServerDrivers) {
        if (driver.desc.path == "/tasks:fib/virtualStealServers:vss_0") {
            auto addrReturn = allocator->allocate(16);
            mem.write32(addrReturn, 100000);

            auto addrFirst = driver.initialize(1);
            mem.write(addrFirst, fib_task { .returnAddress = addrReturn, .n = n });
        } else {
            driver.initialize(0);
        }
    }

    for (auto& driver : virtualStealServerDrivers)
        driver.resume();

    for (auto& driver : virtualContinuationAddressServerDrivers)
        driver.resume();
}

} // namespace fibonacci
