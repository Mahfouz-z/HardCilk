#include <iplib/tlb/l1/hal.h>

#include <string.h>

#define TLB_L1_WRREG(offset, val) \
    TLB_L1_OUT32(inst->addr_base + (offset), (uint32_t)(val))

#define TLB_L1_RDREG(offset) \
    TLB_L1_IN32(inst->addr_base + (offset))

static void write_addr(uint32_t *dest, uint64_t addr)
{
    TLB_L1_OUT32(dest, (uint32_t)(addr & ((((uint64_t)1) << 32) - 1)));
    TLB_L1_OUT32(dest + 1, (uint32_t)(addr >> 32));
}

static uint64_t read_addr(uint32_t const *src)
{
    uint64_t lower = TLB_L1_IN32(src + 0);
    uint64_t higher = TLB_L1_IN32(src + 1);

    return (higher << 32) | lower;
}

void tlb_l1_entry_encode(
    uint32_t w_offset,
    uint32_t *dest,
    struct tlb_l1_entry const *entry)
{
    uint64_t lower = //
                     // from
        entry->tagto << w_offset;
    uint64_t higher = //
                      // valid bit
        ((entry->valid ? ((uint64_t)1) : ((uint64_t)0)) << 62) |
        // to
        (entry->tagfrom << w_offset);

    // TODO define macros for making masks, would be nicer
    uint32_t lower0 = (uint32_t)(lower & ((((uint64_t)1) << 32) - 1));
    uint32_t lower1 = (uint32_t)(lower >> 32);
    uint32_t higher0 = (uint32_t)(higher & ((((uint64_t)1) << 32) - 1));
    uint32_t higher1 = (uint32_t)(higher >> 32);

    TLB_L1_OUT32(dest + 0, lower0);
    TLB_L1_OUT32(dest + 1, lower1);
    TLB_L1_OUT32(dest + 2, higher0);
    TLB_L1_OUT32(dest + 3, higher1);
}

void tlb_l1_entry_decode(
    uint32_t w_offset,
    struct tlb_l1_entry *entry,
    uint32_t const *src)
{
    uint64_t lower0 = TLB_L1_IN32(src + 0);
    uint64_t lower1 = TLB_L1_IN32(src + 1);
    uint64_t higher0 = TLB_L1_IN32(src + 2);
    uint64_t higher1 = TLB_L1_IN32(src + 3);

    uint64_t lower = lower0 | (lower1 << 32);
    uint64_t higher = higher0 | (higher1 << 32);

    entry->valid = !!(higher & (((uint64_t)1) << 62));
    entry->tagfrom = (higher & ((((uint64_t)1) << 56) - 1)) >> w_offset;
    entry->tagto = (lower & ((((uint64_t)1) << 56) - 1)) >> w_offset;
}

#define TLB_L1_WRADDR(offset, addr) \
    write_addr((uint32_t *)(inst->addr_base + (offset)), addr)

#define TLB_L1_RDADDR(offset) \
    read_addr((uint32_t const *)(inst->addr_base + (offset)))

#define TLB_L1_WRENTRY(offset, entry)             \
    tlb_l1_entry_encode(                          \
        inst->cfg.w_offset,                       \
        (uint32_t *)(inst->addr_base + (offset)), \
        (entry))

#define TLB_L1_RDENTRY(offset, entry) \
    tlb_l1_entry_decode(              \
        inst->cfg.w_offset,           \
        (entry),                      \
        (uint32_t const *)(inst->addr_base + (offset)))

#define TLB_L1_CMD(command) \
    TLB_L1_WRREG(TLB_L1_OFFSET_COMMAND, (command))

void tlb_l1_create(
    struct tlb_l1_instance *inst,
    uintptr_t addr_base,
    struct tlb_l1_config const *cfg)
{
    inst->addr_base = addr_base;
    memcpy(&inst->cfg, cfg, sizeof(struct tlb_l1_config));
}

void tlb_l1_destroy(struct tlb_l1_instance *inst)
{
    // does nothing
}

void tlb_l1_pause(struct tlb_l1_instance *inst)
{
    TLB_L1_WRREG(TLB_L1_OFFSET_PAUSE, 1);
}

void tlb_l1_resume(struct tlb_l1_instance *inst)
{
    TLB_L1_WRREG(TLB_L1_OFFSET_PAUSE, 0);
}

