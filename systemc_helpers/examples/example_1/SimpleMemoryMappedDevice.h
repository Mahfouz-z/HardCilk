#ifndef __GENERATED_SIMPLEMEMORYMAPPEDDEVICE_INCLUDED_
#define __GENERATED_SIMPLEMEMORYMAPPEDDEVICE_INCLUDED_

#include <systemc>
#include <tlm>
#include <unordered_map>
#include <string>
#include <VSimpleMemoryMappedDevice.h>

#include "tlm_enabled.h"

namespace 
{

struct SimpleMemoryMappedDevice : VSimpleMemoryMappedDevice, TlmEnabled
{
    SC_HAS_PROCESS(SimpleMemoryMappedDevice);

    explicit SimpleMemoryMappedDevice(sc_core::sc_module_name name):
        VSimpleMemoryMappedDevice(name),
        SAXIL_signals_("SAXIL_signals"),
        SAXIL_bridge_("SAXIL_bridge")
        
    {
        /* initialize bridges */
        SAXIL_bridge_.clk(clock);
        SAXIL_bridge_.resetn(reset_n_);
        

        /* connect bridges */
        SAXIL_signals_.connect(SAXIL_bridge_);

        /* initialize the map for accessing TLM sockets */
        sockets_["SAXIL"] = &SAXIL_bridge_.tgt_socket;

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
    AXILiteSignals<32,32> SAXIL_signals_;

    /* TLM bridges */
    tlm2axilite_bridge<32,32> SAXIL_bridge_;

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
        /* connecting AXI4-Lite interface with name: SAXIL */
        /* is_slave = True */
        SAXIL_AWVALID(SAXIL_signals_.awvalid);
        SAXIL_AWREADY(SAXIL_signals_.awready);
        SAXIL_AWADDR(SAXIL_signals_.awaddr);
        SAXIL_AWPROT(SAXIL_signals_.awprot);
        SAXIL_WVALID(SAXIL_signals_.wvalid);
        SAXIL_WREADY(SAXIL_signals_.wready);
        SAXIL_WDATA(SAXIL_signals_.wdata);
        SAXIL_WSTRB(SAXIL_signals_.wstrb);
        SAXIL_BVALID(SAXIL_signals_.bvalid);
        SAXIL_BREADY(SAXIL_signals_.bready);
        SAXIL_BRESP(SAXIL_signals_.bresp);
        SAXIL_ARVALID(SAXIL_signals_.arvalid);
        SAXIL_ARREADY(SAXIL_signals_.arready);
        SAXIL_ARADDR(SAXIL_signals_.araddr);
        SAXIL_ARPROT(SAXIL_signals_.arprot);
        SAXIL_RVALID(SAXIL_signals_.rvalid);
        SAXIL_RREADY(SAXIL_signals_.rready);
        SAXIL_RDATA(SAXIL_signals_.rdata);
        SAXIL_RRESP(SAXIL_signals_.rresp);
    
        
    }
};

}

#endif // __GENERATED_SIMPLEMEMORYMAPPEDDEVICE_INCLUDED_
