#ifndef __GENERATED_FIBONACCI__PECOUNTFIB_16__PECOUNTSUM_16_INCLUDED_
#define __GENERATED_FIBONACCI__PECOUNTFIB_16__PECOUNTSUM_16_INCLUDED_

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
#include "Vfibonacci__peCountFib_16__peCountSum_16.h"

namespace fibonacci::generated
{

struct fibonacci__peCountFib_16__peCountSum_16 :
    Vfibonacci__peCountFib_16__peCountSum_16,
    sctlm::tlm_lib::tlm_module
{
    SC_HAS_PROCESS(fibonacci__peCountFib_16__peCountSum_16);

    explicit fibonacci__peCountFib_16__peCountSum_16(sc_core::sc_module_name const &name);

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
        Vfibonacci__peCountFib_16__peCountSum_16::trace(tfp, levels, options);
    }
#endif
    
    static hardcilk::desc::HardCilkSystem description;
    

private:
    /** @note Bridges require ACTIVE_LOW reset. */
    sc_core::sc_signal<bool> reset_n_;

    /* Interface signals */
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_0_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_1_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_2_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_3_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_4_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_5_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_6_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_7_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_8_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_9_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_10_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_11_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_12_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_13_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_14_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskOut_15_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_0_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_1_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_2_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_3_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_4_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_5_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_6_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_7_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_8_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_9_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_10_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_11_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_12_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_13_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_14_signals_;
    sctlm::tlm_lib::signals::axis<128,0,true,true> fib_stealSide_taskIn_15_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_0_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_1_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_2_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_3_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_4_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_5_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_6_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_7_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_8_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_9_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_10_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_11_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_12_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_13_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_14_signals_;
    sctlm::tlm_lib::signals::axis<256,0,true,true> sum_stealSide_taskOut_15_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_0_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_1_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_2_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_3_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_4_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_5_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_6_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_7_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_8_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_9_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_10_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_11_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_12_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_13_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_14_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_15_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_0_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_1_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_2_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_3_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_4_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_5_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_6_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_7_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_8_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_9_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_10_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_11_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_12_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_13_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_14_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_continuationAllocationSide_contOut_15_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_16_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_17_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_18_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_19_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_20_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_21_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_22_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_23_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_24_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_25_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_26_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_27_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_28_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_29_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_30_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> sum_syncSide_addrIn_31_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> sum_stealSide_axi_mgmt_vss_0_signals_;
    sctlm::tlm_lib::signals::axi<64,256,4,8,1,0,0,0,0,0> sum_stealSide_vss_axi_full_0_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> sum_continuationAllocationSide_axi_mgmt_vcas_signals_;
    sctlm::tlm_lib::signals::axi<64,64,4,8,1,0,0,0,0,0> sum_continuationAllocationSide_vcas_axi_full_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_0_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_1_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_2_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_3_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_4_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_5_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_6_signals_;
    sctlm::tlm_lib::signals::axi<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_7_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> fib_stealSide_axi_mgmt_vss_0_signals_;
    sctlm::tlm_lib::signals::axi<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_0_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> fib_stealSide_axi_mgmt_vss_1_signals_;
    sctlm::tlm_lib::signals::axi<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_1_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> fib_stealSide_axi_mgmt_vss_2_signals_;
    sctlm::tlm_lib::signals::axi<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_2_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> fib_stealSide_axi_mgmt_vss_3_signals_;
    sctlm::tlm_lib::signals::axi<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_3_signals_;

    /* TLM bridges */
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_0_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_1_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_2_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_3_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_4_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_5_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_6_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_7_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_8_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_9_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_10_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_11_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_12_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_13_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_14_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<128,0,true,true> fib_stealSide_taskOut_15_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_1_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_2_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_3_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_4_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_5_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_6_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_7_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_8_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_9_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_10_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_11_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_12_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_13_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_14_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<128,0,true,true> fib_stealSide_taskIn_15_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_0_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_1_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_2_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_3_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_4_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_5_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_6_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_7_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_8_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_9_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_10_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_11_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_12_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_13_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_14_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<256,0,true,true> sum_stealSide_taskOut_15_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_1_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_2_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_3_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_4_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_5_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_6_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_7_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_8_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_9_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_10_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_11_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_12_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_13_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_14_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_15_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_0_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_1_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_2_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_3_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_4_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_5_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_6_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_7_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_8_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_9_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_10_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_11_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_12_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_13_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_14_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> sum_continuationAllocationSide_contOut_15_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_16_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_17_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_18_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_19_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_20_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_21_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_22_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_23_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_24_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_25_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_26_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_27_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_28_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_29_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_30_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> sum_syncSide_addrIn_31_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> sum_stealSide_axi_mgmt_vss_0_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,256,4,8,1,0,0,0,0,0> sum_stealSide_vss_axi_full_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> sum_continuationAllocationSide_axi_mgmt_vcas_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,64,4,8,1,0,0,0,0,0> sum_continuationAllocationSide_vcas_axi_full_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_0_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_1_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_2_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_3_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_4_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_5_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_6_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,32,4,8,1,0,0,0,0,0> sum_syncSide_axi_full_argRoute_7_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> fib_stealSide_axi_mgmt_vss_0_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> fib_stealSide_axi_mgmt_vss_1_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_1_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> fib_stealSide_axi_mgmt_vss_2_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_2_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> fib_stealSide_axi_mgmt_vss_3_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,128,4,8,1,0,0,0,0,0> fib_stealSide_vss_axi_full_3_bridge_;

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

#endif // __GENERATED_FIBONACCI__PECOUNTFIB_16__PECOUNTSUM_16_INCLUDED_
