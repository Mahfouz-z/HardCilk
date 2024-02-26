#ifndef FLEXITASK_SIMULATION_PAPER_EXP3_TASKS_HPP_INCLUDED
#define FLEXITASK_SIMULATION_PAPER_EXP3_TASKS_HPP_INCLUDED

#include <flexitask/Defs.hpp>

namespace paper_exp3{

struct task_task1Exp3 {
    std::uint32_t depth;
};

struct task_task2Exp3 {
    std::uint32_t delay;
};

inline std::ostream& operator<<(std::ostream& os, const task_task1Exp3&) {
    os << "task_task1Exp3";
    return os;
}

inline std::ostream& operator<<(std::ostream& os, const task_task2Exp3&) {
    os << "task_task2Exp3";
    return os;
}

} /* namespace paper_exp3 */

#endif /* FLEXITASK_SIMULATION_PAPER_EXP3_TASKS_HPP_INCLUDED */
