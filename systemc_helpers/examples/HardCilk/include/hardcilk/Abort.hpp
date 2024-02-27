#ifndef HARDCILK_ABORT_HPP_INCLUDED
#define HARDCILK_ABORT_HPP_INCLUDED

namespace hardcilk {

void abort(const char* msg);

}

#define HARDCILK_ABORT(msg) \
    hardcilk::abort(msg " (from " __FILE__ ":" STRINGIZE(__LINE__) ")")

#endif /* HARDCILK_ABORT_HPP_INCLUDED */
