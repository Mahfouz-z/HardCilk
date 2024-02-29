/*
 * Copyright (c) 2018 Xilinx Inc.
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

#ifndef SIGNALS_AXIS_H__
#define SIGNALS_AXIS_H__

#include <sctlm/tlm_lib/protocols/amba/axi.hpp>

namespace sctlm::tlm_lib::signals {

template<
    int DATA_WIDTH,
    int USER_WIDTH = 1,

    /** @note the following template parameters are not used */
    bool NO_TSTRB = false,
    bool NO_TLAST = false>
class axis : public sc_core::sc_module {
public:
    /* Write data channel.  */
    sc_core::sc_signal<bool> tvalid;
    sc_core::sc_signal<bool> tready;
    sc_core::sc_signal<sc_dt::sc_bv<DATA_WIDTH>> tdata;
    sc_core::sc_signal<sc_dt::sc_bv<DATA_WIDTH / 8>> tstrb;
    sc_core::sc_signal<SCTLM_AXI_SIGNAL(USER_WIDTH)> tuser;
    sc_core::sc_signal<bool> tlast;

    template<typename T>
    void connect(T* dev) {
        dev->tvalid(tvalid);
        dev->tready(tready);
        dev->tdata(tdata);
        dev->tstrb(tstrb);
        dev->tuser(tuser);
        dev->tlast(tlast);
    }

    void Trace(sc_core::sc_trace_file* f) {
        /* Write data channel.  */
        sc_core::sc_trace(f, tvalid, tvalid.name());
        sc_core::sc_trace(f, tready, tready.name());
        sc_core::sc_trace(f, tdata, tdata.name());
        sc_core::sc_trace(f, tstrb, tstrb.name());
        sc_core::sc_trace(f, tuser, tuser.name());
        sc_core::sc_trace(f, tlast, tlast.name());
    }

    template<typename T>
    void connect(T& dev) {
        connect(&dev);
    }

    axis(sc_core::sc_module_name name)
        : sc_module(name)
        ,

        tvalid("tvalid")
        , tready("tready")
        , tdata("tdata")
        , tstrb("tstrb")
        , tuser("tuser")
        , tlast("tlast") {}

private:
};

} /* namespace sctlm::tlm_lib::signals */

#endif
