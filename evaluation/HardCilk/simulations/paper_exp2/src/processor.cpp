#include <processor.hpp>
#include <tasks.hpp>

namespace paper_exp2 {

#define BASE_DEPTH 2
constexpr static std::size_t max_init_count = 8;

void Processor::setup() {
    auto& remainingTasks = context.get<int>("remainingTasks");    
    remainingTasks = 8;

    for (auto& driver : virtualContinuationAddressServerDrivers) {
        driver.initialize();
    }

    for (auto& driver : virtualStealServerDrivers) {
        if (driver.desc.path == "/tasks:task/virtualStealServers:vss_0") {
            
            auto base_return = allocator->allocate(sizeof(task_task), sizeof(task_task));
            mem.write32(base_return, 100000);

            auto addrFirst = driver.initialize(max_init_count);
            for (std::uint32_t i = 0; i < max_init_count; ++i) {
                mem.write(addrFirst, task_task { .counter = 0, .depth = i + BASE_DEPTH, .return_address =  base_return, .index = 0, .padding = 0});
                addrFirst += sizeof(task_task);
            }
        } else {
            driver.initialize(0);
        }
    }

    for (auto& driver : virtualStealServerDrivers)
        driver.resume();

    for (auto& driver : virtualContinuationAddressServerDrivers)
        driver.resume();
    
    auto &T_start = context.get<double>("T_start");
    T_start = sc_core::sc_time_stamp().to_seconds();
}

} /* namespace paper_exp2 */
