#include "../utils.h"

#include "../platform_config.h"

#include <embedtest/test.h>
#include <string.h>
#include <xil_printf.h>

#include <iplib/tlb/l1/hal.h>

extern struct tlb_l1_instance tlb_l1_read;
extern struct tlb_l1_instance tlb_l1_write;

ET_IMPLEMENT_TEST(read) {
    uint32_t w_offset = tlb_l1_read.cfg.w_offset;

    struct tlb_l1_entry entry;

    unsigned len = 128;

    uint32_t mem_addr = (uintptr_t) MEM_BASE + 512 + (1 << w_offset);
    uint32_t tlb_addr = (uintptr_t) TRANSLATED_BASE + 512 + (1 << w_offset);

    // add a TLB entry
    entry.valid = 1;
    entry.tagfrom = tlb_addr >> w_offset;
    entry.tagto = mem_addr >> w_offset;

    tlb_l1_pause(&tlb_l1_read);
    tlb_l1_modifyindex(&tlb_l1_read, 0, &entry);
    tlb_l1_resume(&tlb_l1_read);

    struct tlb_l1_entry entry2;

    tlb_l1_pause(&tlb_l1_read);
    tlb_l1_readindex(&tlb_l1_read, &entry2, 0);
    tlb_l1_resume(&tlb_l1_read);

    fill_pattern((char *) mem_addr, len);
    if (!compare_memory((char *) mem_addr, (char *) tlb_addr, len))
        return ET_TEST_FAILURE;

    // clear the TLB state
    tlb_l1_pause(&tlb_l1_read);
    tlb_l1_invalidateindex(&tlb_l1_read, 0);
    tlb_l1_resume(&tlb_l1_read);

    return ET_TEST_SUCCESS;
}

ET_IMPLEMENT_TEST(write) {
    uint32_t w_offset = tlb_l1_write.cfg.w_offset;

    struct tlb_l1_entry entry;

    unsigned len = 128;
    unsigned offset1 = 512;
    unsigned offset2 = 1024;

    uint32_t mem_addr_src = (uintptr_t) MEM_BASE + offset1;
    uint32_t mem_addr_dest = (uintptr_t) MEM_BASE + offset2;
    uint32_t tlb_addr_dest = (uintptr_t) TRANSLATED_BASE + offset2;

    // add a TLB entry
    entry.valid = 1;
    entry.tagfrom = tlb_addr_dest >> w_offset;
    entry.tagto = mem_addr_dest >> w_offset;

    tlb_l1_pause(&tlb_l1_write);
    tlb_l1_add(&tlb_l1_write, &entry);
    tlb_l1_resume(&tlb_l1_write);

    fill_pattern((char *) mem_addr_src, len);
    memcpy((char *) tlb_addr_dest, (char *) mem_addr_src, len);
    if (!compare_memory((char *) mem_addr_src, (char *) mem_addr_dest, len))
        return ET_TEST_FAILURE;

    // clear the TLB state
    tlb_l1_pause(&tlb_l1_write);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_resume(&tlb_l1_write);

    return ET_TEST_SUCCESS;
}

#include "../cdma.h"

