#ifndef HARDCILK_SIMULATION_PAPER_EXP_DAE_0_TASKS_HPP_INCLUDED
#define HARDCILK_SIMULATION_PAPER_EXP_DAE_0_TASKS_HPP_INCLUDED

#include <hardcilk/Defs.hpp>
#include <hardcilk/Graph.hpp>

#include <fmt/format.h>
#include <sstream>

#define HARDCILK_DECLARE_STR() \
    std::string str() const;

#define HARDCILK_DEFINE_STR(type)          \
    inline std::string type ::str() const { \
        std::ostringstream oss;             \
        oss << *this;                       \
        return oss.str();                   \
    }

namespace paper_exp_dae_0 {

using hardcilk::graph::node;

struct task_access {
    node* n_ptr;

    HARDCILK_DECLARE_STR();
};

struct task_execute {
    node* n_ptr;

    HARDCILK_DECLARE_STR();
};

/* SystemC FIFO requires following operators. */

inline std::ostream& operator<<(std::ostream& os, task_access const& access) {
    os << fmt::format("task_access(n = 0x{:08x} [{}])", (std::uint64_t)access.n_ptr, access.n_ptr->str());
    return os;
}

HARDCILK_DEFINE_STR(task_access);

inline std::ostream& operator<<(std::ostream& os, task_execute const& execute) {
    os << fmt::format("task_execute(n = 0x{:08x} [{}])", (std::uint64_t)execute.n_ptr, execute.n_ptr->str());
    return os;
}

HARDCILK_DEFINE_STR(task_execute);

} /* namespace paper_exp_dae_0 */

#endif /* HARDCILK_SIMULATION_PAPER_EXP_DAE_0_TASKS_HPP_INCLUDED */
