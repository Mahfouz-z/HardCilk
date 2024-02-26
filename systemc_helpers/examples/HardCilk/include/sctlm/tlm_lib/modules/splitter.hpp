/*
 * Copyright (c) 2018 Xilinx Inc.
 * Written by Edgar E. Iglesias.
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
#ifndef SCTLM_TLM_LIB_TLM_SPLITTER_HPP_INCLUDED
#define SCTLM_TLM_LIB_TLM_SPLITTER_HPP_INCLUDED

#include <cstdint>

#include <systemc>
#include <tlm>

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

#include <sctlm/utils/hexdump.h>

#define TLM_SPLITTER_ERROR "TLM Splitter Error"

namespace sctlm::tlm_lib::modules {

/*
 * This module is a TLM interconnect splitter. Any transactions ingressing
 * on our slave port will be replicated on all the outgoing master ports.
 *
 * Optionally, the module can verify that all data responses for reads match.
 */
template<unsigned int NR_INIT_SOCKETS>
class splitter : public sc_core::sc_module {
public:
    tlm_utils::simple_target_socket<splitter> target_socket;
    tlm_utils::simple_initiator_socket_tagged<splitter>* i_sk[NR_INIT_SOCKETS];

    splitter(sc_core::sc_module_name name, bool do_check_read_data = false)
        : do_check_read_data(do_check_read_data) {
        char sk_name[64];
        unsigned int i;

        for (i = 0; i < NR_INIT_SOCKETS; i++) {
            sprintf(sk_name, "init_socket_%d", i);
            i_sk[i] = new tlm_utils::simple_initiator_socket_tagged<splitter>(sk_name);
        }
        target_socket.register_b_transport(this, &splitter::b_transport);
    }

private:
    bool do_check_read_data;

    virtual void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay) {
        unsigned char* data = trans.get_data_ptr();
        unsigned int len = trans.get_data_length();
        tlm::tlm_response_status resp_status = tlm::TLM_OK_RESPONSE;
        std::uint8_t* ref_data = NULL;
        unsigned int i;

        if (do_check_read_data && trans.is_read()) {
            ref_data = new std::uint8_t[len];
        }

        for (i = 0; i < NR_INIT_SOCKETS; i++) {
            (*i_sk[i])->b_transport(trans, delay);

            if (trans.get_response_status() != tlm::TLM_OK_RESPONSE) {
                resp_status = trans.get_response_status();
            }

            if (do_check_read_data && trans.is_read()) {
                if (i == 0) {
                    memcpy(ref_data, data, len);
                } else {
                    if (memcmp(ref_data, data, len)) {
                        hexdump("ref-data", ref_data, len);
                        hexdump("data", data, len);
                        SC_REPORT_ERROR(TLM_SPLITTER_ERROR, "Read-data missmatch");
                    }
                }
            }
        }
        trans.set_response_status(resp_status);
        delete[] ref_data;
    }
};

} /* namespace sctlm::tlm_lib */

#endif /* SCTLM_TLM_LIB_TLM_SPLITTER_HPP_INCLUDED */
