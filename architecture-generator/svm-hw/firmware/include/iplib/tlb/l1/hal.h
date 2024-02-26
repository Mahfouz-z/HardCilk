#ifndef IPLIB_TLB_L1_HAL_H_INCLUDED
#define IPLIB_TLB_L1_HAL_H_INCLUDED

#include "defs.h"

#include <stddef.h>
#include <stdint.h>

struct tlb_l1_config
{
    uint32_t w_tagfrom;
    uint32_t w_tagto;
    uint32_t w_offset;

    uint32_t num_entries;
};

struct tlb_l1_instance
{
    uintptr_t addr_base;
    struct tlb_l1_config cfg;
};

struct tlb_l1_entry {
    int valid;
    uint64_t tagfrom;
    uint64_t tagto;
};

void tlb_l1_entry_encode(
    uint32_t w_offset,
    uint32_t *dest,
    struct tlb_l1_entry const *entry);
void tlb_l1_entry_decode(
    uint32_t w_offset,
    struct tlb_l1_entry *entry,
    uint32_t const *src);

void tlb_l1_create(
    struct tlb_l1_instance *inst,
    uintptr_t addr_base,
    struct tlb_l1_config const *cfg);
void tlb_l1_destroy(struct tlb_l1_instance *inst);

void tlb_l1_pause(struct tlb_l1_instance *inst);
void tlb_l1_resume(struct tlb_l1_instance *inst);
int tlb_l1_paused(struct tlb_l1_instance *inst);

void tlb_l1_modifylookup(struct tlb_l1_instance *inst, uint64_t tagfrom, struct tlb_l1_entry const *entry);
void tlb_l1_modifyindex(struct tlb_l1_instance *inst, uint32_t index, struct tlb_l1_entry const *entry);

void tlb_l1_invalidatelookup(struct tlb_l1_instance *inst, uint64_t tagfrom);
void tlb_l1_invalidateindex(struct tlb_l1_instance *inst, uint32_t index);

int tlb_l1_readlookup(struct tlb_l1_instance *inst, struct tlb_l1_entry *entry, uint64_t tagfrom);
int tlb_l1_readindex(struct tlb_l1_instance *inst, struct tlb_l1_entry *entry, uint32_t index);

void tlb_l1_add(struct tlb_l1_instance *inst, struct tlb_l1_entry const *entry);

int tlb_l1_fault(struct tlb_l1_instance *inst);
uint64_t tlb_l1_axiaddr(struct tlb_l1_instance *inst);

uint32_t tlb_l1_numoutstanding(struct tlb_l1_instance *inst);
void tlb_l1_wait(struct tlb_l1_instance *inst);

#endif /* IPLIB_TLB_L1_HAL_H_INCLUDED */
