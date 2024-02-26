#include <fib_pe.hpp>
#include <fmt/core.h>

namespace fibonacci {

void fib_pe::loop() {
    auto task = taskIn.read<fib_task>();

    fmt::print("[{:>12}] [{}] received task: returnAddress = 0x{:08x}, n = {}\n", sc_core::sc_time_stamp().to_string(), name(), task.returnAddress, task.n);

    if (task.n < 2) {
        /* base case */

        /* send_argument */
        {
            mem.write(task.returnAddress, task.n);
            contOut_sum.write(task.returnAddress);
        }
    } else {
       flexitask::addr_type returnAddress1, returnAddress2;

        /* spawn_next */
        {
            flexitask::addr_type contAddress = addrIn_sum.read<flexitask::addr_type>();
            sum_task new_task {
                .counter = 2,
                .padding = 0,
                .returnAddress = task.returnAddress,
                .x = 0,
                .y = 0
            };
            mem.write(contAddress, new_task);
            returnAddress1 = contAddress + offsetof(sum_task, x);
            returnAddress2 = contAddress + offsetof(sum_task, y);
        }

        {
            /* spawn 1 */
            {
                fib_task new_task {
                    .returnAddress = returnAddress1,
                    .n = task.n - 1
                };
                taskOut.write(new_task);
                fmt::print("[{:>12}] [{}] created task: returnAddress = 0x{:08x}, n = {}\n", sc_core::sc_time_stamp().to_string(), name(), new_task.returnAddress, new_task.n);
            }

            /* spawn 2 */
            {
                fib_task new_task {
                    .returnAddress = returnAddress2,
                    .n = task.n - 2
                };
                taskOut.write(new_task);
                fmt::print("[{:>12}] [{}] created task: returnAddress = 0x{:08x}, n = {}\n", sc_core::sc_time_stamp().to_string(), name(), new_task.returnAddress, new_task.n);
            }
        }
    }
}

void fib_pe::thread() {
    wait(reset.negedge_event());

    while (true) {
        loop();
    }
}

} /* namespace fibonacci */
