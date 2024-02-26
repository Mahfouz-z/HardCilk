#include "verilated.hpp"

namespace paper_exp3
{

VerilatedTlmModule::VerilatedTlmModule(sc_core::sc_module_name const &name):
    Vpaper_exp3(name),
    task1Exp3_stealSide_taskOut_0_signals_("task1Exp3_stealSide_taskOut_0_signals"),
    task1Exp3_stealSide_taskOut_1_signals_("task1Exp3_stealSide_taskOut_1_signals"),
    task1Exp3_stealSide_taskOut_2_signals_("task1Exp3_stealSide_taskOut_2_signals"),
    task1Exp3_stealSide_taskOut_3_signals_("task1Exp3_stealSide_taskOut_3_signals"),
    task1Exp3_stealSide_taskOut_4_signals_("task1Exp3_stealSide_taskOut_4_signals"),
    task1Exp3_stealSide_taskOut_5_signals_("task1Exp3_stealSide_taskOut_5_signals"),
    task1Exp3_stealSide_taskOut_6_signals_("task1Exp3_stealSide_taskOut_6_signals"),
    task1Exp3_stealSide_taskOut_7_signals_("task1Exp3_stealSide_taskOut_7_signals"),
    task1Exp3_stealSide_taskOut_8_signals_("task1Exp3_stealSide_taskOut_8_signals"),
    task1Exp3_stealSide_taskOut_9_signals_("task1Exp3_stealSide_taskOut_9_signals"),
    task1Exp3_stealSide_taskOut_10_signals_("task1Exp3_stealSide_taskOut_10_signals"),
    task1Exp3_stealSide_taskOut_11_signals_("task1Exp3_stealSide_taskOut_11_signals"),
    task1Exp3_stealSide_taskIn_0_signals_("task1Exp3_stealSide_taskIn_0_signals"),
    task1Exp3_stealSide_taskIn_1_signals_("task1Exp3_stealSide_taskIn_1_signals"),
    task1Exp3_stealSide_taskIn_2_signals_("task1Exp3_stealSide_taskIn_2_signals"),
    task1Exp3_stealSide_taskIn_3_signals_("task1Exp3_stealSide_taskIn_3_signals"),
    task1Exp3_stealSide_taskIn_4_signals_("task1Exp3_stealSide_taskIn_4_signals"),
    task1Exp3_stealSide_taskIn_5_signals_("task1Exp3_stealSide_taskIn_5_signals"),
    task1Exp3_stealSide_taskIn_6_signals_("task1Exp3_stealSide_taskIn_6_signals"),
    task1Exp3_stealSide_taskIn_7_signals_("task1Exp3_stealSide_taskIn_7_signals"),
    task1Exp3_stealSide_taskIn_8_signals_("task1Exp3_stealSide_taskIn_8_signals"),
    task1Exp3_stealSide_taskIn_9_signals_("task1Exp3_stealSide_taskIn_9_signals"),
    task1Exp3_stealSide_taskIn_10_signals_("task1Exp3_stealSide_taskIn_10_signals"),
    task1Exp3_stealSide_taskIn_11_signals_("task1Exp3_stealSide_taskIn_11_signals"),
    task2Exp3_stealSide_taskOut_0_signals_("task2Exp3_stealSide_taskOut_0_signals"),
    task2Exp3_stealSide_taskOut_1_signals_("task2Exp3_stealSide_taskOut_1_signals"),
    task2Exp3_stealSide_taskOut_2_signals_("task2Exp3_stealSide_taskOut_2_signals"),
    task2Exp3_stealSide_taskOut_3_signals_("task2Exp3_stealSide_taskOut_3_signals"),
    task2Exp3_stealSide_taskOut_4_signals_("task2Exp3_stealSide_taskOut_4_signals"),
    task2Exp3_stealSide_taskOut_5_signals_("task2Exp3_stealSide_taskOut_5_signals"),
    task2Exp3_stealSide_taskOut_6_signals_("task2Exp3_stealSide_taskOut_6_signals"),
    task2Exp3_stealSide_taskOut_7_signals_("task2Exp3_stealSide_taskOut_7_signals"),
    task2Exp3_stealSide_taskOut_8_signals_("task2Exp3_stealSide_taskOut_8_signals"),
    task2Exp3_stealSide_taskOut_9_signals_("task2Exp3_stealSide_taskOut_9_signals"),
    task2Exp3_stealSide_taskOut_10_signals_("task2Exp3_stealSide_taskOut_10_signals"),
    task2Exp3_stealSide_taskOut_11_signals_("task2Exp3_stealSide_taskOut_11_signals"),
    task2Exp3_stealSide_taskInGlobal_0_signals_("task2Exp3_stealSide_taskInGlobal_0_signals"),
    task2Exp3_stealSide_taskInGlobal_1_signals_("task2Exp3_stealSide_taskInGlobal_1_signals"),
    task2Exp3_stealSide_taskInGlobal_2_signals_("task2Exp3_stealSide_taskInGlobal_2_signals"),
    task2Exp3_stealSide_taskInGlobal_3_signals_("task2Exp3_stealSide_taskInGlobal_3_signals"),
    task2Exp3_stealSide_taskInGlobal_4_signals_("task2Exp3_stealSide_taskInGlobal_4_signals"),
    task2Exp3_stealSide_taskInGlobal_5_signals_("task2Exp3_stealSide_taskInGlobal_5_signals"),
    task2Exp3_stealSide_taskInGlobal_6_signals_("task2Exp3_stealSide_taskInGlobal_6_signals"),
    task2Exp3_stealSide_taskInGlobal_7_signals_("task2Exp3_stealSide_taskInGlobal_7_signals"),
    task2Exp3_stealSide_taskInGlobal_8_signals_("task2Exp3_stealSide_taskInGlobal_8_signals"),
    task2Exp3_stealSide_taskInGlobal_9_signals_("task2Exp3_stealSide_taskInGlobal_9_signals"),
    task2Exp3_stealSide_taskInGlobal_10_signals_("task2Exp3_stealSide_taskInGlobal_10_signals"),
    task2Exp3_stealSide_taskInGlobal_11_signals_("task2Exp3_stealSide_taskInGlobal_11_signals"),
    task1Exp3_stealSide_axi_mgmt_vss_0_signals_("task1Exp3_stealSide_axi_mgmt_vss_0_signals"),
    task1Exp3_stealSide_vss_axi_full_0_signals_("task1Exp3_stealSide_vss_axi_full_0_signals"),
    task1Exp3_stealSide_axi_mgmt_vss_1_signals_("task1Exp3_stealSide_axi_mgmt_vss_1_signals"),
    task1Exp3_stealSide_vss_axi_full_1_signals_("task1Exp3_stealSide_vss_axi_full_1_signals"),
    task2Exp3_stealSide_axi_mgmt_vss_0_signals_("task2Exp3_stealSide_axi_mgmt_vss_0_signals"),
    task2Exp3_stealSide_vss_axi_full_0_signals_("task2Exp3_stealSide_vss_axi_full_0_signals"),
    task2Exp3_stealSide_axi_mgmt_vss_1_signals_("task2Exp3_stealSide_axi_mgmt_vss_1_signals"),
    task2Exp3_stealSide_vss_axi_full_1_signals_("task2Exp3_stealSide_vss_axi_full_1_signals"),
    task1Exp3_stealSide_taskOut_0_bridge_("task1Exp3_stealSide_taskOut_0_bridge"),
    task1Exp3_stealSide_taskOut_1_bridge_("task1Exp3_stealSide_taskOut_1_bridge"),
    task1Exp3_stealSide_taskOut_2_bridge_("task1Exp3_stealSide_taskOut_2_bridge"),
    task1Exp3_stealSide_taskOut_3_bridge_("task1Exp3_stealSide_taskOut_3_bridge"),
    task1Exp3_stealSide_taskOut_4_bridge_("task1Exp3_stealSide_taskOut_4_bridge"),
    task1Exp3_stealSide_taskOut_5_bridge_("task1Exp3_stealSide_taskOut_5_bridge"),
    task1Exp3_stealSide_taskOut_6_bridge_("task1Exp3_stealSide_taskOut_6_bridge"),
    task1Exp3_stealSide_taskOut_7_bridge_("task1Exp3_stealSide_taskOut_7_bridge"),
    task1Exp3_stealSide_taskOut_8_bridge_("task1Exp3_stealSide_taskOut_8_bridge"),
    task1Exp3_stealSide_taskOut_9_bridge_("task1Exp3_stealSide_taskOut_9_bridge"),
    task1Exp3_stealSide_taskOut_10_bridge_("task1Exp3_stealSide_taskOut_10_bridge"),
    task1Exp3_stealSide_taskOut_11_bridge_("task1Exp3_stealSide_taskOut_11_bridge"),
    task1Exp3_stealSide_taskIn_0_bridge_("task1Exp3_stealSide_taskIn_0_bridge"),
    task1Exp3_stealSide_taskIn_1_bridge_("task1Exp3_stealSide_taskIn_1_bridge"),
    task1Exp3_stealSide_taskIn_2_bridge_("task1Exp3_stealSide_taskIn_2_bridge"),
    task1Exp3_stealSide_taskIn_3_bridge_("task1Exp3_stealSide_taskIn_3_bridge"),
    task1Exp3_stealSide_taskIn_4_bridge_("task1Exp3_stealSide_taskIn_4_bridge"),
    task1Exp3_stealSide_taskIn_5_bridge_("task1Exp3_stealSide_taskIn_5_bridge"),
    task1Exp3_stealSide_taskIn_6_bridge_("task1Exp3_stealSide_taskIn_6_bridge"),
    task1Exp3_stealSide_taskIn_7_bridge_("task1Exp3_stealSide_taskIn_7_bridge"),
    task1Exp3_stealSide_taskIn_8_bridge_("task1Exp3_stealSide_taskIn_8_bridge"),
    task1Exp3_stealSide_taskIn_9_bridge_("task1Exp3_stealSide_taskIn_9_bridge"),
    task1Exp3_stealSide_taskIn_10_bridge_("task1Exp3_stealSide_taskIn_10_bridge"),
    task1Exp3_stealSide_taskIn_11_bridge_("task1Exp3_stealSide_taskIn_11_bridge"),
    task2Exp3_stealSide_taskOut_0_bridge_("task2Exp3_stealSide_taskOut_0_bridge"),
    task2Exp3_stealSide_taskOut_1_bridge_("task2Exp3_stealSide_taskOut_1_bridge"),
    task2Exp3_stealSide_taskOut_2_bridge_("task2Exp3_stealSide_taskOut_2_bridge"),
    task2Exp3_stealSide_taskOut_3_bridge_("task2Exp3_stealSide_taskOut_3_bridge"),
    task2Exp3_stealSide_taskOut_4_bridge_("task2Exp3_stealSide_taskOut_4_bridge"),
    task2Exp3_stealSide_taskOut_5_bridge_("task2Exp3_stealSide_taskOut_5_bridge"),
    task2Exp3_stealSide_taskOut_6_bridge_("task2Exp3_stealSide_taskOut_6_bridge"),
    task2Exp3_stealSide_taskOut_7_bridge_("task2Exp3_stealSide_taskOut_7_bridge"),
    task2Exp3_stealSide_taskOut_8_bridge_("task2Exp3_stealSide_taskOut_8_bridge"),
    task2Exp3_stealSide_taskOut_9_bridge_("task2Exp3_stealSide_taskOut_9_bridge"),
    task2Exp3_stealSide_taskOut_10_bridge_("task2Exp3_stealSide_taskOut_10_bridge"),
    task2Exp3_stealSide_taskOut_11_bridge_("task2Exp3_stealSide_taskOut_11_bridge"),
    task2Exp3_stealSide_taskInGlobal_0_bridge_("task2Exp3_stealSide_taskInGlobal_0_bridge"),
    task2Exp3_stealSide_taskInGlobal_1_bridge_("task2Exp3_stealSide_taskInGlobal_1_bridge"),
    task2Exp3_stealSide_taskInGlobal_2_bridge_("task2Exp3_stealSide_taskInGlobal_2_bridge"),
    task2Exp3_stealSide_taskInGlobal_3_bridge_("task2Exp3_stealSide_taskInGlobal_3_bridge"),
    task2Exp3_stealSide_taskInGlobal_4_bridge_("task2Exp3_stealSide_taskInGlobal_4_bridge"),
    task2Exp3_stealSide_taskInGlobal_5_bridge_("task2Exp3_stealSide_taskInGlobal_5_bridge"),
    task2Exp3_stealSide_taskInGlobal_6_bridge_("task2Exp3_stealSide_taskInGlobal_6_bridge"),
    task2Exp3_stealSide_taskInGlobal_7_bridge_("task2Exp3_stealSide_taskInGlobal_7_bridge"),
    task2Exp3_stealSide_taskInGlobal_8_bridge_("task2Exp3_stealSide_taskInGlobal_8_bridge"),
    task2Exp3_stealSide_taskInGlobal_9_bridge_("task2Exp3_stealSide_taskInGlobal_9_bridge"),
    task2Exp3_stealSide_taskInGlobal_10_bridge_("task2Exp3_stealSide_taskInGlobal_10_bridge"),
    task2Exp3_stealSide_taskInGlobal_11_bridge_("task2Exp3_stealSide_taskInGlobal_11_bridge"),
    task1Exp3_stealSide_axi_mgmt_vss_0_bridge_("task1Exp3_stealSide_axi_mgmt_vss_0_bridge"),
    task1Exp3_stealSide_vss_axi_full_0_bridge_("task1Exp3_stealSide_vss_axi_full_0_bridge"),
    task1Exp3_stealSide_axi_mgmt_vss_1_bridge_("task1Exp3_stealSide_axi_mgmt_vss_1_bridge"),
    task1Exp3_stealSide_vss_axi_full_1_bridge_("task1Exp3_stealSide_vss_axi_full_1_bridge"),
    task2Exp3_stealSide_axi_mgmt_vss_0_bridge_("task2Exp3_stealSide_axi_mgmt_vss_0_bridge"),
    task2Exp3_stealSide_vss_axi_full_0_bridge_("task2Exp3_stealSide_vss_axi_full_0_bridge"),
    task2Exp3_stealSide_axi_mgmt_vss_1_bridge_("task2Exp3_stealSide_axi_mgmt_vss_1_bridge"),
    task2Exp3_stealSide_vss_axi_full_1_bridge_("task2Exp3_stealSide_vss_axi_full_1_bridge")
    
{
    do_connect_();

    /* initialize the map for accessing TLM sockets */
    sockets_["task1Exp3_stealSide_taskOut_0"] = &task1Exp3_stealSide_taskOut_0_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_1"] = &task1Exp3_stealSide_taskOut_1_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_2"] = &task1Exp3_stealSide_taskOut_2_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_3"] = &task1Exp3_stealSide_taskOut_3_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_4"] = &task1Exp3_stealSide_taskOut_4_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_5"] = &task1Exp3_stealSide_taskOut_5_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_6"] = &task1Exp3_stealSide_taskOut_6_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_7"] = &task1Exp3_stealSide_taskOut_7_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_8"] = &task1Exp3_stealSide_taskOut_8_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_9"] = &task1Exp3_stealSide_taskOut_9_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_10"] = &task1Exp3_stealSide_taskOut_10_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskOut_11"] = &task1Exp3_stealSide_taskOut_11_bridge_.socket;
    sockets_["task1Exp3_stealSide_taskIn_0"] = &task1Exp3_stealSide_taskIn_0_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_1"] = &task1Exp3_stealSide_taskIn_1_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_2"] = &task1Exp3_stealSide_taskIn_2_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_3"] = &task1Exp3_stealSide_taskIn_3_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_4"] = &task1Exp3_stealSide_taskIn_4_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_5"] = &task1Exp3_stealSide_taskIn_5_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_6"] = &task1Exp3_stealSide_taskIn_6_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_7"] = &task1Exp3_stealSide_taskIn_7_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_8"] = &task1Exp3_stealSide_taskIn_8_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_9"] = &task1Exp3_stealSide_taskIn_9_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_10"] = &task1Exp3_stealSide_taskIn_10_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_taskIn_11"] = &task1Exp3_stealSide_taskIn_11_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskOut_0"] = &task2Exp3_stealSide_taskOut_0_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_1"] = &task2Exp3_stealSide_taskOut_1_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_2"] = &task2Exp3_stealSide_taskOut_2_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_3"] = &task2Exp3_stealSide_taskOut_3_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_4"] = &task2Exp3_stealSide_taskOut_4_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_5"] = &task2Exp3_stealSide_taskOut_5_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_6"] = &task2Exp3_stealSide_taskOut_6_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_7"] = &task2Exp3_stealSide_taskOut_7_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_8"] = &task2Exp3_stealSide_taskOut_8_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_9"] = &task2Exp3_stealSide_taskOut_9_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_10"] = &task2Exp3_stealSide_taskOut_10_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskOut_11"] = &task2Exp3_stealSide_taskOut_11_bridge_.socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_0"] = &task2Exp3_stealSide_taskInGlobal_0_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_1"] = &task2Exp3_stealSide_taskInGlobal_1_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_2"] = &task2Exp3_stealSide_taskInGlobal_2_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_3"] = &task2Exp3_stealSide_taskInGlobal_3_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_4"] = &task2Exp3_stealSide_taskInGlobal_4_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_5"] = &task2Exp3_stealSide_taskInGlobal_5_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_6"] = &task2Exp3_stealSide_taskInGlobal_6_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_7"] = &task2Exp3_stealSide_taskInGlobal_7_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_8"] = &task2Exp3_stealSide_taskInGlobal_8_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_9"] = &task2Exp3_stealSide_taskInGlobal_9_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_10"] = &task2Exp3_stealSide_taskInGlobal_10_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_taskInGlobal_11"] = &task2Exp3_stealSide_taskInGlobal_11_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_axi_mgmt_vss_0"] = &task1Exp3_stealSide_axi_mgmt_vss_0_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_vss_axi_full_0"] = &task1Exp3_stealSide_vss_axi_full_0_bridge_.socket;
    sockets_["task1Exp3_stealSide_axi_mgmt_vss_1"] = &task1Exp3_stealSide_axi_mgmt_vss_1_bridge_.tgt_socket;
    sockets_["task1Exp3_stealSide_vss_axi_full_1"] = &task1Exp3_stealSide_vss_axi_full_1_bridge_.socket;
    sockets_["task2Exp3_stealSide_axi_mgmt_vss_0"] = &task2Exp3_stealSide_axi_mgmt_vss_0_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_vss_axi_full_0"] = &task2Exp3_stealSide_vss_axi_full_0_bridge_.socket;
    sockets_["task2Exp3_stealSide_axi_mgmt_vss_1"] = &task2Exp3_stealSide_axi_mgmt_vss_1_bridge_.tgt_socket;
    sockets_["task2Exp3_stealSide_vss_axi_full_1"] = &task2Exp3_stealSide_vss_axi_full_1_bridge_.socket;

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
    task1Exp3_stealSide_taskOut_0_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_0_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_1_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_1_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_2_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_2_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_3_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_3_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_4_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_4_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_5_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_5_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_6_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_6_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_7_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_7_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_8_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_8_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_9_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_9_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_10_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_10_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskOut_11_bridge_.clk(clock);
    task1Exp3_stealSide_taskOut_11_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_0_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_0_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_1_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_1_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_2_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_2_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_3_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_3_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_4_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_4_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_5_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_5_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_6_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_6_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_7_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_7_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_8_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_8_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_9_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_9_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_10_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_10_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_taskIn_11_bridge_.clk(clock);
    task1Exp3_stealSide_taskIn_11_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_0_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_0_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_1_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_1_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_2_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_2_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_3_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_3_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_4_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_4_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_5_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_5_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_6_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_6_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_7_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_7_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_8_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_8_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_9_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_9_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_10_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_10_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskOut_11_bridge_.clk(clock);
    task2Exp3_stealSide_taskOut_11_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_0_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_0_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_1_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_1_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_2_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_2_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_3_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_3_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_4_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_4_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_5_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_5_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_6_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_6_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_7_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_7_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_8_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_8_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_9_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_9_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_10_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_10_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_taskInGlobal_11_bridge_.clk(clock);
    task2Exp3_stealSide_taskInGlobal_11_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_axi_mgmt_vss_0_bridge_.clk(clock);
    task1Exp3_stealSide_axi_mgmt_vss_0_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_vss_axi_full_0_bridge_.clk(clock);
    task1Exp3_stealSide_vss_axi_full_0_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_axi_mgmt_vss_1_bridge_.clk(clock);
    task1Exp3_stealSide_axi_mgmt_vss_1_bridge_.resetn(reset_n_);
    
    task1Exp3_stealSide_vss_axi_full_1_bridge_.clk(clock);
    task1Exp3_stealSide_vss_axi_full_1_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_axi_mgmt_vss_0_bridge_.clk(clock);
    task2Exp3_stealSide_axi_mgmt_vss_0_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_vss_axi_full_0_bridge_.clk(clock);
    task2Exp3_stealSide_vss_axi_full_0_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_axi_mgmt_vss_1_bridge_.clk(clock);
    task2Exp3_stealSide_axi_mgmt_vss_1_bridge_.resetn(reset_n_);
    
    task2Exp3_stealSide_vss_axi_full_1_bridge_.clk(clock);
    task2Exp3_stealSide_vss_axi_full_1_bridge_.resetn(reset_n_);
    


    /* connect bridges */
    task1Exp3_stealSide_taskOut_0_signals_.connect(task1Exp3_stealSide_taskOut_0_bridge_);
    task1Exp3_stealSide_taskOut_1_signals_.connect(task1Exp3_stealSide_taskOut_1_bridge_);
    task1Exp3_stealSide_taskOut_2_signals_.connect(task1Exp3_stealSide_taskOut_2_bridge_);
    task1Exp3_stealSide_taskOut_3_signals_.connect(task1Exp3_stealSide_taskOut_3_bridge_);
    task1Exp3_stealSide_taskOut_4_signals_.connect(task1Exp3_stealSide_taskOut_4_bridge_);
    task1Exp3_stealSide_taskOut_5_signals_.connect(task1Exp3_stealSide_taskOut_5_bridge_);
    task1Exp3_stealSide_taskOut_6_signals_.connect(task1Exp3_stealSide_taskOut_6_bridge_);
    task1Exp3_stealSide_taskOut_7_signals_.connect(task1Exp3_stealSide_taskOut_7_bridge_);
    task1Exp3_stealSide_taskOut_8_signals_.connect(task1Exp3_stealSide_taskOut_8_bridge_);
    task1Exp3_stealSide_taskOut_9_signals_.connect(task1Exp3_stealSide_taskOut_9_bridge_);
    task1Exp3_stealSide_taskOut_10_signals_.connect(task1Exp3_stealSide_taskOut_10_bridge_);
    task1Exp3_stealSide_taskOut_11_signals_.connect(task1Exp3_stealSide_taskOut_11_bridge_);
    task1Exp3_stealSide_taskIn_0_signals_.connect(task1Exp3_stealSide_taskIn_0_bridge_);
    task1Exp3_stealSide_taskIn_1_signals_.connect(task1Exp3_stealSide_taskIn_1_bridge_);
    task1Exp3_stealSide_taskIn_2_signals_.connect(task1Exp3_stealSide_taskIn_2_bridge_);
    task1Exp3_stealSide_taskIn_3_signals_.connect(task1Exp3_stealSide_taskIn_3_bridge_);
    task1Exp3_stealSide_taskIn_4_signals_.connect(task1Exp3_stealSide_taskIn_4_bridge_);
    task1Exp3_stealSide_taskIn_5_signals_.connect(task1Exp3_stealSide_taskIn_5_bridge_);
    task1Exp3_stealSide_taskIn_6_signals_.connect(task1Exp3_stealSide_taskIn_6_bridge_);
    task1Exp3_stealSide_taskIn_7_signals_.connect(task1Exp3_stealSide_taskIn_7_bridge_);
    task1Exp3_stealSide_taskIn_8_signals_.connect(task1Exp3_stealSide_taskIn_8_bridge_);
    task1Exp3_stealSide_taskIn_9_signals_.connect(task1Exp3_stealSide_taskIn_9_bridge_);
    task1Exp3_stealSide_taskIn_10_signals_.connect(task1Exp3_stealSide_taskIn_10_bridge_);
    task1Exp3_stealSide_taskIn_11_signals_.connect(task1Exp3_stealSide_taskIn_11_bridge_);
    task2Exp3_stealSide_taskOut_0_signals_.connect(task2Exp3_stealSide_taskOut_0_bridge_);
    task2Exp3_stealSide_taskOut_1_signals_.connect(task2Exp3_stealSide_taskOut_1_bridge_);
    task2Exp3_stealSide_taskOut_2_signals_.connect(task2Exp3_stealSide_taskOut_2_bridge_);
    task2Exp3_stealSide_taskOut_3_signals_.connect(task2Exp3_stealSide_taskOut_3_bridge_);
    task2Exp3_stealSide_taskOut_4_signals_.connect(task2Exp3_stealSide_taskOut_4_bridge_);
    task2Exp3_stealSide_taskOut_5_signals_.connect(task2Exp3_stealSide_taskOut_5_bridge_);
    task2Exp3_stealSide_taskOut_6_signals_.connect(task2Exp3_stealSide_taskOut_6_bridge_);
    task2Exp3_stealSide_taskOut_7_signals_.connect(task2Exp3_stealSide_taskOut_7_bridge_);
    task2Exp3_stealSide_taskOut_8_signals_.connect(task2Exp3_stealSide_taskOut_8_bridge_);
    task2Exp3_stealSide_taskOut_9_signals_.connect(task2Exp3_stealSide_taskOut_9_bridge_);
    task2Exp3_stealSide_taskOut_10_signals_.connect(task2Exp3_stealSide_taskOut_10_bridge_);
    task2Exp3_stealSide_taskOut_11_signals_.connect(task2Exp3_stealSide_taskOut_11_bridge_);
    task2Exp3_stealSide_taskInGlobal_0_signals_.connect(task2Exp3_stealSide_taskInGlobal_0_bridge_);
    task2Exp3_stealSide_taskInGlobal_1_signals_.connect(task2Exp3_stealSide_taskInGlobal_1_bridge_);
    task2Exp3_stealSide_taskInGlobal_2_signals_.connect(task2Exp3_stealSide_taskInGlobal_2_bridge_);
    task2Exp3_stealSide_taskInGlobal_3_signals_.connect(task2Exp3_stealSide_taskInGlobal_3_bridge_);
    task2Exp3_stealSide_taskInGlobal_4_signals_.connect(task2Exp3_stealSide_taskInGlobal_4_bridge_);
    task2Exp3_stealSide_taskInGlobal_5_signals_.connect(task2Exp3_stealSide_taskInGlobal_5_bridge_);
    task2Exp3_stealSide_taskInGlobal_6_signals_.connect(task2Exp3_stealSide_taskInGlobal_6_bridge_);
    task2Exp3_stealSide_taskInGlobal_7_signals_.connect(task2Exp3_stealSide_taskInGlobal_7_bridge_);
    task2Exp3_stealSide_taskInGlobal_8_signals_.connect(task2Exp3_stealSide_taskInGlobal_8_bridge_);
    task2Exp3_stealSide_taskInGlobal_9_signals_.connect(task2Exp3_stealSide_taskInGlobal_9_bridge_);
    task2Exp3_stealSide_taskInGlobal_10_signals_.connect(task2Exp3_stealSide_taskInGlobal_10_bridge_);
    task2Exp3_stealSide_taskInGlobal_11_signals_.connect(task2Exp3_stealSide_taskInGlobal_11_bridge_);
    task1Exp3_stealSide_axi_mgmt_vss_0_signals_.connect(task1Exp3_stealSide_axi_mgmt_vss_0_bridge_);
    task1Exp3_stealSide_vss_axi_full_0_signals_.connect(task1Exp3_stealSide_vss_axi_full_0_bridge_);
    task1Exp3_stealSide_axi_mgmt_vss_1_signals_.connect(task1Exp3_stealSide_axi_mgmt_vss_1_bridge_);
    task1Exp3_stealSide_vss_axi_full_1_signals_.connect(task1Exp3_stealSide_vss_axi_full_1_bridge_);
    task2Exp3_stealSide_axi_mgmt_vss_0_signals_.connect(task2Exp3_stealSide_axi_mgmt_vss_0_bridge_);
    task2Exp3_stealSide_vss_axi_full_0_signals_.connect(task2Exp3_stealSide_vss_axi_full_0_bridge_);
    task2Exp3_stealSide_axi_mgmt_vss_1_signals_.connect(task2Exp3_stealSide_axi_mgmt_vss_1_bridge_);
    task2Exp3_stealSide_vss_axi_full_1_signals_.connect(task2Exp3_stealSide_vss_axi_full_1_bridge_);


    /* connect signals */
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_0 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_0_TREADY(task1Exp3_stealSide_taskOut_0_signals_.tready);
    task1Exp3_stealSide_taskOut_0_TVALID(task1Exp3_stealSide_taskOut_0_signals_.tvalid);
    task1Exp3_stealSide_taskOut_0_TDATA(task1Exp3_stealSide_taskOut_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_1 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_1_TREADY(task1Exp3_stealSide_taskOut_1_signals_.tready);
    task1Exp3_stealSide_taskOut_1_TVALID(task1Exp3_stealSide_taskOut_1_signals_.tvalid);
    task1Exp3_stealSide_taskOut_1_TDATA(task1Exp3_stealSide_taskOut_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_2 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_2_TREADY(task1Exp3_stealSide_taskOut_2_signals_.tready);
    task1Exp3_stealSide_taskOut_2_TVALID(task1Exp3_stealSide_taskOut_2_signals_.tvalid);
    task1Exp3_stealSide_taskOut_2_TDATA(task1Exp3_stealSide_taskOut_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_3 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_3_TREADY(task1Exp3_stealSide_taskOut_3_signals_.tready);
    task1Exp3_stealSide_taskOut_3_TVALID(task1Exp3_stealSide_taskOut_3_signals_.tvalid);
    task1Exp3_stealSide_taskOut_3_TDATA(task1Exp3_stealSide_taskOut_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_4 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_4_TREADY(task1Exp3_stealSide_taskOut_4_signals_.tready);
    task1Exp3_stealSide_taskOut_4_TVALID(task1Exp3_stealSide_taskOut_4_signals_.tvalid);
    task1Exp3_stealSide_taskOut_4_TDATA(task1Exp3_stealSide_taskOut_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_5 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_5_TREADY(task1Exp3_stealSide_taskOut_5_signals_.tready);
    task1Exp3_stealSide_taskOut_5_TVALID(task1Exp3_stealSide_taskOut_5_signals_.tvalid);
    task1Exp3_stealSide_taskOut_5_TDATA(task1Exp3_stealSide_taskOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_6 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_6_TREADY(task1Exp3_stealSide_taskOut_6_signals_.tready);
    task1Exp3_stealSide_taskOut_6_TVALID(task1Exp3_stealSide_taskOut_6_signals_.tvalid);
    task1Exp3_stealSide_taskOut_6_TDATA(task1Exp3_stealSide_taskOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_7 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_7_TREADY(task1Exp3_stealSide_taskOut_7_signals_.tready);
    task1Exp3_stealSide_taskOut_7_TVALID(task1Exp3_stealSide_taskOut_7_signals_.tvalid);
    task1Exp3_stealSide_taskOut_7_TDATA(task1Exp3_stealSide_taskOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_8 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_8_TREADY(task1Exp3_stealSide_taskOut_8_signals_.tready);
    task1Exp3_stealSide_taskOut_8_TVALID(task1Exp3_stealSide_taskOut_8_signals_.tvalid);
    task1Exp3_stealSide_taskOut_8_TDATA(task1Exp3_stealSide_taskOut_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_9 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_9_TREADY(task1Exp3_stealSide_taskOut_9_signals_.tready);
    task1Exp3_stealSide_taskOut_9_TVALID(task1Exp3_stealSide_taskOut_9_signals_.tvalid);
    task1Exp3_stealSide_taskOut_9_TDATA(task1Exp3_stealSide_taskOut_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_10 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_10_TREADY(task1Exp3_stealSide_taskOut_10_signals_.tready);
    task1Exp3_stealSide_taskOut_10_TVALID(task1Exp3_stealSide_taskOut_10_signals_.tvalid);
    task1Exp3_stealSide_taskOut_10_TDATA(task1Exp3_stealSide_taskOut_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskOut_11 */
    /* is_slave = False */
    task1Exp3_stealSide_taskOut_11_TREADY(task1Exp3_stealSide_taskOut_11_signals_.tready);
    task1Exp3_stealSide_taskOut_11_TVALID(task1Exp3_stealSide_taskOut_11_signals_.tvalid);
    task1Exp3_stealSide_taskOut_11_TDATA(task1Exp3_stealSide_taskOut_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_0 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_0_TREADY(task1Exp3_stealSide_taskIn_0_signals_.tready);
    task1Exp3_stealSide_taskIn_0_TVALID(task1Exp3_stealSide_taskIn_0_signals_.tvalid);
    task1Exp3_stealSide_taskIn_0_TDATA(task1Exp3_stealSide_taskIn_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_1 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_1_TREADY(task1Exp3_stealSide_taskIn_1_signals_.tready);
    task1Exp3_stealSide_taskIn_1_TVALID(task1Exp3_stealSide_taskIn_1_signals_.tvalid);
    task1Exp3_stealSide_taskIn_1_TDATA(task1Exp3_stealSide_taskIn_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_2 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_2_TREADY(task1Exp3_stealSide_taskIn_2_signals_.tready);
    task1Exp3_stealSide_taskIn_2_TVALID(task1Exp3_stealSide_taskIn_2_signals_.tvalid);
    task1Exp3_stealSide_taskIn_2_TDATA(task1Exp3_stealSide_taskIn_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_3 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_3_TREADY(task1Exp3_stealSide_taskIn_3_signals_.tready);
    task1Exp3_stealSide_taskIn_3_TVALID(task1Exp3_stealSide_taskIn_3_signals_.tvalid);
    task1Exp3_stealSide_taskIn_3_TDATA(task1Exp3_stealSide_taskIn_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_4 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_4_TREADY(task1Exp3_stealSide_taskIn_4_signals_.tready);
    task1Exp3_stealSide_taskIn_4_TVALID(task1Exp3_stealSide_taskIn_4_signals_.tvalid);
    task1Exp3_stealSide_taskIn_4_TDATA(task1Exp3_stealSide_taskIn_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_5 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_5_TREADY(task1Exp3_stealSide_taskIn_5_signals_.tready);
    task1Exp3_stealSide_taskIn_5_TVALID(task1Exp3_stealSide_taskIn_5_signals_.tvalid);
    task1Exp3_stealSide_taskIn_5_TDATA(task1Exp3_stealSide_taskIn_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_6 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_6_TREADY(task1Exp3_stealSide_taskIn_6_signals_.tready);
    task1Exp3_stealSide_taskIn_6_TVALID(task1Exp3_stealSide_taskIn_6_signals_.tvalid);
    task1Exp3_stealSide_taskIn_6_TDATA(task1Exp3_stealSide_taskIn_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_7 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_7_TREADY(task1Exp3_stealSide_taskIn_7_signals_.tready);
    task1Exp3_stealSide_taskIn_7_TVALID(task1Exp3_stealSide_taskIn_7_signals_.tvalid);
    task1Exp3_stealSide_taskIn_7_TDATA(task1Exp3_stealSide_taskIn_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_8 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_8_TREADY(task1Exp3_stealSide_taskIn_8_signals_.tready);
    task1Exp3_stealSide_taskIn_8_TVALID(task1Exp3_stealSide_taskIn_8_signals_.tvalid);
    task1Exp3_stealSide_taskIn_8_TDATA(task1Exp3_stealSide_taskIn_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_9 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_9_TREADY(task1Exp3_stealSide_taskIn_9_signals_.tready);
    task1Exp3_stealSide_taskIn_9_TVALID(task1Exp3_stealSide_taskIn_9_signals_.tvalid);
    task1Exp3_stealSide_taskIn_9_TDATA(task1Exp3_stealSide_taskIn_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_10 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_10_TREADY(task1Exp3_stealSide_taskIn_10_signals_.tready);
    task1Exp3_stealSide_taskIn_10_TVALID(task1Exp3_stealSide_taskIn_10_signals_.tvalid);
    task1Exp3_stealSide_taskIn_10_TDATA(task1Exp3_stealSide_taskIn_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task1Exp3_stealSide_taskIn_11 */
    /* is_slave = True */
    task1Exp3_stealSide_taskIn_11_TREADY(task1Exp3_stealSide_taskIn_11_signals_.tready);
    task1Exp3_stealSide_taskIn_11_TVALID(task1Exp3_stealSide_taskIn_11_signals_.tvalid);
    task1Exp3_stealSide_taskIn_11_TDATA(task1Exp3_stealSide_taskIn_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_0 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_0_TREADY(task2Exp3_stealSide_taskOut_0_signals_.tready);
    task2Exp3_stealSide_taskOut_0_TVALID(task2Exp3_stealSide_taskOut_0_signals_.tvalid);
    task2Exp3_stealSide_taskOut_0_TDATA(task2Exp3_stealSide_taskOut_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_1 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_1_TREADY(task2Exp3_stealSide_taskOut_1_signals_.tready);
    task2Exp3_stealSide_taskOut_1_TVALID(task2Exp3_stealSide_taskOut_1_signals_.tvalid);
    task2Exp3_stealSide_taskOut_1_TDATA(task2Exp3_stealSide_taskOut_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_2 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_2_TREADY(task2Exp3_stealSide_taskOut_2_signals_.tready);
    task2Exp3_stealSide_taskOut_2_TVALID(task2Exp3_stealSide_taskOut_2_signals_.tvalid);
    task2Exp3_stealSide_taskOut_2_TDATA(task2Exp3_stealSide_taskOut_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_3 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_3_TREADY(task2Exp3_stealSide_taskOut_3_signals_.tready);
    task2Exp3_stealSide_taskOut_3_TVALID(task2Exp3_stealSide_taskOut_3_signals_.tvalid);
    task2Exp3_stealSide_taskOut_3_TDATA(task2Exp3_stealSide_taskOut_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_4 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_4_TREADY(task2Exp3_stealSide_taskOut_4_signals_.tready);
    task2Exp3_stealSide_taskOut_4_TVALID(task2Exp3_stealSide_taskOut_4_signals_.tvalid);
    task2Exp3_stealSide_taskOut_4_TDATA(task2Exp3_stealSide_taskOut_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_5 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_5_TREADY(task2Exp3_stealSide_taskOut_5_signals_.tready);
    task2Exp3_stealSide_taskOut_5_TVALID(task2Exp3_stealSide_taskOut_5_signals_.tvalid);
    task2Exp3_stealSide_taskOut_5_TDATA(task2Exp3_stealSide_taskOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_6 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_6_TREADY(task2Exp3_stealSide_taskOut_6_signals_.tready);
    task2Exp3_stealSide_taskOut_6_TVALID(task2Exp3_stealSide_taskOut_6_signals_.tvalid);
    task2Exp3_stealSide_taskOut_6_TDATA(task2Exp3_stealSide_taskOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_7 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_7_TREADY(task2Exp3_stealSide_taskOut_7_signals_.tready);
    task2Exp3_stealSide_taskOut_7_TVALID(task2Exp3_stealSide_taskOut_7_signals_.tvalid);
    task2Exp3_stealSide_taskOut_7_TDATA(task2Exp3_stealSide_taskOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_8 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_8_TREADY(task2Exp3_stealSide_taskOut_8_signals_.tready);
    task2Exp3_stealSide_taskOut_8_TVALID(task2Exp3_stealSide_taskOut_8_signals_.tvalid);
    task2Exp3_stealSide_taskOut_8_TDATA(task2Exp3_stealSide_taskOut_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_9 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_9_TREADY(task2Exp3_stealSide_taskOut_9_signals_.tready);
    task2Exp3_stealSide_taskOut_9_TVALID(task2Exp3_stealSide_taskOut_9_signals_.tvalid);
    task2Exp3_stealSide_taskOut_9_TDATA(task2Exp3_stealSide_taskOut_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_10 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_10_TREADY(task2Exp3_stealSide_taskOut_10_signals_.tready);
    task2Exp3_stealSide_taskOut_10_TVALID(task2Exp3_stealSide_taskOut_10_signals_.tvalid);
    task2Exp3_stealSide_taskOut_10_TDATA(task2Exp3_stealSide_taskOut_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskOut_11 */
    /* is_slave = False */
    task2Exp3_stealSide_taskOut_11_TREADY(task2Exp3_stealSide_taskOut_11_signals_.tready);
    task2Exp3_stealSide_taskOut_11_TVALID(task2Exp3_stealSide_taskOut_11_signals_.tvalid);
    task2Exp3_stealSide_taskOut_11_TDATA(task2Exp3_stealSide_taskOut_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_0 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_0_TREADY(task2Exp3_stealSide_taskInGlobal_0_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_0_TVALID(task2Exp3_stealSide_taskInGlobal_0_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_0_TDATA(task2Exp3_stealSide_taskInGlobal_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_1 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_1_TREADY(task2Exp3_stealSide_taskInGlobal_1_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_1_TVALID(task2Exp3_stealSide_taskInGlobal_1_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_1_TDATA(task2Exp3_stealSide_taskInGlobal_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_2 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_2_TREADY(task2Exp3_stealSide_taskInGlobal_2_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_2_TVALID(task2Exp3_stealSide_taskInGlobal_2_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_2_TDATA(task2Exp3_stealSide_taskInGlobal_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_3 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_3_TREADY(task2Exp3_stealSide_taskInGlobal_3_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_3_TVALID(task2Exp3_stealSide_taskInGlobal_3_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_3_TDATA(task2Exp3_stealSide_taskInGlobal_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_4 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_4_TREADY(task2Exp3_stealSide_taskInGlobal_4_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_4_TVALID(task2Exp3_stealSide_taskInGlobal_4_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_4_TDATA(task2Exp3_stealSide_taskInGlobal_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_5 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_5_TREADY(task2Exp3_stealSide_taskInGlobal_5_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_5_TVALID(task2Exp3_stealSide_taskInGlobal_5_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_5_TDATA(task2Exp3_stealSide_taskInGlobal_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_6 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_6_TREADY(task2Exp3_stealSide_taskInGlobal_6_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_6_TVALID(task2Exp3_stealSide_taskInGlobal_6_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_6_TDATA(task2Exp3_stealSide_taskInGlobal_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_7 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_7_TREADY(task2Exp3_stealSide_taskInGlobal_7_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_7_TVALID(task2Exp3_stealSide_taskInGlobal_7_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_7_TDATA(task2Exp3_stealSide_taskInGlobal_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_8 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_8_TREADY(task2Exp3_stealSide_taskInGlobal_8_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_8_TVALID(task2Exp3_stealSide_taskInGlobal_8_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_8_TDATA(task2Exp3_stealSide_taskInGlobal_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_9 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_9_TREADY(task2Exp3_stealSide_taskInGlobal_9_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_9_TVALID(task2Exp3_stealSide_taskInGlobal_9_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_9_TDATA(task2Exp3_stealSide_taskInGlobal_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_10 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_10_TREADY(task2Exp3_stealSide_taskInGlobal_10_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_10_TVALID(task2Exp3_stealSide_taskInGlobal_10_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_10_TDATA(task2Exp3_stealSide_taskInGlobal_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task2Exp3_stealSide_taskInGlobal_11 */
    /* is_slave = True */
    task2Exp3_stealSide_taskInGlobal_11_TREADY(task2Exp3_stealSide_taskInGlobal_11_signals_.tready);
    task2Exp3_stealSide_taskInGlobal_11_TVALID(task2Exp3_stealSide_taskInGlobal_11_signals_.tvalid);
    task2Exp3_stealSide_taskInGlobal_11_TDATA(task2Exp3_stealSide_taskInGlobal_11_signals_.tdata);
    
    
    /* connecting AXI4-Lite interface with name: task1Exp3_stealSide_axi_mgmt_vss_0 */
    /* is_slave = True */
    task1Exp3_stealSide_axi_mgmt_vss_0_AWVALID(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.awvalid);
    task1Exp3_stealSide_axi_mgmt_vss_0_AWREADY(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.awready);
    task1Exp3_stealSide_axi_mgmt_vss_0_AWADDR(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.awaddr);
    task1Exp3_stealSide_axi_mgmt_vss_0_AWPROT(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.awprot);
    task1Exp3_stealSide_axi_mgmt_vss_0_WVALID(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.wvalid);
    task1Exp3_stealSide_axi_mgmt_vss_0_WREADY(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.wready);
    task1Exp3_stealSide_axi_mgmt_vss_0_WDATA(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.wdata);
    task1Exp3_stealSide_axi_mgmt_vss_0_WSTRB(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.wstrb);
    task1Exp3_stealSide_axi_mgmt_vss_0_BVALID(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.bvalid);
    task1Exp3_stealSide_axi_mgmt_vss_0_BREADY(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.bready);
    task1Exp3_stealSide_axi_mgmt_vss_0_BRESP(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.bresp);
    task1Exp3_stealSide_axi_mgmt_vss_0_ARVALID(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.arvalid);
    task1Exp3_stealSide_axi_mgmt_vss_0_ARREADY(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.arready);
    task1Exp3_stealSide_axi_mgmt_vss_0_ARADDR(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.araddr);
    task1Exp3_stealSide_axi_mgmt_vss_0_ARPROT(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.arprot);
    task1Exp3_stealSide_axi_mgmt_vss_0_RVALID(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.rvalid);
    task1Exp3_stealSide_axi_mgmt_vss_0_RREADY(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.rready);
    task1Exp3_stealSide_axi_mgmt_vss_0_RDATA(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.rdata);
    task1Exp3_stealSide_axi_mgmt_vss_0_RRESP(task1Exp3_stealSide_axi_mgmt_vss_0_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task1Exp3_stealSide_vss_axi_full_0 */
    /* is_slave = False */
    task1Exp3_stealSide_vss_axi_full_0_AWVALID(task1Exp3_stealSide_vss_axi_full_0_signals_.awvalid);
    task1Exp3_stealSide_vss_axi_full_0_AWREADY(task1Exp3_stealSide_vss_axi_full_0_signals_.awready);
    task1Exp3_stealSide_vss_axi_full_0_AWADDR(task1Exp3_stealSide_vss_axi_full_0_signals_.awaddr);
    task1Exp3_stealSide_vss_axi_full_0_AWPROT(task1Exp3_stealSide_vss_axi_full_0_signals_.awprot);
    task1Exp3_stealSide_vss_axi_full_0_AWREGION(task1Exp3_stealSide_vss_axi_full_0_signals_.awregion);
    task1Exp3_stealSide_vss_axi_full_0_AWQOS(task1Exp3_stealSide_vss_axi_full_0_signals_.awqos);
    task1Exp3_stealSide_vss_axi_full_0_AWCACHE(task1Exp3_stealSide_vss_axi_full_0_signals_.awcache);
    task1Exp3_stealSide_vss_axi_full_0_AWBURST(task1Exp3_stealSide_vss_axi_full_0_signals_.awburst);
    task1Exp3_stealSide_vss_axi_full_0_AWSIZE(task1Exp3_stealSide_vss_axi_full_0_signals_.awsize);
    task1Exp3_stealSide_vss_axi_full_0_AWLEN(task1Exp3_stealSide_vss_axi_full_0_signals_.awlen);
    task1Exp3_stealSide_vss_axi_full_0_AWID(task1Exp3_stealSide_vss_axi_full_0_signals_.awid);
    task1Exp3_stealSide_vss_axi_full_0_AWLOCK(task1Exp3_stealSide_vss_axi_full_0_signals_.awlock);
    task1Exp3_stealSide_vss_axi_full_0_WID(task1Exp3_stealSide_vss_axi_full_0_signals_.wid);
    task1Exp3_stealSide_vss_axi_full_0_WVALID(task1Exp3_stealSide_vss_axi_full_0_signals_.wvalid);
    task1Exp3_stealSide_vss_axi_full_0_WREADY(task1Exp3_stealSide_vss_axi_full_0_signals_.wready);
    task1Exp3_stealSide_vss_axi_full_0_WDATA(task1Exp3_stealSide_vss_axi_full_0_signals_.wdata);
    task1Exp3_stealSide_vss_axi_full_0_WSTRB(task1Exp3_stealSide_vss_axi_full_0_signals_.wstrb);
    task1Exp3_stealSide_vss_axi_full_0_WLAST(task1Exp3_stealSide_vss_axi_full_0_signals_.wlast);
    task1Exp3_stealSide_vss_axi_full_0_BVALID(task1Exp3_stealSide_vss_axi_full_0_signals_.bvalid);
    task1Exp3_stealSide_vss_axi_full_0_BREADY(task1Exp3_stealSide_vss_axi_full_0_signals_.bready);
    task1Exp3_stealSide_vss_axi_full_0_BRESP(task1Exp3_stealSide_vss_axi_full_0_signals_.bresp);
    task1Exp3_stealSide_vss_axi_full_0_BID(task1Exp3_stealSide_vss_axi_full_0_signals_.bid);
    task1Exp3_stealSide_vss_axi_full_0_ARVALID(task1Exp3_stealSide_vss_axi_full_0_signals_.arvalid);
    task1Exp3_stealSide_vss_axi_full_0_ARREADY(task1Exp3_stealSide_vss_axi_full_0_signals_.arready);
    task1Exp3_stealSide_vss_axi_full_0_ARADDR(task1Exp3_stealSide_vss_axi_full_0_signals_.araddr);
    task1Exp3_stealSide_vss_axi_full_0_ARPROT(task1Exp3_stealSide_vss_axi_full_0_signals_.arprot);
    task1Exp3_stealSide_vss_axi_full_0_ARREGION(task1Exp3_stealSide_vss_axi_full_0_signals_.arregion);
    task1Exp3_stealSide_vss_axi_full_0_ARQOS(task1Exp3_stealSide_vss_axi_full_0_signals_.arqos);
    task1Exp3_stealSide_vss_axi_full_0_ARCACHE(task1Exp3_stealSide_vss_axi_full_0_signals_.arcache);
    task1Exp3_stealSide_vss_axi_full_0_ARBURST(task1Exp3_stealSide_vss_axi_full_0_signals_.arburst);
    task1Exp3_stealSide_vss_axi_full_0_ARSIZE(task1Exp3_stealSide_vss_axi_full_0_signals_.arsize);
    task1Exp3_stealSide_vss_axi_full_0_ARLEN(task1Exp3_stealSide_vss_axi_full_0_signals_.arlen);
    task1Exp3_stealSide_vss_axi_full_0_ARID(task1Exp3_stealSide_vss_axi_full_0_signals_.arid);
    task1Exp3_stealSide_vss_axi_full_0_ARLOCK(task1Exp3_stealSide_vss_axi_full_0_signals_.arlock);
    task1Exp3_stealSide_vss_axi_full_0_RVALID(task1Exp3_stealSide_vss_axi_full_0_signals_.rvalid);
    task1Exp3_stealSide_vss_axi_full_0_RREADY(task1Exp3_stealSide_vss_axi_full_0_signals_.rready);
    task1Exp3_stealSide_vss_axi_full_0_RDATA(task1Exp3_stealSide_vss_axi_full_0_signals_.rdata);
    task1Exp3_stealSide_vss_axi_full_0_RRESP(task1Exp3_stealSide_vss_axi_full_0_signals_.rresp);
    task1Exp3_stealSide_vss_axi_full_0_RID(task1Exp3_stealSide_vss_axi_full_0_signals_.rid);
    task1Exp3_stealSide_vss_axi_full_0_RLAST(task1Exp3_stealSide_vss_axi_full_0_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task1Exp3_stealSide_axi_mgmt_vss_1 */
    /* is_slave = True */
    task1Exp3_stealSide_axi_mgmt_vss_1_AWVALID(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.awvalid);
    task1Exp3_stealSide_axi_mgmt_vss_1_AWREADY(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.awready);
    task1Exp3_stealSide_axi_mgmt_vss_1_AWADDR(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.awaddr);
    task1Exp3_stealSide_axi_mgmt_vss_1_AWPROT(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.awprot);
    task1Exp3_stealSide_axi_mgmt_vss_1_WVALID(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.wvalid);
    task1Exp3_stealSide_axi_mgmt_vss_1_WREADY(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.wready);
    task1Exp3_stealSide_axi_mgmt_vss_1_WDATA(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.wdata);
    task1Exp3_stealSide_axi_mgmt_vss_1_WSTRB(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.wstrb);
    task1Exp3_stealSide_axi_mgmt_vss_1_BVALID(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.bvalid);
    task1Exp3_stealSide_axi_mgmt_vss_1_BREADY(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.bready);
    task1Exp3_stealSide_axi_mgmt_vss_1_BRESP(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.bresp);
    task1Exp3_stealSide_axi_mgmt_vss_1_ARVALID(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.arvalid);
    task1Exp3_stealSide_axi_mgmt_vss_1_ARREADY(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.arready);
    task1Exp3_stealSide_axi_mgmt_vss_1_ARADDR(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.araddr);
    task1Exp3_stealSide_axi_mgmt_vss_1_ARPROT(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.arprot);
    task1Exp3_stealSide_axi_mgmt_vss_1_RVALID(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.rvalid);
    task1Exp3_stealSide_axi_mgmt_vss_1_RREADY(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.rready);
    task1Exp3_stealSide_axi_mgmt_vss_1_RDATA(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.rdata);
    task1Exp3_stealSide_axi_mgmt_vss_1_RRESP(task1Exp3_stealSide_axi_mgmt_vss_1_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task1Exp3_stealSide_vss_axi_full_1 */
    /* is_slave = False */
    task1Exp3_stealSide_vss_axi_full_1_AWVALID(task1Exp3_stealSide_vss_axi_full_1_signals_.awvalid);
    task1Exp3_stealSide_vss_axi_full_1_AWREADY(task1Exp3_stealSide_vss_axi_full_1_signals_.awready);
    task1Exp3_stealSide_vss_axi_full_1_AWADDR(task1Exp3_stealSide_vss_axi_full_1_signals_.awaddr);
    task1Exp3_stealSide_vss_axi_full_1_AWPROT(task1Exp3_stealSide_vss_axi_full_1_signals_.awprot);
    task1Exp3_stealSide_vss_axi_full_1_AWREGION(task1Exp3_stealSide_vss_axi_full_1_signals_.awregion);
    task1Exp3_stealSide_vss_axi_full_1_AWQOS(task1Exp3_stealSide_vss_axi_full_1_signals_.awqos);
    task1Exp3_stealSide_vss_axi_full_1_AWCACHE(task1Exp3_stealSide_vss_axi_full_1_signals_.awcache);
    task1Exp3_stealSide_vss_axi_full_1_AWBURST(task1Exp3_stealSide_vss_axi_full_1_signals_.awburst);
    task1Exp3_stealSide_vss_axi_full_1_AWSIZE(task1Exp3_stealSide_vss_axi_full_1_signals_.awsize);
    task1Exp3_stealSide_vss_axi_full_1_AWLEN(task1Exp3_stealSide_vss_axi_full_1_signals_.awlen);
    task1Exp3_stealSide_vss_axi_full_1_AWID(task1Exp3_stealSide_vss_axi_full_1_signals_.awid);
    task1Exp3_stealSide_vss_axi_full_1_AWLOCK(task1Exp3_stealSide_vss_axi_full_1_signals_.awlock);
    task1Exp3_stealSide_vss_axi_full_1_WID(task1Exp3_stealSide_vss_axi_full_1_signals_.wid);
    task1Exp3_stealSide_vss_axi_full_1_WVALID(task1Exp3_stealSide_vss_axi_full_1_signals_.wvalid);
    task1Exp3_stealSide_vss_axi_full_1_WREADY(task1Exp3_stealSide_vss_axi_full_1_signals_.wready);
    task1Exp3_stealSide_vss_axi_full_1_WDATA(task1Exp3_stealSide_vss_axi_full_1_signals_.wdata);
    task1Exp3_stealSide_vss_axi_full_1_WSTRB(task1Exp3_stealSide_vss_axi_full_1_signals_.wstrb);
    task1Exp3_stealSide_vss_axi_full_1_WLAST(task1Exp3_stealSide_vss_axi_full_1_signals_.wlast);
    task1Exp3_stealSide_vss_axi_full_1_BVALID(task1Exp3_stealSide_vss_axi_full_1_signals_.bvalid);
    task1Exp3_stealSide_vss_axi_full_1_BREADY(task1Exp3_stealSide_vss_axi_full_1_signals_.bready);
    task1Exp3_stealSide_vss_axi_full_1_BRESP(task1Exp3_stealSide_vss_axi_full_1_signals_.bresp);
    task1Exp3_stealSide_vss_axi_full_1_BID(task1Exp3_stealSide_vss_axi_full_1_signals_.bid);
    task1Exp3_stealSide_vss_axi_full_1_ARVALID(task1Exp3_stealSide_vss_axi_full_1_signals_.arvalid);
    task1Exp3_stealSide_vss_axi_full_1_ARREADY(task1Exp3_stealSide_vss_axi_full_1_signals_.arready);
    task1Exp3_stealSide_vss_axi_full_1_ARADDR(task1Exp3_stealSide_vss_axi_full_1_signals_.araddr);
    task1Exp3_stealSide_vss_axi_full_1_ARPROT(task1Exp3_stealSide_vss_axi_full_1_signals_.arprot);
    task1Exp3_stealSide_vss_axi_full_1_ARREGION(task1Exp3_stealSide_vss_axi_full_1_signals_.arregion);
    task1Exp3_stealSide_vss_axi_full_1_ARQOS(task1Exp3_stealSide_vss_axi_full_1_signals_.arqos);
    task1Exp3_stealSide_vss_axi_full_1_ARCACHE(task1Exp3_stealSide_vss_axi_full_1_signals_.arcache);
    task1Exp3_stealSide_vss_axi_full_1_ARBURST(task1Exp3_stealSide_vss_axi_full_1_signals_.arburst);
    task1Exp3_stealSide_vss_axi_full_1_ARSIZE(task1Exp3_stealSide_vss_axi_full_1_signals_.arsize);
    task1Exp3_stealSide_vss_axi_full_1_ARLEN(task1Exp3_stealSide_vss_axi_full_1_signals_.arlen);
    task1Exp3_stealSide_vss_axi_full_1_ARID(task1Exp3_stealSide_vss_axi_full_1_signals_.arid);
    task1Exp3_stealSide_vss_axi_full_1_ARLOCK(task1Exp3_stealSide_vss_axi_full_1_signals_.arlock);
    task1Exp3_stealSide_vss_axi_full_1_RVALID(task1Exp3_stealSide_vss_axi_full_1_signals_.rvalid);
    task1Exp3_stealSide_vss_axi_full_1_RREADY(task1Exp3_stealSide_vss_axi_full_1_signals_.rready);
    task1Exp3_stealSide_vss_axi_full_1_RDATA(task1Exp3_stealSide_vss_axi_full_1_signals_.rdata);
    task1Exp3_stealSide_vss_axi_full_1_RRESP(task1Exp3_stealSide_vss_axi_full_1_signals_.rresp);
    task1Exp3_stealSide_vss_axi_full_1_RID(task1Exp3_stealSide_vss_axi_full_1_signals_.rid);
    task1Exp3_stealSide_vss_axi_full_1_RLAST(task1Exp3_stealSide_vss_axi_full_1_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task2Exp3_stealSide_axi_mgmt_vss_0 */
    /* is_slave = True */
    task2Exp3_stealSide_axi_mgmt_vss_0_AWVALID(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.awvalid);
    task2Exp3_stealSide_axi_mgmt_vss_0_AWREADY(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.awready);
    task2Exp3_stealSide_axi_mgmt_vss_0_AWADDR(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.awaddr);
    task2Exp3_stealSide_axi_mgmt_vss_0_AWPROT(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.awprot);
    task2Exp3_stealSide_axi_mgmt_vss_0_WVALID(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.wvalid);
    task2Exp3_stealSide_axi_mgmt_vss_0_WREADY(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.wready);
    task2Exp3_stealSide_axi_mgmt_vss_0_WDATA(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.wdata);
    task2Exp3_stealSide_axi_mgmt_vss_0_WSTRB(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.wstrb);
    task2Exp3_stealSide_axi_mgmt_vss_0_BVALID(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.bvalid);
    task2Exp3_stealSide_axi_mgmt_vss_0_BREADY(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.bready);
    task2Exp3_stealSide_axi_mgmt_vss_0_BRESP(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.bresp);
    task2Exp3_stealSide_axi_mgmt_vss_0_ARVALID(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.arvalid);
    task2Exp3_stealSide_axi_mgmt_vss_0_ARREADY(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.arready);
    task2Exp3_stealSide_axi_mgmt_vss_0_ARADDR(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.araddr);
    task2Exp3_stealSide_axi_mgmt_vss_0_ARPROT(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.arprot);
    task2Exp3_stealSide_axi_mgmt_vss_0_RVALID(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.rvalid);
    task2Exp3_stealSide_axi_mgmt_vss_0_RREADY(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.rready);
    task2Exp3_stealSide_axi_mgmt_vss_0_RDATA(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.rdata);
    task2Exp3_stealSide_axi_mgmt_vss_0_RRESP(task2Exp3_stealSide_axi_mgmt_vss_0_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task2Exp3_stealSide_vss_axi_full_0 */
    /* is_slave = False */
    task2Exp3_stealSide_vss_axi_full_0_AWVALID(task2Exp3_stealSide_vss_axi_full_0_signals_.awvalid);
    task2Exp3_stealSide_vss_axi_full_0_AWREADY(task2Exp3_stealSide_vss_axi_full_0_signals_.awready);
    task2Exp3_stealSide_vss_axi_full_0_AWADDR(task2Exp3_stealSide_vss_axi_full_0_signals_.awaddr);
    task2Exp3_stealSide_vss_axi_full_0_AWPROT(task2Exp3_stealSide_vss_axi_full_0_signals_.awprot);
    task2Exp3_stealSide_vss_axi_full_0_AWREGION(task2Exp3_stealSide_vss_axi_full_0_signals_.awregion);
    task2Exp3_stealSide_vss_axi_full_0_AWQOS(task2Exp3_stealSide_vss_axi_full_0_signals_.awqos);
    task2Exp3_stealSide_vss_axi_full_0_AWCACHE(task2Exp3_stealSide_vss_axi_full_0_signals_.awcache);
    task2Exp3_stealSide_vss_axi_full_0_AWBURST(task2Exp3_stealSide_vss_axi_full_0_signals_.awburst);
    task2Exp3_stealSide_vss_axi_full_0_AWSIZE(task2Exp3_stealSide_vss_axi_full_0_signals_.awsize);
    task2Exp3_stealSide_vss_axi_full_0_AWLEN(task2Exp3_stealSide_vss_axi_full_0_signals_.awlen);
    task2Exp3_stealSide_vss_axi_full_0_AWID(task2Exp3_stealSide_vss_axi_full_0_signals_.awid);
    task2Exp3_stealSide_vss_axi_full_0_AWLOCK(task2Exp3_stealSide_vss_axi_full_0_signals_.awlock);
    task2Exp3_stealSide_vss_axi_full_0_WID(task2Exp3_stealSide_vss_axi_full_0_signals_.wid);
    task2Exp3_stealSide_vss_axi_full_0_WVALID(task2Exp3_stealSide_vss_axi_full_0_signals_.wvalid);
    task2Exp3_stealSide_vss_axi_full_0_WREADY(task2Exp3_stealSide_vss_axi_full_0_signals_.wready);
    task2Exp3_stealSide_vss_axi_full_0_WDATA(task2Exp3_stealSide_vss_axi_full_0_signals_.wdata);
    task2Exp3_stealSide_vss_axi_full_0_WSTRB(task2Exp3_stealSide_vss_axi_full_0_signals_.wstrb);
    task2Exp3_stealSide_vss_axi_full_0_WLAST(task2Exp3_stealSide_vss_axi_full_0_signals_.wlast);
    task2Exp3_stealSide_vss_axi_full_0_BVALID(task2Exp3_stealSide_vss_axi_full_0_signals_.bvalid);
    task2Exp3_stealSide_vss_axi_full_0_BREADY(task2Exp3_stealSide_vss_axi_full_0_signals_.bready);
    task2Exp3_stealSide_vss_axi_full_0_BRESP(task2Exp3_stealSide_vss_axi_full_0_signals_.bresp);
    task2Exp3_stealSide_vss_axi_full_0_BID(task2Exp3_stealSide_vss_axi_full_0_signals_.bid);
    task2Exp3_stealSide_vss_axi_full_0_ARVALID(task2Exp3_stealSide_vss_axi_full_0_signals_.arvalid);
    task2Exp3_stealSide_vss_axi_full_0_ARREADY(task2Exp3_stealSide_vss_axi_full_0_signals_.arready);
    task2Exp3_stealSide_vss_axi_full_0_ARADDR(task2Exp3_stealSide_vss_axi_full_0_signals_.araddr);
    task2Exp3_stealSide_vss_axi_full_0_ARPROT(task2Exp3_stealSide_vss_axi_full_0_signals_.arprot);
    task2Exp3_stealSide_vss_axi_full_0_ARREGION(task2Exp3_stealSide_vss_axi_full_0_signals_.arregion);
    task2Exp3_stealSide_vss_axi_full_0_ARQOS(task2Exp3_stealSide_vss_axi_full_0_signals_.arqos);
    task2Exp3_stealSide_vss_axi_full_0_ARCACHE(task2Exp3_stealSide_vss_axi_full_0_signals_.arcache);
    task2Exp3_stealSide_vss_axi_full_0_ARBURST(task2Exp3_stealSide_vss_axi_full_0_signals_.arburst);
    task2Exp3_stealSide_vss_axi_full_0_ARSIZE(task2Exp3_stealSide_vss_axi_full_0_signals_.arsize);
    task2Exp3_stealSide_vss_axi_full_0_ARLEN(task2Exp3_stealSide_vss_axi_full_0_signals_.arlen);
    task2Exp3_stealSide_vss_axi_full_0_ARID(task2Exp3_stealSide_vss_axi_full_0_signals_.arid);
    task2Exp3_stealSide_vss_axi_full_0_ARLOCK(task2Exp3_stealSide_vss_axi_full_0_signals_.arlock);
    task2Exp3_stealSide_vss_axi_full_0_RVALID(task2Exp3_stealSide_vss_axi_full_0_signals_.rvalid);
    task2Exp3_stealSide_vss_axi_full_0_RREADY(task2Exp3_stealSide_vss_axi_full_0_signals_.rready);
    task2Exp3_stealSide_vss_axi_full_0_RDATA(task2Exp3_stealSide_vss_axi_full_0_signals_.rdata);
    task2Exp3_stealSide_vss_axi_full_0_RRESP(task2Exp3_stealSide_vss_axi_full_0_signals_.rresp);
    task2Exp3_stealSide_vss_axi_full_0_RID(task2Exp3_stealSide_vss_axi_full_0_signals_.rid);
    task2Exp3_stealSide_vss_axi_full_0_RLAST(task2Exp3_stealSide_vss_axi_full_0_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task2Exp3_stealSide_axi_mgmt_vss_1 */
    /* is_slave = True */
    task2Exp3_stealSide_axi_mgmt_vss_1_AWVALID(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.awvalid);
    task2Exp3_stealSide_axi_mgmt_vss_1_AWREADY(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.awready);
    task2Exp3_stealSide_axi_mgmt_vss_1_AWADDR(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.awaddr);
    task2Exp3_stealSide_axi_mgmt_vss_1_AWPROT(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.awprot);
    task2Exp3_stealSide_axi_mgmt_vss_1_WVALID(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.wvalid);
    task2Exp3_stealSide_axi_mgmt_vss_1_WREADY(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.wready);
    task2Exp3_stealSide_axi_mgmt_vss_1_WDATA(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.wdata);
    task2Exp3_stealSide_axi_mgmt_vss_1_WSTRB(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.wstrb);
    task2Exp3_stealSide_axi_mgmt_vss_1_BVALID(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.bvalid);
    task2Exp3_stealSide_axi_mgmt_vss_1_BREADY(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.bready);
    task2Exp3_stealSide_axi_mgmt_vss_1_BRESP(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.bresp);
    task2Exp3_stealSide_axi_mgmt_vss_1_ARVALID(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.arvalid);
    task2Exp3_stealSide_axi_mgmt_vss_1_ARREADY(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.arready);
    task2Exp3_stealSide_axi_mgmt_vss_1_ARADDR(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.araddr);
    task2Exp3_stealSide_axi_mgmt_vss_1_ARPROT(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.arprot);
    task2Exp3_stealSide_axi_mgmt_vss_1_RVALID(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.rvalid);
    task2Exp3_stealSide_axi_mgmt_vss_1_RREADY(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.rready);
    task2Exp3_stealSide_axi_mgmt_vss_1_RDATA(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.rdata);
    task2Exp3_stealSide_axi_mgmt_vss_1_RRESP(task2Exp3_stealSide_axi_mgmt_vss_1_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task2Exp3_stealSide_vss_axi_full_1 */
    /* is_slave = False */
    task2Exp3_stealSide_vss_axi_full_1_AWVALID(task2Exp3_stealSide_vss_axi_full_1_signals_.awvalid);
    task2Exp3_stealSide_vss_axi_full_1_AWREADY(task2Exp3_stealSide_vss_axi_full_1_signals_.awready);
    task2Exp3_stealSide_vss_axi_full_1_AWADDR(task2Exp3_stealSide_vss_axi_full_1_signals_.awaddr);
    task2Exp3_stealSide_vss_axi_full_1_AWPROT(task2Exp3_stealSide_vss_axi_full_1_signals_.awprot);
    task2Exp3_stealSide_vss_axi_full_1_AWREGION(task2Exp3_stealSide_vss_axi_full_1_signals_.awregion);
    task2Exp3_stealSide_vss_axi_full_1_AWQOS(task2Exp3_stealSide_vss_axi_full_1_signals_.awqos);
    task2Exp3_stealSide_vss_axi_full_1_AWCACHE(task2Exp3_stealSide_vss_axi_full_1_signals_.awcache);
    task2Exp3_stealSide_vss_axi_full_1_AWBURST(task2Exp3_stealSide_vss_axi_full_1_signals_.awburst);
    task2Exp3_stealSide_vss_axi_full_1_AWSIZE(task2Exp3_stealSide_vss_axi_full_1_signals_.awsize);
    task2Exp3_stealSide_vss_axi_full_1_AWLEN(task2Exp3_stealSide_vss_axi_full_1_signals_.awlen);
    task2Exp3_stealSide_vss_axi_full_1_AWID(task2Exp3_stealSide_vss_axi_full_1_signals_.awid);
    task2Exp3_stealSide_vss_axi_full_1_AWLOCK(task2Exp3_stealSide_vss_axi_full_1_signals_.awlock);
    task2Exp3_stealSide_vss_axi_full_1_WID(task2Exp3_stealSide_vss_axi_full_1_signals_.wid);
    task2Exp3_stealSide_vss_axi_full_1_WVALID(task2Exp3_stealSide_vss_axi_full_1_signals_.wvalid);
    task2Exp3_stealSide_vss_axi_full_1_WREADY(task2Exp3_stealSide_vss_axi_full_1_signals_.wready);
    task2Exp3_stealSide_vss_axi_full_1_WDATA(task2Exp3_stealSide_vss_axi_full_1_signals_.wdata);
    task2Exp3_stealSide_vss_axi_full_1_WSTRB(task2Exp3_stealSide_vss_axi_full_1_signals_.wstrb);
    task2Exp3_stealSide_vss_axi_full_1_WLAST(task2Exp3_stealSide_vss_axi_full_1_signals_.wlast);
    task2Exp3_stealSide_vss_axi_full_1_BVALID(task2Exp3_stealSide_vss_axi_full_1_signals_.bvalid);
    task2Exp3_stealSide_vss_axi_full_1_BREADY(task2Exp3_stealSide_vss_axi_full_1_signals_.bready);
    task2Exp3_stealSide_vss_axi_full_1_BRESP(task2Exp3_stealSide_vss_axi_full_1_signals_.bresp);
    task2Exp3_stealSide_vss_axi_full_1_BID(task2Exp3_stealSide_vss_axi_full_1_signals_.bid);
    task2Exp3_stealSide_vss_axi_full_1_ARVALID(task2Exp3_stealSide_vss_axi_full_1_signals_.arvalid);
    task2Exp3_stealSide_vss_axi_full_1_ARREADY(task2Exp3_stealSide_vss_axi_full_1_signals_.arready);
    task2Exp3_stealSide_vss_axi_full_1_ARADDR(task2Exp3_stealSide_vss_axi_full_1_signals_.araddr);
    task2Exp3_stealSide_vss_axi_full_1_ARPROT(task2Exp3_stealSide_vss_axi_full_1_signals_.arprot);
    task2Exp3_stealSide_vss_axi_full_1_ARREGION(task2Exp3_stealSide_vss_axi_full_1_signals_.arregion);
    task2Exp3_stealSide_vss_axi_full_1_ARQOS(task2Exp3_stealSide_vss_axi_full_1_signals_.arqos);
    task2Exp3_stealSide_vss_axi_full_1_ARCACHE(task2Exp3_stealSide_vss_axi_full_1_signals_.arcache);
    task2Exp3_stealSide_vss_axi_full_1_ARBURST(task2Exp3_stealSide_vss_axi_full_1_signals_.arburst);
    task2Exp3_stealSide_vss_axi_full_1_ARSIZE(task2Exp3_stealSide_vss_axi_full_1_signals_.arsize);
    task2Exp3_stealSide_vss_axi_full_1_ARLEN(task2Exp3_stealSide_vss_axi_full_1_signals_.arlen);
    task2Exp3_stealSide_vss_axi_full_1_ARID(task2Exp3_stealSide_vss_axi_full_1_signals_.arid);
    task2Exp3_stealSide_vss_axi_full_1_ARLOCK(task2Exp3_stealSide_vss_axi_full_1_signals_.arlock);
    task2Exp3_stealSide_vss_axi_full_1_RVALID(task2Exp3_stealSide_vss_axi_full_1_signals_.rvalid);
    task2Exp3_stealSide_vss_axi_full_1_RREADY(task2Exp3_stealSide_vss_axi_full_1_signals_.rready);
    task2Exp3_stealSide_vss_axi_full_1_RDATA(task2Exp3_stealSide_vss_axi_full_1_signals_.rdata);
    task2Exp3_stealSide_vss_axi_full_1_RRESP(task2Exp3_stealSide_vss_axi_full_1_signals_.rresp);
    task2Exp3_stealSide_vss_axi_full_1_RID(task2Exp3_stealSide_vss_axi_full_1_signals_.rid);
    task2Exp3_stealSide_vss_axi_full_1_RLAST(task2Exp3_stealSide_vss_axi_full_1_signals_.rlast);
    
    
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
            r["task1Exp3"] = Task{
                .name = "task1Exp3",
                .parent = "/tasks",
                .path = "/tasks:task1Exp3",
                .isRoot = true,
                .isCont = false,
                .widthTask = 32,
                .widthCont = 32,
                .widthArg = 32,
                .numProcessingElements = 12,
                .processingElements = []() {
                    std::map<std::string, ProcessingElement> r;
                    r["pe_0"] = ProcessingElement{
                        .name = "pe_0",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_0",
                        .portName = "task1Exp3_PE_0",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_0",
                                .path = "/tasks:task1Exp3/processingElements:pe_0/interfaces:mem",
                                .portName = "task1Exp3_PE_0_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_0",
                                .path = "/tasks:task1Exp3/processingElements:pe_0/interfaces:taskIn",
                                .portName = "task1Exp3_PE_0_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_0",
                                .path = "/tasks:task1Exp3/processingElements:pe_0/interfaces:taskOut",
                                .portName = "task1Exp3_PE_0_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_0",
                                .path = "/tasks:task1Exp3/processingElements:pe_0/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_0_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_1",
                        .portName = "task1Exp3_PE_1",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_1",
                                .path = "/tasks:task1Exp3/processingElements:pe_1/interfaces:mem",
                                .portName = "task1Exp3_PE_1_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_1",
                                .path = "/tasks:task1Exp3/processingElements:pe_1/interfaces:taskIn",
                                .portName = "task1Exp3_PE_1_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_1",
                                .path = "/tasks:task1Exp3/processingElements:pe_1/interfaces:taskOut",
                                .portName = "task1Exp3_PE_1_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_1",
                                .path = "/tasks:task1Exp3/processingElements:pe_1/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_1_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_2",
                        .portName = "task1Exp3_PE_2",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_2",
                                .path = "/tasks:task1Exp3/processingElements:pe_2/interfaces:mem",
                                .portName = "task1Exp3_PE_2_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_2",
                                .path = "/tasks:task1Exp3/processingElements:pe_2/interfaces:taskIn",
                                .portName = "task1Exp3_PE_2_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_2",
                                .path = "/tasks:task1Exp3/processingElements:pe_2/interfaces:taskOut",
                                .portName = "task1Exp3_PE_2_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_2",
                                .path = "/tasks:task1Exp3/processingElements:pe_2/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_2_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_3",
                        .portName = "task1Exp3_PE_3",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_3",
                                .path = "/tasks:task1Exp3/processingElements:pe_3/interfaces:mem",
                                .portName = "task1Exp3_PE_3_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_3",
                                .path = "/tasks:task1Exp3/processingElements:pe_3/interfaces:taskIn",
                                .portName = "task1Exp3_PE_3_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_3",
                                .path = "/tasks:task1Exp3/processingElements:pe_3/interfaces:taskOut",
                                .portName = "task1Exp3_PE_3_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_3",
                                .path = "/tasks:task1Exp3/processingElements:pe_3/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_3_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_4",
                        .portName = "task1Exp3_PE_4",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_4",
                                .path = "/tasks:task1Exp3/processingElements:pe_4/interfaces:mem",
                                .portName = "task1Exp3_PE_4_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_4",
                                .path = "/tasks:task1Exp3/processingElements:pe_4/interfaces:taskIn",
                                .portName = "task1Exp3_PE_4_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_4",
                                .path = "/tasks:task1Exp3/processingElements:pe_4/interfaces:taskOut",
                                .portName = "task1Exp3_PE_4_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_4",
                                .path = "/tasks:task1Exp3/processingElements:pe_4/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_4_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_5"] = ProcessingElement{
                        .name = "pe_5",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_5",
                        .portName = "task1Exp3_PE_5",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_5",
                                .path = "/tasks:task1Exp3/processingElements:pe_5/interfaces:mem",
                                .portName = "task1Exp3_PE_5_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_5",
                                .path = "/tasks:task1Exp3/processingElements:pe_5/interfaces:taskIn",
                                .portName = "task1Exp3_PE_5_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_5",
                                .path = "/tasks:task1Exp3/processingElements:pe_5/interfaces:taskOut",
                                .portName = "task1Exp3_PE_5_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_5",
                                .path = "/tasks:task1Exp3/processingElements:pe_5/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_5_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_6"] = ProcessingElement{
                        .name = "pe_6",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_6",
                        .portName = "task1Exp3_PE_6",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_6",
                                .path = "/tasks:task1Exp3/processingElements:pe_6/interfaces:mem",
                                .portName = "task1Exp3_PE_6_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_6",
                                .path = "/tasks:task1Exp3/processingElements:pe_6/interfaces:taskIn",
                                .portName = "task1Exp3_PE_6_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_6",
                                .path = "/tasks:task1Exp3/processingElements:pe_6/interfaces:taskOut",
                                .portName = "task1Exp3_PE_6_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_6",
                                .path = "/tasks:task1Exp3/processingElements:pe_6/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_6_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_7"] = ProcessingElement{
                        .name = "pe_7",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_7",
                        .portName = "task1Exp3_PE_7",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_7",
                                .path = "/tasks:task1Exp3/processingElements:pe_7/interfaces:mem",
                                .portName = "task1Exp3_PE_7_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_7",
                                .path = "/tasks:task1Exp3/processingElements:pe_7/interfaces:taskIn",
                                .portName = "task1Exp3_PE_7_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_7",
                                .path = "/tasks:task1Exp3/processingElements:pe_7/interfaces:taskOut",
                                .portName = "task1Exp3_PE_7_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_7",
                                .path = "/tasks:task1Exp3/processingElements:pe_7/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_7_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_8"] = ProcessingElement{
                        .name = "pe_8",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_8",
                        .portName = "task1Exp3_PE_8",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_8",
                                .path = "/tasks:task1Exp3/processingElements:pe_8/interfaces:mem",
                                .portName = "task1Exp3_PE_8_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_8",
                                .path = "/tasks:task1Exp3/processingElements:pe_8/interfaces:taskIn",
                                .portName = "task1Exp3_PE_8_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_8",
                                .path = "/tasks:task1Exp3/processingElements:pe_8/interfaces:taskOut",
                                .portName = "task1Exp3_PE_8_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_8",
                                .path = "/tasks:task1Exp3/processingElements:pe_8/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_8_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_9"] = ProcessingElement{
                        .name = "pe_9",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_9",
                        .portName = "task1Exp3_PE_9",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_9",
                                .path = "/tasks:task1Exp3/processingElements:pe_9/interfaces:mem",
                                .portName = "task1Exp3_PE_9_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_9",
                                .path = "/tasks:task1Exp3/processingElements:pe_9/interfaces:taskIn",
                                .portName = "task1Exp3_PE_9_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_9",
                                .path = "/tasks:task1Exp3/processingElements:pe_9/interfaces:taskOut",
                                .portName = "task1Exp3_PE_9_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_9",
                                .path = "/tasks:task1Exp3/processingElements:pe_9/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_9_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_10"] = ProcessingElement{
                        .name = "pe_10",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_10",
                        .portName = "task1Exp3_PE_10",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_10",
                                .path = "/tasks:task1Exp3/processingElements:pe_10/interfaces:mem",
                                .portName = "task1Exp3_PE_10_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_10",
                                .path = "/tasks:task1Exp3/processingElements:pe_10/interfaces:taskIn",
                                .portName = "task1Exp3_PE_10_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_10",
                                .path = "/tasks:task1Exp3/processingElements:pe_10/interfaces:taskOut",
                                .portName = "task1Exp3_PE_10_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_10",
                                .path = "/tasks:task1Exp3/processingElements:pe_10/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_10_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_11"] = ProcessingElement{
                        .name = "pe_11",
                        .parent = "/tasks:task1Exp3",
                        .path = "/tasks:task1Exp3/processingElements:pe_11",
                        .portName = "task1Exp3_PE_11",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task1Exp3/processingElements:pe_11",
                                .path = "/tasks:task1Exp3/processingElements:pe_11/interfaces:mem",
                                .portName = "task1Exp3_PE_11_mem",
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
                                .parent = "/tasks:task1Exp3/processingElements:pe_11",
                                .path = "/tasks:task1Exp3/processingElements:pe_11/interfaces:taskIn",
                                .portName = "task1Exp3_PE_11_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task1Exp3/processingElements:pe_11",
                                .path = "/tasks:task1Exp3/processingElements:pe_11/interfaces:taskOut",
                                .portName = "task1Exp3_PE_11_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut_task2Exp3"] = Interface{
                                .name = "taskOut_task2Exp3",
                                .parent = "/tasks:task1Exp3/processingElements:pe_11",
                                .path = "/tasks:task1Exp3/processingElements:pe_11/interfaces:taskOut_task2Exp3",
                                .portName = "task1Exp3_PE_11_taskOut_task2Exp3",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                .numVirtualStealServers = 2,
                .capacityVirtualStealQueue = 10000000,
                .virtualStealServers = []() {
                    std::map<std::string, VirtualStealServer> r;
                    r["vss_0"] = VirtualStealServer{
                        .name = "vss_0",
                        .parent = "task1Exp3",
                        .path = "/tasks:task1Exp3/virtualStealServers:vss_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff00000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task1Exp3_stealSide_axi_mgmt_vss_0",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    r["vss_1"] = VirtualStealServer{
                        .name = "vss_1",
                        .parent = "task1Exp3",
                        .path = "/tasks:task1Exp3/virtualStealServers:vss_1",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff10000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task1Exp3_stealSide_axi_mgmt_vss_1",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    return r;
                }(),
                .numVirtualContinuationServers = 0,
                .capacityVirtualContinuationQueue = 0,
                .numArgRouteServers = 0,
                .capacityArgRouteServers = 0
            };
            r["task2Exp3"] = Task{
                .name = "task2Exp3",
                .parent = "/tasks",
                .path = "/tasks:task2Exp3",
                .isRoot = false,
                .isCont = false,
                .widthTask = 32,
                .widthCont = 32,
                .widthArg = 32,
                .numProcessingElements = 12,
                .processingElements = []() {
                    std::map<std::string, ProcessingElement> r;
                    r["pe_0"] = ProcessingElement{
                        .name = "pe_0",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_0",
                        .portName = "task2Exp3_PE_0",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_0",
                                .path = "/tasks:task2Exp3/processingElements:pe_0/interfaces:mem",
                                .portName = "task2Exp3_PE_0_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_0",
                                .path = "/tasks:task2Exp3/processingElements:pe_0/interfaces:taskIn",
                                .portName = "task2Exp3_PE_0_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_1",
                        .portName = "task2Exp3_PE_1",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_1",
                                .path = "/tasks:task2Exp3/processingElements:pe_1/interfaces:mem",
                                .portName = "task2Exp3_PE_1_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_1",
                                .path = "/tasks:task2Exp3/processingElements:pe_1/interfaces:taskIn",
                                .portName = "task2Exp3_PE_1_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_2",
                        .portName = "task2Exp3_PE_2",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_2",
                                .path = "/tasks:task2Exp3/processingElements:pe_2/interfaces:mem",
                                .portName = "task2Exp3_PE_2_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_2",
                                .path = "/tasks:task2Exp3/processingElements:pe_2/interfaces:taskIn",
                                .portName = "task2Exp3_PE_2_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_3",
                        .portName = "task2Exp3_PE_3",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_3",
                                .path = "/tasks:task2Exp3/processingElements:pe_3/interfaces:mem",
                                .portName = "task2Exp3_PE_3_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_3",
                                .path = "/tasks:task2Exp3/processingElements:pe_3/interfaces:taskIn",
                                .portName = "task2Exp3_PE_3_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_4",
                        .portName = "task2Exp3_PE_4",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_4",
                                .path = "/tasks:task2Exp3/processingElements:pe_4/interfaces:mem",
                                .portName = "task2Exp3_PE_4_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_4",
                                .path = "/tasks:task2Exp3/processingElements:pe_4/interfaces:taskIn",
                                .portName = "task2Exp3_PE_4_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_5"] = ProcessingElement{
                        .name = "pe_5",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_5",
                        .portName = "task2Exp3_PE_5",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_5",
                                .path = "/tasks:task2Exp3/processingElements:pe_5/interfaces:mem",
                                .portName = "task2Exp3_PE_5_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_5",
                                .path = "/tasks:task2Exp3/processingElements:pe_5/interfaces:taskIn",
                                .portName = "task2Exp3_PE_5_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_6"] = ProcessingElement{
                        .name = "pe_6",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_6",
                        .portName = "task2Exp3_PE_6",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_6",
                                .path = "/tasks:task2Exp3/processingElements:pe_6/interfaces:mem",
                                .portName = "task2Exp3_PE_6_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_6",
                                .path = "/tasks:task2Exp3/processingElements:pe_6/interfaces:taskIn",
                                .portName = "task2Exp3_PE_6_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_7"] = ProcessingElement{
                        .name = "pe_7",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_7",
                        .portName = "task2Exp3_PE_7",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_7",
                                .path = "/tasks:task2Exp3/processingElements:pe_7/interfaces:mem",
                                .portName = "task2Exp3_PE_7_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_7",
                                .path = "/tasks:task2Exp3/processingElements:pe_7/interfaces:taskIn",
                                .portName = "task2Exp3_PE_7_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_8"] = ProcessingElement{
                        .name = "pe_8",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_8",
                        .portName = "task2Exp3_PE_8",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_8",
                                .path = "/tasks:task2Exp3/processingElements:pe_8/interfaces:mem",
                                .portName = "task2Exp3_PE_8_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_8",
                                .path = "/tasks:task2Exp3/processingElements:pe_8/interfaces:taskIn",
                                .portName = "task2Exp3_PE_8_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_9"] = ProcessingElement{
                        .name = "pe_9",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_9",
                        .portName = "task2Exp3_PE_9",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_9",
                                .path = "/tasks:task2Exp3/processingElements:pe_9/interfaces:mem",
                                .portName = "task2Exp3_PE_9_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_9",
                                .path = "/tasks:task2Exp3/processingElements:pe_9/interfaces:taskIn",
                                .portName = "task2Exp3_PE_9_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_10"] = ProcessingElement{
                        .name = "pe_10",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_10",
                        .portName = "task2Exp3_PE_10",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_10",
                                .path = "/tasks:task2Exp3/processingElements:pe_10/interfaces:mem",
                                .portName = "task2Exp3_PE_10_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_10",
                                .path = "/tasks:task2Exp3/processingElements:pe_10/interfaces:taskIn",
                                .portName = "task2Exp3_PE_10_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            return r;
                        }()
                    };
                    r["pe_11"] = ProcessingElement{
                        .name = "pe_11",
                        .parent = "/tasks:task2Exp3",
                        .path = "/tasks:task2Exp3/processingElements:pe_11",
                        .portName = "task2Exp3_PE_11",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task2Exp3/processingElements:pe_11",
                                .path = "/tasks:task2Exp3/processingElements:pe_11/interfaces:mem",
                                .portName = "task2Exp3_PE_11_mem",
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
                                .parent = "/tasks:task2Exp3/processingElements:pe_11",
                                .path = "/tasks:task2Exp3/processingElements:pe_11/interfaces:taskIn",
                                .portName = "task2Exp3_PE_11_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 32,
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
                .numVirtualStealServers = 2,
                .capacityVirtualStealQueue = 10000000,
                .virtualStealServers = []() {
                    std::map<std::string, VirtualStealServer> r;
                    r["vss_0"] = VirtualStealServer{
                        .name = "vss_0",
                        .parent = "task2Exp3",
                        .path = "/tasks:task2Exp3/virtualStealServers:vss_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff20000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task2Exp3_stealSide_axi_mgmt_vss_0",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    r["vss_1"] = VirtualStealServer{
                        .name = "vss_1",
                        .parent = "task2Exp3",
                        .path = "/tasks:task2Exp3/virtualStealServers:vss_1",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff30000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task2Exp3_stealSide_axi_mgmt_vss_1",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    return r;
                }(),
                .numVirtualContinuationServers = 0,
                .capacityVirtualContinuationQueue = 0,
                .numArgRouteServers = 0,
                .capacityArgRouteServers = 0
            };
            return r;
        }(),
        .system = System{
            .name = "system",
            .parent = "/",
            .path = "/system",
            .interfaces = []() {
                std::map<std::string, Interface> r;
                r["task1Exp3_stealSide_taskOut_0"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_0",
                    .portName = "task1Exp3_stealSide_taskOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_1"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_1",
                    .portName = "task1Exp3_stealSide_taskOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_2"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_2",
                    .portName = "task1Exp3_stealSide_taskOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_3"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_3",
                    .portName = "task1Exp3_stealSide_taskOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_4"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_4",
                    .portName = "task1Exp3_stealSide_taskOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_5"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_5",
                    .portName = "task1Exp3_stealSide_taskOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_6"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_6",
                    .portName = "task1Exp3_stealSide_taskOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_7"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_7",
                    .portName = "task1Exp3_stealSide_taskOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_8"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_8",
                    .portName = "task1Exp3_stealSide_taskOut_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_9"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_9",
                    .portName = "task1Exp3_stealSide_taskOut_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_10"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_10",
                    .portName = "task1Exp3_stealSide_taskOut_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskOut_11"] = Interface{
                    .name = "task1Exp3_stealSide_taskOut_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskOut_11",
                    .portName = "task1Exp3_stealSide_taskOut_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_0"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_0",
                    .portName = "task1Exp3_stealSide_taskIn_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_1"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_1",
                    .portName = "task1Exp3_stealSide_taskIn_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_2"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_2",
                    .portName = "task1Exp3_stealSide_taskIn_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_3"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_3",
                    .portName = "task1Exp3_stealSide_taskIn_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_4"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_4",
                    .portName = "task1Exp3_stealSide_taskIn_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_5"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_5",
                    .portName = "task1Exp3_stealSide_taskIn_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_6"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_6",
                    .portName = "task1Exp3_stealSide_taskIn_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_7"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_7",
                    .portName = "task1Exp3_stealSide_taskIn_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_8"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_8",
                    .portName = "task1Exp3_stealSide_taskIn_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_9"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_9",
                    .portName = "task1Exp3_stealSide_taskIn_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_10"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_10",
                    .portName = "task1Exp3_stealSide_taskIn_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_taskIn_11"] = Interface{
                    .name = "task1Exp3_stealSide_taskIn_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_taskIn_11",
                    .portName = "task1Exp3_stealSide_taskIn_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_0"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_0",
                    .portName = "task2Exp3_stealSide_taskOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_1"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_1",
                    .portName = "task2Exp3_stealSide_taskOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_2"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_2",
                    .portName = "task2Exp3_stealSide_taskOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_3"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_3",
                    .portName = "task2Exp3_stealSide_taskOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_4"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_4",
                    .portName = "task2Exp3_stealSide_taskOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_5"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_5",
                    .portName = "task2Exp3_stealSide_taskOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_6"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_6",
                    .portName = "task2Exp3_stealSide_taskOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_7"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_7",
                    .portName = "task2Exp3_stealSide_taskOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_8"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_8",
                    .portName = "task2Exp3_stealSide_taskOut_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_9"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_9",
                    .portName = "task2Exp3_stealSide_taskOut_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_10"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_10",
                    .portName = "task2Exp3_stealSide_taskOut_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskOut_11"] = Interface{
                    .name = "task2Exp3_stealSide_taskOut_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskOut_11",
                    .portName = "task2Exp3_stealSide_taskOut_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_0"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_0",
                    .portName = "task2Exp3_stealSide_taskInGlobal_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_1"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_1",
                    .portName = "task2Exp3_stealSide_taskInGlobal_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_2"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_2",
                    .portName = "task2Exp3_stealSide_taskInGlobal_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_3"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_3",
                    .portName = "task2Exp3_stealSide_taskInGlobal_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_4"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_4",
                    .portName = "task2Exp3_stealSide_taskInGlobal_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_5"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_5",
                    .portName = "task2Exp3_stealSide_taskInGlobal_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_6"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_6",
                    .portName = "task2Exp3_stealSide_taskInGlobal_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_7"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_7",
                    .portName = "task2Exp3_stealSide_taskInGlobal_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_8"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_8",
                    .portName = "task2Exp3_stealSide_taskInGlobal_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_9"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_9",
                    .portName = "task2Exp3_stealSide_taskInGlobal_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_10"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_10",
                    .portName = "task2Exp3_stealSide_taskInGlobal_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task2Exp3_stealSide_taskInGlobal_11"] = Interface{
                    .name = "task2Exp3_stealSide_taskInGlobal_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_taskInGlobal_11",
                    .portName = "task2Exp3_stealSide_taskInGlobal_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task1Exp3_stealSide_axi_mgmt_vss_0"] = Interface{
                    .name = "task1Exp3_stealSide_axi_mgmt_vss_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_axi_mgmt_vss_0",
                    .portName = "task1Exp3_stealSide_axi_mgmt_vss_0",
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
                r["task1Exp3_stealSide_vss_axi_full_0"] = Interface{
                    .name = "task1Exp3_stealSide_vss_axi_full_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_vss_axi_full_0",
                    .portName = "task1Exp3_stealSide_vss_axi_full_0",
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
                r["task1Exp3_stealSide_axi_mgmt_vss_1"] = Interface{
                    .name = "task1Exp3_stealSide_axi_mgmt_vss_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_axi_mgmt_vss_1",
                    .portName = "task1Exp3_stealSide_axi_mgmt_vss_1",
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
                r["task1Exp3_stealSide_vss_axi_full_1"] = Interface{
                    .name = "task1Exp3_stealSide_vss_axi_full_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task1Exp3_stealSide_vss_axi_full_1",
                    .portName = "task1Exp3_stealSide_vss_axi_full_1",
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
                r["task2Exp3_stealSide_axi_mgmt_vss_0"] = Interface{
                    .name = "task2Exp3_stealSide_axi_mgmt_vss_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_axi_mgmt_vss_0",
                    .portName = "task2Exp3_stealSide_axi_mgmt_vss_0",
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
                r["task2Exp3_stealSide_vss_axi_full_0"] = Interface{
                    .name = "task2Exp3_stealSide_vss_axi_full_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_vss_axi_full_0",
                    .portName = "task2Exp3_stealSide_vss_axi_full_0",
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
                r["task2Exp3_stealSide_axi_mgmt_vss_1"] = Interface{
                    .name = "task2Exp3_stealSide_axi_mgmt_vss_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_axi_mgmt_vss_1",
                    .portName = "task2Exp3_stealSide_axi_mgmt_vss_1",
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
                r["task2Exp3_stealSide_vss_axi_full_1"] = Interface{
                    .name = "task2Exp3_stealSide_vss_axi_full_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task2Exp3_stealSide_vss_axi_full_1",
                    .portName = "task2Exp3_stealSide_vss_axi_full_1",
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
                return r;
            }()
        },
        .connections = std::vector<std::pair<std::string, std::string>>{
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_0",
                "/tasks:task1Exp3/processingElements:pe_0/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_1",
                "/tasks:task1Exp3/processingElements:pe_1/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_2",
                "/tasks:task1Exp3/processingElements:pe_2/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_3",
                "/tasks:task1Exp3/processingElements:pe_3/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_4",
                "/tasks:task1Exp3/processingElements:pe_4/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_5",
                "/tasks:task1Exp3/processingElements:pe_5/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_6",
                "/tasks:task1Exp3/processingElements:pe_6/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_7",
                "/tasks:task1Exp3/processingElements:pe_7/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_8",
                "/tasks:task1Exp3/processingElements:pe_8/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_9",
                "/tasks:task1Exp3/processingElements:pe_9/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_10",
                "/tasks:task1Exp3/processingElements:pe_10/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task1Exp3_stealSide_taskOut_11",
                "/tasks:task1Exp3/processingElements:pe_11/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_0/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_0"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_1/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_1"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_2/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_2"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_3/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_3"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_4/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_4"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_5/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_6/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_7/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_7"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_8/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_8"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_9/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_9"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_10/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_10"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_11/interfaces:taskOut",
                "/system/interfaces:task1Exp3_stealSide_taskIn_11"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_0",
                "/tasks:task2Exp3/processingElements:pe_0/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_1",
                "/tasks:task2Exp3/processingElements:pe_1/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_2",
                "/tasks:task2Exp3/processingElements:pe_2/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_3",
                "/tasks:task2Exp3/processingElements:pe_3/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_4",
                "/tasks:task2Exp3/processingElements:pe_4/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_5",
                "/tasks:task2Exp3/processingElements:pe_5/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_6",
                "/tasks:task2Exp3/processingElements:pe_6/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_7",
                "/tasks:task2Exp3/processingElements:pe_7/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_8",
                "/tasks:task2Exp3/processingElements:pe_8/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_9",
                "/tasks:task2Exp3/processingElements:pe_9/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_10",
                "/tasks:task2Exp3/processingElements:pe_10/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task2Exp3_stealSide_taskOut_11",
                "/tasks:task2Exp3/processingElements:pe_11/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_0/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_0"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_1/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_1"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_2/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_2"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_3/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_3"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_4/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_4"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_5/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_6/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_7/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_7"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_8/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_8"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_9/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_9"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_10/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_10"
            },
            std::pair<std::string, std::string>{
                "/tasks:task1Exp3/processingElements:pe_11/interfaces:taskOut_task2Exp3",
                "/system/interfaces:task2Exp3_stealSide_taskInGlobal_11"
            }
        },
        .widthAddress = 64,
        .widthContinuationCounter = 32,
        .spawnList = []() {
            std::map<std::string, std::vector<std::string>> r;
            r["task1Exp3"] = std::vector<std::string>{
                "task1Exp3",
                "task2Exp3"
            };
            return r;
        }(),
        .managementBase = addr_type(0x000000003ff00000ull),
        .memory = AddressSpace{
            .base = addr_type(0x0000000040000000ull),
            .size = addr_type(0x00000000c0000000ull)
        },
        .interconnectMasters = 29,
        .interconnectSlaves = 5,
        .isElaborated = true
    };
    return description;
}();



}