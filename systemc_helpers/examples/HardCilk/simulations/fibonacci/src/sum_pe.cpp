#include <sum_pe.hpp>

#include <fmt/core.h>

namespace fibonacci {

void sum_pe::loop() {
    auto task = taskIn.read<sum_task>();

    /* send_argument */
    {
        mem.write64(task.returnAddress, task.x + task.y);
        contOut_sum.write(task.returnAddress);
        fmt::print("[{:>12}] [{}] received task: returnAddress = 0x{:08x}, x = {}, y = {}\n", sc_core::sc_time_stamp().to_string(), name(), task.returnAddress, task.x, task.y);
    }
}

void sum_pe::thread() {
    wait(reset.negedge_event());

    while (true) {
        loop();
    }
}

} /* namespace fibonacci */