int tlb_l1_paused(struct tlb_l1_instance *inst)
{
    return (int)TLB_L1_RDREG(TLB_L1_OFFSET_PAUSE);
}

void tlb_l1_modifylookup(struct tlb_l1_instance *inst, uint64_t tagfrom, struct tlb_l1_entry const *entry)
{
    TLB_L1_WRREG(TLB_L1_OFFSET_LOOKUP_MODE, TLB_L1_LOOKUP_USER);
    TLB_L1_WRADDR(TLB_L1_OFFSET_LOOKUP_ADDR_0, (tagfrom << inst->cfg.w_offset));
    TLB_L1_WRENTRY(TLB_L1_OFFSET_WRENTRY_0, entry);
    TLB_L1_CMD(TLB_L1_CMD_MODIFY_LOOKUP);
    TLB_L1_WRREG(TLB_L1_OFFSET_LOOKUP_MODE, TLB_L1_LOOKUP_AXI_ADDR);
}

void tlb_l1_modifyindex(struct tlb_l1_instance *inst, uint32_t index, struct tlb_l1_entry const *entry)
{
    TLB_L1_WRENTRY(TLB_L1_OFFSET_WRENTRY_0, entry);
    TLB_L1_CMD(TLB_L1_CMD_MODIFY_INDEX);
}

static struct tlb_l1_entry invalid_entry = { .valid = 0, .tagfrom = 0, .tagto = 0 };

void tlb_l1_invalidatelookup(struct tlb_l1_instance *inst, uint64_t tagfrom)
{
    tlb_l1_modifylookup(inst, tagfrom, &invalid_entry);
}

void tlb_l1_invalidateindex(struct tlb_l1_instance *inst, uint32_t index)
{
    tlb_l1_modifyindex(inst, index, &invalid_entry);
}

int tlb_l1_readlookup(struct tlb_l1_instance *inst, struct tlb_l1_entry *entry, uint64_t tagfrom)
{
    int result = 0;

    TLB_L1_WRREG(TLB_L1_OFFSET_LOOKUP_MODE, TLB_L1_LOOKUP_USER);
    TLB_L1_WRADDR(TLB_L1_OFFSET_LOOKUP_ADDR_0, (tagfrom << inst->cfg.w_offset));
    result = TLB_L1_RDREG(TLB_L1_OFFSET_LOOKUP_FOUND);

    if (result)
        TLB_L1_RDENTRY(TLB_L1_OFFSET_LOOKUP_ENTRY_0, entry);

    TLB_L1_WRREG(TLB_L1_OFFSET_LOOKUP_MODE, TLB_L1_LOOKUP_AXI_ADDR);

    return result;
}

int tlb_l1_readindex(struct tlb_l1_instance *inst, struct tlb_l1_entry *entry, uint32_t index)
{
    if (index >= inst->cfg.num_entries)
        return 0;

    TLB_L1_WRREG(TLB_L1_OFFSET_RDINDEX, index);
    TLB_L1_RDENTRY(TLB_L1_OFFSET_RDENTRY_0, entry);

    return 1;
}

void tlb_l1_add(struct tlb_l1_instance *inst, struct tlb_l1_entry const *entry)
{
    TLB_L1_WRENTRY(TLB_L1_OFFSET_WRENTRY_0, entry);
    TLB_L1_CMD(TLB_L1_CMD_ADD);
}

int tlb_l1_fault(struct tlb_l1_instance *inst)
{
    // fault happens if (1) in AXI-translation mode, (2) lookup not found
    return !((int)TLB_L1_RDREG(TLB_L1_OFFSET_LOOKUP_FOUND));
}

uint64_t tlb_l1_axiaddr(struct tlb_l1_instance *inst)
{
    return TLB_L1_RDADDR(TLB_L1_OFFSET_AXI_ADDR_0);
}

uint32_t tlb_l1_numoutstanding(struct tlb_l1_instance *inst)
{
    return TLB_L1_RDREG(TLB_L1_OFFSET_NUM_OUTSTANDING);
}

void tlb_l1_wait(struct tlb_l1_instance *inst)
{
    TLB_L1_RDREG(TLB_L1_OFFSET_WAITLOCK);
}
