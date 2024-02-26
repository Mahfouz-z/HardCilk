#ifndef __GENERATED_FULLSYSGEN_INCLUDED_
#define __GENERATED_FULLSYSGEN_INCLUDED_

#include <unordered_map>
#include <string>

#include <systemc>
#include <tlm>

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

#include <sctlm/tlm_lib/bridges/axi2tlm.h>
#include <sctlm/tlm_lib/bridges/axilite2tlm.h>
#include <sctlm/tlm_lib/bridges/axis2tlm.h>
#include <sctlm/tlm_lib/bridges/tlm2axi.h>
#include <sctlm/tlm_lib/bridges/tlm2axilite.h>
#include <sctlm/tlm_lib/bridges/tlm2axis.h>

#include <sctlm/tlm_lib/signals/axi.h>
#include <sctlm/tlm_lib/signals/axilite.h>
#include <sctlm/tlm_lib/signals/axis.h>

#include <sctlm/tlm_lib/tlm_module.hpp>



/* Verilator-generated header */
#include <VfullSysGen.h>



struct fullSysGen :
    VfullSysGen,
    sctlm::tlm_lib::tlm_module
{
    SC_HAS_PROCESS(fullSysGen);

    explicit fullSysGen(sc_core::sc_module_name name):
        VfullSysGen(name),
        fib_stealSide_taskOut_0_signals_("fib_stealSide_taskOut_0_signals"),
        fib_stealSide_taskOut_1_signals_("fib_stealSide_taskOut_1_signals"),
        fib_stealSide_taskOut_2_signals_("fib_stealSide_taskOut_2_signals"),
        fib_stealSide_taskOut_3_signals_("fib_stealSide_taskOut_3_signals"),
        fib_stealSide_taskOut_4_signals_("fib_stealSide_taskOut_4_signals"),
        fib_stealSide_taskIn_0_signals_("fib_stealSide_taskIn_0_signals"),
        fib_stealSide_taskIn_1_signals_("fib_stealSide_taskIn_1_signals"),
        fib_stealSide_taskIn_2_signals_("fib_stealSide_taskIn_2_signals"),
        fib_stealSide_taskIn_3_signals_("fib_stealSide_taskIn_3_signals"),
        fib_stealSide_taskIn_4_signals_("fib_stealSide_taskIn_4_signals"),
        sum_stealSide_taskOut_0_signals_("sum_stealSide_taskOut_0_signals"),
        sum_stealSide_taskOut_1_signals_("sum_stealSide_taskOut_1_signals"),
        sum_stealSide_taskOut_2_signals_("sum_stealSide_taskOut_2_signals"),
        sum_stealSide_taskOut_3_signals_("sum_stealSide_taskOut_3_signals"),
        sum_stealSide_taskOut_4_signals_("sum_stealSide_taskOut_4_signals"),
        sum_syncSide_addrIn_0_signals_("sum_syncSide_addrIn_0_signals"),
        sum_syncSide_addrIn_1_signals_("sum_syncSide_addrIn_1_signals"),
        sum_syncSide_addrIn_2_signals_("sum_syncSide_addrIn_2_signals"),
        sum_syncSide_addrIn_3_signals_("sum_syncSide_addrIn_3_signals"),
        sum_syncSide_addrIn_4_signals_("sum_syncSide_addrIn_4_signals"),
        sum_continuationAllocationSide_contOut_0_signals_("sum_continuationAllocationSide_contOut_0_signals"),
        sum_continuationAllocationSide_contOut_1_signals_("sum_continuationAllocationSide_contOut_1_signals"),
        sum_continuationAllocationSide_contOut_2_signals_("sum_continuationAllocationSide_contOut_2_signals"),
        sum_continuationAllocationSide_contOut_3_signals_("sum_continuationAllocationSide_contOut_3_signals"),
        sum_continuationAllocationSide_contOut_4_signals_("sum_continuationAllocationSide_contOut_4_signals"),
        sum_syncSide_addrIn_5_signals_("sum_syncSide_addrIn_5_signals"),
        sum_syncSide_addrIn_6_signals_("sum_syncSide_addrIn_6_signals"),
        sum_syncSide_addrIn_7_signals_("sum_syncSide_addrIn_7_signals"),
        sum_syncSide_addrIn_8_signals_("sum_syncSide_addrIn_8_signals"),
        sum_syncSide_addrIn_9_signals_("sum_syncSide_addrIn_9_signals"),
        sum_stealSide_axi_mgmt_vss_signals_("sum_stealSide_axi_mgmt_vss_signals"),
        sum_stealSide_vss_axi_full_signals_("sum_stealSide_vss_axi_full_signals"),
        sum_continuationAllocationSide_axi_mgmt_vcas_signals_("sum_continuationAllocationSide_axi_mgmt_vcas_signals"),
        sum_continuationAllocationSide_vcas_axi_full_signals_("sum_continuationAllocationSide_vcas_axi_full_signals"),
        sum_syncSide_axi_full_argRoute_0_signals_("sum_syncSide_axi_full_argRoute_0_signals"),
        sum_syncSide_axi_full_argRoute_1_signals_("sum_syncSide_axi_full_argRoute_1_signals"),
        fib_stealSide_axi_mgmt_vss_signals_("fib_stealSide_axi_mgmt_vss_signals"),
        fib_stealSide_vss_axi_full_signals_("fib_stealSide_vss_axi_full_signals"),
        fib_stealSide_taskOut_0_bridge_("fib_stealSide_taskOut_0_bridge"),
        fib_stealSide_taskOut_1_bridge_("fib_stealSide_taskOut_1_bridge"),
        fib_stealSide_taskOut_2_bridge_("fib_stealSide_taskOut_2_bridge"),
        fib_stealSide_taskOut_3_bridge_("fib_stealSide_taskOut_3_bridge"),
        fib_stealSide_taskOut_4_bridge_("fib_stealSide_taskOut_4_bridge"),
        fib_stealSide_taskIn_0_bridge_("fib_stealSide_taskIn_0_bridge"),
        fib_stealSide_taskIn_1_bridge_("fib_stealSide_taskIn_1_bridge"),
        fib_stealSide_taskIn_2_bridge_("fib_stealSide_taskIn_2_bridge"),
        fib_stealSide_taskIn_3_bridge_("fib_stealSide_taskIn_3_bridge"),
        fib_stealSide_taskIn_4_bridge_("fib_stealSide_taskIn_4_bridge"),
        sum_stealSide_taskOut_0_bridge_("sum_stealSide_taskOut_0_bridge"),
        sum_stealSide_taskOut_1_bridge_("sum_stealSide_taskOut_1_bridge"),
        sum_stealSide_taskOut_2_bridge_("sum_stealSide_taskOut_2_bridge"),
        sum_stealSide_taskOut_3_bridge_("sum_stealSide_taskOut_3_bridge"),
        sum_stealSide_taskOut_4_bridge_("sum_stealSide_taskOut_4_bridge"),
        sum_syncSide_addrIn_0_bridge_("sum_syncSide_addrIn_0_bridge"),
        sum_syncSide_addrIn_1_bridge_("sum_syncSide_addrIn_1_bridge"),
        sum_syncSide_addrIn_2_bridge_("sum_syncSide_addrIn_2_bridge"),
        sum_syncSide_addrIn_3_bridge_("sum_syncSide_addrIn_3_bridge"),
        sum_syncSide_addrIn_4_bridge_("sum_syncSide_addrIn_4_bridge"),
        sum_continuationAllocationSide_contOut_0_bridge_("sum_continuationAllocationSide_contOut_0_bridge"),
        sum_continuationAllocationSide_contOut_1_bridge_("sum_continuationAllocationSide_contOut_1_bridge"),
        sum_continuationAllocationSide_contOut_2_bridge_("sum_continuationAllocationSide_contOut_2_bridge"),
        sum_continuationAllocationSide_contOut_3_bridge_("sum_continuationAllocationSide_contOut_3_bridge"),
        sum_continuationAllocationSide_contOut_4_bridge_("sum_continuationAllocationSide_contOut_4_bridge"),
        sum_syncSide_addrIn_5_bridge_("sum_syncSide_addrIn_5_bridge"),
        sum_syncSide_addrIn_6_bridge_("sum_syncSide_addrIn_6_bridge"),
        sum_syncSide_addrIn_7_bridge_("sum_syncSide_addrIn_7_bridge"),
        sum_syncSide_addrIn_8_bridge_("sum_syncSide_addrIn_8_bridge"),
        sum_syncSide_addrIn_9_bridge_("sum_syncSide_addrIn_9_bridge"),
        sum_stealSide_axi_mgmt_vss_bridge_("sum_stealSide_axi_mgmt_vss_bridge"),
        sum_stealSide_vss_axi_full_bridge_("sum_stealSide_vss_axi_full_bridge"),
        sum_continuationAllocationSide_axi_mgmt_vcas_bridge_("sum_continuationAllocationSide_axi_mgmt_vcas_bridge"),
        sum_continuationAllocationSide_vcas_axi_full_bridge_("sum_continuationAllocationSide_vcas_axi_full_bridge"),
        sum_syncSide_axi_full_argRoute_0_bridge_("sum_syncSide_axi_full_argRoute_0_bridge"),
        sum_syncSide_axi_full_argRoute_1_bridge_("sum_syncSide_axi_full_argRoute_1_bridge"),
        fib_stealSide_axi_mgmt_vss_bridge_("fib_stealSide_axi_mgmt_vss_bridge"),
        fib_stealSide_vss_axi_full_bridge_("fib_stealSide_vss_axi_full_bridge")
        
    {
        /* initialize bridges */
        fib_stealSide_taskOut_0_bridge_.clk(clock);
        fib_stealSide_taskOut_0_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskOut_1_bridge_.clk(clock);
        fib_stealSide_taskOut_1_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskOut_2_bridge_.clk(clock);
        fib_stealSide_taskOut_2_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskOut_3_bridge_.clk(clock);
        fib_stealSide_taskOut_3_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskOut_4_bridge_.clk(clock);
        fib_stealSide_taskOut_4_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskIn_0_bridge_.clk(clock);
        fib_stealSide_taskIn_0_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskIn_1_bridge_.clk(clock);
        fib_stealSide_taskIn_1_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskIn_2_bridge_.clk(clock);
        fib_stealSide_taskIn_2_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskIn_3_bridge_.clk(clock);
        fib_stealSide_taskIn_3_bridge_.resetn(reset_n_);
        
        fib_stealSide_taskIn_4_bridge_.clk(clock);
        fib_stealSide_taskIn_4_bridge_.resetn(reset_n_);
        
        sum_stealSide_taskOut_0_bridge_.clk(clock);
        sum_stealSide_taskOut_0_bridge_.resetn(reset_n_);
        
        sum_stealSide_taskOut_1_bridge_.clk(clock);
        sum_stealSide_taskOut_1_bridge_.resetn(reset_n_);
        
        sum_stealSide_taskOut_2_bridge_.clk(clock);
        sum_stealSide_taskOut_2_bridge_.resetn(reset_n_);
        
        sum_stealSide_taskOut_3_bridge_.clk(clock);
        sum_stealSide_taskOut_3_bridge_.resetn(reset_n_);
        
        sum_stealSide_taskOut_4_bridge_.clk(clock);
        sum_stealSide_taskOut_4_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_0_bridge_.clk(clock);
        sum_syncSide_addrIn_0_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_1_bridge_.clk(clock);
        sum_syncSide_addrIn_1_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_2_bridge_.clk(clock);
        sum_syncSide_addrIn_2_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_3_bridge_.clk(clock);
        sum_syncSide_addrIn_3_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_4_bridge_.clk(clock);
        sum_syncSide_addrIn_4_bridge_.resetn(reset_n_);
        
        sum_continuationAllocationSide_contOut_0_bridge_.clk(clock);
        sum_continuationAllocationSide_contOut_0_bridge_.resetn(reset_n_);
        
        sum_continuationAllocationSide_contOut_1_bridge_.clk(clock);
        sum_continuationAllocationSide_contOut_1_bridge_.resetn(reset_n_);
        
        sum_continuationAllocationSide_contOut_2_bridge_.clk(clock);
        sum_continuationAllocationSide_contOut_2_bridge_.resetn(reset_n_);
        
        sum_continuationAllocationSide_contOut_3_bridge_.clk(clock);
        sum_continuationAllocationSide_contOut_3_bridge_.resetn(reset_n_);
        
        sum_continuationAllocationSide_contOut_4_bridge_.clk(clock);
        sum_continuationAllocationSide_contOut_4_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_5_bridge_.clk(clock);
        sum_syncSide_addrIn_5_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_6_bridge_.clk(clock);
        sum_syncSide_addrIn_6_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_7_bridge_.clk(clock);
        sum_syncSide_addrIn_7_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_8_bridge_.clk(clock);
        sum_syncSide_addrIn_8_bridge_.resetn(reset_n_);
        
        sum_syncSide_addrIn_9_bridge_.clk(clock);
        sum_syncSide_addrIn_9_bridge_.resetn(reset_n_);
        
        sum_stealSide_axi_mgmt_vss_bridge_.clk(clock);
        sum_stealSide_axi_mgmt_vss_bridge_.resetn(reset_n_);
        
        sum_stealSide_vss_axi_full_bridge_.clk(clock);
        sum_stealSide_vss_axi_full_bridge_.resetn(reset_n_);
        
        sum_continuationAllocationSide_axi_mgmt_vcas_bridge_.clk(clock);
        sum_continuationAllocationSide_axi_mgmt_vcas_bridge_.resetn(reset_n_);
        
        sum_continuationAllocationSide_vcas_axi_full_bridge_.clk(clock);
        sum_continuationAllocationSide_vcas_axi_full_bridge_.resetn(reset_n_);
        
        sum_syncSide_axi_full_argRoute_0_bridge_.clk(clock);
        sum_syncSide_axi_full_argRoute_0_bridge_.resetn(reset_n_);
        
        sum_syncSide_axi_full_argRoute_1_bridge_.clk(clock);
        sum_syncSide_axi_full_argRoute_1_bridge_.resetn(reset_n_);
        
        fib_stealSide_axi_mgmt_vss_bridge_.clk(clock);
        fib_stealSide_axi_mgmt_vss_bridge_.resetn(reset_n_);
        
        fib_stealSide_vss_axi_full_bridge_.clk(clock);
        fib_stealSide_vss_axi_full_bridge_.resetn(reset_n_);
        

        /* connect bridges */
        fib_stealSide_taskOut_0_signals_.connect(fib_stealSide_taskOut_0_bridge_);
        fib_stealSide_taskOut_1_signals_.connect(fib_stealSide_taskOut_1_bridge_);
        fib_stealSide_taskOut_2_signals_.connect(fib_stealSide_taskOut_2_bridge_);
        fib_stealSide_taskOut_3_signals_.connect(fib_stealSide_taskOut_3_bridge_);
        fib_stealSide_taskOut_4_signals_.connect(fib_stealSide_taskOut_4_bridge_);
        fib_stealSide_taskIn_0_signals_.connect(fib_stealSide_taskIn_0_bridge_);
        fib_stealSide_taskIn_1_signals_.connect(fib_stealSide_taskIn_1_bridge_);
        fib_stealSide_taskIn_2_signals_.connect(fib_stealSide_taskIn_2_bridge_);
        fib_stealSide_taskIn_3_signals_.connect(fib_stealSide_taskIn_3_bridge_);
        fib_stealSide_taskIn_4_signals_.connect(fib_stealSide_taskIn_4_bridge_);
        sum_stealSide_taskOut_0_signals_.connect(sum_stealSide_taskOut_0_bridge_);
        sum_stealSide_taskOut_1_signals_.connect(sum_stealSide_taskOut_1_bridge_);
        sum_stealSide_taskOut_2_signals_.connect(sum_stealSide_taskOut_2_bridge_);
        sum_stealSide_taskOut_3_signals_.connect(sum_stealSide_taskOut_3_bridge_);
        sum_stealSide_taskOut_4_signals_.connect(sum_stealSide_taskOut_4_bridge_);
        sum_syncSide_addrIn_0_signals_.connect(sum_syncSide_addrIn_0_bridge_);
        sum_syncSide_addrIn_1_signals_.connect(sum_syncSide_addrIn_1_bridge_);
        sum_syncSide_addrIn_2_signals_.connect(sum_syncSide_addrIn_2_bridge_);
        sum_syncSide_addrIn_3_signals_.connect(sum_syncSide_addrIn_3_bridge_);
        sum_syncSide_addrIn_4_signals_.connect(sum_syncSide_addrIn_4_bridge_);
        sum_continuationAllocationSide_contOut_0_signals_.connect(sum_continuationAllocationSide_contOut_0_bridge_);
        sum_continuationAllocationSide_contOut_1_signals_.connect(sum_continuationAllocationSide_contOut_1_bridge_);
        sum_continuationAllocationSide_contOut_2_signals_.connect(sum_continuationAllocationSide_contOut_2_bridge_);
        sum_continuationAllocationSide_contOut_3_signals_.connect(sum_continuationAllocationSide_contOut_3_bridge_);
        sum_continuationAllocationSide_contOut_4_signals_.connect(sum_continuationAllocationSide_contOut_4_bridge_);
        sum_syncSide_addrIn_5_signals_.connect(sum_syncSide_addrIn_5_bridge_);
        sum_syncSide_addrIn_6_signals_.connect(sum_syncSide_addrIn_6_bridge_);
        sum_syncSide_addrIn_7_signals_.connect(sum_syncSide_addrIn_7_bridge_);
        sum_syncSide_addrIn_8_signals_.connect(sum_syncSide_addrIn_8_bridge_);
        sum_syncSide_addrIn_9_signals_.connect(sum_syncSide_addrIn_9_bridge_);
        sum_stealSide_axi_mgmt_vss_signals_.connect(sum_stealSide_axi_mgmt_vss_bridge_);
        sum_stealSide_vss_axi_full_signals_.connect(sum_stealSide_vss_axi_full_bridge_);
        sum_continuationAllocationSide_axi_mgmt_vcas_signals_.connect(sum_continuationAllocationSide_axi_mgmt_vcas_bridge_);
        sum_continuationAllocationSide_vcas_axi_full_signals_.connect(sum_continuationAllocationSide_vcas_axi_full_bridge_);
        sum_syncSide_axi_full_argRoute_0_signals_.connect(sum_syncSide_axi_full_argRoute_0_bridge_);
        sum_syncSide_axi_full_argRoute_1_signals_.connect(sum_syncSide_axi_full_argRoute_1_bridge_);
        fib_stealSide_axi_mgmt_vss_signals_.connect(fib_stealSide_axi_mgmt_vss_bridge_);
        fib_stealSide_vss_axi_full_signals_.connect(fib_stealSide_vss_axi_full_bridge_);

        /* initialize the map for accessing TLM sockets */
        sockets_["fib_stealSide_taskOut_0"] = &fib_stealSide_taskOut_0_bridge_.socket;
        sockets_["fib_stealSide_taskOut_1"] = &fib_stealSide_taskOut_1_bridge_.socket;
        sockets_["fib_stealSide_taskOut_2"] = &fib_stealSide_taskOut_2_bridge_.socket;
        sockets_["fib_stealSide_taskOut_3"] = &fib_stealSide_taskOut_3_bridge_.socket;
        sockets_["fib_stealSide_taskOut_4"] = &fib_stealSide_taskOut_4_bridge_.socket;
        sockets_["fib_stealSide_taskIn_0"] = &fib_stealSide_taskIn_0_bridge_.tgt_socket;
        sockets_["fib_stealSide_taskIn_1"] = &fib_stealSide_taskIn_1_bridge_.tgt_socket;
        sockets_["fib_stealSide_taskIn_2"] = &fib_stealSide_taskIn_2_bridge_.tgt_socket;
        sockets_["fib_stealSide_taskIn_3"] = &fib_stealSide_taskIn_3_bridge_.tgt_socket;
        sockets_["fib_stealSide_taskIn_4"] = &fib_stealSide_taskIn_4_bridge_.tgt_socket;
        sockets_["sum_stealSide_taskOut_0"] = &sum_stealSide_taskOut_0_bridge_.socket;
        sockets_["sum_stealSide_taskOut_1"] = &sum_stealSide_taskOut_1_bridge_.socket;
        sockets_["sum_stealSide_taskOut_2"] = &sum_stealSide_taskOut_2_bridge_.socket;
        sockets_["sum_stealSide_taskOut_3"] = &sum_stealSide_taskOut_3_bridge_.socket;
        sockets_["sum_stealSide_taskOut_4"] = &sum_stealSide_taskOut_4_bridge_.socket;
        sockets_["sum_syncSide_addrIn_0"] = &sum_syncSide_addrIn_0_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_1"] = &sum_syncSide_addrIn_1_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_2"] = &sum_syncSide_addrIn_2_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_3"] = &sum_syncSide_addrIn_3_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_4"] = &sum_syncSide_addrIn_4_bridge_.tgt_socket;
        sockets_["sum_continuationAllocationSide_contOut_0"] = &sum_continuationAllocationSide_contOut_0_bridge_.socket;
        sockets_["sum_continuationAllocationSide_contOut_1"] = &sum_continuationAllocationSide_contOut_1_bridge_.socket;
        sockets_["sum_continuationAllocationSide_contOut_2"] = &sum_continuationAllocationSide_contOut_2_bridge_.socket;
        sockets_["sum_continuationAllocationSide_contOut_3"] = &sum_continuationAllocationSide_contOut_3_bridge_.socket;
        sockets_["sum_continuationAllocationSide_contOut_4"] = &sum_continuationAllocationSide_contOut_4_bridge_.socket;
        sockets_["sum_syncSide_addrIn_5"] = &sum_syncSide_addrIn_5_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_6"] = &sum_syncSide_addrIn_6_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_7"] = &sum_syncSide_addrIn_7_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_8"] = &sum_syncSide_addrIn_8_bridge_.tgt_socket;
        sockets_["sum_syncSide_addrIn_9"] = &sum_syncSide_addrIn_9_bridge_.tgt_socket;
        sockets_["sum_stealSide_axi_mgmt_vss"] = &sum_stealSide_axi_mgmt_vss_bridge_.tgt_socket;
        sockets_["sum_stealSide_vss_axi_full"] = &sum_stealSide_vss_axi_full_bridge_.socket;
        sockets_["sum_continuationAllocationSide_axi_mgmt_vcas"] = &sum_continuationAllocationSide_axi_mgmt_vcas_bridge_.tgt_socket;
        sockets_["sum_continuationAllocationSide_vcas_axi_full"] = &sum_continuationAllocationSide_vcas_axi_full_bridge_.socket;
        sockets_["sum_syncSide_axi_full_argRoute_0"] = &sum_syncSide_axi_full_argRoute_0_bridge_.socket;
        sockets_["sum_syncSide_axi_full_argRoute_1"] = &sum_syncSide_axi_full_argRoute_1_bridge_.socket;
        sockets_["fib_stealSide_axi_mgmt_vss"] = &fib_stealSide_axi_mgmt_vss_bridge_.tgt_socket;
        sockets_["fib_stealSide_vss_axi_full"] = &fib_stealSide_vss_axi_full_bridge_.socket;

        /* thread that generates the ACTIVE_LOW reset signal */
        SC_THREAD(reset_n_generate_);
        sensitive << reset;

        do_connect_();
        do_init_();
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

    using sctlm::tlm_lib::tlm_module::get_object;

