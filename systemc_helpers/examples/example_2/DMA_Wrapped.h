#ifndef __GENERATED_DMA_WRAPPED_INCLUDED_
#define __GENERATED_DMA_WRAPPED_INCLUDED_

#include <unordered_map>
#include <string>

#include <systemc>

/** @note Very bad practice. Xilinx headers are not well written. Fix it later. */
using namespace sc_core;
using namespace sc_dt;

#include <tlm>

/** @note Very bad practice. Xilinx headers are not well written. Fix it later. */
using namespace tlm;

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

#include <tlm-bridges/axi2tlm-bridge.h>
#include <tlm-bridges/axilite2tlm-bridge.h>
#include <tlm-bridges/axis2tlm-bridge.h>
#include <tlm-bridges/tlm2axi-bridge.h>
#include <tlm-bridges/tlm2axilite-bridge.h>
#include <tlm-bridges/tlm2axis-bridge.h>

#include <tests/test-modules/signals-axi.h>
#include <tests/test-modules/signals-axilite.h>
#include <tests/test-modules/signals-axis.h>

#include <VDMA_Wrapped.h>

#include "tlm_enabled.h"

namespace 
{

struct DMA_Wrapped : VDMA_Wrapped, TlmEnabled
{
    SC_HAS_PROCESS(DMA_Wrapped);

    explicit DMA_Wrapped(sc_core::sc_module_name name):
        VDMA_Wrapped(name),
        S_AXI_signals_("S_AXI_signals"),
        M_AXI_signals_("M_AXI_signals"),
        S_AXI_bridge_("S_AXI_bridge"),
        M_AXI_bridge_("M_AXI_bridge")
        
    {
        /* initialize bridges */
        S_AXI_bridge_.clk(clock);
        S_AXI_bridge_.resetn(reset_n_);
        
        M_AXI_bridge_.clk(clock);
        M_AXI_bridge_.resetn(reset_n_);
        

        /* connect bridges */
        S_AXI_signals_.connect(S_AXI_bridge_);
        M_AXI_signals_.connect(M_AXI_bridge_);

        /* initialize the map for accessing TLM sockets */
        sockets_["S_AXI"] = &S_AXI_bridge_.tgt_socket;
        sockets_["M_AXI"] = &M_AXI_bridge_.socket;

        /* thread that generates the ACTIVE_LOW reset signal */
        SC_THREAD(reset_n_generate_);
        sensitive << reset;

        do_connect_();
    }

    /**
      * @brief Find a TLM socket for the interface with the given name.
      * @note Throws if such an interface does not exist.
      *
      */
    tlm::tlm_base_socket_if *getSocket(const std::string &name = "") override
    {
        return sockets_.at(name);
    }

private:
    /** @note Bridges require ACTIVE_LOW reset. */
    sc_core::sc_signal<bool> reset_n_;

    /* Interface signals */
    AXILiteSignals<7,64> S_AXI_signals_;
    AXILiteSignals<32,64> M_AXI_signals_;

    /* TLM bridges */
    tlm2axilite_bridge<7,64> S_AXI_bridge_;
    axilite2tlm_bridge<32,64> M_AXI_bridge_;

    /** @brief Mapping between interface names to TLM sockets. */
    std::unordered_map<std::string, tlm_base_socket_if *> sockets_;

    
    /** @brief Generates the ACTIVE_LOW reset signal. */
    void reset_n_generate_()
    {
        reset_n_.write(!reset.read());
    }

    /** @brief Performs the connections of interfaces. */
    void do_connect_()
    {
        /* connecting AXI4-Lite interface with name: S_AXI */
        /* is_slave = True */
        S_AXI_AWVALID(S_AXI_signals_.awvalid);
        S_AXI_AWREADY(S_AXI_signals_.awready);
        S_AXI_AWADDR(S_AXI_signals_.awaddr);
        S_AXI_AWPROT(S_AXI_signals_.awprot);
        S_AXI_WVALID(S_AXI_signals_.wvalid);
        S_AXI_WREADY(S_AXI_signals_.wready);
        S_AXI_WDATA(S_AXI_signals_.wdata);
        S_AXI_WSTRB(S_AXI_signals_.wstrb);
        S_AXI_BVALID(S_AXI_signals_.bvalid);
        S_AXI_BREADY(S_AXI_signals_.bready);
        S_AXI_BRESP(S_AXI_signals_.bresp);
        S_AXI_ARVALID(S_AXI_signals_.arvalid);
        S_AXI_ARREADY(S_AXI_signals_.arready);
        S_AXI_ARADDR(S_AXI_signals_.araddr);
        S_AXI_ARPROT(S_AXI_signals_.arprot);
        S_AXI_RVALID(S_AXI_signals_.rvalid);
        S_AXI_RREADY(S_AXI_signals_.rready);
        S_AXI_RDATA(S_AXI_signals_.rdata);
        S_AXI_RRESP(S_AXI_signals_.rresp);
    
        
        /* connecting AXI4-Lite interface with name: M_AXI */
        /* is_slave = False */
        M_AXI_AWVALID(M_AXI_signals_.awvalid);
        M_AXI_AWREADY(M_AXI_signals_.awready);
        M_AXI_AWADDR(M_AXI_signals_.awaddr);
        M_AXI_AWPROT(M_AXI_signals_.awprot);
        M_AXI_WVALID(M_AXI_signals_.wvalid);
        M_AXI_WREADY(M_AXI_signals_.wready);
        M_AXI_WDATA(M_AXI_signals_.wdata);
        M_AXI_WSTRB(M_AXI_signals_.wstrb);
        M_AXI_BVALID(M_AXI_signals_.bvalid);
        M_AXI_BREADY(M_AXI_signals_.bready);
        M_AXI_BRESP(M_AXI_signals_.bresp);
        M_AXI_ARVALID(M_AXI_signals_.arvalid);
        M_AXI_ARREADY(M_AXI_signals_.arready);
        M_AXI_ARADDR(M_AXI_signals_.araddr);
        M_AXI_ARPROT(M_AXI_signals_.arprot);
        M_AXI_RVALID(M_AXI_signals_.rvalid);
        M_AXI_RREADY(M_AXI_signals_.rready);
        M_AXI_RDATA(M_AXI_signals_.rdata);
        M_AXI_RRESP(M_AXI_signals_.rresp);
    
        
    }
};

}

#endif // __GENERATED_DMA_WRAPPED_INCLUDED_
