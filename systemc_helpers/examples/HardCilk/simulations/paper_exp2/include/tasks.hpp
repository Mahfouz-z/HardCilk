#ifndef HARDCILK_SIMULATION_PAPER_EXP3_TASKS_HPP_INCLUDED
#define HARDCILK_SIMULATION_PAPER_EXP3_TASKS_HPP_INCLUDED

#include <hardcilk/Defs.hpp>

namespace paper_exp2 {

struct task_task {
    std::uint32_t counter;
    std::uint32_t depth;
    hardcilk::addr_type return_address;
    std::uint64_t index;
    std::uint64_t padding;
};

struct data_0_to_1 {
    task_task cont_task;
    task_task new_task;
    hardcilk::addr_type return_address;
};

inline std::ostream& operator<<(std::ostream& os, const task_task&) {
    os << "task_task";
    return os;
}

inline std::ostream& operator<<(std::ostream& os, const data_0_to_1&) {
    os << "data_0_to_1";
    return os;
}

} /* namespace paper_exp3 */

#endif /* HARDCILK_SIMULATION_PAPER_EXP2_TASKS_HPP_INCLUDED */
