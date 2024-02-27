#include <hardcilk/PerfFigures.hpp>
#include <fmt/format.h>

namespace hardcilk {

PerfFigures PerfFigures::calculate(
    double T1,
    double T_start,
    double T_end,
    unsigned int peCount
) noexcept {
    double T_measured = T_end - T_start;
    double T_ideal = T1 / peCount;
    double speedup = T1 / T_measured;

    return {
        .T1 = T1,
        .T_start = T_start,
        .T_end = T_end,
        .peCount = peCount,
        .T_measured = T_measured,
        .T_ideal = T_ideal,
        .efficiency = T_measured / T_ideal,
        .speedup = speedup
    };
}

std::ostream& operator<<(std::ostream& os, PerfFigures const& perfFigures) {
    os << fmt::format(
        "T1 = {:.9f}, T_ideal[{}] = {:.9f}, T[{}] = {:.9f}, Efficiency = {:.2f}, speedUp = {:.2f}",
        perfFigures.T1,
        perfFigures.peCount,
        perfFigures.T_ideal,
        perfFigures.peCount,
        perfFigures.T_measured,
        perfFigures.efficiency,
        perfFigures.speedup
    );

    return os;
}

} /* namespace hardcilk */
