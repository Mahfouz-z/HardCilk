#include <processor.hpp>
#include <tasks.hpp>

namespace paper_exp3 {

#define BASE_DEPTH 2
constexpr static std::size_t max_init_count = 8;

void Processor::setup() {
    auto &remainingTasks = context.get<int>("remainingTasks");
    auto &maxInitCount = context.get<unsigned int>("maxInitCount");
    auto &baseDepth = context.get<unsigned int>("baseDepth");

    remainingTasks = max_init_count;

    for (auto& driver : virtualStealServerDrivers) {
        
        if (driver.desc.path == "/tasks:task1Exp3/virtualStealServers:vss_0") {

            auto addrFirst = driver.initialize(max_init_count);

            for (std::uint32_t i = 0; i < max_init_count; ++i) {
                mem.write(addrFirst, task_task1Exp3 {.depth = i + baseDepth});
                addrFirst += sizeof(task_task1Exp3);
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
    
    
    auto &T_start = context.get<double>("T_start");
    T_start = sc_core::sc_time_stamp().to_seconds();
}

} /* namespace paper_exp3 */
