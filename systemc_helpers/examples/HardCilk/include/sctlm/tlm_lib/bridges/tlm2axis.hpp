/*
 * TLM-2.0 to AXIS bridge.
 *
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
 */

#ifndef SCTLM_TLM_LIB_BRIDGES_TLM2AXIS_BRIDGE_HPP_INCLUDED
#define SCTLM_TLM_LIB_BRIDGES_TLM2AXIS_BRIDGE_HPP_INCLUDED
#define SC_INCLUDE_DYNAMIC_PROCESSES

#include <systemc>
#include <tlm>

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

#include <sctlm/tlm_lib/extensions/genattr.hpp>
#include <sctlm/tlm_lib/protocols/amba/ace.hpp>
#include <sctlm/tlm_lib/protocols/amba/axi.hpp>

#define D(x)

namespace sctlm::tlm_lib::bridges {

namespace detail {

using namespace protocols::amba::axi;
using namespace protocols::amba::ace;

template<
    int DATA_WIDTH,
    int USER_WIDTH = 1,

    /** @note the following template parameters are not used */
    bool NO_TSTRB = false,
    bool NO_TLAST = false>
class tlm2axis
    : public sc_core::sc_module,
      public axi_common {
public:
    tlm_utils::simple_target_socket<tlm2axis> tgt_socket;

    SC_HAS_PROCESS(tlm2axis);

    sc_core::sc_in<bool> clk;
    sc_core::sc_in<bool> resetn;

    /* Write data channel.  */
    sc_core::sc_out<bool> tvalid;
    sc_core::sc_in<bool> tready;
    sc_core::sc_out<sc_dt::sc_bv<DATA_WIDTH>> tdata;
    sc_core::sc_out<sc_dt::sc_bv<DATA_WIDTH / 8>> tstrb;
    sc_core::sc_out<SCTLM_AXI_SIGNAL(USER_WIDTH)> tuser;
    sc_core::sc_out<bool> tlast;

    sc_core::sc_mutex m_mutex;

    tlm2axis(sc_core::sc_module_name name)
        : sc_core::sc_module(name)
        , axi_common(this)
        , tgt_socket("tgt_socket")
        ,

        clk("clk")
        , resetn("resetn")
        ,

        tvalid("tvalid")
        , tready("tready")
        , tdata("tdata")
        , tstrb("tstrb")
        , tuser("tuser")
        , tlast("tlast") {
        tgt_socket.register_b_transport(this, &tlm2axis::b_transport);
    }

private:
    virtual void b_transport(tlm::tlm_generic_payload& trans, sc_core::sc_time& delay) {
        unsigned int bus_width = DATA_WIDTH / 8;
        std::uint8_t* data = trans.get_data_ptr();
        unsigned int len = trans.get_data_length();
        unsigned int pos = 0;
        extensions::genattr* genattr;
        bool eop = true;

        // Since we're going to do waits in order to wiggle the
        // AXI signals, we need to eliminate the accumulated
        // TLM delay.
        wait(delay, resetn.negedge_event());
        delay = sc_core::SC_ZERO_TIME;

        m_mutex.lock();
        // Get end of packet
        trans.get_extension(genattr);
        if (genattr) {
            eop = genattr->get_eop();
        }

        do {
            sc_dt::sc_bv<DATA_WIDTH> tmp;
            sc_dt::sc_bv<DATA_WIDTH / 8> strb;

            for (unsigned int i = 0;
                 i < bus_width && pos < len; i++) {
                int firstbit = i * 8;
                int lastbit = firstbit + 8 - 1;

                tmp.range(lastbit, firstbit) = data[pos++];
                strb[i] = true;
            }
            tdata.write(tmp);
            tstrb.write(strb);

            if (pos == len && eop) {
                tlast.write(true);
            }

            tvalid.write(true);

            wait_abort_on_reset(tready);

            /* Abort transaction if reset is asserted. */
            if (reset_asserted()) {
                trans.set_response_status(tlm::TLM_GENERIC_ERROR_RESPONSE);
                m_mutex.unlock();
                return;
            }

        } while (pos < len);

        tvalid.write(false);
        tlast.write(false);

        trans.set_response_status(tlm::TLM_OK_RESPONSE);

        m_mutex.unlock();
    }
};

} /* namespace detail */

using detail::tlm2axis;

} /* namespace sctlm::tlm_lib::bridges */

#undef D
#endif /* SCTLM_TLM_LIB_BRIDGES_TLM2AXIS_BRIDGE_HPP_INCLUDED */
