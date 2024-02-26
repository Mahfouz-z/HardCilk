#ifndef FLEXITASK_CONTEXT_HPP_INCLUDED
#define FLEXITASK_CONTEXT_HPP_INCLUDED

#include <any>
#include <fmt/core.h>
#include <stdexcept>
#include <string>
#include <unordered_map>

namespace flexitask {

/**
 * @brief Context class is used to pass information between the components
 * of the simulation.
 */
struct Context {

    template<typename T>
    T &set(const std::string& s, const T& t) {
        auto it = map_.find(s);
        if (it != map_.end())
            throw std::runtime_error(
                fmt::format("[Context::set] already set: {}", s)
            );

        return std::any_cast<T&>(map_[s] = t);
    }

    template<typename T>
    T& get(const std::string& s) {
        auto it = map_.find(s);
        if (it == map_.end())
            throw std::runtime_error(
                fmt::format("[Context::get] not found: {}", s)
            );

        try {
            return std::any_cast<T&>(it->second);
        } catch (std::bad_cast& e) {
            throw std::runtime_error(
                fmt::format("[Context::get] bad type: {}", s)
            );
        }
    }

    template<typename T>
    T const& get(const std::string& s) const {
        auto it = map_.find(s);
        if (it == map_.end())
            throw std::runtime_error(
                fmt::format("[Context::get] not found: {}", s)
            );

        try {
            return std::any_cast<T const&>(it->second);
        } catch (std::bad_cast& e) {
            throw std::runtime_error(
                fmt::format("[Context::get] bad type: {}", s)
            );
        }
    }

private:
    std::unordered_map<std::string, std::any> map_;
};

} /* namespace flexitask */

#endif /* FLEXITASK_CONTEXT_HPP_INCLUDED */
