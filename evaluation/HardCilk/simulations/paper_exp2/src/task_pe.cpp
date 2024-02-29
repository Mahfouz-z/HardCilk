#include <atomic>
#include <fmt/core.h>
#include <task_pe.hpp>

#define LOG(format, ...) \
    fmt::print("[{:>12}] [{}] [{}] " format "\n", sc_core::sc_time_stamp().to_string(), name(), __PRETTY_FUNCTION__ __VA_OPT__(, ) __VA_ARGS__)

namespace paper_exp2 {

void task_pe::thread0() {
    /* auto & is important, otherwise you decrement a copy of the variable! */
    auto& clockPeriod_ns = context.get<unsigned int>("clockPeriod_ns");

    auto& branchFactor = context.get<unsigned int>("branchFactor");
    auto& serialTasks = context.get<unsigned int>("serialTasks");

    auto& T1 = context.get<double>("T1");
    auto& delayCycles = context.get<unsigned int>("delayCycles");
    auto& remainingTasks = context.get<int>("remainingTasks");

    auto& logCounterPeriod = context.get<unsigned int>("logCounterPeriod");
    auto& nodesProcessed = context.get<unsigned int>("nodesProcessed");

    while (true) {
        auto task = taskIn.read<task_task>();

        logCounter_ = (logCounter_ + 1) % logCounterPeriod;

        if (logCounter_ == 0)
            LOG("received task: depth = {}, delay = {}, index = {}, nodes processed = {}", task.depth, delayCycles, task.index, nodesProcessed);

        if (task.depth != 0) {
            bool continuation = false;
            for (std::uint32_t i = task.index; i < branchFactor; ++i) {
                wait(sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS));
                if (i < serialTasks) {
                    continuation = true;
                    remainingTasks += 2;
                    T1 += sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS).to_seconds();

                    auto address = addrIn_task.read<hardcilk::addr_type>();
                    auto cont_task = task_task { .counter = 1, .depth = task.depth, .return_address = task.return_address, .index = i + 1, .padding = 0 };
                    auto new_task = task_task { .counter = 0, .depth = task.depth - 1, .return_address = address, .index = 0, .padding = 0 };

                    fifo_0_to_1.write(data_0_to_1 { .cont_task = cont_task, .new_task = new_task, .return_address = address });
                    break; // essential for correct execution
                } else {
                    remainingTasks += 1;
                    T1 += sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS).to_seconds();
                    auto new_task = task_task { .counter = 0, .depth = task.depth - 1, .return_address = 0x0, .index = 0, .padding = 0 };

                    fifo_0_to_2.write(new_task);
                }
            }

            if (!continuation) {
                remainingTasks -= 1;
                nodesProcessed += 1;
                if (task.return_address != 0x0) {
                    contOut_task.write(task.return_address);
                }
            }
        } else {
            wait(sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS));
            T1 += sc_core::sc_time(clockPeriod_ns * delayCycles, sc_core::SC_NS).to_seconds();
            nodesProcessed += 1;
            if (task.return_address != 0x0) {
                contOut_task.write(task.return_address);
            }
            remainingTasks -= 1;
        }

        if (remainingTasks == 0) {
            auto& T_end = context.get<double>("T_end");
            T_end = sc_core::sc_time_stamp().to_seconds();
            LOG("remainingTasks == 0: processed nodes: {}", nodesProcessed);
        }
    }
}

void task_pe::thread1() {
    while (true) {
        auto data = fifo_0_to_1.read();
        mem.write(data.return_address, data.cont_task);
        fifo_1_to_2.write(data.new_task);
    }
}

void task_pe::thread2() {
    auto& remainingTasks = context.get<int>("remainingTasks");
    auto& nodesProcessed = context.get<unsigned int>("nodesProcessed");

    while (true) {
        while (fifo_1_to_2.num_available() == 0 && fifo_0_to_2.num_available() == 0)
            wait(fifo_1_to_2.data_written_event() | fifo_0_to_2.data_written_event());

        task_task task;

        if (fifo_1_to_2.nb_read(task)) {
            taskOut.write(task);
            remainingTasks -= 1;

            if (remainingTasks == 0) {
                auto& T_end = context.get<double>("T_end");
                T_end = sc_core::sc_time_stamp().to_seconds();
                LOG("remainingTasks == 0: processed nodes = {}", nodesProcessed);
            }
        }

        if (fifo_0_to_2.nb_read(task)) {
            taskOut.write(task);
        }
    }
}

} /* namespace paper_exp2 */

// #include <task_pe.hpp>
// #include <fmt/core.h>

