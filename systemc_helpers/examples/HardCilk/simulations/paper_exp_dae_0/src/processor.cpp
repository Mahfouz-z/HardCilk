#include <processor.hpp>
#include <tasks.hpp>

namespace paper_exp_dae_0 {

void Processor::setup() {
    auto& remainingTasks = context.get<int>("remainingTasks");
    auto& rootNode = context.get<node*>("rootNode");

    for (auto& driver : virtualStealServerDrivers) {
        if (driver.desc.path == "/tasks:execute/virtualStealServers:vss_0") {
            auto addrFirst = driver.initialize(1);

            mem.write(addrFirst, task_execute { .n_ptr = rootNode });
            addrFirst += sizeof(task_execute);
        } else {
            driver.initialize(0);
        }
    }

    for (auto& driver : virtualContinuationAddressServerDrivers) {
        driver.initialize();
    }

    for (auto& driver : virtualStealServerDrivers)
        driver.resume();

    for (auto& driver : virtualContinuationAddressServerDrivers)
        driver.resume();

    auto& T_start = context.get<double>("T_start");
    T_start = sc_core::sc_time_stamp().to_seconds();
}

} /* namespace paper_exp_dae_0 */
