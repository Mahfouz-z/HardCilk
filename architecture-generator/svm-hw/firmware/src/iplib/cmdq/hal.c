#include <string.h>

#include <xil_io.h>

#define CMDQ_PRINTF xil_printf

#define CMDQ_WARN(msg) CMDQ_PRINTF(           \
    "[ CMDQ ] [ WARN ] %s from %s @ %s:%d\n", \
    msg, __func__, __FILE__, __LINE__)
#define CMDQ_OUT32(addr, val) Xil_Out32((UINTPTR)(addr), (val))
#define CMDQ_IN32(addr) Xil_In32((UINTPTR)(addr))

// TODO provide a version that operates on volatile data
// For example, that performs cache flushes etc.
#define CMDQ_MEMCPY(dest, src, n) memcpy((void *)(dest), (void const *)(src), (n))

#include <iplib/cmdq/hal.h>
#include <iplib/cmdq/defs.h>

#define CMDQ_WRREG(offset, val) \
    CMDQ_OUT32(inst->addr_control + (offset), (uint32_t)(val))

#define CMDQ_RDREG(offset) \
    CMDQ_IN32(inst->addr_control + (offset))

#define CMDQ_ASSERT_SEND(label)                         \
    if (inst->role != CMDQ_SEND)                        \
    {                                                   \
        CMDQ_WARN("must be called from a send queue."); \
        goto label;                                     \
    }

#define CMDQ_ASSERT_RECV(label)                            \
    if (inst->role != CMDQ_RECV)                           \
    {                                                      \
        CMDQ_WARN("must be called from a receive queue."); \
        goto label;                                        \
    }

void cmdq_create(
    struct cmdq_instance *inst,
    struct cmdq_config *cfg,
    uintptr_t addr_control,
    uintptr_t addr_data,
    enum cmdq_role role)
{
    memcpy(&inst->cfg, cfg, sizeof(struct cmdq_config));
    inst->addr_control = addr_control;
    inst->addr_data = addr_data;
    inst->role = role;

    inst->length = 0;
    inst->data_next = addr_data;

    CMDQ_WRREG(CMDQ_OFFSET_LENGTH, 0);
    CMDQ_WRREG(CMDQ_OFFSET_REQ, 0);
    CMDQ_WRREG(CMDQ_OFFSET_REQDONE, 0);
}

void cmdq_destroy(struct cmdq_instance *inst)
{
    // do nothing
    // TODO find a graceful way of terminating this
}

uint32_t cmdq_length(struct cmdq_instance *inst)
{
    return inst->length;
}

int cmdq_full(struct cmdq_instance *inst)
{
    return inst->length >= inst->cfg.capacity;
}

void const volatile *cmdq_data(struct cmdq_instance *inst)
{
    return (void const volatile *)inst->addr_data;
}

cmdq_err_t cmdq_append(struct cmdq_instance *inst, void *data)
{
    if (cmdq_full(inst))
        return -1;

    CMDQ_MEMCPY(inst->data_next, data, inst->cfg.size_msg);

    inst->length += 1;
    inst->data_next += inst->cfg.size_msg;

    return 0;
}

void cmdq_clear(struct cmdq_instance *inst)
{
    inst->length = 0;
    inst->data_next = 0;
}

void cmdq_req(struct cmdq_instance *inst)
{
    CMDQ_ASSERT_SEND(fail);

    inst->data_next = inst->addr_data;

    CMDQ_WRREG(CMDQ_OFFSET_LENGTH, inst->length);
    CMDQ_WRREG(CMDQ_OFFSET_REQ, 1);

    cmdq_clear(inst);

fail:
}

void cmdq_reqdone(struct cmdq_instance *inst)
{
    CMDQ_ASSERT_RECV(fail);

    CMDQ_WRREG(CMDQ_OFFSET_REQDONE, 1);

fail:
}

int cmdq_checkreq(struct cmdq_instance *inst)
{
    CMDQ_ASSERT_RECV(fail);

    if (CMDQ_RDREG(CMDQ_OFFSET_REQ))
    {
        inst->length = CMDQ_RDREG(CMDQ_OFFSET_LENGTH);
        return 1;
    }
    return 0;

fail:
    return 0;
}

int cmdq_checkreqdone(struct cmdq_instance *inst)
{
    CMDQ_ASSERT_SEND(fail);

    if (CMDQ_RDREG(CMDQ_OFFSET_REQDONE))
    {
        CMDQ_WRREG(CMDQ_OFFSET_REQDONE, 0);
        return 1;
    }

    return 0;

fail:
    return 0;
}
