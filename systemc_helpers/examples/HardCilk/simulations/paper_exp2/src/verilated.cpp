#include "verilated.hpp"

namespace paper_exp2
{

VerilatedTlmModule::VerilatedTlmModule(sc_core::sc_module_name const &name):
    Vpaper_exp2(name),
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
    task_stealSide_taskOut_16_signals_("task_stealSide_taskOut_16_signals"),
    task_stealSide_taskOut_17_signals_("task_stealSide_taskOut_17_signals"),
    task_stealSide_taskOut_18_signals_("task_stealSide_taskOut_18_signals"),
    task_stealSide_taskOut_19_signals_("task_stealSide_taskOut_19_signals"),
    task_stealSide_taskOut_20_signals_("task_stealSide_taskOut_20_signals"),
    task_stealSide_taskOut_21_signals_("task_stealSide_taskOut_21_signals"),
    task_stealSide_taskOut_22_signals_("task_stealSide_taskOut_22_signals"),
    task_stealSide_taskOut_23_signals_("task_stealSide_taskOut_23_signals"),
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
    task_stealSide_taskIn_16_signals_("task_stealSide_taskIn_16_signals"),
    task_stealSide_taskIn_17_signals_("task_stealSide_taskIn_17_signals"),
    task_stealSide_taskIn_18_signals_("task_stealSide_taskIn_18_signals"),
    task_stealSide_taskIn_19_signals_("task_stealSide_taskIn_19_signals"),
    task_stealSide_taskIn_20_signals_("task_stealSide_taskIn_20_signals"),
    task_stealSide_taskIn_21_signals_("task_stealSide_taskIn_21_signals"),
    task_stealSide_taskIn_22_signals_("task_stealSide_taskIn_22_signals"),
    task_stealSide_taskIn_23_signals_("task_stealSide_taskIn_23_signals"),
    task_syncSide_addrIn_0_signals_("task_syncSide_addrIn_0_signals"),
    task_syncSide_addrIn_1_signals_("task_syncSide_addrIn_1_signals"),
    task_syncSide_addrIn_2_signals_("task_syncSide_addrIn_2_signals"),
    task_syncSide_addrIn_3_signals_("task_syncSide_addrIn_3_signals"),
    task_syncSide_addrIn_4_signals_("task_syncSide_addrIn_4_signals"),
    task_syncSide_addrIn_5_signals_("task_syncSide_addrIn_5_signals"),
    task_syncSide_addrIn_6_signals_("task_syncSide_addrIn_6_signals"),
    task_syncSide_addrIn_7_signals_("task_syncSide_addrIn_7_signals"),
    task_syncSide_addrIn_8_signals_("task_syncSide_addrIn_8_signals"),
    task_syncSide_addrIn_9_signals_("task_syncSide_addrIn_9_signals"),
    task_syncSide_addrIn_10_signals_("task_syncSide_addrIn_10_signals"),
    task_syncSide_addrIn_11_signals_("task_syncSide_addrIn_11_signals"),
    task_syncSide_addrIn_12_signals_("task_syncSide_addrIn_12_signals"),
    task_syncSide_addrIn_13_signals_("task_syncSide_addrIn_13_signals"),
    task_syncSide_addrIn_14_signals_("task_syncSide_addrIn_14_signals"),
    task_syncSide_addrIn_15_signals_("task_syncSide_addrIn_15_signals"),
    task_syncSide_addrIn_16_signals_("task_syncSide_addrIn_16_signals"),
    task_syncSide_addrIn_17_signals_("task_syncSide_addrIn_17_signals"),
    task_syncSide_addrIn_18_signals_("task_syncSide_addrIn_18_signals"),
    task_syncSide_addrIn_19_signals_("task_syncSide_addrIn_19_signals"),
    task_syncSide_addrIn_20_signals_("task_syncSide_addrIn_20_signals"),
    task_syncSide_addrIn_21_signals_("task_syncSide_addrIn_21_signals"),
    task_syncSide_addrIn_22_signals_("task_syncSide_addrIn_22_signals"),
    task_syncSide_addrIn_23_signals_("task_syncSide_addrIn_23_signals"),
    task_continuationAllocationSide_contOut_0_signals_("task_continuationAllocationSide_contOut_0_signals"),
    task_continuationAllocationSide_contOut_1_signals_("task_continuationAllocationSide_contOut_1_signals"),
    task_continuationAllocationSide_contOut_2_signals_("task_continuationAllocationSide_contOut_2_signals"),
    task_continuationAllocationSide_contOut_3_signals_("task_continuationAllocationSide_contOut_3_signals"),
    task_continuationAllocationSide_contOut_4_signals_("task_continuationAllocationSide_contOut_4_signals"),
    task_continuationAllocationSide_contOut_5_signals_("task_continuationAllocationSide_contOut_5_signals"),
    task_continuationAllocationSide_contOut_6_signals_("task_continuationAllocationSide_contOut_6_signals"),
    task_continuationAllocationSide_contOut_7_signals_("task_continuationAllocationSide_contOut_7_signals"),
    task_continuationAllocationSide_contOut_8_signals_("task_continuationAllocationSide_contOut_8_signals"),
    task_continuationAllocationSide_contOut_9_signals_("task_continuationAllocationSide_contOut_9_signals"),
    task_continuationAllocationSide_contOut_10_signals_("task_continuationAllocationSide_contOut_10_signals"),
    task_continuationAllocationSide_contOut_11_signals_("task_continuationAllocationSide_contOut_11_signals"),
    task_continuationAllocationSide_contOut_12_signals_("task_continuationAllocationSide_contOut_12_signals"),
    task_continuationAllocationSide_contOut_13_signals_("task_continuationAllocationSide_contOut_13_signals"),
    task_continuationAllocationSide_contOut_14_signals_("task_continuationAllocationSide_contOut_14_signals"),
    task_continuationAllocationSide_contOut_15_signals_("task_continuationAllocationSide_contOut_15_signals"),
    task_continuationAllocationSide_contOut_16_signals_("task_continuationAllocationSide_contOut_16_signals"),
    task_continuationAllocationSide_contOut_17_signals_("task_continuationAllocationSide_contOut_17_signals"),
    task_continuationAllocationSide_contOut_18_signals_("task_continuationAllocationSide_contOut_18_signals"),
    task_continuationAllocationSide_contOut_19_signals_("task_continuationAllocationSide_contOut_19_signals"),
    task_continuationAllocationSide_contOut_20_signals_("task_continuationAllocationSide_contOut_20_signals"),
    task_continuationAllocationSide_contOut_21_signals_("task_continuationAllocationSide_contOut_21_signals"),
    task_continuationAllocationSide_contOut_22_signals_("task_continuationAllocationSide_contOut_22_signals"),
    task_continuationAllocationSide_contOut_23_signals_("task_continuationAllocationSide_contOut_23_signals"),
    task_stealSide_axi_mgmt_vss_0_signals_("task_stealSide_axi_mgmt_vss_0_signals"),
    task_stealSide_vss_axi_full_0_signals_("task_stealSide_vss_axi_full_0_signals"),
    task_continuationAllocationSide_axi_mgmt_vcas_signals_("task_continuationAllocationSide_axi_mgmt_vcas_signals"),
    task_continuationAllocationSide_vcas_axi_full_signals_("task_continuationAllocationSide_vcas_axi_full_signals"),
    task_syncSide_axi_full_argRoute_0_signals_("task_syncSide_axi_full_argRoute_0_signals"),
    task_syncSide_axi_full_argRoute_1_signals_("task_syncSide_axi_full_argRoute_1_signals"),
    task_syncSide_axi_full_argRoute_2_signals_("task_syncSide_axi_full_argRoute_2_signals"),
    task_syncSide_axi_full_argRoute_3_signals_("task_syncSide_axi_full_argRoute_3_signals"),
    task_syncSide_axi_full_argRoute_4_signals_("task_syncSide_axi_full_argRoute_4_signals"),
    task_syncSide_axi_full_argRoute_5_signals_("task_syncSide_axi_full_argRoute_5_signals"),
    task_syncSide_axi_full_argRoute_6_signals_("task_syncSide_axi_full_argRoute_6_signals"),
    task_syncSide_axi_full_argRoute_7_signals_("task_syncSide_axi_full_argRoute_7_signals"),
    task_syncSide_axi_full_argRoute_8_signals_("task_syncSide_axi_full_argRoute_8_signals"),
    task_syncSide_axi_full_argRoute_9_signals_("task_syncSide_axi_full_argRoute_9_signals"),
    task_syncSide_axi_full_argRoute_10_signals_("task_syncSide_axi_full_argRoute_10_signals"),
    task_syncSide_axi_full_argRoute_11_signals_("task_syncSide_axi_full_argRoute_11_signals"),
    task_syncSide_axi_full_argRoute_12_signals_("task_syncSide_axi_full_argRoute_12_signals"),
    task_syncSide_axi_full_argRoute_13_signals_("task_syncSide_axi_full_argRoute_13_signals"),
    task_syncSide_axi_full_argRoute_14_signals_("task_syncSide_axi_full_argRoute_14_signals"),
    task_syncSide_axi_full_argRoute_15_signals_("task_syncSide_axi_full_argRoute_15_signals"),
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
    task_stealSide_taskOut_16_bridge_("task_stealSide_taskOut_16_bridge"),
    task_stealSide_taskOut_17_bridge_("task_stealSide_taskOut_17_bridge"),
    task_stealSide_taskOut_18_bridge_("task_stealSide_taskOut_18_bridge"),
    task_stealSide_taskOut_19_bridge_("task_stealSide_taskOut_19_bridge"),
    task_stealSide_taskOut_20_bridge_("task_stealSide_taskOut_20_bridge"),
    task_stealSide_taskOut_21_bridge_("task_stealSide_taskOut_21_bridge"),
    task_stealSide_taskOut_22_bridge_("task_stealSide_taskOut_22_bridge"),
    task_stealSide_taskOut_23_bridge_("task_stealSide_taskOut_23_bridge"),
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
    task_stealSide_taskIn_16_bridge_("task_stealSide_taskIn_16_bridge"),
    task_stealSide_taskIn_17_bridge_("task_stealSide_taskIn_17_bridge"),
    task_stealSide_taskIn_18_bridge_("task_stealSide_taskIn_18_bridge"),
    task_stealSide_taskIn_19_bridge_("task_stealSide_taskIn_19_bridge"),
    task_stealSide_taskIn_20_bridge_("task_stealSide_taskIn_20_bridge"),
    task_stealSide_taskIn_21_bridge_("task_stealSide_taskIn_21_bridge"),
    task_stealSide_taskIn_22_bridge_("task_stealSide_taskIn_22_bridge"),
    task_stealSide_taskIn_23_bridge_("task_stealSide_taskIn_23_bridge"),
    task_syncSide_addrIn_0_bridge_("task_syncSide_addrIn_0_bridge"),
    task_syncSide_addrIn_1_bridge_("task_syncSide_addrIn_1_bridge"),
    task_syncSide_addrIn_2_bridge_("task_syncSide_addrIn_2_bridge"),
    task_syncSide_addrIn_3_bridge_("task_syncSide_addrIn_3_bridge"),
    task_syncSide_addrIn_4_bridge_("task_syncSide_addrIn_4_bridge"),
    task_syncSide_addrIn_5_bridge_("task_syncSide_addrIn_5_bridge"),
    task_syncSide_addrIn_6_bridge_("task_syncSide_addrIn_6_bridge"),
    task_syncSide_addrIn_7_bridge_("task_syncSide_addrIn_7_bridge"),
    task_syncSide_addrIn_8_bridge_("task_syncSide_addrIn_8_bridge"),
    task_syncSide_addrIn_9_bridge_("task_syncSide_addrIn_9_bridge"),
    task_syncSide_addrIn_10_bridge_("task_syncSide_addrIn_10_bridge"),
    task_syncSide_addrIn_11_bridge_("task_syncSide_addrIn_11_bridge"),
    task_syncSide_addrIn_12_bridge_("task_syncSide_addrIn_12_bridge"),
    task_syncSide_addrIn_13_bridge_("task_syncSide_addrIn_13_bridge"),
    task_syncSide_addrIn_14_bridge_("task_syncSide_addrIn_14_bridge"),
    task_syncSide_addrIn_15_bridge_("task_syncSide_addrIn_15_bridge"),
    task_syncSide_addrIn_16_bridge_("task_syncSide_addrIn_16_bridge"),
    task_syncSide_addrIn_17_bridge_("task_syncSide_addrIn_17_bridge"),
    task_syncSide_addrIn_18_bridge_("task_syncSide_addrIn_18_bridge"),
    task_syncSide_addrIn_19_bridge_("task_syncSide_addrIn_19_bridge"),
    task_syncSide_addrIn_20_bridge_("task_syncSide_addrIn_20_bridge"),
    task_syncSide_addrIn_21_bridge_("task_syncSide_addrIn_21_bridge"),
    task_syncSide_addrIn_22_bridge_("task_syncSide_addrIn_22_bridge"),
    task_syncSide_addrIn_23_bridge_("task_syncSide_addrIn_23_bridge"),
    task_continuationAllocationSide_contOut_0_bridge_("task_continuationAllocationSide_contOut_0_bridge"),
    task_continuationAllocationSide_contOut_1_bridge_("task_continuationAllocationSide_contOut_1_bridge"),
    task_continuationAllocationSide_contOut_2_bridge_("task_continuationAllocationSide_contOut_2_bridge"),
    task_continuationAllocationSide_contOut_3_bridge_("task_continuationAllocationSide_contOut_3_bridge"),
    task_continuationAllocationSide_contOut_4_bridge_("task_continuationAllocationSide_contOut_4_bridge"),
    task_continuationAllocationSide_contOut_5_bridge_("task_continuationAllocationSide_contOut_5_bridge"),
    task_continuationAllocationSide_contOut_6_bridge_("task_continuationAllocationSide_contOut_6_bridge"),
    task_continuationAllocationSide_contOut_7_bridge_("task_continuationAllocationSide_contOut_7_bridge"),
    task_continuationAllocationSide_contOut_8_bridge_("task_continuationAllocationSide_contOut_8_bridge"),
    task_continuationAllocationSide_contOut_9_bridge_("task_continuationAllocationSide_contOut_9_bridge"),
    task_continuationAllocationSide_contOut_10_bridge_("task_continuationAllocationSide_contOut_10_bridge"),
    task_continuationAllocationSide_contOut_11_bridge_("task_continuationAllocationSide_contOut_11_bridge"),
    task_continuationAllocationSide_contOut_12_bridge_("task_continuationAllocationSide_contOut_12_bridge"),
    task_continuationAllocationSide_contOut_13_bridge_("task_continuationAllocationSide_contOut_13_bridge"),
    task_continuationAllocationSide_contOut_14_bridge_("task_continuationAllocationSide_contOut_14_bridge"),
    task_continuationAllocationSide_contOut_15_bridge_("task_continuationAllocationSide_contOut_15_bridge"),
    task_continuationAllocationSide_contOut_16_bridge_("task_continuationAllocationSide_contOut_16_bridge"),
    task_continuationAllocationSide_contOut_17_bridge_("task_continuationAllocationSide_contOut_17_bridge"),
    task_continuationAllocationSide_contOut_18_bridge_("task_continuationAllocationSide_contOut_18_bridge"),
    task_continuationAllocationSide_contOut_19_bridge_("task_continuationAllocationSide_contOut_19_bridge"),
    task_continuationAllocationSide_contOut_20_bridge_("task_continuationAllocationSide_contOut_20_bridge"),
    task_continuationAllocationSide_contOut_21_bridge_("task_continuationAllocationSide_contOut_21_bridge"),
    task_continuationAllocationSide_contOut_22_bridge_("task_continuationAllocationSide_contOut_22_bridge"),
    task_continuationAllocationSide_contOut_23_bridge_("task_continuationAllocationSide_contOut_23_bridge"),
    task_stealSide_axi_mgmt_vss_0_bridge_("task_stealSide_axi_mgmt_vss_0_bridge"),
    task_stealSide_vss_axi_full_0_bridge_("task_stealSide_vss_axi_full_0_bridge"),
    task_continuationAllocationSide_axi_mgmt_vcas_bridge_("task_continuationAllocationSide_axi_mgmt_vcas_bridge"),
    task_continuationAllocationSide_vcas_axi_full_bridge_("task_continuationAllocationSide_vcas_axi_full_bridge"),
    task_syncSide_axi_full_argRoute_0_bridge_("task_syncSide_axi_full_argRoute_0_bridge"),
    task_syncSide_axi_full_argRoute_1_bridge_("task_syncSide_axi_full_argRoute_1_bridge"),
    task_syncSide_axi_full_argRoute_2_bridge_("task_syncSide_axi_full_argRoute_2_bridge"),
    task_syncSide_axi_full_argRoute_3_bridge_("task_syncSide_axi_full_argRoute_3_bridge"),
    task_syncSide_axi_full_argRoute_4_bridge_("task_syncSide_axi_full_argRoute_4_bridge"),
    task_syncSide_axi_full_argRoute_5_bridge_("task_syncSide_axi_full_argRoute_5_bridge"),
    task_syncSide_axi_full_argRoute_6_bridge_("task_syncSide_axi_full_argRoute_6_bridge"),
    task_syncSide_axi_full_argRoute_7_bridge_("task_syncSide_axi_full_argRoute_7_bridge"),
    task_syncSide_axi_full_argRoute_8_bridge_("task_syncSide_axi_full_argRoute_8_bridge"),
    task_syncSide_axi_full_argRoute_9_bridge_("task_syncSide_axi_full_argRoute_9_bridge"),
    task_syncSide_axi_full_argRoute_10_bridge_("task_syncSide_axi_full_argRoute_10_bridge"),
    task_syncSide_axi_full_argRoute_11_bridge_("task_syncSide_axi_full_argRoute_11_bridge"),
    task_syncSide_axi_full_argRoute_12_bridge_("task_syncSide_axi_full_argRoute_12_bridge"),
    task_syncSide_axi_full_argRoute_13_bridge_("task_syncSide_axi_full_argRoute_13_bridge"),
    task_syncSide_axi_full_argRoute_14_bridge_("task_syncSide_axi_full_argRoute_14_bridge"),
    task_syncSide_axi_full_argRoute_15_bridge_("task_syncSide_axi_full_argRoute_15_bridge")
    
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
    sockets_["task_stealSide_taskOut_16"] = &task_stealSide_taskOut_16_bridge_.socket;
    sockets_["task_stealSide_taskOut_17"] = &task_stealSide_taskOut_17_bridge_.socket;
    sockets_["task_stealSide_taskOut_18"] = &task_stealSide_taskOut_18_bridge_.socket;
    sockets_["task_stealSide_taskOut_19"] = &task_stealSide_taskOut_19_bridge_.socket;
    sockets_["task_stealSide_taskOut_20"] = &task_stealSide_taskOut_20_bridge_.socket;
    sockets_["task_stealSide_taskOut_21"] = &task_stealSide_taskOut_21_bridge_.socket;
    sockets_["task_stealSide_taskOut_22"] = &task_stealSide_taskOut_22_bridge_.socket;
    sockets_["task_stealSide_taskOut_23"] = &task_stealSide_taskOut_23_bridge_.socket;
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
    sockets_["task_stealSide_taskIn_16"] = &task_stealSide_taskIn_16_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_17"] = &task_stealSide_taskIn_17_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_18"] = &task_stealSide_taskIn_18_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_19"] = &task_stealSide_taskIn_19_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_20"] = &task_stealSide_taskIn_20_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_21"] = &task_stealSide_taskIn_21_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_22"] = &task_stealSide_taskIn_22_bridge_.tgt_socket;
    sockets_["task_stealSide_taskIn_23"] = &task_stealSide_taskIn_23_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_0"] = &task_syncSide_addrIn_0_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_1"] = &task_syncSide_addrIn_1_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_2"] = &task_syncSide_addrIn_2_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_3"] = &task_syncSide_addrIn_3_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_4"] = &task_syncSide_addrIn_4_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_5"] = &task_syncSide_addrIn_5_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_6"] = &task_syncSide_addrIn_6_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_7"] = &task_syncSide_addrIn_7_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_8"] = &task_syncSide_addrIn_8_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_9"] = &task_syncSide_addrIn_9_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_10"] = &task_syncSide_addrIn_10_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_11"] = &task_syncSide_addrIn_11_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_12"] = &task_syncSide_addrIn_12_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_13"] = &task_syncSide_addrIn_13_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_14"] = &task_syncSide_addrIn_14_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_15"] = &task_syncSide_addrIn_15_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_16"] = &task_syncSide_addrIn_16_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_17"] = &task_syncSide_addrIn_17_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_18"] = &task_syncSide_addrIn_18_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_19"] = &task_syncSide_addrIn_19_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_20"] = &task_syncSide_addrIn_20_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_21"] = &task_syncSide_addrIn_21_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_22"] = &task_syncSide_addrIn_22_bridge_.tgt_socket;
    sockets_["task_syncSide_addrIn_23"] = &task_syncSide_addrIn_23_bridge_.tgt_socket;
    sockets_["task_continuationAllocationSide_contOut_0"] = &task_continuationAllocationSide_contOut_0_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_1"] = &task_continuationAllocationSide_contOut_1_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_2"] = &task_continuationAllocationSide_contOut_2_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_3"] = &task_continuationAllocationSide_contOut_3_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_4"] = &task_continuationAllocationSide_contOut_4_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_5"] = &task_continuationAllocationSide_contOut_5_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_6"] = &task_continuationAllocationSide_contOut_6_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_7"] = &task_continuationAllocationSide_contOut_7_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_8"] = &task_continuationAllocationSide_contOut_8_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_9"] = &task_continuationAllocationSide_contOut_9_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_10"] = &task_continuationAllocationSide_contOut_10_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_11"] = &task_continuationAllocationSide_contOut_11_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_12"] = &task_continuationAllocationSide_contOut_12_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_13"] = &task_continuationAllocationSide_contOut_13_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_14"] = &task_continuationAllocationSide_contOut_14_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_15"] = &task_continuationAllocationSide_contOut_15_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_16"] = &task_continuationAllocationSide_contOut_16_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_17"] = &task_continuationAllocationSide_contOut_17_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_18"] = &task_continuationAllocationSide_contOut_18_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_19"] = &task_continuationAllocationSide_contOut_19_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_20"] = &task_continuationAllocationSide_contOut_20_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_21"] = &task_continuationAllocationSide_contOut_21_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_22"] = &task_continuationAllocationSide_contOut_22_bridge_.socket;
    sockets_["task_continuationAllocationSide_contOut_23"] = &task_continuationAllocationSide_contOut_23_bridge_.socket;
    sockets_["task_stealSide_axi_mgmt_vss_0"] = &task_stealSide_axi_mgmt_vss_0_bridge_.tgt_socket;
    sockets_["task_stealSide_vss_axi_full_0"] = &task_stealSide_vss_axi_full_0_bridge_.socket;
    sockets_["task_continuationAllocationSide_axi_mgmt_vcas"] = &task_continuationAllocationSide_axi_mgmt_vcas_bridge_.tgt_socket;
    sockets_["task_continuationAllocationSide_vcas_axi_full"] = &task_continuationAllocationSide_vcas_axi_full_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_0"] = &task_syncSide_axi_full_argRoute_0_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_1"] = &task_syncSide_axi_full_argRoute_1_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_2"] = &task_syncSide_axi_full_argRoute_2_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_3"] = &task_syncSide_axi_full_argRoute_3_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_4"] = &task_syncSide_axi_full_argRoute_4_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_5"] = &task_syncSide_axi_full_argRoute_5_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_6"] = &task_syncSide_axi_full_argRoute_6_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_7"] = &task_syncSide_axi_full_argRoute_7_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_8"] = &task_syncSide_axi_full_argRoute_8_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_9"] = &task_syncSide_axi_full_argRoute_9_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_10"] = &task_syncSide_axi_full_argRoute_10_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_11"] = &task_syncSide_axi_full_argRoute_11_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_12"] = &task_syncSide_axi_full_argRoute_12_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_13"] = &task_syncSide_axi_full_argRoute_13_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_14"] = &task_syncSide_axi_full_argRoute_14_bridge_.socket;
    sockets_["task_syncSide_axi_full_argRoute_15"] = &task_syncSide_axi_full_argRoute_15_bridge_.socket;

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
    
    task_stealSide_taskOut_16_bridge_.clk(clock);
    task_stealSide_taskOut_16_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_17_bridge_.clk(clock);
    task_stealSide_taskOut_17_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_18_bridge_.clk(clock);
    task_stealSide_taskOut_18_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_19_bridge_.clk(clock);
    task_stealSide_taskOut_19_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_20_bridge_.clk(clock);
    task_stealSide_taskOut_20_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_21_bridge_.clk(clock);
    task_stealSide_taskOut_21_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_22_bridge_.clk(clock);
    task_stealSide_taskOut_22_bridge_.resetn(reset_n_);
    
    task_stealSide_taskOut_23_bridge_.clk(clock);
    task_stealSide_taskOut_23_bridge_.resetn(reset_n_);
    
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
    
    task_stealSide_taskIn_16_bridge_.clk(clock);
    task_stealSide_taskIn_16_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_17_bridge_.clk(clock);
    task_stealSide_taskIn_17_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_18_bridge_.clk(clock);
    task_stealSide_taskIn_18_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_19_bridge_.clk(clock);
    task_stealSide_taskIn_19_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_20_bridge_.clk(clock);
    task_stealSide_taskIn_20_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_21_bridge_.clk(clock);
    task_stealSide_taskIn_21_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_22_bridge_.clk(clock);
    task_stealSide_taskIn_22_bridge_.resetn(reset_n_);
    
    task_stealSide_taskIn_23_bridge_.clk(clock);
    task_stealSide_taskIn_23_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_0_bridge_.clk(clock);
    task_syncSide_addrIn_0_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_1_bridge_.clk(clock);
    task_syncSide_addrIn_1_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_2_bridge_.clk(clock);
    task_syncSide_addrIn_2_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_3_bridge_.clk(clock);
    task_syncSide_addrIn_3_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_4_bridge_.clk(clock);
    task_syncSide_addrIn_4_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_5_bridge_.clk(clock);
    task_syncSide_addrIn_5_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_6_bridge_.clk(clock);
    task_syncSide_addrIn_6_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_7_bridge_.clk(clock);
    task_syncSide_addrIn_7_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_8_bridge_.clk(clock);
    task_syncSide_addrIn_8_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_9_bridge_.clk(clock);
    task_syncSide_addrIn_9_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_10_bridge_.clk(clock);
    task_syncSide_addrIn_10_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_11_bridge_.clk(clock);
    task_syncSide_addrIn_11_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_12_bridge_.clk(clock);
    task_syncSide_addrIn_12_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_13_bridge_.clk(clock);
    task_syncSide_addrIn_13_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_14_bridge_.clk(clock);
    task_syncSide_addrIn_14_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_15_bridge_.clk(clock);
    task_syncSide_addrIn_15_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_16_bridge_.clk(clock);
    task_syncSide_addrIn_16_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_17_bridge_.clk(clock);
    task_syncSide_addrIn_17_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_18_bridge_.clk(clock);
    task_syncSide_addrIn_18_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_19_bridge_.clk(clock);
    task_syncSide_addrIn_19_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_20_bridge_.clk(clock);
    task_syncSide_addrIn_20_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_21_bridge_.clk(clock);
    task_syncSide_addrIn_21_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_22_bridge_.clk(clock);
    task_syncSide_addrIn_22_bridge_.resetn(reset_n_);
    
    task_syncSide_addrIn_23_bridge_.clk(clock);
    task_syncSide_addrIn_23_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_0_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_0_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_1_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_1_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_2_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_2_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_3_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_3_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_4_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_4_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_5_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_5_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_6_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_6_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_7_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_7_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_8_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_8_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_9_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_9_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_10_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_10_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_11_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_11_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_12_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_12_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_13_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_13_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_14_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_14_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_15_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_15_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_16_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_16_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_17_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_17_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_18_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_18_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_19_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_19_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_20_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_20_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_21_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_21_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_22_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_22_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_contOut_23_bridge_.clk(clock);
    task_continuationAllocationSide_contOut_23_bridge_.resetn(reset_n_);
    
    task_stealSide_axi_mgmt_vss_0_bridge_.clk(clock);
    task_stealSide_axi_mgmt_vss_0_bridge_.resetn(reset_n_);
    
    task_stealSide_vss_axi_full_0_bridge_.clk(clock);
    task_stealSide_vss_axi_full_0_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_axi_mgmt_vcas_bridge_.clk(clock);
    task_continuationAllocationSide_axi_mgmt_vcas_bridge_.resetn(reset_n_);
    
    task_continuationAllocationSide_vcas_axi_full_bridge_.clk(clock);
    task_continuationAllocationSide_vcas_axi_full_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_0_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_0_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_1_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_1_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_2_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_2_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_3_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_3_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_4_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_4_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_5_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_5_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_6_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_6_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_7_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_7_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_8_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_8_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_9_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_9_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_10_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_10_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_11_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_11_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_12_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_12_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_13_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_13_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_14_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_14_bridge_.resetn(reset_n_);
    
    task_syncSide_axi_full_argRoute_15_bridge_.clk(clock);
    task_syncSide_axi_full_argRoute_15_bridge_.resetn(reset_n_);
    


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
    task_stealSide_taskOut_16_signals_.connect(task_stealSide_taskOut_16_bridge_);
    task_stealSide_taskOut_17_signals_.connect(task_stealSide_taskOut_17_bridge_);
    task_stealSide_taskOut_18_signals_.connect(task_stealSide_taskOut_18_bridge_);
    task_stealSide_taskOut_19_signals_.connect(task_stealSide_taskOut_19_bridge_);
    task_stealSide_taskOut_20_signals_.connect(task_stealSide_taskOut_20_bridge_);
    task_stealSide_taskOut_21_signals_.connect(task_stealSide_taskOut_21_bridge_);
    task_stealSide_taskOut_22_signals_.connect(task_stealSide_taskOut_22_bridge_);
    task_stealSide_taskOut_23_signals_.connect(task_stealSide_taskOut_23_bridge_);
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
    task_stealSide_taskIn_16_signals_.connect(task_stealSide_taskIn_16_bridge_);
    task_stealSide_taskIn_17_signals_.connect(task_stealSide_taskIn_17_bridge_);
    task_stealSide_taskIn_18_signals_.connect(task_stealSide_taskIn_18_bridge_);
    task_stealSide_taskIn_19_signals_.connect(task_stealSide_taskIn_19_bridge_);
    task_stealSide_taskIn_20_signals_.connect(task_stealSide_taskIn_20_bridge_);
    task_stealSide_taskIn_21_signals_.connect(task_stealSide_taskIn_21_bridge_);
    task_stealSide_taskIn_22_signals_.connect(task_stealSide_taskIn_22_bridge_);
    task_stealSide_taskIn_23_signals_.connect(task_stealSide_taskIn_23_bridge_);
    task_syncSide_addrIn_0_signals_.connect(task_syncSide_addrIn_0_bridge_);
    task_syncSide_addrIn_1_signals_.connect(task_syncSide_addrIn_1_bridge_);
    task_syncSide_addrIn_2_signals_.connect(task_syncSide_addrIn_2_bridge_);
    task_syncSide_addrIn_3_signals_.connect(task_syncSide_addrIn_3_bridge_);
    task_syncSide_addrIn_4_signals_.connect(task_syncSide_addrIn_4_bridge_);
    task_syncSide_addrIn_5_signals_.connect(task_syncSide_addrIn_5_bridge_);
    task_syncSide_addrIn_6_signals_.connect(task_syncSide_addrIn_6_bridge_);
    task_syncSide_addrIn_7_signals_.connect(task_syncSide_addrIn_7_bridge_);
    task_syncSide_addrIn_8_signals_.connect(task_syncSide_addrIn_8_bridge_);
    task_syncSide_addrIn_9_signals_.connect(task_syncSide_addrIn_9_bridge_);
    task_syncSide_addrIn_10_signals_.connect(task_syncSide_addrIn_10_bridge_);
    task_syncSide_addrIn_11_signals_.connect(task_syncSide_addrIn_11_bridge_);
    task_syncSide_addrIn_12_signals_.connect(task_syncSide_addrIn_12_bridge_);
    task_syncSide_addrIn_13_signals_.connect(task_syncSide_addrIn_13_bridge_);
    task_syncSide_addrIn_14_signals_.connect(task_syncSide_addrIn_14_bridge_);
    task_syncSide_addrIn_15_signals_.connect(task_syncSide_addrIn_15_bridge_);
    task_syncSide_addrIn_16_signals_.connect(task_syncSide_addrIn_16_bridge_);
    task_syncSide_addrIn_17_signals_.connect(task_syncSide_addrIn_17_bridge_);
    task_syncSide_addrIn_18_signals_.connect(task_syncSide_addrIn_18_bridge_);
    task_syncSide_addrIn_19_signals_.connect(task_syncSide_addrIn_19_bridge_);
    task_syncSide_addrIn_20_signals_.connect(task_syncSide_addrIn_20_bridge_);
    task_syncSide_addrIn_21_signals_.connect(task_syncSide_addrIn_21_bridge_);
    task_syncSide_addrIn_22_signals_.connect(task_syncSide_addrIn_22_bridge_);
    task_syncSide_addrIn_23_signals_.connect(task_syncSide_addrIn_23_bridge_);
    task_continuationAllocationSide_contOut_0_signals_.connect(task_continuationAllocationSide_contOut_0_bridge_);
    task_continuationAllocationSide_contOut_1_signals_.connect(task_continuationAllocationSide_contOut_1_bridge_);
    task_continuationAllocationSide_contOut_2_signals_.connect(task_continuationAllocationSide_contOut_2_bridge_);
    task_continuationAllocationSide_contOut_3_signals_.connect(task_continuationAllocationSide_contOut_3_bridge_);
    task_continuationAllocationSide_contOut_4_signals_.connect(task_continuationAllocationSide_contOut_4_bridge_);
    task_continuationAllocationSide_contOut_5_signals_.connect(task_continuationAllocationSide_contOut_5_bridge_);
    task_continuationAllocationSide_contOut_6_signals_.connect(task_continuationAllocationSide_contOut_6_bridge_);
    task_continuationAllocationSide_contOut_7_signals_.connect(task_continuationAllocationSide_contOut_7_bridge_);
    task_continuationAllocationSide_contOut_8_signals_.connect(task_continuationAllocationSide_contOut_8_bridge_);
    task_continuationAllocationSide_contOut_9_signals_.connect(task_continuationAllocationSide_contOut_9_bridge_);
    task_continuationAllocationSide_contOut_10_signals_.connect(task_continuationAllocationSide_contOut_10_bridge_);
    task_continuationAllocationSide_contOut_11_signals_.connect(task_continuationAllocationSide_contOut_11_bridge_);
    task_continuationAllocationSide_contOut_12_signals_.connect(task_continuationAllocationSide_contOut_12_bridge_);
    task_continuationAllocationSide_contOut_13_signals_.connect(task_continuationAllocationSide_contOut_13_bridge_);
    task_continuationAllocationSide_contOut_14_signals_.connect(task_continuationAllocationSide_contOut_14_bridge_);
    task_continuationAllocationSide_contOut_15_signals_.connect(task_continuationAllocationSide_contOut_15_bridge_);
    task_continuationAllocationSide_contOut_16_signals_.connect(task_continuationAllocationSide_contOut_16_bridge_);
    task_continuationAllocationSide_contOut_17_signals_.connect(task_continuationAllocationSide_contOut_17_bridge_);
    task_continuationAllocationSide_contOut_18_signals_.connect(task_continuationAllocationSide_contOut_18_bridge_);
    task_continuationAllocationSide_contOut_19_signals_.connect(task_continuationAllocationSide_contOut_19_bridge_);
    task_continuationAllocationSide_contOut_20_signals_.connect(task_continuationAllocationSide_contOut_20_bridge_);
    task_continuationAllocationSide_contOut_21_signals_.connect(task_continuationAllocationSide_contOut_21_bridge_);
    task_continuationAllocationSide_contOut_22_signals_.connect(task_continuationAllocationSide_contOut_22_bridge_);
    task_continuationAllocationSide_contOut_23_signals_.connect(task_continuationAllocationSide_contOut_23_bridge_);
    task_stealSide_axi_mgmt_vss_0_signals_.connect(task_stealSide_axi_mgmt_vss_0_bridge_);
    task_stealSide_vss_axi_full_0_signals_.connect(task_stealSide_vss_axi_full_0_bridge_);
    task_continuationAllocationSide_axi_mgmt_vcas_signals_.connect(task_continuationAllocationSide_axi_mgmt_vcas_bridge_);
    task_continuationAllocationSide_vcas_axi_full_signals_.connect(task_continuationAllocationSide_vcas_axi_full_bridge_);
    task_syncSide_axi_full_argRoute_0_signals_.connect(task_syncSide_axi_full_argRoute_0_bridge_);
    task_syncSide_axi_full_argRoute_1_signals_.connect(task_syncSide_axi_full_argRoute_1_bridge_);
    task_syncSide_axi_full_argRoute_2_signals_.connect(task_syncSide_axi_full_argRoute_2_bridge_);
    task_syncSide_axi_full_argRoute_3_signals_.connect(task_syncSide_axi_full_argRoute_3_bridge_);
    task_syncSide_axi_full_argRoute_4_signals_.connect(task_syncSide_axi_full_argRoute_4_bridge_);
    task_syncSide_axi_full_argRoute_5_signals_.connect(task_syncSide_axi_full_argRoute_5_bridge_);
    task_syncSide_axi_full_argRoute_6_signals_.connect(task_syncSide_axi_full_argRoute_6_bridge_);
    task_syncSide_axi_full_argRoute_7_signals_.connect(task_syncSide_axi_full_argRoute_7_bridge_);
    task_syncSide_axi_full_argRoute_8_signals_.connect(task_syncSide_axi_full_argRoute_8_bridge_);
    task_syncSide_axi_full_argRoute_9_signals_.connect(task_syncSide_axi_full_argRoute_9_bridge_);
    task_syncSide_axi_full_argRoute_10_signals_.connect(task_syncSide_axi_full_argRoute_10_bridge_);
    task_syncSide_axi_full_argRoute_11_signals_.connect(task_syncSide_axi_full_argRoute_11_bridge_);
    task_syncSide_axi_full_argRoute_12_signals_.connect(task_syncSide_axi_full_argRoute_12_bridge_);
    task_syncSide_axi_full_argRoute_13_signals_.connect(task_syncSide_axi_full_argRoute_13_bridge_);
    task_syncSide_axi_full_argRoute_14_signals_.connect(task_syncSide_axi_full_argRoute_14_bridge_);
    task_syncSide_axi_full_argRoute_15_signals_.connect(task_syncSide_axi_full_argRoute_15_bridge_);


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
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_16 */
    /* is_slave = False */
    task_stealSide_taskOut_16_TREADY(task_stealSide_taskOut_16_signals_.tready);
    task_stealSide_taskOut_16_TVALID(task_stealSide_taskOut_16_signals_.tvalid);
    task_stealSide_taskOut_16_TDATA(task_stealSide_taskOut_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_17 */
    /* is_slave = False */
    task_stealSide_taskOut_17_TREADY(task_stealSide_taskOut_17_signals_.tready);
    task_stealSide_taskOut_17_TVALID(task_stealSide_taskOut_17_signals_.tvalid);
    task_stealSide_taskOut_17_TDATA(task_stealSide_taskOut_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_18 */
    /* is_slave = False */
    task_stealSide_taskOut_18_TREADY(task_stealSide_taskOut_18_signals_.tready);
    task_stealSide_taskOut_18_TVALID(task_stealSide_taskOut_18_signals_.tvalid);
    task_stealSide_taskOut_18_TDATA(task_stealSide_taskOut_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_19 */
    /* is_slave = False */
    task_stealSide_taskOut_19_TREADY(task_stealSide_taskOut_19_signals_.tready);
    task_stealSide_taskOut_19_TVALID(task_stealSide_taskOut_19_signals_.tvalid);
    task_stealSide_taskOut_19_TDATA(task_stealSide_taskOut_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_20 */
    /* is_slave = False */
    task_stealSide_taskOut_20_TREADY(task_stealSide_taskOut_20_signals_.tready);
    task_stealSide_taskOut_20_TVALID(task_stealSide_taskOut_20_signals_.tvalid);
    task_stealSide_taskOut_20_TDATA(task_stealSide_taskOut_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_21 */
    /* is_slave = False */
    task_stealSide_taskOut_21_TREADY(task_stealSide_taskOut_21_signals_.tready);
    task_stealSide_taskOut_21_TVALID(task_stealSide_taskOut_21_signals_.tvalid);
    task_stealSide_taskOut_21_TDATA(task_stealSide_taskOut_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_22 */
    /* is_slave = False */
    task_stealSide_taskOut_22_TREADY(task_stealSide_taskOut_22_signals_.tready);
    task_stealSide_taskOut_22_TVALID(task_stealSide_taskOut_22_signals_.tvalid);
    task_stealSide_taskOut_22_TDATA(task_stealSide_taskOut_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskOut_23 */
    /* is_slave = False */
    task_stealSide_taskOut_23_TREADY(task_stealSide_taskOut_23_signals_.tready);
    task_stealSide_taskOut_23_TVALID(task_stealSide_taskOut_23_signals_.tvalid);
    task_stealSide_taskOut_23_TDATA(task_stealSide_taskOut_23_signals_.tdata);
    
    
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
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_16 */
    /* is_slave = True */
    task_stealSide_taskIn_16_TREADY(task_stealSide_taskIn_16_signals_.tready);
    task_stealSide_taskIn_16_TVALID(task_stealSide_taskIn_16_signals_.tvalid);
    task_stealSide_taskIn_16_TDATA(task_stealSide_taskIn_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_17 */
    /* is_slave = True */
    task_stealSide_taskIn_17_TREADY(task_stealSide_taskIn_17_signals_.tready);
    task_stealSide_taskIn_17_TVALID(task_stealSide_taskIn_17_signals_.tvalid);
    task_stealSide_taskIn_17_TDATA(task_stealSide_taskIn_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_18 */
    /* is_slave = True */
    task_stealSide_taskIn_18_TREADY(task_stealSide_taskIn_18_signals_.tready);
    task_stealSide_taskIn_18_TVALID(task_stealSide_taskIn_18_signals_.tvalid);
    task_stealSide_taskIn_18_TDATA(task_stealSide_taskIn_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_19 */
    /* is_slave = True */
    task_stealSide_taskIn_19_TREADY(task_stealSide_taskIn_19_signals_.tready);
    task_stealSide_taskIn_19_TVALID(task_stealSide_taskIn_19_signals_.tvalid);
    task_stealSide_taskIn_19_TDATA(task_stealSide_taskIn_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_20 */
    /* is_slave = True */
    task_stealSide_taskIn_20_TREADY(task_stealSide_taskIn_20_signals_.tready);
    task_stealSide_taskIn_20_TVALID(task_stealSide_taskIn_20_signals_.tvalid);
    task_stealSide_taskIn_20_TDATA(task_stealSide_taskIn_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_21 */
    /* is_slave = True */
    task_stealSide_taskIn_21_TREADY(task_stealSide_taskIn_21_signals_.tready);
    task_stealSide_taskIn_21_TVALID(task_stealSide_taskIn_21_signals_.tvalid);
    task_stealSide_taskIn_21_TDATA(task_stealSide_taskIn_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_22 */
    /* is_slave = True */
    task_stealSide_taskIn_22_TREADY(task_stealSide_taskIn_22_signals_.tready);
    task_stealSide_taskIn_22_TVALID(task_stealSide_taskIn_22_signals_.tvalid);
    task_stealSide_taskIn_22_TDATA(task_stealSide_taskIn_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_stealSide_taskIn_23 */
    /* is_slave = True */
    task_stealSide_taskIn_23_TREADY(task_stealSide_taskIn_23_signals_.tready);
    task_stealSide_taskIn_23_TVALID(task_stealSide_taskIn_23_signals_.tvalid);
    task_stealSide_taskIn_23_TDATA(task_stealSide_taskIn_23_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_0 */
    /* is_slave = True */
    task_syncSide_addrIn_0_TREADY(task_syncSide_addrIn_0_signals_.tready);
    task_syncSide_addrIn_0_TVALID(task_syncSide_addrIn_0_signals_.tvalid);
    task_syncSide_addrIn_0_TDATA(task_syncSide_addrIn_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_1 */
    /* is_slave = True */
    task_syncSide_addrIn_1_TREADY(task_syncSide_addrIn_1_signals_.tready);
    task_syncSide_addrIn_1_TVALID(task_syncSide_addrIn_1_signals_.tvalid);
    task_syncSide_addrIn_1_TDATA(task_syncSide_addrIn_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_2 */
    /* is_slave = True */
    task_syncSide_addrIn_2_TREADY(task_syncSide_addrIn_2_signals_.tready);
    task_syncSide_addrIn_2_TVALID(task_syncSide_addrIn_2_signals_.tvalid);
    task_syncSide_addrIn_2_TDATA(task_syncSide_addrIn_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_3 */
    /* is_slave = True */
    task_syncSide_addrIn_3_TREADY(task_syncSide_addrIn_3_signals_.tready);
    task_syncSide_addrIn_3_TVALID(task_syncSide_addrIn_3_signals_.tvalid);
    task_syncSide_addrIn_3_TDATA(task_syncSide_addrIn_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_4 */
    /* is_slave = True */
    task_syncSide_addrIn_4_TREADY(task_syncSide_addrIn_4_signals_.tready);
    task_syncSide_addrIn_4_TVALID(task_syncSide_addrIn_4_signals_.tvalid);
    task_syncSide_addrIn_4_TDATA(task_syncSide_addrIn_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_5 */
    /* is_slave = True */
    task_syncSide_addrIn_5_TREADY(task_syncSide_addrIn_5_signals_.tready);
    task_syncSide_addrIn_5_TVALID(task_syncSide_addrIn_5_signals_.tvalid);
    task_syncSide_addrIn_5_TDATA(task_syncSide_addrIn_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_6 */
    /* is_slave = True */
    task_syncSide_addrIn_6_TREADY(task_syncSide_addrIn_6_signals_.tready);
    task_syncSide_addrIn_6_TVALID(task_syncSide_addrIn_6_signals_.tvalid);
    task_syncSide_addrIn_6_TDATA(task_syncSide_addrIn_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_7 */
    /* is_slave = True */
    task_syncSide_addrIn_7_TREADY(task_syncSide_addrIn_7_signals_.tready);
    task_syncSide_addrIn_7_TVALID(task_syncSide_addrIn_7_signals_.tvalid);
    task_syncSide_addrIn_7_TDATA(task_syncSide_addrIn_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_8 */
    /* is_slave = True */
    task_syncSide_addrIn_8_TREADY(task_syncSide_addrIn_8_signals_.tready);
    task_syncSide_addrIn_8_TVALID(task_syncSide_addrIn_8_signals_.tvalid);
    task_syncSide_addrIn_8_TDATA(task_syncSide_addrIn_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_9 */
    /* is_slave = True */
    task_syncSide_addrIn_9_TREADY(task_syncSide_addrIn_9_signals_.tready);
    task_syncSide_addrIn_9_TVALID(task_syncSide_addrIn_9_signals_.tvalid);
    task_syncSide_addrIn_9_TDATA(task_syncSide_addrIn_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_10 */
    /* is_slave = True */
    task_syncSide_addrIn_10_TREADY(task_syncSide_addrIn_10_signals_.tready);
    task_syncSide_addrIn_10_TVALID(task_syncSide_addrIn_10_signals_.tvalid);
    task_syncSide_addrIn_10_TDATA(task_syncSide_addrIn_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_11 */
    /* is_slave = True */
    task_syncSide_addrIn_11_TREADY(task_syncSide_addrIn_11_signals_.tready);
    task_syncSide_addrIn_11_TVALID(task_syncSide_addrIn_11_signals_.tvalid);
    task_syncSide_addrIn_11_TDATA(task_syncSide_addrIn_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_12 */
    /* is_slave = True */
    task_syncSide_addrIn_12_TREADY(task_syncSide_addrIn_12_signals_.tready);
    task_syncSide_addrIn_12_TVALID(task_syncSide_addrIn_12_signals_.tvalid);
    task_syncSide_addrIn_12_TDATA(task_syncSide_addrIn_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_13 */
    /* is_slave = True */
    task_syncSide_addrIn_13_TREADY(task_syncSide_addrIn_13_signals_.tready);
    task_syncSide_addrIn_13_TVALID(task_syncSide_addrIn_13_signals_.tvalid);
    task_syncSide_addrIn_13_TDATA(task_syncSide_addrIn_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_14 */
    /* is_slave = True */
    task_syncSide_addrIn_14_TREADY(task_syncSide_addrIn_14_signals_.tready);
    task_syncSide_addrIn_14_TVALID(task_syncSide_addrIn_14_signals_.tvalid);
    task_syncSide_addrIn_14_TDATA(task_syncSide_addrIn_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_15 */
    /* is_slave = True */
    task_syncSide_addrIn_15_TREADY(task_syncSide_addrIn_15_signals_.tready);
    task_syncSide_addrIn_15_TVALID(task_syncSide_addrIn_15_signals_.tvalid);
    task_syncSide_addrIn_15_TDATA(task_syncSide_addrIn_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_16 */
    /* is_slave = True */
    task_syncSide_addrIn_16_TREADY(task_syncSide_addrIn_16_signals_.tready);
    task_syncSide_addrIn_16_TVALID(task_syncSide_addrIn_16_signals_.tvalid);
    task_syncSide_addrIn_16_TDATA(task_syncSide_addrIn_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_17 */
    /* is_slave = True */
    task_syncSide_addrIn_17_TREADY(task_syncSide_addrIn_17_signals_.tready);
    task_syncSide_addrIn_17_TVALID(task_syncSide_addrIn_17_signals_.tvalid);
    task_syncSide_addrIn_17_TDATA(task_syncSide_addrIn_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_18 */
    /* is_slave = True */
    task_syncSide_addrIn_18_TREADY(task_syncSide_addrIn_18_signals_.tready);
    task_syncSide_addrIn_18_TVALID(task_syncSide_addrIn_18_signals_.tvalid);
    task_syncSide_addrIn_18_TDATA(task_syncSide_addrIn_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_19 */
    /* is_slave = True */
    task_syncSide_addrIn_19_TREADY(task_syncSide_addrIn_19_signals_.tready);
    task_syncSide_addrIn_19_TVALID(task_syncSide_addrIn_19_signals_.tvalid);
    task_syncSide_addrIn_19_TDATA(task_syncSide_addrIn_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_20 */
    /* is_slave = True */
    task_syncSide_addrIn_20_TREADY(task_syncSide_addrIn_20_signals_.tready);
    task_syncSide_addrIn_20_TVALID(task_syncSide_addrIn_20_signals_.tvalid);
    task_syncSide_addrIn_20_TDATA(task_syncSide_addrIn_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_21 */
    /* is_slave = True */
    task_syncSide_addrIn_21_TREADY(task_syncSide_addrIn_21_signals_.tready);
    task_syncSide_addrIn_21_TVALID(task_syncSide_addrIn_21_signals_.tvalid);
    task_syncSide_addrIn_21_TDATA(task_syncSide_addrIn_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_22 */
    /* is_slave = True */
    task_syncSide_addrIn_22_TREADY(task_syncSide_addrIn_22_signals_.tready);
    task_syncSide_addrIn_22_TVALID(task_syncSide_addrIn_22_signals_.tvalid);
    task_syncSide_addrIn_22_TDATA(task_syncSide_addrIn_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_syncSide_addrIn_23 */
    /* is_slave = True */
    task_syncSide_addrIn_23_TREADY(task_syncSide_addrIn_23_signals_.tready);
    task_syncSide_addrIn_23_TVALID(task_syncSide_addrIn_23_signals_.tvalid);
    task_syncSide_addrIn_23_TDATA(task_syncSide_addrIn_23_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_0 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_0_TREADY(task_continuationAllocationSide_contOut_0_signals_.tready);
    task_continuationAllocationSide_contOut_0_TVALID(task_continuationAllocationSide_contOut_0_signals_.tvalid);
    task_continuationAllocationSide_contOut_0_TDATA(task_continuationAllocationSide_contOut_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_1 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_1_TREADY(task_continuationAllocationSide_contOut_1_signals_.tready);
    task_continuationAllocationSide_contOut_1_TVALID(task_continuationAllocationSide_contOut_1_signals_.tvalid);
    task_continuationAllocationSide_contOut_1_TDATA(task_continuationAllocationSide_contOut_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_2 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_2_TREADY(task_continuationAllocationSide_contOut_2_signals_.tready);
    task_continuationAllocationSide_contOut_2_TVALID(task_continuationAllocationSide_contOut_2_signals_.tvalid);
    task_continuationAllocationSide_contOut_2_TDATA(task_continuationAllocationSide_contOut_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_3 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_3_TREADY(task_continuationAllocationSide_contOut_3_signals_.tready);
    task_continuationAllocationSide_contOut_3_TVALID(task_continuationAllocationSide_contOut_3_signals_.tvalid);
    task_continuationAllocationSide_contOut_3_TDATA(task_continuationAllocationSide_contOut_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_4 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_4_TREADY(task_continuationAllocationSide_contOut_4_signals_.tready);
    task_continuationAllocationSide_contOut_4_TVALID(task_continuationAllocationSide_contOut_4_signals_.tvalid);
    task_continuationAllocationSide_contOut_4_TDATA(task_continuationAllocationSide_contOut_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_5 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_5_TREADY(task_continuationAllocationSide_contOut_5_signals_.tready);
    task_continuationAllocationSide_contOut_5_TVALID(task_continuationAllocationSide_contOut_5_signals_.tvalid);
    task_continuationAllocationSide_contOut_5_TDATA(task_continuationAllocationSide_contOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_6 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_6_TREADY(task_continuationAllocationSide_contOut_6_signals_.tready);
    task_continuationAllocationSide_contOut_6_TVALID(task_continuationAllocationSide_contOut_6_signals_.tvalid);
    task_continuationAllocationSide_contOut_6_TDATA(task_continuationAllocationSide_contOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_7 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_7_TREADY(task_continuationAllocationSide_contOut_7_signals_.tready);
    task_continuationAllocationSide_contOut_7_TVALID(task_continuationAllocationSide_contOut_7_signals_.tvalid);
    task_continuationAllocationSide_contOut_7_TDATA(task_continuationAllocationSide_contOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_8 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_8_TREADY(task_continuationAllocationSide_contOut_8_signals_.tready);
    task_continuationAllocationSide_contOut_8_TVALID(task_continuationAllocationSide_contOut_8_signals_.tvalid);
    task_continuationAllocationSide_contOut_8_TDATA(task_continuationAllocationSide_contOut_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_9 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_9_TREADY(task_continuationAllocationSide_contOut_9_signals_.tready);
    task_continuationAllocationSide_contOut_9_TVALID(task_continuationAllocationSide_contOut_9_signals_.tvalid);
    task_continuationAllocationSide_contOut_9_TDATA(task_continuationAllocationSide_contOut_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_10 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_10_TREADY(task_continuationAllocationSide_contOut_10_signals_.tready);
    task_continuationAllocationSide_contOut_10_TVALID(task_continuationAllocationSide_contOut_10_signals_.tvalid);
    task_continuationAllocationSide_contOut_10_TDATA(task_continuationAllocationSide_contOut_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_11 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_11_TREADY(task_continuationAllocationSide_contOut_11_signals_.tready);
    task_continuationAllocationSide_contOut_11_TVALID(task_continuationAllocationSide_contOut_11_signals_.tvalid);
    task_continuationAllocationSide_contOut_11_TDATA(task_continuationAllocationSide_contOut_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_12 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_12_TREADY(task_continuationAllocationSide_contOut_12_signals_.tready);
    task_continuationAllocationSide_contOut_12_TVALID(task_continuationAllocationSide_contOut_12_signals_.tvalid);
    task_continuationAllocationSide_contOut_12_TDATA(task_continuationAllocationSide_contOut_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_13 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_13_TREADY(task_continuationAllocationSide_contOut_13_signals_.tready);
    task_continuationAllocationSide_contOut_13_TVALID(task_continuationAllocationSide_contOut_13_signals_.tvalid);
    task_continuationAllocationSide_contOut_13_TDATA(task_continuationAllocationSide_contOut_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_14 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_14_TREADY(task_continuationAllocationSide_contOut_14_signals_.tready);
    task_continuationAllocationSide_contOut_14_TVALID(task_continuationAllocationSide_contOut_14_signals_.tvalid);
    task_continuationAllocationSide_contOut_14_TDATA(task_continuationAllocationSide_contOut_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_15 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_15_TREADY(task_continuationAllocationSide_contOut_15_signals_.tready);
    task_continuationAllocationSide_contOut_15_TVALID(task_continuationAllocationSide_contOut_15_signals_.tvalid);
    task_continuationAllocationSide_contOut_15_TDATA(task_continuationAllocationSide_contOut_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_16 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_16_TREADY(task_continuationAllocationSide_contOut_16_signals_.tready);
    task_continuationAllocationSide_contOut_16_TVALID(task_continuationAllocationSide_contOut_16_signals_.tvalid);
    task_continuationAllocationSide_contOut_16_TDATA(task_continuationAllocationSide_contOut_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_17 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_17_TREADY(task_continuationAllocationSide_contOut_17_signals_.tready);
    task_continuationAllocationSide_contOut_17_TVALID(task_continuationAllocationSide_contOut_17_signals_.tvalid);
    task_continuationAllocationSide_contOut_17_TDATA(task_continuationAllocationSide_contOut_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_18 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_18_TREADY(task_continuationAllocationSide_contOut_18_signals_.tready);
    task_continuationAllocationSide_contOut_18_TVALID(task_continuationAllocationSide_contOut_18_signals_.tvalid);
    task_continuationAllocationSide_contOut_18_TDATA(task_continuationAllocationSide_contOut_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_19 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_19_TREADY(task_continuationAllocationSide_contOut_19_signals_.tready);
    task_continuationAllocationSide_contOut_19_TVALID(task_continuationAllocationSide_contOut_19_signals_.tvalid);
    task_continuationAllocationSide_contOut_19_TDATA(task_continuationAllocationSide_contOut_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_20 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_20_TREADY(task_continuationAllocationSide_contOut_20_signals_.tready);
    task_continuationAllocationSide_contOut_20_TVALID(task_continuationAllocationSide_contOut_20_signals_.tvalid);
    task_continuationAllocationSide_contOut_20_TDATA(task_continuationAllocationSide_contOut_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_21 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_21_TREADY(task_continuationAllocationSide_contOut_21_signals_.tready);
    task_continuationAllocationSide_contOut_21_TVALID(task_continuationAllocationSide_contOut_21_signals_.tvalid);
    task_continuationAllocationSide_contOut_21_TDATA(task_continuationAllocationSide_contOut_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_22 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_22_TREADY(task_continuationAllocationSide_contOut_22_signals_.tready);
    task_continuationAllocationSide_contOut_22_TVALID(task_continuationAllocationSide_contOut_22_signals_.tvalid);
    task_continuationAllocationSide_contOut_22_TDATA(task_continuationAllocationSide_contOut_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: task_continuationAllocationSide_contOut_23 */
    /* is_slave = False */
    task_continuationAllocationSide_contOut_23_TREADY(task_continuationAllocationSide_contOut_23_signals_.tready);
    task_continuationAllocationSide_contOut_23_TVALID(task_continuationAllocationSide_contOut_23_signals_.tvalid);
    task_continuationAllocationSide_contOut_23_TDATA(task_continuationAllocationSide_contOut_23_signals_.tdata);
    
    
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
    
    
    /* connecting AXI4-Lite interface with name: task_continuationAllocationSide_axi_mgmt_vcas */
    /* is_slave = True */
    task_continuationAllocationSide_axi_mgmt_vcas_AWVALID(task_continuationAllocationSide_axi_mgmt_vcas_signals_.awvalid);
    task_continuationAllocationSide_axi_mgmt_vcas_AWREADY(task_continuationAllocationSide_axi_mgmt_vcas_signals_.awready);
    task_continuationAllocationSide_axi_mgmt_vcas_AWADDR(task_continuationAllocationSide_axi_mgmt_vcas_signals_.awaddr);
    task_continuationAllocationSide_axi_mgmt_vcas_AWPROT(task_continuationAllocationSide_axi_mgmt_vcas_signals_.awprot);
    task_continuationAllocationSide_axi_mgmt_vcas_WVALID(task_continuationAllocationSide_axi_mgmt_vcas_signals_.wvalid);
    task_continuationAllocationSide_axi_mgmt_vcas_WREADY(task_continuationAllocationSide_axi_mgmt_vcas_signals_.wready);
    task_continuationAllocationSide_axi_mgmt_vcas_WDATA(task_continuationAllocationSide_axi_mgmt_vcas_signals_.wdata);
    task_continuationAllocationSide_axi_mgmt_vcas_WSTRB(task_continuationAllocationSide_axi_mgmt_vcas_signals_.wstrb);
    task_continuationAllocationSide_axi_mgmt_vcas_BVALID(task_continuationAllocationSide_axi_mgmt_vcas_signals_.bvalid);
    task_continuationAllocationSide_axi_mgmt_vcas_BREADY(task_continuationAllocationSide_axi_mgmt_vcas_signals_.bready);
    task_continuationAllocationSide_axi_mgmt_vcas_BRESP(task_continuationAllocationSide_axi_mgmt_vcas_signals_.bresp);
    task_continuationAllocationSide_axi_mgmt_vcas_ARVALID(task_continuationAllocationSide_axi_mgmt_vcas_signals_.arvalid);
    task_continuationAllocationSide_axi_mgmt_vcas_ARREADY(task_continuationAllocationSide_axi_mgmt_vcas_signals_.arready);
    task_continuationAllocationSide_axi_mgmt_vcas_ARADDR(task_continuationAllocationSide_axi_mgmt_vcas_signals_.araddr);
    task_continuationAllocationSide_axi_mgmt_vcas_ARPROT(task_continuationAllocationSide_axi_mgmt_vcas_signals_.arprot);
    task_continuationAllocationSide_axi_mgmt_vcas_RVALID(task_continuationAllocationSide_axi_mgmt_vcas_signals_.rvalid);
    task_continuationAllocationSide_axi_mgmt_vcas_RREADY(task_continuationAllocationSide_axi_mgmt_vcas_signals_.rready);
    task_continuationAllocationSide_axi_mgmt_vcas_RDATA(task_continuationAllocationSide_axi_mgmt_vcas_signals_.rdata);
    task_continuationAllocationSide_axi_mgmt_vcas_RRESP(task_continuationAllocationSide_axi_mgmt_vcas_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: task_continuationAllocationSide_vcas_axi_full */
    /* is_slave = False */
    task_continuationAllocationSide_vcas_axi_full_AWVALID(task_continuationAllocationSide_vcas_axi_full_signals_.awvalid);
    task_continuationAllocationSide_vcas_axi_full_AWREADY(task_continuationAllocationSide_vcas_axi_full_signals_.awready);
    task_continuationAllocationSide_vcas_axi_full_AWADDR(task_continuationAllocationSide_vcas_axi_full_signals_.awaddr);
    task_continuationAllocationSide_vcas_axi_full_AWPROT(task_continuationAllocationSide_vcas_axi_full_signals_.awprot);
    task_continuationAllocationSide_vcas_axi_full_AWREGION(task_continuationAllocationSide_vcas_axi_full_signals_.awregion);
    task_continuationAllocationSide_vcas_axi_full_AWQOS(task_continuationAllocationSide_vcas_axi_full_signals_.awqos);
    task_continuationAllocationSide_vcas_axi_full_AWCACHE(task_continuationAllocationSide_vcas_axi_full_signals_.awcache);
    task_continuationAllocationSide_vcas_axi_full_AWBURST(task_continuationAllocationSide_vcas_axi_full_signals_.awburst);
    task_continuationAllocationSide_vcas_axi_full_AWSIZE(task_continuationAllocationSide_vcas_axi_full_signals_.awsize);
    task_continuationAllocationSide_vcas_axi_full_AWLEN(task_continuationAllocationSide_vcas_axi_full_signals_.awlen);
    task_continuationAllocationSide_vcas_axi_full_AWID(task_continuationAllocationSide_vcas_axi_full_signals_.awid);
    task_continuationAllocationSide_vcas_axi_full_AWLOCK(task_continuationAllocationSide_vcas_axi_full_signals_.awlock);
    task_continuationAllocationSide_vcas_axi_full_WID(task_continuationAllocationSide_vcas_axi_full_signals_.wid);
    task_continuationAllocationSide_vcas_axi_full_WVALID(task_continuationAllocationSide_vcas_axi_full_signals_.wvalid);
    task_continuationAllocationSide_vcas_axi_full_WREADY(task_continuationAllocationSide_vcas_axi_full_signals_.wready);
    task_continuationAllocationSide_vcas_axi_full_WDATA(task_continuationAllocationSide_vcas_axi_full_signals_.wdata);
    task_continuationAllocationSide_vcas_axi_full_WSTRB(task_continuationAllocationSide_vcas_axi_full_signals_.wstrb);
    task_continuationAllocationSide_vcas_axi_full_WLAST(task_continuationAllocationSide_vcas_axi_full_signals_.wlast);
    task_continuationAllocationSide_vcas_axi_full_BVALID(task_continuationAllocationSide_vcas_axi_full_signals_.bvalid);
    task_continuationAllocationSide_vcas_axi_full_BREADY(task_continuationAllocationSide_vcas_axi_full_signals_.bready);
    task_continuationAllocationSide_vcas_axi_full_BRESP(task_continuationAllocationSide_vcas_axi_full_signals_.bresp);
    task_continuationAllocationSide_vcas_axi_full_BID(task_continuationAllocationSide_vcas_axi_full_signals_.bid);
    task_continuationAllocationSide_vcas_axi_full_ARVALID(task_continuationAllocationSide_vcas_axi_full_signals_.arvalid);
    task_continuationAllocationSide_vcas_axi_full_ARREADY(task_continuationAllocationSide_vcas_axi_full_signals_.arready);
    task_continuationAllocationSide_vcas_axi_full_ARADDR(task_continuationAllocationSide_vcas_axi_full_signals_.araddr);
    task_continuationAllocationSide_vcas_axi_full_ARPROT(task_continuationAllocationSide_vcas_axi_full_signals_.arprot);
    task_continuationAllocationSide_vcas_axi_full_ARREGION(task_continuationAllocationSide_vcas_axi_full_signals_.arregion);
    task_continuationAllocationSide_vcas_axi_full_ARQOS(task_continuationAllocationSide_vcas_axi_full_signals_.arqos);
    task_continuationAllocationSide_vcas_axi_full_ARCACHE(task_continuationAllocationSide_vcas_axi_full_signals_.arcache);
    task_continuationAllocationSide_vcas_axi_full_ARBURST(task_continuationAllocationSide_vcas_axi_full_signals_.arburst);
    task_continuationAllocationSide_vcas_axi_full_ARSIZE(task_continuationAllocationSide_vcas_axi_full_signals_.arsize);
    task_continuationAllocationSide_vcas_axi_full_ARLEN(task_continuationAllocationSide_vcas_axi_full_signals_.arlen);
    task_continuationAllocationSide_vcas_axi_full_ARID(task_continuationAllocationSide_vcas_axi_full_signals_.arid);
    task_continuationAllocationSide_vcas_axi_full_ARLOCK(task_continuationAllocationSide_vcas_axi_full_signals_.arlock);
    task_continuationAllocationSide_vcas_axi_full_RVALID(task_continuationAllocationSide_vcas_axi_full_signals_.rvalid);
    task_continuationAllocationSide_vcas_axi_full_RREADY(task_continuationAllocationSide_vcas_axi_full_signals_.rready);
    task_continuationAllocationSide_vcas_axi_full_RDATA(task_continuationAllocationSide_vcas_axi_full_signals_.rdata);
    task_continuationAllocationSide_vcas_axi_full_RRESP(task_continuationAllocationSide_vcas_axi_full_signals_.rresp);
    task_continuationAllocationSide_vcas_axi_full_RID(task_continuationAllocationSide_vcas_axi_full_signals_.rid);
    task_continuationAllocationSide_vcas_axi_full_RLAST(task_continuationAllocationSide_vcas_axi_full_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_0 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_0_AWVALID(task_syncSide_axi_full_argRoute_0_signals_.awvalid);
    task_syncSide_axi_full_argRoute_0_AWREADY(task_syncSide_axi_full_argRoute_0_signals_.awready);
    task_syncSide_axi_full_argRoute_0_AWADDR(task_syncSide_axi_full_argRoute_0_signals_.awaddr);
    task_syncSide_axi_full_argRoute_0_AWPROT(task_syncSide_axi_full_argRoute_0_signals_.awprot);
    task_syncSide_axi_full_argRoute_0_AWREGION(task_syncSide_axi_full_argRoute_0_signals_.awregion);
    task_syncSide_axi_full_argRoute_0_AWQOS(task_syncSide_axi_full_argRoute_0_signals_.awqos);
    task_syncSide_axi_full_argRoute_0_AWCACHE(task_syncSide_axi_full_argRoute_0_signals_.awcache);
    task_syncSide_axi_full_argRoute_0_AWBURST(task_syncSide_axi_full_argRoute_0_signals_.awburst);
    task_syncSide_axi_full_argRoute_0_AWSIZE(task_syncSide_axi_full_argRoute_0_signals_.awsize);
    task_syncSide_axi_full_argRoute_0_AWLEN(task_syncSide_axi_full_argRoute_0_signals_.awlen);
    task_syncSide_axi_full_argRoute_0_AWID(task_syncSide_axi_full_argRoute_0_signals_.awid);
    task_syncSide_axi_full_argRoute_0_AWLOCK(task_syncSide_axi_full_argRoute_0_signals_.awlock);
    task_syncSide_axi_full_argRoute_0_WID(task_syncSide_axi_full_argRoute_0_signals_.wid);
    task_syncSide_axi_full_argRoute_0_WVALID(task_syncSide_axi_full_argRoute_0_signals_.wvalid);
    task_syncSide_axi_full_argRoute_0_WREADY(task_syncSide_axi_full_argRoute_0_signals_.wready);
    task_syncSide_axi_full_argRoute_0_WDATA(task_syncSide_axi_full_argRoute_0_signals_.wdata);
    task_syncSide_axi_full_argRoute_0_WSTRB(task_syncSide_axi_full_argRoute_0_signals_.wstrb);
    task_syncSide_axi_full_argRoute_0_WLAST(task_syncSide_axi_full_argRoute_0_signals_.wlast);
    task_syncSide_axi_full_argRoute_0_BVALID(task_syncSide_axi_full_argRoute_0_signals_.bvalid);
    task_syncSide_axi_full_argRoute_0_BREADY(task_syncSide_axi_full_argRoute_0_signals_.bready);
    task_syncSide_axi_full_argRoute_0_BRESP(task_syncSide_axi_full_argRoute_0_signals_.bresp);
    task_syncSide_axi_full_argRoute_0_BID(task_syncSide_axi_full_argRoute_0_signals_.bid);
    task_syncSide_axi_full_argRoute_0_ARVALID(task_syncSide_axi_full_argRoute_0_signals_.arvalid);
    task_syncSide_axi_full_argRoute_0_ARREADY(task_syncSide_axi_full_argRoute_0_signals_.arready);
    task_syncSide_axi_full_argRoute_0_ARADDR(task_syncSide_axi_full_argRoute_0_signals_.araddr);
    task_syncSide_axi_full_argRoute_0_ARPROT(task_syncSide_axi_full_argRoute_0_signals_.arprot);
    task_syncSide_axi_full_argRoute_0_ARREGION(task_syncSide_axi_full_argRoute_0_signals_.arregion);
    task_syncSide_axi_full_argRoute_0_ARQOS(task_syncSide_axi_full_argRoute_0_signals_.arqos);
    task_syncSide_axi_full_argRoute_0_ARCACHE(task_syncSide_axi_full_argRoute_0_signals_.arcache);
    task_syncSide_axi_full_argRoute_0_ARBURST(task_syncSide_axi_full_argRoute_0_signals_.arburst);
    task_syncSide_axi_full_argRoute_0_ARSIZE(task_syncSide_axi_full_argRoute_0_signals_.arsize);
    task_syncSide_axi_full_argRoute_0_ARLEN(task_syncSide_axi_full_argRoute_0_signals_.arlen);
    task_syncSide_axi_full_argRoute_0_ARID(task_syncSide_axi_full_argRoute_0_signals_.arid);
    task_syncSide_axi_full_argRoute_0_ARLOCK(task_syncSide_axi_full_argRoute_0_signals_.arlock);
    task_syncSide_axi_full_argRoute_0_RVALID(task_syncSide_axi_full_argRoute_0_signals_.rvalid);
    task_syncSide_axi_full_argRoute_0_RREADY(task_syncSide_axi_full_argRoute_0_signals_.rready);
    task_syncSide_axi_full_argRoute_0_RDATA(task_syncSide_axi_full_argRoute_0_signals_.rdata);
    task_syncSide_axi_full_argRoute_0_RRESP(task_syncSide_axi_full_argRoute_0_signals_.rresp);
    task_syncSide_axi_full_argRoute_0_RID(task_syncSide_axi_full_argRoute_0_signals_.rid);
    task_syncSide_axi_full_argRoute_0_RLAST(task_syncSide_axi_full_argRoute_0_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_1 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_1_AWVALID(task_syncSide_axi_full_argRoute_1_signals_.awvalid);
    task_syncSide_axi_full_argRoute_1_AWREADY(task_syncSide_axi_full_argRoute_1_signals_.awready);
    task_syncSide_axi_full_argRoute_1_AWADDR(task_syncSide_axi_full_argRoute_1_signals_.awaddr);
    task_syncSide_axi_full_argRoute_1_AWPROT(task_syncSide_axi_full_argRoute_1_signals_.awprot);
    task_syncSide_axi_full_argRoute_1_AWREGION(task_syncSide_axi_full_argRoute_1_signals_.awregion);
    task_syncSide_axi_full_argRoute_1_AWQOS(task_syncSide_axi_full_argRoute_1_signals_.awqos);
    task_syncSide_axi_full_argRoute_1_AWCACHE(task_syncSide_axi_full_argRoute_1_signals_.awcache);
    task_syncSide_axi_full_argRoute_1_AWBURST(task_syncSide_axi_full_argRoute_1_signals_.awburst);
    task_syncSide_axi_full_argRoute_1_AWSIZE(task_syncSide_axi_full_argRoute_1_signals_.awsize);
    task_syncSide_axi_full_argRoute_1_AWLEN(task_syncSide_axi_full_argRoute_1_signals_.awlen);
    task_syncSide_axi_full_argRoute_1_AWID(task_syncSide_axi_full_argRoute_1_signals_.awid);
    task_syncSide_axi_full_argRoute_1_AWLOCK(task_syncSide_axi_full_argRoute_1_signals_.awlock);
    task_syncSide_axi_full_argRoute_1_WID(task_syncSide_axi_full_argRoute_1_signals_.wid);
    task_syncSide_axi_full_argRoute_1_WVALID(task_syncSide_axi_full_argRoute_1_signals_.wvalid);
    task_syncSide_axi_full_argRoute_1_WREADY(task_syncSide_axi_full_argRoute_1_signals_.wready);
    task_syncSide_axi_full_argRoute_1_WDATA(task_syncSide_axi_full_argRoute_1_signals_.wdata);
    task_syncSide_axi_full_argRoute_1_WSTRB(task_syncSide_axi_full_argRoute_1_signals_.wstrb);
    task_syncSide_axi_full_argRoute_1_WLAST(task_syncSide_axi_full_argRoute_1_signals_.wlast);
    task_syncSide_axi_full_argRoute_1_BVALID(task_syncSide_axi_full_argRoute_1_signals_.bvalid);
    task_syncSide_axi_full_argRoute_1_BREADY(task_syncSide_axi_full_argRoute_1_signals_.bready);
    task_syncSide_axi_full_argRoute_1_BRESP(task_syncSide_axi_full_argRoute_1_signals_.bresp);
    task_syncSide_axi_full_argRoute_1_BID(task_syncSide_axi_full_argRoute_1_signals_.bid);
    task_syncSide_axi_full_argRoute_1_ARVALID(task_syncSide_axi_full_argRoute_1_signals_.arvalid);
    task_syncSide_axi_full_argRoute_1_ARREADY(task_syncSide_axi_full_argRoute_1_signals_.arready);
    task_syncSide_axi_full_argRoute_1_ARADDR(task_syncSide_axi_full_argRoute_1_signals_.araddr);
    task_syncSide_axi_full_argRoute_1_ARPROT(task_syncSide_axi_full_argRoute_1_signals_.arprot);
    task_syncSide_axi_full_argRoute_1_ARREGION(task_syncSide_axi_full_argRoute_1_signals_.arregion);
    task_syncSide_axi_full_argRoute_1_ARQOS(task_syncSide_axi_full_argRoute_1_signals_.arqos);
    task_syncSide_axi_full_argRoute_1_ARCACHE(task_syncSide_axi_full_argRoute_1_signals_.arcache);
    task_syncSide_axi_full_argRoute_1_ARBURST(task_syncSide_axi_full_argRoute_1_signals_.arburst);
    task_syncSide_axi_full_argRoute_1_ARSIZE(task_syncSide_axi_full_argRoute_1_signals_.arsize);
    task_syncSide_axi_full_argRoute_1_ARLEN(task_syncSide_axi_full_argRoute_1_signals_.arlen);
    task_syncSide_axi_full_argRoute_1_ARID(task_syncSide_axi_full_argRoute_1_signals_.arid);
    task_syncSide_axi_full_argRoute_1_ARLOCK(task_syncSide_axi_full_argRoute_1_signals_.arlock);
    task_syncSide_axi_full_argRoute_1_RVALID(task_syncSide_axi_full_argRoute_1_signals_.rvalid);
    task_syncSide_axi_full_argRoute_1_RREADY(task_syncSide_axi_full_argRoute_1_signals_.rready);
    task_syncSide_axi_full_argRoute_1_RDATA(task_syncSide_axi_full_argRoute_1_signals_.rdata);
    task_syncSide_axi_full_argRoute_1_RRESP(task_syncSide_axi_full_argRoute_1_signals_.rresp);
    task_syncSide_axi_full_argRoute_1_RID(task_syncSide_axi_full_argRoute_1_signals_.rid);
    task_syncSide_axi_full_argRoute_1_RLAST(task_syncSide_axi_full_argRoute_1_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_2 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_2_AWVALID(task_syncSide_axi_full_argRoute_2_signals_.awvalid);
    task_syncSide_axi_full_argRoute_2_AWREADY(task_syncSide_axi_full_argRoute_2_signals_.awready);
    task_syncSide_axi_full_argRoute_2_AWADDR(task_syncSide_axi_full_argRoute_2_signals_.awaddr);
    task_syncSide_axi_full_argRoute_2_AWPROT(task_syncSide_axi_full_argRoute_2_signals_.awprot);
    task_syncSide_axi_full_argRoute_2_AWREGION(task_syncSide_axi_full_argRoute_2_signals_.awregion);
    task_syncSide_axi_full_argRoute_2_AWQOS(task_syncSide_axi_full_argRoute_2_signals_.awqos);
    task_syncSide_axi_full_argRoute_2_AWCACHE(task_syncSide_axi_full_argRoute_2_signals_.awcache);
    task_syncSide_axi_full_argRoute_2_AWBURST(task_syncSide_axi_full_argRoute_2_signals_.awburst);
    task_syncSide_axi_full_argRoute_2_AWSIZE(task_syncSide_axi_full_argRoute_2_signals_.awsize);
    task_syncSide_axi_full_argRoute_2_AWLEN(task_syncSide_axi_full_argRoute_2_signals_.awlen);
    task_syncSide_axi_full_argRoute_2_AWID(task_syncSide_axi_full_argRoute_2_signals_.awid);
    task_syncSide_axi_full_argRoute_2_AWLOCK(task_syncSide_axi_full_argRoute_2_signals_.awlock);
    task_syncSide_axi_full_argRoute_2_WID(task_syncSide_axi_full_argRoute_2_signals_.wid);
    task_syncSide_axi_full_argRoute_2_WVALID(task_syncSide_axi_full_argRoute_2_signals_.wvalid);
    task_syncSide_axi_full_argRoute_2_WREADY(task_syncSide_axi_full_argRoute_2_signals_.wready);
    task_syncSide_axi_full_argRoute_2_WDATA(task_syncSide_axi_full_argRoute_2_signals_.wdata);
    task_syncSide_axi_full_argRoute_2_WSTRB(task_syncSide_axi_full_argRoute_2_signals_.wstrb);
    task_syncSide_axi_full_argRoute_2_WLAST(task_syncSide_axi_full_argRoute_2_signals_.wlast);
    task_syncSide_axi_full_argRoute_2_BVALID(task_syncSide_axi_full_argRoute_2_signals_.bvalid);
    task_syncSide_axi_full_argRoute_2_BREADY(task_syncSide_axi_full_argRoute_2_signals_.bready);
    task_syncSide_axi_full_argRoute_2_BRESP(task_syncSide_axi_full_argRoute_2_signals_.bresp);
    task_syncSide_axi_full_argRoute_2_BID(task_syncSide_axi_full_argRoute_2_signals_.bid);
    task_syncSide_axi_full_argRoute_2_ARVALID(task_syncSide_axi_full_argRoute_2_signals_.arvalid);
    task_syncSide_axi_full_argRoute_2_ARREADY(task_syncSide_axi_full_argRoute_2_signals_.arready);
    task_syncSide_axi_full_argRoute_2_ARADDR(task_syncSide_axi_full_argRoute_2_signals_.araddr);
    task_syncSide_axi_full_argRoute_2_ARPROT(task_syncSide_axi_full_argRoute_2_signals_.arprot);
    task_syncSide_axi_full_argRoute_2_ARREGION(task_syncSide_axi_full_argRoute_2_signals_.arregion);
    task_syncSide_axi_full_argRoute_2_ARQOS(task_syncSide_axi_full_argRoute_2_signals_.arqos);
    task_syncSide_axi_full_argRoute_2_ARCACHE(task_syncSide_axi_full_argRoute_2_signals_.arcache);
    task_syncSide_axi_full_argRoute_2_ARBURST(task_syncSide_axi_full_argRoute_2_signals_.arburst);
    task_syncSide_axi_full_argRoute_2_ARSIZE(task_syncSide_axi_full_argRoute_2_signals_.arsize);
    task_syncSide_axi_full_argRoute_2_ARLEN(task_syncSide_axi_full_argRoute_2_signals_.arlen);
    task_syncSide_axi_full_argRoute_2_ARID(task_syncSide_axi_full_argRoute_2_signals_.arid);
    task_syncSide_axi_full_argRoute_2_ARLOCK(task_syncSide_axi_full_argRoute_2_signals_.arlock);
    task_syncSide_axi_full_argRoute_2_RVALID(task_syncSide_axi_full_argRoute_2_signals_.rvalid);
    task_syncSide_axi_full_argRoute_2_RREADY(task_syncSide_axi_full_argRoute_2_signals_.rready);
    task_syncSide_axi_full_argRoute_2_RDATA(task_syncSide_axi_full_argRoute_2_signals_.rdata);
    task_syncSide_axi_full_argRoute_2_RRESP(task_syncSide_axi_full_argRoute_2_signals_.rresp);
    task_syncSide_axi_full_argRoute_2_RID(task_syncSide_axi_full_argRoute_2_signals_.rid);
    task_syncSide_axi_full_argRoute_2_RLAST(task_syncSide_axi_full_argRoute_2_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_3 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_3_AWVALID(task_syncSide_axi_full_argRoute_3_signals_.awvalid);
    task_syncSide_axi_full_argRoute_3_AWREADY(task_syncSide_axi_full_argRoute_3_signals_.awready);
    task_syncSide_axi_full_argRoute_3_AWADDR(task_syncSide_axi_full_argRoute_3_signals_.awaddr);
    task_syncSide_axi_full_argRoute_3_AWPROT(task_syncSide_axi_full_argRoute_3_signals_.awprot);
    task_syncSide_axi_full_argRoute_3_AWREGION(task_syncSide_axi_full_argRoute_3_signals_.awregion);
    task_syncSide_axi_full_argRoute_3_AWQOS(task_syncSide_axi_full_argRoute_3_signals_.awqos);
    task_syncSide_axi_full_argRoute_3_AWCACHE(task_syncSide_axi_full_argRoute_3_signals_.awcache);
    task_syncSide_axi_full_argRoute_3_AWBURST(task_syncSide_axi_full_argRoute_3_signals_.awburst);
    task_syncSide_axi_full_argRoute_3_AWSIZE(task_syncSide_axi_full_argRoute_3_signals_.awsize);
    task_syncSide_axi_full_argRoute_3_AWLEN(task_syncSide_axi_full_argRoute_3_signals_.awlen);
    task_syncSide_axi_full_argRoute_3_AWID(task_syncSide_axi_full_argRoute_3_signals_.awid);
    task_syncSide_axi_full_argRoute_3_AWLOCK(task_syncSide_axi_full_argRoute_3_signals_.awlock);
    task_syncSide_axi_full_argRoute_3_WID(task_syncSide_axi_full_argRoute_3_signals_.wid);
    task_syncSide_axi_full_argRoute_3_WVALID(task_syncSide_axi_full_argRoute_3_signals_.wvalid);
    task_syncSide_axi_full_argRoute_3_WREADY(task_syncSide_axi_full_argRoute_3_signals_.wready);
    task_syncSide_axi_full_argRoute_3_WDATA(task_syncSide_axi_full_argRoute_3_signals_.wdata);
    task_syncSide_axi_full_argRoute_3_WSTRB(task_syncSide_axi_full_argRoute_3_signals_.wstrb);
    task_syncSide_axi_full_argRoute_3_WLAST(task_syncSide_axi_full_argRoute_3_signals_.wlast);
    task_syncSide_axi_full_argRoute_3_BVALID(task_syncSide_axi_full_argRoute_3_signals_.bvalid);
    task_syncSide_axi_full_argRoute_3_BREADY(task_syncSide_axi_full_argRoute_3_signals_.bready);
    task_syncSide_axi_full_argRoute_3_BRESP(task_syncSide_axi_full_argRoute_3_signals_.bresp);
    task_syncSide_axi_full_argRoute_3_BID(task_syncSide_axi_full_argRoute_3_signals_.bid);
    task_syncSide_axi_full_argRoute_3_ARVALID(task_syncSide_axi_full_argRoute_3_signals_.arvalid);
    task_syncSide_axi_full_argRoute_3_ARREADY(task_syncSide_axi_full_argRoute_3_signals_.arready);
    task_syncSide_axi_full_argRoute_3_ARADDR(task_syncSide_axi_full_argRoute_3_signals_.araddr);
    task_syncSide_axi_full_argRoute_3_ARPROT(task_syncSide_axi_full_argRoute_3_signals_.arprot);
    task_syncSide_axi_full_argRoute_3_ARREGION(task_syncSide_axi_full_argRoute_3_signals_.arregion);
    task_syncSide_axi_full_argRoute_3_ARQOS(task_syncSide_axi_full_argRoute_3_signals_.arqos);
    task_syncSide_axi_full_argRoute_3_ARCACHE(task_syncSide_axi_full_argRoute_3_signals_.arcache);
    task_syncSide_axi_full_argRoute_3_ARBURST(task_syncSide_axi_full_argRoute_3_signals_.arburst);
    task_syncSide_axi_full_argRoute_3_ARSIZE(task_syncSide_axi_full_argRoute_3_signals_.arsize);
    task_syncSide_axi_full_argRoute_3_ARLEN(task_syncSide_axi_full_argRoute_3_signals_.arlen);
    task_syncSide_axi_full_argRoute_3_ARID(task_syncSide_axi_full_argRoute_3_signals_.arid);
    task_syncSide_axi_full_argRoute_3_ARLOCK(task_syncSide_axi_full_argRoute_3_signals_.arlock);
    task_syncSide_axi_full_argRoute_3_RVALID(task_syncSide_axi_full_argRoute_3_signals_.rvalid);
    task_syncSide_axi_full_argRoute_3_RREADY(task_syncSide_axi_full_argRoute_3_signals_.rready);
    task_syncSide_axi_full_argRoute_3_RDATA(task_syncSide_axi_full_argRoute_3_signals_.rdata);
    task_syncSide_axi_full_argRoute_3_RRESP(task_syncSide_axi_full_argRoute_3_signals_.rresp);
    task_syncSide_axi_full_argRoute_3_RID(task_syncSide_axi_full_argRoute_3_signals_.rid);
    task_syncSide_axi_full_argRoute_3_RLAST(task_syncSide_axi_full_argRoute_3_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_4 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_4_AWVALID(task_syncSide_axi_full_argRoute_4_signals_.awvalid);
    task_syncSide_axi_full_argRoute_4_AWREADY(task_syncSide_axi_full_argRoute_4_signals_.awready);
    task_syncSide_axi_full_argRoute_4_AWADDR(task_syncSide_axi_full_argRoute_4_signals_.awaddr);
    task_syncSide_axi_full_argRoute_4_AWPROT(task_syncSide_axi_full_argRoute_4_signals_.awprot);
    task_syncSide_axi_full_argRoute_4_AWREGION(task_syncSide_axi_full_argRoute_4_signals_.awregion);
    task_syncSide_axi_full_argRoute_4_AWQOS(task_syncSide_axi_full_argRoute_4_signals_.awqos);
    task_syncSide_axi_full_argRoute_4_AWCACHE(task_syncSide_axi_full_argRoute_4_signals_.awcache);
    task_syncSide_axi_full_argRoute_4_AWBURST(task_syncSide_axi_full_argRoute_4_signals_.awburst);
    task_syncSide_axi_full_argRoute_4_AWSIZE(task_syncSide_axi_full_argRoute_4_signals_.awsize);
    task_syncSide_axi_full_argRoute_4_AWLEN(task_syncSide_axi_full_argRoute_4_signals_.awlen);
    task_syncSide_axi_full_argRoute_4_AWID(task_syncSide_axi_full_argRoute_4_signals_.awid);
    task_syncSide_axi_full_argRoute_4_AWLOCK(task_syncSide_axi_full_argRoute_4_signals_.awlock);
    task_syncSide_axi_full_argRoute_4_WID(task_syncSide_axi_full_argRoute_4_signals_.wid);
    task_syncSide_axi_full_argRoute_4_WVALID(task_syncSide_axi_full_argRoute_4_signals_.wvalid);
    task_syncSide_axi_full_argRoute_4_WREADY(task_syncSide_axi_full_argRoute_4_signals_.wready);
    task_syncSide_axi_full_argRoute_4_WDATA(task_syncSide_axi_full_argRoute_4_signals_.wdata);
    task_syncSide_axi_full_argRoute_4_WSTRB(task_syncSide_axi_full_argRoute_4_signals_.wstrb);
    task_syncSide_axi_full_argRoute_4_WLAST(task_syncSide_axi_full_argRoute_4_signals_.wlast);
    task_syncSide_axi_full_argRoute_4_BVALID(task_syncSide_axi_full_argRoute_4_signals_.bvalid);
    task_syncSide_axi_full_argRoute_4_BREADY(task_syncSide_axi_full_argRoute_4_signals_.bready);
    task_syncSide_axi_full_argRoute_4_BRESP(task_syncSide_axi_full_argRoute_4_signals_.bresp);
    task_syncSide_axi_full_argRoute_4_BID(task_syncSide_axi_full_argRoute_4_signals_.bid);
    task_syncSide_axi_full_argRoute_4_ARVALID(task_syncSide_axi_full_argRoute_4_signals_.arvalid);
    task_syncSide_axi_full_argRoute_4_ARREADY(task_syncSide_axi_full_argRoute_4_signals_.arready);
    task_syncSide_axi_full_argRoute_4_ARADDR(task_syncSide_axi_full_argRoute_4_signals_.araddr);
    task_syncSide_axi_full_argRoute_4_ARPROT(task_syncSide_axi_full_argRoute_4_signals_.arprot);
    task_syncSide_axi_full_argRoute_4_ARREGION(task_syncSide_axi_full_argRoute_4_signals_.arregion);
    task_syncSide_axi_full_argRoute_4_ARQOS(task_syncSide_axi_full_argRoute_4_signals_.arqos);
    task_syncSide_axi_full_argRoute_4_ARCACHE(task_syncSide_axi_full_argRoute_4_signals_.arcache);
    task_syncSide_axi_full_argRoute_4_ARBURST(task_syncSide_axi_full_argRoute_4_signals_.arburst);
    task_syncSide_axi_full_argRoute_4_ARSIZE(task_syncSide_axi_full_argRoute_4_signals_.arsize);
    task_syncSide_axi_full_argRoute_4_ARLEN(task_syncSide_axi_full_argRoute_4_signals_.arlen);
    task_syncSide_axi_full_argRoute_4_ARID(task_syncSide_axi_full_argRoute_4_signals_.arid);
    task_syncSide_axi_full_argRoute_4_ARLOCK(task_syncSide_axi_full_argRoute_4_signals_.arlock);
    task_syncSide_axi_full_argRoute_4_RVALID(task_syncSide_axi_full_argRoute_4_signals_.rvalid);
    task_syncSide_axi_full_argRoute_4_RREADY(task_syncSide_axi_full_argRoute_4_signals_.rready);
    task_syncSide_axi_full_argRoute_4_RDATA(task_syncSide_axi_full_argRoute_4_signals_.rdata);
    task_syncSide_axi_full_argRoute_4_RRESP(task_syncSide_axi_full_argRoute_4_signals_.rresp);
    task_syncSide_axi_full_argRoute_4_RID(task_syncSide_axi_full_argRoute_4_signals_.rid);
    task_syncSide_axi_full_argRoute_4_RLAST(task_syncSide_axi_full_argRoute_4_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_5 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_5_AWVALID(task_syncSide_axi_full_argRoute_5_signals_.awvalid);
    task_syncSide_axi_full_argRoute_5_AWREADY(task_syncSide_axi_full_argRoute_5_signals_.awready);
    task_syncSide_axi_full_argRoute_5_AWADDR(task_syncSide_axi_full_argRoute_5_signals_.awaddr);
    task_syncSide_axi_full_argRoute_5_AWPROT(task_syncSide_axi_full_argRoute_5_signals_.awprot);
    task_syncSide_axi_full_argRoute_5_AWREGION(task_syncSide_axi_full_argRoute_5_signals_.awregion);
    task_syncSide_axi_full_argRoute_5_AWQOS(task_syncSide_axi_full_argRoute_5_signals_.awqos);
    task_syncSide_axi_full_argRoute_5_AWCACHE(task_syncSide_axi_full_argRoute_5_signals_.awcache);
    task_syncSide_axi_full_argRoute_5_AWBURST(task_syncSide_axi_full_argRoute_5_signals_.awburst);
    task_syncSide_axi_full_argRoute_5_AWSIZE(task_syncSide_axi_full_argRoute_5_signals_.awsize);
    task_syncSide_axi_full_argRoute_5_AWLEN(task_syncSide_axi_full_argRoute_5_signals_.awlen);
    task_syncSide_axi_full_argRoute_5_AWID(task_syncSide_axi_full_argRoute_5_signals_.awid);
    task_syncSide_axi_full_argRoute_5_AWLOCK(task_syncSide_axi_full_argRoute_5_signals_.awlock);
    task_syncSide_axi_full_argRoute_5_WID(task_syncSide_axi_full_argRoute_5_signals_.wid);
    task_syncSide_axi_full_argRoute_5_WVALID(task_syncSide_axi_full_argRoute_5_signals_.wvalid);
    task_syncSide_axi_full_argRoute_5_WREADY(task_syncSide_axi_full_argRoute_5_signals_.wready);
    task_syncSide_axi_full_argRoute_5_WDATA(task_syncSide_axi_full_argRoute_5_signals_.wdata);
    task_syncSide_axi_full_argRoute_5_WSTRB(task_syncSide_axi_full_argRoute_5_signals_.wstrb);
    task_syncSide_axi_full_argRoute_5_WLAST(task_syncSide_axi_full_argRoute_5_signals_.wlast);
    task_syncSide_axi_full_argRoute_5_BVALID(task_syncSide_axi_full_argRoute_5_signals_.bvalid);
    task_syncSide_axi_full_argRoute_5_BREADY(task_syncSide_axi_full_argRoute_5_signals_.bready);
    task_syncSide_axi_full_argRoute_5_BRESP(task_syncSide_axi_full_argRoute_5_signals_.bresp);
    task_syncSide_axi_full_argRoute_5_BID(task_syncSide_axi_full_argRoute_5_signals_.bid);
    task_syncSide_axi_full_argRoute_5_ARVALID(task_syncSide_axi_full_argRoute_5_signals_.arvalid);
    task_syncSide_axi_full_argRoute_5_ARREADY(task_syncSide_axi_full_argRoute_5_signals_.arready);
    task_syncSide_axi_full_argRoute_5_ARADDR(task_syncSide_axi_full_argRoute_5_signals_.araddr);
    task_syncSide_axi_full_argRoute_5_ARPROT(task_syncSide_axi_full_argRoute_5_signals_.arprot);
    task_syncSide_axi_full_argRoute_5_ARREGION(task_syncSide_axi_full_argRoute_5_signals_.arregion);
    task_syncSide_axi_full_argRoute_5_ARQOS(task_syncSide_axi_full_argRoute_5_signals_.arqos);
    task_syncSide_axi_full_argRoute_5_ARCACHE(task_syncSide_axi_full_argRoute_5_signals_.arcache);
    task_syncSide_axi_full_argRoute_5_ARBURST(task_syncSide_axi_full_argRoute_5_signals_.arburst);
    task_syncSide_axi_full_argRoute_5_ARSIZE(task_syncSide_axi_full_argRoute_5_signals_.arsize);
    task_syncSide_axi_full_argRoute_5_ARLEN(task_syncSide_axi_full_argRoute_5_signals_.arlen);
    task_syncSide_axi_full_argRoute_5_ARID(task_syncSide_axi_full_argRoute_5_signals_.arid);
    task_syncSide_axi_full_argRoute_5_ARLOCK(task_syncSide_axi_full_argRoute_5_signals_.arlock);
    task_syncSide_axi_full_argRoute_5_RVALID(task_syncSide_axi_full_argRoute_5_signals_.rvalid);
    task_syncSide_axi_full_argRoute_5_RREADY(task_syncSide_axi_full_argRoute_5_signals_.rready);
    task_syncSide_axi_full_argRoute_5_RDATA(task_syncSide_axi_full_argRoute_5_signals_.rdata);
    task_syncSide_axi_full_argRoute_5_RRESP(task_syncSide_axi_full_argRoute_5_signals_.rresp);
    task_syncSide_axi_full_argRoute_5_RID(task_syncSide_axi_full_argRoute_5_signals_.rid);
    task_syncSide_axi_full_argRoute_5_RLAST(task_syncSide_axi_full_argRoute_5_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_6 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_6_AWVALID(task_syncSide_axi_full_argRoute_6_signals_.awvalid);
    task_syncSide_axi_full_argRoute_6_AWREADY(task_syncSide_axi_full_argRoute_6_signals_.awready);
    task_syncSide_axi_full_argRoute_6_AWADDR(task_syncSide_axi_full_argRoute_6_signals_.awaddr);
    task_syncSide_axi_full_argRoute_6_AWPROT(task_syncSide_axi_full_argRoute_6_signals_.awprot);
    task_syncSide_axi_full_argRoute_6_AWREGION(task_syncSide_axi_full_argRoute_6_signals_.awregion);
    task_syncSide_axi_full_argRoute_6_AWQOS(task_syncSide_axi_full_argRoute_6_signals_.awqos);
    task_syncSide_axi_full_argRoute_6_AWCACHE(task_syncSide_axi_full_argRoute_6_signals_.awcache);
    task_syncSide_axi_full_argRoute_6_AWBURST(task_syncSide_axi_full_argRoute_6_signals_.awburst);
    task_syncSide_axi_full_argRoute_6_AWSIZE(task_syncSide_axi_full_argRoute_6_signals_.awsize);
    task_syncSide_axi_full_argRoute_6_AWLEN(task_syncSide_axi_full_argRoute_6_signals_.awlen);
    task_syncSide_axi_full_argRoute_6_AWID(task_syncSide_axi_full_argRoute_6_signals_.awid);
    task_syncSide_axi_full_argRoute_6_AWLOCK(task_syncSide_axi_full_argRoute_6_signals_.awlock);
    task_syncSide_axi_full_argRoute_6_WID(task_syncSide_axi_full_argRoute_6_signals_.wid);
    task_syncSide_axi_full_argRoute_6_WVALID(task_syncSide_axi_full_argRoute_6_signals_.wvalid);
    task_syncSide_axi_full_argRoute_6_WREADY(task_syncSide_axi_full_argRoute_6_signals_.wready);
    task_syncSide_axi_full_argRoute_6_WDATA(task_syncSide_axi_full_argRoute_6_signals_.wdata);
    task_syncSide_axi_full_argRoute_6_WSTRB(task_syncSide_axi_full_argRoute_6_signals_.wstrb);
    task_syncSide_axi_full_argRoute_6_WLAST(task_syncSide_axi_full_argRoute_6_signals_.wlast);
    task_syncSide_axi_full_argRoute_6_BVALID(task_syncSide_axi_full_argRoute_6_signals_.bvalid);
    task_syncSide_axi_full_argRoute_6_BREADY(task_syncSide_axi_full_argRoute_6_signals_.bready);
    task_syncSide_axi_full_argRoute_6_BRESP(task_syncSide_axi_full_argRoute_6_signals_.bresp);
    task_syncSide_axi_full_argRoute_6_BID(task_syncSide_axi_full_argRoute_6_signals_.bid);
    task_syncSide_axi_full_argRoute_6_ARVALID(task_syncSide_axi_full_argRoute_6_signals_.arvalid);
    task_syncSide_axi_full_argRoute_6_ARREADY(task_syncSide_axi_full_argRoute_6_signals_.arready);
    task_syncSide_axi_full_argRoute_6_ARADDR(task_syncSide_axi_full_argRoute_6_signals_.araddr);
    task_syncSide_axi_full_argRoute_6_ARPROT(task_syncSide_axi_full_argRoute_6_signals_.arprot);
    task_syncSide_axi_full_argRoute_6_ARREGION(task_syncSide_axi_full_argRoute_6_signals_.arregion);
    task_syncSide_axi_full_argRoute_6_ARQOS(task_syncSide_axi_full_argRoute_6_signals_.arqos);
    task_syncSide_axi_full_argRoute_6_ARCACHE(task_syncSide_axi_full_argRoute_6_signals_.arcache);
    task_syncSide_axi_full_argRoute_6_ARBURST(task_syncSide_axi_full_argRoute_6_signals_.arburst);
    task_syncSide_axi_full_argRoute_6_ARSIZE(task_syncSide_axi_full_argRoute_6_signals_.arsize);
    task_syncSide_axi_full_argRoute_6_ARLEN(task_syncSide_axi_full_argRoute_6_signals_.arlen);
    task_syncSide_axi_full_argRoute_6_ARID(task_syncSide_axi_full_argRoute_6_signals_.arid);
    task_syncSide_axi_full_argRoute_6_ARLOCK(task_syncSide_axi_full_argRoute_6_signals_.arlock);
    task_syncSide_axi_full_argRoute_6_RVALID(task_syncSide_axi_full_argRoute_6_signals_.rvalid);
    task_syncSide_axi_full_argRoute_6_RREADY(task_syncSide_axi_full_argRoute_6_signals_.rready);
    task_syncSide_axi_full_argRoute_6_RDATA(task_syncSide_axi_full_argRoute_6_signals_.rdata);
    task_syncSide_axi_full_argRoute_6_RRESP(task_syncSide_axi_full_argRoute_6_signals_.rresp);
    task_syncSide_axi_full_argRoute_6_RID(task_syncSide_axi_full_argRoute_6_signals_.rid);
    task_syncSide_axi_full_argRoute_6_RLAST(task_syncSide_axi_full_argRoute_6_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_7 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_7_AWVALID(task_syncSide_axi_full_argRoute_7_signals_.awvalid);
    task_syncSide_axi_full_argRoute_7_AWREADY(task_syncSide_axi_full_argRoute_7_signals_.awready);
    task_syncSide_axi_full_argRoute_7_AWADDR(task_syncSide_axi_full_argRoute_7_signals_.awaddr);
    task_syncSide_axi_full_argRoute_7_AWPROT(task_syncSide_axi_full_argRoute_7_signals_.awprot);
    task_syncSide_axi_full_argRoute_7_AWREGION(task_syncSide_axi_full_argRoute_7_signals_.awregion);
    task_syncSide_axi_full_argRoute_7_AWQOS(task_syncSide_axi_full_argRoute_7_signals_.awqos);
    task_syncSide_axi_full_argRoute_7_AWCACHE(task_syncSide_axi_full_argRoute_7_signals_.awcache);
    task_syncSide_axi_full_argRoute_7_AWBURST(task_syncSide_axi_full_argRoute_7_signals_.awburst);
    task_syncSide_axi_full_argRoute_7_AWSIZE(task_syncSide_axi_full_argRoute_7_signals_.awsize);
    task_syncSide_axi_full_argRoute_7_AWLEN(task_syncSide_axi_full_argRoute_7_signals_.awlen);
    task_syncSide_axi_full_argRoute_7_AWID(task_syncSide_axi_full_argRoute_7_signals_.awid);
    task_syncSide_axi_full_argRoute_7_AWLOCK(task_syncSide_axi_full_argRoute_7_signals_.awlock);
    task_syncSide_axi_full_argRoute_7_WID(task_syncSide_axi_full_argRoute_7_signals_.wid);
    task_syncSide_axi_full_argRoute_7_WVALID(task_syncSide_axi_full_argRoute_7_signals_.wvalid);
    task_syncSide_axi_full_argRoute_7_WREADY(task_syncSide_axi_full_argRoute_7_signals_.wready);
    task_syncSide_axi_full_argRoute_7_WDATA(task_syncSide_axi_full_argRoute_7_signals_.wdata);
    task_syncSide_axi_full_argRoute_7_WSTRB(task_syncSide_axi_full_argRoute_7_signals_.wstrb);
    task_syncSide_axi_full_argRoute_7_WLAST(task_syncSide_axi_full_argRoute_7_signals_.wlast);
    task_syncSide_axi_full_argRoute_7_BVALID(task_syncSide_axi_full_argRoute_7_signals_.bvalid);
    task_syncSide_axi_full_argRoute_7_BREADY(task_syncSide_axi_full_argRoute_7_signals_.bready);
    task_syncSide_axi_full_argRoute_7_BRESP(task_syncSide_axi_full_argRoute_7_signals_.bresp);
    task_syncSide_axi_full_argRoute_7_BID(task_syncSide_axi_full_argRoute_7_signals_.bid);
    task_syncSide_axi_full_argRoute_7_ARVALID(task_syncSide_axi_full_argRoute_7_signals_.arvalid);
    task_syncSide_axi_full_argRoute_7_ARREADY(task_syncSide_axi_full_argRoute_7_signals_.arready);
    task_syncSide_axi_full_argRoute_7_ARADDR(task_syncSide_axi_full_argRoute_7_signals_.araddr);
    task_syncSide_axi_full_argRoute_7_ARPROT(task_syncSide_axi_full_argRoute_7_signals_.arprot);
    task_syncSide_axi_full_argRoute_7_ARREGION(task_syncSide_axi_full_argRoute_7_signals_.arregion);
    task_syncSide_axi_full_argRoute_7_ARQOS(task_syncSide_axi_full_argRoute_7_signals_.arqos);
    task_syncSide_axi_full_argRoute_7_ARCACHE(task_syncSide_axi_full_argRoute_7_signals_.arcache);
    task_syncSide_axi_full_argRoute_7_ARBURST(task_syncSide_axi_full_argRoute_7_signals_.arburst);
    task_syncSide_axi_full_argRoute_7_ARSIZE(task_syncSide_axi_full_argRoute_7_signals_.arsize);
    task_syncSide_axi_full_argRoute_7_ARLEN(task_syncSide_axi_full_argRoute_7_signals_.arlen);
    task_syncSide_axi_full_argRoute_7_ARID(task_syncSide_axi_full_argRoute_7_signals_.arid);
    task_syncSide_axi_full_argRoute_7_ARLOCK(task_syncSide_axi_full_argRoute_7_signals_.arlock);
    task_syncSide_axi_full_argRoute_7_RVALID(task_syncSide_axi_full_argRoute_7_signals_.rvalid);
    task_syncSide_axi_full_argRoute_7_RREADY(task_syncSide_axi_full_argRoute_7_signals_.rready);
    task_syncSide_axi_full_argRoute_7_RDATA(task_syncSide_axi_full_argRoute_7_signals_.rdata);
    task_syncSide_axi_full_argRoute_7_RRESP(task_syncSide_axi_full_argRoute_7_signals_.rresp);
    task_syncSide_axi_full_argRoute_7_RID(task_syncSide_axi_full_argRoute_7_signals_.rid);
    task_syncSide_axi_full_argRoute_7_RLAST(task_syncSide_axi_full_argRoute_7_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_8 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_8_AWVALID(task_syncSide_axi_full_argRoute_8_signals_.awvalid);
    task_syncSide_axi_full_argRoute_8_AWREADY(task_syncSide_axi_full_argRoute_8_signals_.awready);
    task_syncSide_axi_full_argRoute_8_AWADDR(task_syncSide_axi_full_argRoute_8_signals_.awaddr);
    task_syncSide_axi_full_argRoute_8_AWPROT(task_syncSide_axi_full_argRoute_8_signals_.awprot);
    task_syncSide_axi_full_argRoute_8_AWREGION(task_syncSide_axi_full_argRoute_8_signals_.awregion);
    task_syncSide_axi_full_argRoute_8_AWQOS(task_syncSide_axi_full_argRoute_8_signals_.awqos);
    task_syncSide_axi_full_argRoute_8_AWCACHE(task_syncSide_axi_full_argRoute_8_signals_.awcache);
    task_syncSide_axi_full_argRoute_8_AWBURST(task_syncSide_axi_full_argRoute_8_signals_.awburst);
    task_syncSide_axi_full_argRoute_8_AWSIZE(task_syncSide_axi_full_argRoute_8_signals_.awsize);
    task_syncSide_axi_full_argRoute_8_AWLEN(task_syncSide_axi_full_argRoute_8_signals_.awlen);
    task_syncSide_axi_full_argRoute_8_AWID(task_syncSide_axi_full_argRoute_8_signals_.awid);
    task_syncSide_axi_full_argRoute_8_AWLOCK(task_syncSide_axi_full_argRoute_8_signals_.awlock);
    task_syncSide_axi_full_argRoute_8_WID(task_syncSide_axi_full_argRoute_8_signals_.wid);
    task_syncSide_axi_full_argRoute_8_WVALID(task_syncSide_axi_full_argRoute_8_signals_.wvalid);
    task_syncSide_axi_full_argRoute_8_WREADY(task_syncSide_axi_full_argRoute_8_signals_.wready);
    task_syncSide_axi_full_argRoute_8_WDATA(task_syncSide_axi_full_argRoute_8_signals_.wdata);
    task_syncSide_axi_full_argRoute_8_WSTRB(task_syncSide_axi_full_argRoute_8_signals_.wstrb);
    task_syncSide_axi_full_argRoute_8_WLAST(task_syncSide_axi_full_argRoute_8_signals_.wlast);
    task_syncSide_axi_full_argRoute_8_BVALID(task_syncSide_axi_full_argRoute_8_signals_.bvalid);
    task_syncSide_axi_full_argRoute_8_BREADY(task_syncSide_axi_full_argRoute_8_signals_.bready);
    task_syncSide_axi_full_argRoute_8_BRESP(task_syncSide_axi_full_argRoute_8_signals_.bresp);
    task_syncSide_axi_full_argRoute_8_BID(task_syncSide_axi_full_argRoute_8_signals_.bid);
    task_syncSide_axi_full_argRoute_8_ARVALID(task_syncSide_axi_full_argRoute_8_signals_.arvalid);
    task_syncSide_axi_full_argRoute_8_ARREADY(task_syncSide_axi_full_argRoute_8_signals_.arready);
    task_syncSide_axi_full_argRoute_8_ARADDR(task_syncSide_axi_full_argRoute_8_signals_.araddr);
    task_syncSide_axi_full_argRoute_8_ARPROT(task_syncSide_axi_full_argRoute_8_signals_.arprot);
    task_syncSide_axi_full_argRoute_8_ARREGION(task_syncSide_axi_full_argRoute_8_signals_.arregion);
    task_syncSide_axi_full_argRoute_8_ARQOS(task_syncSide_axi_full_argRoute_8_signals_.arqos);
    task_syncSide_axi_full_argRoute_8_ARCACHE(task_syncSide_axi_full_argRoute_8_signals_.arcache);
    task_syncSide_axi_full_argRoute_8_ARBURST(task_syncSide_axi_full_argRoute_8_signals_.arburst);
    task_syncSide_axi_full_argRoute_8_ARSIZE(task_syncSide_axi_full_argRoute_8_signals_.arsize);
    task_syncSide_axi_full_argRoute_8_ARLEN(task_syncSide_axi_full_argRoute_8_signals_.arlen);
    task_syncSide_axi_full_argRoute_8_ARID(task_syncSide_axi_full_argRoute_8_signals_.arid);
    task_syncSide_axi_full_argRoute_8_ARLOCK(task_syncSide_axi_full_argRoute_8_signals_.arlock);
    task_syncSide_axi_full_argRoute_8_RVALID(task_syncSide_axi_full_argRoute_8_signals_.rvalid);
    task_syncSide_axi_full_argRoute_8_RREADY(task_syncSide_axi_full_argRoute_8_signals_.rready);
    task_syncSide_axi_full_argRoute_8_RDATA(task_syncSide_axi_full_argRoute_8_signals_.rdata);
    task_syncSide_axi_full_argRoute_8_RRESP(task_syncSide_axi_full_argRoute_8_signals_.rresp);
    task_syncSide_axi_full_argRoute_8_RID(task_syncSide_axi_full_argRoute_8_signals_.rid);
    task_syncSide_axi_full_argRoute_8_RLAST(task_syncSide_axi_full_argRoute_8_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_9 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_9_AWVALID(task_syncSide_axi_full_argRoute_9_signals_.awvalid);
    task_syncSide_axi_full_argRoute_9_AWREADY(task_syncSide_axi_full_argRoute_9_signals_.awready);
    task_syncSide_axi_full_argRoute_9_AWADDR(task_syncSide_axi_full_argRoute_9_signals_.awaddr);
    task_syncSide_axi_full_argRoute_9_AWPROT(task_syncSide_axi_full_argRoute_9_signals_.awprot);
    task_syncSide_axi_full_argRoute_9_AWREGION(task_syncSide_axi_full_argRoute_9_signals_.awregion);
    task_syncSide_axi_full_argRoute_9_AWQOS(task_syncSide_axi_full_argRoute_9_signals_.awqos);
    task_syncSide_axi_full_argRoute_9_AWCACHE(task_syncSide_axi_full_argRoute_9_signals_.awcache);
    task_syncSide_axi_full_argRoute_9_AWBURST(task_syncSide_axi_full_argRoute_9_signals_.awburst);
    task_syncSide_axi_full_argRoute_9_AWSIZE(task_syncSide_axi_full_argRoute_9_signals_.awsize);
    task_syncSide_axi_full_argRoute_9_AWLEN(task_syncSide_axi_full_argRoute_9_signals_.awlen);
    task_syncSide_axi_full_argRoute_9_AWID(task_syncSide_axi_full_argRoute_9_signals_.awid);
    task_syncSide_axi_full_argRoute_9_AWLOCK(task_syncSide_axi_full_argRoute_9_signals_.awlock);
    task_syncSide_axi_full_argRoute_9_WID(task_syncSide_axi_full_argRoute_9_signals_.wid);
    task_syncSide_axi_full_argRoute_9_WVALID(task_syncSide_axi_full_argRoute_9_signals_.wvalid);
    task_syncSide_axi_full_argRoute_9_WREADY(task_syncSide_axi_full_argRoute_9_signals_.wready);
    task_syncSide_axi_full_argRoute_9_WDATA(task_syncSide_axi_full_argRoute_9_signals_.wdata);
    task_syncSide_axi_full_argRoute_9_WSTRB(task_syncSide_axi_full_argRoute_9_signals_.wstrb);
    task_syncSide_axi_full_argRoute_9_WLAST(task_syncSide_axi_full_argRoute_9_signals_.wlast);
    task_syncSide_axi_full_argRoute_9_BVALID(task_syncSide_axi_full_argRoute_9_signals_.bvalid);
    task_syncSide_axi_full_argRoute_9_BREADY(task_syncSide_axi_full_argRoute_9_signals_.bready);
    task_syncSide_axi_full_argRoute_9_BRESP(task_syncSide_axi_full_argRoute_9_signals_.bresp);
    task_syncSide_axi_full_argRoute_9_BID(task_syncSide_axi_full_argRoute_9_signals_.bid);
    task_syncSide_axi_full_argRoute_9_ARVALID(task_syncSide_axi_full_argRoute_9_signals_.arvalid);
    task_syncSide_axi_full_argRoute_9_ARREADY(task_syncSide_axi_full_argRoute_9_signals_.arready);
    task_syncSide_axi_full_argRoute_9_ARADDR(task_syncSide_axi_full_argRoute_9_signals_.araddr);
    task_syncSide_axi_full_argRoute_9_ARPROT(task_syncSide_axi_full_argRoute_9_signals_.arprot);
    task_syncSide_axi_full_argRoute_9_ARREGION(task_syncSide_axi_full_argRoute_9_signals_.arregion);
    task_syncSide_axi_full_argRoute_9_ARQOS(task_syncSide_axi_full_argRoute_9_signals_.arqos);
    task_syncSide_axi_full_argRoute_9_ARCACHE(task_syncSide_axi_full_argRoute_9_signals_.arcache);
    task_syncSide_axi_full_argRoute_9_ARBURST(task_syncSide_axi_full_argRoute_9_signals_.arburst);
    task_syncSide_axi_full_argRoute_9_ARSIZE(task_syncSide_axi_full_argRoute_9_signals_.arsize);
    task_syncSide_axi_full_argRoute_9_ARLEN(task_syncSide_axi_full_argRoute_9_signals_.arlen);
    task_syncSide_axi_full_argRoute_9_ARID(task_syncSide_axi_full_argRoute_9_signals_.arid);
    task_syncSide_axi_full_argRoute_9_ARLOCK(task_syncSide_axi_full_argRoute_9_signals_.arlock);
    task_syncSide_axi_full_argRoute_9_RVALID(task_syncSide_axi_full_argRoute_9_signals_.rvalid);
    task_syncSide_axi_full_argRoute_9_RREADY(task_syncSide_axi_full_argRoute_9_signals_.rready);
    task_syncSide_axi_full_argRoute_9_RDATA(task_syncSide_axi_full_argRoute_9_signals_.rdata);
    task_syncSide_axi_full_argRoute_9_RRESP(task_syncSide_axi_full_argRoute_9_signals_.rresp);
    task_syncSide_axi_full_argRoute_9_RID(task_syncSide_axi_full_argRoute_9_signals_.rid);
    task_syncSide_axi_full_argRoute_9_RLAST(task_syncSide_axi_full_argRoute_9_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_10 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_10_AWVALID(task_syncSide_axi_full_argRoute_10_signals_.awvalid);
    task_syncSide_axi_full_argRoute_10_AWREADY(task_syncSide_axi_full_argRoute_10_signals_.awready);
    task_syncSide_axi_full_argRoute_10_AWADDR(task_syncSide_axi_full_argRoute_10_signals_.awaddr);
    task_syncSide_axi_full_argRoute_10_AWPROT(task_syncSide_axi_full_argRoute_10_signals_.awprot);
    task_syncSide_axi_full_argRoute_10_AWREGION(task_syncSide_axi_full_argRoute_10_signals_.awregion);
    task_syncSide_axi_full_argRoute_10_AWQOS(task_syncSide_axi_full_argRoute_10_signals_.awqos);
    task_syncSide_axi_full_argRoute_10_AWCACHE(task_syncSide_axi_full_argRoute_10_signals_.awcache);
    task_syncSide_axi_full_argRoute_10_AWBURST(task_syncSide_axi_full_argRoute_10_signals_.awburst);
    task_syncSide_axi_full_argRoute_10_AWSIZE(task_syncSide_axi_full_argRoute_10_signals_.awsize);
    task_syncSide_axi_full_argRoute_10_AWLEN(task_syncSide_axi_full_argRoute_10_signals_.awlen);
    task_syncSide_axi_full_argRoute_10_AWID(task_syncSide_axi_full_argRoute_10_signals_.awid);
    task_syncSide_axi_full_argRoute_10_AWLOCK(task_syncSide_axi_full_argRoute_10_signals_.awlock);
    task_syncSide_axi_full_argRoute_10_WID(task_syncSide_axi_full_argRoute_10_signals_.wid);
    task_syncSide_axi_full_argRoute_10_WVALID(task_syncSide_axi_full_argRoute_10_signals_.wvalid);
    task_syncSide_axi_full_argRoute_10_WREADY(task_syncSide_axi_full_argRoute_10_signals_.wready);
    task_syncSide_axi_full_argRoute_10_WDATA(task_syncSide_axi_full_argRoute_10_signals_.wdata);
    task_syncSide_axi_full_argRoute_10_WSTRB(task_syncSide_axi_full_argRoute_10_signals_.wstrb);
    task_syncSide_axi_full_argRoute_10_WLAST(task_syncSide_axi_full_argRoute_10_signals_.wlast);
    task_syncSide_axi_full_argRoute_10_BVALID(task_syncSide_axi_full_argRoute_10_signals_.bvalid);
    task_syncSide_axi_full_argRoute_10_BREADY(task_syncSide_axi_full_argRoute_10_signals_.bready);
    task_syncSide_axi_full_argRoute_10_BRESP(task_syncSide_axi_full_argRoute_10_signals_.bresp);
    task_syncSide_axi_full_argRoute_10_BID(task_syncSide_axi_full_argRoute_10_signals_.bid);
    task_syncSide_axi_full_argRoute_10_ARVALID(task_syncSide_axi_full_argRoute_10_signals_.arvalid);
    task_syncSide_axi_full_argRoute_10_ARREADY(task_syncSide_axi_full_argRoute_10_signals_.arready);
    task_syncSide_axi_full_argRoute_10_ARADDR(task_syncSide_axi_full_argRoute_10_signals_.araddr);
    task_syncSide_axi_full_argRoute_10_ARPROT(task_syncSide_axi_full_argRoute_10_signals_.arprot);
    task_syncSide_axi_full_argRoute_10_ARREGION(task_syncSide_axi_full_argRoute_10_signals_.arregion);
    task_syncSide_axi_full_argRoute_10_ARQOS(task_syncSide_axi_full_argRoute_10_signals_.arqos);
    task_syncSide_axi_full_argRoute_10_ARCACHE(task_syncSide_axi_full_argRoute_10_signals_.arcache);
    task_syncSide_axi_full_argRoute_10_ARBURST(task_syncSide_axi_full_argRoute_10_signals_.arburst);
    task_syncSide_axi_full_argRoute_10_ARSIZE(task_syncSide_axi_full_argRoute_10_signals_.arsize);
    task_syncSide_axi_full_argRoute_10_ARLEN(task_syncSide_axi_full_argRoute_10_signals_.arlen);
    task_syncSide_axi_full_argRoute_10_ARID(task_syncSide_axi_full_argRoute_10_signals_.arid);
    task_syncSide_axi_full_argRoute_10_ARLOCK(task_syncSide_axi_full_argRoute_10_signals_.arlock);
    task_syncSide_axi_full_argRoute_10_RVALID(task_syncSide_axi_full_argRoute_10_signals_.rvalid);
    task_syncSide_axi_full_argRoute_10_RREADY(task_syncSide_axi_full_argRoute_10_signals_.rready);
    task_syncSide_axi_full_argRoute_10_RDATA(task_syncSide_axi_full_argRoute_10_signals_.rdata);
    task_syncSide_axi_full_argRoute_10_RRESP(task_syncSide_axi_full_argRoute_10_signals_.rresp);
    task_syncSide_axi_full_argRoute_10_RID(task_syncSide_axi_full_argRoute_10_signals_.rid);
    task_syncSide_axi_full_argRoute_10_RLAST(task_syncSide_axi_full_argRoute_10_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_11 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_11_AWVALID(task_syncSide_axi_full_argRoute_11_signals_.awvalid);
    task_syncSide_axi_full_argRoute_11_AWREADY(task_syncSide_axi_full_argRoute_11_signals_.awready);
    task_syncSide_axi_full_argRoute_11_AWADDR(task_syncSide_axi_full_argRoute_11_signals_.awaddr);
    task_syncSide_axi_full_argRoute_11_AWPROT(task_syncSide_axi_full_argRoute_11_signals_.awprot);
    task_syncSide_axi_full_argRoute_11_AWREGION(task_syncSide_axi_full_argRoute_11_signals_.awregion);
    task_syncSide_axi_full_argRoute_11_AWQOS(task_syncSide_axi_full_argRoute_11_signals_.awqos);
    task_syncSide_axi_full_argRoute_11_AWCACHE(task_syncSide_axi_full_argRoute_11_signals_.awcache);
    task_syncSide_axi_full_argRoute_11_AWBURST(task_syncSide_axi_full_argRoute_11_signals_.awburst);
    task_syncSide_axi_full_argRoute_11_AWSIZE(task_syncSide_axi_full_argRoute_11_signals_.awsize);
    task_syncSide_axi_full_argRoute_11_AWLEN(task_syncSide_axi_full_argRoute_11_signals_.awlen);
    task_syncSide_axi_full_argRoute_11_AWID(task_syncSide_axi_full_argRoute_11_signals_.awid);
    task_syncSide_axi_full_argRoute_11_AWLOCK(task_syncSide_axi_full_argRoute_11_signals_.awlock);
    task_syncSide_axi_full_argRoute_11_WID(task_syncSide_axi_full_argRoute_11_signals_.wid);
    task_syncSide_axi_full_argRoute_11_WVALID(task_syncSide_axi_full_argRoute_11_signals_.wvalid);
    task_syncSide_axi_full_argRoute_11_WREADY(task_syncSide_axi_full_argRoute_11_signals_.wready);
    task_syncSide_axi_full_argRoute_11_WDATA(task_syncSide_axi_full_argRoute_11_signals_.wdata);
    task_syncSide_axi_full_argRoute_11_WSTRB(task_syncSide_axi_full_argRoute_11_signals_.wstrb);
    task_syncSide_axi_full_argRoute_11_WLAST(task_syncSide_axi_full_argRoute_11_signals_.wlast);
    task_syncSide_axi_full_argRoute_11_BVALID(task_syncSide_axi_full_argRoute_11_signals_.bvalid);
    task_syncSide_axi_full_argRoute_11_BREADY(task_syncSide_axi_full_argRoute_11_signals_.bready);
    task_syncSide_axi_full_argRoute_11_BRESP(task_syncSide_axi_full_argRoute_11_signals_.bresp);
    task_syncSide_axi_full_argRoute_11_BID(task_syncSide_axi_full_argRoute_11_signals_.bid);
    task_syncSide_axi_full_argRoute_11_ARVALID(task_syncSide_axi_full_argRoute_11_signals_.arvalid);
    task_syncSide_axi_full_argRoute_11_ARREADY(task_syncSide_axi_full_argRoute_11_signals_.arready);
    task_syncSide_axi_full_argRoute_11_ARADDR(task_syncSide_axi_full_argRoute_11_signals_.araddr);
    task_syncSide_axi_full_argRoute_11_ARPROT(task_syncSide_axi_full_argRoute_11_signals_.arprot);
    task_syncSide_axi_full_argRoute_11_ARREGION(task_syncSide_axi_full_argRoute_11_signals_.arregion);
    task_syncSide_axi_full_argRoute_11_ARQOS(task_syncSide_axi_full_argRoute_11_signals_.arqos);
    task_syncSide_axi_full_argRoute_11_ARCACHE(task_syncSide_axi_full_argRoute_11_signals_.arcache);
    task_syncSide_axi_full_argRoute_11_ARBURST(task_syncSide_axi_full_argRoute_11_signals_.arburst);
    task_syncSide_axi_full_argRoute_11_ARSIZE(task_syncSide_axi_full_argRoute_11_signals_.arsize);
    task_syncSide_axi_full_argRoute_11_ARLEN(task_syncSide_axi_full_argRoute_11_signals_.arlen);
    task_syncSide_axi_full_argRoute_11_ARID(task_syncSide_axi_full_argRoute_11_signals_.arid);
    task_syncSide_axi_full_argRoute_11_ARLOCK(task_syncSide_axi_full_argRoute_11_signals_.arlock);
    task_syncSide_axi_full_argRoute_11_RVALID(task_syncSide_axi_full_argRoute_11_signals_.rvalid);
    task_syncSide_axi_full_argRoute_11_RREADY(task_syncSide_axi_full_argRoute_11_signals_.rready);
    task_syncSide_axi_full_argRoute_11_RDATA(task_syncSide_axi_full_argRoute_11_signals_.rdata);
    task_syncSide_axi_full_argRoute_11_RRESP(task_syncSide_axi_full_argRoute_11_signals_.rresp);
    task_syncSide_axi_full_argRoute_11_RID(task_syncSide_axi_full_argRoute_11_signals_.rid);
    task_syncSide_axi_full_argRoute_11_RLAST(task_syncSide_axi_full_argRoute_11_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_12 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_12_AWVALID(task_syncSide_axi_full_argRoute_12_signals_.awvalid);
    task_syncSide_axi_full_argRoute_12_AWREADY(task_syncSide_axi_full_argRoute_12_signals_.awready);
    task_syncSide_axi_full_argRoute_12_AWADDR(task_syncSide_axi_full_argRoute_12_signals_.awaddr);
    task_syncSide_axi_full_argRoute_12_AWPROT(task_syncSide_axi_full_argRoute_12_signals_.awprot);
    task_syncSide_axi_full_argRoute_12_AWREGION(task_syncSide_axi_full_argRoute_12_signals_.awregion);
    task_syncSide_axi_full_argRoute_12_AWQOS(task_syncSide_axi_full_argRoute_12_signals_.awqos);
    task_syncSide_axi_full_argRoute_12_AWCACHE(task_syncSide_axi_full_argRoute_12_signals_.awcache);
    task_syncSide_axi_full_argRoute_12_AWBURST(task_syncSide_axi_full_argRoute_12_signals_.awburst);
    task_syncSide_axi_full_argRoute_12_AWSIZE(task_syncSide_axi_full_argRoute_12_signals_.awsize);
    task_syncSide_axi_full_argRoute_12_AWLEN(task_syncSide_axi_full_argRoute_12_signals_.awlen);
    task_syncSide_axi_full_argRoute_12_AWID(task_syncSide_axi_full_argRoute_12_signals_.awid);
    task_syncSide_axi_full_argRoute_12_AWLOCK(task_syncSide_axi_full_argRoute_12_signals_.awlock);
    task_syncSide_axi_full_argRoute_12_WID(task_syncSide_axi_full_argRoute_12_signals_.wid);
    task_syncSide_axi_full_argRoute_12_WVALID(task_syncSide_axi_full_argRoute_12_signals_.wvalid);
    task_syncSide_axi_full_argRoute_12_WREADY(task_syncSide_axi_full_argRoute_12_signals_.wready);
    task_syncSide_axi_full_argRoute_12_WDATA(task_syncSide_axi_full_argRoute_12_signals_.wdata);
    task_syncSide_axi_full_argRoute_12_WSTRB(task_syncSide_axi_full_argRoute_12_signals_.wstrb);
    task_syncSide_axi_full_argRoute_12_WLAST(task_syncSide_axi_full_argRoute_12_signals_.wlast);
    task_syncSide_axi_full_argRoute_12_BVALID(task_syncSide_axi_full_argRoute_12_signals_.bvalid);
    task_syncSide_axi_full_argRoute_12_BREADY(task_syncSide_axi_full_argRoute_12_signals_.bready);
    task_syncSide_axi_full_argRoute_12_BRESP(task_syncSide_axi_full_argRoute_12_signals_.bresp);
    task_syncSide_axi_full_argRoute_12_BID(task_syncSide_axi_full_argRoute_12_signals_.bid);
    task_syncSide_axi_full_argRoute_12_ARVALID(task_syncSide_axi_full_argRoute_12_signals_.arvalid);
    task_syncSide_axi_full_argRoute_12_ARREADY(task_syncSide_axi_full_argRoute_12_signals_.arready);
    task_syncSide_axi_full_argRoute_12_ARADDR(task_syncSide_axi_full_argRoute_12_signals_.araddr);
    task_syncSide_axi_full_argRoute_12_ARPROT(task_syncSide_axi_full_argRoute_12_signals_.arprot);
    task_syncSide_axi_full_argRoute_12_ARREGION(task_syncSide_axi_full_argRoute_12_signals_.arregion);
    task_syncSide_axi_full_argRoute_12_ARQOS(task_syncSide_axi_full_argRoute_12_signals_.arqos);
    task_syncSide_axi_full_argRoute_12_ARCACHE(task_syncSide_axi_full_argRoute_12_signals_.arcache);
    task_syncSide_axi_full_argRoute_12_ARBURST(task_syncSide_axi_full_argRoute_12_signals_.arburst);
    task_syncSide_axi_full_argRoute_12_ARSIZE(task_syncSide_axi_full_argRoute_12_signals_.arsize);
    task_syncSide_axi_full_argRoute_12_ARLEN(task_syncSide_axi_full_argRoute_12_signals_.arlen);
    task_syncSide_axi_full_argRoute_12_ARID(task_syncSide_axi_full_argRoute_12_signals_.arid);
    task_syncSide_axi_full_argRoute_12_ARLOCK(task_syncSide_axi_full_argRoute_12_signals_.arlock);
    task_syncSide_axi_full_argRoute_12_RVALID(task_syncSide_axi_full_argRoute_12_signals_.rvalid);
    task_syncSide_axi_full_argRoute_12_RREADY(task_syncSide_axi_full_argRoute_12_signals_.rready);
    task_syncSide_axi_full_argRoute_12_RDATA(task_syncSide_axi_full_argRoute_12_signals_.rdata);
    task_syncSide_axi_full_argRoute_12_RRESP(task_syncSide_axi_full_argRoute_12_signals_.rresp);
    task_syncSide_axi_full_argRoute_12_RID(task_syncSide_axi_full_argRoute_12_signals_.rid);
    task_syncSide_axi_full_argRoute_12_RLAST(task_syncSide_axi_full_argRoute_12_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_13 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_13_AWVALID(task_syncSide_axi_full_argRoute_13_signals_.awvalid);
    task_syncSide_axi_full_argRoute_13_AWREADY(task_syncSide_axi_full_argRoute_13_signals_.awready);
    task_syncSide_axi_full_argRoute_13_AWADDR(task_syncSide_axi_full_argRoute_13_signals_.awaddr);
    task_syncSide_axi_full_argRoute_13_AWPROT(task_syncSide_axi_full_argRoute_13_signals_.awprot);
    task_syncSide_axi_full_argRoute_13_AWREGION(task_syncSide_axi_full_argRoute_13_signals_.awregion);
    task_syncSide_axi_full_argRoute_13_AWQOS(task_syncSide_axi_full_argRoute_13_signals_.awqos);
    task_syncSide_axi_full_argRoute_13_AWCACHE(task_syncSide_axi_full_argRoute_13_signals_.awcache);
    task_syncSide_axi_full_argRoute_13_AWBURST(task_syncSide_axi_full_argRoute_13_signals_.awburst);
    task_syncSide_axi_full_argRoute_13_AWSIZE(task_syncSide_axi_full_argRoute_13_signals_.awsize);
    task_syncSide_axi_full_argRoute_13_AWLEN(task_syncSide_axi_full_argRoute_13_signals_.awlen);
    task_syncSide_axi_full_argRoute_13_AWID(task_syncSide_axi_full_argRoute_13_signals_.awid);
    task_syncSide_axi_full_argRoute_13_AWLOCK(task_syncSide_axi_full_argRoute_13_signals_.awlock);
    task_syncSide_axi_full_argRoute_13_WID(task_syncSide_axi_full_argRoute_13_signals_.wid);
    task_syncSide_axi_full_argRoute_13_WVALID(task_syncSide_axi_full_argRoute_13_signals_.wvalid);
    task_syncSide_axi_full_argRoute_13_WREADY(task_syncSide_axi_full_argRoute_13_signals_.wready);
    task_syncSide_axi_full_argRoute_13_WDATA(task_syncSide_axi_full_argRoute_13_signals_.wdata);
    task_syncSide_axi_full_argRoute_13_WSTRB(task_syncSide_axi_full_argRoute_13_signals_.wstrb);
    task_syncSide_axi_full_argRoute_13_WLAST(task_syncSide_axi_full_argRoute_13_signals_.wlast);
    task_syncSide_axi_full_argRoute_13_BVALID(task_syncSide_axi_full_argRoute_13_signals_.bvalid);
    task_syncSide_axi_full_argRoute_13_BREADY(task_syncSide_axi_full_argRoute_13_signals_.bready);
    task_syncSide_axi_full_argRoute_13_BRESP(task_syncSide_axi_full_argRoute_13_signals_.bresp);
    task_syncSide_axi_full_argRoute_13_BID(task_syncSide_axi_full_argRoute_13_signals_.bid);
    task_syncSide_axi_full_argRoute_13_ARVALID(task_syncSide_axi_full_argRoute_13_signals_.arvalid);
    task_syncSide_axi_full_argRoute_13_ARREADY(task_syncSide_axi_full_argRoute_13_signals_.arready);
    task_syncSide_axi_full_argRoute_13_ARADDR(task_syncSide_axi_full_argRoute_13_signals_.araddr);
    task_syncSide_axi_full_argRoute_13_ARPROT(task_syncSide_axi_full_argRoute_13_signals_.arprot);
    task_syncSide_axi_full_argRoute_13_ARREGION(task_syncSide_axi_full_argRoute_13_signals_.arregion);
    task_syncSide_axi_full_argRoute_13_ARQOS(task_syncSide_axi_full_argRoute_13_signals_.arqos);
    task_syncSide_axi_full_argRoute_13_ARCACHE(task_syncSide_axi_full_argRoute_13_signals_.arcache);
    task_syncSide_axi_full_argRoute_13_ARBURST(task_syncSide_axi_full_argRoute_13_signals_.arburst);
    task_syncSide_axi_full_argRoute_13_ARSIZE(task_syncSide_axi_full_argRoute_13_signals_.arsize);
    task_syncSide_axi_full_argRoute_13_ARLEN(task_syncSide_axi_full_argRoute_13_signals_.arlen);
    task_syncSide_axi_full_argRoute_13_ARID(task_syncSide_axi_full_argRoute_13_signals_.arid);
    task_syncSide_axi_full_argRoute_13_ARLOCK(task_syncSide_axi_full_argRoute_13_signals_.arlock);
    task_syncSide_axi_full_argRoute_13_RVALID(task_syncSide_axi_full_argRoute_13_signals_.rvalid);
    task_syncSide_axi_full_argRoute_13_RREADY(task_syncSide_axi_full_argRoute_13_signals_.rready);
    task_syncSide_axi_full_argRoute_13_RDATA(task_syncSide_axi_full_argRoute_13_signals_.rdata);
    task_syncSide_axi_full_argRoute_13_RRESP(task_syncSide_axi_full_argRoute_13_signals_.rresp);
    task_syncSide_axi_full_argRoute_13_RID(task_syncSide_axi_full_argRoute_13_signals_.rid);
    task_syncSide_axi_full_argRoute_13_RLAST(task_syncSide_axi_full_argRoute_13_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_14 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_14_AWVALID(task_syncSide_axi_full_argRoute_14_signals_.awvalid);
    task_syncSide_axi_full_argRoute_14_AWREADY(task_syncSide_axi_full_argRoute_14_signals_.awready);
    task_syncSide_axi_full_argRoute_14_AWADDR(task_syncSide_axi_full_argRoute_14_signals_.awaddr);
    task_syncSide_axi_full_argRoute_14_AWPROT(task_syncSide_axi_full_argRoute_14_signals_.awprot);
    task_syncSide_axi_full_argRoute_14_AWREGION(task_syncSide_axi_full_argRoute_14_signals_.awregion);
    task_syncSide_axi_full_argRoute_14_AWQOS(task_syncSide_axi_full_argRoute_14_signals_.awqos);
    task_syncSide_axi_full_argRoute_14_AWCACHE(task_syncSide_axi_full_argRoute_14_signals_.awcache);
    task_syncSide_axi_full_argRoute_14_AWBURST(task_syncSide_axi_full_argRoute_14_signals_.awburst);
    task_syncSide_axi_full_argRoute_14_AWSIZE(task_syncSide_axi_full_argRoute_14_signals_.awsize);
    task_syncSide_axi_full_argRoute_14_AWLEN(task_syncSide_axi_full_argRoute_14_signals_.awlen);
    task_syncSide_axi_full_argRoute_14_AWID(task_syncSide_axi_full_argRoute_14_signals_.awid);
    task_syncSide_axi_full_argRoute_14_AWLOCK(task_syncSide_axi_full_argRoute_14_signals_.awlock);
    task_syncSide_axi_full_argRoute_14_WID(task_syncSide_axi_full_argRoute_14_signals_.wid);
    task_syncSide_axi_full_argRoute_14_WVALID(task_syncSide_axi_full_argRoute_14_signals_.wvalid);
    task_syncSide_axi_full_argRoute_14_WREADY(task_syncSide_axi_full_argRoute_14_signals_.wready);
    task_syncSide_axi_full_argRoute_14_WDATA(task_syncSide_axi_full_argRoute_14_signals_.wdata);
    task_syncSide_axi_full_argRoute_14_WSTRB(task_syncSide_axi_full_argRoute_14_signals_.wstrb);
    task_syncSide_axi_full_argRoute_14_WLAST(task_syncSide_axi_full_argRoute_14_signals_.wlast);
    task_syncSide_axi_full_argRoute_14_BVALID(task_syncSide_axi_full_argRoute_14_signals_.bvalid);
    task_syncSide_axi_full_argRoute_14_BREADY(task_syncSide_axi_full_argRoute_14_signals_.bready);
    task_syncSide_axi_full_argRoute_14_BRESP(task_syncSide_axi_full_argRoute_14_signals_.bresp);
    task_syncSide_axi_full_argRoute_14_BID(task_syncSide_axi_full_argRoute_14_signals_.bid);
    task_syncSide_axi_full_argRoute_14_ARVALID(task_syncSide_axi_full_argRoute_14_signals_.arvalid);
    task_syncSide_axi_full_argRoute_14_ARREADY(task_syncSide_axi_full_argRoute_14_signals_.arready);
    task_syncSide_axi_full_argRoute_14_ARADDR(task_syncSide_axi_full_argRoute_14_signals_.araddr);
    task_syncSide_axi_full_argRoute_14_ARPROT(task_syncSide_axi_full_argRoute_14_signals_.arprot);
    task_syncSide_axi_full_argRoute_14_ARREGION(task_syncSide_axi_full_argRoute_14_signals_.arregion);
    task_syncSide_axi_full_argRoute_14_ARQOS(task_syncSide_axi_full_argRoute_14_signals_.arqos);
    task_syncSide_axi_full_argRoute_14_ARCACHE(task_syncSide_axi_full_argRoute_14_signals_.arcache);
    task_syncSide_axi_full_argRoute_14_ARBURST(task_syncSide_axi_full_argRoute_14_signals_.arburst);
    task_syncSide_axi_full_argRoute_14_ARSIZE(task_syncSide_axi_full_argRoute_14_signals_.arsize);
    task_syncSide_axi_full_argRoute_14_ARLEN(task_syncSide_axi_full_argRoute_14_signals_.arlen);
    task_syncSide_axi_full_argRoute_14_ARID(task_syncSide_axi_full_argRoute_14_signals_.arid);
    task_syncSide_axi_full_argRoute_14_ARLOCK(task_syncSide_axi_full_argRoute_14_signals_.arlock);
    task_syncSide_axi_full_argRoute_14_RVALID(task_syncSide_axi_full_argRoute_14_signals_.rvalid);
    task_syncSide_axi_full_argRoute_14_RREADY(task_syncSide_axi_full_argRoute_14_signals_.rready);
    task_syncSide_axi_full_argRoute_14_RDATA(task_syncSide_axi_full_argRoute_14_signals_.rdata);
    task_syncSide_axi_full_argRoute_14_RRESP(task_syncSide_axi_full_argRoute_14_signals_.rresp);
    task_syncSide_axi_full_argRoute_14_RID(task_syncSide_axi_full_argRoute_14_signals_.rid);
    task_syncSide_axi_full_argRoute_14_RLAST(task_syncSide_axi_full_argRoute_14_signals_.rlast);
    
    
    /* connecting AXI4 interface with name: task_syncSide_axi_full_argRoute_15 */
    /* is_slave = False */
    task_syncSide_axi_full_argRoute_15_AWVALID(task_syncSide_axi_full_argRoute_15_signals_.awvalid);
    task_syncSide_axi_full_argRoute_15_AWREADY(task_syncSide_axi_full_argRoute_15_signals_.awready);
    task_syncSide_axi_full_argRoute_15_AWADDR(task_syncSide_axi_full_argRoute_15_signals_.awaddr);
    task_syncSide_axi_full_argRoute_15_AWPROT(task_syncSide_axi_full_argRoute_15_signals_.awprot);
    task_syncSide_axi_full_argRoute_15_AWREGION(task_syncSide_axi_full_argRoute_15_signals_.awregion);
    task_syncSide_axi_full_argRoute_15_AWQOS(task_syncSide_axi_full_argRoute_15_signals_.awqos);
    task_syncSide_axi_full_argRoute_15_AWCACHE(task_syncSide_axi_full_argRoute_15_signals_.awcache);
    task_syncSide_axi_full_argRoute_15_AWBURST(task_syncSide_axi_full_argRoute_15_signals_.awburst);
    task_syncSide_axi_full_argRoute_15_AWSIZE(task_syncSide_axi_full_argRoute_15_signals_.awsize);
    task_syncSide_axi_full_argRoute_15_AWLEN(task_syncSide_axi_full_argRoute_15_signals_.awlen);
    task_syncSide_axi_full_argRoute_15_AWID(task_syncSide_axi_full_argRoute_15_signals_.awid);
    task_syncSide_axi_full_argRoute_15_AWLOCK(task_syncSide_axi_full_argRoute_15_signals_.awlock);
    task_syncSide_axi_full_argRoute_15_WID(task_syncSide_axi_full_argRoute_15_signals_.wid);
    task_syncSide_axi_full_argRoute_15_WVALID(task_syncSide_axi_full_argRoute_15_signals_.wvalid);
    task_syncSide_axi_full_argRoute_15_WREADY(task_syncSide_axi_full_argRoute_15_signals_.wready);
    task_syncSide_axi_full_argRoute_15_WDATA(task_syncSide_axi_full_argRoute_15_signals_.wdata);
    task_syncSide_axi_full_argRoute_15_WSTRB(task_syncSide_axi_full_argRoute_15_signals_.wstrb);
    task_syncSide_axi_full_argRoute_15_WLAST(task_syncSide_axi_full_argRoute_15_signals_.wlast);
    task_syncSide_axi_full_argRoute_15_BVALID(task_syncSide_axi_full_argRoute_15_signals_.bvalid);
    task_syncSide_axi_full_argRoute_15_BREADY(task_syncSide_axi_full_argRoute_15_signals_.bready);
    task_syncSide_axi_full_argRoute_15_BRESP(task_syncSide_axi_full_argRoute_15_signals_.bresp);
    task_syncSide_axi_full_argRoute_15_BID(task_syncSide_axi_full_argRoute_15_signals_.bid);
    task_syncSide_axi_full_argRoute_15_ARVALID(task_syncSide_axi_full_argRoute_15_signals_.arvalid);
    task_syncSide_axi_full_argRoute_15_ARREADY(task_syncSide_axi_full_argRoute_15_signals_.arready);
    task_syncSide_axi_full_argRoute_15_ARADDR(task_syncSide_axi_full_argRoute_15_signals_.araddr);
    task_syncSide_axi_full_argRoute_15_ARPROT(task_syncSide_axi_full_argRoute_15_signals_.arprot);
    task_syncSide_axi_full_argRoute_15_ARREGION(task_syncSide_axi_full_argRoute_15_signals_.arregion);
    task_syncSide_axi_full_argRoute_15_ARQOS(task_syncSide_axi_full_argRoute_15_signals_.arqos);
    task_syncSide_axi_full_argRoute_15_ARCACHE(task_syncSide_axi_full_argRoute_15_signals_.arcache);
    task_syncSide_axi_full_argRoute_15_ARBURST(task_syncSide_axi_full_argRoute_15_signals_.arburst);
    task_syncSide_axi_full_argRoute_15_ARSIZE(task_syncSide_axi_full_argRoute_15_signals_.arsize);
    task_syncSide_axi_full_argRoute_15_ARLEN(task_syncSide_axi_full_argRoute_15_signals_.arlen);
    task_syncSide_axi_full_argRoute_15_ARID(task_syncSide_axi_full_argRoute_15_signals_.arid);
    task_syncSide_axi_full_argRoute_15_ARLOCK(task_syncSide_axi_full_argRoute_15_signals_.arlock);
    task_syncSide_axi_full_argRoute_15_RVALID(task_syncSide_axi_full_argRoute_15_signals_.rvalid);
    task_syncSide_axi_full_argRoute_15_RREADY(task_syncSide_axi_full_argRoute_15_signals_.rready);
    task_syncSide_axi_full_argRoute_15_RDATA(task_syncSide_axi_full_argRoute_15_signals_.rdata);
    task_syncSide_axi_full_argRoute_15_RRESP(task_syncSide_axi_full_argRoute_15_signals_.rresp);
    task_syncSide_axi_full_argRoute_15_RID(task_syncSide_axi_full_argRoute_15_signals_.rid);
    task_syncSide_axi_full_argRoute_15_RLAST(task_syncSide_axi_full_argRoute_15_signals_.rlast);
    
    
}

void VerilatedTlmModule::do_init_()
{
    set("clock", clock);
    set("reset", reset);
    set("description", description);
}

hardcilk::desc::FlexiTaskSystem VerilatedTlmModule::description = [] {
    using namespace hardcilk::desc;
    auto description = FlexiTaskSystem{
        .tasks = []() {
            std::map<std::string, Task> r;
            r["task"] = Task{
                .name = "task",
                .parent = "/tasks",
                .path = "/tasks:task",
                .isRoot = true,
                .isCont = true,
                .widthTask = 256,
                .widthCont = 256,
                .widthArg = 256,
                .numProcessingElements = 24,
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_0",
                                .path = "/tasks:task/processingElements:pe_0/interfaces:contOut_task",
                                .portName = "task_PE_0_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_0",
                                .path = "/tasks:task/processingElements:pe_0/interfaces:addrIn_task",
                                .portName = "task_PE_0_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_1",
                                .path = "/tasks:task/processingElements:pe_1/interfaces:contOut_task",
                                .portName = "task_PE_1_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_1",
                                .path = "/tasks:task/processingElements:pe_1/interfaces:addrIn_task",
                                .portName = "task_PE_1_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_2",
                                .path = "/tasks:task/processingElements:pe_2/interfaces:contOut_task",
                                .portName = "task_PE_2_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_2",
                                .path = "/tasks:task/processingElements:pe_2/interfaces:addrIn_task",
                                .portName = "task_PE_2_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_3",
                                .path = "/tasks:task/processingElements:pe_3/interfaces:contOut_task",
                                .portName = "task_PE_3_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_3",
                                .path = "/tasks:task/processingElements:pe_3/interfaces:addrIn_task",
                                .portName = "task_PE_3_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_4",
                                .path = "/tasks:task/processingElements:pe_4/interfaces:contOut_task",
                                .portName = "task_PE_4_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_4",
                                .path = "/tasks:task/processingElements:pe_4/interfaces:addrIn_task",
                                .portName = "task_PE_4_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_5",
                                .path = "/tasks:task/processingElements:pe_5/interfaces:contOut_task",
                                .portName = "task_PE_5_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_5",
                                .path = "/tasks:task/processingElements:pe_5/interfaces:addrIn_task",
                                .portName = "task_PE_5_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_6",
                                .path = "/tasks:task/processingElements:pe_6/interfaces:contOut_task",
                                .portName = "task_PE_6_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_6",
                                .path = "/tasks:task/processingElements:pe_6/interfaces:addrIn_task",
                                .portName = "task_PE_6_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_7",
                                .path = "/tasks:task/processingElements:pe_7/interfaces:contOut_task",
                                .portName = "task_PE_7_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_7",
                                .path = "/tasks:task/processingElements:pe_7/interfaces:addrIn_task",
                                .portName = "task_PE_7_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_8",
                                .path = "/tasks:task/processingElements:pe_8/interfaces:contOut_task",
                                .portName = "task_PE_8_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_8",
                                .path = "/tasks:task/processingElements:pe_8/interfaces:addrIn_task",
                                .portName = "task_PE_8_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_9",
                                .path = "/tasks:task/processingElements:pe_9/interfaces:contOut_task",
                                .portName = "task_PE_9_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_9",
                                .path = "/tasks:task/processingElements:pe_9/interfaces:addrIn_task",
                                .portName = "task_PE_9_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_10",
                                .path = "/tasks:task/processingElements:pe_10/interfaces:contOut_task",
                                .portName = "task_PE_10_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_10",
                                .path = "/tasks:task/processingElements:pe_10/interfaces:addrIn_task",
                                .portName = "task_PE_10_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_11",
                                .path = "/tasks:task/processingElements:pe_11/interfaces:contOut_task",
                                .portName = "task_PE_11_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_11",
                                .path = "/tasks:task/processingElements:pe_11/interfaces:addrIn_task",
                                .portName = "task_PE_11_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_12",
                                .path = "/tasks:task/processingElements:pe_12/interfaces:contOut_task",
                                .portName = "task_PE_12_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_12",
                                .path = "/tasks:task/processingElements:pe_12/interfaces:addrIn_task",
                                .portName = "task_PE_12_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_13",
                                .path = "/tasks:task/processingElements:pe_13/interfaces:contOut_task",
                                .portName = "task_PE_13_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_13",
                                .path = "/tasks:task/processingElements:pe_13/interfaces:addrIn_task",
                                .portName = "task_PE_13_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_14",
                                .path = "/tasks:task/processingElements:pe_14/interfaces:contOut_task",
                                .portName = "task_PE_14_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_14",
                                .path = "/tasks:task/processingElements:pe_14/interfaces:addrIn_task",
                                .portName = "task_PE_14_addrIn_task",
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
                                    .data_width = 256,
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
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_15",
                                .path = "/tasks:task/processingElements:pe_15/interfaces:contOut_task",
                                .portName = "task_PE_15_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_15",
                                .path = "/tasks:task/processingElements:pe_15/interfaces:addrIn_task",
                                .portName = "task_PE_15_addrIn_task",
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
                    r["pe_16"] = ProcessingElement{
                        .name = "pe_16",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_16",
                        .portName = "task_PE_16",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_16",
                                .path = "/tasks:task/processingElements:pe_16/interfaces:mem",
                                .portName = "task_PE_16_mem",
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
                                .parent = "/tasks:task/processingElements:pe_16",
                                .path = "/tasks:task/processingElements:pe_16/interfaces:taskIn",
                                .portName = "task_PE_16_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_16",
                                .path = "/tasks:task/processingElements:pe_16/interfaces:taskOut",
                                .portName = "task_PE_16_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_16",
                                .path = "/tasks:task/processingElements:pe_16/interfaces:contOut_task",
                                .portName = "task_PE_16_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_16",
                                .path = "/tasks:task/processingElements:pe_16/interfaces:addrIn_task",
                                .portName = "task_PE_16_addrIn_task",
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
                    r["pe_17"] = ProcessingElement{
                        .name = "pe_17",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_17",
                        .portName = "task_PE_17",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_17",
                                .path = "/tasks:task/processingElements:pe_17/interfaces:mem",
                                .portName = "task_PE_17_mem",
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
                                .parent = "/tasks:task/processingElements:pe_17",
                                .path = "/tasks:task/processingElements:pe_17/interfaces:taskIn",
                                .portName = "task_PE_17_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_17",
                                .path = "/tasks:task/processingElements:pe_17/interfaces:taskOut",
                                .portName = "task_PE_17_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_17",
                                .path = "/tasks:task/processingElements:pe_17/interfaces:contOut_task",
                                .portName = "task_PE_17_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_17",
                                .path = "/tasks:task/processingElements:pe_17/interfaces:addrIn_task",
                                .portName = "task_PE_17_addrIn_task",
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
                    r["pe_18"] = ProcessingElement{
                        .name = "pe_18",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_18",
                        .portName = "task_PE_18",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_18",
                                .path = "/tasks:task/processingElements:pe_18/interfaces:mem",
                                .portName = "task_PE_18_mem",
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
                                .parent = "/tasks:task/processingElements:pe_18",
                                .path = "/tasks:task/processingElements:pe_18/interfaces:taskIn",
                                .portName = "task_PE_18_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_18",
                                .path = "/tasks:task/processingElements:pe_18/interfaces:taskOut",
                                .portName = "task_PE_18_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_18",
                                .path = "/tasks:task/processingElements:pe_18/interfaces:contOut_task",
                                .portName = "task_PE_18_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_18",
                                .path = "/tasks:task/processingElements:pe_18/interfaces:addrIn_task",
                                .portName = "task_PE_18_addrIn_task",
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
                    r["pe_19"] = ProcessingElement{
                        .name = "pe_19",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_19",
                        .portName = "task_PE_19",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_19",
                                .path = "/tasks:task/processingElements:pe_19/interfaces:mem",
                                .portName = "task_PE_19_mem",
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
                                .parent = "/tasks:task/processingElements:pe_19",
                                .path = "/tasks:task/processingElements:pe_19/interfaces:taskIn",
                                .portName = "task_PE_19_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_19",
                                .path = "/tasks:task/processingElements:pe_19/interfaces:taskOut",
                                .portName = "task_PE_19_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_19",
                                .path = "/tasks:task/processingElements:pe_19/interfaces:contOut_task",
                                .portName = "task_PE_19_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_19",
                                .path = "/tasks:task/processingElements:pe_19/interfaces:addrIn_task",
                                .portName = "task_PE_19_addrIn_task",
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
                    r["pe_20"] = ProcessingElement{
                        .name = "pe_20",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_20",
                        .portName = "task_PE_20",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_20",
                                .path = "/tasks:task/processingElements:pe_20/interfaces:mem",
                                .portName = "task_PE_20_mem",
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
                                .parent = "/tasks:task/processingElements:pe_20",
                                .path = "/tasks:task/processingElements:pe_20/interfaces:taskIn",
                                .portName = "task_PE_20_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_20",
                                .path = "/tasks:task/processingElements:pe_20/interfaces:taskOut",
                                .portName = "task_PE_20_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_20",
                                .path = "/tasks:task/processingElements:pe_20/interfaces:contOut_task",
                                .portName = "task_PE_20_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_20",
                                .path = "/tasks:task/processingElements:pe_20/interfaces:addrIn_task",
                                .portName = "task_PE_20_addrIn_task",
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
                    r["pe_21"] = ProcessingElement{
                        .name = "pe_21",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_21",
                        .portName = "task_PE_21",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_21",
                                .path = "/tasks:task/processingElements:pe_21/interfaces:mem",
                                .portName = "task_PE_21_mem",
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
                                .parent = "/tasks:task/processingElements:pe_21",
                                .path = "/tasks:task/processingElements:pe_21/interfaces:taskIn",
                                .portName = "task_PE_21_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_21",
                                .path = "/tasks:task/processingElements:pe_21/interfaces:taskOut",
                                .portName = "task_PE_21_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_21",
                                .path = "/tasks:task/processingElements:pe_21/interfaces:contOut_task",
                                .portName = "task_PE_21_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_21",
                                .path = "/tasks:task/processingElements:pe_21/interfaces:addrIn_task",
                                .portName = "task_PE_21_addrIn_task",
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
                    r["pe_22"] = ProcessingElement{
                        .name = "pe_22",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_22",
                        .portName = "task_PE_22",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_22",
                                .path = "/tasks:task/processingElements:pe_22/interfaces:mem",
                                .portName = "task_PE_22_mem",
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
                                .parent = "/tasks:task/processingElements:pe_22",
                                .path = "/tasks:task/processingElements:pe_22/interfaces:taskIn",
                                .portName = "task_PE_22_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_22",
                                .path = "/tasks:task/processingElements:pe_22/interfaces:taskOut",
                                .portName = "task_PE_22_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_22",
                                .path = "/tasks:task/processingElements:pe_22/interfaces:contOut_task",
                                .portName = "task_PE_22_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_22",
                                .path = "/tasks:task/processingElements:pe_22/interfaces:addrIn_task",
                                .portName = "task_PE_22_addrIn_task",
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
                    r["pe_23"] = ProcessingElement{
                        .name = "pe_23",
                        .parent = "/tasks:task",
                        .path = "/tasks:task/processingElements:pe_23",
                        .portName = "task_PE_23",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:task/processingElements:pe_23",
                                .path = "/tasks:task/processingElements:pe_23/interfaces:mem",
                                .portName = "task_PE_23_mem",
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
                                .parent = "/tasks:task/processingElements:pe_23",
                                .path = "/tasks:task/processingElements:pe_23/interfaces:taskIn",
                                .portName = "task_PE_23_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:task/processingElements:pe_23",
                                .path = "/tasks:task/processingElements:pe_23/interfaces:taskOut",
                                .portName = "task_PE_23_taskOut",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 256,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["contOut_task"] = Interface{
                                .name = "contOut_task",
                                .parent = "/tasks:task/processingElements:pe_23",
                                .path = "/tasks:task/processingElements:pe_23/interfaces:contOut_task",
                                .portName = "task_PE_23_contOut_task",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = false,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["addrIn_task"] = Interface{
                                .name = "addrIn_task",
                                .parent = "/tasks:task/processingElements:pe_23",
                                .path = "/tasks:task/processingElements:pe_23/interfaces:addrIn_task",
                                .portName = "task_PE_23_addrIn_task",
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
                .numVirtualStealServers = 1,
                .capacityVirtualStealQueue = 100000,
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
                        .capacity = 100000,
                        .numBytesTask = 32
                    };
                    return r;
                }(),
                .numVirtualContinuationServers = 1,
                .capacityVirtualContinuationQueue = 10000000,
                .virtualContinuationAddressServers = []() {
                    std::map<std::string, VirtualContinuationAddressServer> r;
                    r["vcas_0"] = VirtualContinuationAddressServer{
                        .name = "vcas_0",
                        .parent = "task",
                        .path = "/tasks:task/virtualContinuationServers:vcas_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff10000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:task_continuationAllocationSide_axi_mgmt_vcas",
                        .capacity = 10000000,
                        .numBytesCont = 32
                    };
                    return r;
                }(),
                .numArgRouteServers = 8,
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
                r["task_stealSide_taskOut_0"] = Interface{
                    .name = "task_stealSide_taskOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_0",
                    .portName = "task_stealSide_taskOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_16"] = Interface{
                    .name = "task_stealSide_taskOut_16",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_16",
                    .portName = "task_stealSide_taskOut_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_17"] = Interface{
                    .name = "task_stealSide_taskOut_17",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_17",
                    .portName = "task_stealSide_taskOut_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_18"] = Interface{
                    .name = "task_stealSide_taskOut_18",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_18",
                    .portName = "task_stealSide_taskOut_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_19"] = Interface{
                    .name = "task_stealSide_taskOut_19",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_19",
                    .portName = "task_stealSide_taskOut_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_20"] = Interface{
                    .name = "task_stealSide_taskOut_20",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_20",
                    .portName = "task_stealSide_taskOut_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_21"] = Interface{
                    .name = "task_stealSide_taskOut_21",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_21",
                    .portName = "task_stealSide_taskOut_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_22"] = Interface{
                    .name = "task_stealSide_taskOut_22",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_22",
                    .portName = "task_stealSide_taskOut_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskOut_23"] = Interface{
                    .name = "task_stealSide_taskOut_23",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskOut_23",
                    .portName = "task_stealSide_taskOut_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
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
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_16"] = Interface{
                    .name = "task_stealSide_taskIn_16",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_16",
                    .portName = "task_stealSide_taskIn_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_17"] = Interface{
                    .name = "task_stealSide_taskIn_17",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_17",
                    .portName = "task_stealSide_taskIn_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_18"] = Interface{
                    .name = "task_stealSide_taskIn_18",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_18",
                    .portName = "task_stealSide_taskIn_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_19"] = Interface{
                    .name = "task_stealSide_taskIn_19",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_19",
                    .portName = "task_stealSide_taskIn_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_20"] = Interface{
                    .name = "task_stealSide_taskIn_20",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_20",
                    .portName = "task_stealSide_taskIn_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_21"] = Interface{
                    .name = "task_stealSide_taskIn_21",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_21",
                    .portName = "task_stealSide_taskIn_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_22"] = Interface{
                    .name = "task_stealSide_taskIn_22",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_22",
                    .portName = "task_stealSide_taskIn_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_stealSide_taskIn_23"] = Interface{
                    .name = "task_stealSide_taskIn_23",
                    .parent = "/system",
                    .path = "/system/interfaces:task_stealSide_taskIn_23",
                    .portName = "task_stealSide_taskIn_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_0"] = Interface{
                    .name = "task_syncSide_addrIn_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_0",
                    .portName = "task_syncSide_addrIn_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_1"] = Interface{
                    .name = "task_syncSide_addrIn_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_1",
                    .portName = "task_syncSide_addrIn_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_2"] = Interface{
                    .name = "task_syncSide_addrIn_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_2",
                    .portName = "task_syncSide_addrIn_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_3"] = Interface{
                    .name = "task_syncSide_addrIn_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_3",
                    .portName = "task_syncSide_addrIn_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_4"] = Interface{
                    .name = "task_syncSide_addrIn_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_4",
                    .portName = "task_syncSide_addrIn_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_5"] = Interface{
                    .name = "task_syncSide_addrIn_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_5",
                    .portName = "task_syncSide_addrIn_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_6"] = Interface{
                    .name = "task_syncSide_addrIn_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_6",
                    .portName = "task_syncSide_addrIn_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_7"] = Interface{
                    .name = "task_syncSide_addrIn_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_7",
                    .portName = "task_syncSide_addrIn_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_8"] = Interface{
                    .name = "task_syncSide_addrIn_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_8",
                    .portName = "task_syncSide_addrIn_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_9"] = Interface{
                    .name = "task_syncSide_addrIn_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_9",
                    .portName = "task_syncSide_addrIn_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_10"] = Interface{
                    .name = "task_syncSide_addrIn_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_10",
                    .portName = "task_syncSide_addrIn_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_11"] = Interface{
                    .name = "task_syncSide_addrIn_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_11",
                    .portName = "task_syncSide_addrIn_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_12"] = Interface{
                    .name = "task_syncSide_addrIn_12",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_12",
                    .portName = "task_syncSide_addrIn_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_13"] = Interface{
                    .name = "task_syncSide_addrIn_13",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_13",
                    .portName = "task_syncSide_addrIn_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_14"] = Interface{
                    .name = "task_syncSide_addrIn_14",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_14",
                    .portName = "task_syncSide_addrIn_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_15"] = Interface{
                    .name = "task_syncSide_addrIn_15",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_15",
                    .portName = "task_syncSide_addrIn_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_16"] = Interface{
                    .name = "task_syncSide_addrIn_16",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_16",
                    .portName = "task_syncSide_addrIn_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_17"] = Interface{
                    .name = "task_syncSide_addrIn_17",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_17",
                    .portName = "task_syncSide_addrIn_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_18"] = Interface{
                    .name = "task_syncSide_addrIn_18",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_18",
                    .portName = "task_syncSide_addrIn_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_19"] = Interface{
                    .name = "task_syncSide_addrIn_19",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_19",
                    .portName = "task_syncSide_addrIn_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_20"] = Interface{
                    .name = "task_syncSide_addrIn_20",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_20",
                    .portName = "task_syncSide_addrIn_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_21"] = Interface{
                    .name = "task_syncSide_addrIn_21",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_21",
                    .portName = "task_syncSide_addrIn_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_22"] = Interface{
                    .name = "task_syncSide_addrIn_22",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_22",
                    .portName = "task_syncSide_addrIn_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_syncSide_addrIn_23"] = Interface{
                    .name = "task_syncSide_addrIn_23",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_addrIn_23",
                    .portName = "task_syncSide_addrIn_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_0"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_0",
                    .portName = "task_continuationAllocationSide_contOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_1"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_1",
                    .portName = "task_continuationAllocationSide_contOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_2"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_2",
                    .portName = "task_continuationAllocationSide_contOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_3"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_3",
                    .portName = "task_continuationAllocationSide_contOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_4"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_4",
                    .portName = "task_continuationAllocationSide_contOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_5"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_5",
                    .portName = "task_continuationAllocationSide_contOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_6"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_6",
                    .portName = "task_continuationAllocationSide_contOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_7"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_7",
                    .portName = "task_continuationAllocationSide_contOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_8"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_8",
                    .portName = "task_continuationAllocationSide_contOut_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_9"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_9",
                    .portName = "task_continuationAllocationSide_contOut_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_10"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_10",
                    .portName = "task_continuationAllocationSide_contOut_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_11"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_11",
                    .portName = "task_continuationAllocationSide_contOut_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_12"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_12",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_12",
                    .portName = "task_continuationAllocationSide_contOut_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_13"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_13",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_13",
                    .portName = "task_continuationAllocationSide_contOut_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_14"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_14",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_14",
                    .portName = "task_continuationAllocationSide_contOut_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_15"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_15",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_15",
                    .portName = "task_continuationAllocationSide_contOut_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_16"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_16",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_16",
                    .portName = "task_continuationAllocationSide_contOut_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_17"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_17",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_17",
                    .portName = "task_continuationAllocationSide_contOut_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_18"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_18",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_18",
                    .portName = "task_continuationAllocationSide_contOut_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_19"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_19",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_19",
                    .portName = "task_continuationAllocationSide_contOut_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_20"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_20",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_20",
                    .portName = "task_continuationAllocationSide_contOut_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_21"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_21",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_21",
                    .portName = "task_continuationAllocationSide_contOut_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_22"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_22",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_22",
                    .portName = "task_continuationAllocationSide_contOut_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["task_continuationAllocationSide_contOut_23"] = Interface{
                    .name = "task_continuationAllocationSide_contOut_23",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_contOut_23",
                    .portName = "task_continuationAllocationSide_contOut_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
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
                r["task_continuationAllocationSide_axi_mgmt_vcas"] = Interface{
                    .name = "task_continuationAllocationSide_axi_mgmt_vcas",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_axi_mgmt_vcas",
                    .portName = "task_continuationAllocationSide_axi_mgmt_vcas",
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
                r["task_continuationAllocationSide_vcas_axi_full"] = Interface{
                    .name = "task_continuationAllocationSide_vcas_axi_full",
                    .parent = "/system",
                    .path = "/system/interfaces:task_continuationAllocationSide_vcas_axi_full",
                    .portName = "task_continuationAllocationSide_vcas_axi_full",
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
                r["task_syncSide_axi_full_argRoute_0"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_0",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_0",
                    .portName = "task_syncSide_axi_full_argRoute_0",
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
                r["task_syncSide_axi_full_argRoute_1"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_1",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_1",
                    .portName = "task_syncSide_axi_full_argRoute_1",
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
                r["task_syncSide_axi_full_argRoute_2"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_2",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_2",
                    .portName = "task_syncSide_axi_full_argRoute_2",
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
                r["task_syncSide_axi_full_argRoute_3"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_3",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_3",
                    .portName = "task_syncSide_axi_full_argRoute_3",
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
                r["task_syncSide_axi_full_argRoute_4"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_4",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_4",
                    .portName = "task_syncSide_axi_full_argRoute_4",
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
                r["task_syncSide_axi_full_argRoute_5"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_5",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_5",
                    .portName = "task_syncSide_axi_full_argRoute_5",
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
                r["task_syncSide_axi_full_argRoute_6"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_6",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_6",
                    .portName = "task_syncSide_axi_full_argRoute_6",
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
                r["task_syncSide_axi_full_argRoute_7"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_7",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_7",
                    .portName = "task_syncSide_axi_full_argRoute_7",
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
                r["task_syncSide_axi_full_argRoute_8"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_8",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_8",
                    .portName = "task_syncSide_axi_full_argRoute_8",
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
                r["task_syncSide_axi_full_argRoute_9"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_9",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_9",
                    .portName = "task_syncSide_axi_full_argRoute_9",
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
                r["task_syncSide_axi_full_argRoute_10"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_10",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_10",
                    .portName = "task_syncSide_axi_full_argRoute_10",
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
                r["task_syncSide_axi_full_argRoute_11"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_11",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_11",
                    .portName = "task_syncSide_axi_full_argRoute_11",
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
                r["task_syncSide_axi_full_argRoute_12"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_12",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_12",
                    .portName = "task_syncSide_axi_full_argRoute_12",
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
                r["task_syncSide_axi_full_argRoute_13"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_13",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_13",
                    .portName = "task_syncSide_axi_full_argRoute_13",
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
                r["task_syncSide_axi_full_argRoute_14"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_14",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_14",
                    .portName = "task_syncSide_axi_full_argRoute_14",
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
                r["task_syncSide_axi_full_argRoute_15"] = Interface{
                    .name = "task_syncSide_axi_full_argRoute_15",
                    .parent = "/system",
                    .path = "/system/interfaces:task_syncSide_axi_full_argRoute_15",
                    .portName = "task_syncSide_axi_full_argRoute_15",
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
                "/system/interfaces:task_stealSide_taskOut_16",
                "/tasks:task/processingElements:pe_16/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_17",
                "/tasks:task/processingElements:pe_17/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_18",
                "/tasks:task/processingElements:pe_18/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_19",
                "/tasks:task/processingElements:pe_19/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_20",
                "/tasks:task/processingElements:pe_20/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_21",
                "/tasks:task/processingElements:pe_21/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_22",
                "/tasks:task/processingElements:pe_22/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_stealSide_taskOut_23",
                "/tasks:task/processingElements:pe_23/interfaces:taskIn"
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
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_16/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_16"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_17/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_17"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_18/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_18"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_19/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_19"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_20/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_20"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_21/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_21"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_22/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_22"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_23/interfaces:taskOut",
                "/system/interfaces:task_stealSide_taskIn_23"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_0/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_0"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_1/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_1"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_2/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_2"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_3/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_3"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_4/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_4"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_5/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_6/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_7/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_7"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_8/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_8"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_9/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_9"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_10/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_10"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_11/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_11"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_12/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_12"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_13/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_13"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_14/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_14"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_15/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_15"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_16/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_16"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_17/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_17"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_18/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_18"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_19/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_19"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_20/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_20"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_21/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_21"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_22/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_22"
            },
            std::pair<std::string, std::string>{
                "/tasks:task/processingElements:pe_23/interfaces:contOut_task",
                "/system/interfaces:task_syncSide_addrIn_23"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_0",
                "/tasks:task/processingElements:pe_0/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_1",
                "/tasks:task/processingElements:pe_1/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_2",
                "/tasks:task/processingElements:pe_2/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_3",
                "/tasks:task/processingElements:pe_3/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_4",
                "/tasks:task/processingElements:pe_4/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_5",
                "/tasks:task/processingElements:pe_5/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_6",
                "/tasks:task/processingElements:pe_6/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_7",
                "/tasks:task/processingElements:pe_7/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_8",
                "/tasks:task/processingElements:pe_8/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_9",
                "/tasks:task/processingElements:pe_9/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_10",
                "/tasks:task/processingElements:pe_10/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_11",
                "/tasks:task/processingElements:pe_11/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_12",
                "/tasks:task/processingElements:pe_12/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_13",
                "/tasks:task/processingElements:pe_13/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_14",
                "/tasks:task/processingElements:pe_14/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_15",
                "/tasks:task/processingElements:pe_15/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_16",
                "/tasks:task/processingElements:pe_16/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_17",
                "/tasks:task/processingElements:pe_17/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_18",
                "/tasks:task/processingElements:pe_18/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_19",
                "/tasks:task/processingElements:pe_19/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_20",
                "/tasks:task/processingElements:pe_20/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_21",
                "/tasks:task/processingElements:pe_21/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_22",
                "/tasks:task/processingElements:pe_22/interfaces:addrIn_task"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:task_continuationAllocationSide_contOut_23",
                "/tasks:task/processingElements:pe_23/interfaces:addrIn_task"
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
        .spawnNextList = []() {
            std::map<std::string, std::vector<std::string>> r;
            r["task"] = std::vector<std::string>{
                "task"
            };
            return r;
        }(),
        .sendArgumentList = []() {
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
        .interconnectMasters = 43,
        .interconnectSlaves = 3,
        .isElaborated = true
    };
    return description;
}();



}