#ifndef IPLIB_CMDQ_HAL_H_INCLUDED
#define IPLIB_CMDQ_HAL_H_INCLUDED

#include <stddef.h>
#include <stdint.h>

struct cmdq_config {
    size_t capacity;
    size_t size_msg;
};

enum cmdq_role {
    CMDQ_RECV,
    CMDQ_SEND
};

struct cmdq_instance {
    uintptr_t addr_control;
    uintptr_t addr_data;
    enum cmdq_role role;

    struct cmdq_config cfg;

    uintptr_t length;
    uintptr_t data_next;
};

void cmdq_create(
    struct cmdq_instance *inst,
    struct cmdq_config *cfg,
    uintptr_t addr_control,
    uintptr_t addr_data,
    enum cmdq_role role
);

typedef int cmdq_err_t;

void cmdq_destroy(struct cmdq_instance *inst);

uint32_t cmdq_length(struct cmdq_instance *inst);

int cmdq_full(struct cmdq_instance *inst);

void const volatile *cmdq_data(struct cmdq_instance *inst);

cmdq_err_t cmdq_append(struct cmdq_instance *inst, void *data);

void cmdq_clear(struct cmdq_instance *inst);

void cmdq_req(struct cmdq_instance *inst);

void cmdq_reqdone(struct cmdq_instance *inst);

int cmdq_checkreq(struct cmdq_instance *inst);

int cmdq_checkreqdone(struct cmdq_instance *inst);

#endif /* IPLIB_CMDQ_HAL_H_INCLUDED */
