#ifndef FLEXITASK_MISC_HPP_INCLUDED
#define FLEXITASK_MISC_HPP_INCLUDED

#ifndef FLEXITASK_STRINGIZE
#    define FLEXITASK_STRINGIZE_DETAIL(x) #x
#    define FLEXITASK_STRINGIZE(x) FLEXITASK_STRINGIZE_DETAIL(x)
#endif

#ifndef FLEXITASK_UNUSED
#    define FLEXITASK_UNUSED(x) ((void)(x))
#endif

namespace flexitask {

namespace util {

/**
 * @brief Checks if a given number has a single bit set.
 * @note Useful for checking if a number is a valid alignment value.
 *
 * @return bool
 */
template<typename T>
constexpr bool has_single_bit(T t) noexcept {
    return t && !(t & (t - 1));
}

/**
 * @brief Aligns a given number to a given alignment.
 * @note Result is undefined if the alignment is not valid.
 *
 * @return T
 */
template<typename T>
constexpr T align(T t, T alignment) noexcept {
    T mask = alignment - 1;
    return (t & mask) ? (1 + (t | mask)) : t;
}

}

}

#endif /* FLEXITASK_MISC_HPP_INCLUDED */
