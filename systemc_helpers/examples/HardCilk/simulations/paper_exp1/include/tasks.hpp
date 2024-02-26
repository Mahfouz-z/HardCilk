#ifndef FLEXITASK_SIMULATION_PAPER_EXP1_TASKS_HPP_INCLUDED
#define FLEXITASK_SIMULATION_PAPER_EXP1_TASKS_HPP_INCLUDED

#include <flexitask/Defs.hpp>
#include <ios>

namespace paper_exp1{

struct task_task {
    std::uint32_t depth;
};



inline std::ostream &operator<<(std::ostream &os, const task_task &) {
    os << "task_task";
    return os;
}


} /* namespace paper_exp1 */

#endif /* FLEXITASK_SIMULATION_PAPER_EXP1_TASKS_HPP_INCLUDED */
