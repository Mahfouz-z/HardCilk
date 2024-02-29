#include <processor.hpp>
#include <tasks.hpp>

namespace paper_exp1 {

void Processor::setup() {
    auto& baseDepth = context.get<unsigned int>("baseDepth");
    auto& maxInitCount = context.get<unsigned int>("maxInitCount");

    auto& remainingTasks = context.get<int>("remainingTasks");
    remainingTasks = maxInitCount;

    for (auto& driver : virtualStealServerDrivers) {
        if (driver.desc.path == "/tasks:task/virtualStealServers:vss_0") {

            auto addrFirst = driver.initialize(maxInitCount);

            for (std::uint32_t i = 0; i < maxInitCount; ++i) {
                mem.write(addrFirst, task_task { .depth = i + baseDepth });
                addrFirst += sizeof(task_task);
            }
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

} /* namespace paper_exp1 */
