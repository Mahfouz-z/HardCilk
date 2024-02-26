#include <embedtest/test.h>

#include <stddef.h>

/// @note Increase this limit if there are more than 16
/// nested tests.
#define MAX_DEPTH   16

static
long count_tests(struct et_test_entry *suite) {
    struct et_test_entry *stack[MAX_DEPTH];
    unsigned last;
    unsigned result = 0;

    stack[0] = suite;
    last = 0;

    while (1) {
        if (stack[last]->name == NULL) {
            if (last == 0)
                break;
            else
                --last;
        } else {
            if (stack[last]->ptr != NULL) {
                ++last;

                if (last == MAX_DEPTH)
                    return -1;

                stack[last] = stack[last - 1]->ptr;
                ++stack[last - 1];
            } else {
                ++result;
                ++stack[last];
            }
        }
    }

    return result;
}

static
void print_test_name(struct et_test_entry *stack [], unsigned last, const char *prefix) {
    ET_PRINTF("%s", prefix);

    for (unsigned i = 0; i <= last; ++i) {
        ET_PRINTF("/%s", stack[i]->name);
    }
}

void et_run_test_suite(struct et_test_entry *suite, const char *prefix) {
    struct et_test_entry *stack[MAX_DEPTH];
    long num_tests;
    unsigned last, current;

    if ((num_tests = count_tests(suite)) < 0) {
        ET_PRINTF("[ERROR] count_tests(suite) < 0\r\n");
        return;
    }

    if (prefix == NULL)
        prefix = ".";

    ET_PRINTF("Running tests...\r\n");

    stack[0] = suite;
    current = 1;
    last = 0;

    while (1) {
        if (stack[last]->name == NULL) {
            if (last == 0) {
                ET_PRINTF("Done.\r\n");
                break ;
            }
            else {
                --last;
                ++stack[last]; // skip the element with ptr != NULL
            }
        } else {
            if (stack[last]->ptr != NULL) {
                stack[last + 1] = stack[last]->ptr;
                ++last;
            } else {
                ET_PRINTF("[ %3d / %3d ] ", current, num_tests);
                print_test_name(stack, last, prefix);
                ET_PRINTF("\r\n");

                int ret = stack[last]->fn();

                if (ret != ET_TEST_SUCCESS) {
                    ET_PRINTF("[ %3d / %3d ] ", current, num_tests);
                    print_test_name(stack, last, prefix);
                    ET_PRINTF(" FAILED with %d!\r\n", ret);
                }

                ++current;
                ++stack[last];
            }
        }
    }
}
