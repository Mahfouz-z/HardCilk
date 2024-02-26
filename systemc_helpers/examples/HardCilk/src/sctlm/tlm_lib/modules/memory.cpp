/*
 * Copyright (c) 2011 Edgar E. Iglesias.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#define SC_INCLUDE_DYNAMIC_PROCESSES

#include <sctlm/tlm_lib/modules/memory.hpp>

#ifndef MIN
#    define MIN(a, b) ((a) > (b) ? (b) : (a))
#endif

#include "memory.h"

namespace sctlm::tlm_lib::modules {

memory::memory(
    sc_core::sc_module_name name,
    sc_core::sc_time latency,
    std::size_t size,
    std::uint32_t parallelRequests,
    std::uint8_t* buf
)
    : sc_module(name)
    , socket("socket")
    , latency { latency }
    , size { size }
    , parallelRequests { parallelRequests }
    , mem_ { buf }
    , semaphore_ { (int)parallelRequests }
    , dmiEnabled_ { parallelRequests == 0 } {
    socket.register_b_transport(this, &memory::b_transport);
    socket.register_get_direct_mem_ptr(this, &memory::get_direct_mem_ptr);
    socket.register_transport_dbg(this, &memory::transport_dbg);

    if (mem_ == NULL) {
        buffer_.reset(new uint8_t[size]);
        mem_ = buffer_.get();
        memset(&mem_[0], 0, size);
    }
}

#if defined(SCTLM_MEM_DEBUG)
#    include <iostream>
#endif /* defined(SCTLM_MEM_DEBUG) */

void memory::dmiEnable() {
    if (dmiEnabled_)
        return;

    dmiEnabled_ = true;
}

void memory::dmiDisable() {
    if (!dmiEnabled_)
        return;

    dmiEnabled_ = false;
    socket->invalidate_direct_mem_ptr(0, size - 1);
}

void memory::dmiDefault() {
    if (parallelRequests == 0)
        dmiEnable();
    else
        dmiDisable();
}

void memory::b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay) {
    tlm::tlm_command cmd = trans.get_command();
    sc_dt::uint64 addr = trans.get_address();
    unsigned char* ptr = trans.get_data_ptr();
    unsigned int len = trans.get_data_length();
    unsigned int streaming_width = trans.get_streaming_width();
    unsigned char* be = trans.get_byte_enable_ptr();
    unsigned int be_len = trans.get_byte_enable_length();

#if defined(SCTLM_MEM_DEBUG)
    std::cout << "[memory::b_transport] "
              << "time = " << sc_core::sc_time_stamp().to_string() << ", "
              << "addr = " << addr << "\n";
#endif /* defined(SCTLM_MEM_DEBUG) */

    if (dmiEnabled_)
        ;
    else {
        wait(delay);
        delay = sc_core::SC_ZERO_TIME;
        semaphore_.wait();
    }

    if (be_len) {
        if (streaming_width == 0)
            streaming_width = len;

        // Slow path.
        unsigned int pos;

        for (pos = 0; pos < len; pos++) {
            bool do_access = true;

            if (be_len) {
                do_access = be[pos % be_len] == TLM_BYTE_ENABLED;
            }
            if (do_access) {
                if ((addr + (pos % streaming_width)) >= sc_dt::uint64(size)) {
                    trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
                    SC_REPORT_FATAL("Memory", "Unsupported access\n");
                    return;
                }

                if (trans.is_read()) {
                    ptr[pos] = mem_[addr + (pos % streaming_width)];
                } else {
                    mem_[addr + (pos % streaming_width)] = ptr[pos];
                }
            }
        }
    } else {
        if ((addr + len) > sc_dt::uint64(size)) {
            trans.set_response_status(tlm::TLM_ADDRESS_ERROR_RESPONSE);
            SC_REPORT_FATAL("Memory", "Unsupported access\n");
            return;
        }

        if (trans.get_command() == tlm::TLM_READ_COMMAND)
            memcpy(ptr, &mem_[addr], len);
        else if (cmd == tlm::TLM_WRITE_COMMAND)
            memcpy(&mem_[addr], ptr, len);
    }

    trans.set_response_status(tlm::TLM_OK_RESPONSE);

    if (dmiEnabled_) {
        delay += latency;
        trans.set_dmi_allowed(true);
    } else {
        wait(latency);
        semaphore_.post();
    }
}

bool memory::get_direct_mem_ptr(tlm::tlm_generic_payload& trans, tlm::tlm_dmi& dmi_data) {
    dmi_data.allow_read_write();

    dmi_data.set_dmi_ptr(reinterpret_cast<unsigned char*>(&mem_[0]));
    dmi_data.set_start_address(0);
    dmi_data.set_end_address(size - 1);
    /* Latencies are per byte.  Our latency is expressed per access,
       which are in 32bits so dividie by 4. Is there a better way?.  */
    dmi_data.set_read_latency(latency / 4);
    dmi_data.set_write_latency(latency / 4);

    return true;
}

unsigned int memory::transport_dbg(tlm::tlm_generic_payload& trans) {
    tlm::tlm_command cmd = trans.get_command();
    sc_dt::uint64 addr = trans.get_address();
    unsigned char* ptr = trans.get_data_ptr();
    unsigned int len = trans.get_data_length();
    unsigned int num_bytes = (len < (size - addr)) ? len : (size - addr);

    if (cmd == tlm::TLM_READ_COMMAND)
        memcpy(ptr, &mem_[addr], num_bytes);
    else if (cmd == tlm::TLM_WRITE_COMMAND)
        memcpy(&mem_[addr], ptr, num_bytes);

    return num_bytes;
}

} /* namespace sctlm::tlm_lib::modules */
