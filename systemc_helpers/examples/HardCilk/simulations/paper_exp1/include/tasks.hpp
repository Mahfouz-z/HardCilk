#ifndef HARDCILK_SIMULATION_PAPER_EXP1_TASKS_HPP_INCLUDED
#define HARDCILK_SIMULATION_PAPER_EXP1_TASKS_HPP_INCLUDED

#include <hardcilk/Defs.hpp>
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

#endif /* HARDCILK_SIMULATION_PAPER_EXP1_TASKS_HPP_INCLUDED */
