#ifndef FLEXITASK_ABORT_HPP_INCLUDED
#define FLEXITASK_ABORT_HPP_INCLUDED

namespace flexitask {

void abort(const char* msg);

}

#define FLEXITASK_ABORT(msg) \
    flexitask::abort(msg " (from " __FILE__ ":" STRINGIZE(__LINE__) ")")

#endif /* FLEXITASK_ABORT_HPP_INCLUDED */