ET_IMPLEMENT_TEST(cdma) {
    uint32_t w_offset = tlb_l1_read.cfg.w_offset;
    struct tlb_l1_entry entry;

    // offsets for the BRAM addresses
    uint32_t len = 16;
    uint32_t offset_src = 64;
    uint32_t offset_dest = 512;

    uint32_t mem_addr_src = (uintptr_t) MEM_BASE + offset_src;
    uint32_t mem_addr_dest = (uintptr_t) MEM_BASE + offset_dest;

    uint32_t tlb_addr_src = (uintptr_t) TRANSLATED_BASE + offset_src;
    uint32_t tlb_addr_dest = (uintptr_t) TRANSLATED_BASE + offset_dest;

    // add entries
    entry.valid = 1;
    entry.tagfrom = (uintptr_t) tlb_addr_src >> w_offset;
    entry.tagto = (uintptr_t) mem_addr_src >> w_offset;

    tlb_l1_pause(&tlb_l1_read);
    tlb_l1_add(&tlb_l1_read, &entry);
    tlb_l1_resume(&tlb_l1_read);

    entry.valid = 1;
    entry.tagfrom = (uintptr_t) tlb_addr_dest >> w_offset;
    entry.tagto = (uintptr_t) mem_addr_dest >> w_offset;

    tlb_l1_pause(&tlb_l1_write);
    tlb_l1_add(&tlb_l1_write, &entry);
    tlb_l1_resume(&tlb_l1_write);

    fill_pattern((char *) mem_addr_src, len);

    cdma_simple_transfer((void *) tlb_addr_src, (void *) tlb_addr_dest, len);
    cdma_wait_busy();

    if (!compare_memory((char *) mem_addr_src, (char *) mem_addr_dest, len)) {
        return ET_TEST_FAILURE;
    }

    // clear the TLB states
    tlb_l1_pause(&tlb_l1_read);
    tlb_l1_invalidatelookup(&tlb_l1_read, tlb_addr_src >> w_offset);
    tlb_l1_resume(&tlb_l1_read);

    tlb_l1_pause(&tlb_l1_write);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_resume(&tlb_l1_write);

    return ET_TEST_SUCCESS;
}

ET_IMPLEMENT_TEST(cdma_miss) {
    uint32_t w_offset = tlb_l1_write.cfg.w_offset;

    struct tlb_l1_entry entry;

    // offsets for the BRAM addresses
    uint32_t len = 16;
    uint32_t offset_src = 64;
    uint32_t offset_dest = 512;

    uint32_t mem_addr_src = (uintptr_t) MEM_BASE + offset_src;
    uint32_t mem_addr_dest = (uintptr_t) MEM_BASE + offset_dest;

    uint32_t tlb_addr_dest = (uintptr_t) TRANSLATED_BASE + offset_dest;

    entry.valid = 1;
    entry.tagfrom = (uintptr_t) tlb_addr_dest >> w_offset;
    entry.tagto = (uintptr_t) mem_addr_dest >> w_offset;

    // some entries might have stuck from before
    // uncomment the following code block to remove them
#if 0
    tlb_l1_pause(&tlb_l1_write);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_resume(&tlb_l1_write);
#endif

    tlb_l1_pause(&tlb_l1_write);
    // add the entry
    tlb_l1_add(&tlb_l1_write, &entry);
    tlb_l1_resume(&tlb_l1_write);

    tlb_l1_pause(&tlb_l1_write);
    // remove it
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_resume(&tlb_l1_write);

    fill_pattern((char *) mem_addr_src, len);
    cdma_simple_transfer((void *) mem_addr_src, (void *) tlb_addr_dest, len);

    while (1) {
        // poll the fault type
        int fault = tlb_l1_fault(&tlb_l1_write);

        if (fault > 0) {
            uint64_t fault_addr = tlb_l1_axiaddr(&tlb_l1_write);
            xil_printf("TLB fault address = 0x%x\r\n", (uint32_t) fault_addr);

            // add the entry again
            tlb_l1_pause(&tlb_l1_write);
            // add the entry
            tlb_l1_add(&tlb_l1_write, &entry);
            tlb_l1_resume(&tlb_l1_write);

            break ;
        }
        else {
            break ;
        }
    }

    cdma_wait_busy();

    if (!compare_memory((char *) mem_addr_src, (char *) mem_addr_dest, len)) {
        return ET_TEST_FAILURE;
    }

    // clear the TLB state
    tlb_l1_pause(&tlb_l1_write);
    tlb_l1_invalidatelookup(&tlb_l1_write, tlb_addr_dest >> w_offset);
    tlb_l1_resume(&tlb_l1_write);

    return ET_TEST_SUCCESS;
}

ET_TEST_SUITE(tlb)
    ET_ADD_TEST(read)
    ET_ADD_TEST(write)
    ET_ADD_TEST(cdma)
    ET_ADD_TEST(cdma_miss)
ET_END_TEST_SUITE()
