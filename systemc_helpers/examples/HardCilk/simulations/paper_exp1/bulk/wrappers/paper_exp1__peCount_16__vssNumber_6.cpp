#include "paper_exp1__peCount_16__vssNumber_6.hpp"

namespace paper_exp1::generated
{

paper_exp1__peCount_16__vssNumber_6::paper_exp1__peCount_16__vssNumber_6(sc_core::sc_module_name const &name):
    Vpaper_exp1__peCount_16__vssNumber_6(name),
    task_stealSide_taskOut_0_signals_("task_stealSide_taskOut_0_signals"),
    task_stealSide_taskOut_1_signals_("task_stealSide_taskOut_1_signals"),
    task_stealSide_taskOut_2_signals_("task_stealSide_taskOut_2_signals"),
    task_stealSide_taskOut_3_signals_("task_stealSide_taskOut_3_signals"),
    task_stealSide_taskOut_4_signals_("task_stealSide_taskOut_4_signals"),
    task_stealSide_taskOut_5_signals_("task_stealSide_taskOut_5_signals"),
    task_stealSide_taskOut_6_signals_("task_stealSide_taskOut_6_signals"),
    task_stealSide_taskOut_7_signals_("task_stealSide_taskOut_7_signals"),
    task_stealSide_taskOut_8_signals_("task_stealSide_taskOut_8_signals"),
    task_stealSide_taskOut_9_signals_("task_stealSide_taskOut_9_signals"),
    task_stealSide_taskOut_10_signals_("task_stealSide_taskOut_10_signals"),
    task_stealSide_taskOut_11_signals_("task_stealSide_taskOut_11_signals"),
    task_stealSide_taskOut_12_signals_("task_stealSide_taskOut_12_signals"),
    task_stealSide_taskOut_13_signals_("task_stealSide_taskOut_13_signals"),
    task_stealSide_taskOut_14_signals_("task_stealSide_taskOut_14_signals"),
    task_stealSide_taskOut_15_signals_("task_stealSide_taskOut_15_signals"),
    task_stealSide_taskIn_0_signals_("task_stealSide_taskIn_0_signals"),
    task_stealSide_taskIn_1_signals_("task_stealSide_taskIn_1_signals"),
    task_stealSide_taskIn_2_signals_("task_stealSide_taskIn_2_signals"),
    task_stealSide_taskIn_3_signals_("task_stealSide_taskIn_3_signals"),
    task_stealSide_taskIn_4_signals_("task_stealSide_taskIn_4_signals"),
    task_stealSide_taskIn_5_signals_("task_stealSide_taskIn_5_signals"),
    task_stealSide_taskIn_6_signals_("task_stealSide_taskIn_6_signals"),
    task_stealSide_taskIn_7_signals_("task_stealSide_taskIn_7_signals"),
    task_stealSide_taskIn_8_signals_("task_stealSide_taskIn_8_signals"),
    task_stealSide_taskIn_9_signals_("task_stealSide_taskIn_9_signals"),
    task_stealSide_taskIn_10_signals_("task_stealSide_taskIn_10_signals"),
    task_stealSide_taskIn_11_signals_("task_stealSide_taskIn_11_signals"),
    task_stealSide_taskIn_12_signals_("task_stealSide_taskIn_12_signals"),
    task_stealSide_taskIn_13_signals_("task_stealSide_taskIn_13_signals"),
    task_stealSide_taskIn_14_signals_("task_stealSide_taskIn_14_signals"),
    task_stealSide_taskIn_15_signals_("task_stealSide_taskIn_15_signals"),
    task_stealSide_axi_mgmt_vss_0_signals_("task_stealSide_axi_mgmt_vss_0_signals"),
    task_stealSide_vss_axi_full_0_signals_("task_stealSide_vss_axi_full_0_signals"),
    task_stealSide_axi_mgmt_vss_1_signals_("task_stealSide_axi_mgmt_vss_1_signals"),
    task_stealSide_vss_axi_full_1_signals_("task_stealSide_vss_axi_full_1_signals"),
    task_stealSide_axi_mgmt_vss_2_signals_("task_stealSide_axi_mgmt_vss_2_signals"),
    task_stealSide_vss_axi_full_2_signals_("task_stealSide_vss_axi_full_2_signals"),
    task_stealSide_axi_mgmt_vss_3_signals_("task_stealSide_axi_mgmt_vss_3_signals"),
    task_stealSide_vss_axi_full_3_signals_("task_stealSide_vss_axi_full_3_signals"),
    task_stealSide_axi_mgmt_vss_4_signals_("task_stealSide_axi_mgmt_vss_4_signals"),
    task_stealSide_vss_axi_full_4_signals_("task_stealSide_vss_axi_full_4_signals"),
    task_stealSide_axi_mgmt_vss_5_signals_("task_stealSide_axi_mgmt_vss_5_signals"),
    task_stealSide_vss_axi_full_5_signals_("task_stealSide_vss_axi_full_5_signals"),
    task_stealSide_taskOut_0_bridge_("task_stealSide_taskOut_0_bridge"),
    task_stealSide_taskOut_1_bridge_("task_stealSide_taskOut_1_bridge"),
    task_stealSide_taskOut_2_bridge_("task_stealSide_taskOut_2_bridge"),
    task_stealSide_taskOut_3_bridge_("task_stealSide_taskOut_3_bridge"),
    task_stealSide_taskOut_4_bridge_("task_stealSide_taskOut_4_bridge"),
    task_stealSide_taskOut_5_bridge_("task_stealSide_taskOut_5_bridge"),
    task_stealSide_taskOut_6_bridge_("task_stealSide_taskOut_6_bridge"),
    task_stealSide_taskOut_7_bridge_("task_stealSide_taskOut_7_bridge"),
    task_stealSide_taskOut_8_bridge_("task_stealSide_taskOut_8_bridge"),
    task_stealSide_taskOut_9_bridge_("task_stealSide_taskOut_9_bridge"),
    task_stealSide_taskOut_10_bridge_("task_stealSide_taskOut_10_bridge"),
    task_stealSide_taskOut_11_bridge_("task_stealSide_taskOut_11_bridge"),
    task_stealSide_taskOut_12_bridge_("task_stealSide_taskOut_12_bridge"),
    task_stealSide_taskOut_13_bridge_("task_stealSide_taskOut_13_bridge"),
    task_stealSide_taskOut_14_bridge_("task_stealSide_taskOut_14_bridge"),
    task_stealSide_taskOut_15_bridge_("task_stealSide_taskOut_15_bridge"),
    task_stealSide_taskIn_0_bridge_("task_stealSide_taskIn_0_bridge"),
    task_stealSide_taskIn_1_bridge_("task_stealSide_taskIn_1_bridge"),
    task_stealSide_taskIn_2_bridge_("task_stealSide_taskIn_2_bridge"),
    task_stealSide_taskIn_3_bridge_("task_stealSide_taskIn_3_bridge"),
    task_stealSide_taskIn_4_bridge_("task_stealSide_taskIn_4_bridge"),
    task_stealSide_taskIn_5_bridge_("task_stealSide_taskIn_5_bridge"),
    task_stealSide_taskIn_6_bridge_("task_stealSide_taskIn_6_bridge"),
    task_stealSide_taskIn_7_bridge_("task_stealSide_taskIn_7_bridge"),
    task_stealSide_taskIn_8_bridge_("task_stealSide_taskIn_8_bridge"),
    task_stealSide_taskIn_9_bridge_("task_stealSide_taskIn_9_bridge"),
    task_stealSide_taskIn_10_bridge_("task_stealSide_taskIn_10_bridge"),
    task_stealSide_taskIn_11_bridge_("task_stealSide_taskIn_11_bridge"),
    task_stealSide_taskIn_12_bridge_("task_stealSide_taskIn_12_bridge"),
    task_stealSide_taskIn_13_bridge_("task_stealSide_taskIn_13_bridge"),
    task_stealSide_taskIn_14_bridge_("task_stealSide_taskIn_14_bridge"),
    task_stealSide_taskIn_15_bridge_("task_stealSide_taskIn_15_bridge"),
    task_stealSide_axi_mgmt_vss_0_bridge_("task_stealSide_axi_mgmt_vss_0_bridge"),
    task_stealSide_vss_axi_full_0_bridge_("task_stealSide_vss_axi_full_0_bridge"),
    task_stealSide_axi_mgmt_vss_1_bridge_("task_stealSide_axi_mgmt_vss_1_bridge"),
    task_stealSide_vss_axi_full_1_bridge_("task_stealSide_vss_axi_full_1_bridge"),
    task_stealSide_axi_mgmt_vss_2_bridge_("task_stealSide_axi_mgmt_vss_2_bridge"),
    task_stealSide_vss_axi_full_2_bridge_("task_stealSide_vss_axi_full_2_bridge"),
    task_stealSide_axi_mgmt_vss_3_bridge_("task_stealSide_axi_mgmt_vss_3_bridge"),
    task_stealSide_vss_axi_full_3_bridge_("task_stealSide_vss_axi_full_3_bridge"),
    task_stealSide_axi_mgmt_vss_4_bridge_("task_stealSide_axi_mgmt_vss_4_bridge"),
    task_stealSide_vss_axi_full_4_bridge_("task_stealSide_vss_axi_full_4_bridge"),
    task_stealSide_axi_mgmt_vss_5_bridge_("task_stealSide_axi_mgmt_vss_5_bridge"),
    task_stealSide_vss_axi_full_5_bridge_("task_stealSide_vss_axi_full_5_bridge")
    
{
    do_connect_();

    /* initialize the map for accessing TLM sockets */
    sockets_["task_stealSide_taskOut_0"] = &task_stealSide_taskOut_0_bridge_.socket;
    sockets_["task_stealSide_taskOut_1"] = &task_stealSide_taskOut_1_bridge_.socket;
    sockets_["task_stealSide_taskOut_2"] = &task_stealSide_taskOut_2_bridge_.socket;
    sockets_["task_stealSide_taskOut_3"] = &task_stealSide_taskOut_3_bridge_.socket;
    sockets_["task_stealSide_taskOut_4"] = &task_stealSide_taskOut_4_bridge_.socket;
    sockets_["task_stealSide_taskOut_5"] = &task_stealSide_taskOut_5_bridge_.socket;
    sockets_["task_stealSide_taskOut_6"] = &task_stealSide_taskOut_6_bridge_.socket;
    sockets_["task_stealSide_taskOut_7"] = &task_stealSide_taskOut_7_bridge_.socket;
    sockets_["task_stealSide_taskOut_8"] = &task_stealSide_taskOut_8_bridge_.socket;
    sockets_["task_stealSide_taskOut_9"] = &task_stealSide_taskOut_9_bridge_.socket;
    sockets_["task_stealSide_taskOut_10"] = &task_stealSide_taskOut_10_bridge_.socket;
    sockets_["task_stealSide_taskOut_11"] = &task_stealSide_taskOut_11_bridge_.socket;
    sockets_["task_stealSide_taskOut_12"] = &task_stealSide_taskOut_12_bridge_.socket;
    sockets_["task_stealSide_taskOut_13"] = &task_stealSide_taskOut_13_bridge_.socket;
    sockets_["task_stealSide_taskOut_14"] = &task_stealSide_taskOut_14_bridge_.socket;
    sockets_["task_stealSide_taskOut_15"] = &task_stealSide_taskOut_15_bridge_.socket;
    sockets_["task_stealSide_taskIn_0"] = &task_stealSide_taskIn_0_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_1"] = &task_stealSide_taskIn_1_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_2"] = &task_stealSide_taskIn_2_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_3"] = &task_stealSide_taskIn_3_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_4"] = &task_stealSide_taskIn_4_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_5"] = &task_stealSide_taskIn_5_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_6"] = &task_stealSide_taskIn_6_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_7"] = &task_stealSide_taskIn_7_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_8"] = &task_stealSide_taskIn_8_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_9"] = &task_stealSide_taskIn_9_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_10"] = &task_stealSide_taskIn_10_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_11"] = &task_stealSide_taskIn_11_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_12"] = &task_stealSide_taskIn_12_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_13"] = &task_stealSide_taskIn_13_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_14"] = &task_stealSide_taskIn_14_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_15"] = &task_stealSide_taskIn_15_bridge_.tgt_socket;
    sockets_["task_stealSide_axi_mgmt_vss_0"] = &task_stealSide_axi_mgmt_vss_0_bridge_.tgt_socket;
    sockets_["task_stealSide_vss_axi_full_0"] = &task_stealSide_vss_axi_full_0_bridge_.socket;
    sockets_["task_stealSide_axi_mgmt_vss_1"] = &task_stealSide_axi_mgmt_vss_1_bridge_.tgt_socket;
    sockets_["task_stealSide_vss_axi_full_1"] = &task_stealSide_vss_axi_full_1_bridge_.socket;
    sockets_["task_stealSide_axi_mgmt_vss_2"] = &task_stealSide_axi_mgmt_vss_2_bridge_.tgt_socket;
    sockets_["task_stealSide_vss_axi_full_2"] = &task_stealSide_vss_axi_full_2_bridge_.socket;
    sockets_["task_stealSide_axi_mgmt_vss_3"] = &task_stealSide_axi_mgmt_vss_3_bridge_.tgt_socket;
    sockets_["task_stealSide_vss_axi_full_3"] = &task_stealSide_vss_axi_full_3_bridge_.socket;
    sockets_["task_stealSide_axi_mgmt_vss_4"] = &task_stealSide_axi_mgmt_vss_4_bridge_.tgt_socket;
    sockets_["task_stealSide_vss_axi_full_4"] = &task_stealSide_vss_axi_full_4_bridge_.socket;
    sockets_["task_stealSide_axi_mgmt_vss_5"] = &task_stealSide_axi_mgmt_vss_5_bridge_.tgt_socket;
    sockets_["task_stealSide_vss_axi_full_5"] = &task_stealSide_vss_axi_full_5_bridge_.socket;

    /* thread that generates the ACTIVE_LOW reset signal */
    SC_THREAD(reset_n_generate_);
    sensitive << reset;

    do_init_();
}


