#ifndef FLEXITASK_UTILS_HPP_INCLUDED
#define FLEXITASK_UTILS_HPP_INCLUDED

#include <ios>
#include <sstream>

#include <flexitask/Context.hpp>

namespace flexitask {

struct PerfFigures;

std::ostream& operator<<(std::ostream& os, PerfFigures const& perfFigures);

struct PerfFigures {
    const double T1;
    const double T_start;
    const double T_end;
    const unsigned int peCount;

    const double T_measured;
    const double T_ideal;
    const double efficiency;
    const double speedup;

    std::string str() const {
        std::ostringstream oss;
        oss << (*this);
        return oss.str();
    }

    /**
     * @brief Calculates the performance figures from the given measurements.
     *
     * @param T1
     * @param T_start
     * @param T_end
     * @param peCount
     * @return PerfFigures
     */
    static PerfFigures calculate(
        double T1,
        double T_start,
        double T_end,
        unsigned int peCount
    ) noexcept;
};

} /* namespace flexitask */

#endif /* FLEXITASK_UTILS_HPP_INCLUDED */
