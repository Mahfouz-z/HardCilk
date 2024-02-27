#ifndef __GENERATED_PAPER_EXP_DAE_1__PECOUNTACCESS_1__VSSNUMBERACCESS_1__PECOUNTEXECUTE_1__VSSNUMBEREXECUTE_1_INCLUDED_
#define __GENERATED_PAPER_EXP_DAE_1__PECOUNTACCESS_1__VSSNUMBERACCESS_1__PECOUNTEXECUTE_1__VSSNUMBEREXECUTE_1_INCLUDED_

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
#include "Vpaper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1.h"

namespace paper_exp_dae_1::generated
{

struct paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1 :
    Vpaper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1,
    sctlm::tlm_lib::tlm_module
{
    SC_HAS_PROCESS(paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1);

    explicit paper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1(sc_core::sc_module_name const &name);

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
        Vpaper_exp_dae_1__peCountAccess_1__vssNumberAccess_1__peCountExecute_1__vssNumberExecute_1::trace(tfp, levels, options);
    }
#endif
    
    static hardcilk::desc::FlexiTaskSystem description;
    

private:
    /** @note Bridges require ACTIVE_LOW reset. */
    sc_core::sc_signal<bool> reset_n_;

    /* Interface signals */
    sctlm::tlm_lib::signals::axis<64,0,true,true> access_stealSide_taskOut_0_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> access_stealSide_taskInGlobal_0_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> execute_stealSide_taskOut_0_signals_;
    sctlm::tlm_lib::signals::axis<64,0,true,true> execute_stealSide_taskInGlobal_0_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> access_stealSide_axi_mgmt_vss_0_signals_;
    sctlm::tlm_lib::signals::axi<64,64,4,8,1,0,0,0,0,0> access_stealSide_vss_axi_full_0_signals_;
    sctlm::tlm_lib::signals::axi_lite<6,64> execute_stealSide_axi_mgmt_vss_0_signals_;
    sctlm::tlm_lib::signals::axi<64,64,4,8,1,0,0,0,0,0> execute_stealSide_vss_axi_full_0_signals_;

    /* TLM bridges */
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> access_stealSide_taskOut_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> access_stealSide_taskInGlobal_0_bridge_;
    sctlm::tlm_lib::bridges::axis2tlm<64,0,true,true> execute_stealSide_taskOut_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axis<64,0,true,true> execute_stealSide_taskInGlobal_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> access_stealSide_axi_mgmt_vss_0_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,64,4,8,1,0,0,0,0,0> access_stealSide_vss_axi_full_0_bridge_;
    sctlm::tlm_lib::bridges::tlm2axilite<6,64> execute_stealSide_axi_mgmt_vss_0_bridge_;
    sctlm::tlm_lib::bridges::axi2tlm<64,64,4,8,1,0,0,0,0,0> execute_stealSide_vss_axi_full_0_bridge_;

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

#endif // __GENERATED_PAPER_EXP_DAE_1__PECOUNTACCESS_1__VSSNUMBERACCESS_1__PECOUNTEXECUTE_1__VSSNUMBEREXECUTE_1_INCLUDED_