void paper_exp1__peCount_16__vssNumber_6::reset_n_generate_()
{
    reset_n_.write(!reset.read());
}

void paper_exp1__peCount_16__vssNumber_6::do_connect_()
{
    /* initialize bridges */
    task_stealSide_taskOut_0_bridge_.clk(clock);
    task_stealSide_taskOut_0_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_1_bridge_.clk(clock);
    task_stealSide_taskOut_1_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_2_bridge_.clk(clock);
    task_stealSide_taskOut_2_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_3_bridge_.clk(clock);
    task_stealSide_taskOut_3_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_4_bridge_.clk(clock);
    task_stealSide_taskOut_4_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_5_bridge_.clk(clock);
    task_stealSide_taskOut_5_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_6_bridge_.clk(clock);
    task_stealSide_taskOut_6_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_7_bridge_.clk(clock);
    task_stealSide_taskOut_7_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_8_bridge_.clk(clock);
    task_stealSide_taskOut_8_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_9_bridge_.clk(clock);
    task_stealSide_taskOut_9_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_10_bridge_.clk(clock);
    task_stealSide_taskOut_10_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_11_bridge_.clk(clock);
    task_stealSide_taskOut_11_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_12_bridge_.clk(clock);
    task_stealSide_taskOut_12_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_13_bridge_.clk(clock);
    task_stealSide_taskOut_13_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_14_bridge_.clk(clock);
    task_stealSide_taskOut_14_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_15_bridge_.clk(clock);
    task_stealSide_taskOut_15_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_0_bridge_.clk(clock);
    task_stealSide_taskIn_0_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_1_bridge_.clk(clock);
    task_stealSide_taskIn_1_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_2_bridge_.clk(clock);
    task_stealSide_taskIn_2_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_3_bridge_.clk(clock);
    task_stealSide_taskIn_3_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_4_bridge_.clk(clock);
    task_stealSide_taskIn_4_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_5_bridge_.clk(clock);
    task_stealSide_taskIn_5_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_6_bridge_.clk(clock);
    task_stealSide_taskIn_6_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_7_bridge_.clk(clock);
    task_stealSide_taskIn_7_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_8_bridge_.clk(clock);
    task_stealSide_taskIn_8_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_9_bridge_.clk(clock);
    task_stealSide_taskIn_9_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_10_bridge_.clk(clock);
    task_stealSide_taskIn_10_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_11_bridge_.clk(clock);
    task_stealSide_taskIn_11_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_12_bridge_.clk(clock);
    task_stealSide_taskIn_12_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_13_bridge_.clk(clock);
    task_stealSide_taskIn_13_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_14_bridge_.clk(clock);
    task_stealSide_taskIn_14_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_15_bridge_.clk(clock);
    task_stealSide_taskIn_15_bridge_.resetn(reset_n_);
    
    task_stealSide_axi_mgmt_vss_0_bridge_.clk(clock);
    task_stealSide_axi_mgmt_vss_0_bridge_.resetn(reset_n_);
    
    task_stealSide_vss_axi_full_0_bridge_.clk(clock);
    task_stealSide_vss_axi_full_0_bridge_.resetn(reset_n_);
    
    task_stealSide_axi_mgmt_vss_1_bridge_.clk(clock);
    task_stealSide_axi_mgmt_vss_1_bridge_.resetn(reset_n_);
    
    task_stealSide_vss_axi_full_1_bridge_.clk(clock);
    task_stealSide_vss_axi_full_1_bridge_.resetn(reset_n_);
    
    task_stealSide_axi_mgmt_vss_2_bridge_.clk(clock);
    task_stealSide_axi_mgmt_vss_2_bridge_.resetn(reset_n_);
    
    task_stealSide_vss_axi_full_2_bridge_.clk(clock);
    task_stealSide_vss_axi_full_2_bridge_.resetn(reset_n_);
    
    task_stealSide_axi_mgmt_vss_3_bridge_.clk(clock);
    task_stealSide_axi_mgmt_vss_3_bridge_.resetn(reset_n_);
    
    task_stealSide_vss_axi_full_3_bridge_.clk(clock);
    task_stealSide_vss_axi_full_3_bridge_.resetn(reset_n_);
    
    task_stealSide_axi_mgmt_vss_4_bridge_.clk(clock);
    task_stealSide_axi_mgmt_vss_4_bridge_.resetn(reset_n_);
    
    task_stealSide_vss_axi_full_4_bridge_.clk(clock);
    task_stealSide_vss_axi_full_4_bridge_.resetn(reset_n_);
    
    task_stealSide_axi_mgmt_vss_5_bridge_.clk(clock);
    task_stealSide_axi_mgmt_vss_5_bridge_.resetn(reset_n_);
    
    task_stealSide_vss_axi_full_5_bridge_.clk(clock);
    task_stealSide_vss_axi_full_5_bridge_.resetn(reset_n_);
    


    /* connect bridges */
    task_stealSide_taskOut_0_signals_.connect(task_stealSide_taskOut_0_bridge_);
    task_stealSide_taskOut_1_signals_.connect(task_stealSide_taskOut_1_bridge_);
    task_stealSide_taskOut_2_signals_.connect(task_stealSide_taskOut_2_bridge_);
    task_stealSide_taskOut_3_signals_.connect(task_stealSide_taskOut_3_bridge_);
    task_stealSide_taskOut_4_signals_.connect(task_stealSide_taskOut_4_bridge_);
    task_stealSide_taskOut_5_signals_.connect(task_stealSide_taskOut_5_bridge_);
    task_stealSide_taskOut_6_signals_.connect(task_stealSide_taskOut_6_bridge_);
    task_stealSide_taskOut_7_signals_.connect(task_stealSide_taskOut_7_bridge_);
    task_stealSide_taskOut_8_signals_.connect(task_stealSide_taskOut_8_bridge_);
    task_stealSide_taskOut_9_signals_.connect(task_stealSide_taskOut_9_bridge_);
    task_stealSide_taskOut_10_signals_.connect(task_stealSide_taskOut_10_bridge_);
    task_stealSide_taskOut_11_signals_.connect(task_stealSide_taskOut_11_bridge_);
    task_stealSide_taskOut_12_signals_.connect(task_stealSide_taskOut_12_bridge_);
    task_stealSide_taskOut_13_signals_.connect(task_stealSide_taskOut_13_bridge_);
    task_stealSide_taskOut_14_signals_.connect(task_stealSide_taskOut_14_bridge_);
    task_stealSide_taskOut_15_signals_.connect(task_stealSide_taskOut_15_bridge_);
    task_stealSide_taskIn_0_signals_.connect(task_stealSide_taskIn_0_bridge_);
    task_stealSide_taskIn_1_signals_.connect(task_stealSide_taskIn_1_bridge_);
    task_stealSide_taskIn_2_signals_.connect(task_stealSide_taskIn_2_bridge_);
    task_stealSide_taskIn_3_signals_.connect(task_stealSide_taskIn_3_bridge_);
    task_stealSide_taskIn_4_signals_.connect(task_stealSide_taskIn_4_bridge_);
    task_stealSide_taskIn_5_signals_.connect(task_stealSide_taskIn_5_bridge_);
    task_stealSide_taskIn_6_signals_.connect(task_stealSide_taskIn_6_bridge_);
    task_stealSide_taskIn_7_signals_.connect(task_stealSide_taskIn_7_bridge_);
    task_stealSide_taskIn_8_signals_.connect(task_stealSide_taskIn_8_bridge_);
    task_stealSide_taskIn_9_signals_.connect(task_stealSide_taskIn_9_bridge_);
    task_stealSide_taskIn_10_signals_.connect(task_stealSide_taskIn_10_bridge_);
    task_stealSide_taskIn_11_signals_.connect(task_stealSide_taskIn_11_bridge_);
    task_stealSide_taskIn_12_signals_.connect(task_stealSide_taskIn_12_bridge_);
    task_stealSide_taskIn_13_signals_.connect(task_stealSide_taskIn_13_bridge_);
    task_stealSide_taskIn_14_signals_.connect(task_stealSide_taskIn_14_bridge_);
    task_stealSide_taskIn_15_signals_.connect(task_stealSide_taskIn_15_bridge_);
    task_stealSide_axi_mgmt_vss_0_signals_.connect(task_stealSide_axi_mgmt_vss_0_bridge_);
    task_stealSide_vss_axi_full_0_signals_.connect(task_stealSide_vss_axi_full_0_bridge_);
    task_stealSide_axi_mgmt_vss_1_signals_.connect(task_stealSide_axi_mgmt_vss_1_bridge_);
    task_stealSide_vss_axi_full_1_signals_.connect(task_stealSide_vss_axi_full_1_bridge_);
    task_stealSide_axi_mgmt_vss_2_signals_.connect(task_stealSide_axi_mgmt_vss_2_bridge_);
    task_stealSide_vss_axi_full_2_signals_.connect(task_stealSide_vss_axi_full_2_bridge_);
    task_stealSide_axi_mgmt_vss_3_signals_.connect(task_stealSide_axi_mgmt_vss_3_bridge_);
    task_stealSide_vss_axi_full_3_signals_.connect(task_stealSide_vss_axi_full_3_bridge_);
    task_stealSide_axi_mgmt_vss_4_signals_.connect(task_stealSide_axi_mgmt_vss_4_bridge_);
    task_stealSide_vss_axi_full_4_signals_.connect(task_stealSide_vss_axi_full_4_bridge_);
    task_stealSide_axi_mgmt_vss_5_signals_.connect(task_stealSide_axi_mgmt_vss_5_bridge_);
    task_stealSide_vss_axi_full_5_signals_.connect(task_stealSide_vss_axi_full_5_bridge_);


    /* connect signals */
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_0 */
    /* is_slave = False */
    task_stealSide_taskOut_0_TREADY(task_stealSide_taskOut_0_signals_.tready);
    task_stealSide_taskOut_0_TVALID(task_stealSide_taskOut_0_signals_.tvalid);
    task_stealSide_taskOut_0_TDATA(task_stealSide_taskOut_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_1 */
    /* is_slave = False */
    task_stealSide_taskOut_1_TREADY(task_stealSide_taskOut_1_signals_.tready);
    task_stealSide_taskOut_1_TVALID(task_stealSide_taskOut_1_signals_.tvalid);
    task_stealSide_taskOut_1_TDATA(task_stealSide_taskOut_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_2 */
    /* is_slave = False */
    task_stealSide_taskOut_2_TREADY(task_stealSide_taskOut_2_signals_.tready);
    task_stealSide_taskOut_2_TVALID(task_stealSide_taskOut_2_signals_.tvalid);
    task_stealSide_taskOut_2_TDATA(task_stealSide_taskOut_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_3 */
    /* is_slave = False */
    task_stealSide_taskOut_3_TREADY(task_stealSide_taskOut_3_signals_.tready);
    task_stealSide_taskOut_3_TVALID(task_stealSide_taskOut_3_signals_.tvalid);
    task_stealSide_taskOut_3_TDATA(task_stealSide_taskOut_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_4 */
    /* is_slave = False */
    task_stealSide_taskOut_4_TREADY(task_stealSide_taskOut_4_signals_.tready);
    task_stealSide_taskOut_4_TVALID(task_stealSide_taskOut_4_signals_.tvalid);
    task_stealSide_taskOut_4_TDATA(task_stealSide_taskOut_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_5 */
    /* is_slave = False */
    task_stealSide_taskOut_5_TREADY(task_stealSide_taskOut_5_signals_.tready);
    task_stealSide_taskOut_5_TVALID(task_stealSide_taskOut_5_signals_.tvalid);
    task_stealSide_taskOut_5_TDATA(task_stealSide_taskOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_6 */
    /* is_slave = False */
    task_stealSide_taskOut_6_TREADY(task_stealSide_taskOut_6_signals_.tready);
    task_stealSide_taskOut_6_TVALID(task_stealSide_taskOut_6_signals_.tvalid);
    task_stealSide_taskOut_6_TDATA(task_stealSide_taskOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_7 */
    /* is_slave = False */
    task_stealSide_taskOut_7_TREADY(task_stealSide_taskOut_7_signals_.tready);
    task_stealSide_taskOut_7_TVALID(task_stealSide_taskOut_7_signals_.tvalid);
    task_stealSide_taskOut_7_TDATA(task_stealSide_taskOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_8 */
    /* is_slave = False */
    task_stealSide_taskOut_8_TREADY(task_stealSide_taskOut_8_signals_.tready);
    task_stealSide_taskOut_8_TVALID(task_stealSide_taskOut_8_signals_.tvalid);
    task_stealSide_taskOut_8_TDATA(task_stealSide_taskOut_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_9 */
    /* is_slave = False */
    task_stealSide_taskOut_9_TREADY(task_stealSide_taskOut_9_signals_.tready);
    task_stealSide_taskOut_9_TVALID(task_stealSide_taskOut_9_signals_.tvalid);
    task_stealSide_taskOut_9_TDATA(task_stealSide_taskOut_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_10 */
    /* is_slave = False */
    task_stealSide_taskOut_10_TREADY(task_stealSide_taskOut_10_signals_.tready);
    task_stealSide_taskOut_10_TVALID(task_stealSide_taskOut_10_signals_.tvalid);
    task_stealSide_taskOut_10_TDATA(task_stealSide_taskOut_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_11 */
    /* is_slave = False */
    task_stealSide_taskOut_11_TREADY(task_stealSide_taskOut_11_signals_.tready);
    task_stealSide_taskOut_11_TVALID(task_stealSide_taskOut_11_signals_.tvalid);
    task_stealSide_taskOut_11_TDATA(task_stealSide_taskOut_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_12 */
    /* is_slave = False */
    task_stealSide_taskOut_12_TREADY(task_stealSide_taskOut_12_signals_.tready);
    task_stealSide_taskOut_12_TVALID(task_stealSide_taskOut_12_signals_.tvalid);
    task_stealSide_taskOut_12_TDATA(task_stealSide_taskOut_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_13 */
    /* is_slave = False */
    task_stealSide_taskOut_13_TREADY(task_stealSide_taskOut_13_signals_.tready);
    task_stealSide_taskOut_13_TVALID(task_stealSide_taskOut_13_signals_.tvalid);
    task_stealSide_taskOut_13_TDATA(task_stealSide_taskOut_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_14 */
    /* is_slave = False */
    task_stealSide_taskOut_14_TREADY(task_stealSide_taskOut_14_signals_.tready);
    task_stealSide_taskOut_14_TVALID(task_stealSide_taskOut_14_signals_.tvalid);
    task_stealSide_taskOut_14_TDATA(task_stealSide_taskOut_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_15 */
    /* is_slave = False */
    task_stealSide_taskOut_15_TREADY(task_stealSide_taskOut_15_signals_.tready);
    task_stealSide_taskOut_15_TVALID(task_stealSide_taskOut_15_signals_.tvalid);
    task_stealSide_taskOut_15_TDATA(task_stealSide_taskOut_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_0 */
    /* is_slave = True */
    task_stealSide_taskIn_0_TREADY(task_stealSide_taskIn_0_signals_.tready);
    task_stealSide_taskIn_0_TVALID(task_stealSide_taskIn_0_signals_.tvalid);
    task_stealSide_taskIn_0_TDATA(task_stealSide_taskIn_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_1 */
    /* is_slave = True */
    task_stealSide_taskIn_1_TREADY(task_stealSide_taskIn_1_signals_.tready);
    task_stealSide_taskIn_1_TVALID(task_stealSide_taskIn_1_signals_.tvalid);
    task_stealSide_taskIn_1_TDATA(task_stealSide_taskIn_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_2 */
    /* is_slave = True */
    task_stealSide_taskIn_2_TREADY(task_stealSide_taskIn_2_signals_.tready);
    task_stealSide_taskIn_2_TVALID(task_stealSide_taskIn_2_signals_.tvalid);
    task_stealSide_taskIn_2_TDATA(task_stealSide_taskIn_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_3 */
    /* is_slave = True */
    task_stealSide_taskIn_3_TREADY(task_stealSide_taskIn_3_signals_.tready);
    task_stealSide_taskIn_3_TVALID(task_stealSide_taskIn_3_signals_.tvalid);
    task_stealSide_taskIn_3_TDATA(task_stealSide_taskIn_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_4 */
    /* is_slave = True */
    task_stealSide_taskIn_4_TREADY(task_stealSide_taskIn_4_signals_.tready);
    task_stealSide_taskIn_4_TVALID(task_stealSide_taskIn_4_signals_.tvalid);
    task_stealSide_taskIn_4_TDATA(task_stealSide_taskIn_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_5 */
    /* is_slave = True */
    task_stealSide_taskIn_5_TREADY(task_stealSide_taskIn_5_signals_.tready);
    task_stealSide_taskIn_5_TVALID(task_stealSide_taskIn_5_signals_.tvalid);
    task_stealSide_taskIn_5_TDATA(task_stealSide_taskIn_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_6 */
    /* is_slave = True */
    task_stealSide_taskIn_6_TREADY(task_stealSide_taskIn_6_signals_.tready);
    task_stealSide_taskIn_6_TVALID(task_stealSide_taskIn_6_signals_.tvalid);
    task_stealSide_taskIn_6_TDATA(task_stealSide_taskIn_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_7 */
    /* is_slave = True */
    task_stealSide_taskIn_7_TREADY(task_stealSide_taskIn_7_signals_.tready);
    task_stealSide_taskIn_7_TVALID(task_stealSide_taskIn_7_signals_.tvalid);
    task_stealSide_taskIn_7_TDATA(task_stealSide_taskIn_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_8 */
    /* is_slave = True */
    task_stealSide_taskIn_8_TREADY(task_stealSide_taskIn_8_signals_.tready);
    task_stealSide_taskIn_8_TVALID(task_stealSide_taskIn_8_signals_.tvalid);
    task_stealSide_taskIn_8_TDATA(task_stealSide_taskIn_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_9 */
    /* is_slave = True */
    task_stealSide_taskIn_9_TREADY(task_stealSide_taskIn_9_signals_.tready);
    task_stealSide_taskIn_9_TVALID(task_stealSide_taskIn_9_signals_.tvalid);
    task_stealSide_taskIn_9_TDATA(task_stealSide_taskIn_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_10 */
    /* is_slave = True */
    task_stealSide_taskIn_10_TREADY(task_stealSide_taskIn_10_signals_.tready);
    task_stealSide_taskIn_10_TVALID(task_stealSide_taskIn_10_signals_.tvalid);
    task_stealSide_taskIn_10_TDATA(task_stealSide_taskIn_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_11 */
    /* is_slave = True */
    task_stealSide_taskIn_11_TREADY(task_stealSide_taskIn_11_signals_.tready);
    task_stealSide_taskIn_11_TVALID(task_stealSide_taskIn_11_signals_.tvalid);
    task_stealSide_taskIn_11_TDATA(task_stealSide_taskIn_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_12 */
    /* is_slave = True */
    task_stealSide_taskIn_12_TREADY(task_stealSide_taskIn_12_signals_.tready);
    task_stealSide_taskIn_12_TVALID(task_stealSide_taskIn_12_signals_.tvalid);
    task_stealSide_taskIn_12_TDATA(task_stealSide_taskIn_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_13 */
    /* is_slave = True */
    task_stealSide_taskIn_13_TREADY(task_stealSide_taskIn_13_signals_.tready);
    task_stealSide_taskIn_13_TVALID(task_stealSide_taskIn_13_signals_.tvalid);
    task_stealSide_taskIn_13_TDATA(task_stealSide_taskIn_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_14 */
    /* is_slave = True */
    task_stealSide_taskIn_14_TREADY(task_stealSide_taskIn_14_signals_.tready);
    task_stealSide_taskIn_14_TVALID(task_stealSide_taskIn_14_signals_.tvalid);
    task_stealSide_taskIn_14_TDATA(task_stealSide_taskIn_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_15 */
    /* is_slave = True */
    task_stealSide_taskIn_15_TREADY(task_stealSide_taskIn_15_signals_.tready);
    task_stealSide_taskIn_15_TVALID(task_stealSide_taskIn_15_signals_.tvalid);
    task_stealSide_taskIn_15_TDATA(task_stealSide_taskIn_15_signals_.tdata);
    
    
    /* connecting AXI4-Lite interface with name: task_stealSide_axi_mgmt_vss_0 */
    /* is_slave = True */
    task_stealSide_axi_mgmt_vss_0_AWVALID(task_stealSide_axi_mgmt_vss_0_signals_.awvalid);
    task_stealSide_axi_mgmt_vss_0_AWREADY(task_stealSide_axi_mgmt_vss_0_signals_.awready);
    task_stealSide_axi_mgmt_vss_0_AWADDR(task_stealSide_axi_mgmt_vss_0_signals_.awaddr);
    task_stealSide_axi_mgmt_vss_0_AWPROT(task_stealSide_axi_mgmt_vss_0_signals_.awprot);
    task_stealSide_axi_mgmt_vss_0_WVALID(task_stealSide_axi_mgmt_vss_0_signals_.wvalid);
    task_stealSide_axi_mgmt_vss_0_WREADY(task_stealSide_axi_mgmt_vss_0_signals_.wready);
    task_stealSide_axi_mgmt_vss_0_WDATA(task_stealSide_axi_mgmt_vss_0_signals_.wdata);
    task_stealSide_axi_mgmt_vss_0_WSTRB(task_stealSide_axi_mgmt_vss_0_signals_.wstrb);
    task_stealSide_axi_mgmt_vss_0_BVALID(task_stealSide_axi_mgmt_vss_0_signals_.bvalid);
    task_stealSide_axi_mgmt_vss_0_BREADY(task_stealSide_axi_mgmt_vss_0_signals_.bready);
    task_stealSide_axi_mgmt_vss_0_BRESP(task_stealSide_axi_mgmt_vss_0_signals_.bresp);
    task_stealSide_axi_mgmt_vss_0_ARVALID(task_stealSide_axi_mgmt_vss_0_signals_.arvalid);
    task_stealSide_axi_mgmt_vss_0_ARREADY(task_stealSide_axi_mgmt_vss_0_signals_.arready);
    task_stealSide_axi_mgmt_vss_0_ARADDR(task_stealSide_axi_mgmt_vss_0_signals_.araddr);
    task_stealSide_axi_mgmt_vss_0_ARPROT(task_stealSide_axi_mgmt_vss_0_signals_.arprot);
    task_stealSide_axi_mgmt_vss_0_RVALID(task_stealSide_axi_mgmt_vss_0_signals_.rvalid);
    task_stealSide_axi_mgmt_vss_0_RREADY(task_stealSide_axi_mgmt_vss_0_signals_.rready);
    task_stealSide_axi_mgmt_vss_0_RDATA(task_stealSide_axi_mgmt_vss_0_signals_.rdata);
    task_stealSide_axi_mgmt_vss_0_RRESP(task_stealSide_axi_mgmt_vss_0_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task_stealSide_vss_axi_full_0 */
    /* is_slave = False */
    task_stealSide_vss_axi_full_0_AWVALID(task_stealSide_vss_axi_full_0_signals_.awvalid);
    task_stealSide_vss_axi_full_0_AWREADY(task_stealSide_vss_axi_full_0_signals_.awready);
    task_stealSide_vss_axi_full_0_AWADDR(task_stealSide_vss_axi_full_0_signals_.awaddr);
    task_stealSide_vss_axi_full_0_AWPROT(task_stealSide_vss_axi_full_0_signals_.awprot);
    task_stealSide_vss_axi_full_0_AWREGION(task_stealSide_vss_axi_full_0_signals_.awregion);
    task_stealSide_vss_axi_full_0_AWQOS(task_stealSide_vss_axi_full_0_signals_.awqos);
    task_stealSide_vss_axi_full_0_AWCACHE(task_stealSide_vss_axi_full_0_signals_.awcache);
    task_stealSide_vss_axi_full_0_AWBURST(task_stealSide_vss_axi_full_0_signals_.awburst);
    task_stealSide_vss_axi_full_0_AWSIZE(task_stealSide_vss_axi_full_0_signals_.awsize);
    task_stealSide_vss_axi_full_0_AWLEN(task_stealSide_vss_axi_full_0_signals_.awlen);
    task_stealSide_vss_axi_full_0_AWID(task_stealSide_vss_axi_full_0_signals_.awid);
    task_stealSide_vss_axi_full_0_AWLOCK(task_stealSide_vss_axi_full_0_signals_.awlock);
    task_stealSide_vss_axi_full_0_WID(task_stealSide_vss_axi_full_0_signals_.wid);
    task_stealSide_vss_axi_full_0_WVALID(task_stealSide_vss_axi_full_0_signals_.wvalid);
    task_stealSide_vss_axi_full_0_WREADY(task_stealSide_vss_axi_full_0_signals_.wready);
    task_stealSide_vss_axi_full_0_WDATA(task_stealSide_vss_axi_full_0_signals_.wdata);
    task_stealSide_vss_axi_full_0_WSTRB(task_stealSide_vss_axi_full_0_signals_.wstrb);
    task_stealSide_vss_axi_full_0_WLAST(task_stealSide_vss_axi_full_0_signals_.wlast);
    task_stealSide_vss_axi_full_0_BVALID(task_stealSide_vss_axi_full_0_signals_.bvalid);
    task_stealSide_vss_axi_full_0_BREADY(task_stealSide_vss_axi_full_0_signals_.bready);
    task_stealSide_vss_axi_full_0_BRESP(task_stealSide_vss_axi_full_0_signals_.bresp);
    task_stealSide_vss_axi_full_0_BID(task_stealSide_vss_axi_full_0_signals_.bid);
    task_stealSide_vss_axi_full_0_ARVALID(task_stealSide_vss_axi_full_0_signals_.arvalid);
    task_stealSide_vss_axi_full_0_ARREADY(task_stealSide_vss_axi_full_0_signals_.arready);
    task_stealSide_vss_axi_full_0_ARADDR(task_stealSide_vss_axi_full_0_signals_.araddr);
    task_stealSide_vss_axi_full_0_ARPROT(task_stealSide_vss_axi_full_0_signals_.arprot);
    task_stealSide_vss_axi_full_0_ARREGION(task_stealSide_vss_axi_full_0_signals_.arregion);
    task_stealSide_vss_axi_full_0_ARQOS(task_stealSide_vss_axi_full_0_signals_.arqos);
    task_stealSide_vss_axi_full_0_ARCACHE(task_stealSide_vss_axi_full_0_signals_.arcache);
    task_stealSide_vss_axi_full_0_ARBURST(task_stealSide_vss_axi_full_0_signals_.arburst);
    task_stealSide_vss_axi_full_0_ARSIZE(task_stealSide_vss_axi_full_0_signals_.arsize);
    task_stealSide_vss_axi_full_0_ARLEN(task_stealSide_vss_axi_full_0_signals_.arlen);
    task_stealSide_vss_axi_full_0_ARID(task_stealSide_vss_axi_full_0_signals_.arid);
    task_stealSide_vss_axi_full_0_ARLOCK(task_stealSide_vss_axi_full_0_signals_.arlock);
    task_stealSide_vss_axi_full_0_RVALID(task_stealSide_vss_axi_full_0_signals_.rvalid);
    task_stealSide_vss_axi_full_0_RREADY(task_stealSide_vss_axi_full_0_signals_.rready);
    task_stealSide_vss_axi_full_0_RDATA(task_stealSide_vss_axi_full_0_signals_.rdata);
    task_stealSide_vss_axi_full_0_RRESP(task_stealSide_vss_axi_full_0_signals_.rresp);
    task_stealSide_vss_axi_full_0_RID(task_stealSide_vss_axi_full_0_signals_.rid);
    task_stealSide_vss_axi_full_0_RLAST(task_stealSide_vss_axi_full_0_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task_stealSide_axi_mgmt_vss_1 */
    /* is_slave = True */
    task_stealSide_axi_mgmt_vss_1_AWVALID(task_stealSide_axi_mgmt_vss_1_signals_.awvalid);
    task_stealSide_axi_mgmt_vss_1_AWREADY(task_stealSide_axi_mgmt_vss_1_signals_.awready);
    task_stealSide_axi_mgmt_vss_1_AWADDR(task_stealSide_axi_mgmt_vss_1_signals_.awaddr);
    task_stealSide_axi_mgmt_vss_1_AWPROT(task_stealSide_axi_mgmt_vss_1_signals_.awprot);
    task_stealSide_axi_mgmt_vss_1_WVALID(task_stealSide_axi_mgmt_vss_1_signals_.wvalid);
    task_stealSide_axi_mgmt_vss_1_WREADY(task_stealSide_axi_mgmt_vss_1_signals_.wready);
    task_stealSide_axi_mgmt_vss_1_WDATA(task_stealSide_axi_mgmt_vss_1_signals_.wdata);
    task_stealSide_axi_mgmt_vss_1_WSTRB(task_stealSide_axi_mgmt_vss_1_signals_.wstrb);
    task_stealSide_axi_mgmt_vss_1_BVALID(task_stealSide_axi_mgmt_vss_1_signals_.bvalid);
    task_stealSide_axi_mgmt_vss_1_BREADY(task_stealSide_axi_mgmt_vss_1_signals_.bready);
    task_stealSide_axi_mgmt_vss_1_BRESP(task_stealSide_axi_mgmt_vss_1_signals_.bresp);
    task_stealSide_axi_mgmt_vss_1_ARVALID(task_stealSide_axi_mgmt_vss_1_signals_.arvalid);
    task_stealSide_axi_mgmt_vss_1_ARREADY(task_stealSide_axi_mgmt_vss_1_signals_.arready);
    task_stealSide_axi_mgmt_vss_1_ARADDR(task_stealSide_axi_mgmt_vss_1_signals_.araddr);
    task_stealSide_axi_mgmt_vss_1_ARPROT(task_stealSide_axi_mgmt_vss_1_signals_.arprot);
    task_stealSide_axi_mgmt_vss_1_RVALID(task_stealSide_axi_mgmt_vss_1_signals_.rvalid);
    task_stealSide_axi_mgmt_vss_1_RREADY(task_stealSide_axi_mgmt_vss_1_signals_.rready);
    task_stealSide_axi_mgmt_vss_1_RDATA(task_stealSide_axi_mgmt_vss_1_signals_.rdata);
    task_stealSide_axi_mgmt_vss_1_RRESP(task_stealSide_axi_mgmt_vss_1_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task_stealSide_vss_axi_full_1 */
    /* is_slave = False */
    task_stealSide_vss_axi_full_1_AWVALID(task_stealSide_vss_axi_full_1_signals_.awvalid);
    task_stealSide_vss_axi_full_1_AWREADY(task_stealSide_vss_axi_full_1_signals_.awready);
    task_stealSide_vss_axi_full_1_AWADDR(task_stealSide_vss_axi_full_1_signals_.awaddr);
    task_stealSide_vss_axi_full_1_AWPROT(task_stealSide_vss_axi_full_1_signals_.awprot);
    task_stealSide_vss_axi_full_1_AWREGION(task_stealSide_vss_axi_full_1_signals_.awregion);
    task_stealSide_vss_axi_full_1_AWQOS(task_stealSide_vss_axi_full_1_signals_.awqos);
    task_stealSide_vss_axi_full_1_AWCACHE(task_stealSide_vss_axi_full_1_signals_.awcache);
    task_stealSide_vss_axi_full_1_AWBURST(task_stealSide_vss_axi_full_1_signals_.awburst);
    task_stealSide_vss_axi_full_1_AWSIZE(task_stealSide_vss_axi_full_1_signals_.awsize);
    task_stealSide_vss_axi_full_1_AWLEN(task_stealSide_vss_axi_full_1_signals_.awlen);
    task_stealSide_vss_axi_full_1_AWID(task_stealSide_vss_axi_full_1_signals_.awid);
    task_stealSide_vss_axi_full_1_AWLOCK(task_stealSide_vss_axi_full_1_signals_.awlock);
    task_stealSide_vss_axi_full_1_WID(task_stealSide_vss_axi_full_1_signals_.wid);
    task_stealSide_vss_axi_full_1_WVALID(task_stealSide_vss_axi_full_1_signals_.wvalid);
    task_stealSide_vss_axi_full_1_WREADY(task_stealSide_vss_axi_full_1_signals_.wready);
    task_stealSide_vss_axi_full_1_WDATA(task_stealSide_vss_axi_full_1_signals_.wdata);
    task_stealSide_vss_axi_full_1_WSTRB(task_stealSide_vss_axi_full_1_signals_.wstrb);
    task_stealSide_vss_axi_full_1_WLAST(task_stealSide_vss_axi_full_1_signals_.wlast);
    task_stealSide_vss_axi_full_1_BVALID(task_stealSide_vss_axi_full_1_signals_.bvalid);
    task_stealSide_vss_axi_full_1_BREADY(task_stealSide_vss_axi_full_1_signals_.bready);
    task_stealSide_vss_axi_full_1_BRESP(task_stealSide_vss_axi_full_1_signals_.bresp);
    task_stealSide_vss_axi_full_1_BID(task_stealSide_vss_axi_full_1_signals_.bid);
    task_stealSide_vss_axi_full_1_ARVALID(task_stealSide_vss_axi_full_1_signals_.arvalid);
    task_stealSide_vss_axi_full_1_ARREADY(task_stealSide_vss_axi_full_1_signals_.arready);
    task_stealSide_vss_axi_full_1_ARADDR(task_stealSide_vss_axi_full_1_signals_.araddr);
    task_stealSide_vss_axi_full_1_ARPROT(task_stealSide_vss_axi_full_1_signals_.arprot);
    task_stealSide_vss_axi_full_1_ARREGION(task_stealSide_vss_axi_full_1_signals_.arregion);
    task_stealSide_vss_axi_full_1_ARQOS(task_stealSide_vss_axi_full_1_signals_.arqos);
    task_stealSide_vss_axi_full_1_ARCACHE(task_stealSide_vss_axi_full_1_signals_.arcache);
    task_stealSide_vss_axi_full_1_ARBURST(task_stealSide_vss_axi_full_1_signals_.arburst);
    task_stealSide_vss_axi_full_1_ARSIZE(task_stealSide_vss_axi_full_1_signals_.arsize);
    task_stealSide_vss_axi_full_1_ARLEN(task_stealSide_vss_axi_full_1_signals_.arlen);
    task_stealSide_vss_axi_full_1_ARID(task_stealSide_vss_axi_full_1_signals_.arid);
    task_stealSide_vss_axi_full_1_ARLOCK(task_stealSide_vss_axi_full_1_signals_.arlock);
    task_stealSide_vss_axi_full_1_RVALID(task_stealSide_vss_axi_full_1_signals_.rvalid);
    task_stealSide_vss_axi_full_1_RREADY(task_stealSide_vss_axi_full_1_signals_.rready);
    task_stealSide_vss_axi_full_1_RDATA(task_stealSide_vss_axi_full_1_signals_.rdata);
    task_stealSide_vss_axi_full_1_RRESP(task_stealSide_vss_axi_full_1_signals_.rresp);
    task_stealSide_vss_axi_full_1_RID(task_stealSide_vss_axi_full_1_signals_.rid);
    task_stealSide_vss_axi_full_1_RLAST(task_stealSide_vss_axi_full_1_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task_stealSide_axi_mgmt_vss_2 */
    /* is_slave = True */
    task_stealSide_axi_mgmt_vss_2_AWVALID(task_stealSide_axi_mgmt_vss_2_signals_.awvalid);
    task_stealSide_axi_mgmt_vss_2_AWREADY(task_stealSide_axi_mgmt_vss_2_signals_.awready);
    task_stealSide_axi_mgmt_vss_2_AWADDR(task_stealSide_axi_mgmt_vss_2_signals_.awaddr);
    task_stealSide_axi_mgmt_vss_2_AWPROT(task_stealSide_axi_mgmt_vss_2_signals_.awprot);
    task_stealSide_axi_mgmt_vss_2_WVALID(task_stealSide_axi_mgmt_vss_2_signals_.wvalid);
    task_stealSide_axi_mgmt_vss_2_WREADY(task_stealSide_axi_mgmt_vss_2_signals_.wready);
    task_stealSide_axi_mgmt_vss_2_WDATA(task_stealSide_axi_mgmt_vss_2_signals_.wdata);
    task_stealSide_axi_mgmt_vss_2_WSTRB(task_stealSide_axi_mgmt_vss_2_signals_.wstrb);
    task_stealSide_axi_mgmt_vss_2_BVALID(task_stealSide_axi_mgmt_vss_2_signals_.bvalid);
    task_stealSide_axi_mgmt_vss_2_BREADY(task_stealSide_axi_mgmt_vss_2_signals_.bready);
    task_stealSide_axi_mgmt_vss_2_BRESP(task_stealSide_axi_mgmt_vss_2_signals_.bresp);
    task_stealSide_axi_mgmt_vss_2_ARVALID(task_stealSide_axi_mgmt_vss_2_signals_.arvalid);
    task_stealSide_axi_mgmt_vss_2_ARREADY(task_stealSide_axi_mgmt_vss_2_signals_.arready);
    task_stealSide_axi_mgmt_vss_2_ARADDR(task_stealSide_axi_mgmt_vss_2_signals_.araddr);
    task_stealSide_axi_mgmt_vss_2_ARPROT(task_stealSide_axi_mgmt_vss_2_signals_.arprot);
    task_stealSide_axi_mgmt_vss_2_RVALID(task_stealSide_axi_mgmt_vss_2_signals_.rvalid);
    task_stealSide_axi_mgmt_vss_2_RREADY(task_stealSide_axi_mgmt_vss_2_signals_.rready);
    task_stealSide_axi_mgmt_vss_2_RDATA(task_stealSide_axi_mgmt_vss_2_signals_.rdata);
    task_stealSide_axi_mgmt_vss_2_RRESP(task_stealSide_axi_mgmt_vss_2_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task_stealSide_vss_axi_full_2 */
    /* is_slave = False */
    task_stealSide_vss_axi_full_2_AWVALID(task_stealSide_vss_axi_full_2_signals_.awvalid);
    task_stealSide_vss_axi_full_2_AWREADY(task_stealSide_vss_axi_full_2_signals_.awready);
    task_stealSide_vss_axi_full_2_AWADDR(task_stealSide_vss_axi_full_2_signals_.awaddr);
    task_stealSide_vss_axi_full_2_AWPROT(task_stealSide_vss_axi_full_2_signals_.awprot);
    task_stealSide_vss_axi_full_2_AWREGION(task_stealSide_vss_axi_full_2_signals_.awregion);
    task_stealSide_vss_axi_full_2_AWQOS(task_stealSide_vss_axi_full_2_signals_.awqos);
    task_stealSide_vss_axi_full_2_AWCACHE(task_stealSide_vss_axi_full_2_signals_.awcache);
    task_stealSide_vss_axi_full_2_AWBURST(task_stealSide_vss_axi_full_2_signals_.awburst);
    task_stealSide_vss_axi_full_2_AWSIZE(task_stealSide_vss_axi_full_2_signals_.awsize);
    task_stealSide_vss_axi_full_2_AWLEN(task_stealSide_vss_axi_full_2_signals_.awlen);
    task_stealSide_vss_axi_full_2_AWID(task_stealSide_vss_axi_full_2_signals_.awid);
    task_stealSide_vss_axi_full_2_AWLOCK(task_stealSide_vss_axi_full_2_signals_.awlock);
    task_stealSide_vss_axi_full_2_WID(task_stealSide_vss_axi_full_2_signals_.wid);
    task_stealSide_vss_axi_full_2_WVALID(task_stealSide_vss_axi_full_2_signals_.wvalid);
    task_stealSide_vss_axi_full_2_WREADY(task_stealSide_vss_axi_full_2_signals_.wready);
    task_stealSide_vss_axi_full_2_WDATA(task_stealSide_vss_axi_full_2_signals_.wdata);
    task_stealSide_vss_axi_full_2_WSTRB(task_stealSide_vss_axi_full_2_signals_.wstrb);
    task_stealSide_vss_axi_full_2_WLAST(task_stealSide_vss_axi_full_2_signals_.wlast);
    task_stealSide_vss_axi_full_2_BVALID(task_stealSide_vss_axi_full_2_signals_.bvalid);
    task_stealSide_vss_axi_full_2_BREADY(task_stealSide_vss_axi_full_2_signals_.bready);
    task_stealSide_vss_axi_full_2_BRESP(task_stealSide_vss_axi_full_2_signals_.bresp);
    task_stealSide_vss_axi_full_2_BID(task_stealSide_vss_axi_full_2_signals_.bid);
    task_stealSide_vss_axi_full_2_ARVALID(task_stealSide_vss_axi_full_2_signals_.arvalid);
    task_stealSide_vss_axi_full_2_ARREADY(task_stealSide_vss_axi_full_2_signals_.arready);
    task_stealSide_vss_axi_full_2_ARADDR(task_stealSide_vss_axi_full_2_signals_.araddr);
    task_stealSide_vss_axi_full_2_ARPROT(task_stealSide_vss_axi_full_2_signals_.arprot);
    task_stealSide_vss_axi_full_2_ARREGION(task_stealSide_vss_axi_full_2_signals_.arregion);
    task_stealSide_vss_axi_full_2_ARQOS(task_stealSide_vss_axi_full_2_signals_.arqos);
    task_stealSide_vss_axi_full_2_ARCACHE(task_stealSide_vss_axi_full_2_signals_.arcache);
    task_stealSide_vss_axi_full_2_ARBURST(task_stealSide_vss_axi_full_2_signals_.arburst);
    task_stealSide_vss_axi_full_2_ARSIZE(task_stealSide_vss_axi_full_2_signals_.arsize);
    task_stealSide_vss_axi_full_2_ARLEN(task_stealSide_vss_axi_full_2_signals_.arlen);
    task_stealSide_vss_axi_full_2_ARID(task_stealSide_vss_axi_full_2_signals_.arid);
    task_stealSide_vss_axi_full_2_ARLOCK(task_stealSide_vss_axi_full_2_signals_.arlock);
    task_stealSide_vss_axi_full_2_RVALID(task_stealSide_vss_axi_full_2_signals_.rvalid);
    task_stealSide_vss_axi_full_2_RREADY(task_stealSide_vss_axi_full_2_signals_.rready);
    task_stealSide_vss_axi_full_2_RDATA(task_stealSide_vss_axi_full_2_signals_.rdata);
    task_stealSide_vss_axi_full_2_RRESP(task_stealSide_vss_axi_full_2_signals_.rresp);
    task_stealSide_vss_axi_full_2_RID(task_stealSide_vss_axi_full_2_signals_.rid);
    task_stealSide_vss_axi_full_2_RLAST(task_stealSide_vss_axi_full_2_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task_stealSide_axi_mgmt_vss_3 */
    /* is_slave = True */
    task_stealSide_axi_mgmt_vss_3_AWVALID(task_stealSide_axi_mgmt_vss_3_signals_.awvalid);
    task_stealSide_axi_mgmt_vss_3_AWREADY(task_stealSide_axi_mgmt_vss_3_signals_.awready);
    task_stealSide_axi_mgmt_vss_3_AWADDR(task_stealSide_axi_mgmt_vss_3_signals_.awaddr);
    task_stealSide_axi_mgmt_vss_3_AWPROT(task_stealSide_axi_mgmt_vss_3_signals_.awprot);
    task_stealSide_axi_mgmt_vss_3_WVALID(task_stealSide_axi_mgmt_vss_3_signals_.wvalid);
    task_stealSide_axi_mgmt_vss_3_WREADY(task_stealSide_axi_mgmt_vss_3_signals_.wready);
    task_stealSide_axi_mgmt_vss_3_WDATA(task_stealSide_axi_mgmt_vss_3_signals_.wdata);
    task_stealSide_axi_mgmt_vss_3_WSTRB(task_stealSide_axi_mgmt_vss_3_signals_.wstrb);
    task_stealSide_axi_mgmt_vss_3_BVALID(task_stealSide_axi_mgmt_vss_3_signals_.bvalid);
    task_stealSide_axi_mgmt_vss_3_BREADY(task_stealSide_axi_mgmt_vss_3_signals_.bready);
    task_stealSide_axi_mgmt_vss_3_BRESP(task_stealSide_axi_mgmt_vss_3_signals_.bresp);
    task_stealSide_axi_mgmt_vss_3_ARVALID(task_stealSide_axi_mgmt_vss_3_signals_.arvalid);
    task_stealSide_axi_mgmt_vss_3_ARREADY(task_stealSide_axi_mgmt_vss_3_signals_.arready);
    task_stealSide_axi_mgmt_vss_3_ARADDR(task_stealSide_axi_mgmt_vss_3_signals_.araddr);
    task_stealSide_axi_mgmt_vss_3_ARPROT(task_stealSide_axi_mgmt_vss_3_signals_.arprot);
    task_stealSide_axi_mgmt_vss_3_RVALID(task_stealSide_axi_mgmt_vss_3_signals_.rvalid);
    task_stealSide_axi_mgmt_vss_3_RREADY(task_stealSide_axi_mgmt_vss_3_signals_.rready);
    task_stealSide_axi_mgmt_vss_3_RDATA(task_stealSide_axi_mgmt_vss_3_signals_.rdata);
    task_stealSide_axi_mgmt_vss_3_RRESP(task_stealSide_axi_mgmt_vss_3_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task_stealSide_vss_axi_full_3 */
    /* is_slave = False */
    task_stealSide_vss_axi_full_3_AWVALID(task_stealSide_vss_axi_full_3_signals_.awvalid);
    task_stealSide_vss_axi_full_3_AWREADY(task_stealSide_vss_axi_full_3_signals_.awready);
    task_stealSide_vss_axi_full_3_AWADDR(task_stealSide_vss_axi_full_3_signals_.awaddr);
    task_stealSide_vss_axi_full_3_AWPROT(task_stealSide_vss_axi_full_3_signals_.awprot);
    task_stealSide_vss_axi_full_3_AWREGION(task_stealSide_vss_axi_full_3_signals_.awregion);
    task_stealSide_vss_axi_full_3_AWQOS(task_stealSide_vss_axi_full_3_signals_.awqos);
    task_stealSide_vss_axi_full_3_AWCACHE(task_stealSide_vss_axi_full_3_signals_.awcache);
    task_stealSide_vss_axi_full_3_AWBURST(task_stealSide_vss_axi_full_3_signals_.awburst);
    task_stealSide_vss_axi_full_3_AWSIZE(task_stealSide_vss_axi_full_3_signals_.awsize);
    task_stealSide_vss_axi_full_3_AWLEN(task_stealSide_vss_axi_full_3_signals_.awlen);
    task_stealSide_vss_axi_full_3_AWID(task_stealSide_vss_axi_full_3_signals_.awid);
    task_stealSide_vss_axi_full_3_AWLOCK(task_stealSide_vss_axi_full_3_signals_.awlock);
    task_stealSide_vss_axi_full_3_WID(task_stealSide_vss_axi_full_3_signals_.wid);
    task_stealSide_vss_axi_full_3_WVALID(task_stealSide_vss_axi_full_3_signals_.wvalid);
    task_stealSide_vss_axi_full_3_WREADY(task_stealSide_vss_axi_full_3_signals_.wready);
    task_stealSide_vss_axi_full_3_WDATA(task_stealSide_vss_axi_full_3_signals_.wdata);
    task_stealSide_vss_axi_full_3_WSTRB(task_stealSide_vss_axi_full_3_signals_.wstrb);
    task_stealSide_vss_axi_full_3_WLAST(task_stealSide_vss_axi_full_3_signals_.wlast);
    task_stealSide_vss_axi_full_3_BVALID(task_stealSide_vss_axi_full_3_signals_.bvalid);
    task_stealSide_vss_axi_full_3_BREADY(task_stealSide_vss_axi_full_3_signals_.bready);
    task_stealSide_vss_axi_full_3_BRESP(task_stealSide_vss_axi_full_3_signals_.bresp);
    task_stealSide_vss_axi_full_3_BID(task_stealSide_vss_axi_full_3_signals_.bid);
    task_stealSide_vss_axi_full_3_ARVALID(task_stealSide_vss_axi_full_3_signals_.arvalid);
    task_stealSide_vss_axi_full_3_ARREADY(task_stealSide_vss_axi_full_3_signals_.arready);
    task_stealSide_vss_axi_full_3_ARADDR(task_stealSide_vss_axi_full_3_signals_.araddr);
    task_stealSide_vss_axi_full_3_ARPROT(task_stealSide_vss_axi_full_3_signals_.arprot);
    task_stealSide_vss_axi_full_3_ARREGION(task_stealSide_vss_axi_full_3_signals_.arregion);
    task_stealSide_vss_axi_full_3_ARQOS(task_stealSide_vss_axi_full_3_signals_.arqos);
    task_stealSide_vss_axi_full_3_ARCACHE(task_stealSide_vss_axi_full_3_signals_.arcache);
    task_stealSide_vss_axi_full_3_ARBURST(task_stealSide_vss_axi_full_3_signals_.arburst);
    task_stealSide_vss_axi_full_3_ARSIZE(task_stealSide_vss_axi_full_3_signals_.arsize);
    task_stealSide_vss_axi_full_3_ARLEN(task_stealSide_vss_axi_full_3_signals_.arlen);
    task_stealSide_vss_axi_full_3_ARID(task_stealSide_vss_axi_full_3_signals_.arid);
    task_stealSide_vss_axi_full_3_ARLOCK(task_stealSide_vss_axi_full_3_signals_.arlock);
    task_stealSide_vss_axi_full_3_RVALID(task_stealSide_vss_axi_full_3_signals_.rvalid);
    task_stealSide_vss_axi_full_3_RREADY(task_stealSide_vss_axi_full_3_signals_.rready);
    task_stealSide_vss_axi_full_3_RDATA(task_stealSide_vss_axi_full_3_signals_.rdata);
    task_stealSide_vss_axi_full_3_RRESP(task_stealSide_vss_axi_full_3_signals_.rresp);
    task_stealSide_vss_axi_full_3_RID(task_stealSide_vss_axi_full_3_signals_.rid);
    task_stealSide_vss_axi_full_3_RLAST(task_stealSide_vss_axi_full_3_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task_stealSide_axi_mgmt_vss_4 */
    /* is_slave = True */
    task_stealSide_axi_mgmt_vss_4_AWVALID(task_stealSide_axi_mgmt_vss_4_signals_.awvalid);
    task_stealSide_axi_mgmt_vss_4_AWREADY(task_stealSide_axi_mgmt_vss_4_signals_.awready);
    task_stealSide_axi_mgmt_vss_4_AWADDR(task_stealSide_axi_mgmt_vss_4_signals_.awaddr);
    task_stealSide_axi_mgmt_vss_4_AWPROT(task_stealSide_axi_mgmt_vss_4_signals_.awprot);
    task_stealSide_axi_mgmt_vss_4_WVALID(task_stealSide_axi_mgmt_vss_4_signals_.wvalid);
    task_stealSide_axi_mgmt_vss_4_WREADY(task_stealSide_axi_mgmt_vss_4_signals_.wready);
    task_stealSide_axi_mgmt_vss_4_WDATA(task_stealSide_axi_mgmt_vss_4_signals_.wdata);
    task_stealSide_axi_mgmt_vss_4_WSTRB(task_stealSide_axi_mgmt_vss_4_signals_.wstrb);
    task_stealSide_axi_mgmt_vss_4_BVALID(task_stealSide_axi_mgmt_vss_4_signals_.bvalid);
    task_stealSide_axi_mgmt_vss_4_BREADY(task_stealSide_axi_mgmt_vss_4_signals_.bready);
    task_stealSide_axi_mgmt_vss_4_BRESP(task_stealSide_axi_mgmt_vss_4_signals_.bresp);
    task_stealSide_axi_mgmt_vss_4_ARVALID(task_stealSide_axi_mgmt_vss_4_signals_.arvalid);
    task_stealSide_axi_mgmt_vss_4_ARREADY(task_stealSide_axi_mgmt_vss_4_signals_.arready);
    task_stealSide_axi_mgmt_vss_4_ARADDR(task_stealSide_axi_mgmt_vss_4_signals_.araddr);
    task_stealSide_axi_mgmt_vss_4_ARPROT(task_stealSide_axi_mgmt_vss_4_signals_.arprot);
    task_stealSide_axi_mgmt_vss_4_RVALID(task_stealSide_axi_mgmt_vss_4_signals_.rvalid);
    task_stealSide_axi_mgmt_vss_4_RREADY(task_stealSide_axi_mgmt_vss_4_signals_.rready);
    task_stealSide_axi_mgmt_vss_4_RDATA(task_stealSide_axi_mgmt_vss_4_signals_.rdata);
    task_stealSide_axi_mgmt_vss_4_RRESP(task_stealSide_axi_mgmt_vss_4_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task_stealSide_vss_axi_full_4 */
    /* is_slave = False */
    task_stealSide_vss_axi_full_4_AWVALID(task_stealSide_vss_axi_full_4_signals_.awvalid);
    task_stealSide_vss_axi_full_4_AWREADY(task_stealSide_vss_axi_full_4_signals_.awready);
    task_stealSide_vss_axi_full_4_AWADDR(task_stealSide_vss_axi_full_4_signals_.awaddr);
    task_stealSide_vss_axi_full_4_AWPROT(task_stealSide_vss_axi_full_4_signals_.awprot);
    task_stealSide_vss_axi_full_4_AWREGION(task_stealSide_vss_axi_full_4_signals_.awregion);
    task_stealSide_vss_axi_full_4_AWQOS(task_stealSide_vss_axi_full_4_signals_.awqos);
    task_stealSide_vss_axi_full_4_AWCACHE(task_stealSide_vss_axi_full_4_signals_.awcache);
    task_stealSide_vss_axi_full_4_AWBURST(task_stealSide_vss_axi_full_4_signals_.awburst);
    task_stealSide_vss_axi_full_4_AWSIZE(task_stealSide_vss_axi_full_4_signals_.awsize);
    task_stealSide_vss_axi_full_4_AWLEN(task_stealSide_vss_axi_full_4_signals_.awlen);
    task_stealSide_vss_axi_full_4_AWID(task_stealSide_vss_axi_full_4_signals_.awid);
    task_stealSide_vss_axi_full_4_AWLOCK(task_stealSide_vss_axi_full_4_signals_.awlock);
    task_stealSide_vss_axi_full_4_WID(task_stealSide_vss_axi_full_4_signals_.wid);
    task_stealSide_vss_axi_full_4_WVALID(task_stealSide_vss_axi_full_4_signals_.wvalid);
    task_stealSide_vss_axi_full_4_WREADY(task_stealSide_vss_axi_full_4_signals_.wready);
    task_stealSide_vss_axi_full_4_WDATA(task_stealSide_vss_axi_full_4_signals_.wdata);
    task_stealSide_vss_axi_full_4_WSTRB(task_stealSide_vss_axi_full_4_signals_.wstrb);
    task_stealSide_vss_axi_full_4_WLAST(task_stealSide_vss_axi_full_4_signals_.wlast);
    task_stealSide_vss_axi_full_4_BVALID(task_stealSide_vss_axi_full_4_signals_.bvalid);
    task_stealSide_vss_axi_full_4_BREADY(task_stealSide_vss_axi_full_4_signals_.bready);
    task_stealSide_vss_axi_full_4_BRESP(task_stealSide_vss_axi_full_4_signals_.bresp);
    task_stealSide_vss_axi_full_4_BID(task_stealSide_vss_axi_full_4_signals_.bid);
    task_stealSide_vss_axi_full_4_ARVALID(task_stealSide_vss_axi_full_4_signals_.arvalid);
    task_stealSide_vss_axi_full_4_ARREADY(task_stealSide_vss_axi_full_4_signals_.arready);
    task_stealSide_vss_axi_full_4_ARADDR(task_stealSide_vss_axi_full_4_signals_.araddr);
    task_stealSide_vss_axi_full_4_ARPROT(task_stealSide_vss_axi_full_4_signals_.arprot);
    task_stealSide_vss_axi_full_4_ARREGION(task_stealSide_vss_axi_full_4_signals_.arregion);
    task_stealSide_vss_axi_full_4_ARQOS(task_stealSide_vss_axi_full_4_signals_.arqos);
    task_stealSide_vss_axi_full_4_ARCACHE(task_stealSide_vss_axi_full_4_signals_.arcache);
    task_stealSide_vss_axi_full_4_ARBURST(task_stealSide_vss_axi_full_4_signals_.arburst);
    task_stealSide_vss_axi_full_4_ARSIZE(task_stealSide_vss_axi_full_4_signals_.arsize);
    task_stealSide_vss_axi_full_4_ARLEN(task_stealSide_vss_axi_full_4_signals_.arlen);
    task_stealSide_vss_axi_full_4_ARID(task_stealSide_vss_axi_full_4_signals_.arid);
    task_stealSide_vss_axi_full_4_ARLOCK(task_stealSide_vss_axi_full_4_signals_.arlock);
    task_stealSide_vss_axi_full_4_RVALID(task_stealSide_vss_axi_full_4_signals_.rvalid);
    task_stealSide_vss_axi_full_4_RREADY(task_stealSide_vss_axi_full_4_signals_.rready);
    task_stealSide_vss_axi_full_4_RDATA(task_stealSide_vss_axi_full_4_signals_.rdata);
    task_stealSide_vss_axi_full_4_RRESP(task_stealSide_vss_axi_full_4_signals_.rresp);
    task_stealSide_vss_axi_full_4_RID(task_stealSide_vss_axi_full_4_signals_.rid);
    task_stealSide_vss_axi_full_4_RLAST(task_stealSide_vss_axi_full_4_signals_.rlast);
    
    
    /* connecting AXI4-Lite interface with name: task_stealSide_axi_mgmt_vss_5 */
    /* is_slave = True */
    task_stealSide_axi_mgmt_vss_5_AWVALID(task_stealSide_axi_mgmt_vss_5_signals_.awvalid);
    task_stealSide_axi_mgmt_vss_5_AWREADY(task_stealSide_axi_mgmt_vss_5_signals_.awready);
    task_stealSide_axi_mgmt_vss_5_AWADDR(task_stealSide_axi_mgmt_vss_5_signals_.awaddr);
    task_stealSide_axi_mgmt_vss_5_AWPROT(task_stealSide_axi_mgmt_vss_5_signals_.awprot);
    task_stealSide_axi_mgmt_vss_5_WVALID(task_stealSide_axi_mgmt_vss_5_signals_.wvalid);
    task_stealSide_axi_mgmt_vss_5_WREADY(task_stealSide_axi_mgmt_vss_5_signals_.wready);
    task_stealSide_axi_mgmt_vss_5_WDATA(task_stealSide_axi_mgmt_vss_5_signals_.wdata);
    task_stealSide_axi_mgmt_vss_5_WSTRB(task_stealSide_axi_mgmt_vss_5_signals_.wstrb);
    task_stealSide_axi_mgmt_vss_5_BVALID(task_stealSide_axi_mgmt_vss_5_signals_.bvalid);
    task_stealSide_axi_mgmt_vss_5_BREADY(task_stealSide_axi_mgmt_vss_5_signals_.bready);
    task_stealSide_axi_mgmt_vss_5_BRESP(task_stealSide_axi_mgmt_vss_5_signals_.bresp);
    task_stealSide_axi_mgmt_vss_5_ARVALID(task_stealSide_axi_mgmt_vss_5_signals_.arvalid);
    task_stealSide_axi_mgmt_vss_5_ARREADY(task_stealSide_axi_mgmt_vss_5_signals_.arready);
    task_stealSide_axi_mgmt_vss_5_ARADDR(task_stealSide_axi_mgmt_vss_5_signals_.araddr);
    task_stealSide_axi_mgmt_vss_5_ARPROT(task_stealSide_axi_mgmt_vss_5_signals_.arprot);
    task_stealSide_axi_mgmt_vss_5_RVALID(task_stealSide_axi_mgmt_vss_5_signals_.rvalid);
    task_stealSide_axi_mgmt_vss_5_RREADY(task_stealSide_axi_mgmt_vss_5_signals_.rready);
    task_stealSide_axi_mgmt_vss_5_RDATA(task_stealSide_axi_mgmt_vss_5_signals_.rdata);
    task_stealSide_axi_mgmt_vss_5_RRESP(task_stealSide_axi_mgmt_vss_5_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task_stealSide_vss_axi_full_5 */
    /* is_slave = False */
    task_stealSide_vss_axi_full_5_AWVALID(task_stealSide_vss_axi_full_5_signals_.awvalid);
    task_stealSide_vss_axi_full_5_AWREADY(task_stealSide_vss_axi_full_5_signals_.awready);
    task_stealSide_vss_axi_full_5_AWADDR(task_stealSide_vss_axi_full_5_signals_.awaddr);
    task_stealSide_vss_axi_full_5_AWPROT(task_stealSide_vss_axi_full_5_signals_.awprot);
    task_stealSide_vss_axi_full_5_AWREGION(task_stealSide_vss_axi_full_5_signals_.awregion);
    task_stealSide_vss_axi_full_5_AWQOS(task_stealSide_vss_axi_full_5_signals_.awqos);
    task_stealSide_vss_axi_full_5_AWCACHE(task_stealSide_vss_axi_full_5_signals_.awcache);
    task_stealSide_vss_axi_full_5_AWBURST(task_stealSide_vss_axi_full_5_signals_.awburst);
    task_stealSide_vss_axi_full_5_AWSIZE(task_stealSide_vss_axi_full_5_signals_.awsize);
    task_stealSide_vss_axi_full_5_AWLEN(task_stealSide_vss_axi_full_5_signals_.awlen);
    task_stealSide_vss_axi_full_5_AWID(task_stealSide_vss_axi_full_5_signals_.awid);
    task_stealSide_vss_axi_full_5_AWLOCK(task_stealSide_vss_axi_full_5_signals_.awlock);
    task_stealSide_vss_axi_full_5_WID(task_stealSide_vss_axi_full_5_signals_.wid);
    task_stealSide_vss_axi_full_5_WVALID(task_stealSide_vss_axi_full_5_signals_.wvalid);
    task_stealSide_vss_axi_full_5_WREADY(task_stealSide_vss_axi_full_5_signals_.wready);
    task_stealSide_vss_axi_full_5_WDATA(task_stealSide_vss_axi_full_5_signals_.wdata);
    task_stealSide_vss_axi_full_5_WSTRB(task_stealSide_vss_axi_full_5_signals_.wstrb);
    task_stealSide_vss_axi_full_5_WLAST(task_stealSide_vss_axi_full_5_signals_.wlast);
    task_stealSide_vss_axi_full_5_BVALID(task_stealSide_vss_axi_full_5_signals_.bvalid);
    task_stealSide_vss_axi_full_5_BREADY(task_stealSide_vss_axi_full_5_signals_.bready);
    task_stealSide_vss_axi_full_5_BRESP(task_stealSide_vss_axi_full_5_signals_.bresp);
    task_stealSide_vss_axi_full_5_BID(task_stealSide_vss_axi_full_5_signals_.bid);
    task_stealSide_vss_axi_full_5_ARVALID(task_stealSide_vss_axi_full_5_signals_.arvalid);
    task_stealSide_vss_axi_full_5_ARREADY(task_stealSide_vss_axi_full_5_signals_.arready);
    task_stealSide_vss_axi_full_5_ARADDR(task_stealSide_vss_axi_full_5_signals_.araddr);
    task_stealSide_vss_axi_full_5_ARPROT(task_stealSide_vss_axi_full_5_signals_.arprot);
    task_stealSide_vss_axi_full_5_ARREGION(task_stealSide_vss_axi_full_5_signals_.arregion);
    task_stealSide_vss_axi_full_5_ARQOS(task_stealSide_vss_axi_full_5_signals_.arqos);
    task_stealSide_vss_axi_full_5_ARCACHE(task_stealSide_vss_axi_full_5_signals_.arcache);
    task_stealSide_vss_axi_full_5_ARBURST(task_stealSide_vss_axi_full_5_signals_.arburst);
    task_stealSide_vss_axi_full_5_ARSIZE(task_stealSide_vss_axi_full_5_signals_.arsize);
    task_stealSide_vss_axi_full_5_ARLEN(task_stealSide_vss_axi_full_5_signals_.arlen);
    task_stealSide_vss_axi_full_5_ARID(task_stealSide_vss_axi_full_5_signals_.arid);
    task_stealSide_vss_axi_full_5_ARLOCK(task_stealSide_vss_axi_full_5_signals_.arlock);
    task_stealSide_vss_axi_full_5_RVALID(task_stealSide_vss_axi_full_5_signals_.rvalid);
    task_stealSide_vss_axi_full_5_RREADY(task_stealSide_vss_axi_full_5_signals_.rready);
    task_stealSide_vss_axi_full_5_RDATA(task_stealSide_vss_axi_full_5_signals_.rdata);
    task_stealSide_vss_axi_full_5_RRESP(task_stealSide_vss_axi_full_5_signals_.rresp);
    task_stealSide_vss_axi_full_5_RID(task_stealSide_vss_axi_full_5_signals_.rid);
    task_stealSide_vss_axi_full_5_RLAST(task_stealSide_vss_axi_full_5_signals_.rlast);
    
    
}

void paper_exp1__peCount_16__vssNumber_6::do_init_()
{
    set("clock", clock);
    set("reset", reset);
    set("description", description);
}

hardcilk::desc::FlexiTaskSystem paper_exp1__peCount_16__vssNumber_6::description = [] {
    using namespace hardcilk::desc;
    auto description = FlexiTaskSystem{
        .tasks = []() {
            std::map<std::string, Task> r;
            r["task"] = Task{
                .name = "task",
                .parent = "/tasks",
                .path = "/tasks:task",
                .isRoot = true,
                .isCont = false,
                .widthTask = 32,
                .widthCont = 32,
                .widthArg = 32,
                .numProcessingElements = 16,
                .processingElements = []() {
                    std::map<std::string, ProcessingElement> r;
                    r["pe_0"] = ProcessingElement{
                        .name = "pe_0",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_0",
                        .portName = "task_PE_0",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_0",
                                .path = "/tasks:task/processingElements:pe_0/interfaces:mem",
                                .portName = "task_PE_0_mem",
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
                                .parent = "/tasks:task/processingElements:pe_0",
                                .path = "/tasks:task/processingElements:pe_0/interfaces:taskIn",
                                .portName = "task_PE_0_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_0",
                                .path = "/tasks:task/processingElements:pe_0/interfaces:taskOut",
                                .portName = "task_PE_0_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_1",
                        .portName = "task_PE_1",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_1",
                                .path = "/tasks:task/processingElements:pe_1/interfaces:mem",
                                .portName = "task_PE_1_mem",
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
                                .parent = "/tasks:task/processingElements:pe_1",
                                .path = "/tasks:task/processingElements:pe_1/interfaces:taskIn",
                                .portName = "task_PE_1_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_1",
                                .path = "/tasks:task/processingElements:pe_1/interfaces:taskOut",
                                .portName = "task_PE_1_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_2",
                        .portName = "task_PE_2",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_2",
                                .path = "/tasks:task/processingElements:pe_2/interfaces:mem",
                                .portName = "task_PE_2_mem",
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
                                .parent = "/tasks:task/processingElements:pe_2",
                                .path = "/tasks:task/processingElements:pe_2/interfaces:taskIn",
                                .portName = "task_PE_2_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_2",
                                .path = "/tasks:task/processingElements:pe_2/interfaces:taskOut",
                                .portName = "task_PE_2_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_3",
                        .portName = "task_PE_3",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_3",
                                .path = "/tasks:task/processingElements:pe_3/interfaces:mem",
                                .portName = "task_PE_3_mem",
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
                                .parent = "/tasks:task/processingElements:pe_3",
                                .path = "/tasks:task/processingElements:pe_3/interfaces:taskIn",
                                .portName = "task_PE_3_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_3",
                                .path = "/tasks:task/processingElements:pe_3/interfaces:taskOut",
                                .portName = "task_PE_3_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_4",
                        .portName = "task_PE_4",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_4",
                                .path = "/tasks:task/processingElements:pe_4/interfaces:mem",
                                .portName = "task_PE_4_mem",
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
                                .parent = "/tasks:task/processingElements:pe_4",
                                .path = "/tasks:task/processingElements:pe_4/interfaces:taskIn",
                                .portName = "task_PE_4_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_4",
                                .path = "/tasks:task/processingElements:pe_4/interfaces:taskOut",
                                .portName = "task_PE_4_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_5",
                        .portName = "task_PE_5",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_5",
                                .path = "/tasks:task/processingElements:pe_5/interfaces:mem",
                                .portName = "task_PE_5_mem",
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
                                .parent = "/tasks:task/processingElements:pe_5",
                                .path = "/tasks:task/processingElements:pe_5/interfaces:taskIn",
                                .portName = "task_PE_5_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_5",
                                .path = "/tasks:task/processingElements:pe_5/interfaces:taskOut",
                                .portName = "task_PE_5_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_6",
                        .portName = "task_PE_6",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_6",
                                .path = "/tasks:task/processingElements:pe_6/interfaces:mem",
                                .portName = "task_PE_6_mem",
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
                                .parent = "/tasks:task/processingElements:pe_6",
                                .path = "/tasks:task/processingElements:pe_6/interfaces:taskIn",
                                .portName = "task_PE_6_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_6",
                                .path = "/tasks:task/processingElements:pe_6/interfaces:taskOut",
                                .portName = "task_PE_6_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_7",
                        .portName = "task_PE_7",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_7",
                                .path = "/tasks:task/processingElements:pe_7/interfaces:mem",
                                .portName = "task_PE_7_mem",
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
                                .parent = "/tasks:task/processingElements:pe_7",
                                .path = "/tasks:task/processingElements:pe_7/interfaces:taskIn",
                                .portName = "task_PE_7_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_7",
                                .path = "/tasks:task/processingElements:pe_7/interfaces:taskOut",
                                .portName = "task_PE_7_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_8",
                        .portName = "task_PE_8",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_8",
                                .path = "/tasks:task/processingElements:pe_8/interfaces:mem",
                                .portName = "task_PE_8_mem",
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
                                .parent = "/tasks:task/processingElements:pe_8",
                                .path = "/tasks:task/processingElements:pe_8/interfaces:taskIn",
                                .portName = "task_PE_8_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_8",
                                .path = "/tasks:task/processingElements:pe_8/interfaces:taskOut",
                                .portName = "task_PE_8_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_9",
                        .portName = "task_PE_9",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_9",
                                .path = "/tasks:task/processingElements:pe_9/interfaces:mem",
                                .portName = "task_PE_9_mem",
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
                                .parent = "/tasks:task/processingElements:pe_9",
                                .path = "/tasks:task/processingElements:pe_9/interfaces:taskIn",
                                .portName = "task_PE_9_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_9",
                                .path = "/tasks:task/processingElements:pe_9/interfaces:taskOut",
                                .portName = "task_PE_9_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_10",
                        .portName = "task_PE_10",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_10",
                                .path = "/tasks:task/processingElements:pe_10/interfaces:mem",
                                .portName = "task_PE_10_mem",
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
                                .parent = "/tasks:task/processingElements:pe_10",
                                .path = "/tasks:task/processingElements:pe_10/interfaces:taskIn",
                                .portName = "task_PE_10_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_10",
                                .path = "/tasks:task/processingElements:pe_10/interfaces:taskOut",
                                .portName = "task_PE_10_taskOut",
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
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_11",
                        .portName = "task_PE_11",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_11",
                                .path = "/tasks:task/processingElements:pe_11/interfaces:mem",
                                .portName = "task_PE_11_mem",
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
                                .parent = "/tasks:task/processingElements:pe_11",
                                .path = "/tasks:task/processingElements:pe_11/interfaces:taskIn",
                                .portName = "task_PE_11_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_11",
                                .path = "/tasks:task/processingElements:pe_11/interfaces:taskOut",
                                .portName = "task_PE_11_taskOut",
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
                    r["pe_12"] = ProcessingElement{
                        .name = "pe_12",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_12",
                        .portName = "task_PE_12",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_12",
                                .path = "/tasks:task/processingElements:pe_12/interfaces:mem",
                                .portName = "task_PE_12_mem",
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
                                .parent = "/tasks:task/processingElements:pe_12",
                                .path = "/tasks:task/processingElements:pe_12/interfaces:taskIn",
                                .portName = "task_PE_12_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_12",
                                .path = "/tasks:task/processingElements:pe_12/interfaces:taskOut",
                                .portName = "task_PE_12_taskOut",
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
                    r["pe_13"] = ProcessingElement{
                        .name = "pe_13",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_13",
                        .portName = "task_PE_13",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_13",
                                .path = "/tasks:task/processingElements:pe_13/interfaces:mem",
                                .portName = "task_PE_13_mem",
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
                                .parent = "/tasks:task/processingElements:pe_13",
                                .path = "/tasks:task/processingElements:pe_13/interfaces:taskIn",
                                .portName = "task_PE_13_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_13",
                                .path = "/tasks:task/processingElements:pe_13/interfaces:taskOut",
                                .portName = "task_PE_13_taskOut",
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
                    r["pe_14"] = ProcessingElement{
                        .name = "pe_14",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_14",
                        .portName = "task_PE_14",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_14",
                                .path = "/tasks:task/processingElements:pe_14/interfaces:mem",
                                .portName = "task_PE_14_mem",
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
                                .parent = "/tasks:task/processingElements:pe_14",
                                .path = "/tasks:task/processingElements:pe_14/interfaces:taskIn",
                                .portName = "task_PE_14_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_14",
                                .path = "/tasks:task/processingElements:pe_14/interfaces:taskOut",
                                .portName = "task_PE_14_taskOut",
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
                    r["pe_15"] = ProcessingElement{
                        .name = "pe_15",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_15",
                        .portName = "task_PE_15",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_15",
                                .path = "/tasks:task/processingElements:pe_15/interfaces:mem",
                                .portName = "task_PE_15_mem",
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
                                .parent = "/tasks:task/processingElements:pe_15",
                                .path = "/tasks:task/processingElements:pe_15/interfaces:taskIn",
                                .portName = "task_PE_15_taskIn",
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
                                .parent = "/tasks:task/processingElements:pe_15",
                                .path = "/tasks:task/processingElements:pe_15/interfaces:taskOut",
                                .portName = "task_PE_15_taskOut",
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
                .numVirtualStealServers = 6,
                .capacityVirtualStealQueue = 10000000,
                .virtualStealServers = []() {
                    std::map<std::string, VirtualStealServer> r;
                    r["vss_0"] = VirtualStealServer{
                        .name = "vss_0",
                        .parent = "task",
                        .path = "/tasks:task/virtualStealServers:vss_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff00000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task_stealSide_axi_mgmt_vss_0",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    r["vss_1"] = VirtualStealServer{
                        .name = "vss_1",
                        .parent = "task",
                        .path = "/tasks:task/virtualStealServers:vss_1",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff10000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task_stealSide_axi_mgmt_vss_1",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    r["vss_2"] = VirtualStealServer{
                        .name = "vss_2",
                        .parent = "task",
                        .path = "/tasks:task/virtualStealServers:vss_2",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff20000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task_stealSide_axi_mgmt_vss_2",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    r["vss_3"] = VirtualStealServer{
                        .name = "vss_3",
                        .parent = "task",
                        .path = "/tasks:task/virtualStealServers:vss_3",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff30000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task_stealSide_axi_mgmt_vss_3",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    r["vss_4"] = VirtualStealServer{
                        .name = "vss_4",
                        .parent = "task",
                        .path = "/tasks:task/virtualStealServers:vss_4",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff40000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task_stealSide_axi_mgmt_vss_4",
                        .capacity = 10000000,
                        .numBytesTask = 4
                    };
                    r["vss_5"] = VirtualStealServer{
                        .name = "vss_5",
                        .parent = "task",
                        .path = "/tasks:task/virtualStealServers:vss_5",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff50000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task_stealSide_axi_mgmt_vss_5",
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
                r["task_stealSide_taskOut_0"] = Interface{
                    .name = "task_stealSide_taskOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_0",
                    .portName = "task_stealSide_taskOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_1"] = Interface{
                    .name = "task_stealSide_taskOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_1",
                    .portName = "task_stealSide_taskOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_2"] = Interface{
                    .name = "task_stealSide_taskOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_2",
                    .portName = "task_stealSide_taskOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_3"] = Interface{
                    .name = "task_stealSide_taskOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_3",
                    .portName = "task_stealSide_taskOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_4"] = Interface{
                    .name = "task_stealSide_taskOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_4",
                    .portName = "task_stealSide_taskOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_5"] = Interface{
                    .name = "task_stealSide_taskOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_5",
                    .portName = "task_stealSide_taskOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_6"] = Interface{
                    .name = "task_stealSide_taskOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_6",
                    .portName = "task_stealSide_taskOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_7"] = Interface{
                    .name = "task_stealSide_taskOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_7",
                    .portName = "task_stealSide_taskOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_8"] = Interface{
                    .name = "task_stealSide_taskOut_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_8",
                    .portName = "task_stealSide_taskOut_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_9"] = Interface{
                    .name = "task_stealSide_taskOut_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_9",
                    .portName = "task_stealSide_taskOut_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_10"] = Interface{
                    .name = "task_stealSide_taskOut_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_10",
                    .portName = "task_stealSide_taskOut_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_11"] = Interface{
                    .name = "task_stealSide_taskOut_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_11",
                    .portName = "task_stealSide_taskOut_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_12"] = Interface{
                    .name = "task_stealSide_taskOut_12",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_12",
                    .portName = "task_stealSide_taskOut_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_13"] = Interface{
                    .name = "task_stealSide_taskOut_13",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_13",
                    .portName = "task_stealSide_taskOut_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_14"] = Interface{
                    .name = "task_stealSide_taskOut_14",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_14",
                    .portName = "task_stealSide_taskOut_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_15"] = Interface{
                    .name = "task_stealSide_taskOut_15",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_15",
                    .portName = "task_stealSide_taskOut_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_0"] = Interface{
                    .name = "task_stealSide_taskIn_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_0",
                    .portName = "task_stealSide_taskIn_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_1"] = Interface{
                    .name = "task_stealSide_taskIn_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_1",
                    .portName = "task_stealSide_taskIn_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_2"] = Interface{
                    .name = "task_stealSide_taskIn_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_2",
                    .portName = "task_stealSide_taskIn_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_3"] = Interface{
                    .name = "task_stealSide_taskIn_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_3",
                    .portName = "task_stealSide_taskIn_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_4"] = Interface{
                    .name = "task_stealSide_taskIn_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_4",
                    .portName = "task_stealSide_taskIn_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_5"] = Interface{
                    .name = "task_stealSide_taskIn_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_5",
                    .portName = "task_stealSide_taskIn_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_6"] = Interface{
                    .name = "task_stealSide_taskIn_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_6",
                    .portName = "task_stealSide_taskIn_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_7"] = Interface{
                    .name = "task_stealSide_taskIn_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_7",
                    .portName = "task_stealSide_taskIn_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_8"] = Interface{
                    .name = "task_stealSide_taskIn_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_8",
                    .portName = "task_stealSide_taskIn_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_9"] = Interface{
                    .name = "task_stealSide_taskIn_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_9",
                    .portName = "task_stealSide_taskIn_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_10"] = Interface{
                    .name = "task_stealSide_taskIn_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_10",
                    .portName = "task_stealSide_taskIn_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_11"] = Interface{
                    .name = "task_stealSide_taskIn_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_11",
                    .portName = "task_stealSide_taskIn_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_12"] = Interface{
                    .name = "task_stealSide_taskIn_12",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_12",
                    .portName = "task_stealSide_taskIn_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_13"] = Interface{
                    .name = "task_stealSide_taskIn_13",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_13",
                    .portName = "task_stealSide_taskIn_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_14"] = Interface{
                    .name = "task_stealSide_taskIn_14",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_14",
                    .portName = "task_stealSide_taskIn_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_15"] = Interface{
                    .name = "task_stealSide_taskIn_15",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_15",
                    .portName = "task_stealSide_taskIn_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 32,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_axi_mgmt_vss_0"] = Interface{
                    .name = "task_stealSide_axi_mgmt_vss_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_axi_mgmt_vss_0",
                    .portName = "task_stealSide_axi_mgmt_vss_0",
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
                r["task_stealSide_vss_axi_full_0"] = Interface{
                    .name = "task_stealSide_vss_axi_full_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_vss_axi_full_0",
                    .portName = "task_stealSide_vss_axi_full_0",
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
                r["task_stealSide_axi_mgmt_vss_1"] = Interface{
                    .name = "task_stealSide_axi_mgmt_vss_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_axi_mgmt_vss_1",
                    .portName = "task_stealSide_axi_mgmt_vss_1",
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
                r["task_stealSide_vss_axi_full_1"] = Interface{
                    .name = "task_stealSide_vss_axi_full_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_vss_axi_full_1",
                    .portName = "task_stealSide_vss_axi_full_1",
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
                r["task_stealSide_axi_mgmt_vss_2"] = Interface{
                    .name = "task_stealSide_axi_mgmt_vss_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_axi_mgmt_vss_2",
                    .portName = "task_stealSide_axi_mgmt_vss_2",
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
                r["task_stealSide_vss_axi_full_2"] = Interface{
                    .name = "task_stealSide_vss_axi_full_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_vss_axi_full_2",
                    .portName = "task_stealSide_vss_axi_full_2",
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
                r["task_stealSide_axi_mgmt_vss_3"] = Interface{
                    .name = "task_stealSide_axi_mgmt_vss_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_axi_mgmt_vss_3",
                    .portName = "task_stealSide_axi_mgmt_vss_3",
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
                r["task_stealSide_vss_axi_full_3"] = Interface{
                    .name = "task_stealSide_vss_axi_full_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_vss_axi_full_3",
                    .portName = "task_stealSide_vss_axi_full_3",
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
                r["task_stealSide_axi_mgmt_vss_4"] = Interface{
                    .name = "task_stealSide_axi_mgmt_vss_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_axi_mgmt_vss_4",
                    .portName = "task_stealSide_axi_mgmt_vss_4",
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
                r["task_stealSide_vss_axi_full_4"] = Interface{
                    .name = "task_stealSide_vss_axi_full_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_vss_axi_full_4",
                    .portName = "task_stealSide_vss_axi_full_4",
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
                r["task_stealSide_axi_mgmt_vss_5"] = Interface{
                    .name = "task_stealSide_axi_mgmt_vss_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_axi_mgmt_vss_5",
                    .portName = "task_stealSide_axi_mgmt_vss_5",
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
                r["task_stealSide_vss_axi_full_5"] = Interface{
                    .name = "task_stealSide_vss_axi_full_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_vss_axi_full_5",
                    .portName = "task_stealSide_vss_axi_full_5",
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
                "/system/interfaces:task_stealSide_taskOut_0",
                "/tasks:task/processingElements:pe_0/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_1",
                "/tasks:task/processingElements:pe_1/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_2",
                "/tasks:task/processingElements:pe_2/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_3",
                "/tasks:task/processingElements:pe_3/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_4",
                "/tasks:task/processingElements:pe_4/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_5",
                "/tasks:task/processingElements:pe_5/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_6",
                "/tasks:task/processingElements:pe_6/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_7",
                "/tasks:task/processingElements:pe_7/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_8",
                "/tasks:task/processingElements:pe_8/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_9",
                "/tasks:task/processingElements:pe_9/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_10",
                "/tasks:task/processingElements:pe_10/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_11",
                "/tasks:task/processingElements:pe_11/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_12",
                "/tasks:task/processingElements:pe_12/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_13",
                "/tasks:task/processingElements:pe_13/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_14",
                "/tasks:task/processingElements:pe_14/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_15",
                "/tasks:task/processingElements:pe_15/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_0/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_0"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_1/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_1"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_2/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_2"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_3/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_3"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_4/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_4"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_5/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_6/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_7/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_7"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_8/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_8"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_9/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_9"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_10/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_10"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_11/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_11"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_12/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_12"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_13/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_13"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_14/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_14"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_15/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_15"
            }
        },
        .widthAddress = 64,
        .widthContinuationCounter = 32,
        .spawnList = []() {
            std::map<std::string, std::vector<std::string>> r;
            r["task"] = std::vector<std::string>{
                "task"
            };
            return r;
        }(),
        .managementBase = addr_type(0x000000003ff00000ull),
        .memory = AddressSpace{
            .base = addr_type(0x0000000040000000ull),
            .size = addr_type(0x00000000c0000000ull)
        },
        .interconnectMasters = 23,
        .interconnectSlaves = 7,
        .isElaborated = true
    };
    return description;
}();



}