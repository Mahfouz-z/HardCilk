/**
 * @file test.h
 * @author Canberk Sönmez (canberk.sonmez.409@gmail.com)
 * @brief A simple test suite for embedded applications.
 * @date 2023-05-22
 * 
 * Copyright (c) Canberk Sönmez 2023
 * 
 */

#ifndef EMBEDTEST_TEST_H_INCLUDED
#define EMBEDTEST_TEST_H_INCLUDED

typedef int (*et_test_func_t)();

struct et_test_entry
{
    et_test_func_t fn;
    const char *name;
    struct et_test_entry *ptr;
};

#define ET_DECLARE_TEST(test_name) \
    static int test_name##_fn();

#define ET_IMPLEMENT_TEST(test_name) \
    static int test_name##_fn()

#define ET_DECLARE_TEST_SUITE(suite_name) \
    extern struct et_test_entry testsuite_##suite_name[];

#define ET_TEST_SUITE(suite_name) \
    struct et_test_entry testsuite_##suite_name[] = {

#define ET_ADD_TEST(test_name) \
    (struct et_test_entry){.fn = &test_name##_fn, .name = #test_name, .ptr = NULL},

#define ET_IMPORT_TEST_SUITE(suite_name) \
    (struct et_test_entry){.fn = NULL, .name = #suite_name, .ptr = testsuite_##suite_name},

#define ET_END_TEST_SUITE()                                    \
    (struct et_test_entry) { .fn = 0, .name = 0, .ptr = NULL } \
    }                                                          \
    ;

#define ET_TEST_SUCCESS 0
#define ET_TEST_FAILURE 1

void et_run_test_suite(struct et_test_entry *suite, const char *prefix);

#define ET_RUN_TEST_SUITE(suite_name) \
    et_run_test_suite(testsuite_##suite_name, #suite_name)

#endif /* EMBEDTEST_TEST_H_INCLUDED */