protected:
    using sctlm::tlm_lib::tlm_module::set_object;

private:
    /** @note Bridges require ACTIVE_LOW reset. */
    sc_core::sc_signal<bool> reset_n_;

    /* Interface signals */
    AXISSignals<128,0> fib_stealSide_taskOut_0_signals_;
    AXISSignals<128,0> fib_stealSide_taskOut_1_signals_;
    AXISSignals<128,0> fib_stealSide_taskOut_2_signals_;
    AXISSignals<128,0> fib_stealSide_taskOut_3_signals_;
    AXISSignals<128,0> fib_stealSide_taskOut_4_signals_;
    AXISSignals<128,0> fib_stealSide_taskIn_0_signals_;
    AXISSignals<128,0> fib_stealSide_taskIn_1_signals_;
    AXISSignals<128,0> fib_stealSide_taskIn_2_signals_;
    AXISSignals<128,0> fib_stealSide_taskIn_3_signals_;
    AXISSignals<128,0> fib_stealSide_taskIn_4_signals_;
    AXISSignals<256,0> sum_stealSide_taskOut_0_signals_;
    AXISSignals<256,0> sum_stealSide_taskOut_1_signals_;
    AXISSignals<256,0> sum_stealSide_taskOut_2_signals_;
    AXISSignals<256,0> sum_stealSide_taskOut_3_signals_;
    AXISSignals<256,0> sum_stealSide_taskOut_4_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_0_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_1_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_2_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_3_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_4_signals_;
    AXISSignals<64,0> sum_continuationAllocationSide_contOut_0_signals_;
    AXISSignals<64,0> sum_continuationAllocationSide_contOut_1_signals_;
    AXISSignals<64,0> sum_continuationAllocationSide_contOut_2_signals_;
    AXISSignals<64,0> sum_continuationAllocationSide_contOut_3_signals_;
    AXISSignals<64,0> sum_continuationAllocationSide_contOut_4_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_5_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_6_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_7_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_8_signals_;
    AXISSignals<64,0> sum_syncSide_addrIn_9_signals_;
    AXILiteSignals<6,64> sum_stealSide_axi_mgmt_vss_signals_;
    AXISignals<64,256,4,8,1,0,0,0,0,0> sum_stealSide_vss_axi_full_signals_;
    AXILiteSignals<6,64> sum_continuationAllocationSide_axi_mgmt_vcas_signals_;
    AXISignals<64,64,4,8,1,0,0,0,0,0> sum_continuationAllocationSide_vcas_axi_full_signals_;
    AXISignals<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_0_signals_;
    AXISignals<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_1_signals_;
    AXILiteSignals<6,64> fib_stealSide_axi_mgmt_vss_signals_;
    AXISignals<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_signals_;

    /* TLM bridges */
    axis2tlm_bridge<128,0> fib_stealSide_taskOut_0_bridge_;
    axis2tlm_bridge<128,0> fib_stealSide_taskOut_1_bridge_;
    axis2tlm_bridge<128,0> fib_stealSide_taskOut_2_bridge_;
    axis2tlm_bridge<128,0> fib_stealSide_taskOut_3_bridge_;
    axis2tlm_bridge<128,0> fib_stealSide_taskOut_4_bridge_;
    tlm2axis_bridge<128,0> fib_stealSide_taskIn_0_bridge_;
    tlm2axis_bridge<128,0> fib_stealSide_taskIn_1_bridge_;
    tlm2axis_bridge<128,0> fib_stealSide_taskIn_2_bridge_;
    tlm2axis_bridge<128,0> fib_stealSide_taskIn_3_bridge_;
    tlm2axis_bridge<128,0> fib_stealSide_taskIn_4_bridge_;
    axis2tlm_bridge<256,0> sum_stealSide_taskOut_0_bridge_;
    axis2tlm_bridge<256,0> sum_stealSide_taskOut_1_bridge_;
    axis2tlm_bridge<256,0> sum_stealSide_taskOut_2_bridge_;
    axis2tlm_bridge<256,0> sum_stealSide_taskOut_3_bridge_;
    axis2tlm_bridge<256,0> sum_stealSide_taskOut_4_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_0_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_1_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_2_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_3_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_4_bridge_;
    axis2tlm_bridge<64,0> sum_continuationAllocationSide_contOut_0_bridge_;
    axis2tlm_bridge<64,0> sum_continuationAllocationSide_contOut_1_bridge_;
    axis2tlm_bridge<64,0> sum_continuationAllocationSide_contOut_2_bridge_;
    axis2tlm_bridge<64,0> sum_continuationAllocationSide_contOut_3_bridge_;
    axis2tlm_bridge<64,0> sum_continuationAllocationSide_contOut_4_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_5_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_6_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_7_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_8_bridge_;
    tlm2axis_bridge<64,0> sum_syncSide_addrIn_9_bridge_;
    tlm2axilite_bridge<6,64> sum_stealSide_axi_mgmt_vss_bridge_;
    axi2tlm_bridge<64,256,4,8,1,0,0,0,0,0> sum_stealSide_vss_axi_full_bridge_;
    tlm2axilite_bridge<6,64> sum_continuationAllocationSide_axi_mgmt_vcas_bridge_;
    axi2tlm_bridge<64,64,4,8,1,0,0,0,0,0> sum_continuationAllocationSide_vcas_axi_full_bridge_;
    axi2tlm_bridge<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_0_bridge_;
    axi2tlm_bridge<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_1_bridge_;
    tlm2axilite_bridge<6,64> fib_stealSide_axi_mgmt_vss_bridge_;
    axi2tlm_bridge<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_bridge_;

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
        /* connecting AXI Stream interface with name: fib_stealSide_taskOut_0 */
        /* is_slave = False */
        fib_stealSide_taskOut_0_TREADY(fib_stealSide_taskOut_0_signals_.tready);
        fib_stealSide_taskOut_0_TVALID(fib_stealSide_taskOut_0_signals_.tvalid);
        fib_stealSide_taskOut_0_TDATA(fib_stealSide_taskOut_0_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskOut_1 */
        /* is_slave = False */
        fib_stealSide_taskOut_1_TREADY(fib_stealSide_taskOut_1_signals_.tready);
        fib_stealSide_taskOut_1_TVALID(fib_stealSide_taskOut_1_signals_.tvalid);
        fib_stealSide_taskOut_1_TDATA(fib_stealSide_taskOut_1_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskOut_2 */
        /* is_slave = False */
        fib_stealSide_taskOut_2_TREADY(fib_stealSide_taskOut_2_signals_.tready);
        fib_stealSide_taskOut_2_TVALID(fib_stealSide_taskOut_2_signals_.tvalid);
        fib_stealSide_taskOut_2_TDATA(fib_stealSide_taskOut_2_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskOut_3 */
        /* is_slave = False */
        fib_stealSide_taskOut_3_TREADY(fib_stealSide_taskOut_3_signals_.tready);
        fib_stealSide_taskOut_3_TVALID(fib_stealSide_taskOut_3_signals_.tvalid);
        fib_stealSide_taskOut_3_TDATA(fib_stealSide_taskOut_3_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskOut_4 */
        /* is_slave = False */
        fib_stealSide_taskOut_4_TREADY(fib_stealSide_taskOut_4_signals_.tready);
        fib_stealSide_taskOut_4_TVALID(fib_stealSide_taskOut_4_signals_.tvalid);
        fib_stealSide_taskOut_4_TDATA(fib_stealSide_taskOut_4_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskIn_0 */
        /* is_slave = True */
        fib_stealSide_taskIn_0_TREADY(fib_stealSide_taskIn_0_signals_.tready);
        fib_stealSide_taskIn_0_TVALID(fib_stealSide_taskIn_0_signals_.tvalid);
        fib_stealSide_taskIn_0_TDATA(fib_stealSide_taskIn_0_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskIn_1 */
        /* is_slave = True */
        fib_stealSide_taskIn_1_TREADY(fib_stealSide_taskIn_1_signals_.tready);
        fib_stealSide_taskIn_1_TVALID(fib_stealSide_taskIn_1_signals_.tvalid);
        fib_stealSide_taskIn_1_TDATA(fib_stealSide_taskIn_1_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskIn_2 */
        /* is_slave = True */
        fib_stealSide_taskIn_2_TREADY(fib_stealSide_taskIn_2_signals_.tready);
        fib_stealSide_taskIn_2_TVALID(fib_stealSide_taskIn_2_signals_.tvalid);
        fib_stealSide_taskIn_2_TDATA(fib_stealSide_taskIn_2_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskIn_3 */
        /* is_slave = True */
        fib_stealSide_taskIn_3_TREADY(fib_stealSide_taskIn_3_signals_.tready);
        fib_stealSide_taskIn_3_TVALID(fib_stealSide_taskIn_3_signals_.tvalid);
        fib_stealSide_taskIn_3_TDATA(fib_stealSide_taskIn_3_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: fib_stealSide_taskIn_4 */
        /* is_slave = True */
        fib_stealSide_taskIn_4_TREADY(fib_stealSide_taskIn_4_signals_.tready);
        fib_stealSide_taskIn_4_TVALID(fib_stealSide_taskIn_4_signals_.tvalid);
        fib_stealSide_taskIn_4_TDATA(fib_stealSide_taskIn_4_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_stealSide_taskOut_0 */
        /* is_slave = False */
        sum_stealSide_taskOut_0_TREADY(sum_stealSide_taskOut_0_signals_.tready);
        sum_stealSide_taskOut_0_TVALID(sum_stealSide_taskOut_0_signals_.tvalid);
        sum_stealSide_taskOut_0_TDATA(sum_stealSide_taskOut_0_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_stealSide_taskOut_1 */
        /* is_slave = False */
        sum_stealSide_taskOut_1_TREADY(sum_stealSide_taskOut_1_signals_.tready);
        sum_stealSide_taskOut_1_TVALID(sum_stealSide_taskOut_1_signals_.tvalid);
        sum_stealSide_taskOut_1_TDATA(sum_stealSide_taskOut_1_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_stealSide_taskOut_2 */
        /* is_slave = False */
        sum_stealSide_taskOut_2_TREADY(sum_stealSide_taskOut_2_signals_.tready);
        sum_stealSide_taskOut_2_TVALID(sum_stealSide_taskOut_2_signals_.tvalid);
        sum_stealSide_taskOut_2_TDATA(sum_stealSide_taskOut_2_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_stealSide_taskOut_3 */
        /* is_slave = False */
        sum_stealSide_taskOut_3_TREADY(sum_stealSide_taskOut_3_signals_.tready);
        sum_stealSide_taskOut_3_TVALID(sum_stealSide_taskOut_3_signals_.tvalid);
        sum_stealSide_taskOut_3_TDATA(sum_stealSide_taskOut_3_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_stealSide_taskOut_4 */
        /* is_slave = False */
        sum_stealSide_taskOut_4_TREADY(sum_stealSide_taskOut_4_signals_.tready);
        sum_stealSide_taskOut_4_TVALID(sum_stealSide_taskOut_4_signals_.tvalid);
        sum_stealSide_taskOut_4_TDATA(sum_stealSide_taskOut_4_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_0 */
        /* is_slave = True */
        sum_syncSide_addrIn_0_TREADY(sum_syncSide_addrIn_0_signals_.tready);
        sum_syncSide_addrIn_0_TVALID(sum_syncSide_addrIn_0_signals_.tvalid);
        sum_syncSide_addrIn_0_TDATA(sum_syncSide_addrIn_0_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_1 */
        /* is_slave = True */
        sum_syncSide_addrIn_1_TREADY(sum_syncSide_addrIn_1_signals_.tready);
        sum_syncSide_addrIn_1_TVALID(sum_syncSide_addrIn_1_signals_.tvalid);
        sum_syncSide_addrIn_1_TDATA(sum_syncSide_addrIn_1_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_2 */
        /* is_slave = True */
        sum_syncSide_addrIn_2_TREADY(sum_syncSide_addrIn_2_signals_.tready);
        sum_syncSide_addrIn_2_TVALID(sum_syncSide_addrIn_2_signals_.tvalid);
        sum_syncSide_addrIn_2_TDATA(sum_syncSide_addrIn_2_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_3 */
        /* is_slave = True */
        sum_syncSide_addrIn_3_TREADY(sum_syncSide_addrIn_3_signals_.tready);
        sum_syncSide_addrIn_3_TVALID(sum_syncSide_addrIn_3_signals_.tvalid);
        sum_syncSide_addrIn_3_TDATA(sum_syncSide_addrIn_3_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_4 */
        /* is_slave = True */
        sum_syncSide_addrIn_4_TREADY(sum_syncSide_addrIn_4_signals_.tready);
        sum_syncSide_addrIn_4_TVALID(sum_syncSide_addrIn_4_signals_.tvalid);
        sum_syncSide_addrIn_4_TDATA(sum_syncSide_addrIn_4_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_0 */
        /* is_slave = False */
        sum_continuationAllocationSide_contOut_0_TREADY(sum_continuationAllocationSide_contOut_0_signals_.tready);
        sum_continuationAllocationSide_contOut_0_TVALID(sum_continuationAllocationSide_contOut_0_signals_.tvalid);
        sum_continuationAllocationSide_contOut_0_TDATA(sum_continuationAllocationSide_contOut_0_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_1 */
        /* is_slave = False */
        sum_continuationAllocationSide_contOut_1_TREADY(sum_continuationAllocationSide_contOut_1_signals_.tready);
        sum_continuationAllocationSide_contOut_1_TVALID(sum_continuationAllocationSide_contOut_1_signals_.tvalid);
        sum_continuationAllocationSide_contOut_1_TDATA(sum_continuationAllocationSide_contOut_1_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_2 */
        /* is_slave = False */
        sum_continuationAllocationSide_contOut_2_TREADY(sum_continuationAllocationSide_contOut_2_signals_.tready);
        sum_continuationAllocationSide_contOut_2_TVALID(sum_continuationAllocationSide_contOut_2_signals_.tvalid);
        sum_continuationAllocationSide_contOut_2_TDATA(sum_continuationAllocationSide_contOut_2_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_3 */
        /* is_slave = False */
        sum_continuationAllocationSide_contOut_3_TREADY(sum_continuationAllocationSide_contOut_3_signals_.tready);
        sum_continuationAllocationSide_contOut_3_TVALID(sum_continuationAllocationSide_contOut_3_signals_.tvalid);
        sum_continuationAllocationSide_contOut_3_TDATA(sum_continuationAllocationSide_contOut_3_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_4 */
        /* is_slave = False */
        sum_continuationAllocationSide_contOut_4_TREADY(sum_continuationAllocationSide_contOut_4_signals_.tready);
        sum_continuationAllocationSide_contOut_4_TVALID(sum_continuationAllocationSide_contOut_4_signals_.tvalid);
        sum_continuationAllocationSide_contOut_4_TDATA(sum_continuationAllocationSide_contOut_4_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_5 */
        /* is_slave = True */
        sum_syncSide_addrIn_5_TREADY(sum_syncSide_addrIn_5_signals_.tready);
        sum_syncSide_addrIn_5_TVALID(sum_syncSide_addrIn_5_signals_.tvalid);
        sum_syncSide_addrIn_5_TDATA(sum_syncSide_addrIn_5_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_6 */
        /* is_slave = True */
        sum_syncSide_addrIn_6_TREADY(sum_syncSide_addrIn_6_signals_.tready);
        sum_syncSide_addrIn_6_TVALID(sum_syncSide_addrIn_6_signals_.tvalid);
        sum_syncSide_addrIn_6_TDATA(sum_syncSide_addrIn_6_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_7 */
        /* is_slave = True */
        sum_syncSide_addrIn_7_TREADY(sum_syncSide_addrIn_7_signals_.tready);
        sum_syncSide_addrIn_7_TVALID(sum_syncSide_addrIn_7_signals_.tvalid);
        sum_syncSide_addrIn_7_TDATA(sum_syncSide_addrIn_7_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_8 */
        /* is_slave = True */
        sum_syncSide_addrIn_8_TREADY(sum_syncSide_addrIn_8_signals_.tready);
        sum_syncSide_addrIn_8_TVALID(sum_syncSide_addrIn_8_signals_.tvalid);
        sum_syncSide_addrIn_8_TDATA(sum_syncSide_addrIn_8_signals_.tdata);
    
        
        /* connecting AXI Stream interface with name: sum_syncSide_addrIn_9 */
        /* is_slave = True */
        sum_syncSide_addrIn_9_TREADY(sum_syncSide_addrIn_9_signals_.tready);
        sum_syncSide_addrIn_9_TVALID(sum_syncSide_addrIn_9_signals_.tvalid);
        sum_syncSide_addrIn_9_TDATA(sum_syncSide_addrIn_9_signals_.tdata);
    
        
        /* connecting AXI4-Lite interface with name: sum_stealSide_axi_mgmt_vss */
        /* is_slave = True */
        sum_stealSide_axi_mgmt_vss_AWVALID(sum_stealSide_axi_mgmt_vss_signals_.awvalid);
        sum_stealSide_axi_mgmt_vss_AWREADY(sum_stealSide_axi_mgmt_vss_signals_.awready);
        sum_stealSide_axi_mgmt_vss_AWADDR(sum_stealSide_axi_mgmt_vss_signals_.awaddr);
        sum_stealSide_axi_mgmt_vss_AWPROT(sum_stealSide_axi_mgmt_vss_signals_.awprot);
        sum_stealSide_axi_mgmt_vss_WVALID(sum_stealSide_axi_mgmt_vss_signals_.wvalid);
        sum_stealSide_axi_mgmt_vss_WREADY(sum_stealSide_axi_mgmt_vss_signals_.wready);
        sum_stealSide_axi_mgmt_vss_WDATA(sum_stealSide_axi_mgmt_vss_signals_.wdata);
        sum_stealSide_axi_mgmt_vss_WSTRB(sum_stealSide_axi_mgmt_vss_signals_.wstrb);
        sum_stealSide_axi_mgmt_vss_BVALID(sum_stealSide_axi_mgmt_vss_signals_.bvalid);
        sum_stealSide_axi_mgmt_vss_BREADY(sum_stealSide_axi_mgmt_vss_signals_.bready);
        sum_stealSide_axi_mgmt_vss_BRESP(sum_stealSide_axi_mgmt_vss_signals_.bresp);
        sum_stealSide_axi_mgmt_vss_ARVALID(sum_stealSide_axi_mgmt_vss_signals_.arvalid);
        sum_stealSide_axi_mgmt_vss_ARREADY(sum_stealSide_axi_mgmt_vss_signals_.arready);
        sum_stealSide_axi_mgmt_vss_ARADDR(sum_stealSide_axi_mgmt_vss_signals_.araddr);
        sum_stealSide_axi_mgmt_vss_ARPROT(sum_stealSide_axi_mgmt_vss_signals_.arprot);
        sum_stealSide_axi_mgmt_vss_RVALID(sum_stealSide_axi_mgmt_vss_signals_.rvalid);
        sum_stealSide_axi_mgmt_vss_RREADY(sum_stealSide_axi_mgmt_vss_signals_.rready);
        sum_stealSide_axi_mgmt_vss_RDATA(sum_stealSide_axi_mgmt_vss_signals_.rdata);
        sum_stealSide_axi_mgmt_vss_RRESP(sum_stealSide_axi_mgmt_vss_signals_.rresp);
    
        
        
        /* connecting AXI4 interface with name: sum_stealSide_vss_axi_full */
        /* is_slave = False */
        sum_stealSide_vss_axi_full_AWVALID(sum_stealSide_vss_axi_full_signals_.awvalid);
        sum_stealSide_vss_axi_full_AWREADY(sum_stealSide_vss_axi_full_signals_.awready);
        sum_stealSide_vss_axi_full_AWADDR(sum_stealSide_vss_axi_full_signals_.awaddr);
        sum_stealSide_vss_axi_full_AWPROT(sum_stealSide_vss_axi_full_signals_.awprot);
        sum_stealSide_vss_axi_full_AWREGION(sum_stealSide_vss_axi_full_signals_.awregion);
        sum_stealSide_vss_axi_full_AWQOS(sum_stealSide_vss_axi_full_signals_.awqos);
        sum_stealSide_vss_axi_full_AWCACHE(sum_stealSide_vss_axi_full_signals_.awcache);
        sum_stealSide_vss_axi_full_AWBURST(sum_stealSide_vss_axi_full_signals_.awburst);
        sum_stealSide_vss_axi_full_AWSIZE(sum_stealSide_vss_axi_full_signals_.awsize);
        sum_stealSide_vss_axi_full_AWLEN(sum_stealSide_vss_axi_full_signals_.awlen);
        sum_stealSide_vss_axi_full_AWID(sum_stealSide_vss_axi_full_signals_.awid);
        sum_stealSide_vss_axi_full_AWLOCK(sum_stealSide_vss_axi_full_signals_.awlock);
        sum_stealSide_vss_axi_full_WID(sum_stealSide_vss_axi_full_signals_.wid);
        sum_stealSide_vss_axi_full_WVALID(sum_stealSide_vss_axi_full_signals_.wvalid);
        sum_stealSide_vss_axi_full_WREADY(sum_stealSide_vss_axi_full_signals_.wready);
        sum_stealSide_vss_axi_full_WDATA(sum_stealSide_vss_axi_full_signals_.wdata);
        sum_stealSide_vss_axi_full_WSTRB(sum_stealSide_vss_axi_full_signals_.wstrb);
        sum_stealSide_vss_axi_full_WLAST(sum_stealSide_vss_axi_full_signals_.wlast);
        sum_stealSide_vss_axi_full_BVALID(sum_stealSide_vss_axi_full_signals_.bvalid);
        sum_stealSide_vss_axi_full_BREADY(sum_stealSide_vss_axi_full_signals_.bready);
        sum_stealSide_vss_axi_full_BRESP(sum_stealSide_vss_axi_full_signals_.bresp);
        sum_stealSide_vss_axi_full_BID(sum_stealSide_vss_axi_full_signals_.bid);
        sum_stealSide_vss_axi_full_ARVALID(sum_stealSide_vss_axi_full_signals_.arvalid);
        sum_stealSide_vss_axi_full_ARREADY(sum_stealSide_vss_axi_full_signals_.arready);
        sum_stealSide_vss_axi_full_ARADDR(sum_stealSide_vss_axi_full_signals_.araddr);
        sum_stealSide_vss_axi_full_ARPROT(sum_stealSide_vss_axi_full_signals_.arprot);
        sum_stealSide_vss_axi_full_ARREGION(sum_stealSide_vss_axi_full_signals_.arregion);
        sum_stealSide_vss_axi_full_ARQOS(sum_stealSide_vss_axi_full_signals_.arqos);
        sum_stealSide_vss_axi_full_ARCACHE(sum_stealSide_vss_axi_full_signals_.arcache);
        sum_stealSide_vss_axi_full_ARBURST(sum_stealSide_vss_axi_full_signals_.arburst);
        sum_stealSide_vss_axi_full_ARSIZE(sum_stealSide_vss_axi_full_signals_.arsize);
        sum_stealSide_vss_axi_full_ARLEN(sum_stealSide_vss_axi_full_signals_.arlen);
        sum_stealSide_vss_axi_full_ARID(sum_stealSide_vss_axi_full_signals_.arid);
        sum_stealSide_vss_axi_full_ARLOCK(sum_stealSide_vss_axi_full_signals_.arlock);
        sum_stealSide_vss_axi_full_RVALID(sum_stealSide_vss_axi_full_signals_.rvalid);
        sum_stealSide_vss_axi_full_RREADY(sum_stealSide_vss_axi_full_signals_.rready);
        sum_stealSide_vss_axi_full_RDATA(sum_stealSide_vss_axi_full_signals_.rdata);
        sum_stealSide_vss_axi_full_RRESP(sum_stealSide_vss_axi_full_signals_.rresp);
        sum_stealSide_vss_axi_full_RID(sum_stealSide_vss_axi_full_signals_.rid);
        sum_stealSide_vss_axi_full_RLAST(sum_stealSide_vss_axi_full_signals_.rlast);
    
        
        /* connecting AXI4-Lite interface with name: sum_continuationAllocationSide_axi_mgmt_vcas */
        /* is_slave = True */
        sum_continuationAllocationSide_axi_mgmt_vcas_AWVALID(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.awvalid);
        sum_continuationAllocationSide_axi_mgmt_vcas_AWREADY(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.awready);
        sum_continuationAllocationSide_axi_mgmt_vcas_AWADDR(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.awaddr);
        sum_continuationAllocationSide_axi_mgmt_vcas_AWPROT(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.awprot);
        sum_continuationAllocationSide_axi_mgmt_vcas_WVALID(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.wvalid);
        sum_continuationAllocationSide_axi_mgmt_vcas_WREADY(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.wready);
        sum_continuationAllocationSide_axi_mgmt_vcas_WDATA(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.wdata);
        sum_continuationAllocationSide_axi_mgmt_vcas_WSTRB(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.wstrb);
        sum_continuationAllocationSide_axi_mgmt_vcas_BVALID(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.bvalid);
        sum_continuationAllocationSide_axi_mgmt_vcas_BREADY(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.bready);
        sum_continuationAllocationSide_axi_mgmt_vcas_BRESP(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.bresp);
        sum_continuationAllocationSide_axi_mgmt_vcas_ARVALID(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.arvalid);
        sum_continuationAllocationSide_axi_mgmt_vcas_ARREADY(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.arready);
        sum_continuationAllocationSide_axi_mgmt_vcas_ARADDR(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.araddr);
        sum_continuationAllocationSide_axi_mgmt_vcas_ARPROT(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.arprot);
        sum_continuationAllocationSide_axi_mgmt_vcas_RVALID(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.rvalid);
        sum_continuationAllocationSide_axi_mgmt_vcas_RREADY(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.rready);
        sum_continuationAllocationSide_axi_mgmt_vcas_RDATA(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.rdata);
        sum_continuationAllocationSide_axi_mgmt_vcas_RRESP(sum_continuationAllocationSide_axi_mgmt_vcas_signals_.rresp);
    
        
        
        /* connecting AXI4 interface with name: sum_continuationAllocationSide_vcas_axi_full */
        /* is_slave = False */
        sum_continuationAllocationSide_vcas_axi_full_AWVALID(sum_continuationAllocationSide_vcas_axi_full_signals_.awvalid);
        sum_continuationAllocationSide_vcas_axi_full_AWREADY(sum_continuationAllocationSide_vcas_axi_full_signals_.awready);
        sum_continuationAllocationSide_vcas_axi_full_AWADDR(sum_continuationAllocationSide_vcas_axi_full_signals_.awaddr);
        sum_continuationAllocationSide_vcas_axi_full_AWPROT(sum_continuationAllocationSide_vcas_axi_full_signals_.awprot);
        sum_continuationAllocationSide_vcas_axi_full_AWREGION(sum_continuationAllocationSide_vcas_axi_full_signals_.awregion);
        sum_continuationAllocationSide_vcas_axi_full_AWQOS(sum_continuationAllocationSide_vcas_axi_full_signals_.awqos);
        sum_continuationAllocationSide_vcas_axi_full_AWCACHE(sum_continuationAllocationSide_vcas_axi_full_signals_.awcache);
        sum_continuationAllocationSide_vcas_axi_full_AWBURST(sum_continuationAllocationSide_vcas_axi_full_signals_.awburst);
        sum_continuationAllocationSide_vcas_axi_full_AWSIZE(sum_continuationAllocationSide_vcas_axi_full_signals_.awsize);
        sum_continuationAllocationSide_vcas_axi_full_AWLEN(sum_continuationAllocationSide_vcas_axi_full_signals_.awlen);
        sum_continuationAllocationSide_vcas_axi_full_AWID(sum_continuationAllocationSide_vcas_axi_full_signals_.awid);
        sum_continuationAllocationSide_vcas_axi_full_AWLOCK(sum_continuationAllocationSide_vcas_axi_full_signals_.awlock);
        sum_continuationAllocationSide_vcas_axi_full_WID(sum_continuationAllocationSide_vcas_axi_full_signals_.wid);
        sum_continuationAllocationSide_vcas_axi_full_WVALID(sum_continuationAllocationSide_vcas_axi_full_signals_.wvalid);
        sum_continuationAllocationSide_vcas_axi_full_WREADY(sum_continuationAllocationSide_vcas_axi_full_signals_.wready);
        sum_continuationAllocationSide_vcas_axi_full_WDATA(sum_continuationAllocationSide_vcas_axi_full_signals_.wdata);
        sum_continuationAllocationSide_vcas_axi_full_WSTRB(sum_continuationAllocationSide_vcas_axi_full_signals_.wstrb);
        sum_continuationAllocationSide_vcas_axi_full_WLAST(sum_continuationAllocationSide_vcas_axi_full_signals_.wlast);
        sum_continuationAllocationSide_vcas_axi_full_BVALID(sum_continuationAllocationSide_vcas_axi_full_signals_.bvalid);
        sum_continuationAllocationSide_vcas_axi_full_BREADY(sum_continuationAllocationSide_vcas_axi_full_signals_.bready);
        sum_continuationAllocationSide_vcas_axi_full_BRESP(sum_continuationAllocationSide_vcas_axi_full_signals_.bresp);
        sum_continuationAllocationSide_vcas_axi_full_BID(sum_continuationAllocationSide_vcas_axi_full_signals_.bid);
        sum_continuationAllocationSide_vcas_axi_full_ARVALID(sum_continuationAllocationSide_vcas_axi_full_signals_.arvalid);
        sum_continuationAllocationSide_vcas_axi_full_ARREADY(sum_continuationAllocationSide_vcas_axi_full_signals_.arready);
        sum_continuationAllocationSide_vcas_axi_full_ARADDR(sum_continuationAllocationSide_vcas_axi_full_signals_.araddr);
        sum_continuationAllocationSide_vcas_axi_full_ARPROT(sum_continuationAllocationSide_vcas_axi_full_signals_.arprot);
        sum_continuationAllocationSide_vcas_axi_full_ARREGION(sum_continuationAllocationSide_vcas_axi_full_signals_.arregion);
        sum_continuationAllocationSide_vcas_axi_full_ARQOS(sum_continuationAllocationSide_vcas_axi_full_signals_.arqos);
        sum_continuationAllocationSide_vcas_axi_full_ARCACHE(sum_continuationAllocationSide_vcas_axi_full_signals_.arcache);
        sum_continuationAllocationSide_vcas_axi_full_ARBURST(sum_continuationAllocationSide_vcas_axi_full_signals_.arburst);
        sum_continuationAllocationSide_vcas_axi_full_ARSIZE(sum_continuationAllocationSide_vcas_axi_full_signals_.arsize);
        sum_continuationAllocationSide_vcas_axi_full_ARLEN(sum_continuationAllocationSide_vcas_axi_full_signals_.arlen);
        sum_continuationAllocationSide_vcas_axi_full_ARID(sum_continuationAllocationSide_vcas_axi_full_signals_.arid);
        sum_continuationAllocationSide_vcas_axi_full_ARLOCK(sum_continuationAllocationSide_vcas_axi_full_signals_.arlock);
        sum_continuationAllocationSide_vcas_axi_full_RVALID(sum_continuationAllocationSide_vcas_axi_full_signals_.rvalid);
        sum_continuationAllocationSide_vcas_axi_full_RREADY(sum_continuationAllocationSide_vcas_axi_full_signals_.rready);
        sum_continuationAllocationSide_vcas_axi_full_RDATA(sum_continuationAllocationSide_vcas_axi_full_signals_.rdata);
        sum_continuationAllocationSide_vcas_axi_full_RRESP(sum_continuationAllocationSide_vcas_axi_full_signals_.rresp);
        sum_continuationAllocationSide_vcas_axi_full_RID(sum_continuationAllocationSide_vcas_axi_full_signals_.rid);
        sum_continuationAllocationSide_vcas_axi_full_RLAST(sum_continuationAllocationSide_vcas_axi_full_signals_.rlast);
    
        
        
        /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_0 */
        /* is_slave = False */
        sum_syncSide_axi_full_argRoute_0_AWVALID(sum_syncSide_axi_full_argRoute_0_signals_.awvalid);
        sum_syncSide_axi_full_argRoute_0_AWREADY(sum_syncSide_axi_full_argRoute_0_signals_.awready);
        sum_syncSide_axi_full_argRoute_0_AWADDR(sum_syncSide_axi_full_argRoute_0_signals_.awaddr);
        sum_syncSide_axi_full_argRoute_0_AWPROT(sum_syncSide_axi_full_argRoute_0_signals_.awprot);
        sum_syncSide_axi_full_argRoute_0_AWREGION(sum_syncSide_axi_full_argRoute_0_signals_.awregion);
        sum_syncSide_axi_full_argRoute_0_AWQOS(sum_syncSide_axi_full_argRoute_0_signals_.awqos);
        sum_syncSide_axi_full_argRoute_0_AWCACHE(sum_syncSide_axi_full_argRoute_0_signals_.awcache);
        sum_syncSide_axi_full_argRoute_0_AWBURST(sum_syncSide_axi_full_argRoute_0_signals_.awburst);
        sum_syncSide_axi_full_argRoute_0_AWSIZE(sum_syncSide_axi_full_argRoute_0_signals_.awsize);
        sum_syncSide_axi_full_argRoute_0_AWLEN(sum_syncSide_axi_full_argRoute_0_signals_.awlen);
        sum_syncSide_axi_full_argRoute_0_AWID(sum_syncSide_axi_full_argRoute_0_signals_.awid);
        sum_syncSide_axi_full_argRoute_0_AWLOCK(sum_syncSide_axi_full_argRoute_0_signals_.awlock);
        sum_syncSide_axi_full_argRoute_0_WID(sum_syncSide_axi_full_argRoute_0_signals_.wid);
        sum_syncSide_axi_full_argRoute_0_WVALID(sum_syncSide_axi_full_argRoute_0_signals_.wvalid);
        sum_syncSide_axi_full_argRoute_0_WREADY(sum_syncSide_axi_full_argRoute_0_signals_.wready);
        sum_syncSide_axi_full_argRoute_0_WDATA(sum_syncSide_axi_full_argRoute_0_signals_.wdata);
        sum_syncSide_axi_full_argRoute_0_WSTRB(sum_syncSide_axi_full_argRoute_0_signals_.wstrb);
        sum_syncSide_axi_full_argRoute_0_WLAST(sum_syncSide_axi_full_argRoute_0_signals_.wlast);
        sum_syncSide_axi_full_argRoute_0_BVALID(sum_syncSide_axi_full_argRoute_0_signals_.bvalid);
        sum_syncSide_axi_full_argRoute_0_BREADY(sum_syncSide_axi_full_argRoute_0_signals_.bready);
        sum_syncSide_axi_full_argRoute_0_BRESP(sum_syncSide_axi_full_argRoute_0_signals_.bresp);
        sum_syncSide_axi_full_argRoute_0_BID(sum_syncSide_axi_full_argRoute_0_signals_.bid);
        sum_syncSide_axi_full_argRoute_0_ARVALID(sum_syncSide_axi_full_argRoute_0_signals_.arvalid);
        sum_syncSide_axi_full_argRoute_0_ARREADY(sum_syncSide_axi_full_argRoute_0_signals_.arready);
        sum_syncSide_axi_full_argRoute_0_ARADDR(sum_syncSide_axi_full_argRoute_0_signals_.araddr);
        sum_syncSide_axi_full_argRoute_0_ARPROT(sum_syncSide_axi_full_argRoute_0_signals_.arprot);
        sum_syncSide_axi_full_argRoute_0_ARREGION(sum_syncSide_axi_full_argRoute_0_signals_.arregion);
        sum_syncSide_axi_full_argRoute_0_ARQOS(sum_syncSide_axi_full_argRoute_0_signals_.arqos);
        sum_syncSide_axi_full_argRoute_0_ARCACHE(sum_syncSide_axi_full_argRoute_0_signals_.arcache);
        sum_syncSide_axi_full_argRoute_0_ARBURST(sum_syncSide_axi_full_argRoute_0_signals_.arburst);
        sum_syncSide_axi_full_argRoute_0_ARSIZE(sum_syncSide_axi_full_argRoute_0_signals_.arsize);
        sum_syncSide_axi_full_argRoute_0_ARLEN(sum_syncSide_axi_full_argRoute_0_signals_.arlen);
        sum_syncSide_axi_full_argRoute_0_ARID(sum_syncSide_axi_full_argRoute_0_signals_.arid);
        sum_syncSide_axi_full_argRoute_0_ARLOCK(sum_syncSide_axi_full_argRoute_0_signals_.arlock);
        sum_syncSide_axi_full_argRoute_0_RVALID(sum_syncSide_axi_full_argRoute_0_signals_.rvalid);
        sum_syncSide_axi_full_argRoute_0_RREADY(sum_syncSide_axi_full_argRoute_0_signals_.rready);
        sum_syncSide_axi_full_argRoute_0_RDATA(sum_syncSide_axi_full_argRoute_0_signals_.rdata);
        sum_syncSide_axi_full_argRoute_0_RRESP(sum_syncSide_axi_full_argRoute_0_signals_.rresp);
        sum_syncSide_axi_full_argRoute_0_RID(sum_syncSide_axi_full_argRoute_0_signals_.rid);
        sum_syncSide_axi_full_argRoute_0_RLAST(sum_syncSide_axi_full_argRoute_0_signals_.rlast);
    
        
        
        /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_1 */
        /* is_slave = False */
        sum_syncSide_axi_full_argRoute_1_AWVALID(sum_syncSide_axi_full_argRoute_1_signals_.awvalid);
        sum_syncSide_axi_full_argRoute_1_AWREADY(sum_syncSide_axi_full_argRoute_1_signals_.awready);
        sum_syncSide_axi_full_argRoute_1_AWADDR(sum_syncSide_axi_full_argRoute_1_signals_.awaddr);
        sum_syncSide_axi_full_argRoute_1_AWPROT(sum_syncSide_axi_full_argRoute_1_signals_.awprot);
        sum_syncSide_axi_full_argRoute_1_AWREGION(sum_syncSide_axi_full_argRoute_1_signals_.awregion);
        sum_syncSide_axi_full_argRoute_1_AWQOS(sum_syncSide_axi_full_argRoute_1_signals_.awqos);
        sum_syncSide_axi_full_argRoute_1_AWCACHE(sum_syncSide_axi_full_argRoute_1_signals_.awcache);
        sum_syncSide_axi_full_argRoute_1_AWBURST(sum_syncSide_axi_full_argRoute_1_signals_.awburst);
        sum_syncSide_axi_full_argRoute_1_AWSIZE(sum_syncSide_axi_full_argRoute_1_signals_.awsize);
        sum_syncSide_axi_full_argRoute_1_AWLEN(sum_syncSide_axi_full_argRoute_1_signals_.awlen);
        sum_syncSide_axi_full_argRoute_1_AWID(sum_syncSide_axi_full_argRoute_1_signals_.awid);
        sum_syncSide_axi_full_argRoute_1_AWLOCK(sum_syncSide_axi_full_argRoute_1_signals_.awlock);
        sum_syncSide_axi_full_argRoute_1_WID(sum_syncSide_axi_full_argRoute_1_signals_.wid);
        sum_syncSide_axi_full_argRoute_1_WVALID(sum_syncSide_axi_full_argRoute_1_signals_.wvalid);
        sum_syncSide_axi_full_argRoute_1_WREADY(sum_syncSide_axi_full_argRoute_1_signals_.wready);
        sum_syncSide_axi_full_argRoute_1_WDATA(sum_syncSide_axi_full_argRoute_1_signals_.wdata);
        sum_syncSide_axi_full_argRoute_1_WSTRB(sum_syncSide_axi_full_argRoute_1_signals_.wstrb);
        sum_syncSide_axi_full_argRoute_1_WLAST(sum_syncSide_axi_full_argRoute_1_signals_.wlast);
        sum_syncSide_axi_full_argRoute_1_BVALID(sum_syncSide_axi_full_argRoute_1_signals_.bvalid);
        sum_syncSide_axi_full_argRoute_1_BREADY(sum_syncSide_axi_full_argRoute_1_signals_.bready);
        sum_syncSide_axi_full_argRoute_1_BRESP(sum_syncSide_axi_full_argRoute_1_signals_.bresp);
        sum_syncSide_axi_full_argRoute_1_BID(sum_syncSide_axi_full_argRoute_1_signals_.bid);
        sum_syncSide_axi_full_argRoute_1_ARVALID(sum_syncSide_axi_full_argRoute_1_signals_.arvalid);
        sum_syncSide_axi_full_argRoute_1_ARREADY(sum_syncSide_axi_full_argRoute_1_signals_.arready);
        sum_syncSide_axi_full_argRoute_1_ARADDR(sum_syncSide_axi_full_argRoute_1_signals_.araddr);
        sum_syncSide_axi_full_argRoute_1_ARPROT(sum_syncSide_axi_full_argRoute_1_signals_.arprot);
        sum_syncSide_axi_full_argRoute_1_ARREGION(sum_syncSide_axi_full_argRoute_1_signals_.arregion);
        sum_syncSide_axi_full_argRoute_1_ARQOS(sum_syncSide_axi_full_argRoute_1_signals_.arqos);
        sum_syncSide_axi_full_argRoute_1_ARCACHE(sum_syncSide_axi_full_argRoute_1_signals_.arcache);
        sum_syncSide_axi_full_argRoute_1_ARBURST(sum_syncSide_axi_full_argRoute_1_signals_.arburst);
        sum_syncSide_axi_full_argRoute_1_ARSIZE(sum_syncSide_axi_full_argRoute_1_signals_.arsize);
        sum_syncSide_axi_full_argRoute_1_ARLEN(sum_syncSide_axi_full_argRoute_1_signals_.arlen);
        sum_syncSide_axi_full_argRoute_1_ARID(sum_syncSide_axi_full_argRoute_1_signals_.arid);
        sum_syncSide_axi_full_argRoute_1_ARLOCK(sum_syncSide_axi_full_argRoute_1_signals_.arlock);
        sum_syncSide_axi_full_argRoute_1_RVALID(sum_syncSide_axi_full_argRoute_1_signals_.rvalid);
        sum_syncSide_axi_full_argRoute_1_RREADY(sum_syncSide_axi_full_argRoute_1_signals_.rready);
        sum_syncSide_axi_full_argRoute_1_RDATA(sum_syncSide_axi_full_argRoute_1_signals_.rdata);
        sum_syncSide_axi_full_argRoute_1_RRESP(sum_syncSide_axi_full_argRoute_1_signals_.rresp);
        sum_syncSide_axi_full_argRoute_1_RID(sum_syncSide_axi_full_argRoute_1_signals_.rid);
        sum_syncSide_axi_full_argRoute_1_RLAST(sum_syncSide_axi_full_argRoute_1_signals_.rlast);
    
        
        /* connecting AXI4-Lite interface with name: fib_stealSide_axi_mgmt_vss */
        /* is_slave = True */
        fib_stealSide_axi_mgmt_vss_AWVALID(fib_stealSide_axi_mgmt_vss_signals_.awvalid);
        fib_stealSide_axi_mgmt_vss_AWREADY(fib_stealSide_axi_mgmt_vss_signals_.awready);
        fib_stealSide_axi_mgmt_vss_AWADDR(fib_stealSide_axi_mgmt_vss_signals_.awaddr);
        fib_stealSide_axi_mgmt_vss_AWPROT(fib_stealSide_axi_mgmt_vss_signals_.awprot);
        fib_stealSide_axi_mgmt_vss_WVALID(fib_stealSide_axi_mgmt_vss_signals_.wvalid);
        fib_stealSide_axi_mgmt_vss_WREADY(fib_stealSide_axi_mgmt_vss_signals_.wready);
        fib_stealSide_axi_mgmt_vss_WDATA(fib_stealSide_axi_mgmt_vss_signals_.wdata);
        fib_stealSide_axi_mgmt_vss_WSTRB(fib_stealSide_axi_mgmt_vss_signals_.wstrb);
        fib_stealSide_axi_mgmt_vss_BVALID(fib_stealSide_axi_mgmt_vss_signals_.bvalid);
        fib_stealSide_axi_mgmt_vss_BREADY(fib_stealSide_axi_mgmt_vss_signals_.bready);
        fib_stealSide_axi_mgmt_vss_BRESP(fib_stealSide_axi_mgmt_vss_signals_.bresp);
        fib_stealSide_axi_mgmt_vss_ARVALID(fib_stealSide_axi_mgmt_vss_signals_.arvalid);
        fib_stealSide_axi_mgmt_vss_ARREADY(fib_stealSide_axi_mgmt_vss_signals_.arready);
        fib_stealSide_axi_mgmt_vss_ARADDR(fib_stealSide_axi_mgmt_vss_signals_.araddr);
        fib_stealSide_axi_mgmt_vss_ARPROT(fib_stealSide_axi_mgmt_vss_signals_.arprot);
        fib_stealSide_axi_mgmt_vss_RVALID(fib_stealSide_axi_mgmt_vss_signals_.rvalid);
        fib_stealSide_axi_mgmt_vss_RREADY(fib_stealSide_axi_mgmt_vss_signals_.rready);
        fib_stealSide_axi_mgmt_vss_RDATA(fib_stealSide_axi_mgmt_vss_signals_.rdata);
        fib_stealSide_axi_mgmt_vss_RRESP(fib_stealSide_axi_mgmt_vss_signals_.rresp);
    
        
        
        /* connecting AXI4 interface with name: fib_stealSide_vss_axi_full */
        /* is_slave = False */
        fib_stealSide_vss_axi_full_AWVALID(fib_stealSide_vss_axi_full_signals_.awvalid);
        fib_stealSide_vss_axi_full_AWREADY(fib_stealSide_vss_axi_full_signals_.awready);
        fib_stealSide_vss_axi_full_AWADDR(fib_stealSide_vss_axi_full_signals_.awaddr);
        fib_stealSide_vss_axi_full_AWPROT(fib_stealSide_vss_axi_full_signals_.awprot);
        fib_stealSide_vss_axi_full_AWREGION(fib_stealSide_vss_axi_full_signals_.awregion);
        fib_stealSide_vss_axi_full_AWQOS(fib_stealSide_vss_axi_full_signals_.awqos);
        fib_stealSide_vss_axi_full_AWCACHE(fib_stealSide_vss_axi_full_signals_.awcache);
        fib_stealSide_vss_axi_full_AWBURST(fib_stealSide_vss_axi_full_signals_.awburst);
        fib_stealSide_vss_axi_full_AWSIZE(fib_stealSide_vss_axi_full_signals_.awsize);
        fib_stealSide_vss_axi_full_AWLEN(fib_stealSide_vss_axi_full_signals_.awlen);
        fib_stealSide_vss_axi_full_AWID(fib_stealSide_vss_axi_full_signals_.awid);
        fib_stealSide_vss_axi_full_AWLOCK(fib_stealSide_vss_axi_full_signals_.awlock);
        fib_stealSide_vss_axi_full_WID(fib_stealSide_vss_axi_full_signals_.wid);
        fib_stealSide_vss_axi_full_WVALID(fib_stealSide_vss_axi_full_signals_.wvalid);
        fib_stealSide_vss_axi_full_WREADY(fib_stealSide_vss_axi_full_signals_.wready);
        fib_stealSide_vss_axi_full_WDATA(fib_stealSide_vss_axi_full_signals_.wdata);
        fib_stealSide_vss_axi_full_WSTRB(fib_stealSide_vss_axi_full_signals_.wstrb);
        fib_stealSide_vss_axi_full_WLAST(fib_stealSide_vss_axi_full_signals_.wlast);
        fib_stealSide_vss_axi_full_BVALID(fib_stealSide_vss_axi_full_signals_.bvalid);
        fib_stealSide_vss_axi_full_BREADY(fib_stealSide_vss_axi_full_signals_.bready);
        fib_stealSide_vss_axi_full_BRESP(fib_stealSide_vss_axi_full_signals_.bresp);
        fib_stealSide_vss_axi_full_BID(fib_stealSide_vss_axi_full_signals_.bid);
        fib_stealSide_vss_axi_full_ARVALID(fib_stealSide_vss_axi_full_signals_.arvalid);
        fib_stealSide_vss_axi_full_ARREADY(fib_stealSide_vss_axi_full_signals_.arready);
        fib_stealSide_vss_axi_full_ARADDR(fib_stealSide_vss_axi_full_signals_.araddr);
        fib_stealSide_vss_axi_full_ARPROT(fib_stealSide_vss_axi_full_signals_.arprot);
        fib_stealSide_vss_axi_full_ARREGION(fib_stealSide_vss_axi_full_signals_.arregion);
        fib_stealSide_vss_axi_full_ARQOS(fib_stealSide_vss_axi_full_signals_.arqos);
        fib_stealSide_vss_axi_full_ARCACHE(fib_stealSide_vss_axi_full_signals_.arcache);
        fib_stealSide_vss_axi_full_ARBURST(fib_stealSide_vss_axi_full_signals_.arburst);
        fib_stealSide_vss_axi_full_ARSIZE(fib_stealSide_vss_axi_full_signals_.arsize);
        fib_stealSide_vss_axi_full_ARLEN(fib_stealSide_vss_axi_full_signals_.arlen);
        fib_stealSide_vss_axi_full_ARID(fib_stealSide_vss_axi_full_signals_.arid);
        fib_stealSide_vss_axi_full_ARLOCK(fib_stealSide_vss_axi_full_signals_.arlock);
        fib_stealSide_vss_axi_full_RVALID(fib_stealSide_vss_axi_full_signals_.rvalid);
        fib_stealSide_vss_axi_full_RREADY(fib_stealSide_vss_axi_full_signals_.rready);
        fib_stealSide_vss_axi_full_RDATA(fib_stealSide_vss_axi_full_signals_.rdata);
        fib_stealSide_vss_axi_full_RRESP(fib_stealSide_vss_axi_full_signals_.rresp);
        fib_stealSide_vss_axi_full_RID(fib_stealSide_vss_axi_full_signals_.rid);
        fib_stealSide_vss_axi_full_RLAST(fib_stealSide_vss_axi_full_signals_.rlast);
    
        
    }

    /** @brief Calls the initialization code. */
    void do_init_()
    {
    }
};



#endif // __GENERATED_FULLSYSGEN_INCLUDED_
