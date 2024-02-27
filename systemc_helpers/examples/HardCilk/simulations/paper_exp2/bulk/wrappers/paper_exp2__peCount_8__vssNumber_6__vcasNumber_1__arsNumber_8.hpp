#ifndef __GENERATED_PAPER_EXP2__PECOUNT_8__VSSNUMBER_6__VCASNUMBER_1__ARSNUMBER_8_INCLUDED_
#define __GENERATED_PAPER_EXP2__PECOUNT_8__VSSNUMBER_6__VCASNUMBER_1__ARSNUMBER_8_INCLUDED_

#include <unordered_map>
#include <string>

#include <systemc>
#include <tlm>

#include <tlm_utils/simple_initiator_socket.h>
#include <tlm_utils/simple_target_socket.h>

#include <sctlm/tlm_lib/bridges/axi2tlm.hpp>
#include <sctlm/tlm_lib/bridges/axilite2tlm.hpp>
#include <sctlm/tlm_lib/bridges/axis2tlm.hpp>
#include <sctlm/tlm_lib/bridges/tlm2axi.hpp>
#include <sctlm/tlm_lib/bridges/tlm2axilite.hpp>
#include <sctlm/tlm_lib/bridges/tlm2axis.hpp>

#include <sctlm/tlm_lib/signals/axi.hpp>
#include <sctlm/tlm_lib/signals/axilite.hpp>
#include <sctlm/tlm_lib/signals/axis.hpp>

#include <sctlm/tlm_lib/tlm_module.hpp>

/* additional include directories */
#include <hardcilk/Desc.hpp>


/* Verilator-generated header */
#include "Vpaper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8.h"

namespace paper_exp2::generated
{

struct paper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8 :
    Vpaper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8,
    sctlm::tlm_lib::tlm_module
{
    SC_HAS_PROCESS(paper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8);

    explicit paper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8(sc_core::sc_module_name const &name);

    /**
      * @brief Find a TLM socket for the interface with the given name.
      * @note Throws if such an interface does not exist.
      *
      */
    tlm::tlm_base_socket_if *get_socket(const std::string &name = "") override
    {
        return sockets_.at(name);
    }

    sc_core::sc_module* systemc_module() noexcept override {
        return this;
    }

    sc_core::sc_module const* systemc_module() const noexcept override {
        return this;
    }

#if defined(VERILATED_TRACE_ENABLED)
    void verilated_trace(VerilatedVcdC* tfp, int levels, int options = 0) {
        Vpaper_exp2__peCount_8__vssNumber_6__vcasNumber_1__arsNumber_8::trace(tfp, levels, options);
    }
#endif
    
    static hardcilk::desc::FlexiTaskSystem description;
    

private:
    /** @note Bridges require ACTIVE_LOW reset. */
    sc_core::sc_signal<bool> reset_n_;

    /* Interface signals */
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_0_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_1_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_2_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_3_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_4_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_5_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_6_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskOut_7_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_0_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_1_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_2_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_3_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_4_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_5_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_6_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> task_stealSide_taskIn_7_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_0_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_1_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_2_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_3_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_4_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_5_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_6_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_syncSide_addrIn_7_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_0_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_1_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_2_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_3_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_4_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_5_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_6_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> task_continuationAllocationSide_contOut_7_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> task_stealSide_axi_mgmt_vss_0_signals_;
    sctlm::tlm_lib::signals::axi<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_0_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> task_stealSide_axi_mgmt_vss_1_signals_;
    sctlm::tlm_lib::signals::axi<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_1_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> task_stealSide_axi_mgmt_vss_2_signals_;
    sctlm::tlm_lib::signals::axi<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_2_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> task_stealSide_axi_mgmt_vss_3_signals_;
    sctlm::tlm_lib::signals::axi<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_3_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> task_stealSide_axi_mgmt_vss_4_signals_;
    sctlm::tlm_lib::signals::axi<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_4_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> task_stealSide_axi_mgmt_vss_5_signals_;
    sctlm::tlm_lib::signals::axi<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_5_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> task_continuationAllocationSide_axi_mgmt_vcas_signals_;
    sctlm::tlm_lib::signals::axi<64,64,4,8,1,0,0,0,0,0> task_continuationAllocationSide_vcas_axi_full_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_0_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_1_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_2_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_3_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_4_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_5_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_6_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_7_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_8_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_9_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_10_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_11_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_12_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_13_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_14_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_15_signals_;

    /* TLM bridges */
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_0_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_1_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_2_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_3_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_4_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_5_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_6_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> task_stealSide_taskOut_7_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_1_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_2_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_3_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_4_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_5_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_6_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<256,0,true,true> task_stealSide_taskIn_7_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_1_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_2_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_3_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_4_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_5_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_6_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> task_syncSide_addrIn_7_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_0_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_1_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_2_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_3_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_4_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_5_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_6_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> task_continuationAllocationSide_contOut_7_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> task_stealSide_axi_mgmt_vss_0_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> task_stealSide_axi_mgmt_vss_1_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_1_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> task_stealSide_axi_mgmt_vss_2_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_2_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> task_stealSide_axi_mgmt_vss_3_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_3_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> task_stealSide_axi_mgmt_vss_4_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_4_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> task_stealSide_axi_mgmt_vss_5_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,256,4,8,1,0,0,0,0,0> task_stealSide_vss_axi_full_5_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> task_continuationAllocationSide_axi_mgmt_vcas_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,64,4,8,1,0,0,0,0,0> task_continuationAllocationSide_vcas_axi_full_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_0_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_1_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_2_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_3_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_4_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_5_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_6_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_7_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_8_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_9_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_10_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_11_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_12_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_13_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_14_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> task_syncSide_axi_full_argRoute_15_bridge_;

    /** @brief Mapping between interface names to TLM sockets. */
    std::unordered_map<std::string, tlm::tlm_base_socket_if *> sockets_;

    
    /** @brief Generates the ACTIVE_LOW reset signal. */
    void reset_n_generate_();

    /** @brief Performs the connections of interfaces. */
    void do_connect_();

    /** @brief Calls the initialization code. */
    void do_init_();
};

}

#endif // __GENERATED_PAPER_EXP2__PECOUNT_8__VSSNUMBER_6__VCASNUMBER_1__ARSNUMBER_8_INCLUDED_
