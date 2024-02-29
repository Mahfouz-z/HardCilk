/*
 * Copyright (c) 2019 Xilinx Inc.
 * Written by Francisco Iglesias.
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
 * References:
 *
 *
 * [1] AMBA AXI and ACE Protocol Specification, ARM IHI 0022D, ID102711
 *
 */

#ifndef SCTLM_TLM_LIB_ACE_BP_ACE_HPP_INCLUDED
#define SCTLM_TLM_LIB_ACE_BP_ACE_HPP_INCLUDED

#include <list>

#include <systemc>
#include <tlm>

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

#include <sctlm/tlm_lib/extensions/genattr.hpp>

namespace sctlm::tlm_lib::modules::ace {

class barrier_processor : public sc_core::sc_module {
public:
    tlm_utils::simple_target_socket<barrier_processor> target_socket;
    tlm_utils::simple_initiator_socket<barrier_processor> init_socket;

    SC_HAS_PROCESS(barrier_processor);
    barrier_processor(sc_core::sc_module_name name)
        : sc_core::sc_module(name)
        , target_socket("target_socket")
        , init_socket("init_socket") {
        target_socket.register_b_transport(this, &barrier_processor::b_transport);
    }

private:
    class Domain {
    public:
        enum {
            NonSharable,
            Inner,
            Outer,
            System
        };
    };

    class Barrier {
    public:
        Barrier()
            : m_genattr(new extensions::genattr())
            , m_ongoing(false) {
            init_gp();
        }

        void Done() { m_ongoing = false; }

        bool Ongoing() { return m_ongoing; }

        void Setup(tlm::tlm_generic_payload& gp) {
            extensions::genattr* attr;

            m_gp.set_response_status(tlm::TLM_INCOMPLETE_RESPONSE);

            gp.get_extension(attr);
            assert(attr);

            if (attr) {
                m_genattr->set_secure(attr->get_secure());
                m_genattr->set_transaction_id(attr->get_transaction_id());
                m_genattr->set_domain(attr->get_domain());
                m_genattr->set_is_read_tx(attr->get_is_read_tx());
            }
            m_ongoing = true;
        }

        tlm::tlm_generic_payload& GetGP() {
            return m_gp;
        }

        tlm::tlm_response_status GetTLMResponse() {
            return m_gp.get_response_status();
        }

        sc_core::sc_event& DoneEvent() { return m_done_event; }

    private:
        void init_gp() {
            m_gp.set_address(0);

            m_gp.set_command(tlm::TLM_IGNORE_COMMAND);

            m_gp.set_data_length(1);
            m_gp.set_data_ptr(&m_dummy_data);

            m_gp.set_byte_enable_ptr(NULL);
            m_gp.set_byte_enable_length(0);

            m_gp.set_streaming_width(1);

            m_gp.set_dmi_allowed(false);

            m_genattr->set_modifiable(true);
            m_genattr->set_barrier(true);
            m_genattr->set_domain(Domain::Inner);
            m_genattr->set_snoop(0);

            // m_genattr will be deleted by m_gp
            m_gp.set_extension(m_genattr);
        }

        tlm::tlm_generic_payload m_gp;
        extensions::genattr* m_genattr;
        bool m_ongoing;
        unsigned char m_dummy_data;
        sc_core::sc_event m_done_event;
    };

    bool is_barrier(tlm::tlm_generic_payload& gp) {
        extensions::genattr* genattr;

        gp.get_extension(genattr);
        if (!genattr) {
            return false;
        }
        return genattr->get_barrier();
    }

    void exec_barrier() {
        sc_core::sc_spawn(sc_core::sc_bind(&barrier_processor::exec_tlm_gp, this, &m_bar));
    }

    void exec_tlm_gp(Barrier* bar) {
        sc_core::sc_time delay(sc_core::SC_ZERO_TIME);

        init_socket->b_transport(bar->GetGP(), delay);

        wait(delay);

        bar->DoneEvent().notify();
    }

    //
    // Currently requires the second barrier to have been set up according
    // to section 3.1.5 in [1] (axlen is forced by the bridge to 0)
    //
    // To note is that normal transactions between the barriers are not
    // supported.
    //
    virtual void b_transport(tlm::tlm_generic_payload& gp, sc_core::sc_time& delay) {

        if (is_barrier(gp) && !m_bar.Ongoing()) {
            // Launch the first barrier in a separate thread
            m_bar.Setup(gp);

            exec_barrier();

            //
            // Only support when the barriers are in pair and
            // return the result with the second barrier
            // transaction.
            //
            gp.set_response_status(tlm::TLM_OK_RESPONSE);
            return;
        }

        init_socket->b_transport(gp, delay);

        if (is_barrier(gp)) {
            //
            // First barrier command not finished yet, wait for it
            //
            if (m_bar.Ongoing()) {
                wait(m_bar.DoneEvent());
            }

            //
            // Check responses and propagate back errors
            //
            if (gp.get_response_status() == tlm::TLM_OK_RESPONSE && m_bar.GetTLMResponse() != tlm::TLM_OK_RESPONSE) {
                gp.set_response_status(m_bar.GetTLMResponse());
            }
        }
    }

    Barrier m_bar;
};

} /* namespace sctlm::tlm_lib::modules::ace */

#endif /* SCTLM_TLM_LIB_ACE_BP_ACE_HPP_INCLUDED */
