#include "verilated.hpp"

namespace fibonacci
{

VerilatedTlmModule::VerilatedTlmModule(sc_core::sc_module_name const &name):
    Vfibonacci(name),
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
    sum_stealSide_axi_mgmt_vss_0_signals_("sum_stealSide_axi_mgmt_vss_0_signals"),
    sum_stealSide_vss_axi_full_0_signals_("sum_stealSide_vss_axi_full_0_signals"),
    sum_continuationAllocationSide_axi_mgmt_vcas_signals_("sum_continuationAllocationSide_axi_mgmt_vcas_signals"),
    sum_continuationAllocationSide_vcas_axi_full_signals_("sum_continuationAllocationSide_vcas_axi_full_signals"),
    sum_syncSide_axi_full_argRoute_0_signals_("sum_syncSide_axi_full_argRoute_0_signals"),
    sum_syncSide_axi_full_argRoute_1_signals_("sum_syncSide_axi_full_argRoute_1_signals"),
    sum_syncSide_axi_full_argRoute_2_signals_("sum_syncSide_axi_full_argRoute_2_signals"),
    sum_syncSide_axi_full_argRoute_3_signals_("sum_syncSide_axi_full_argRoute_3_signals"),
    sum_syncSide_axi_full_argRoute_4_signals_("sum_syncSide_axi_full_argRoute_4_signals"),
    sum_syncSide_axi_full_argRoute_5_signals_("sum_syncSide_axi_full_argRoute_5_signals"),
    sum_syncSide_axi_full_argRoute_6_signals_("sum_syncSide_axi_full_argRoute_6_signals"),
    sum_syncSide_axi_full_argRoute_7_signals_("sum_syncSide_axi_full_argRoute_7_signals"),
    fib_stealSide_axi_mgmt_vss_0_signals_("fib_stealSide_axi_mgmt_vss_0_signals"),
    fib_stealSide_vss_axi_full_0_signals_("fib_stealSide_vss_axi_full_0_signals"),
    fib_stealSide_axi_mgmt_vss_1_signals_("fib_stealSide_axi_mgmt_vss_1_signals"),
    fib_stealSide_vss_axi_full_1_signals_("fib_stealSide_vss_axi_full_1_signals"),
    fib_stealSide_axi_mgmt_vss_2_signals_("fib_stealSide_axi_mgmt_vss_2_signals"),
    fib_stealSide_vss_axi_full_2_signals_("fib_stealSide_vss_axi_full_2_signals"),
    fib_stealSide_axi_mgmt_vss_3_signals_("fib_stealSide_axi_mgmt_vss_3_signals"),
    fib_stealSide_vss_axi_full_3_signals_("fib_stealSide_vss_axi_full_3_signals"),
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
    sum_stealSide_axi_mgmt_vss_0_bridge_("sum_stealSide_axi_mgmt_vss_0_bridge"),
    sum_stealSide_vss_axi_full_0_bridge_("sum_stealSide_vss_axi_full_0_bridge"),
    sum_continuationAllocationSide_axi_mgmt_vcas_bridge_("sum_continuationAllocationSide_axi_mgmt_vcas_bridge"),
    sum_continuationAllocationSide_vcas_axi_full_bridge_("sum_continuationAllocationSide_vcas_axi_full_bridge"),
    sum_syncSide_axi_full_argRoute_0_bridge_("sum_syncSide_axi_full_argRoute_0_bridge"),
    sum_syncSide_axi_full_argRoute_1_bridge_("sum_syncSide_axi_full_argRoute_1_bridge"),
    sum_syncSide_axi_full_argRoute_2_bridge_("sum_syncSide_axi_full_argRoute_2_bridge"),
    sum_syncSide_axi_full_argRoute_3_bridge_("sum_syncSide_axi_full_argRoute_3_bridge"),
    sum_syncSide_axi_full_argRoute_4_bridge_("sum_syncSide_axi_full_argRoute_4_bridge"),
    sum_syncSide_axi_full_argRoute_5_bridge_("sum_syncSide_axi_full_argRoute_5_bridge"),
    sum_syncSide_axi_full_argRoute_6_bridge_("sum_syncSide_axi_full_argRoute_6_bridge"),
    sum_syncSide_axi_full_argRoute_7_bridge_("sum_syncSide_axi_full_argRoute_7_bridge"),
    fib_stealSide_axi_mgmt_vss_0_bridge_("fib_stealSide_axi_mgmt_vss_0_bridge"),
    fib_stealSide_vss_axi_full_0_bridge_("fib_stealSide_vss_axi_full_0_bridge"),
    fib_stealSide_axi_mgmt_vss_1_bridge_("fib_stealSide_axi_mgmt_vss_1_bridge"),
    fib_stealSide_vss_axi_full_1_bridge_("fib_stealSide_vss_axi_full_1_bridge"),
    fib_stealSide_axi_mgmt_vss_2_bridge_("fib_stealSide_axi_mgmt_vss_2_bridge"),
    fib_stealSide_vss_axi_full_2_bridge_("fib_stealSide_vss_axi_full_2_bridge"),
    fib_stealSide_axi_mgmt_vss_3_bridge_("fib_stealSide_axi_mgmt_vss_3_bridge"),
    fib_stealSide_vss_axi_full_3_bridge_("fib_stealSide_vss_axi_full_3_bridge")
    
{
    do_connect_();

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
    sockets_["sum_stealSide_axi_mgmt_vss_0"] = &sum_stealSide_axi_mgmt_vss_0_bridge_.tgt_socket;
    sockets_["sum_stealSide_vss_axi_full_0"] = &sum_stealSide_vss_axi_full_0_bridge_.socket;
    sockets_["sum_continuationAllocationSide_axi_mgmt_vcas"] = &sum_continuationAllocationSide_axi_mgmt_vcas_bridge_.tgt_socket;
    sockets_["sum_continuationAllocationSide_vcas_axi_full"] = &sum_continuationAllocationSide_vcas_axi_full_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_0"] = &sum_syncSide_axi_full_argRoute_0_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_1"] = &sum_syncSide_axi_full_argRoute_1_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_2"] = &sum_syncSide_axi_full_argRoute_2_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_3"] = &sum_syncSide_axi_full_argRoute_3_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_4"] = &sum_syncSide_axi_full_argRoute_4_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_5"] = &sum_syncSide_axi_full_argRoute_5_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_6"] = &sum_syncSide_axi_full_argRoute_6_bridge_.socket;
    sockets_["sum_syncSide_axi_full_argRoute_7"] = &sum_syncSide_axi_full_argRoute_7_bridge_.socket;
    sockets_["fib_stealSide_axi_mgmt_vss_0"] = &fib_stealSide_axi_mgmt_vss_0_bridge_.tgt_socket;
    sockets_["fib_stealSide_vss_axi_full_0"] = &fib_stealSide_vss_axi_full_0_bridge_.socket;
    sockets_["fib_stealSide_axi_mgmt_vss_1"] = &fib_stealSide_axi_mgmt_vss_1_bridge_.tgt_socket;
    sockets_["fib_stealSide_vss_axi_full_1"] = &fib_stealSide_vss_axi_full_1_bridge_.socket;
    sockets_["fib_stealSide_axi_mgmt_vss_2"] = &fib_stealSide_axi_mgmt_vss_2_bridge_.tgt_socket;
    sockets_["fib_stealSide_vss_axi_full_2"] = &fib_stealSide_vss_axi_full_2_bridge_.socket;
    sockets_["fib_stealSide_axi_mgmt_vss_3"] = &fib_stealSide_axi_mgmt_vss_3_bridge_.tgt_socket;
    sockets_["fib_stealSide_vss_axi_full_3"] = &fib_stealSide_vss_axi_full_3_bridge_.socket;

    /* thread that generates the ACTIVE_LOW reset signal */
    SC_THREAD(reset_n_generate_);
    sensitive << reset;

    do_init_();
}


void VerilatedTlmModule::reset_n_generate_()
{
    reset_n_.write(!reset.read());
}

