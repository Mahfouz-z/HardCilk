#ifndef UTIL_FACTORY_HPP_INCLUDED
#define UTIL_FACTORY_HPP_INCLUDED

#include <string>
#include <typeindex>
#include <unordered_map>

namespace util {

namespace detail {

template<typename Base, typename T = void>
struct wrap;

template<typename Base, typename T, typename... Args>
struct wrap<Base, T(Args...)> {
    using identifier_type = void(Args...);

    static Base* create(Args... args) {
        return new T { std::forward<Args>(args)... };
    }
};

} /* sspace detail */

template<typename Base>
struct factory {
    template<typename T>
    void add(const std::string& s) {
        using wrap_type = detail::wrap<Base, T>;
        auto& wrapper = wrappers_[s];
        wrapper.type_index = typeid(typename wrap_type::identifier_type);
        wrapper.ptr = (void*)&wrap_type::create;
    }

    template<typename... Args>
    Base* create(const std::string& s, Args&&... args) const {
        std::type_index type_index = typeid(void(Args...));

        auto const& generator = wrappers_.at(s);

        if (generator.type_index != type_index)
            throw std::runtime_error("not matching type");

        auto* wrapper = (Base * (*)(Args...)) generator.ptr;
        return wrapper(std::forward<Args>(args)...);
    }

private:
    struct generator {
        std::type_index type_index { typeid(void) };
        void* ptr { nullptr };
    };

    std::unordered_map<std::string, generator> wrappers_;
};

} /* sspace util */

#endif /* UTIL_FACTORY_HPP_INCLUDED */