// #define LOG(format, ...) \
//     fmt::print("[{:>12}] [{}] [{}] " format "\n", \
//     sc_core::sc_time_stamp().to_string(), \
//     name(), \
//     __PRETTY_FUNCTION__ \
//     __VA_OPT__(,) __VA_ARGS__)

// double mem_time = 0;

// namespace paper_exp2 {

// #define BRANCH_FACTOR 6
// #define SERIAL_TASKS 2
// #define delayCycles 16
// #define PERIOD 2 // nano seconds

// int log_counter = 0;
// int total_tasks_processed = 0;
// int total_tasks_generated = 0;
// int continuation_allocated = 0;
// int nodesProcessed = 0;

// std::mutex sharedVarsMutex;

// void task_pe::loop() {
//     int *remainingTasks = context.get<int *>("remainingTasks");
//     int *T1 = context.get<int *>("T1");

//     while(!taskInMutex.try_lock()) wait(clock.posedge_event());
//     auto task = taskIn.read<task_task>();
//     taskInMutex.unlock();

//     //sharedVarsMutex.lock();
//         total_tasks_processed += 1;
//         log_counter += 1;
//         if(log_counter % 1 == 0)
//             LOG("received task: depth = {}, index = {}, remainingTasks = {}, tasks generated = {}, tasks processed = {}, cont allocated = {}, nodes processed = {}",
//             task.depth, task.index, *remainingTasks, total_tasks_generated, total_tasks_processed, continuation_allocated, nodesProcessed);
//     //sharedVarsMutex.unlock();

//     if(task.depth != 0) {
//         bool continuation = false;
//         for (std::uint32_t i = task.index; i < BRANCH_FACTOR; ++i) {
//             /*for (int j = 0; j < delayCycles; ++j)
//                 wait(clock.posedge_event());*/
//             wait(sc_core::sc_time (PERIOD*delayCycles, sc_core::SC_NS));

//             if(i < SERIAL_TASKS) {
//                 continuation = true;

//                 while(!memMutex.try_lock()) wait(clock.posedge_event());

//                     continuation_allocated += 1;
//                     total_tasks_generated += 2;
//                     (*remainingTasks) += 2;
//                     *T1 += (delayCycles + 2);

//                     auto address = addrIn_task.read<hardcilk::addr_type>();
//                     auto cont_task = task_task {.counter = 1, .depth = task.depth , .return_address =  task.return_address, .index = i + 1, .padding = 0};
//                     auto t_now = sc_core::sc_time_stamp().to_seconds();
//                     mem.write(address, cont_task);
//                     mem_time += sc_core::sc_time_stamp().to_seconds() - t_now;
//                 memMutex.unlock();

//                 // Create the serial spawned task
//                 while (!taskOutMutex.try_lock()) wait(clock.posedge_event());
//                     auto new_task = task_task{ .counter = 0, .depth = task.depth - 1, .return_address =  address, .index = 0, .padding = 0};
//                     taskOut.write(new_task);
//                 taskOutMutex.unlock();

//                 break; // essential for correct execution

//             } else {
//                 while (!taskOutMutex.try_lock()) wait(clock.posedge_event());

//                     total_tasks_generated += 1;
//                     ++(*remainingTasks);
//                     *T1 += (delayCycles + 1);
//                     auto new_task = task_task{ .counter = 0, .depth = task.depth - 1, .return_address =  0x0, .index = 0, .padding = 0};
//                     taskOut.write(new_task);

//                 taskOutMutex.unlock();
//             }
//         }

//         if(!continuation){
//             while(!contOutMutex.try_lock()) wait(clock.posedge_event());
//             nodesProcessed += 1;

//             if(task.return_address != 0x0){
//                     *T1 += 1;
//                     contOut_task.write(task.return_address);

//             }
//             contOutMutex.unlock();
//         }

//     } else {
//         /*for (int j = 0; j < delayCycles; ++j)
//             wait(clock.posedge_event());*/
//         wait(sc_core::sc_time (PERIOD*delayCycles, sc_core::SC_NS));

//         while(!contOutMutex.try_lock()) wait(clock.posedge_event());
//         *T1 += (delayCycles);
//         nodesProcessed += 1;

//         if(task.return_address != 0x0){
//             *T1 += 1;
//             contOut_task.write(task.return_address);
//         }
//         contOutMutex.unlock();

//     }

//     --(*remainingTasks);
//     if(*remainingTasks == 0){
//         double * T_end = context.get<double *>("T_end");
//         *T_end = sc_core::sc_time_stamp().to_seconds();
//         std::cout << "processed_nodes: " << nodesProcessed << "\n";
//     }
// }

// void task_pe::thread0() {
//     while (true) {
//         loop();
//     }
// }
// void task_pe::thread1() {
//     while (true) {
//         loop();
//     }
// }

// } /* namespace paper_exp2 */