void VerilatedTlmModule::do_connect_()
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
    
    sum_stealSide_axi_mgmt_vss_0_bridge_.clk(clock);
    sum_stealSide_axi_mgmt_vss_0_bridge_.resetn(reset_n_);
    
    sum_stealSide_vss_axi_full_0_bridge_.clk(clock);
    sum_stealSide_vss_axi_full_0_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_axi_mgmt_vcas_bridge_.clk(clock);
    sum_continuationAllocationSide_axi_mgmt_vcas_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_vcas_axi_full_bridge_.clk(clock);
    sum_continuationAllocationSide_vcas_axi_full_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_0_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_0_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_1_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_1_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_2_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_2_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_3_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_3_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_4_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_4_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_5_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_5_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_6_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_6_bridge_.resetn(reset_n_);
    
    sum_syncSide_axi_full_argRoute_7_bridge_.clk(clock);
    sum_syncSide_axi_full_argRoute_7_bridge_.resetn(reset_n_);
    
    fib_stealSide_axi_mgmt_vss_0_bridge_.clk(clock);
    fib_stealSide_axi_mgmt_vss_0_bridge_.resetn(reset_n_);
    
    fib_stealSide_vss_axi_full_0_bridge_.clk(clock);
    fib_stealSide_vss_axi_full_0_bridge_.resetn(reset_n_);
    
    fib_stealSide_axi_mgmt_vss_1_bridge_.clk(clock);
    fib_stealSide_axi_mgmt_vss_1_bridge_.resetn(reset_n_);
    
    fib_stealSide_vss_axi_full_1_bridge_.clk(clock);
    fib_stealSide_vss_axi_full_1_bridge_.resetn(reset_n_);
    
    fib_stealSide_axi_mgmt_vss_2_bridge_.clk(clock);
    fib_stealSide_axi_mgmt_vss_2_bridge_.resetn(reset_n_);
    
    fib_stealSide_vss_axi_full_2_bridge_.clk(clock);
    fib_stealSide_vss_axi_full_2_bridge_.resetn(reset_n_);
    
    fib_stealSide_axi_mgmt_vss_3_bridge_.clk(clock);
    fib_stealSide_axi_mgmt_vss_3_bridge_.resetn(reset_n_);
    
    fib_stealSide_vss_axi_full_3_bridge_.clk(clock);
    fib_stealSide_vss_axi_full_3_bridge_.resetn(reset_n_);
    


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
    sum_stealSide_axi_mgmt_vss_0_signals_.connect(sum_stealSide_axi_mgmt_vss_0_bridge_);
    sum_stealSide_vss_axi_full_0_signals_.connect(sum_stealSide_vss_axi_full_0_bridge_);
    sum_continuationAllocationSide_axi_mgmt_vcas_signals_.connect(sum_continuationAllocationSide_axi_mgmt_vcas_bridge_);
    sum_continuationAllocationSide_vcas_axi_full_signals_.connect(sum_continuationAllocationSide_vcas_axi_full_bridge_);
    sum_syncSide_axi_full_argRoute_0_signals_.connect(sum_syncSide_axi_full_argRoute_0_bridge_);
    sum_syncSide_axi_full_argRoute_1_signals_.connect(sum_syncSide_axi_full_argRoute_1_bridge_);
    sum_syncSide_axi_full_argRoute_2_signals_.connect(sum_syncSide_axi_full_argRoute_2_bridge_);
    sum_syncSide_axi_full_argRoute_3_signals_.connect(sum_syncSide_axi_full_argRoute_3_bridge_);
    sum_syncSide_axi_full_argRoute_4_signals_.connect(sum_syncSide_axi_full_argRoute_4_bridge_);
    sum_syncSide_axi_full_argRoute_5_signals_.connect(sum_syncSide_axi_full_argRoute_5_bridge_);
    sum_syncSide_axi_full_argRoute_6_signals_.connect(sum_syncSide_axi_full_argRoute_6_bridge_);
    sum_syncSide_axi_full_argRoute_7_signals_.connect(sum_syncSide_axi_full_argRoute_7_bridge_);
    fib_stealSide_axi_mgmt_vss_0_signals_.connect(fib_stealSide_axi_mgmt_vss_0_bridge_);
    fib_stealSide_vss_axi_full_0_signals_.connect(fib_stealSide_vss_axi_full_0_bridge_);
    fib_stealSide_axi_mgmt_vss_1_signals_.connect(fib_stealSide_axi_mgmt_vss_1_bridge_);
    fib_stealSide_vss_axi_full_1_signals_.connect(fib_stealSide_vss_axi_full_1_bridge_);
    fib_stealSide_axi_mgmt_vss_2_signals_.connect(fib_stealSide_axi_mgmt_vss_2_bridge_);
    fib_stealSide_vss_axi_full_2_signals_.connect(fib_stealSide_vss_axi_full_2_bridge_);
    fib_stealSide_axi_mgmt_vss_3_signals_.connect(fib_stealSide_axi_mgmt_vss_3_bridge_);
    fib_stealSide_vss_axi_full_3_signals_.connect(fib_stealSide_vss_axi_full_3_bridge_);


    /* connect signals */
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
    
    
    /* connecting AXI4-Lite interface with name: sum_stealSide_axi_mgmt_vss_0 */
    /* is_slave = True */
    sum_stealSide_axi_mgmt_vss_0_AWVALID(sum_stealSide_axi_mgmt_vss_0_signals_.awvalid);
    sum_stealSide_axi_mgmt_vss_0_AWREADY(sum_stealSide_axi_mgmt_vss_0_signals_.awready);
    sum_stealSide_axi_mgmt_vss_0_AWADDR(sum_stealSide_axi_mgmt_vss_0_signals_.awaddr);
    sum_stealSide_axi_mgmt_vss_0_AWPROT(sum_stealSide_axi_mgmt_vss_0_signals_.awprot);
    sum_stealSide_axi_mgmt_vss_0_WVALID(sum_stealSide_axi_mgmt_vss_0_signals_.wvalid);
    sum_stealSide_axi_mgmt_vss_0_WREADY(sum_stealSide_axi_mgmt_vss_0_signals_.wready);
    sum_stealSide_axi_mgmt_vss_0_WDATA(sum_stealSide_axi_mgmt_vss_0_signals_.wdata);
    sum_stealSide_axi_mgmt_vss_0_WSTRB(sum_stealSide_axi_mgmt_vss_0_signals_.wstrb);
    sum_stealSide_axi_mgmt_vss_0_BVALID(sum_stealSide_axi_mgmt_vss_0_signals_.bvalid);
    sum_stealSide_axi_mgmt_vss_0_BREADY(sum_stealSide_axi_mgmt_vss_0_signals_.bready);
    sum_stealSide_axi_mgmt_vss_0_BRESP(sum_stealSide_axi_mgmt_vss_0_signals_.bresp);
    sum_stealSide_axi_mgmt_vss_0_ARVALID(sum_stealSide_axi_mgmt_vss_0_signals_.arvalid);
    sum_stealSide_axi_mgmt_vss_0_ARREADY(sum_stealSide_axi_mgmt_vss_0_signals_.arready);
    sum_stealSide_axi_mgmt_vss_0_ARADDR(sum_stealSide_axi_mgmt_vss_0_signals_.araddr);
    sum_stealSide_axi_mgmt_vss_0_ARPROT(sum_stealSide_axi_mgmt_vss_0_signals_.arprot);
    sum_stealSide_axi_mgmt_vss_0_RVALID(sum_stealSide_axi_mgmt_vss_0_signals_.rvalid);
    sum_stealSide_axi_mgmt_vss_0_RREADY(sum_stealSide_axi_mgmt_vss_0_signals_.rready);
    sum_stealSide_axi_mgmt_vss_0_RDATA(sum_stealSide_axi_mgmt_vss_0_signals_.rdata);
    sum_stealSide_axi_mgmt_vss_0_RRESP(sum_stealSide_axi_mgmt_vss_0_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: sum_stealSide_vss_axi_full_0 */
    /* is_slave = False */
    sum_stealSide_vss_axi_full_0_AWVALID(sum_stealSide_vss_axi_full_0_signals_.awvalid);
    sum_stealSide_vss_axi_full_0_AWREADY(sum_stealSide_vss_axi_full_0_signals_.awready);
    sum_stealSide_vss_axi_full_0_AWADDR(sum_stealSide_vss_axi_full_0_signals_.awaddr);
    sum_stealSide_vss_axi_full_0_AWPROT(sum_stealSide_vss_axi_full_0_signals_.awprot);
    sum_stealSide_vss_axi_full_0_AWREGION(sum_stealSide_vss_axi_full_0_signals_.awregion);
    sum_stealSide_vss_axi_full_0_AWQOS(sum_stealSide_vss_axi_full_0_signals_.awqos);
    sum_stealSide_vss_axi_full_0_AWCACHE(sum_stealSide_vss_axi_full_0_signals_.awcache);
    sum_stealSide_vss_axi_full_0_AWBURST(sum_stealSide_vss_axi_full_0_signals_.awburst);
    sum_stealSide_vss_axi_full_0_AWSIZE(sum_stealSide_vss_axi_full_0_signals_.awsize);
    sum_stealSide_vss_axi_full_0_AWLEN(sum_stealSide_vss_axi_full_0_signals_.awlen);
    sum_stealSide_vss_axi_full_0_AWID(sum_stealSide_vss_axi_full_0_signals_.awid);
    sum_stealSide_vss_axi_full_0_AWLOCK(sum_stealSide_vss_axi_full_0_signals_.awlock);
    sum_stealSide_vss_axi_full_0_WID(sum_stealSide_vss_axi_full_0_signals_.wid);
    sum_stealSide_vss_axi_full_0_WVALID(sum_stealSide_vss_axi_full_0_signals_.wvalid);
    sum_stealSide_vss_axi_full_0_WREADY(sum_stealSide_vss_axi_full_0_signals_.wready);
    sum_stealSide_vss_axi_full_0_WDATA(sum_stealSide_vss_axi_full_0_signals_.wdata);
    sum_stealSide_vss_axi_full_0_WSTRB(sum_stealSide_vss_axi_full_0_signals_.wstrb);
    sum_stealSide_vss_axi_full_0_WLAST(sum_stealSide_vss_axi_full_0_signals_.wlast);
    sum_stealSide_vss_axi_full_0_BVALID(sum_stealSide_vss_axi_full_0_signals_.bvalid);
    sum_stealSide_vss_axi_full_0_BREADY(sum_stealSide_vss_axi_full_0_signals_.bready);
    sum_stealSide_vss_axi_full_0_BRESP(sum_stealSide_vss_axi_full_0_signals_.bresp);
    sum_stealSide_vss_axi_full_0_BID(sum_stealSide_vss_axi_full_0_signals_.bid);
    sum_stealSide_vss_axi_full_0_ARVALID(sum_stealSide_vss_axi_full_0_signals_.arvalid);
    sum_stealSide_vss_axi_full_0_ARREADY(sum_stealSide_vss_axi_full_0_signals_.arready);
    sum_stealSide_vss_axi_full_0_ARADDR(sum_stealSide_vss_axi_full_0_signals_.araddr);
    sum_stealSide_vss_axi_full_0_ARPROT(sum_stealSide_vss_axi_full_0_signals_.arprot);
    sum_stealSide_vss_axi_full_0_ARREGION(sum_stealSide_vss_axi_full_0_signals_.arregion);
    sum_stealSide_vss_axi_full_0_ARQOS(sum_stealSide_vss_axi_full_0_signals_.arqos);
    sum_stealSide_vss_axi_full_0_ARCACHE(sum_stealSide_vss_axi_full_0_signals_.arcache);
    sum_stealSide_vss_axi_full_0_ARBURST(sum_stealSide_vss_axi_full_0_signals_.arburst);
    sum_stealSide_vss_axi_full_0_ARSIZE(sum_stealSide_vss_axi_full_0_signals_.arsize);
    sum_stealSide_vss_axi_full_0_ARLEN(sum_stealSide_vss_axi_full_0_signals_.arlen);
    sum_stealSide_vss_axi_full_0_ARID(sum_stealSide_vss_axi_full_0_signals_.arid);
    sum_stealSide_vss_axi_full_0_ARLOCK(sum_stealSide_vss_axi_full_0_signals_.arlock);
    sum_stealSide_vss_axi_full_0_RVALID(sum_stealSide_vss_axi_full_0_signals_.rvalid);
    sum_stealSide_vss_axi_full_0_RREADY(sum_stealSide_vss_axi_full_0_signals_.rready);
    sum_stealSide_vss_axi_full_0_RDATA(sum_stealSide_vss_axi_full_0_signals_.rdata);
    sum_stealSide_vss_axi_full_0_RRESP(sum_stealSide_vss_axi_full_0_signals_.rresp);
    sum_stealSide_vss_axi_full_0_RID(sum_stealSide_vss_axi_full_0_signals_.rid);
    sum_stealSide_vss_axi_full_0_RLAST(sum_stealSide_vss_axi_full_0_signals_.rlast);
    
    
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
    
    
    /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_2 */
    /* is_slave = False */
    sum_syncSide_axi_full_argRoute_2_AWVALID(sum_syncSide_axi_full_argRoute_2_signals_.awvalid);
    sum_syncSide_axi_full_argRoute_2_AWREADY(sum_syncSide_axi_full_argRoute_2_signals_.awready);
    sum_syncSide_axi_full_argRoute_2_AWADDR(sum_syncSide_axi_full_argRoute_2_signals_.awaddr);
    sum_syncSide_axi_full_argRoute_2_AWPROT(sum_syncSide_axi_full_argRoute_2_signals_.awprot);
    sum_syncSide_axi_full_argRoute_2_AWREGION(sum_syncSide_axi_full_argRoute_2_signals_.awregion);
    sum_syncSide_axi_full_argRoute_2_AWQOS(sum_syncSide_axi_full_argRoute_2_signals_.awqos);
    sum_syncSide_axi_full_argRoute_2_AWCACHE(sum_syncSide_axi_full_argRoute_2_signals_.awcache);
    sum_syncSide_axi_full_argRoute_2_AWBURST(sum_syncSide_axi_full_argRoute_2_signals_.awburst);
    sum_syncSide_axi_full_argRoute_2_AWSIZE(sum_syncSide_axi_full_argRoute_2_signals_.awsize);
    sum_syncSide_axi_full_argRoute_2_AWLEN(sum_syncSide_axi_full_argRoute_2_signals_.awlen);
    sum_syncSide_axi_full_argRoute_2_AWID(sum_syncSide_axi_full_argRoute_2_signals_.awid);
    sum_syncSide_axi_full_argRoute_2_AWLOCK(sum_syncSide_axi_full_argRoute_2_signals_.awlock);
    sum_syncSide_axi_full_argRoute_2_WID(sum_syncSide_axi_full_argRoute_2_signals_.wid);
    sum_syncSide_axi_full_argRoute_2_WVALID(sum_syncSide_axi_full_argRoute_2_signals_.wvalid);
    sum_syncSide_axi_full_argRoute_2_WREADY(sum_syncSide_axi_full_argRoute_2_signals_.wready);
    sum_syncSide_axi_full_argRoute_2_WDATA(sum_syncSide_axi_full_argRoute_2_signals_.wdata);
    sum_syncSide_axi_full_argRoute_2_WSTRB(sum_syncSide_axi_full_argRoute_2_signals_.wstrb);
    sum_syncSide_axi_full_argRoute_2_WLAST(sum_syncSide_axi_full_argRoute_2_signals_.wlast);
    sum_syncSide_axi_full_argRoute_2_BVALID(sum_syncSide_axi_full_argRoute_2_signals_.bvalid);
    sum_syncSide_axi_full_argRoute_2_BREADY(sum_syncSide_axi_full_argRoute_2_signals_.bready);
    sum_syncSide_axi_full_argRoute_2_BRESP(sum_syncSide_axi_full_argRoute_2_signals_.bresp);
    sum_syncSide_axi_full_argRoute_2_BID(sum_syncSide_axi_full_argRoute_2_signals_.bid);
    sum_syncSide_axi_full_argRoute_2_ARVALID(sum_syncSide_axi_full_argRoute_2_signals_.arvalid);
    sum_syncSide_axi_full_argRoute_2_ARREADY(sum_syncSide_axi_full_argRoute_2_signals_.arready);
    sum_syncSide_axi_full_argRoute_2_ARADDR(sum_syncSide_axi_full_argRoute_2_signals_.araddr);
    sum_syncSide_axi_full_argRoute_2_ARPROT(sum_syncSide_axi_full_argRoute_2_signals_.arprot);
    sum_syncSide_axi_full_argRoute_2_ARREGION(sum_syncSide_axi_full_argRoute_2_signals_.arregion);
    sum_syncSide_axi_full_argRoute_2_ARQOS(sum_syncSide_axi_full_argRoute_2_signals_.arqos);
    sum_syncSide_axi_full_argRoute_2_ARCACHE(sum_syncSide_axi_full_argRoute_2_signals_.arcache);
    sum_syncSide_axi_full_argRoute_2_ARBURST(sum_syncSide_axi_full_argRoute_2_signals_.arburst);
    sum_syncSide_axi_full_argRoute_2_ARSIZE(sum_syncSide_axi_full_argRoute_2_signals_.arsize);
    sum_syncSide_axi_full_argRoute_2_ARLEN(sum_syncSide_axi_full_argRoute_2_signals_.arlen);
    sum_syncSide_axi_full_argRoute_2_ARID(sum_syncSide_axi_full_argRoute_2_signals_.arid);
    sum_syncSide_axi_full_argRoute_2_ARLOCK(sum_syncSide_axi_full_argRoute_2_signals_.arlock);
    sum_syncSide_axi_full_argRoute_2_RVALID(sum_syncSide_axi_full_argRoute_2_signals_.rvalid);
    sum_syncSide_axi_full_argRoute_2_RREADY(sum_syncSide_axi_full_argRoute_2_signals_.rready);
    sum_syncSide_axi_full_argRoute_2_RDATA(sum_syncSide_axi_full_argRoute_2_signals_.rdata);
    sum_syncSide_axi_full_argRoute_2_RRESP(sum_syncSide_axi_full_argRoute_2_signals_.rresp);
    sum_syncSide_axi_full_argRoute_2_RID(sum_syncSide_axi_full_argRoute_2_signals_.rid);
    sum_syncSide_axi_full_argRoute_2_RLAST(sum_syncSide_axi_full_argRoute_2_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_3 */
    /* is_slave = False */
    sum_syncSide_axi_full_argRoute_3_AWVALID(sum_syncSide_axi_full_argRoute_3_signals_.awvalid);
    sum_syncSide_axi_full_argRoute_3_AWREADY(sum_syncSide_axi_full_argRoute_3_signals_.awready);
    sum_syncSide_axi_full_argRoute_3_AWADDR(sum_syncSide_axi_full_argRoute_3_signals_.awaddr);
    sum_syncSide_axi_full_argRoute_3_AWPROT(sum_syncSide_axi_full_argRoute_3_signals_.awprot);
    sum_syncSide_axi_full_argRoute_3_AWREGION(sum_syncSide_axi_full_argRoute_3_signals_.awregion);
    sum_syncSide_axi_full_argRoute_3_AWQOS(sum_syncSide_axi_full_argRoute_3_signals_.awqos);
    sum_syncSide_axi_full_argRoute_3_AWCACHE(sum_syncSide_axi_full_argRoute_3_signals_.awcache);
    sum_syncSide_axi_full_argRoute_3_AWBURST(sum_syncSide_axi_full_argRoute_3_signals_.awburst);
    sum_syncSide_axi_full_argRoute_3_AWSIZE(sum_syncSide_axi_full_argRoute_3_signals_.awsize);
    sum_syncSide_axi_full_argRoute_3_AWLEN(sum_syncSide_axi_full_argRoute_3_signals_.awlen);
    sum_syncSide_axi_full_argRoute_3_AWID(sum_syncSide_axi_full_argRoute_3_signals_.awid);
    sum_syncSide_axi_full_argRoute_3_AWLOCK(sum_syncSide_axi_full_argRoute_3_signals_.awlock);
    sum_syncSide_axi_full_argRoute_3_WID(sum_syncSide_axi_full_argRoute_3_signals_.wid);
    sum_syncSide_axi_full_argRoute_3_WVALID(sum_syncSide_axi_full_argRoute_3_signals_.wvalid);
    sum_syncSide_axi_full_argRoute_3_WREADY(sum_syncSide_axi_full_argRoute_3_signals_.wready);
    sum_syncSide_axi_full_argRoute_3_WDATA(sum_syncSide_axi_full_argRoute_3_signals_.wdata);
    sum_syncSide_axi_full_argRoute_3_WSTRB(sum_syncSide_axi_full_argRoute_3_signals_.wstrb);
    sum_syncSide_axi_full_argRoute_3_WLAST(sum_syncSide_axi_full_argRoute_3_signals_.wlast);
    sum_syncSide_axi_full_argRoute_3_BVALID(sum_syncSide_axi_full_argRoute_3_signals_.bvalid);
    sum_syncSide_axi_full_argRoute_3_BREADY(sum_syncSide_axi_full_argRoute_3_signals_.bready);
    sum_syncSide_axi_full_argRoute_3_BRESP(sum_syncSide_axi_full_argRoute_3_signals_.bresp);
    sum_syncSide_axi_full_argRoute_3_BID(sum_syncSide_axi_full_argRoute_3_signals_.bid);
    sum_syncSide_axi_full_argRoute_3_ARVALID(sum_syncSide_axi_full_argRoute_3_signals_.arvalid);
    sum_syncSide_axi_full_argRoute_3_ARREADY(sum_syncSide_axi_full_argRoute_3_signals_.arready);
    sum_syncSide_axi_full_argRoute_3_ARADDR(sum_syncSide_axi_full_argRoute_3_signals_.araddr);
    sum_syncSide_axi_full_argRoute_3_ARPROT(sum_syncSide_axi_full_argRoute_3_signals_.arprot);
    sum_syncSide_axi_full_argRoute_3_ARREGION(sum_syncSide_axi_full_argRoute_3_signals_.arregion);
    sum_syncSide_axi_full_argRoute_3_ARQOS(sum_syncSide_axi_full_argRoute_3_signals_.arqos);
    sum_syncSide_axi_full_argRoute_3_ARCACHE(sum_syncSide_axi_full_argRoute_3_signals_.arcache);
    sum_syncSide_axi_full_argRoute_3_ARBURST(sum_syncSide_axi_full_argRoute_3_signals_.arburst);
    sum_syncSide_axi_full_argRoute_3_ARSIZE(sum_syncSide_axi_full_argRoute_3_signals_.arsize);
    sum_syncSide_axi_full_argRoute_3_ARLEN(sum_syncSide_axi_full_argRoute_3_signals_.arlen);
    sum_syncSide_axi_full_argRoute_3_ARID(sum_syncSide_axi_full_argRoute_3_signals_.arid);
    sum_syncSide_axi_full_argRoute_3_ARLOCK(sum_syncSide_axi_full_argRoute_3_signals_.arlock);
    sum_syncSide_axi_full_argRoute_3_RVALID(sum_syncSide_axi_full_argRoute_3_signals_.rvalid);
    sum_syncSide_axi_full_argRoute_3_RREADY(sum_syncSide_axi_full_argRoute_3_signals_.rready);
    sum_syncSide_axi_full_argRoute_3_RDATA(sum_syncSide_axi_full_argRoute_3_signals_.rdata);
    sum_syncSide_axi_full_argRoute_3_RRESP(sum_syncSide_axi_full_argRoute_3_signals_.rresp);
    sum_syncSide_axi_full_argRoute_3_RID(sum_syncSide_axi_full_argRoute_3_signals_.rid);
    sum_syncSide_axi_full_argRoute_3_RLAST(sum_syncSide_axi_full_argRoute_3_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_4 */
    /* is_slave = False */
    sum_syncSide_axi_full_argRoute_4_AWVALID(sum_syncSide_axi_full_argRoute_4_signals_.awvalid);
    sum_syncSide_axi_full_argRoute_4_AWREADY(sum_syncSide_axi_full_argRoute_4_signals_.awready);
    sum_syncSide_axi_full_argRoute_4_AWADDR(sum_syncSide_axi_full_argRoute_4_signals_.awaddr);
    sum_syncSide_axi_full_argRoute_4_AWPROT(sum_syncSide_axi_full_argRoute_4_signals_.awprot);
    sum_syncSide_axi_full_argRoute_4_AWREGION(sum_syncSide_axi_full_argRoute_4_signals_.awregion);
    sum_syncSide_axi_full_argRoute_4_AWQOS(sum_syncSide_axi_full_argRoute_4_signals_.awqos);
    sum_syncSide_axi_full_argRoute_4_AWCACHE(sum_syncSide_axi_full_argRoute_4_signals_.awcache);
    sum_syncSide_axi_full_argRoute_4_AWBURST(sum_syncSide_axi_full_argRoute_4_signals_.awburst);
    sum_syncSide_axi_full_argRoute_4_AWSIZE(sum_syncSide_axi_full_argRoute_4_signals_.awsize);
    sum_syncSide_axi_full_argRoute_4_AWLEN(sum_syncSide_axi_full_argRoute_4_signals_.awlen);
    sum_syncSide_axi_full_argRoute_4_AWID(sum_syncSide_axi_full_argRoute_4_signals_.awid);
    sum_syncSide_axi_full_argRoute_4_AWLOCK(sum_syncSide_axi_full_argRoute_4_signals_.awlock);
    sum_syncSide_axi_full_argRoute_4_WID(sum_syncSide_axi_full_argRoute_4_signals_.wid);
    sum_syncSide_axi_full_argRoute_4_WVALID(sum_syncSide_axi_full_argRoute_4_signals_.wvalid);
    sum_syncSide_axi_full_argRoute_4_WREADY(sum_syncSide_axi_full_argRoute_4_signals_.wready);
    sum_syncSide_axi_full_argRoute_4_WDATA(sum_syncSide_axi_full_argRoute_4_signals_.wdata);
    sum_syncSide_axi_full_argRoute_4_WSTRB(sum_syncSide_axi_full_argRoute_4_signals_.wstrb);
    sum_syncSide_axi_full_argRoute_4_WLAST(sum_syncSide_axi_full_argRoute_4_signals_.wlast);
    sum_syncSide_axi_full_argRoute_4_BVALID(sum_syncSide_axi_full_argRoute_4_signals_.bvalid);
    sum_syncSide_axi_full_argRoute_4_BREADY(sum_syncSide_axi_full_argRoute_4_signals_.bready);
    sum_syncSide_axi_full_argRoute_4_BRESP(sum_syncSide_axi_full_argRoute_4_signals_.bresp);
    sum_syncSide_axi_full_argRoute_4_BID(sum_syncSide_axi_full_argRoute_4_signals_.bid);
    sum_syncSide_axi_full_argRoute_4_ARVALID(sum_syncSide_axi_full_argRoute_4_signals_.arvalid);
    sum_syncSide_axi_full_argRoute_4_ARREADY(sum_syncSide_axi_full_argRoute_4_signals_.arready);
    sum_syncSide_axi_full_argRoute_4_ARADDR(sum_syncSide_axi_full_argRoute_4_signals_.araddr);
    sum_syncSide_axi_full_argRoute_4_ARPROT(sum_syncSide_axi_full_argRoute_4_signals_.arprot);
    sum_syncSide_axi_full_argRoute_4_ARREGION(sum_syncSide_axi_full_argRoute_4_signals_.arregion);
    sum_syncSide_axi_full_argRoute_4_ARQOS(sum_syncSide_axi_full_argRoute_4_signals_.arqos);
    sum_syncSide_axi_full_argRoute_4_ARCACHE(sum_syncSide_axi_full_argRoute_4_signals_.arcache);
    sum_syncSide_axi_full_argRoute_4_ARBURST(sum_syncSide_axi_full_argRoute_4_signals_.arburst);
    sum_syncSide_axi_full_argRoute_4_ARSIZE(sum_syncSide_axi_full_argRoute_4_signals_.arsize);
    sum_syncSide_axi_full_argRoute_4_ARLEN(sum_syncSide_axi_full_argRoute_4_signals_.arlen);
    sum_syncSide_axi_full_argRoute_4_ARID(sum_syncSide_axi_full_argRoute_4_signals_.arid);
    sum_syncSide_axi_full_argRoute_4_ARLOCK(sum_syncSide_axi_full_argRoute_4_signals_.arlock);
    sum_syncSide_axi_full_argRoute_4_RVALID(sum_syncSide_axi_full_argRoute_4_signals_.rvalid);
    sum_syncSide_axi_full_argRoute_4_RREADY(sum_syncSide_axi_full_argRoute_4_signals_.rready);
    sum_syncSide_axi_full_argRoute_4_RDATA(sum_syncSide_axi_full_argRoute_4_signals_.rdata);
    sum_syncSide_axi_full_argRoute_4_RRESP(sum_syncSide_axi_full_argRoute_4_signals_.rresp);
    sum_syncSide_axi_full_argRoute_4_RID(sum_syncSide_axi_full_argRoute_4_signals_.rid);
    sum_syncSide_axi_full_argRoute_4_RLAST(sum_syncSide_axi_full_argRoute_4_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_5 */
    /* is_slave = False */
    sum_syncSide_axi_full_argRoute_5_AWVALID(sum_syncSide_axi_full_argRoute_5_signals_.awvalid);
    sum_syncSide_axi_full_argRoute_5_AWREADY(sum_syncSide_axi_full_argRoute_5_signals_.awready);
    sum_syncSide_axi_full_argRoute_5_AWADDR(sum_syncSide_axi_full_argRoute_5_signals_.awaddr);
    sum_syncSide_axi_full_argRoute_5_AWPROT(sum_syncSide_axi_full_argRoute_5_signals_.awprot);
    sum_syncSide_axi_full_argRoute_5_AWREGION(sum_syncSide_axi_full_argRoute_5_signals_.awregion);
    sum_syncSide_axi_full_argRoute_5_AWQOS(sum_syncSide_axi_full_argRoute_5_signals_.awqos);
    sum_syncSide_axi_full_argRoute_5_AWCACHE(sum_syncSide_axi_full_argRoute_5_signals_.awcache);
    sum_syncSide_axi_full_argRoute_5_AWBURST(sum_syncSide_axi_full_argRoute_5_signals_.awburst);
    sum_syncSide_axi_full_argRoute_5_AWSIZE(sum_syncSide_axi_full_argRoute_5_signals_.awsize);
    sum_syncSide_axi_full_argRoute_5_AWLEN(sum_syncSide_axi_full_argRoute_5_signals_.awlen);
    sum_syncSide_axi_full_argRoute_5_AWID(sum_syncSide_axi_full_argRoute_5_signals_.awid);
    sum_syncSide_axi_full_argRoute_5_AWLOCK(sum_syncSide_axi_full_argRoute_5_signals_.awlock);
    sum_syncSide_axi_full_argRoute_5_WID(sum_syncSide_axi_full_argRoute_5_signals_.wid);
    sum_syncSide_axi_full_argRoute_5_WVALID(sum_syncSide_axi_full_argRoute_5_signals_.wvalid);
    sum_syncSide_axi_full_argRoute_5_WREADY(sum_syncSide_axi_full_argRoute_5_signals_.wready);
    sum_syncSide_axi_full_argRoute_5_WDATA(sum_syncSide_axi_full_argRoute_5_signals_.wdata);
    sum_syncSide_axi_full_argRoute_5_WSTRB(sum_syncSide_axi_full_argRoute_5_signals_.wstrb);
    sum_syncSide_axi_full_argRoute_5_WLAST(sum_syncSide_axi_full_argRoute_5_signals_.wlast);
    sum_syncSide_axi_full_argRoute_5_BVALID(sum_syncSide_axi_full_argRoute_5_signals_.bvalid);
    sum_syncSide_axi_full_argRoute_5_BREADY(sum_syncSide_axi_full_argRoute_5_signals_.bready);
    sum_syncSide_axi_full_argRoute_5_BRESP(sum_syncSide_axi_full_argRoute_5_signals_.bresp);
    sum_syncSide_axi_full_argRoute_5_BID(sum_syncSide_axi_full_argRoute_5_signals_.bid);
    sum_syncSide_axi_full_argRoute_5_ARVALID(sum_syncSide_axi_full_argRoute_5_signals_.arvalid);
    sum_syncSide_axi_full_argRoute_5_ARREADY(sum_syncSide_axi_full_argRoute_5_signals_.arready);
    sum_syncSide_axi_full_argRoute_5_ARADDR(sum_syncSide_axi_full_argRoute_5_signals_.araddr);
    sum_syncSide_axi_full_argRoute_5_ARPROT(sum_syncSide_axi_full_argRoute_5_signals_.arprot);
    sum_syncSide_axi_full_argRoute_5_ARREGION(sum_syncSide_axi_full_argRoute_5_signals_.arregion);
    sum_syncSide_axi_full_argRoute_5_ARQOS(sum_syncSide_axi_full_argRoute_5_signals_.arqos);
    sum_syncSide_axi_full_argRoute_5_ARCACHE(sum_syncSide_axi_full_argRoute_5_signals_.arcache);
    sum_syncSide_axi_full_argRoute_5_ARBURST(sum_syncSide_axi_full_argRoute_5_signals_.arburst);
    sum_syncSide_axi_full_argRoute_5_ARSIZE(sum_syncSide_axi_full_argRoute_5_signals_.arsize);
    sum_syncSide_axi_full_argRoute_5_ARLEN(sum_syncSide_axi_full_argRoute_5_signals_.arlen);
    sum_syncSide_axi_full_argRoute_5_ARID(sum_syncSide_axi_full_argRoute_5_signals_.arid);
    sum_syncSide_axi_full_argRoute_5_ARLOCK(sum_syncSide_axi_full_argRoute_5_signals_.arlock);
    sum_syncSide_axi_full_argRoute_5_RVALID(sum_syncSide_axi_full_argRoute_5_signals_.rvalid);
    sum_syncSide_axi_full_argRoute_5_RREADY(sum_syncSide_axi_full_argRoute_5_signals_.rready);
    sum_syncSide_axi_full_argRoute_5_RDATA(sum_syncSide_axi_full_argRoute_5_signals_.rdata);
    sum_syncSide_axi_full_argRoute_5_RRESP(sum_syncSide_axi_full_argRoute_5_signals_.rresp);
    sum_syncSide_axi_full_argRoute_5_RID(sum_syncSide_axi_full_argRoute_5_signals_.rid);
    sum_syncSide_axi_full_argRoute_5_RLAST(sum_syncSide_axi_full_argRoute_5_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_6 */
    /* is_slave = False */
    sum_syncSide_axi_full_argRoute_6_AWVALID(sum_syncSide_axi_full_argRoute_6_signals_.awvalid);
    sum_syncSide_axi_full_argRoute_6_AWREADY(sum_syncSide_axi_full_argRoute_6_signals_.awready);
    sum_syncSide_axi_full_argRoute_6_AWADDR(sum_syncSide_axi_full_argRoute_6_signals_.awaddr);
    sum_syncSide_axi_full_argRoute_6_AWPROT(sum_syncSide_axi_full_argRoute_6_signals_.awprot);
    sum_syncSide_axi_full_argRoute_6_AWREGION(sum_syncSide_axi_full_argRoute_6_signals_.awregion);
    sum_syncSide_axi_full_argRoute_6_AWQOS(sum_syncSide_axi_full_argRoute_6_signals_.awqos);
    sum_syncSide_axi_full_argRoute_6_AWCACHE(sum_syncSide_axi_full_argRoute_6_signals_.awcache);
    sum_syncSide_axi_full_argRoute_6_AWBURST(sum_syncSide_axi_full_argRoute_6_signals_.awburst);
    sum_syncSide_axi_full_argRoute_6_AWSIZE(sum_syncSide_axi_full_argRoute_6_signals_.awsize);
    sum_syncSide_axi_full_argRoute_6_AWLEN(sum_syncSide_axi_full_argRoute_6_signals_.awlen);
    sum_syncSide_axi_full_argRoute_6_AWID(sum_syncSide_axi_full_argRoute_6_signals_.awid);
    sum_syncSide_axi_full_argRoute_6_AWLOCK(sum_syncSide_axi_full_argRoute_6_signals_.awlock);
    sum_syncSide_axi_full_argRoute_6_WID(sum_syncSide_axi_full_argRoute_6_signals_.wid);
    sum_syncSide_axi_full_argRoute_6_WVALID(sum_syncSide_axi_full_argRoute_6_signals_.wvalid);
    sum_syncSide_axi_full_argRoute_6_WREADY(sum_syncSide_axi_full_argRoute_6_signals_.wready);
    sum_syncSide_axi_full_argRoute_6_WDATA(sum_syncSide_axi_full_argRoute_6_signals_.wdata);
    sum_syncSide_axi_full_argRoute_6_WSTRB(sum_syncSide_axi_full_argRoute_6_signals_.wstrb);
    sum_syncSide_axi_full_argRoute_6_WLAST(sum_syncSide_axi_full_argRoute_6_signals_.wlast);
    sum_syncSide_axi_full_argRoute_6_BVALID(sum_syncSide_axi_full_argRoute_6_signals_.bvalid);
    sum_syncSide_axi_full_argRoute_6_BREADY(sum_syncSide_axi_full_argRoute_6_signals_.bready);
    sum_syncSide_axi_full_argRoute_6_BRESP(sum_syncSide_axi_full_argRoute_6_signals_.bresp);
    sum_syncSide_axi_full_argRoute_6_BID(sum_syncSide_axi_full_argRoute_6_signals_.bid);
    sum_syncSide_axi_full_argRoute_6_ARVALID(sum_syncSide_axi_full_argRoute_6_signals_.arvalid);
    sum_syncSide_axi_full_argRoute_6_ARREADY(sum_syncSide_axi_full_argRoute_6_signals_.arready);
    sum_syncSide_axi_full_argRoute_6_ARADDR(sum_syncSide_axi_full_argRoute_6_signals_.araddr);
    sum_syncSide_axi_full_argRoute_6_ARPROT(sum_syncSide_axi_full_argRoute_6_signals_.arprot);
    sum_syncSide_axi_full_argRoute_6_ARREGION(sum_syncSide_axi_full_argRoute_6_signals_.arregion);
    sum_syncSide_axi_full_argRoute_6_ARQOS(sum_syncSide_axi_full_argRoute_6_signals_.arqos);
    sum_syncSide_axi_full_argRoute_6_ARCACHE(sum_syncSide_axi_full_argRoute_6_signals_.arcache);
    sum_syncSide_axi_full_argRoute_6_ARBURST(sum_syncSide_axi_full_argRoute_6_signals_.arburst);
    sum_syncSide_axi_full_argRoute_6_ARSIZE(sum_syncSide_axi_full_argRoute_6_signals_.arsize);
    sum_syncSide_axi_full_argRoute_6_ARLEN(sum_syncSide_axi_full_argRoute_6_signals_.arlen);
    sum_syncSide_axi_full_argRoute_6_ARID(sum_syncSide_axi_full_argRoute_6_signals_.arid);
    sum_syncSide_axi_full_argRoute_6_ARLOCK(sum_syncSide_axi_full_argRoute_6_signals_.arlock);
    sum_syncSide_axi_full_argRoute_6_RVALID(sum_syncSide_axi_full_argRoute_6_signals_.rvalid);
    sum_syncSide_axi_full_argRoute_6_RREADY(sum_syncSide_axi_full_argRoute_6_signals_.rready);
    sum_syncSide_axi_full_argRoute_6_RDATA(sum_syncSide_axi_full_argRoute_6_signals_.rdata);
    sum_syncSide_axi_full_argRoute_6_RRESP(sum_syncSide_axi_full_argRoute_6_signals_.rresp);
    sum_syncSide_axi_full_argRoute_6_RID(sum_syncSide_axi_full_argRoute_6_signals_.rid);
    sum_syncSide_axi_full_argRoute_6_RLAST(sum_syncSide_axi_full_argRoute_6_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: sum_syncSide_axi_full_argRoute_7 */
    /* is_slave = False */
    sum_syncSide_axi_full_argRoute_7_AWVALID(sum_syncSide_axi_full_argRoute_7_signals_.awvalid);
    sum_syncSide_axi_full_argRoute_7_AWREADY(sum_syncSide_axi_full_argRoute_7_signals_.awready);
    sum_syncSide_axi_full_argRoute_7_AWADDR(sum_syncSide_axi_full_argRoute_7_signals_.awaddr);
    sum_syncSide_axi_full_argRoute_7_AWPROT(sum_syncSide_axi_full_argRoute_7_signals_.awprot);
    sum_syncSide_axi_full_argRoute_7_AWREGION(sum_syncSide_axi_full_argRoute_7_signals_.awregion);
    sum_syncSide_axi_full_argRoute_7_AWQOS(sum_syncSide_axi_full_argRoute_7_signals_.awqos);
    sum_syncSide_axi_full_argRoute_7_AWCACHE(sum_syncSide_axi_full_argRoute_7_signals_.awcache);
    sum_syncSide_axi_full_argRoute_7_AWBURST(sum_syncSide_axi_full_argRoute_7_signals_.awburst);
    sum_syncSide_axi_full_argRoute_7_AWSIZE(sum_syncSide_axi_full_argRoute_7_signals_.awsize);
    sum_syncSide_axi_full_argRoute_7_AWLEN(sum_syncSide_axi_full_argRoute_7_signals_.awlen);
    sum_syncSide_axi_full_argRoute_7_AWID(sum_syncSide_axi_full_argRoute_7_signals_.awid);
    sum_syncSide_axi_full_argRoute_7_AWLOCK(sum_syncSide_axi_full_argRoute_7_signals_.awlock);
    sum_syncSide_axi_full_argRoute_7_WID(sum_syncSide_axi_full_argRoute_7_signals_.wid);
    sum_syncSide_axi_full_argRoute_7_WVALID(sum_syncSide_axi_full_argRoute_7_signals_.wvalid);
    sum_syncSide_axi_full_argRoute_7_WREADY(sum_syncSide_axi_full_argRoute_7_signals_.wready);
    sum_syncSide_axi_full_argRoute_7_WDATA(sum_syncSide_axi_full_argRoute_7_signals_.wdata);
    sum_syncSide_axi_full_argRoute_7_WSTRB(sum_syncSide_axi_full_argRoute_7_signals_.wstrb);
    sum_syncSide_axi_full_argRoute_7_WLAST(sum_syncSide_axi_full_argRoute_7_signals_.wlast);
    sum_syncSide_axi_full_argRoute_7_BVALID(sum_syncSide_axi_full_argRoute_7_signals_.bvalid);
    sum_syncSide_axi_full_argRoute_7_BREADY(sum_syncSide_axi_full_argRoute_7_signals_.bready);
    sum_syncSide_axi_full_argRoute_7_BRESP(sum_syncSide_axi_full_argRoute_7_signals_.bresp);
    sum_syncSide_axi_full_argRoute_7_BID(sum_syncSide_axi_full_argRoute_7_signals_.bid);
    sum_syncSide_axi_full_argRoute_7_ARVALID(sum_syncSide_axi_full_argRoute_7_signals_.arvalid);
    sum_syncSide_axi_full_argRoute_7_ARREADY(sum_syncSide_axi_full_argRoute_7_signals_.arready);
    sum_syncSide_axi_full_argRoute_7_ARADDR(sum_syncSide_axi_full_argRoute_7_signals_.araddr);
    sum_syncSide_axi_full_argRoute_7_ARPROT(sum_syncSide_axi_full_argRoute_7_signals_.arprot);
    sum_syncSide_axi_full_argRoute_7_ARREGION(sum_syncSide_axi_full_argRoute_7_signals_.arregion);
    sum_syncSide_axi_full_argRoute_7_ARQOS(sum_syncSide_axi_full_argRoute_7_signals_.arqos);
    sum_syncSide_axi_full_argRoute_7_ARCACHE(sum_syncSide_axi_full_argRoute_7_signals_.arcache);
    sum_syncSide_axi_full_argRoute_7_ARBURST(sum_syncSide_axi_full_argRoute_7_signals_.arburst);
    sum_syncSide_axi_full_argRoute_7_ARSIZE(sum_syncSide_axi_full_argRoute_7_signals_.arsize);
    sum_syncSide_axi_full_argRoute_7_ARLEN(sum_syncSide_axi_full_argRoute_7_signals_.arlen);
    sum_syncSide_axi_full_argRoute_7_ARID(sum_syncSide_axi_full_argRoute_7_signals_.arid);
    sum_syncSide_axi_full_argRoute_7_ARLOCK(sum_syncSide_axi_full_argRoute_7_signals_.arlock);
    sum_syncSide_axi_full_argRoute_7_RVALID(sum_syncSide_axi_full_argRoute_7_signals_.rvalid);
    sum_syncSide_axi_full_argRoute_7_RREADY(sum_syncSide_axi_full_argRoute_7_signals_.rready);
    sum_syncSide_axi_full_argRoute_7_RDATA(sum_syncSide_axi_full_argRoute_7_signals_.rdata);
    sum_syncSide_axi_full_argRoute_7_RRESP(sum_syncSide_axi_full_argRoute_7_signals_.rresp);
    sum_syncSide_axi_full_argRoute_7_RID(sum_syncSide_axi_full_argRoute_7_signals_.rid);
    sum_syncSide_axi_full_argRoute_7_RLAST(sum_syncSide_axi_full_argRoute_7_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: fib_stealSide_axi_mgmt_vss_0 */
    /* is_slave = True */
    fib_stealSide_axi_mgmt_vss_0_AWVALID(fib_stealSide_axi_mgmt_vss_0_signals_.awvalid);
    fib_stealSide_axi_mgmt_vss_0_AWREADY(fib_stealSide_axi_mgmt_vss_0_signals_.awready);
    fib_stealSide_axi_mgmt_vss_0_AWADDR(fib_stealSide_axi_mgmt_vss_0_signals_.awaddr);
    fib_stealSide_axi_mgmt_vss_0_AWPROT(fib_stealSide_axi_mgmt_vss_0_signals_.awprot);
    fib_stealSide_axi_mgmt_vss_0_WVALID(fib_stealSide_axi_mgmt_vss_0_signals_.wvalid);
    fib_stealSide_axi_mgmt_vss_0_WREADY(fib_stealSide_axi_mgmt_vss_0_signals_.wready);
    fib_stealSide_axi_mgmt_vss_0_WDATA(fib_stealSide_axi_mgmt_vss_0_signals_.wdata);
    fib_stealSide_axi_mgmt_vss_0_WSTRB(fib_stealSide_axi_mgmt_vss_0_signals_.wstrb);
    fib_stealSide_axi_mgmt_vss_0_BVALID(fib_stealSide_axi_mgmt_vss_0_signals_.bvalid);
    fib_stealSide_axi_mgmt_vss_0_BREADY(fib_stealSide_axi_mgmt_vss_0_signals_.bready);
    fib_stealSide_axi_mgmt_vss_0_BRESP(fib_stealSide_axi_mgmt_vss_0_signals_.bresp);
    fib_stealSide_axi_mgmt_vss_0_ARVALID(fib_stealSide_axi_mgmt_vss_0_signals_.arvalid);
    fib_stealSide_axi_mgmt_vss_0_ARREADY(fib_stealSide_axi_mgmt_vss_0_signals_.arready);
    fib_stealSide_axi_mgmt_vss_0_ARADDR(fib_stealSide_axi_mgmt_vss_0_signals_.araddr);
    fib_stealSide_axi_mgmt_vss_0_ARPROT(fib_stealSide_axi_mgmt_vss_0_signals_.arprot);
    fib_stealSide_axi_mgmt_vss_0_RVALID(fib_stealSide_axi_mgmt_vss_0_signals_.rvalid);
    fib_stealSide_axi_mgmt_vss_0_RREADY(fib_stealSide_axi_mgmt_vss_0_signals_.rready);
    fib_stealSide_axi_mgmt_vss_0_RDATA(fib_stealSide_axi_mgmt_vss_0_signals_.rdata);
    fib_stealSide_axi_mgmt_vss_0_RRESP(fib_stealSide_axi_mgmt_vss_0_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: fib_stealSide_vss_axi_full_0 */
    /* is_slave = False */
    fib_stealSide_vss_axi_full_0_AWVALID(fib_stealSide_vss_axi_full_0_signals_.awvalid);
    fib_stealSide_vss_axi_full_0_AWREADY(fib_stealSide_vss_axi_full_0_signals_.awready);
    fib_stealSide_vss_axi_full_0_AWADDR(fib_stealSide_vss_axi_full_0_signals_.awaddr);
    fib_stealSide_vss_axi_full_0_AWPROT(fib_stealSide_vss_axi_full_0_signals_.awprot);
    fib_stealSide_vss_axi_full_0_AWREGION(fib_stealSide_vss_axi_full_0_signals_.awregion);
    fib_stealSide_vss_axi_full_0_AWQOS(fib_stealSide_vss_axi_full_0_signals_.awqos);
    fib_stealSide_vss_axi_full_0_AWCACHE(fib_stealSide_vss_axi_full_0_signals_.awcache);
    fib_stealSide_vss_axi_full_0_AWBURST(fib_stealSide_vss_axi_full_0_signals_.awburst);
    fib_stealSide_vss_axi_full_0_AWSIZE(fib_stealSide_vss_axi_full_0_signals_.awsize);
    fib_stealSide_vss_axi_full_0_AWLEN(fib_stealSide_vss_axi_full_0_signals_.awlen);
    fib_stealSide_vss_axi_full_0_AWID(fib_stealSide_vss_axi_full_0_signals_.awid);
    fib_stealSide_vss_axi_full_0_AWLOCK(fib_stealSide_vss_axi_full_0_signals_.awlock);
    fib_stealSide_vss_axi_full_0_WID(fib_stealSide_vss_axi_full_0_signals_.wid);
    fib_stealSide_vss_axi_full_0_WVALID(fib_stealSide_vss_axi_full_0_signals_.wvalid);
    fib_stealSide_vss_axi_full_0_WREADY(fib_stealSide_vss_axi_full_0_signals_.wready);
    fib_stealSide_vss_axi_full_0_WDATA(fib_stealSide_vss_axi_full_0_signals_.wdata);
    fib_stealSide_vss_axi_full_0_WSTRB(fib_stealSide_vss_axi_full_0_signals_.wstrb);
    fib_stealSide_vss_axi_full_0_WLAST(fib_stealSide_vss_axi_full_0_signals_.wlast);
    fib_stealSide_vss_axi_full_0_BVALID(fib_stealSide_vss_axi_full_0_signals_.bvalid);
    fib_stealSide_vss_axi_full_0_BREADY(fib_stealSide_vss_axi_full_0_signals_.bready);
    fib_stealSide_vss_axi_full_0_BRESP(fib_stealSide_vss_axi_full_0_signals_.bresp);
    fib_stealSide_vss_axi_full_0_BID(fib_stealSide_vss_axi_full_0_signals_.bid);
    fib_stealSide_vss_axi_full_0_ARVALID(fib_stealSide_vss_axi_full_0_signals_.arvalid);
    fib_stealSide_vss_axi_full_0_ARREADY(fib_stealSide_vss_axi_full_0_signals_.arready);
    fib_stealSide_vss_axi_full_0_ARADDR(fib_stealSide_vss_axi_full_0_signals_.araddr);
    fib_stealSide_vss_axi_full_0_ARPROT(fib_stealSide_vss_axi_full_0_signals_.arprot);
    fib_stealSide_vss_axi_full_0_ARREGION(fib_stealSide_vss_axi_full_0_signals_.arregion);
    fib_stealSide_vss_axi_full_0_ARQOS(fib_stealSide_vss_axi_full_0_signals_.arqos);
    fib_stealSide_vss_axi_full_0_ARCACHE(fib_stealSide_vss_axi_full_0_signals_.arcache);
    fib_stealSide_vss_axi_full_0_ARBURST(fib_stealSide_vss_axi_full_0_signals_.arburst);
    fib_stealSide_vss_axi_full_0_ARSIZE(fib_stealSide_vss_axi_full_0_signals_.arsize);
    fib_stealSide_vss_axi_full_0_ARLEN(fib_stealSide_vss_axi_full_0_signals_.arlen);
    fib_stealSide_vss_axi_full_0_ARID(fib_stealSide_vss_axi_full_0_signals_.arid);
    fib_stealSide_vss_axi_full_0_ARLOCK(fib_stealSide_vss_axi_full_0_signals_.arlock);
    fib_stealSide_vss_axi_full_0_RVALID(fib_stealSide_vss_axi_full_0_signals_.rvalid);
    fib_stealSide_vss_axi_full_0_RREADY(fib_stealSide_vss_axi_full_0_signals_.rready);
    fib_stealSide_vss_axi_full_0_RDATA(fib_stealSide_vss_axi_full_0_signals_.rdata);
    fib_stealSide_vss_axi_full_0_RRESP(fib_stealSide_vss_axi_full_0_signals_.rresp);
    fib_stealSide_vss_axi_full_0_RID(fib_stealSide_vss_axi_full_0_signals_.rid);
    fib_stealSide_vss_axi_full_0_RLAST(fib_stealSide_vss_axi_full_0_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: fib_stealSide_axi_mgmt_vss_1 */
    /* is_slave = True */
    fib_stealSide_axi_mgmt_vss_1_AWVALID(fib_stealSide_axi_mgmt_vss_1_signals_.awvalid);
    fib_stealSide_axi_mgmt_vss_1_AWREADY(fib_stealSide_axi_mgmt_vss_1_signals_.awready);
    fib_stealSide_axi_mgmt_vss_1_AWADDR(fib_stealSide_axi_mgmt_vss_1_signals_.awaddr);
    fib_stealSide_axi_mgmt_vss_1_AWPROT(fib_stealSide_axi_mgmt_vss_1_signals_.awprot);
    fib_stealSide_axi_mgmt_vss_1_WVALID(fib_stealSide_axi_mgmt_vss_1_signals_.wvalid);
    fib_stealSide_axi_mgmt_vss_1_WREADY(fib_stealSide_axi_mgmt_vss_1_signals_.wready);
    fib_stealSide_axi_mgmt_vss_1_WDATA(fib_stealSide_axi_mgmt_vss_1_signals_.wdata);
    fib_stealSide_axi_mgmt_vss_1_WSTRB(fib_stealSide_axi_mgmt_vss_1_signals_.wstrb);
    fib_stealSide_axi_mgmt_vss_1_BVALID(fib_stealSide_axi_mgmt_vss_1_signals_.bvalid);
    fib_stealSide_axi_mgmt_vss_1_BREADY(fib_stealSide_axi_mgmt_vss_1_signals_.bready);
    fib_stealSide_axi_mgmt_vss_1_BRESP(fib_stealSide_axi_mgmt_vss_1_signals_.bresp);
    fib_stealSide_axi_mgmt_vss_1_ARVALID(fib_stealSide_axi_mgmt_vss_1_signals_.arvalid);
    fib_stealSide_axi_mgmt_vss_1_ARREADY(fib_stealSide_axi_mgmt_vss_1_signals_.arready);
    fib_stealSide_axi_mgmt_vss_1_ARADDR(fib_stealSide_axi_mgmt_vss_1_signals_.araddr);
    fib_stealSide_axi_mgmt_vss_1_ARPROT(fib_stealSide_axi_mgmt_vss_1_signals_.arprot);
    fib_stealSide_axi_mgmt_vss_1_RVALID(fib_stealSide_axi_mgmt_vss_1_signals_.rvalid);
    fib_stealSide_axi_mgmt_vss_1_RREADY(fib_stealSide_axi_mgmt_vss_1_signals_.rready);
    fib_stealSide_axi_mgmt_vss_1_RDATA(fib_stealSide_axi_mgmt_vss_1_signals_.rdata);
    fib_stealSide_axi_mgmt_vss_1_RRESP(fib_stealSide_axi_mgmt_vss_1_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: fib_stealSide_vss_axi_full_1 */
    /* is_slave = False */
    fib_stealSide_vss_axi_full_1_AWVALID(fib_stealSide_vss_axi_full_1_signals_.awvalid);
    fib_stealSide_vss_axi_full_1_AWREADY(fib_stealSide_vss_axi_full_1_signals_.awready);
    fib_stealSide_vss_axi_full_1_AWADDR(fib_stealSide_vss_axi_full_1_signals_.awaddr);
    fib_stealSide_vss_axi_full_1_AWPROT(fib_stealSide_vss_axi_full_1_signals_.awprot);
    fib_stealSide_vss_axi_full_1_AWREGION(fib_stealSide_vss_axi_full_1_signals_.awregion);
    fib_stealSide_vss_axi_full_1_AWQOS(fib_stealSide_vss_axi_full_1_signals_.awqos);
    fib_stealSide_vss_axi_full_1_AWCACHE(fib_stealSide_vss_axi_full_1_signals_.awcache);
    fib_stealSide_vss_axi_full_1_AWBURST(fib_stealSide_vss_axi_full_1_signals_.awburst);
    fib_stealSide_vss_axi_full_1_AWSIZE(fib_stealSide_vss_axi_full_1_signals_.awsize);
    fib_stealSide_vss_axi_full_1_AWLEN(fib_stealSide_vss_axi_full_1_signals_.awlen);
    fib_stealSide_vss_axi_full_1_AWID(fib_stealSide_vss_axi_full_1_signals_.awid);
    fib_stealSide_vss_axi_full_1_AWLOCK(fib_stealSide_vss_axi_full_1_signals_.awlock);
    fib_stealSide_vss_axi_full_1_WID(fib_stealSide_vss_axi_full_1_signals_.wid);
    fib_stealSide_vss_axi_full_1_WVALID(fib_stealSide_vss_axi_full_1_signals_.wvalid);
    fib_stealSide_vss_axi_full_1_WREADY(fib_stealSide_vss_axi_full_1_signals_.wready);
    fib_stealSide_vss_axi_full_1_WDATA(fib_stealSide_vss_axi_full_1_signals_.wdata);
    fib_stealSide_vss_axi_full_1_WSTRB(fib_stealSide_vss_axi_full_1_signals_.wstrb);
    fib_stealSide_vss_axi_full_1_WLAST(fib_stealSide_vss_axi_full_1_signals_.wlast);
    fib_stealSide_vss_axi_full_1_BVALID(fib_stealSide_vss_axi_full_1_signals_.bvalid);
    fib_stealSide_vss_axi_full_1_BREADY(fib_stealSide_vss_axi_full_1_signals_.bready);
    fib_stealSide_vss_axi_full_1_BRESP(fib_stealSide_vss_axi_full_1_signals_.bresp);
    fib_stealSide_vss_axi_full_1_BID(fib_stealSide_vss_axi_full_1_signals_.bid);
    fib_stealSide_vss_axi_full_1_ARVALID(fib_stealSide_vss_axi_full_1_signals_.arvalid);
    fib_stealSide_vss_axi_full_1_ARREADY(fib_stealSide_vss_axi_full_1_signals_.arready);
    fib_stealSide_vss_axi_full_1_ARADDR(fib_stealSide_vss_axi_full_1_signals_.araddr);
    fib_stealSide_vss_axi_full_1_ARPROT(fib_stealSide_vss_axi_full_1_signals_.arprot);
    fib_stealSide_vss_axi_full_1_ARREGION(fib_stealSide_vss_axi_full_1_signals_.arregion);
    fib_stealSide_vss_axi_full_1_ARQOS(fib_stealSide_vss_axi_full_1_signals_.arqos);
    fib_stealSide_vss_axi_full_1_ARCACHE(fib_stealSide_vss_axi_full_1_signals_.arcache);
    fib_stealSide_vss_axi_full_1_ARBURST(fib_stealSide_vss_axi_full_1_signals_.arburst);
    fib_stealSide_vss_axi_full_1_ARSIZE(fib_stealSide_vss_axi_full_1_signals_.arsize);
    fib_stealSide_vss_axi_full_1_ARLEN(fib_stealSide_vss_axi_full_1_signals_.arlen);
    fib_stealSide_vss_axi_full_1_ARID(fib_stealSide_vss_axi_full_1_signals_.arid);
    fib_stealSide_vss_axi_full_1_ARLOCK(fib_stealSide_vss_axi_full_1_signals_.arlock);
    fib_stealSide_vss_axi_full_1_RVALID(fib_stealSide_vss_axi_full_1_signals_.rvalid);
    fib_stealSide_vss_axi_full_1_RREADY(fib_stealSide_vss_axi_full_1_signals_.rready);
    fib_stealSide_vss_axi_full_1_RDATA(fib_stealSide_vss_axi_full_1_signals_.rdata);
    fib_stealSide_vss_axi_full_1_RRESP(fib_stealSide_vss_axi_full_1_signals_.rresp);
    fib_stealSide_vss_axi_full_1_RID(fib_stealSide_vss_axi_full_1_signals_.rid);
    fib_stealSide_vss_axi_full_1_RLAST(fib_stealSide_vss_axi_full_1_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: fib_stealSide_axi_mgmt_vss_2 */
    /* is_slave = True */
    fib_stealSide_axi_mgmt_vss_2_AWVALID(fib_stealSide_axi_mgmt_vss_2_signals_.awvalid);
    fib_stealSide_axi_mgmt_vss_2_AWREADY(fib_stealSide_axi_mgmt_vss_2_signals_.awready);
    fib_stealSide_axi_mgmt_vss_2_AWADDR(fib_stealSide_axi_mgmt_vss_2_signals_.awaddr);
    fib_stealSide_axi_mgmt_vss_2_AWPROT(fib_stealSide_axi_mgmt_vss_2_signals_.awprot);
    fib_stealSide_axi_mgmt_vss_2_WVALID(fib_stealSide_axi_mgmt_vss_2_signals_.wvalid);
    fib_stealSide_axi_mgmt_vss_2_WREADY(fib_stealSide_axi_mgmt_vss_2_signals_.wready);
    fib_stealSide_axi_mgmt_vss_2_WDATA(fib_stealSide_axi_mgmt_vss_2_signals_.wdata);
    fib_stealSide_axi_mgmt_vss_2_WSTRB(fib_stealSide_axi_mgmt_vss_2_signals_.wstrb);
    fib_stealSide_axi_mgmt_vss_2_BVALID(fib_stealSide_axi_mgmt_vss_2_signals_.bvalid);
    fib_stealSide_axi_mgmt_vss_2_BREADY(fib_stealSide_axi_mgmt_vss_2_signals_.bready);
    fib_stealSide_axi_mgmt_vss_2_BRESP(fib_stealSide_axi_mgmt_vss_2_signals_.bresp);
    fib_stealSide_axi_mgmt_vss_2_ARVALID(fib_stealSide_axi_mgmt_vss_2_signals_.arvalid);
    fib_stealSide_axi_mgmt_vss_2_ARREADY(fib_stealSide_axi_mgmt_vss_2_signals_.arready);
    fib_stealSide_axi_mgmt_vss_2_ARADDR(fib_stealSide_axi_mgmt_vss_2_signals_.araddr);
    fib_stealSide_axi_mgmt_vss_2_ARPROT(fib_stealSide_axi_mgmt_vss_2_signals_.arprot);
    fib_stealSide_axi_mgmt_vss_2_RVALID(fib_stealSide_axi_mgmt_vss_2_signals_.rvalid);
    fib_stealSide_axi_mgmt_vss_2_RREADY(fib_stealSide_axi_mgmt_vss_2_signals_.rready);
    fib_stealSide_axi_mgmt_vss_2_RDATA(fib_stealSide_axi_mgmt_vss_2_signals_.rdata);
    fib_stealSide_axi_mgmt_vss_2_RRESP(fib_stealSide_axi_mgmt_vss_2_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: fib_stealSide_vss_axi_full_2 */
    /* is_slave = False */
    fib_stealSide_vss_axi_full_2_AWVALID(fib_stealSide_vss_axi_full_2_signals_.awvalid);
    fib_stealSide_vss_axi_full_2_AWREADY(fib_stealSide_vss_axi_full_2_signals_.awready);
    fib_stealSide_vss_axi_full_2_AWADDR(fib_stealSide_vss_axi_full_2_signals_.awaddr);
    fib_stealSide_vss_axi_full_2_AWPROT(fib_stealSide_vss_axi_full_2_signals_.awprot);
    fib_stealSide_vss_axi_full_2_AWREGION(fib_stealSide_vss_axi_full_2_signals_.awregion);
    fib_stealSide_vss_axi_full_2_AWQOS(fib_stealSide_vss_axi_full_2_signals_.awqos);
    fib_stealSide_vss_axi_full_2_AWCACHE(fib_stealSide_vss_axi_full_2_signals_.awcache);
    fib_stealSide_vss_axi_full_2_AWBURST(fib_stealSide_vss_axi_full_2_signals_.awburst);
    fib_stealSide_vss_axi_full_2_AWSIZE(fib_stealSide_vss_axi_full_2_signals_.awsize);
    fib_stealSide_vss_axi_full_2_AWLEN(fib_stealSide_vss_axi_full_2_signals_.awlen);
    fib_stealSide_vss_axi_full_2_AWID(fib_stealSide_vss_axi_full_2_signals_.awid);
    fib_stealSide_vss_axi_full_2_AWLOCK(fib_stealSide_vss_axi_full_2_signals_.awlock);
    fib_stealSide_vss_axi_full_2_WID(fib_stealSide_vss_axi_full_2_signals_.wid);
    fib_stealSide_vss_axi_full_2_WVALID(fib_stealSide_vss_axi_full_2_signals_.wvalid);
    fib_stealSide_vss_axi_full_2_WREADY(fib_stealSide_vss_axi_full_2_signals_.wready);
    fib_stealSide_vss_axi_full_2_WDATA(fib_stealSide_vss_axi_full_2_signals_.wdata);
    fib_stealSide_vss_axi_full_2_WSTRB(fib_stealSide_vss_axi_full_2_signals_.wstrb);
    fib_stealSide_vss_axi_full_2_WLAST(fib_stealSide_vss_axi_full_2_signals_.wlast);
    fib_stealSide_vss_axi_full_2_BVALID(fib_stealSide_vss_axi_full_2_signals_.bvalid);
    fib_stealSide_vss_axi_full_2_BREADY(fib_stealSide_vss_axi_full_2_signals_.bready);
    fib_stealSide_vss_axi_full_2_BRESP(fib_stealSide_vss_axi_full_2_signals_.bresp);
    fib_stealSide_vss_axi_full_2_BID(fib_stealSide_vss_axi_full_2_signals_.bid);
    fib_stealSide_vss_axi_full_2_ARVALID(fib_stealSide_vss_axi_full_2_signals_.arvalid);
    fib_stealSide_vss_axi_full_2_ARREADY(fib_stealSide_vss_axi_full_2_signals_.arready);
    fib_stealSide_vss_axi_full_2_ARADDR(fib_stealSide_vss_axi_full_2_signals_.araddr);
    fib_stealSide_vss_axi_full_2_ARPROT(fib_stealSide_vss_axi_full_2_signals_.arprot);
    fib_stealSide_vss_axi_full_2_ARREGION(fib_stealSide_vss_axi_full_2_signals_.arregion);
    fib_stealSide_vss_axi_full_2_ARQOS(fib_stealSide_vss_axi_full_2_signals_.arqos);
    fib_stealSide_vss_axi_full_2_ARCACHE(fib_stealSide_vss_axi_full_2_signals_.arcache);
    fib_stealSide_vss_axi_full_2_ARBURST(fib_stealSide_vss_axi_full_2_signals_.arburst);
    fib_stealSide_vss_axi_full_2_ARSIZE(fib_stealSide_vss_axi_full_2_signals_.arsize);
    fib_stealSide_vss_axi_full_2_ARLEN(fib_stealSide_vss_axi_full_2_signals_.arlen);
    fib_stealSide_vss_axi_full_2_ARID(fib_stealSide_vss_axi_full_2_signals_.arid);
    fib_stealSide_vss_axi_full_2_ARLOCK(fib_stealSide_vss_axi_full_2_signals_.arlock);
    fib_stealSide_vss_axi_full_2_RVALID(fib_stealSide_vss_axi_full_2_signals_.rvalid);
    fib_stealSide_vss_axi_full_2_RREADY(fib_stealSide_vss_axi_full_2_signals_.rready);
    fib_stealSide_vss_axi_full_2_RDATA(fib_stealSide_vss_axi_full_2_signals_.rdata);
    fib_stealSide_vss_axi_full_2_RRESP(fib_stealSide_vss_axi_full_2_signals_.rresp);
    fib_stealSide_vss_axi_full_2_RID(fib_stealSide_vss_axi_full_2_signals_.rid);
    fib_stealSide_vss_axi_full_2_RLAST(fib_stealSide_vss_axi_full_2_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: fib_stealSide_axi_mgmt_vss_3 */
    /* is_slave = True */
    fib_stealSide_axi_mgmt_vss_3_AWVALID(fib_stealSide_axi_mgmt_vss_3_signals_.awvalid);
    fib_stealSide_axi_mgmt_vss_3_AWREADY(fib_stealSide_axi_mgmt_vss_3_signals_.awready);
    fib_stealSide_axi_mgmt_vss_3_AWADDR(fib_stealSide_axi_mgmt_vss_3_signals_.awaddr);
    fib_stealSide_axi_mgmt_vss_3_AWPROT(fib_stealSide_axi_mgmt_vss_3_signals_.awprot);
    fib_stealSide_axi_mgmt_vss_3_WVALID(fib_stealSide_axi_mgmt_vss_3_signals_.wvalid);
    fib_stealSide_axi_mgmt_vss_3_WREADY(fib_stealSide_axi_mgmt_vss_3_signals_.wready);
    fib_stealSide_axi_mgmt_vss_3_WDATA(fib_stealSide_axi_mgmt_vss_3_signals_.wdata);
    fib_stealSide_axi_mgmt_vss_3_WSTRB(fib_stealSide_axi_mgmt_vss_3_signals_.wstrb);
    fib_stealSide_axi_mgmt_vss_3_BVALID(fib_stealSide_axi_mgmt_vss_3_signals_.bvalid);
    fib_stealSide_axi_mgmt_vss_3_BREADY(fib_stealSide_axi_mgmt_vss_3_signals_.bready);
    fib_stealSide_axi_mgmt_vss_3_BRESP(fib_stealSide_axi_mgmt_vss_3_signals_.bresp);
    fib_stealSide_axi_mgmt_vss_3_ARVALID(fib_stealSide_axi_mgmt_vss_3_signals_.arvalid);
    fib_stealSide_axi_mgmt_vss_3_ARREADY(fib_stealSide_axi_mgmt_vss_3_signals_.arready);
    fib_stealSide_axi_mgmt_vss_3_ARADDR(fib_stealSide_axi_mgmt_vss_3_signals_.araddr);
    fib_stealSide_axi_mgmt_vss_3_ARPROT(fib_stealSide_axi_mgmt_vss_3_signals_.arprot);
    fib_stealSide_axi_mgmt_vss_3_RVALID(fib_stealSide_axi_mgmt_vss_3_signals_.rvalid);
    fib_stealSide_axi_mgmt_vss_3_RREADY(fib_stealSide_axi_mgmt_vss_3_signals_.rready);
    fib_stealSide_axi_mgmt_vss_3_RDATA(fib_stealSide_axi_mgmt_vss_3_signals_.rdata);
    fib_stealSide_axi_mgmt_vss_3_RRESP(fib_stealSide_axi_mgmt_vss_3_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: fib_stealSide_vss_axi_full_3 */
    /* is_slave = False */
    fib_stealSide_vss_axi_full_3_AWVALID(fib_stealSide_vss_axi_full_3_signals_.awvalid);
    fib_stealSide_vss_axi_full_3_AWREADY(fib_stealSide_vss_axi_full_3_signals_.awready);
    fib_stealSide_vss_axi_full_3_AWADDR(fib_stealSide_vss_axi_full_3_signals_.awaddr);
    fib_stealSide_vss_axi_full_3_AWPROT(fib_stealSide_vss_axi_full_3_signals_.awprot);
    fib_stealSide_vss_axi_full_3_AWREGION(fib_stealSide_vss_axi_full_3_signals_.awregion);
    fib_stealSide_vss_axi_full_3_AWQOS(fib_stealSide_vss_axi_full_3_signals_.awqos);
    fib_stealSide_vss_axi_full_3_AWCACHE(fib_stealSide_vss_axi_full_3_signals_.awcache);
    fib_stealSide_vss_axi_full_3_AWBURST(fib_stealSide_vss_axi_full_3_signals_.awburst);
    fib_stealSide_vss_axi_full_3_AWSIZE(fib_stealSide_vss_axi_full_3_signals_.awsize);
    fib_stealSide_vss_axi_full_3_AWLEN(fib_stealSide_vss_axi_full_3_signals_.awlen);
    fib_stealSide_vss_axi_full_3_AWID(fib_stealSide_vss_axi_full_3_signals_.awid);
    fib_stealSide_vss_axi_full_3_AWLOCK(fib_stealSide_vss_axi_full_3_signals_.awlock);
    fib_stealSide_vss_axi_full_3_WID(fib_stealSide_vss_axi_full_3_signals_.wid);
    fib_stealSide_vss_axi_full_3_WVALID(fib_stealSide_vss_axi_full_3_signals_.wvalid);
    fib_stealSide_vss_axi_full_3_WREADY(fib_stealSide_vss_axi_full_3_signals_.wready);
    fib_stealSide_vss_axi_full_3_WDATA(fib_stealSide_vss_axi_full_3_signals_.wdata);
    fib_stealSide_vss_axi_full_3_WSTRB(fib_stealSide_vss_axi_full_3_signals_.wstrb);
    fib_stealSide_vss_axi_full_3_WLAST(fib_stealSide_vss_axi_full_3_signals_.wlast);
    fib_stealSide_vss_axi_full_3_BVALID(fib_stealSide_vss_axi_full_3_signals_.bvalid);
    fib_stealSide_vss_axi_full_3_BREADY(fib_stealSide_vss_axi_full_3_signals_.bready);
    fib_stealSide_vss_axi_full_3_BRESP(fib_stealSide_vss_axi_full_3_signals_.bresp);
    fib_stealSide_vss_axi_full_3_BID(fib_stealSide_vss_axi_full_3_signals_.bid);
    fib_stealSide_vss_axi_full_3_ARVALID(fib_stealSide_vss_axi_full_3_signals_.arvalid);
    fib_stealSide_vss_axi_full_3_ARREADY(fib_stealSide_vss_axi_full_3_signals_.arready);
    fib_stealSide_vss_axi_full_3_ARADDR(fib_stealSide_vss_axi_full_3_signals_.araddr);
    fib_stealSide_vss_axi_full_3_ARPROT(fib_stealSide_vss_axi_full_3_signals_.arprot);
    fib_stealSide_vss_axi_full_3_ARREGION(fib_stealSide_vss_axi_full_3_signals_.arregion);
    fib_stealSide_vss_axi_full_3_ARQOS(fib_stealSide_vss_axi_full_3_signals_.arqos);
    fib_stealSide_vss_axi_full_3_ARCACHE(fib_stealSide_vss_axi_full_3_signals_.arcache);
    fib_stealSide_vss_axi_full_3_ARBURST(fib_stealSide_vss_axi_full_3_signals_.arburst);
    fib_stealSide_vss_axi_full_3_ARSIZE(fib_stealSide_vss_axi_full_3_signals_.arsize);
    fib_stealSide_vss_axi_full_3_ARLEN(fib_stealSide_vss_axi_full_3_signals_.arlen);
    fib_stealSide_vss_axi_full_3_ARID(fib_stealSide_vss_axi_full_3_signals_.arid);
    fib_stealSide_vss_axi_full_3_ARLOCK(fib_stealSide_vss_axi_full_3_signals_.arlock);
    fib_stealSide_vss_axi_full_3_RVALID(fib_stealSide_vss_axi_full_3_signals_.rvalid);
    fib_stealSide_vss_axi_full_3_RREADY(fib_stealSide_vss_axi_full_3_signals_.rready);
    fib_stealSide_vss_axi_full_3_RDATA(fib_stealSide_vss_axi_full_3_signals_.rdata);
    fib_stealSide_vss_axi_full_3_RRESP(fib_stealSide_vss_axi_full_3_signals_.rresp);
    fib_stealSide_vss_axi_full_3_RID(fib_stealSide_vss_axi_full_3_signals_.rid);
    fib_stealSide_vss_axi_full_3_RLAST(fib_stealSide_vss_axi_full_3_signals_.rlast);
    
    
}

void VerilatedTlmModule::do_init_()
{
    set("clock", clock);
    set("reset", reset);
    set("description", description);
}

flexitask::desc::FlexiTaskSystem VerilatedTlmModule::description = [] {
    using namespace flexitask::desc;
    auto description = FlexiTaskSystem{
        .tasks = []() {
            std::map<std::string, Task> r;
            r["fib"] = Task{
                .name = "fib",
                .parent = "/tasks",
                .path = "/tasks:fib",
                .isRoot = true,
                .isCont = false,
                .widthTask = 128,
                .widthCont = 128,
                .widthArg = 128,
                .numProcessingElements = 5,
                .processingElements = []() {
                    std::map<std::string, ProcessingElement> r;
                    r["pe_0"] = ProcessingElement{
                        .name = "pe_0",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_0",
                        .portName = "fib_PE_0",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_0",
                                .path = "/tasks:fib/processingElements:pe_0/interfaces:mem",
                                .portName = "fib_PE_0_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:fib/processingElements:pe_0",
                                .path = "/tasks:fib/processingElements:pe_0/interfaces:taskIn",
                                .portName = "fib_PE_0_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:fib/processingElements:pe_0",
                                .path = "/tasks:fib/processingElements:pe_0/interfaces:taskOut",
                                .portName = "fib_PE_0_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:fib/processingElements:pe_0",
                                .path = "/tasks:fib/processingElements:pe_0/interfaces:contOut_sum",
                                .portName = "fib_PE_0_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_sum"] = Interface{
                                .name = "addrIn_sum",
                                .parent = "/tasks:fib/processingElements:pe_0",
                                .path = "/tasks:fib/processingElements:pe_0/interfaces:addrIn_sum",
                                .portName = "fib_PE_0_addrIn_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_1"] = ProcessingElement{
                        .name = "pe_1",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_1",
                        .portName = "fib_PE_1",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_1",
                                .path = "/tasks:fib/processingElements:pe_1/interfaces:mem",
                                .portName = "fib_PE_1_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:fib/processingElements:pe_1",
                                .path = "/tasks:fib/processingElements:pe_1/interfaces:taskIn",
                                .portName = "fib_PE_1_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:fib/processingElements:pe_1",
                                .path = "/tasks:fib/processingElements:pe_1/interfaces:taskOut",
                                .portName = "fib_PE_1_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:fib/processingElements:pe_1",
                                .path = "/tasks:fib/processingElements:pe_1/interfaces:contOut_sum",
                                .portName = "fib_PE_1_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_sum"] = Interface{
                                .name = "addrIn_sum",
                                .parent = "/tasks:fib/processingElements:pe_1",
                                .path = "/tasks:fib/processingElements:pe_1/interfaces:addrIn_sum",
                                .portName = "fib_PE_1_addrIn_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_2"] = ProcessingElement{
                        .name = "pe_2",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_2",
                        .portName = "fib_PE_2",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_2",
                                .path = "/tasks:fib/processingElements:pe_2/interfaces:mem",
                                .portName = "fib_PE_2_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:fib/processingElements:pe_2",
                                .path = "/tasks:fib/processingElements:pe_2/interfaces:taskIn",
                                .portName = "fib_PE_2_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:fib/processingElements:pe_2",
                                .path = "/tasks:fib/processingElements:pe_2/interfaces:taskOut",
                                .portName = "fib_PE_2_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:fib/processingElements:pe_2",
                                .path = "/tasks:fib/processingElements:pe_2/interfaces:contOut_sum",
                                .portName = "fib_PE_2_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_sum"] = Interface{
                                .name = "addrIn_sum",
                                .parent = "/tasks:fib/processingElements:pe_2",
                                .path = "/tasks:fib/processingElements:pe_2/interfaces:addrIn_sum",
                                .portName = "fib_PE_2_addrIn_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_3"] = ProcessingElement{
                        .name = "pe_3",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_3",
                        .portName = "fib_PE_3",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_3",
                                .path = "/tasks:fib/processingElements:pe_3/interfaces:mem",
                                .portName = "fib_PE_3_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:fib/processingElements:pe_3",
                                .path = "/tasks:fib/processingElements:pe_3/interfaces:taskIn",
                                .portName = "fib_PE_3_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:fib/processingElements:pe_3",
                                .path = "/tasks:fib/processingElements:pe_3/interfaces:taskOut",
                                .portName = "fib_PE_3_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:fib/processingElements:pe_3",
                                .path = "/tasks:fib/processingElements:pe_3/interfaces:contOut_sum",
                                .portName = "fib_PE_3_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_sum"] = Interface{
                                .name = "addrIn_sum",
                                .parent = "/tasks:fib/processingElements:pe_3",
                                .path = "/tasks:fib/processingElements:pe_3/interfaces:addrIn_sum",
                                .portName = "fib_PE_3_addrIn_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_4"] = ProcessingElement{
                        .name = "pe_4",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_4",
                        .portName = "fib_PE_4",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_4",
                                .path = "/tasks:fib/processingElements:pe_4/interfaces:mem",
                                .portName = "fib_PE_4_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:fib/processingElements:pe_4",
                                .path = "/tasks:fib/processingElements:pe_4/interfaces:taskIn",
                                .portName = "fib_PE_4_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:fib/processingElements:pe_4",
                                .path = "/tasks:fib/processingElements:pe_4/interfaces:taskOut",
                                .portName = "fib_PE_4_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 128,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:fib/processingElements:pe_4",
                                .path = "/tasks:fib/processingElements:pe_4/interfaces:contOut_sum",
                                .portName = "fib_PE_4_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_sum"] = Interface{
                                .name = "addrIn_sum",
                                .parent = "/tasks:fib/processingElements:pe_4",
                                .path = "/tasks:fib/processingElements:pe_4/interfaces:addrIn_sum",
                                .portName = "fib_PE_4_addrIn_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    return r;
                }(),
                .numVirtualStealServers = 4,
                .capacityVirtualStealQueue = 16384,
                .virtualStealServers = []() {
                    std::map<std::string, VirtualStealServer> r;
                    r["vss_0"] = VirtualStealServer{
                        .name = "vss_0",
                        .parent = "fib",
                        .path = "/tasks:fib/virtualStealServers:vss_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff00000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:fib_stealSide_axi_mgmt_vss_0",
                        .capacity = 16384,
                        .numBytesTask = 16
                    };
                    r["vss_1"] = VirtualStealServer{
                        .name = "vss_1",
                        .parent = "fib",
                        .path = "/tasks:fib/virtualStealServers:vss_1",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff10000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:fib_stealSide_axi_mgmt_vss_1",
                        .capacity = 16384,
                        .numBytesTask = 16
                    };
                    r["vss_2"] = VirtualStealServer{
                        .name = "vss_2",
                        .parent = "fib",
                        .path = "/tasks:fib/virtualStealServers:vss_2",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff20000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:fib_stealSide_axi_mgmt_vss_2",
                        .capacity = 16384,
                        .numBytesTask = 16
                    };
                    r["vss_3"] = VirtualStealServer{
                        .name = "vss_3",
                        .parent = "fib",
                        .path = "/tasks:fib/virtualStealServers:vss_3",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff30000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:fib_stealSide_axi_mgmt_vss_3",
                        .capacity = 16384,
                        .numBytesTask = 16
                    };
                    return r;
                }(),
                .numVirtualContinuationServers = 0,
                .capacityVirtualContinuationQueue = 0,
                .numArgRouteServers = 0,
                .capacityArgRouteServers = 0
            };
            r["sum"] = Task{
                .name = "sum",
                .parent = "/tasks",
                .path = "/tasks:sum",
                .isRoot = false,
                .isCont = true,
                .widthTask = 256,
                .widthCont = 256,
                .widthArg = 256,
                .numProcessingElements = 5,
                .processingElements = []() {
                    std::map<std::string, ProcessingElement> r;
                    r["pe_0"] = ProcessingElement{
                        .name = "pe_0",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_0",
                        .portName = "sum_PE_0",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_0",
                                .path = "/tasks:sum/processingElements:pe_0/interfaces:mem",
                                .portName = "sum_PE_0_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:sum/processingElements:pe_0",
                                .path = "/tasks:sum/processingElements:pe_0/interfaces:taskIn",
                                .portName = "sum_PE_0_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:sum/processingElements:pe_0",
                                .path = "/tasks:sum/processingElements:pe_0/interfaces:contOut_sum",
                                .portName = "sum_PE_0_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_1"] = ProcessingElement{
                        .name = "pe_1",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_1",
                        .portName = "sum_PE_1",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_1",
                                .path = "/tasks:sum/processingElements:pe_1/interfaces:mem",
                                .portName = "sum_PE_1_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:sum/processingElements:pe_1",
                                .path = "/tasks:sum/processingElements:pe_1/interfaces:taskIn",
                                .portName = "sum_PE_1_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:sum/processingElements:pe_1",
                                .path = "/tasks:sum/processingElements:pe_1/interfaces:contOut_sum",
                                .portName = "sum_PE_1_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_2"] = ProcessingElement{
                        .name = "pe_2",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_2",
                        .portName = "sum_PE_2",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_2",
                                .path = "/tasks:sum/processingElements:pe_2/interfaces:mem",
                                .portName = "sum_PE_2_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:sum/processingElements:pe_2",
                                .path = "/tasks:sum/processingElements:pe_2/interfaces:taskIn",
                                .portName = "sum_PE_2_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:sum/processingElements:pe_2",
                                .path = "/tasks:sum/processingElements:pe_2/interfaces:contOut_sum",
                                .portName = "sum_PE_2_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_3"] = ProcessingElement{
                        .name = "pe_3",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_3",
                        .portName = "sum_PE_3",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_3",
                                .path = "/tasks:sum/processingElements:pe_3/interfaces:mem",
                                .portName = "sum_PE_3_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:sum/processingElements:pe_3",
                                .path = "/tasks:sum/processingElements:pe_3/interfaces:taskIn",
                                .portName = "sum_PE_3_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:sum/processingElements:pe_3",
                                .path = "/tasks:sum/processingElements:pe_3/interfaces:contOut_sum",
                                .portName = "sum_PE_3_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_4"] = ProcessingElement{
                        .name = "pe_4",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_4",
                        .portName = "sum_PE_4",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_4",
                                .path = "/tasks:sum/processingElements:pe_4/interfaces:mem",
                                .portName = "sum_PE_4_mem",
                                .protocol = InterfaceProtocol::Axi4,
                                .config = Axi4Config{
                                    .addr_width = 64,
                                    .data_width = 64,
                                    .id_width = 4,
                                    .axlen_width = 8,
                                    .axlock_width = 1,
                                    .awuser_width = 0,
                                    .aruser_width = 0,
                                    .wuser_width = 0,
                                    .ruser_width = 0,
                                    .buser_width = 0
                                }
                            };
                            r["taskIn"] = Interface{
                                .name = "taskIn",
                                .parent = "/tasks:sum/processingElements:pe_4",
                                .path = "/tasks:sum/processingElements:pe_4/interfaces:taskIn",
                                .portName = "sum_PE_4_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_sum"] = Interface{
                                .name = "contOut_sum",
                                .parent = "/tasks:sum/processingElements:pe_4",
                                .path = "/tasks:sum/processingElements:pe_4/interfaces:contOut_sum",
                                .portName = "sum_PE_4_contOut_sum",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    return r;
                }(),
                .numVirtualStealServers = 1,
                .capacityVirtualStealQueue = 16384,
                .virtualStealServers = []() {
                    std::map<std::string, VirtualStealServer> r;
                    r["vss_0"] = VirtualStealServer{
                        .name = "vss_0",
                        .parent = "sum",
                        .path = "/tasks:sum/virtualStealServers:vss_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff40000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:sum_stealSide_axi_mgmt_vss_0",
                        .capacity = 16384,
                        .numBytesTask = 32
                    };
                    return r;
                }(),
                .numVirtualContinuationServers = 1,
                .capacityVirtualContinuationQueue = 16384,
                .virtualContinuationAddressServers = []() {
                    std::map<std::string, VirtualContinuationAddressServer> r;
                    r["vcas_0"] = VirtualContinuationAddressServer{
                        .name = "vcas_0",
                        .parent = "sum",
                        .path = "/tasks:sum/virtualContinuationServers:vcas_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff50000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:sum_continuationAllocationSide_axi_mgmt_vcas",
                        .capacity = 16384,
                        .numBytesCont = 32
                    };
                    return r;
                }(),
                .numArgRouteServers = 4,
                .capacityArgRouteServers = 32
            };
            return r;
        }(),
        .system = System{
            .name = "system",
            .parent = "/",
            .path = "/system",
            .interfaces = []() {
                std::map<std::string, Interface> r;
                r["fib_stealSide_taskOut_0"] = Interface{
                    .name = "fib_stealSide_taskOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_0",
                    .portName = "fib_stealSide_taskOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_1"] = Interface{
                    .name = "fib_stealSide_taskOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_1",
                    .portName = "fib_stealSide_taskOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_2"] = Interface{
                    .name = "fib_stealSide_taskOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_2",
                    .portName = "fib_stealSide_taskOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_3"] = Interface{
                    .name = "fib_stealSide_taskOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_3",
                    .portName = "fib_stealSide_taskOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_4"] = Interface{
                    .name = "fib_stealSide_taskOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_4",
                    .portName = "fib_stealSide_taskOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_0"] = Interface{
                    .name = "fib_stealSide_taskIn_0",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_0",
                    .portName = "fib_stealSide_taskIn_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_1"] = Interface{
                    .name = "fib_stealSide_taskIn_1",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_1",
                    .portName = "fib_stealSide_taskIn_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_2"] = Interface{
                    .name = "fib_stealSide_taskIn_2",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_2",
                    .portName = "fib_stealSide_taskIn_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_3"] = Interface{
                    .name = "fib_stealSide_taskIn_3",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_3",
                    .portName = "fib_stealSide_taskIn_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_4"] = Interface{
                    .name = "fib_stealSide_taskIn_4",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_4",
                    .portName = "fib_stealSide_taskIn_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_0"] = Interface{
                    .name = "sum_stealSide_taskOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_0",
                    .portName = "sum_stealSide_taskOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_1"] = Interface{
                    .name = "sum_stealSide_taskOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_1",
                    .portName = "sum_stealSide_taskOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_2"] = Interface{
                    .name = "sum_stealSide_taskOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_2",
                    .portName = "sum_stealSide_taskOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_3"] = Interface{
                    .name = "sum_stealSide_taskOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_3",
                    .portName = "sum_stealSide_taskOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_4"] = Interface{
                    .name = "sum_stealSide_taskOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_4",
                    .portName = "sum_stealSide_taskOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_0"] = Interface{
                    .name = "sum_syncSide_addrIn_0",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_0",
                    .portName = "sum_syncSide_addrIn_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_1"] = Interface{
                    .name = "sum_syncSide_addrIn_1",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_1",
                    .portName = "sum_syncSide_addrIn_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_2"] = Interface{
                    .name = "sum_syncSide_addrIn_2",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_2",
                    .portName = "sum_syncSide_addrIn_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_3"] = Interface{
                    .name = "sum_syncSide_addrIn_3",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_3",
                    .portName = "sum_syncSide_addrIn_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_4"] = Interface{
                    .name = "sum_syncSide_addrIn_4",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_4",
                    .portName = "sum_syncSide_addrIn_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_0"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_0",
                    .portName = "sum_continuationAllocationSide_contOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_1"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_1",
                    .portName = "sum_continuationAllocationSide_contOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_2"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_2",
                    .portName = "sum_continuationAllocationSide_contOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_3"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_3",
                    .portName = "sum_continuationAllocationSide_contOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_4"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_4",
                    .portName = "sum_continuationAllocationSide_contOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_5"] = Interface{
                    .name = "sum_syncSide_addrIn_5",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_5",
                    .portName = "sum_syncSide_addrIn_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_6"] = Interface{
                    .name = "sum_syncSide_addrIn_6",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_6",
                    .portName = "sum_syncSide_addrIn_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_7"] = Interface{
                    .name = "sum_syncSide_addrIn_7",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_7",
                    .portName = "sum_syncSide_addrIn_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_8"] = Interface{
                    .name = "sum_syncSide_addrIn_8",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_8",
                    .portName = "sum_syncSide_addrIn_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_9"] = Interface{
                    .name = "sum_syncSide_addrIn_9",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_9",
                    .portName = "sum_syncSide_addrIn_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_axi_mgmt_vss_0"] = Interface{
                    .name = "sum_stealSide_axi_mgmt_vss_0",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_axi_mgmt_vss_0",
                    .portName = "sum_stealSide_axi_mgmt_vss_0",
                    .isSlave = true,
                    .config = Axi4liteConfig{
                        .addr_width = 6,
                        .data_width = 64
                    },
                    .addressSpace = AddressSpace{
                        .base = addr_type(0x000000003ff40000ull),
                        .size = addr_type(0x0000000000010000ull)
                    }
                };
                r["sum_stealSide_vss_axi_full_0"] = Interface{
                    .name = "sum_stealSide_vss_axi_full_0",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_vss_axi_full_0",
                    .portName = "sum_stealSide_vss_axi_full_0",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 256,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_continuationAllocationSide_axi_mgmt_vcas"] = Interface{
                    .name = "sum_continuationAllocationSide_axi_mgmt_vcas",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_axi_mgmt_vcas",
                    .portName = "sum_continuationAllocationSide_axi_mgmt_vcas",
                    .isSlave = true,
                    .config = Axi4liteConfig{
                        .addr_width = 6,
                        .data_width = 64
                    },
                    .addressSpace = AddressSpace{
                        .base = addr_type(0x000000003ff50000ull),
                        .size = addr_type(0x0000000000010000ull)
                    }
                };
                r["sum_continuationAllocationSide_vcas_axi_full"] = Interface{
                    .name = "sum_continuationAllocationSide_vcas_axi_full",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_vcas_axi_full",
                    .portName = "sum_continuationAllocationSide_vcas_axi_full",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 64,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_0"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_0",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_0",
                    .portName = "sum_syncSide_axi_full_argRoute_0",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_1"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_1",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_1",
                    .portName = "sum_syncSide_axi_full_argRoute_1",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_2"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_2",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_2",
                    .portName = "sum_syncSide_axi_full_argRoute_2",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_3"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_3",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_3",
                    .portName = "sum_syncSide_axi_full_argRoute_3",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_4"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_4",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_4",
                    .portName = "sum_syncSide_axi_full_argRoute_4",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_5"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_5",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_5",
                    .portName = "sum_syncSide_axi_full_argRoute_5",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_6"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_6",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_6",
                    .portName = "sum_syncSide_axi_full_argRoute_6",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["sum_syncSide_axi_full_argRoute_7"] = Interface{
                    .name = "sum_syncSide_axi_full_argRoute_7",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_axi_full_argRoute_7",
                    .portName = "sum_syncSide_axi_full_argRoute_7",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 32,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["fib_stealSide_axi_mgmt_vss_0"] = Interface{
                    .name = "fib_stealSide_axi_mgmt_vss_0",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_axi_mgmt_vss_0",
                    .portName = "fib_stealSide_axi_mgmt_vss_0",
                    .isSlave = true,
                    .config = Axi4liteConfig{
                        .addr_width = 6,
                        .data_width = 64
                    },
                    .addressSpace = AddressSpace{
                        .base = addr_type(0x000000003ff00000ull),
                        .size = addr_type(0x0000000000010000ull)
                    }
                };
                r["fib_stealSide_vss_axi_full_0"] = Interface{
                    .name = "fib_stealSide_vss_axi_full_0",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_vss_axi_full_0",
                    .portName = "fib_stealSide_vss_axi_full_0",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 128,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["fib_stealSide_axi_mgmt_vss_1"] = Interface{
                    .name = "fib_stealSide_axi_mgmt_vss_1",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_axi_mgmt_vss_1",
                    .portName = "fib_stealSide_axi_mgmt_vss_1",
                    .isSlave = true,
                    .config = Axi4liteConfig{
                        .addr_width = 6,
                        .data_width = 64
                    },
                    .addressSpace = AddressSpace{
                        .base = addr_type(0x000000003ff10000ull),
                        .size = addr_type(0x0000000000010000ull)
                    }
                };
                r["fib_stealSide_vss_axi_full_1"] = Interface{
                    .name = "fib_stealSide_vss_axi_full_1",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_vss_axi_full_1",
                    .portName = "fib_stealSide_vss_axi_full_1",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 128,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["fib_stealSide_axi_mgmt_vss_2"] = Interface{
                    .name = "fib_stealSide_axi_mgmt_vss_2",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_axi_mgmt_vss_2",
                    .portName = "fib_stealSide_axi_mgmt_vss_2",
                    .isSlave = true,
                    .config = Axi4liteConfig{
                        .addr_width = 6,
                        .data_width = 64
                    },
                    .addressSpace = AddressSpace{
                        .base = addr_type(0x000000003ff20000ull),
                        .size = addr_type(0x0000000000010000ull)
                    }
                };
                r["fib_stealSide_vss_axi_full_2"] = Interface{
                    .name = "fib_stealSide_vss_axi_full_2",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_vss_axi_full_2",
                    .portName = "fib_stealSide_vss_axi_full_2",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 128,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                r["fib_stealSide_axi_mgmt_vss_3"] = Interface{
                    .name = "fib_stealSide_axi_mgmt_vss_3",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_axi_mgmt_vss_3",
                    .portName = "fib_stealSide_axi_mgmt_vss_3",
                    .isSlave = true,
                    .config = Axi4liteConfig{
                        .addr_width = 6,
                        .data_width = 64
                    },
                    .addressSpace = AddressSpace{
                        .base = addr_type(0x000000003ff30000ull),
                        .size = addr_type(0x0000000000010000ull)
                    }
                };
                r["fib_stealSide_vss_axi_full_3"] = Interface{
                    .name = "fib_stealSide_vss_axi_full_3",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_vss_axi_full_3",
                    .portName = "fib_stealSide_vss_axi_full_3",
                    .isSlave = false,
                    .config = Axi4Config{
                        .addr_width = 64,
                        .data_width = 128,
                        .id_width = 4,
                        .axlen_width = 8,
                        .axlock_width = 1,
                        .awuser_width = 0,
                        .aruser_width = 0,
                        .wuser_width = 0,
                        .ruser_width = 0,
                        .buser_width = 0
                    }
                };
                return r;
            }()
        },
        .connections = std::vector<std::pair<std::string, std::string>>{
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_0",
                "/tasks:fib/processingElements:pe_0/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_1",
                "/tasks:fib/processingElements:pe_1/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_2",
                "/tasks:fib/processingElements:pe_2/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_3",
                "/tasks:fib/processingElements:pe_3/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_4",
                "/tasks:fib/processingElements:pe_4/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_0/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_0"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_1/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_1"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_2/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_2"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_3/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_3"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_4/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_4"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_0",
                "/tasks:sum/processingElements:pe_0/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_1",
                "/tasks:sum/processingElements:pe_1/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_2",
                "/tasks:sum/processingElements:pe_2/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_3",
                "/tasks:sum/processingElements:pe_3/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_4",
                "/tasks:sum/processingElements:pe_4/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_0/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_0"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_1/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_1"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_2/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_2"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_3/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_3"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_4/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_4"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_0",
                "/tasks:fib/processingElements:pe_0/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_1",
                "/tasks:fib/processingElements:pe_1/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_2",
                "/tasks:fib/processingElements:pe_2/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_3",
                "/tasks:fib/processingElements:pe_3/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_4",
                "/tasks:fib/processingElements:pe_4/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_0/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_1/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_2/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_7"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_3/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_8"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_4/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_9"
            }
        },
        .widthAddress = 64,
        .widthContinuationCounter = 32,
        .spawnList = []() {
            std::map<std::string, std::vector<std::string>> r;
            r["fib"] = std::vector<std::string>{
                "fib"
            };
            return r;
        }(),
        .spawnNextList = []() {
            std::map<std::string, std::vector<std::string>> r;
            r["fib"] = std::vector<std::string>{
                "sum"
            };
            return r;
        }(),
        .sendArgumentList = []() {
            std::map<std::string, std::vector<std::string>> r;
            r["fib"] = std::vector<std::string>{
                "sum"
            };
            r["sum"] = std::vector<std::string>{
                "sum"
            };
            return r;
        }(),
        .managementBase = addr_type(0x000000003ff00000ull),
        .memory = AddressSpace{
            .base = addr_type(0x0000000040000000ull),
            .size = addr_type(0x00000000c0000000ull)
        },
        .interconnectMasters = 25,
        .interconnectSlaves = 7,
        .isElaborated = true
    };
    return description;
}();



}