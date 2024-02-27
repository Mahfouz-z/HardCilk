#include "fibonacci__peCountFib_32__peCountSum_32.hpp"

namespace fibonacci::generated
{

fibonacci__peCountFib_32__peCountSum_32::fibonacci__peCountFib_32__peCountSum_32(sc_core::sc_module_name const &name):
    Vfibonacci__peCountFib_32__peCountSum_32(name),
    fib_stealSide_taskOut_0_signals_("fib_stealSide_taskOut_0_signals"),
    fib_stealSide_taskOut_1_signals_("fib_stealSide_taskOut_1_signals"),
    fib_stealSide_taskOut_2_signals_("fib_stealSide_taskOut_2_signals"),
    fib_stealSide_taskOut_3_signals_("fib_stealSide_taskOut_3_signals"),
    fib_stealSide_taskOut_4_signals_("fib_stealSide_taskOut_4_signals"),
    fib_stealSide_taskOut_5_signals_("fib_stealSide_taskOut_5_signals"),
    fib_stealSide_taskOut_6_signals_("fib_stealSide_taskOut_6_signals"),
    fib_stealSide_taskOut_7_signals_("fib_stealSide_taskOut_7_signals"),
    fib_stealSide_taskOut_8_signals_("fib_stealSide_taskOut_8_signals"),
    fib_stealSide_taskOut_9_signals_("fib_stealSide_taskOut_9_signals"),
    fib_stealSide_taskOut_10_signals_("fib_stealSide_taskOut_10_signals"),
    fib_stealSide_taskOut_11_signals_("fib_stealSide_taskOut_11_signals"),
    fib_stealSide_taskOut_12_signals_("fib_stealSide_taskOut_12_signals"),
    fib_stealSide_taskOut_13_signals_("fib_stealSide_taskOut_13_signals"),
    fib_stealSide_taskOut_14_signals_("fib_stealSide_taskOut_14_signals"),
    fib_stealSide_taskOut_15_signals_("fib_stealSide_taskOut_15_signals"),
    fib_stealSide_taskOut_16_signals_("fib_stealSide_taskOut_16_signals"),
    fib_stealSide_taskOut_17_signals_("fib_stealSide_taskOut_17_signals"),
    fib_stealSide_taskOut_18_signals_("fib_stealSide_taskOut_18_signals"),
    fib_stealSide_taskOut_19_signals_("fib_stealSide_taskOut_19_signals"),
    fib_stealSide_taskOut_20_signals_("fib_stealSide_taskOut_20_signals"),
    fib_stealSide_taskOut_21_signals_("fib_stealSide_taskOut_21_signals"),
    fib_stealSide_taskOut_22_signals_("fib_stealSide_taskOut_22_signals"),
    fib_stealSide_taskOut_23_signals_("fib_stealSide_taskOut_23_signals"),
    fib_stealSide_taskOut_24_signals_("fib_stealSide_taskOut_24_signals"),
    fib_stealSide_taskOut_25_signals_("fib_stealSide_taskOut_25_signals"),
    fib_stealSide_taskOut_26_signals_("fib_stealSide_taskOut_26_signals"),
    fib_stealSide_taskOut_27_signals_("fib_stealSide_taskOut_27_signals"),
    fib_stealSide_taskOut_28_signals_("fib_stealSide_taskOut_28_signals"),
    fib_stealSide_taskOut_29_signals_("fib_stealSide_taskOut_29_signals"),
    fib_stealSide_taskOut_30_signals_("fib_stealSide_taskOut_30_signals"),
    fib_stealSide_taskOut_31_signals_("fib_stealSide_taskOut_31_signals"),
    fib_stealSide_taskIn_0_signals_("fib_stealSide_taskIn_0_signals"),
    fib_stealSide_taskIn_1_signals_("fib_stealSide_taskIn_1_signals"),
    fib_stealSide_taskIn_2_signals_("fib_stealSide_taskIn_2_signals"),
    fib_stealSide_taskIn_3_signals_("fib_stealSide_taskIn_3_signals"),
    fib_stealSide_taskIn_4_signals_("fib_stealSide_taskIn_4_signals"),
    fib_stealSide_taskIn_5_signals_("fib_stealSide_taskIn_5_signals"),
    fib_stealSide_taskIn_6_signals_("fib_stealSide_taskIn_6_signals"),
    fib_stealSide_taskIn_7_signals_("fib_stealSide_taskIn_7_signals"),
    fib_stealSide_taskIn_8_signals_("fib_stealSide_taskIn_8_signals"),
    fib_stealSide_taskIn_9_signals_("fib_stealSide_taskIn_9_signals"),
    fib_stealSide_taskIn_10_signals_("fib_stealSide_taskIn_10_signals"),
    fib_stealSide_taskIn_11_signals_("fib_stealSide_taskIn_11_signals"),
    fib_stealSide_taskIn_12_signals_("fib_stealSide_taskIn_12_signals"),
    fib_stealSide_taskIn_13_signals_("fib_stealSide_taskIn_13_signals"),
    fib_stealSide_taskIn_14_signals_("fib_stealSide_taskIn_14_signals"),
    fib_stealSide_taskIn_15_signals_("fib_stealSide_taskIn_15_signals"),
    fib_stealSide_taskIn_16_signals_("fib_stealSide_taskIn_16_signals"),
    fib_stealSide_taskIn_17_signals_("fib_stealSide_taskIn_17_signals"),
    fib_stealSide_taskIn_18_signals_("fib_stealSide_taskIn_18_signals"),
    fib_stealSide_taskIn_19_signals_("fib_stealSide_taskIn_19_signals"),
    fib_stealSide_taskIn_20_signals_("fib_stealSide_taskIn_20_signals"),
    fib_stealSide_taskIn_21_signals_("fib_stealSide_taskIn_21_signals"),
    fib_stealSide_taskIn_22_signals_("fib_stealSide_taskIn_22_signals"),
    fib_stealSide_taskIn_23_signals_("fib_stealSide_taskIn_23_signals"),
    fib_stealSide_taskIn_24_signals_("fib_stealSide_taskIn_24_signals"),
    fib_stealSide_taskIn_25_signals_("fib_stealSide_taskIn_25_signals"),
    fib_stealSide_taskIn_26_signals_("fib_stealSide_taskIn_26_signals"),
    fib_stealSide_taskIn_27_signals_("fib_stealSide_taskIn_27_signals"),
    fib_stealSide_taskIn_28_signals_("fib_stealSide_taskIn_28_signals"),
    fib_stealSide_taskIn_29_signals_("fib_stealSide_taskIn_29_signals"),
    fib_stealSide_taskIn_30_signals_("fib_stealSide_taskIn_30_signals"),
    fib_stealSide_taskIn_31_signals_("fib_stealSide_taskIn_31_signals"),
    sum_stealSide_taskOut_0_signals_("sum_stealSide_taskOut_0_signals"),
    sum_stealSide_taskOut_1_signals_("sum_stealSide_taskOut_1_signals"),
    sum_stealSide_taskOut_2_signals_("sum_stealSide_taskOut_2_signals"),
    sum_stealSide_taskOut_3_signals_("sum_stealSide_taskOut_3_signals"),
    sum_stealSide_taskOut_4_signals_("sum_stealSide_taskOut_4_signals"),
    sum_stealSide_taskOut_5_signals_("sum_stealSide_taskOut_5_signals"),
    sum_stealSide_taskOut_6_signals_("sum_stealSide_taskOut_6_signals"),
    sum_stealSide_taskOut_7_signals_("sum_stealSide_taskOut_7_signals"),
    sum_stealSide_taskOut_8_signals_("sum_stealSide_taskOut_8_signals"),
    sum_stealSide_taskOut_9_signals_("sum_stealSide_taskOut_9_signals"),
    sum_stealSide_taskOut_10_signals_("sum_stealSide_taskOut_10_signals"),
    sum_stealSide_taskOut_11_signals_("sum_stealSide_taskOut_11_signals"),
    sum_stealSide_taskOut_12_signals_("sum_stealSide_taskOut_12_signals"),
    sum_stealSide_taskOut_13_signals_("sum_stealSide_taskOut_13_signals"),
    sum_stealSide_taskOut_14_signals_("sum_stealSide_taskOut_14_signals"),
    sum_stealSide_taskOut_15_signals_("sum_stealSide_taskOut_15_signals"),
    sum_stealSide_taskOut_16_signals_("sum_stealSide_taskOut_16_signals"),
    sum_stealSide_taskOut_17_signals_("sum_stealSide_taskOut_17_signals"),
    sum_stealSide_taskOut_18_signals_("sum_stealSide_taskOut_18_signals"),
    sum_stealSide_taskOut_19_signals_("sum_stealSide_taskOut_19_signals"),
    sum_stealSide_taskOut_20_signals_("sum_stealSide_taskOut_20_signals"),
    sum_stealSide_taskOut_21_signals_("sum_stealSide_taskOut_21_signals"),
    sum_stealSide_taskOut_22_signals_("sum_stealSide_taskOut_22_signals"),
    sum_stealSide_taskOut_23_signals_("sum_stealSide_taskOut_23_signals"),
    sum_stealSide_taskOut_24_signals_("sum_stealSide_taskOut_24_signals"),
    sum_stealSide_taskOut_25_signals_("sum_stealSide_taskOut_25_signals"),
    sum_stealSide_taskOut_26_signals_("sum_stealSide_taskOut_26_signals"),
    sum_stealSide_taskOut_27_signals_("sum_stealSide_taskOut_27_signals"),
    sum_stealSide_taskOut_28_signals_("sum_stealSide_taskOut_28_signals"),
    sum_stealSide_taskOut_29_signals_("sum_stealSide_taskOut_29_signals"),
    sum_stealSide_taskOut_30_signals_("sum_stealSide_taskOut_30_signals"),
    sum_stealSide_taskOut_31_signals_("sum_stealSide_taskOut_31_signals"),
    sum_syncSide_addrIn_0_signals_("sum_syncSide_addrIn_0_signals"),
    sum_syncSide_addrIn_1_signals_("sum_syncSide_addrIn_1_signals"),
    sum_syncSide_addrIn_2_signals_("sum_syncSide_addrIn_2_signals"),
    sum_syncSide_addrIn_3_signals_("sum_syncSide_addrIn_3_signals"),
    sum_syncSide_addrIn_4_signals_("sum_syncSide_addrIn_4_signals"),
    sum_syncSide_addrIn_5_signals_("sum_syncSide_addrIn_5_signals"),
    sum_syncSide_addrIn_6_signals_("sum_syncSide_addrIn_6_signals"),
    sum_syncSide_addrIn_7_signals_("sum_syncSide_addrIn_7_signals"),
    sum_syncSide_addrIn_8_signals_("sum_syncSide_addrIn_8_signals"),
    sum_syncSide_addrIn_9_signals_("sum_syncSide_addrIn_9_signals"),
    sum_syncSide_addrIn_10_signals_("sum_syncSide_addrIn_10_signals"),
    sum_syncSide_addrIn_11_signals_("sum_syncSide_addrIn_11_signals"),
    sum_syncSide_addrIn_12_signals_("sum_syncSide_addrIn_12_signals"),
    sum_syncSide_addrIn_13_signals_("sum_syncSide_addrIn_13_signals"),
    sum_syncSide_addrIn_14_signals_("sum_syncSide_addrIn_14_signals"),
    sum_syncSide_addrIn_15_signals_("sum_syncSide_addrIn_15_signals"),
    sum_syncSide_addrIn_16_signals_("sum_syncSide_addrIn_16_signals"),
    sum_syncSide_addrIn_17_signals_("sum_syncSide_addrIn_17_signals"),
    sum_syncSide_addrIn_18_signals_("sum_syncSide_addrIn_18_signals"),
    sum_syncSide_addrIn_19_signals_("sum_syncSide_addrIn_19_signals"),
    sum_syncSide_addrIn_20_signals_("sum_syncSide_addrIn_20_signals"),
    sum_syncSide_addrIn_21_signals_("sum_syncSide_addrIn_21_signals"),
    sum_syncSide_addrIn_22_signals_("sum_syncSide_addrIn_22_signals"),
    sum_syncSide_addrIn_23_signals_("sum_syncSide_addrIn_23_signals"),
    sum_syncSide_addrIn_24_signals_("sum_syncSide_addrIn_24_signals"),
    sum_syncSide_addrIn_25_signals_("sum_syncSide_addrIn_25_signals"),
    sum_syncSide_addrIn_26_signals_("sum_syncSide_addrIn_26_signals"),
    sum_syncSide_addrIn_27_signals_("sum_syncSide_addrIn_27_signals"),
    sum_syncSide_addrIn_28_signals_("sum_syncSide_addrIn_28_signals"),
    sum_syncSide_addrIn_29_signals_("sum_syncSide_addrIn_29_signals"),
    sum_syncSide_addrIn_30_signals_("sum_syncSide_addrIn_30_signals"),
    sum_syncSide_addrIn_31_signals_("sum_syncSide_addrIn_31_signals"),
    sum_continuationAllocationSide_contOut_0_signals_("sum_continuationAllocationSide_contOut_0_signals"),
    sum_continuationAllocationSide_contOut_1_signals_("sum_continuationAllocationSide_contOut_1_signals"),
    sum_continuationAllocationSide_contOut_2_signals_("sum_continuationAllocationSide_contOut_2_signals"),
    sum_continuationAllocationSide_contOut_3_signals_("sum_continuationAllocationSide_contOut_3_signals"),
    sum_continuationAllocationSide_contOut_4_signals_("sum_continuationAllocationSide_contOut_4_signals"),
    sum_continuationAllocationSide_contOut_5_signals_("sum_continuationAllocationSide_contOut_5_signals"),
    sum_continuationAllocationSide_contOut_6_signals_("sum_continuationAllocationSide_contOut_6_signals"),
    sum_continuationAllocationSide_contOut_7_signals_("sum_continuationAllocationSide_contOut_7_signals"),
    sum_continuationAllocationSide_contOut_8_signals_("sum_continuationAllocationSide_contOut_8_signals"),
    sum_continuationAllocationSide_contOut_9_signals_("sum_continuationAllocationSide_contOut_9_signals"),
    sum_continuationAllocationSide_contOut_10_signals_("sum_continuationAllocationSide_contOut_10_signals"),
    sum_continuationAllocationSide_contOut_11_signals_("sum_continuationAllocationSide_contOut_11_signals"),
    sum_continuationAllocationSide_contOut_12_signals_("sum_continuationAllocationSide_contOut_12_signals"),
    sum_continuationAllocationSide_contOut_13_signals_("sum_continuationAllocationSide_contOut_13_signals"),
    sum_continuationAllocationSide_contOut_14_signals_("sum_continuationAllocationSide_contOut_14_signals"),
    sum_continuationAllocationSide_contOut_15_signals_("sum_continuationAllocationSide_contOut_15_signals"),
    sum_continuationAllocationSide_contOut_16_signals_("sum_continuationAllocationSide_contOut_16_signals"),
    sum_continuationAllocationSide_contOut_17_signals_("sum_continuationAllocationSide_contOut_17_signals"),
    sum_continuationAllocationSide_contOut_18_signals_("sum_continuationAllocationSide_contOut_18_signals"),
    sum_continuationAllocationSide_contOut_19_signals_("sum_continuationAllocationSide_contOut_19_signals"),
    sum_continuationAllocationSide_contOut_20_signals_("sum_continuationAllocationSide_contOut_20_signals"),
    sum_continuationAllocationSide_contOut_21_signals_("sum_continuationAllocationSide_contOut_21_signals"),
    sum_continuationAllocationSide_contOut_22_signals_("sum_continuationAllocationSide_contOut_22_signals"),
    sum_continuationAllocationSide_contOut_23_signals_("sum_continuationAllocationSide_contOut_23_signals"),
    sum_continuationAllocationSide_contOut_24_signals_("sum_continuationAllocationSide_contOut_24_signals"),
    sum_continuationAllocationSide_contOut_25_signals_("sum_continuationAllocationSide_contOut_25_signals"),
    sum_continuationAllocationSide_contOut_26_signals_("sum_continuationAllocationSide_contOut_26_signals"),
    sum_continuationAllocationSide_contOut_27_signals_("sum_continuationAllocationSide_contOut_27_signals"),
    sum_continuationAllocationSide_contOut_28_signals_("sum_continuationAllocationSide_contOut_28_signals"),
    sum_continuationAllocationSide_contOut_29_signals_("sum_continuationAllocationSide_contOut_29_signals"),
    sum_continuationAllocationSide_contOut_30_signals_("sum_continuationAllocationSide_contOut_30_signals"),
    sum_continuationAllocationSide_contOut_31_signals_("sum_continuationAllocationSide_contOut_31_signals"),
    sum_syncSide_addrIn_32_signals_("sum_syncSide_addrIn_32_signals"),
    sum_syncSide_addrIn_33_signals_("sum_syncSide_addrIn_33_signals"),
    sum_syncSide_addrIn_34_signals_("sum_syncSide_addrIn_34_signals"),
    sum_syncSide_addrIn_35_signals_("sum_syncSide_addrIn_35_signals"),
    sum_syncSide_addrIn_36_signals_("sum_syncSide_addrIn_36_signals"),
    sum_syncSide_addrIn_37_signals_("sum_syncSide_addrIn_37_signals"),
    sum_syncSide_addrIn_38_signals_("sum_syncSide_addrIn_38_signals"),
    sum_syncSide_addrIn_39_signals_("sum_syncSide_addrIn_39_signals"),
    sum_syncSide_addrIn_40_signals_("sum_syncSide_addrIn_40_signals"),
    sum_syncSide_addrIn_41_signals_("sum_syncSide_addrIn_41_signals"),
    sum_syncSide_addrIn_42_signals_("sum_syncSide_addrIn_42_signals"),
    sum_syncSide_addrIn_43_signals_("sum_syncSide_addrIn_43_signals"),
    sum_syncSide_addrIn_44_signals_("sum_syncSide_addrIn_44_signals"),
    sum_syncSide_addrIn_45_signals_("sum_syncSide_addrIn_45_signals"),
    sum_syncSide_addrIn_46_signals_("sum_syncSide_addrIn_46_signals"),
    sum_syncSide_addrIn_47_signals_("sum_syncSide_addrIn_47_signals"),
    sum_syncSide_addrIn_48_signals_("sum_syncSide_addrIn_48_signals"),
    sum_syncSide_addrIn_49_signals_("sum_syncSide_addrIn_49_signals"),
    sum_syncSide_addrIn_50_signals_("sum_syncSide_addrIn_50_signals"),
    sum_syncSide_addrIn_51_signals_("sum_syncSide_addrIn_51_signals"),
    sum_syncSide_addrIn_52_signals_("sum_syncSide_addrIn_52_signals"),
    sum_syncSide_addrIn_53_signals_("sum_syncSide_addrIn_53_signals"),
    sum_syncSide_addrIn_54_signals_("sum_syncSide_addrIn_54_signals"),
    sum_syncSide_addrIn_55_signals_("sum_syncSide_addrIn_55_signals"),
    sum_syncSide_addrIn_56_signals_("sum_syncSide_addrIn_56_signals"),
    sum_syncSide_addrIn_57_signals_("sum_syncSide_addrIn_57_signals"),
    sum_syncSide_addrIn_58_signals_("sum_syncSide_addrIn_58_signals"),
    sum_syncSide_addrIn_59_signals_("sum_syncSide_addrIn_59_signals"),
    sum_syncSide_addrIn_60_signals_("sum_syncSide_addrIn_60_signals"),
    sum_syncSide_addrIn_61_signals_("sum_syncSide_addrIn_61_signals"),
    sum_syncSide_addrIn_62_signals_("sum_syncSide_addrIn_62_signals"),
    sum_syncSide_addrIn_63_signals_("sum_syncSide_addrIn_63_signals"),
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
    fib_stealSide_taskOut_5_bridge_("fib_stealSide_taskOut_5_bridge"),
    fib_stealSide_taskOut_6_bridge_("fib_stealSide_taskOut_6_bridge"),
    fib_stealSide_taskOut_7_bridge_("fib_stealSide_taskOut_7_bridge"),
    fib_stealSide_taskOut_8_bridge_("fib_stealSide_taskOut_8_bridge"),
    fib_stealSide_taskOut_9_bridge_("fib_stealSide_taskOut_9_bridge"),
    fib_stealSide_taskOut_10_bridge_("fib_stealSide_taskOut_10_bridge"),
    fib_stealSide_taskOut_11_bridge_("fib_stealSide_taskOut_11_bridge"),
    fib_stealSide_taskOut_12_bridge_("fib_stealSide_taskOut_12_bridge"),
    fib_stealSide_taskOut_13_bridge_("fib_stealSide_taskOut_13_bridge"),
    fib_stealSide_taskOut_14_bridge_("fib_stealSide_taskOut_14_bridge"),
    fib_stealSide_taskOut_15_bridge_("fib_stealSide_taskOut_15_bridge"),
    fib_stealSide_taskOut_16_bridge_("fib_stealSide_taskOut_16_bridge"),
    fib_stealSide_taskOut_17_bridge_("fib_stealSide_taskOut_17_bridge"),
    fib_stealSide_taskOut_18_bridge_("fib_stealSide_taskOut_18_bridge"),
    fib_stealSide_taskOut_19_bridge_("fib_stealSide_taskOut_19_bridge"),
    fib_stealSide_taskOut_20_bridge_("fib_stealSide_taskOut_20_bridge"),
    fib_stealSide_taskOut_21_bridge_("fib_stealSide_taskOut_21_bridge"),
    fib_stealSide_taskOut_22_bridge_("fib_stealSide_taskOut_22_bridge"),
    fib_stealSide_taskOut_23_bridge_("fib_stealSide_taskOut_23_bridge"),
    fib_stealSide_taskOut_24_bridge_("fib_stealSide_taskOut_24_bridge"),
    fib_stealSide_taskOut_25_bridge_("fib_stealSide_taskOut_25_bridge"),
    fib_stealSide_taskOut_26_bridge_("fib_stealSide_taskOut_26_bridge"),
    fib_stealSide_taskOut_27_bridge_("fib_stealSide_taskOut_27_bridge"),
    fib_stealSide_taskOut_28_bridge_("fib_stealSide_taskOut_28_bridge"),
    fib_stealSide_taskOut_29_bridge_("fib_stealSide_taskOut_29_bridge"),
    fib_stealSide_taskOut_30_bridge_("fib_stealSide_taskOut_30_bridge"),
    fib_stealSide_taskOut_31_bridge_("fib_stealSide_taskOut_31_bridge"),
    fib_stealSide_taskIn_0_bridge_("fib_stealSide_taskIn_0_bridge"),
    fib_stealSide_taskIn_1_bridge_("fib_stealSide_taskIn_1_bridge"),
    fib_stealSide_taskIn_2_bridge_("fib_stealSide_taskIn_2_bridge"),
    fib_stealSide_taskIn_3_bridge_("fib_stealSide_taskIn_3_bridge"),
    fib_stealSide_taskIn_4_bridge_("fib_stealSide_taskIn_4_bridge"),
    fib_stealSide_taskIn_5_bridge_("fib_stealSide_taskIn_5_bridge"),
    fib_stealSide_taskIn_6_bridge_("fib_stealSide_taskIn_6_bridge"),
    fib_stealSide_taskIn_7_bridge_("fib_stealSide_taskIn_7_bridge"),
    fib_stealSide_taskIn_8_bridge_("fib_stealSide_taskIn_8_bridge"),
    fib_stealSide_taskIn_9_bridge_("fib_stealSide_taskIn_9_bridge"),
    fib_stealSide_taskIn_10_bridge_("fib_stealSide_taskIn_10_bridge"),
    fib_stealSide_taskIn_11_bridge_("fib_stealSide_taskIn_11_bridge"),
    fib_stealSide_taskIn_12_bridge_("fib_stealSide_taskIn_12_bridge"),
    fib_stealSide_taskIn_13_bridge_("fib_stealSide_taskIn_13_bridge"),
    fib_stealSide_taskIn_14_bridge_("fib_stealSide_taskIn_14_bridge"),
    fib_stealSide_taskIn_15_bridge_("fib_stealSide_taskIn_15_bridge"),
    fib_stealSide_taskIn_16_bridge_("fib_stealSide_taskIn_16_bridge"),
    fib_stealSide_taskIn_17_bridge_("fib_stealSide_taskIn_17_bridge"),
    fib_stealSide_taskIn_18_bridge_("fib_stealSide_taskIn_18_bridge"),
    fib_stealSide_taskIn_19_bridge_("fib_stealSide_taskIn_19_bridge"),
    fib_stealSide_taskIn_20_bridge_("fib_stealSide_taskIn_20_bridge"),
    fib_stealSide_taskIn_21_bridge_("fib_stealSide_taskIn_21_bridge"),
    fib_stealSide_taskIn_22_bridge_("fib_stealSide_taskIn_22_bridge"),
    fib_stealSide_taskIn_23_bridge_("fib_stealSide_taskIn_23_bridge"),
    fib_stealSide_taskIn_24_bridge_("fib_stealSide_taskIn_24_bridge"),
    fib_stealSide_taskIn_25_bridge_("fib_stealSide_taskIn_25_bridge"),
    fib_stealSide_taskIn_26_bridge_("fib_stealSide_taskIn_26_bridge"),
    fib_stealSide_taskIn_27_bridge_("fib_stealSide_taskIn_27_bridge"),
    fib_stealSide_taskIn_28_bridge_("fib_stealSide_taskIn_28_bridge"),
    fib_stealSide_taskIn_29_bridge_("fib_stealSide_taskIn_29_bridge"),
    fib_stealSide_taskIn_30_bridge_("fib_stealSide_taskIn_30_bridge"),
    fib_stealSide_taskIn_31_bridge_("fib_stealSide_taskIn_31_bridge"),
    sum_stealSide_taskOut_0_bridge_("sum_stealSide_taskOut_0_bridge"),
    sum_stealSide_taskOut_1_bridge_("sum_stealSide_taskOut_1_bridge"),
    sum_stealSide_taskOut_2_bridge_("sum_stealSide_taskOut_2_bridge"),
    sum_stealSide_taskOut_3_bridge_("sum_stealSide_taskOut_3_bridge"),
    sum_stealSide_taskOut_4_bridge_("sum_stealSide_taskOut_4_bridge"),
    sum_stealSide_taskOut_5_bridge_("sum_stealSide_taskOut_5_bridge"),
    sum_stealSide_taskOut_6_bridge_("sum_stealSide_taskOut_6_bridge"),
    sum_stealSide_taskOut_7_bridge_("sum_stealSide_taskOut_7_bridge"),
    sum_stealSide_taskOut_8_bridge_("sum_stealSide_taskOut_8_bridge"),
    sum_stealSide_taskOut_9_bridge_("sum_stealSide_taskOut_9_bridge"),
    sum_stealSide_taskOut_10_bridge_("sum_stealSide_taskOut_10_bridge"),
    sum_stealSide_taskOut_11_bridge_("sum_stealSide_taskOut_11_bridge"),
    sum_stealSide_taskOut_12_bridge_("sum_stealSide_taskOut_12_bridge"),
    sum_stealSide_taskOut_13_bridge_("sum_stealSide_taskOut_13_bridge"),
    sum_stealSide_taskOut_14_bridge_("sum_stealSide_taskOut_14_bridge"),
    sum_stealSide_taskOut_15_bridge_("sum_stealSide_taskOut_15_bridge"),
    sum_stealSide_taskOut_16_bridge_("sum_stealSide_taskOut_16_bridge"),
    sum_stealSide_taskOut_17_bridge_("sum_stealSide_taskOut_17_bridge"),
    sum_stealSide_taskOut_18_bridge_("sum_stealSide_taskOut_18_bridge"),
    sum_stealSide_taskOut_19_bridge_("sum_stealSide_taskOut_19_bridge"),
    sum_stealSide_taskOut_20_bridge_("sum_stealSide_taskOut_20_bridge"),
    sum_stealSide_taskOut_21_bridge_("sum_stealSide_taskOut_21_bridge"),
    sum_stealSide_taskOut_22_bridge_("sum_stealSide_taskOut_22_bridge"),
    sum_stealSide_taskOut_23_bridge_("sum_stealSide_taskOut_23_bridge"),
    sum_stealSide_taskOut_24_bridge_("sum_stealSide_taskOut_24_bridge"),
    sum_stealSide_taskOut_25_bridge_("sum_stealSide_taskOut_25_bridge"),
    sum_stealSide_taskOut_26_bridge_("sum_stealSide_taskOut_26_bridge"),
    sum_stealSide_taskOut_27_bridge_("sum_stealSide_taskOut_27_bridge"),
    sum_stealSide_taskOut_28_bridge_("sum_stealSide_taskOut_28_bridge"),
    sum_stealSide_taskOut_29_bridge_("sum_stealSide_taskOut_29_bridge"),
    sum_stealSide_taskOut_30_bridge_("sum_stealSide_taskOut_30_bridge"),
    sum_stealSide_taskOut_31_bridge_("sum_stealSide_taskOut_31_bridge"),
    sum_syncSide_addrIn_0_bridge_("sum_syncSide_addrIn_0_bridge"),
    sum_syncSide_addrIn_1_bridge_("sum_syncSide_addrIn_1_bridge"),
    sum_syncSide_addrIn_2_bridge_("sum_syncSide_addrIn_2_bridge"),
    sum_syncSide_addrIn_3_bridge_("sum_syncSide_addrIn_3_bridge"),
    sum_syncSide_addrIn_4_bridge_("sum_syncSide_addrIn_4_bridge"),
    sum_syncSide_addrIn_5_bridge_("sum_syncSide_addrIn_5_bridge"),
    sum_syncSide_addrIn_6_bridge_("sum_syncSide_addrIn_6_bridge"),
    sum_syncSide_addrIn_7_bridge_("sum_syncSide_addrIn_7_bridge"),
    sum_syncSide_addrIn_8_bridge_("sum_syncSide_addrIn_8_bridge"),
    sum_syncSide_addrIn_9_bridge_("sum_syncSide_addrIn_9_bridge"),
    sum_syncSide_addrIn_10_bridge_("sum_syncSide_addrIn_10_bridge"),
    sum_syncSide_addrIn_11_bridge_("sum_syncSide_addrIn_11_bridge"),
    sum_syncSide_addrIn_12_bridge_("sum_syncSide_addrIn_12_bridge"),
    sum_syncSide_addrIn_13_bridge_("sum_syncSide_addrIn_13_bridge"),
    sum_syncSide_addrIn_14_bridge_("sum_syncSide_addrIn_14_bridge"),
    sum_syncSide_addrIn_15_bridge_("sum_syncSide_addrIn_15_bridge"),
    sum_syncSide_addrIn_16_bridge_("sum_syncSide_addrIn_16_bridge"),
    sum_syncSide_addrIn_17_bridge_("sum_syncSide_addrIn_17_bridge"),
    sum_syncSide_addrIn_18_bridge_("sum_syncSide_addrIn_18_bridge"),
    sum_syncSide_addrIn_19_bridge_("sum_syncSide_addrIn_19_bridge"),
    sum_syncSide_addrIn_20_bridge_("sum_syncSide_addrIn_20_bridge"),
    sum_syncSide_addrIn_21_bridge_("sum_syncSide_addrIn_21_bridge"),
    sum_syncSide_addrIn_22_bridge_("sum_syncSide_addrIn_22_bridge"),
    sum_syncSide_addrIn_23_bridge_("sum_syncSide_addrIn_23_bridge"),
    sum_syncSide_addrIn_24_bridge_("sum_syncSide_addrIn_24_bridge"),
    sum_syncSide_addrIn_25_bridge_("sum_syncSide_addrIn_25_bridge"),
    sum_syncSide_addrIn_26_bridge_("sum_syncSide_addrIn_26_bridge"),
    sum_syncSide_addrIn_27_bridge_("sum_syncSide_addrIn_27_bridge"),
    sum_syncSide_addrIn_28_bridge_("sum_syncSide_addrIn_28_bridge"),
    sum_syncSide_addrIn_29_bridge_("sum_syncSide_addrIn_29_bridge"),
    sum_syncSide_addrIn_30_bridge_("sum_syncSide_addrIn_30_bridge"),
    sum_syncSide_addrIn_31_bridge_("sum_syncSide_addrIn_31_bridge"),
    sum_continuationAllocationSide_contOut_0_bridge_("sum_continuationAllocationSide_contOut_0_bridge"),
    sum_continuationAllocationSide_contOut_1_bridge_("sum_continuationAllocationSide_contOut_1_bridge"),
    sum_continuationAllocationSide_contOut_2_bridge_("sum_continuationAllocationSide_contOut_2_bridge"),
    sum_continuationAllocationSide_contOut_3_bridge_("sum_continuationAllocationSide_contOut_3_bridge"),
    sum_continuationAllocationSide_contOut_4_bridge_("sum_continuationAllocationSide_contOut_4_bridge"),
    sum_continuationAllocationSide_contOut_5_bridge_("sum_continuationAllocationSide_contOut_5_bridge"),
    sum_continuationAllocationSide_contOut_6_bridge_("sum_continuationAllocationSide_contOut_6_bridge"),
    sum_continuationAllocationSide_contOut_7_bridge_("sum_continuationAllocationSide_contOut_7_bridge"),
    sum_continuationAllocationSide_contOut_8_bridge_("sum_continuationAllocationSide_contOut_8_bridge"),
    sum_continuationAllocationSide_contOut_9_bridge_("sum_continuationAllocationSide_contOut_9_bridge"),
    sum_continuationAllocationSide_contOut_10_bridge_("sum_continuationAllocationSide_contOut_10_bridge"),
    sum_continuationAllocationSide_contOut_11_bridge_("sum_continuationAllocationSide_contOut_11_bridge"),
    sum_continuationAllocationSide_contOut_12_bridge_("sum_continuationAllocationSide_contOut_12_bridge"),
    sum_continuationAllocationSide_contOut_13_bridge_("sum_continuationAllocationSide_contOut_13_bridge"),
    sum_continuationAllocationSide_contOut_14_bridge_("sum_continuationAllocationSide_contOut_14_bridge"),
    sum_continuationAllocationSide_contOut_15_bridge_("sum_continuationAllocationSide_contOut_15_bridge"),
    sum_continuationAllocationSide_contOut_16_bridge_("sum_continuationAllocationSide_contOut_16_bridge"),
    sum_continuationAllocationSide_contOut_17_bridge_("sum_continuationAllocationSide_contOut_17_bridge"),
    sum_continuationAllocationSide_contOut_18_bridge_("sum_continuationAllocationSide_contOut_18_bridge"),
    sum_continuationAllocationSide_contOut_19_bridge_("sum_continuationAllocationSide_contOut_19_bridge"),
    sum_continuationAllocationSide_contOut_20_bridge_("sum_continuationAllocationSide_contOut_20_bridge"),
    sum_continuationAllocationSide_contOut_21_bridge_("sum_continuationAllocationSide_contOut_21_bridge"),
    sum_continuationAllocationSide_contOut_22_bridge_("sum_continuationAllocationSide_contOut_22_bridge"),
    sum_continuationAllocationSide_contOut_23_bridge_("sum_continuationAllocationSide_contOut_23_bridge"),
    sum_continuationAllocationSide_contOut_24_bridge_("sum_continuationAllocationSide_contOut_24_bridge"),
    sum_continuationAllocationSide_contOut_25_bridge_("sum_continuationAllocationSide_contOut_25_bridge"),
    sum_continuationAllocationSide_contOut_26_bridge_("sum_continuationAllocationSide_contOut_26_bridge"),
    sum_continuationAllocationSide_contOut_27_bridge_("sum_continuationAllocationSide_contOut_27_bridge"),
    sum_continuationAllocationSide_contOut_28_bridge_("sum_continuationAllocationSide_contOut_28_bridge"),
    sum_continuationAllocationSide_contOut_29_bridge_("sum_continuationAllocationSide_contOut_29_bridge"),
    sum_continuationAllocationSide_contOut_30_bridge_("sum_continuationAllocationSide_contOut_30_bridge"),
    sum_continuationAllocationSide_contOut_31_bridge_("sum_continuationAllocationSide_contOut_31_bridge"),
    sum_syncSide_addrIn_32_bridge_("sum_syncSide_addrIn_32_bridge"),
    sum_syncSide_addrIn_33_bridge_("sum_syncSide_addrIn_33_bridge"),
    sum_syncSide_addrIn_34_bridge_("sum_syncSide_addrIn_34_bridge"),
    sum_syncSide_addrIn_35_bridge_("sum_syncSide_addrIn_35_bridge"),
    sum_syncSide_addrIn_36_bridge_("sum_syncSide_addrIn_36_bridge"),
    sum_syncSide_addrIn_37_bridge_("sum_syncSide_addrIn_37_bridge"),
    sum_syncSide_addrIn_38_bridge_("sum_syncSide_addrIn_38_bridge"),
    sum_syncSide_addrIn_39_bridge_("sum_syncSide_addrIn_39_bridge"),
    sum_syncSide_addrIn_40_bridge_("sum_syncSide_addrIn_40_bridge"),
    sum_syncSide_addrIn_41_bridge_("sum_syncSide_addrIn_41_bridge"),
    sum_syncSide_addrIn_42_bridge_("sum_syncSide_addrIn_42_bridge"),
    sum_syncSide_addrIn_43_bridge_("sum_syncSide_addrIn_43_bridge"),
    sum_syncSide_addrIn_44_bridge_("sum_syncSide_addrIn_44_bridge"),
    sum_syncSide_addrIn_45_bridge_("sum_syncSide_addrIn_45_bridge"),
    sum_syncSide_addrIn_46_bridge_("sum_syncSide_addrIn_46_bridge"),
    sum_syncSide_addrIn_47_bridge_("sum_syncSide_addrIn_47_bridge"),
    sum_syncSide_addrIn_48_bridge_("sum_syncSide_addrIn_48_bridge"),
    sum_syncSide_addrIn_49_bridge_("sum_syncSide_addrIn_49_bridge"),
    sum_syncSide_addrIn_50_bridge_("sum_syncSide_addrIn_50_bridge"),
    sum_syncSide_addrIn_51_bridge_("sum_syncSide_addrIn_51_bridge"),
    sum_syncSide_addrIn_52_bridge_("sum_syncSide_addrIn_52_bridge"),
    sum_syncSide_addrIn_53_bridge_("sum_syncSide_addrIn_53_bridge"),
    sum_syncSide_addrIn_54_bridge_("sum_syncSide_addrIn_54_bridge"),
    sum_syncSide_addrIn_55_bridge_("sum_syncSide_addrIn_55_bridge"),
    sum_syncSide_addrIn_56_bridge_("sum_syncSide_addrIn_56_bridge"),
    sum_syncSide_addrIn_57_bridge_("sum_syncSide_addrIn_57_bridge"),
    sum_syncSide_addrIn_58_bridge_("sum_syncSide_addrIn_58_bridge"),
    sum_syncSide_addrIn_59_bridge_("sum_syncSide_addrIn_59_bridge"),
    sum_syncSide_addrIn_60_bridge_("sum_syncSide_addrIn_60_bridge"),
    sum_syncSide_addrIn_61_bridge_("sum_syncSide_addrIn_61_bridge"),
    sum_syncSide_addrIn_62_bridge_("sum_syncSide_addrIn_62_bridge"),
    sum_syncSide_addrIn_63_bridge_("sum_syncSide_addrIn_63_bridge"),
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
    sockets_["fib_stealSide_taskOut_5"] = &fib_stealSide_taskOut_5_bridge_.socket;
    sockets_["fib_stealSide_taskOut_6"] = &fib_stealSide_taskOut_6_bridge_.socket;
    sockets_["fib_stealSide_taskOut_7"] = &fib_stealSide_taskOut_7_bridge_.socket;
    sockets_["fib_stealSide_taskOut_8"] = &fib_stealSide_taskOut_8_bridge_.socket;
    sockets_["fib_stealSide_taskOut_9"] = &fib_stealSide_taskOut_9_bridge_.socket;
    sockets_["fib_stealSide_taskOut_10"] = &fib_stealSide_taskOut_10_bridge_.socket;
    sockets_["fib_stealSide_taskOut_11"] = &fib_stealSide_taskOut_11_bridge_.socket;
    sockets_["fib_stealSide_taskOut_12"] = &fib_stealSide_taskOut_12_bridge_.socket;
    sockets_["fib_stealSide_taskOut_13"] = &fib_stealSide_taskOut_13_bridge_.socket;
    sockets_["fib_stealSide_taskOut_14"] = &fib_stealSide_taskOut_14_bridge_.socket;
    sockets_["fib_stealSide_taskOut_15"] = &fib_stealSide_taskOut_15_bridge_.socket;
    sockets_["fib_stealSide_taskOut_16"] = &fib_stealSide_taskOut_16_bridge_.socket;
    sockets_["fib_stealSide_taskOut_17"] = &fib_stealSide_taskOut_17_bridge_.socket;
    sockets_["fib_stealSide_taskOut_18"] = &fib_stealSide_taskOut_18_bridge_.socket;
    sockets_["fib_stealSide_taskOut_19"] = &fib_stealSide_taskOut_19_bridge_.socket;
    sockets_["fib_stealSide_taskOut_20"] = &fib_stealSide_taskOut_20_bridge_.socket;
    sockets_["fib_stealSide_taskOut_21"] = &fib_stealSide_taskOut_21_bridge_.socket;
    sockets_["fib_stealSide_taskOut_22"] = &fib_stealSide_taskOut_22_bridge_.socket;
    sockets_["fib_stealSide_taskOut_23"] = &fib_stealSide_taskOut_23_bridge_.socket;
    sockets_["fib_stealSide_taskOut_24"] = &fib_stealSide_taskOut_24_bridge_.socket;
    sockets_["fib_stealSide_taskOut_25"] = &fib_stealSide_taskOut_25_bridge_.socket;
    sockets_["fib_stealSide_taskOut_26"] = &fib_stealSide_taskOut_26_bridge_.socket;
    sockets_["fib_stealSide_taskOut_27"] = &fib_stealSide_taskOut_27_bridge_.socket;
    sockets_["fib_stealSide_taskOut_28"] = &fib_stealSide_taskOut_28_bridge_.socket;
    sockets_["fib_stealSide_taskOut_29"] = &fib_stealSide_taskOut_29_bridge_.socket;
    sockets_["fib_stealSide_taskOut_30"] = &fib_stealSide_taskOut_30_bridge_.socket;
    sockets_["fib_stealSide_taskOut_31"] = &fib_stealSide_taskOut_31_bridge_.socket;
    sockets_["fib_stealSide_taskIn_0"] = &fib_stealSide_taskIn_0_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_1"] = &fib_stealSide_taskIn_1_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_2"] = &fib_stealSide_taskIn_2_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_3"] = &fib_stealSide_taskIn_3_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_4"] = &fib_stealSide_taskIn_4_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_5"] = &fib_stealSide_taskIn_5_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_6"] = &fib_stealSide_taskIn_6_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_7"] = &fib_stealSide_taskIn_7_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_8"] = &fib_stealSide_taskIn_8_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_9"] = &fib_stealSide_taskIn_9_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_10"] = &fib_stealSide_taskIn_10_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_11"] = &fib_stealSide_taskIn_11_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_12"] = &fib_stealSide_taskIn_12_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_13"] = &fib_stealSide_taskIn_13_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_14"] = &fib_stealSide_taskIn_14_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_15"] = &fib_stealSide_taskIn_15_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_16"] = &fib_stealSide_taskIn_16_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_17"] = &fib_stealSide_taskIn_17_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_18"] = &fib_stealSide_taskIn_18_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_19"] = &fib_stealSide_taskIn_19_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_20"] = &fib_stealSide_taskIn_20_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_21"] = &fib_stealSide_taskIn_21_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_22"] = &fib_stealSide_taskIn_22_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_23"] = &fib_stealSide_taskIn_23_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_24"] = &fib_stealSide_taskIn_24_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_25"] = &fib_stealSide_taskIn_25_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_26"] = &fib_stealSide_taskIn_26_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_27"] = &fib_stealSide_taskIn_27_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_28"] = &fib_stealSide_taskIn_28_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_29"] = &fib_stealSide_taskIn_29_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_30"] = &fib_stealSide_taskIn_30_bridge_.tgt_socket;
    sockets_["fib_stealSide_taskIn_31"] = &fib_stealSide_taskIn_31_bridge_.tgt_socket;
    sockets_["sum_stealSide_taskOut_0"] = &sum_stealSide_taskOut_0_bridge_.socket;
    sockets_["sum_stealSide_taskOut_1"] = &sum_stealSide_taskOut_1_bridge_.socket;
    sockets_["sum_stealSide_taskOut_2"] = &sum_stealSide_taskOut_2_bridge_.socket;
    sockets_["sum_stealSide_taskOut_3"] = &sum_stealSide_taskOut_3_bridge_.socket;
    sockets_["sum_stealSide_taskOut_4"] = &sum_stealSide_taskOut_4_bridge_.socket;
    sockets_["sum_stealSide_taskOut_5"] = &sum_stealSide_taskOut_5_bridge_.socket;
    sockets_["sum_stealSide_taskOut_6"] = &sum_stealSide_taskOut_6_bridge_.socket;
    sockets_["sum_stealSide_taskOut_7"] = &sum_stealSide_taskOut_7_bridge_.socket;
    sockets_["sum_stealSide_taskOut_8"] = &sum_stealSide_taskOut_8_bridge_.socket;
    sockets_["sum_stealSide_taskOut_9"] = &sum_stealSide_taskOut_9_bridge_.socket;
    sockets_["sum_stealSide_taskOut_10"] = &sum_stealSide_taskOut_10_bridge_.socket;
    sockets_["sum_stealSide_taskOut_11"] = &sum_stealSide_taskOut_11_bridge_.socket;
    sockets_["sum_stealSide_taskOut_12"] = &sum_stealSide_taskOut_12_bridge_.socket;
    sockets_["sum_stealSide_taskOut_13"] = &sum_stealSide_taskOut_13_bridge_.socket;
    sockets_["sum_stealSide_taskOut_14"] = &sum_stealSide_taskOut_14_bridge_.socket;
    sockets_["sum_stealSide_taskOut_15"] = &sum_stealSide_taskOut_15_bridge_.socket;
    sockets_["sum_stealSide_taskOut_16"] = &sum_stealSide_taskOut_16_bridge_.socket;
    sockets_["sum_stealSide_taskOut_17"] = &sum_stealSide_taskOut_17_bridge_.socket;
    sockets_["sum_stealSide_taskOut_18"] = &sum_stealSide_taskOut_18_bridge_.socket;
    sockets_["sum_stealSide_taskOut_19"] = &sum_stealSide_taskOut_19_bridge_.socket;
    sockets_["sum_stealSide_taskOut_20"] = &sum_stealSide_taskOut_20_bridge_.socket;
    sockets_["sum_stealSide_taskOut_21"] = &sum_stealSide_taskOut_21_bridge_.socket;
    sockets_["sum_stealSide_taskOut_22"] = &sum_stealSide_taskOut_22_bridge_.socket;
    sockets_["sum_stealSide_taskOut_23"] = &sum_stealSide_taskOut_23_bridge_.socket;
    sockets_["sum_stealSide_taskOut_24"] = &sum_stealSide_taskOut_24_bridge_.socket;
    sockets_["sum_stealSide_taskOut_25"] = &sum_stealSide_taskOut_25_bridge_.socket;
    sockets_["sum_stealSide_taskOut_26"] = &sum_stealSide_taskOut_26_bridge_.socket;
    sockets_["sum_stealSide_taskOut_27"] = &sum_stealSide_taskOut_27_bridge_.socket;
    sockets_["sum_stealSide_taskOut_28"] = &sum_stealSide_taskOut_28_bridge_.socket;
    sockets_["sum_stealSide_taskOut_29"] = &sum_stealSide_taskOut_29_bridge_.socket;
    sockets_["sum_stealSide_taskOut_30"] = &sum_stealSide_taskOut_30_bridge_.socket;
    sockets_["sum_stealSide_taskOut_31"] = &sum_stealSide_taskOut_31_bridge_.socket;
    sockets_["sum_syncSide_addrIn_0"] = &sum_syncSide_addrIn_0_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_1"] = &sum_syncSide_addrIn_1_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_2"] = &sum_syncSide_addrIn_2_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_3"] = &sum_syncSide_addrIn_3_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_4"] = &sum_syncSide_addrIn_4_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_5"] = &sum_syncSide_addrIn_5_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_6"] = &sum_syncSide_addrIn_6_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_7"] = &sum_syncSide_addrIn_7_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_8"] = &sum_syncSide_addrIn_8_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_9"] = &sum_syncSide_addrIn_9_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_10"] = &sum_syncSide_addrIn_10_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_11"] = &sum_syncSide_addrIn_11_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_12"] = &sum_syncSide_addrIn_12_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_13"] = &sum_syncSide_addrIn_13_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_14"] = &sum_syncSide_addrIn_14_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_15"] = &sum_syncSide_addrIn_15_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_16"] = &sum_syncSide_addrIn_16_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_17"] = &sum_syncSide_addrIn_17_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_18"] = &sum_syncSide_addrIn_18_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_19"] = &sum_syncSide_addrIn_19_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_20"] = &sum_syncSide_addrIn_20_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_21"] = &sum_syncSide_addrIn_21_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_22"] = &sum_syncSide_addrIn_22_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_23"] = &sum_syncSide_addrIn_23_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_24"] = &sum_syncSide_addrIn_24_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_25"] = &sum_syncSide_addrIn_25_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_26"] = &sum_syncSide_addrIn_26_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_27"] = &sum_syncSide_addrIn_27_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_28"] = &sum_syncSide_addrIn_28_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_29"] = &sum_syncSide_addrIn_29_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_30"] = &sum_syncSide_addrIn_30_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_31"] = &sum_syncSide_addrIn_31_bridge_.tgt_socket;
    sockets_["sum_continuationAllocationSide_contOut_0"] = &sum_continuationAllocationSide_contOut_0_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_1"] = &sum_continuationAllocationSide_contOut_1_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_2"] = &sum_continuationAllocationSide_contOut_2_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_3"] = &sum_continuationAllocationSide_contOut_3_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_4"] = &sum_continuationAllocationSide_contOut_4_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_5"] = &sum_continuationAllocationSide_contOut_5_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_6"] = &sum_continuationAllocationSide_contOut_6_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_7"] = &sum_continuationAllocationSide_contOut_7_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_8"] = &sum_continuationAllocationSide_contOut_8_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_9"] = &sum_continuationAllocationSide_contOut_9_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_10"] = &sum_continuationAllocationSide_contOut_10_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_11"] = &sum_continuationAllocationSide_contOut_11_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_12"] = &sum_continuationAllocationSide_contOut_12_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_13"] = &sum_continuationAllocationSide_contOut_13_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_14"] = &sum_continuationAllocationSide_contOut_14_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_15"] = &sum_continuationAllocationSide_contOut_15_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_16"] = &sum_continuationAllocationSide_contOut_16_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_17"] = &sum_continuationAllocationSide_contOut_17_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_18"] = &sum_continuationAllocationSide_contOut_18_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_19"] = &sum_continuationAllocationSide_contOut_19_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_20"] = &sum_continuationAllocationSide_contOut_20_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_21"] = &sum_continuationAllocationSide_contOut_21_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_22"] = &sum_continuationAllocationSide_contOut_22_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_23"] = &sum_continuationAllocationSide_contOut_23_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_24"] = &sum_continuationAllocationSide_contOut_24_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_25"] = &sum_continuationAllocationSide_contOut_25_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_26"] = &sum_continuationAllocationSide_contOut_26_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_27"] = &sum_continuationAllocationSide_contOut_27_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_28"] = &sum_continuationAllocationSide_contOut_28_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_29"] = &sum_continuationAllocationSide_contOut_29_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_30"] = &sum_continuationAllocationSide_contOut_30_bridge_.socket;
    sockets_["sum_continuationAllocationSide_contOut_31"] = &sum_continuationAllocationSide_contOut_31_bridge_.socket;
    sockets_["sum_syncSide_addrIn_32"] = &sum_syncSide_addrIn_32_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_33"] = &sum_syncSide_addrIn_33_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_34"] = &sum_syncSide_addrIn_34_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_35"] = &sum_syncSide_addrIn_35_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_36"] = &sum_syncSide_addrIn_36_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_37"] = &sum_syncSide_addrIn_37_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_38"] = &sum_syncSide_addrIn_38_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_39"] = &sum_syncSide_addrIn_39_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_40"] = &sum_syncSide_addrIn_40_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_41"] = &sum_syncSide_addrIn_41_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_42"] = &sum_syncSide_addrIn_42_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_43"] = &sum_syncSide_addrIn_43_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_44"] = &sum_syncSide_addrIn_44_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_45"] = &sum_syncSide_addrIn_45_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_46"] = &sum_syncSide_addrIn_46_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_47"] = &sum_syncSide_addrIn_47_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_48"] = &sum_syncSide_addrIn_48_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_49"] = &sum_syncSide_addrIn_49_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_50"] = &sum_syncSide_addrIn_50_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_51"] = &sum_syncSide_addrIn_51_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_52"] = &sum_syncSide_addrIn_52_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_53"] = &sum_syncSide_addrIn_53_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_54"] = &sum_syncSide_addrIn_54_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_55"] = &sum_syncSide_addrIn_55_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_56"] = &sum_syncSide_addrIn_56_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_57"] = &sum_syncSide_addrIn_57_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_58"] = &sum_syncSide_addrIn_58_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_59"] = &sum_syncSide_addrIn_59_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_60"] = &sum_syncSide_addrIn_60_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_61"] = &sum_syncSide_addrIn_61_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_62"] = &sum_syncSide_addrIn_62_bridge_.tgt_socket;
    sockets_["sum_syncSide_addrIn_63"] = &sum_syncSide_addrIn_63_bridge_.tgt_socket;
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


void fibonacci__peCountFib_32__peCountSum_32::reset_n_generate_()
{
    reset_n_.write(!reset.read());
}

void fibonacci__peCountFib_32__peCountSum_32::do_connect_()
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
    
    fib_stealSide_taskOut_5_bridge_.clk(clock);
    fib_stealSide_taskOut_5_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_6_bridge_.clk(clock);
    fib_stealSide_taskOut_6_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_7_bridge_.clk(clock);
    fib_stealSide_taskOut_7_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_8_bridge_.clk(clock);
    fib_stealSide_taskOut_8_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_9_bridge_.clk(clock);
    fib_stealSide_taskOut_9_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_10_bridge_.clk(clock);
    fib_stealSide_taskOut_10_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_11_bridge_.clk(clock);
    fib_stealSide_taskOut_11_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_12_bridge_.clk(clock);
    fib_stealSide_taskOut_12_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_13_bridge_.clk(clock);
    fib_stealSide_taskOut_13_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_14_bridge_.clk(clock);
    fib_stealSide_taskOut_14_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_15_bridge_.clk(clock);
    fib_stealSide_taskOut_15_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_16_bridge_.clk(clock);
    fib_stealSide_taskOut_16_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_17_bridge_.clk(clock);
    fib_stealSide_taskOut_17_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_18_bridge_.clk(clock);
    fib_stealSide_taskOut_18_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_19_bridge_.clk(clock);
    fib_stealSide_taskOut_19_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_20_bridge_.clk(clock);
    fib_stealSide_taskOut_20_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_21_bridge_.clk(clock);
    fib_stealSide_taskOut_21_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_22_bridge_.clk(clock);
    fib_stealSide_taskOut_22_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_23_bridge_.clk(clock);
    fib_stealSide_taskOut_23_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_24_bridge_.clk(clock);
    fib_stealSide_taskOut_24_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_25_bridge_.clk(clock);
    fib_stealSide_taskOut_25_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_26_bridge_.clk(clock);
    fib_stealSide_taskOut_26_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_27_bridge_.clk(clock);
    fib_stealSide_taskOut_27_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_28_bridge_.clk(clock);
    fib_stealSide_taskOut_28_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_29_bridge_.clk(clock);
    fib_stealSide_taskOut_29_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_30_bridge_.clk(clock);
    fib_stealSide_taskOut_30_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskOut_31_bridge_.clk(clock);
    fib_stealSide_taskOut_31_bridge_.resetn(reset_n_);
    
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
    
    fib_stealSide_taskIn_5_bridge_.clk(clock);
    fib_stealSide_taskIn_5_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_6_bridge_.clk(clock);
    fib_stealSide_taskIn_6_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_7_bridge_.clk(clock);
    fib_stealSide_taskIn_7_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_8_bridge_.clk(clock);
    fib_stealSide_taskIn_8_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_9_bridge_.clk(clock);
    fib_stealSide_taskIn_9_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_10_bridge_.clk(clock);
    fib_stealSide_taskIn_10_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_11_bridge_.clk(clock);
    fib_stealSide_taskIn_11_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_12_bridge_.clk(clock);
    fib_stealSide_taskIn_12_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_13_bridge_.clk(clock);
    fib_stealSide_taskIn_13_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_14_bridge_.clk(clock);
    fib_stealSide_taskIn_14_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_15_bridge_.clk(clock);
    fib_stealSide_taskIn_15_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_16_bridge_.clk(clock);
    fib_stealSide_taskIn_16_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_17_bridge_.clk(clock);
    fib_stealSide_taskIn_17_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_18_bridge_.clk(clock);
    fib_stealSide_taskIn_18_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_19_bridge_.clk(clock);
    fib_stealSide_taskIn_19_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_20_bridge_.clk(clock);
    fib_stealSide_taskIn_20_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_21_bridge_.clk(clock);
    fib_stealSide_taskIn_21_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_22_bridge_.clk(clock);
    fib_stealSide_taskIn_22_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_23_bridge_.clk(clock);
    fib_stealSide_taskIn_23_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_24_bridge_.clk(clock);
    fib_stealSide_taskIn_24_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_25_bridge_.clk(clock);
    fib_stealSide_taskIn_25_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_26_bridge_.clk(clock);
    fib_stealSide_taskIn_26_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_27_bridge_.clk(clock);
    fib_stealSide_taskIn_27_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_28_bridge_.clk(clock);
    fib_stealSide_taskIn_28_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_29_bridge_.clk(clock);
    fib_stealSide_taskIn_29_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_30_bridge_.clk(clock);
    fib_stealSide_taskIn_30_bridge_.resetn(reset_n_);
    
    fib_stealSide_taskIn_31_bridge_.clk(clock);
    fib_stealSide_taskIn_31_bridge_.resetn(reset_n_);
    
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
    
    sum_stealSide_taskOut_5_bridge_.clk(clock);
    sum_stealSide_taskOut_5_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_6_bridge_.clk(clock);
    sum_stealSide_taskOut_6_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_7_bridge_.clk(clock);
    sum_stealSide_taskOut_7_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_8_bridge_.clk(clock);
    sum_stealSide_taskOut_8_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_9_bridge_.clk(clock);
    sum_stealSide_taskOut_9_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_10_bridge_.clk(clock);
    sum_stealSide_taskOut_10_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_11_bridge_.clk(clock);
    sum_stealSide_taskOut_11_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_12_bridge_.clk(clock);
    sum_stealSide_taskOut_12_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_13_bridge_.clk(clock);
    sum_stealSide_taskOut_13_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_14_bridge_.clk(clock);
    sum_stealSide_taskOut_14_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_15_bridge_.clk(clock);
    sum_stealSide_taskOut_15_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_16_bridge_.clk(clock);
    sum_stealSide_taskOut_16_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_17_bridge_.clk(clock);
    sum_stealSide_taskOut_17_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_18_bridge_.clk(clock);
    sum_stealSide_taskOut_18_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_19_bridge_.clk(clock);
    sum_stealSide_taskOut_19_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_20_bridge_.clk(clock);
    sum_stealSide_taskOut_20_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_21_bridge_.clk(clock);
    sum_stealSide_taskOut_21_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_22_bridge_.clk(clock);
    sum_stealSide_taskOut_22_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_23_bridge_.clk(clock);
    sum_stealSide_taskOut_23_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_24_bridge_.clk(clock);
    sum_stealSide_taskOut_24_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_25_bridge_.clk(clock);
    sum_stealSide_taskOut_25_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_26_bridge_.clk(clock);
    sum_stealSide_taskOut_26_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_27_bridge_.clk(clock);
    sum_stealSide_taskOut_27_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_28_bridge_.clk(clock);
    sum_stealSide_taskOut_28_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_29_bridge_.clk(clock);
    sum_stealSide_taskOut_29_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_30_bridge_.clk(clock);
    sum_stealSide_taskOut_30_bridge_.resetn(reset_n_);
    
    sum_stealSide_taskOut_31_bridge_.clk(clock);
    sum_stealSide_taskOut_31_bridge_.resetn(reset_n_);
    
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
    
    sum_syncSide_addrIn_10_bridge_.clk(clock);
    sum_syncSide_addrIn_10_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_11_bridge_.clk(clock);
    sum_syncSide_addrIn_11_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_12_bridge_.clk(clock);
    sum_syncSide_addrIn_12_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_13_bridge_.clk(clock);
    sum_syncSide_addrIn_13_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_14_bridge_.clk(clock);
    sum_syncSide_addrIn_14_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_15_bridge_.clk(clock);
    sum_syncSide_addrIn_15_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_16_bridge_.clk(clock);
    sum_syncSide_addrIn_16_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_17_bridge_.clk(clock);
    sum_syncSide_addrIn_17_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_18_bridge_.clk(clock);
    sum_syncSide_addrIn_18_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_19_bridge_.clk(clock);
    sum_syncSide_addrIn_19_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_20_bridge_.clk(clock);
    sum_syncSide_addrIn_20_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_21_bridge_.clk(clock);
    sum_syncSide_addrIn_21_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_22_bridge_.clk(clock);
    sum_syncSide_addrIn_22_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_23_bridge_.clk(clock);
    sum_syncSide_addrIn_23_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_24_bridge_.clk(clock);
    sum_syncSide_addrIn_24_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_25_bridge_.clk(clock);
    sum_syncSide_addrIn_25_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_26_bridge_.clk(clock);
    sum_syncSide_addrIn_26_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_27_bridge_.clk(clock);
    sum_syncSide_addrIn_27_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_28_bridge_.clk(clock);
    sum_syncSide_addrIn_28_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_29_bridge_.clk(clock);
    sum_syncSide_addrIn_29_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_30_bridge_.clk(clock);
    sum_syncSide_addrIn_30_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_31_bridge_.clk(clock);
    sum_syncSide_addrIn_31_bridge_.resetn(reset_n_);
    
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
    
    sum_continuationAllocationSide_contOut_5_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_5_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_6_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_6_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_7_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_7_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_8_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_8_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_9_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_9_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_10_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_10_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_11_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_11_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_12_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_12_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_13_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_13_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_14_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_14_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_15_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_15_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_16_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_16_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_17_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_17_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_18_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_18_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_19_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_19_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_20_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_20_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_21_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_21_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_22_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_22_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_23_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_23_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_24_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_24_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_25_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_25_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_26_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_26_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_27_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_27_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_28_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_28_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_29_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_29_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_30_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_30_bridge_.resetn(reset_n_);
    
    sum_continuationAllocationSide_contOut_31_bridge_.clk(clock);
    sum_continuationAllocationSide_contOut_31_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_32_bridge_.clk(clock);
    sum_syncSide_addrIn_32_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_33_bridge_.clk(clock);
    sum_syncSide_addrIn_33_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_34_bridge_.clk(clock);
    sum_syncSide_addrIn_34_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_35_bridge_.clk(clock);
    sum_syncSide_addrIn_35_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_36_bridge_.clk(clock);
    sum_syncSide_addrIn_36_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_37_bridge_.clk(clock);
    sum_syncSide_addrIn_37_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_38_bridge_.clk(clock);
    sum_syncSide_addrIn_38_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_39_bridge_.clk(clock);
    sum_syncSide_addrIn_39_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_40_bridge_.clk(clock);
    sum_syncSide_addrIn_40_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_41_bridge_.clk(clock);
    sum_syncSide_addrIn_41_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_42_bridge_.clk(clock);
    sum_syncSide_addrIn_42_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_43_bridge_.clk(clock);
    sum_syncSide_addrIn_43_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_44_bridge_.clk(clock);
    sum_syncSide_addrIn_44_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_45_bridge_.clk(clock);
    sum_syncSide_addrIn_45_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_46_bridge_.clk(clock);
    sum_syncSide_addrIn_46_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_47_bridge_.clk(clock);
    sum_syncSide_addrIn_47_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_48_bridge_.clk(clock);
    sum_syncSide_addrIn_48_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_49_bridge_.clk(clock);
    sum_syncSide_addrIn_49_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_50_bridge_.clk(clock);
    sum_syncSide_addrIn_50_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_51_bridge_.clk(clock);
    sum_syncSide_addrIn_51_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_52_bridge_.clk(clock);
    sum_syncSide_addrIn_52_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_53_bridge_.clk(clock);
    sum_syncSide_addrIn_53_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_54_bridge_.clk(clock);
    sum_syncSide_addrIn_54_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_55_bridge_.clk(clock);
    sum_syncSide_addrIn_55_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_56_bridge_.clk(clock);
    sum_syncSide_addrIn_56_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_57_bridge_.clk(clock);
    sum_syncSide_addrIn_57_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_58_bridge_.clk(clock);
    sum_syncSide_addrIn_58_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_59_bridge_.clk(clock);
    sum_syncSide_addrIn_59_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_60_bridge_.clk(clock);
    sum_syncSide_addrIn_60_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_61_bridge_.clk(clock);
    sum_syncSide_addrIn_61_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_62_bridge_.clk(clock);
    sum_syncSide_addrIn_62_bridge_.resetn(reset_n_);
    
    sum_syncSide_addrIn_63_bridge_.clk(clock);
    sum_syncSide_addrIn_63_bridge_.resetn(reset_n_);
    
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
    fib_stealSide_taskOut_5_signals_.connect(fib_stealSide_taskOut_5_bridge_);
    fib_stealSide_taskOut_6_signals_.connect(fib_stealSide_taskOut_6_bridge_);
    fib_stealSide_taskOut_7_signals_.connect(fib_stealSide_taskOut_7_bridge_);
    fib_stealSide_taskOut_8_signals_.connect(fib_stealSide_taskOut_8_bridge_);
    fib_stealSide_taskOut_9_signals_.connect(fib_stealSide_taskOut_9_bridge_);
    fib_stealSide_taskOut_10_signals_.connect(fib_stealSide_taskOut_10_bridge_);
    fib_stealSide_taskOut_11_signals_.connect(fib_stealSide_taskOut_11_bridge_);
    fib_stealSide_taskOut_12_signals_.connect(fib_stealSide_taskOut_12_bridge_);
    fib_stealSide_taskOut_13_signals_.connect(fib_stealSide_taskOut_13_bridge_);
    fib_stealSide_taskOut_14_signals_.connect(fib_stealSide_taskOut_14_bridge_);
    fib_stealSide_taskOut_15_signals_.connect(fib_stealSide_taskOut_15_bridge_);
    fib_stealSide_taskOut_16_signals_.connect(fib_stealSide_taskOut_16_bridge_);
    fib_stealSide_taskOut_17_signals_.connect(fib_stealSide_taskOut_17_bridge_);
    fib_stealSide_taskOut_18_signals_.connect(fib_stealSide_taskOut_18_bridge_);
    fib_stealSide_taskOut_19_signals_.connect(fib_stealSide_taskOut_19_bridge_);
    fib_stealSide_taskOut_20_signals_.connect(fib_stealSide_taskOut_20_bridge_);
    fib_stealSide_taskOut_21_signals_.connect(fib_stealSide_taskOut_21_bridge_);
    fib_stealSide_taskOut_22_signals_.connect(fib_stealSide_taskOut_22_bridge_);
    fib_stealSide_taskOut_23_signals_.connect(fib_stealSide_taskOut_23_bridge_);
    fib_stealSide_taskOut_24_signals_.connect(fib_stealSide_taskOut_24_bridge_);
    fib_stealSide_taskOut_25_signals_.connect(fib_stealSide_taskOut_25_bridge_);
    fib_stealSide_taskOut_26_signals_.connect(fib_stealSide_taskOut_26_bridge_);
    fib_stealSide_taskOut_27_signals_.connect(fib_stealSide_taskOut_27_bridge_);
    fib_stealSide_taskOut_28_signals_.connect(fib_stealSide_taskOut_28_bridge_);
    fib_stealSide_taskOut_29_signals_.connect(fib_stealSide_taskOut_29_bridge_);
    fib_stealSide_taskOut_30_signals_.connect(fib_stealSide_taskOut_30_bridge_);
    fib_stealSide_taskOut_31_signals_.connect(fib_stealSide_taskOut_31_bridge_);
    fib_stealSide_taskIn_0_signals_.connect(fib_stealSide_taskIn_0_bridge_);
    fib_stealSide_taskIn_1_signals_.connect(fib_stealSide_taskIn_1_bridge_);
    fib_stealSide_taskIn_2_signals_.connect(fib_stealSide_taskIn_2_bridge_);
    fib_stealSide_taskIn_3_signals_.connect(fib_stealSide_taskIn_3_bridge_);
    fib_stealSide_taskIn_4_signals_.connect(fib_stealSide_taskIn_4_bridge_);
    fib_stealSide_taskIn_5_signals_.connect(fib_stealSide_taskIn_5_bridge_);
    fib_stealSide_taskIn_6_signals_.connect(fib_stealSide_taskIn_6_bridge_);
    fib_stealSide_taskIn_7_signals_.connect(fib_stealSide_taskIn_7_bridge_);
    fib_stealSide_taskIn_8_signals_.connect(fib_stealSide_taskIn_8_bridge_);
    fib_stealSide_taskIn_9_signals_.connect(fib_stealSide_taskIn_9_bridge_);
    fib_stealSide_taskIn_10_signals_.connect(fib_stealSide_taskIn_10_bridge_);
    fib_stealSide_taskIn_11_signals_.connect(fib_stealSide_taskIn_11_bridge_);
    fib_stealSide_taskIn_12_signals_.connect(fib_stealSide_taskIn_12_bridge_);
    fib_stealSide_taskIn_13_signals_.connect(fib_stealSide_taskIn_13_bridge_);
    fib_stealSide_taskIn_14_signals_.connect(fib_stealSide_taskIn_14_bridge_);
    fib_stealSide_taskIn_15_signals_.connect(fib_stealSide_taskIn_15_bridge_);
    fib_stealSide_taskIn_16_signals_.connect(fib_stealSide_taskIn_16_bridge_);
    fib_stealSide_taskIn_17_signals_.connect(fib_stealSide_taskIn_17_bridge_);
    fib_stealSide_taskIn_18_signals_.connect(fib_stealSide_taskIn_18_bridge_);
    fib_stealSide_taskIn_19_signals_.connect(fib_stealSide_taskIn_19_bridge_);
    fib_stealSide_taskIn_20_signals_.connect(fib_stealSide_taskIn_20_bridge_);
    fib_stealSide_taskIn_21_signals_.connect(fib_stealSide_taskIn_21_bridge_);
    fib_stealSide_taskIn_22_signals_.connect(fib_stealSide_taskIn_22_bridge_);
    fib_stealSide_taskIn_23_signals_.connect(fib_stealSide_taskIn_23_bridge_);
    fib_stealSide_taskIn_24_signals_.connect(fib_stealSide_taskIn_24_bridge_);
    fib_stealSide_taskIn_25_signals_.connect(fib_stealSide_taskIn_25_bridge_);
    fib_stealSide_taskIn_26_signals_.connect(fib_stealSide_taskIn_26_bridge_);
    fib_stealSide_taskIn_27_signals_.connect(fib_stealSide_taskIn_27_bridge_);
    fib_stealSide_taskIn_28_signals_.connect(fib_stealSide_taskIn_28_bridge_);
    fib_stealSide_taskIn_29_signals_.connect(fib_stealSide_taskIn_29_bridge_);
    fib_stealSide_taskIn_30_signals_.connect(fib_stealSide_taskIn_30_bridge_);
    fib_stealSide_taskIn_31_signals_.connect(fib_stealSide_taskIn_31_bridge_);
    sum_stealSide_taskOut_0_signals_.connect(sum_stealSide_taskOut_0_bridge_);
    sum_stealSide_taskOut_1_signals_.connect(sum_stealSide_taskOut_1_bridge_);
    sum_stealSide_taskOut_2_signals_.connect(sum_stealSide_taskOut_2_bridge_);
    sum_stealSide_taskOut_3_signals_.connect(sum_stealSide_taskOut_3_bridge_);
    sum_stealSide_taskOut_4_signals_.connect(sum_stealSide_taskOut_4_bridge_);
    sum_stealSide_taskOut_5_signals_.connect(sum_stealSide_taskOut_5_bridge_);
    sum_stealSide_taskOut_6_signals_.connect(sum_stealSide_taskOut_6_bridge_);
    sum_stealSide_taskOut_7_signals_.connect(sum_stealSide_taskOut_7_bridge_);
    sum_stealSide_taskOut_8_signals_.connect(sum_stealSide_taskOut_8_bridge_);
    sum_stealSide_taskOut_9_signals_.connect(sum_stealSide_taskOut_9_bridge_);
    sum_stealSide_taskOut_10_signals_.connect(sum_stealSide_taskOut_10_bridge_);
    sum_stealSide_taskOut_11_signals_.connect(sum_stealSide_taskOut_11_bridge_);
    sum_stealSide_taskOut_12_signals_.connect(sum_stealSide_taskOut_12_bridge_);
    sum_stealSide_taskOut_13_signals_.connect(sum_stealSide_taskOut_13_bridge_);
    sum_stealSide_taskOut_14_signals_.connect(sum_stealSide_taskOut_14_bridge_);
    sum_stealSide_taskOut_15_signals_.connect(sum_stealSide_taskOut_15_bridge_);
    sum_stealSide_taskOut_16_signals_.connect(sum_stealSide_taskOut_16_bridge_);
    sum_stealSide_taskOut_17_signals_.connect(sum_stealSide_taskOut_17_bridge_);
    sum_stealSide_taskOut_18_signals_.connect(sum_stealSide_taskOut_18_bridge_);
    sum_stealSide_taskOut_19_signals_.connect(sum_stealSide_taskOut_19_bridge_);
    sum_stealSide_taskOut_20_signals_.connect(sum_stealSide_taskOut_20_bridge_);
    sum_stealSide_taskOut_21_signals_.connect(sum_stealSide_taskOut_21_bridge_);
    sum_stealSide_taskOut_22_signals_.connect(sum_stealSide_taskOut_22_bridge_);
    sum_stealSide_taskOut_23_signals_.connect(sum_stealSide_taskOut_23_bridge_);
    sum_stealSide_taskOut_24_signals_.connect(sum_stealSide_taskOut_24_bridge_);
    sum_stealSide_taskOut_25_signals_.connect(sum_stealSide_taskOut_25_bridge_);
    sum_stealSide_taskOut_26_signals_.connect(sum_stealSide_taskOut_26_bridge_);
    sum_stealSide_taskOut_27_signals_.connect(sum_stealSide_taskOut_27_bridge_);
    sum_stealSide_taskOut_28_signals_.connect(sum_stealSide_taskOut_28_bridge_);
    sum_stealSide_taskOut_29_signals_.connect(sum_stealSide_taskOut_29_bridge_);
    sum_stealSide_taskOut_30_signals_.connect(sum_stealSide_taskOut_30_bridge_);
    sum_stealSide_taskOut_31_signals_.connect(sum_stealSide_taskOut_31_bridge_);
    sum_syncSide_addrIn_0_signals_.connect(sum_syncSide_addrIn_0_bridge_);
    sum_syncSide_addrIn_1_signals_.connect(sum_syncSide_addrIn_1_bridge_);
    sum_syncSide_addrIn_2_signals_.connect(sum_syncSide_addrIn_2_bridge_);
    sum_syncSide_addrIn_3_signals_.connect(sum_syncSide_addrIn_3_bridge_);
    sum_syncSide_addrIn_4_signals_.connect(sum_syncSide_addrIn_4_bridge_);
    sum_syncSide_addrIn_5_signals_.connect(sum_syncSide_addrIn_5_bridge_);
    sum_syncSide_addrIn_6_signals_.connect(sum_syncSide_addrIn_6_bridge_);
    sum_syncSide_addrIn_7_signals_.connect(sum_syncSide_addrIn_7_bridge_);
    sum_syncSide_addrIn_8_signals_.connect(sum_syncSide_addrIn_8_bridge_);
    sum_syncSide_addrIn_9_signals_.connect(sum_syncSide_addrIn_9_bridge_);
    sum_syncSide_addrIn_10_signals_.connect(sum_syncSide_addrIn_10_bridge_);
    sum_syncSide_addrIn_11_signals_.connect(sum_syncSide_addrIn_11_bridge_);
    sum_syncSide_addrIn_12_signals_.connect(sum_syncSide_addrIn_12_bridge_);
    sum_syncSide_addrIn_13_signals_.connect(sum_syncSide_addrIn_13_bridge_);
    sum_syncSide_addrIn_14_signals_.connect(sum_syncSide_addrIn_14_bridge_);
    sum_syncSide_addrIn_15_signals_.connect(sum_syncSide_addrIn_15_bridge_);
    sum_syncSide_addrIn_16_signals_.connect(sum_syncSide_addrIn_16_bridge_);
    sum_syncSide_addrIn_17_signals_.connect(sum_syncSide_addrIn_17_bridge_);
    sum_syncSide_addrIn_18_signals_.connect(sum_syncSide_addrIn_18_bridge_);
    sum_syncSide_addrIn_19_signals_.connect(sum_syncSide_addrIn_19_bridge_);
    sum_syncSide_addrIn_20_signals_.connect(sum_syncSide_addrIn_20_bridge_);
    sum_syncSide_addrIn_21_signals_.connect(sum_syncSide_addrIn_21_bridge_);
    sum_syncSide_addrIn_22_signals_.connect(sum_syncSide_addrIn_22_bridge_);
    sum_syncSide_addrIn_23_signals_.connect(sum_syncSide_addrIn_23_bridge_);
    sum_syncSide_addrIn_24_signals_.connect(sum_syncSide_addrIn_24_bridge_);
    sum_syncSide_addrIn_25_signals_.connect(sum_syncSide_addrIn_25_bridge_);
    sum_syncSide_addrIn_26_signals_.connect(sum_syncSide_addrIn_26_bridge_);
    sum_syncSide_addrIn_27_signals_.connect(sum_syncSide_addrIn_27_bridge_);
    sum_syncSide_addrIn_28_signals_.connect(sum_syncSide_addrIn_28_bridge_);
    sum_syncSide_addrIn_29_signals_.connect(sum_syncSide_addrIn_29_bridge_);
    sum_syncSide_addrIn_30_signals_.connect(sum_syncSide_addrIn_30_bridge_);
    sum_syncSide_addrIn_31_signals_.connect(sum_syncSide_addrIn_31_bridge_);
    sum_continuationAllocationSide_contOut_0_signals_.connect(sum_continuationAllocationSide_contOut_0_bridge_);
    sum_continuationAllocationSide_contOut_1_signals_.connect(sum_continuationAllocationSide_contOut_1_bridge_);
    sum_continuationAllocationSide_contOut_2_signals_.connect(sum_continuationAllocationSide_contOut_2_bridge_);
    sum_continuationAllocationSide_contOut_3_signals_.connect(sum_continuationAllocationSide_contOut_3_bridge_);
    sum_continuationAllocationSide_contOut_4_signals_.connect(sum_continuationAllocationSide_contOut_4_bridge_);
    sum_continuationAllocationSide_contOut_5_signals_.connect(sum_continuationAllocationSide_contOut_5_bridge_);
    sum_continuationAllocationSide_contOut_6_signals_.connect(sum_continuationAllocationSide_contOut_6_bridge_);
    sum_continuationAllocationSide_contOut_7_signals_.connect(sum_continuationAllocationSide_contOut_7_bridge_);
    sum_continuationAllocationSide_contOut_8_signals_.connect(sum_continuationAllocationSide_contOut_8_bridge_);
    sum_continuationAllocationSide_contOut_9_signals_.connect(sum_continuationAllocationSide_contOut_9_bridge_);
    sum_continuationAllocationSide_contOut_10_signals_.connect(sum_continuationAllocationSide_contOut_10_bridge_);
    sum_continuationAllocationSide_contOut_11_signals_.connect(sum_continuationAllocationSide_contOut_11_bridge_);
    sum_continuationAllocationSide_contOut_12_signals_.connect(sum_continuationAllocationSide_contOut_12_bridge_);
    sum_continuationAllocationSide_contOut_13_signals_.connect(sum_continuationAllocationSide_contOut_13_bridge_);
    sum_continuationAllocationSide_contOut_14_signals_.connect(sum_continuationAllocationSide_contOut_14_bridge_);
    sum_continuationAllocationSide_contOut_15_signals_.connect(sum_continuationAllocationSide_contOut_15_bridge_);
    sum_continuationAllocationSide_contOut_16_signals_.connect(sum_continuationAllocationSide_contOut_16_bridge_);
    sum_continuationAllocationSide_contOut_17_signals_.connect(sum_continuationAllocationSide_contOut_17_bridge_);
    sum_continuationAllocationSide_contOut_18_signals_.connect(sum_continuationAllocationSide_contOut_18_bridge_);
    sum_continuationAllocationSide_contOut_19_signals_.connect(sum_continuationAllocationSide_contOut_19_bridge_);
    sum_continuationAllocationSide_contOut_20_signals_.connect(sum_continuationAllocationSide_contOut_20_bridge_);
    sum_continuationAllocationSide_contOut_21_signals_.connect(sum_continuationAllocationSide_contOut_21_bridge_);
    sum_continuationAllocationSide_contOut_22_signals_.connect(sum_continuationAllocationSide_contOut_22_bridge_);
    sum_continuationAllocationSide_contOut_23_signals_.connect(sum_continuationAllocationSide_contOut_23_bridge_);
    sum_continuationAllocationSide_contOut_24_signals_.connect(sum_continuationAllocationSide_contOut_24_bridge_);
    sum_continuationAllocationSide_contOut_25_signals_.connect(sum_continuationAllocationSide_contOut_25_bridge_);
    sum_continuationAllocationSide_contOut_26_signals_.connect(sum_continuationAllocationSide_contOut_26_bridge_);
    sum_continuationAllocationSide_contOut_27_signals_.connect(sum_continuationAllocationSide_contOut_27_bridge_);
    sum_continuationAllocationSide_contOut_28_signals_.connect(sum_continuationAllocationSide_contOut_28_bridge_);
    sum_continuationAllocationSide_contOut_29_signals_.connect(sum_continuationAllocationSide_contOut_29_bridge_);
    sum_continuationAllocationSide_contOut_30_signals_.connect(sum_continuationAllocationSide_contOut_30_bridge_);
    sum_continuationAllocationSide_contOut_31_signals_.connect(sum_continuationAllocationSide_contOut_31_bridge_);
    sum_syncSide_addrIn_32_signals_.connect(sum_syncSide_addrIn_32_bridge_);
    sum_syncSide_addrIn_33_signals_.connect(sum_syncSide_addrIn_33_bridge_);
    sum_syncSide_addrIn_34_signals_.connect(sum_syncSide_addrIn_34_bridge_);
    sum_syncSide_addrIn_35_signals_.connect(sum_syncSide_addrIn_35_bridge_);
    sum_syncSide_addrIn_36_signals_.connect(sum_syncSide_addrIn_36_bridge_);
    sum_syncSide_addrIn_37_signals_.connect(sum_syncSide_addrIn_37_bridge_);
    sum_syncSide_addrIn_38_signals_.connect(sum_syncSide_addrIn_38_bridge_);
    sum_syncSide_addrIn_39_signals_.connect(sum_syncSide_addrIn_39_bridge_);
    sum_syncSide_addrIn_40_signals_.connect(sum_syncSide_addrIn_40_bridge_);
    sum_syncSide_addrIn_41_signals_.connect(sum_syncSide_addrIn_41_bridge_);
    sum_syncSide_addrIn_42_signals_.connect(sum_syncSide_addrIn_42_bridge_);
    sum_syncSide_addrIn_43_signals_.connect(sum_syncSide_addrIn_43_bridge_);
    sum_syncSide_addrIn_44_signals_.connect(sum_syncSide_addrIn_44_bridge_);
    sum_syncSide_addrIn_45_signals_.connect(sum_syncSide_addrIn_45_bridge_);
    sum_syncSide_addrIn_46_signals_.connect(sum_syncSide_addrIn_46_bridge_);
    sum_syncSide_addrIn_47_signals_.connect(sum_syncSide_addrIn_47_bridge_);
    sum_syncSide_addrIn_48_signals_.connect(sum_syncSide_addrIn_48_bridge_);
    sum_syncSide_addrIn_49_signals_.connect(sum_syncSide_addrIn_49_bridge_);
    sum_syncSide_addrIn_50_signals_.connect(sum_syncSide_addrIn_50_bridge_);
    sum_syncSide_addrIn_51_signals_.connect(sum_syncSide_addrIn_51_bridge_);
    sum_syncSide_addrIn_52_signals_.connect(sum_syncSide_addrIn_52_bridge_);
    sum_syncSide_addrIn_53_signals_.connect(sum_syncSide_addrIn_53_bridge_);
    sum_syncSide_addrIn_54_signals_.connect(sum_syncSide_addrIn_54_bridge_);
    sum_syncSide_addrIn_55_signals_.connect(sum_syncSide_addrIn_55_bridge_);
    sum_syncSide_addrIn_56_signals_.connect(sum_syncSide_addrIn_56_bridge_);
    sum_syncSide_addrIn_57_signals_.connect(sum_syncSide_addrIn_57_bridge_);
    sum_syncSide_addrIn_58_signals_.connect(sum_syncSide_addrIn_58_bridge_);
    sum_syncSide_addrIn_59_signals_.connect(sum_syncSide_addrIn_59_bridge_);
    sum_syncSide_addrIn_60_signals_.connect(sum_syncSide_addrIn_60_bridge_);
    sum_syncSide_addrIn_61_signals_.connect(sum_syncSide_addrIn_61_bridge_);
    sum_syncSide_addrIn_62_signals_.connect(sum_syncSide_addrIn_62_bridge_);
    sum_syncSide_addrIn_63_signals_.connect(sum_syncSide_addrIn_63_bridge_);
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
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_5 */
    /* is_slave = False */
    fib_stealSide_taskOut_5_TREADY(fib_stealSide_taskOut_5_signals_.tready);
    fib_stealSide_taskOut_5_TVALID(fib_stealSide_taskOut_5_signals_.tvalid);
    fib_stealSide_taskOut_5_TDATA(fib_stealSide_taskOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_6 */
    /* is_slave = False */
    fib_stealSide_taskOut_6_TREADY(fib_stealSide_taskOut_6_signals_.tready);
    fib_stealSide_taskOut_6_TVALID(fib_stealSide_taskOut_6_signals_.tvalid);
    fib_stealSide_taskOut_6_TDATA(fib_stealSide_taskOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_7 */
    /* is_slave = False */
    fib_stealSide_taskOut_7_TREADY(fib_stealSide_taskOut_7_signals_.tready);
    fib_stealSide_taskOut_7_TVALID(fib_stealSide_taskOut_7_signals_.tvalid);
    fib_stealSide_taskOut_7_TDATA(fib_stealSide_taskOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_8 */
    /* is_slave = False */
    fib_stealSide_taskOut_8_TREADY(fib_stealSide_taskOut_8_signals_.tready);
    fib_stealSide_taskOut_8_TVALID(fib_stealSide_taskOut_8_signals_.tvalid);
    fib_stealSide_taskOut_8_TDATA(fib_stealSide_taskOut_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_9 */
    /* is_slave = False */
    fib_stealSide_taskOut_9_TREADY(fib_stealSide_taskOut_9_signals_.tready);
    fib_stealSide_taskOut_9_TVALID(fib_stealSide_taskOut_9_signals_.tvalid);
    fib_stealSide_taskOut_9_TDATA(fib_stealSide_taskOut_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_10 */
    /* is_slave = False */
    fib_stealSide_taskOut_10_TREADY(fib_stealSide_taskOut_10_signals_.tready);
    fib_stealSide_taskOut_10_TVALID(fib_stealSide_taskOut_10_signals_.tvalid);
    fib_stealSide_taskOut_10_TDATA(fib_stealSide_taskOut_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_11 */
    /* is_slave = False */
    fib_stealSide_taskOut_11_TREADY(fib_stealSide_taskOut_11_signals_.tready);
    fib_stealSide_taskOut_11_TVALID(fib_stealSide_taskOut_11_signals_.tvalid);
    fib_stealSide_taskOut_11_TDATA(fib_stealSide_taskOut_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_12 */
    /* is_slave = False */
    fib_stealSide_taskOut_12_TREADY(fib_stealSide_taskOut_12_signals_.tready);
    fib_stealSide_taskOut_12_TVALID(fib_stealSide_taskOut_12_signals_.tvalid);
    fib_stealSide_taskOut_12_TDATA(fib_stealSide_taskOut_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_13 */
    /* is_slave = False */
    fib_stealSide_taskOut_13_TREADY(fib_stealSide_taskOut_13_signals_.tready);
    fib_stealSide_taskOut_13_TVALID(fib_stealSide_taskOut_13_signals_.tvalid);
    fib_stealSide_taskOut_13_TDATA(fib_stealSide_taskOut_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_14 */
    /* is_slave = False */
    fib_stealSide_taskOut_14_TREADY(fib_stealSide_taskOut_14_signals_.tready);
    fib_stealSide_taskOut_14_TVALID(fib_stealSide_taskOut_14_signals_.tvalid);
    fib_stealSide_taskOut_14_TDATA(fib_stealSide_taskOut_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_15 */
    /* is_slave = False */
    fib_stealSide_taskOut_15_TREADY(fib_stealSide_taskOut_15_signals_.tready);
    fib_stealSide_taskOut_15_TVALID(fib_stealSide_taskOut_15_signals_.tvalid);
    fib_stealSide_taskOut_15_TDATA(fib_stealSide_taskOut_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_16 */
    /* is_slave = False */
    fib_stealSide_taskOut_16_TREADY(fib_stealSide_taskOut_16_signals_.tready);
    fib_stealSide_taskOut_16_TVALID(fib_stealSide_taskOut_16_signals_.tvalid);
    fib_stealSide_taskOut_16_TDATA(fib_stealSide_taskOut_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_17 */
    /* is_slave = False */
    fib_stealSide_taskOut_17_TREADY(fib_stealSide_taskOut_17_signals_.tready);
    fib_stealSide_taskOut_17_TVALID(fib_stealSide_taskOut_17_signals_.tvalid);
    fib_stealSide_taskOut_17_TDATA(fib_stealSide_taskOut_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_18 */
    /* is_slave = False */
    fib_stealSide_taskOut_18_TREADY(fib_stealSide_taskOut_18_signals_.tready);
    fib_stealSide_taskOut_18_TVALID(fib_stealSide_taskOut_18_signals_.tvalid);
    fib_stealSide_taskOut_18_TDATA(fib_stealSide_taskOut_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_19 */
    /* is_slave = False */
    fib_stealSide_taskOut_19_TREADY(fib_stealSide_taskOut_19_signals_.tready);
    fib_stealSide_taskOut_19_TVALID(fib_stealSide_taskOut_19_signals_.tvalid);
    fib_stealSide_taskOut_19_TDATA(fib_stealSide_taskOut_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_20 */
    /* is_slave = False */
    fib_stealSide_taskOut_20_TREADY(fib_stealSide_taskOut_20_signals_.tready);
    fib_stealSide_taskOut_20_TVALID(fib_stealSide_taskOut_20_signals_.tvalid);
    fib_stealSide_taskOut_20_TDATA(fib_stealSide_taskOut_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_21 */
    /* is_slave = False */
    fib_stealSide_taskOut_21_TREADY(fib_stealSide_taskOut_21_signals_.tready);
    fib_stealSide_taskOut_21_TVALID(fib_stealSide_taskOut_21_signals_.tvalid);
    fib_stealSide_taskOut_21_TDATA(fib_stealSide_taskOut_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_22 */
    /* is_slave = False */
    fib_stealSide_taskOut_22_TREADY(fib_stealSide_taskOut_22_signals_.tready);
    fib_stealSide_taskOut_22_TVALID(fib_stealSide_taskOut_22_signals_.tvalid);
    fib_stealSide_taskOut_22_TDATA(fib_stealSide_taskOut_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_23 */
    /* is_slave = False */
    fib_stealSide_taskOut_23_TREADY(fib_stealSide_taskOut_23_signals_.tready);
    fib_stealSide_taskOut_23_TVALID(fib_stealSide_taskOut_23_signals_.tvalid);
    fib_stealSide_taskOut_23_TDATA(fib_stealSide_taskOut_23_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_24 */
    /* is_slave = False */
    fib_stealSide_taskOut_24_TREADY(fib_stealSide_taskOut_24_signals_.tready);
    fib_stealSide_taskOut_24_TVALID(fib_stealSide_taskOut_24_signals_.tvalid);
    fib_stealSide_taskOut_24_TDATA(fib_stealSide_taskOut_24_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_25 */
    /* is_slave = False */
    fib_stealSide_taskOut_25_TREADY(fib_stealSide_taskOut_25_signals_.tready);
    fib_stealSide_taskOut_25_TVALID(fib_stealSide_taskOut_25_signals_.tvalid);
    fib_stealSide_taskOut_25_TDATA(fib_stealSide_taskOut_25_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_26 */
    /* is_slave = False */
    fib_stealSide_taskOut_26_TREADY(fib_stealSide_taskOut_26_signals_.tready);
    fib_stealSide_taskOut_26_TVALID(fib_stealSide_taskOut_26_signals_.tvalid);
    fib_stealSide_taskOut_26_TDATA(fib_stealSide_taskOut_26_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_27 */
    /* is_slave = False */
    fib_stealSide_taskOut_27_TREADY(fib_stealSide_taskOut_27_signals_.tready);
    fib_stealSide_taskOut_27_TVALID(fib_stealSide_taskOut_27_signals_.tvalid);
    fib_stealSide_taskOut_27_TDATA(fib_stealSide_taskOut_27_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_28 */
    /* is_slave = False */
    fib_stealSide_taskOut_28_TREADY(fib_stealSide_taskOut_28_signals_.tready);
    fib_stealSide_taskOut_28_TVALID(fib_stealSide_taskOut_28_signals_.tvalid);
    fib_stealSide_taskOut_28_TDATA(fib_stealSide_taskOut_28_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_29 */
    /* is_slave = False */
    fib_stealSide_taskOut_29_TREADY(fib_stealSide_taskOut_29_signals_.tready);
    fib_stealSide_taskOut_29_TVALID(fib_stealSide_taskOut_29_signals_.tvalid);
    fib_stealSide_taskOut_29_TDATA(fib_stealSide_taskOut_29_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_30 */
    /* is_slave = False */
    fib_stealSide_taskOut_30_TREADY(fib_stealSide_taskOut_30_signals_.tready);
    fib_stealSide_taskOut_30_TVALID(fib_stealSide_taskOut_30_signals_.tvalid);
    fib_stealSide_taskOut_30_TDATA(fib_stealSide_taskOut_30_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskOut_31 */
    /* is_slave = False */
    fib_stealSide_taskOut_31_TREADY(fib_stealSide_taskOut_31_signals_.tready);
    fib_stealSide_taskOut_31_TVALID(fib_stealSide_taskOut_31_signals_.tvalid);
    fib_stealSide_taskOut_31_TDATA(fib_stealSide_taskOut_31_signals_.tdata);
    
    
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
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_5 */
    /* is_slave = True */
    fib_stealSide_taskIn_5_TREADY(fib_stealSide_taskIn_5_signals_.tready);
    fib_stealSide_taskIn_5_TVALID(fib_stealSide_taskIn_5_signals_.tvalid);
    fib_stealSide_taskIn_5_TDATA(fib_stealSide_taskIn_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_6 */
    /* is_slave = True */
    fib_stealSide_taskIn_6_TREADY(fib_stealSide_taskIn_6_signals_.tready);
    fib_stealSide_taskIn_6_TVALID(fib_stealSide_taskIn_6_signals_.tvalid);
    fib_stealSide_taskIn_6_TDATA(fib_stealSide_taskIn_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_7 */
    /* is_slave = True */
    fib_stealSide_taskIn_7_TREADY(fib_stealSide_taskIn_7_signals_.tready);
    fib_stealSide_taskIn_7_TVALID(fib_stealSide_taskIn_7_signals_.tvalid);
    fib_stealSide_taskIn_7_TDATA(fib_stealSide_taskIn_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_8 */
    /* is_slave = True */
    fib_stealSide_taskIn_8_TREADY(fib_stealSide_taskIn_8_signals_.tready);
    fib_stealSide_taskIn_8_TVALID(fib_stealSide_taskIn_8_signals_.tvalid);
    fib_stealSide_taskIn_8_TDATA(fib_stealSide_taskIn_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_9 */
    /* is_slave = True */
    fib_stealSide_taskIn_9_TREADY(fib_stealSide_taskIn_9_signals_.tready);
    fib_stealSide_taskIn_9_TVALID(fib_stealSide_taskIn_9_signals_.tvalid);
    fib_stealSide_taskIn_9_TDATA(fib_stealSide_taskIn_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_10 */
    /* is_slave = True */
    fib_stealSide_taskIn_10_TREADY(fib_stealSide_taskIn_10_signals_.tready);
    fib_stealSide_taskIn_10_TVALID(fib_stealSide_taskIn_10_signals_.tvalid);
    fib_stealSide_taskIn_10_TDATA(fib_stealSide_taskIn_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_11 */
    /* is_slave = True */
    fib_stealSide_taskIn_11_TREADY(fib_stealSide_taskIn_11_signals_.tready);
    fib_stealSide_taskIn_11_TVALID(fib_stealSide_taskIn_11_signals_.tvalid);
    fib_stealSide_taskIn_11_TDATA(fib_stealSide_taskIn_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_12 */
    /* is_slave = True */
    fib_stealSide_taskIn_12_TREADY(fib_stealSide_taskIn_12_signals_.tready);
    fib_stealSide_taskIn_12_TVALID(fib_stealSide_taskIn_12_signals_.tvalid);
    fib_stealSide_taskIn_12_TDATA(fib_stealSide_taskIn_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_13 */
    /* is_slave = True */
    fib_stealSide_taskIn_13_TREADY(fib_stealSide_taskIn_13_signals_.tready);
    fib_stealSide_taskIn_13_TVALID(fib_stealSide_taskIn_13_signals_.tvalid);
    fib_stealSide_taskIn_13_TDATA(fib_stealSide_taskIn_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_14 */
    /* is_slave = True */
    fib_stealSide_taskIn_14_TREADY(fib_stealSide_taskIn_14_signals_.tready);
    fib_stealSide_taskIn_14_TVALID(fib_stealSide_taskIn_14_signals_.tvalid);
    fib_stealSide_taskIn_14_TDATA(fib_stealSide_taskIn_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_15 */
    /* is_slave = True */
    fib_stealSide_taskIn_15_TREADY(fib_stealSide_taskIn_15_signals_.tready);
    fib_stealSide_taskIn_15_TVALID(fib_stealSide_taskIn_15_signals_.tvalid);
    fib_stealSide_taskIn_15_TDATA(fib_stealSide_taskIn_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_16 */
    /* is_slave = True */
    fib_stealSide_taskIn_16_TREADY(fib_stealSide_taskIn_16_signals_.tready);
    fib_stealSide_taskIn_16_TVALID(fib_stealSide_taskIn_16_signals_.tvalid);
    fib_stealSide_taskIn_16_TDATA(fib_stealSide_taskIn_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_17 */
    /* is_slave = True */
    fib_stealSide_taskIn_17_TREADY(fib_stealSide_taskIn_17_signals_.tready);
    fib_stealSide_taskIn_17_TVALID(fib_stealSide_taskIn_17_signals_.tvalid);
    fib_stealSide_taskIn_17_TDATA(fib_stealSide_taskIn_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_18 */
    /* is_slave = True */
    fib_stealSide_taskIn_18_TREADY(fib_stealSide_taskIn_18_signals_.tready);
    fib_stealSide_taskIn_18_TVALID(fib_stealSide_taskIn_18_signals_.tvalid);
    fib_stealSide_taskIn_18_TDATA(fib_stealSide_taskIn_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_19 */
    /* is_slave = True */
    fib_stealSide_taskIn_19_TREADY(fib_stealSide_taskIn_19_signals_.tready);
    fib_stealSide_taskIn_19_TVALID(fib_stealSide_taskIn_19_signals_.tvalid);
    fib_stealSide_taskIn_19_TDATA(fib_stealSide_taskIn_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_20 */
    /* is_slave = True */
    fib_stealSide_taskIn_20_TREADY(fib_stealSide_taskIn_20_signals_.tready);
    fib_stealSide_taskIn_20_TVALID(fib_stealSide_taskIn_20_signals_.tvalid);
    fib_stealSide_taskIn_20_TDATA(fib_stealSide_taskIn_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_21 */
    /* is_slave = True */
    fib_stealSide_taskIn_21_TREADY(fib_stealSide_taskIn_21_signals_.tready);
    fib_stealSide_taskIn_21_TVALID(fib_stealSide_taskIn_21_signals_.tvalid);
    fib_stealSide_taskIn_21_TDATA(fib_stealSide_taskIn_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_22 */
    /* is_slave = True */
    fib_stealSide_taskIn_22_TREADY(fib_stealSide_taskIn_22_signals_.tready);
    fib_stealSide_taskIn_22_TVALID(fib_stealSide_taskIn_22_signals_.tvalid);
    fib_stealSide_taskIn_22_TDATA(fib_stealSide_taskIn_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_23 */
    /* is_slave = True */
    fib_stealSide_taskIn_23_TREADY(fib_stealSide_taskIn_23_signals_.tready);
    fib_stealSide_taskIn_23_TVALID(fib_stealSide_taskIn_23_signals_.tvalid);
    fib_stealSide_taskIn_23_TDATA(fib_stealSide_taskIn_23_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_24 */
    /* is_slave = True */
    fib_stealSide_taskIn_24_TREADY(fib_stealSide_taskIn_24_signals_.tready);
    fib_stealSide_taskIn_24_TVALID(fib_stealSide_taskIn_24_signals_.tvalid);
    fib_stealSide_taskIn_24_TDATA(fib_stealSide_taskIn_24_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_25 */
    /* is_slave = True */
    fib_stealSide_taskIn_25_TREADY(fib_stealSide_taskIn_25_signals_.tready);
    fib_stealSide_taskIn_25_TVALID(fib_stealSide_taskIn_25_signals_.tvalid);
    fib_stealSide_taskIn_25_TDATA(fib_stealSide_taskIn_25_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_26 */
    /* is_slave = True */
    fib_stealSide_taskIn_26_TREADY(fib_stealSide_taskIn_26_signals_.tready);
    fib_stealSide_taskIn_26_TVALID(fib_stealSide_taskIn_26_signals_.tvalid);
    fib_stealSide_taskIn_26_TDATA(fib_stealSide_taskIn_26_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_27 */
    /* is_slave = True */
    fib_stealSide_taskIn_27_TREADY(fib_stealSide_taskIn_27_signals_.tready);
    fib_stealSide_taskIn_27_TVALID(fib_stealSide_taskIn_27_signals_.tvalid);
    fib_stealSide_taskIn_27_TDATA(fib_stealSide_taskIn_27_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_28 */
    /* is_slave = True */
    fib_stealSide_taskIn_28_TREADY(fib_stealSide_taskIn_28_signals_.tready);
    fib_stealSide_taskIn_28_TVALID(fib_stealSide_taskIn_28_signals_.tvalid);
    fib_stealSide_taskIn_28_TDATA(fib_stealSide_taskIn_28_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_29 */
    /* is_slave = True */
    fib_stealSide_taskIn_29_TREADY(fib_stealSide_taskIn_29_signals_.tready);
    fib_stealSide_taskIn_29_TVALID(fib_stealSide_taskIn_29_signals_.tvalid);
    fib_stealSide_taskIn_29_TDATA(fib_stealSide_taskIn_29_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_30 */
    /* is_slave = True */
    fib_stealSide_taskIn_30_TREADY(fib_stealSide_taskIn_30_signals_.tready);
    fib_stealSide_taskIn_30_TVALID(fib_stealSide_taskIn_30_signals_.tvalid);
    fib_stealSide_taskIn_30_TDATA(fib_stealSide_taskIn_30_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: fib_stealSide_taskIn_31 */
    /* is_slave = True */
    fib_stealSide_taskIn_31_TREADY(fib_stealSide_taskIn_31_signals_.tready);
    fib_stealSide_taskIn_31_TVALID(fib_stealSide_taskIn_31_signals_.tvalid);
    fib_stealSide_taskIn_31_TDATA(fib_stealSide_taskIn_31_signals_.tdata);
    
    
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
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_5 */
    /* is_slave = False */
    sum_stealSide_taskOut_5_TREADY(sum_stealSide_taskOut_5_signals_.tready);
    sum_stealSide_taskOut_5_TVALID(sum_stealSide_taskOut_5_signals_.tvalid);
    sum_stealSide_taskOut_5_TDATA(sum_stealSide_taskOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_6 */
    /* is_slave = False */
    sum_stealSide_taskOut_6_TREADY(sum_stealSide_taskOut_6_signals_.tready);
    sum_stealSide_taskOut_6_TVALID(sum_stealSide_taskOut_6_signals_.tvalid);
    sum_stealSide_taskOut_6_TDATA(sum_stealSide_taskOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_7 */
    /* is_slave = False */
    sum_stealSide_taskOut_7_TREADY(sum_stealSide_taskOut_7_signals_.tready);
    sum_stealSide_taskOut_7_TVALID(sum_stealSide_taskOut_7_signals_.tvalid);
    sum_stealSide_taskOut_7_TDATA(sum_stealSide_taskOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_8 */
    /* is_slave = False */
    sum_stealSide_taskOut_8_TREADY(sum_stealSide_taskOut_8_signals_.tready);
    sum_stealSide_taskOut_8_TVALID(sum_stealSide_taskOut_8_signals_.tvalid);
    sum_stealSide_taskOut_8_TDATA(sum_stealSide_taskOut_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_9 */
    /* is_slave = False */
    sum_stealSide_taskOut_9_TREADY(sum_stealSide_taskOut_9_signals_.tready);
    sum_stealSide_taskOut_9_TVALID(sum_stealSide_taskOut_9_signals_.tvalid);
    sum_stealSide_taskOut_9_TDATA(sum_stealSide_taskOut_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_10 */
    /* is_slave = False */
    sum_stealSide_taskOut_10_TREADY(sum_stealSide_taskOut_10_signals_.tready);
    sum_stealSide_taskOut_10_TVALID(sum_stealSide_taskOut_10_signals_.tvalid);
    sum_stealSide_taskOut_10_TDATA(sum_stealSide_taskOut_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_11 */
    /* is_slave = False */
    sum_stealSide_taskOut_11_TREADY(sum_stealSide_taskOut_11_signals_.tready);
    sum_stealSide_taskOut_11_TVALID(sum_stealSide_taskOut_11_signals_.tvalid);
    sum_stealSide_taskOut_11_TDATA(sum_stealSide_taskOut_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_12 */
    /* is_slave = False */
    sum_stealSide_taskOut_12_TREADY(sum_stealSide_taskOut_12_signals_.tready);
    sum_stealSide_taskOut_12_TVALID(sum_stealSide_taskOut_12_signals_.tvalid);
    sum_stealSide_taskOut_12_TDATA(sum_stealSide_taskOut_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_13 */
    /* is_slave = False */
    sum_stealSide_taskOut_13_TREADY(sum_stealSide_taskOut_13_signals_.tready);
    sum_stealSide_taskOut_13_TVALID(sum_stealSide_taskOut_13_signals_.tvalid);
    sum_stealSide_taskOut_13_TDATA(sum_stealSide_taskOut_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_14 */
    /* is_slave = False */
    sum_stealSide_taskOut_14_TREADY(sum_stealSide_taskOut_14_signals_.tready);
    sum_stealSide_taskOut_14_TVALID(sum_stealSide_taskOut_14_signals_.tvalid);
    sum_stealSide_taskOut_14_TDATA(sum_stealSide_taskOut_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_15 */
    /* is_slave = False */
    sum_stealSide_taskOut_15_TREADY(sum_stealSide_taskOut_15_signals_.tready);
    sum_stealSide_taskOut_15_TVALID(sum_stealSide_taskOut_15_signals_.tvalid);
    sum_stealSide_taskOut_15_TDATA(sum_stealSide_taskOut_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_16 */
    /* is_slave = False */
    sum_stealSide_taskOut_16_TREADY(sum_stealSide_taskOut_16_signals_.tready);
    sum_stealSide_taskOut_16_TVALID(sum_stealSide_taskOut_16_signals_.tvalid);
    sum_stealSide_taskOut_16_TDATA(sum_stealSide_taskOut_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_17 */
    /* is_slave = False */
    sum_stealSide_taskOut_17_TREADY(sum_stealSide_taskOut_17_signals_.tready);
    sum_stealSide_taskOut_17_TVALID(sum_stealSide_taskOut_17_signals_.tvalid);
    sum_stealSide_taskOut_17_TDATA(sum_stealSide_taskOut_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_18 */
    /* is_slave = False */
    sum_stealSide_taskOut_18_TREADY(sum_stealSide_taskOut_18_signals_.tready);
    sum_stealSide_taskOut_18_TVALID(sum_stealSide_taskOut_18_signals_.tvalid);
    sum_stealSide_taskOut_18_TDATA(sum_stealSide_taskOut_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_19 */
    /* is_slave = False */
    sum_stealSide_taskOut_19_TREADY(sum_stealSide_taskOut_19_signals_.tready);
    sum_stealSide_taskOut_19_TVALID(sum_stealSide_taskOut_19_signals_.tvalid);
    sum_stealSide_taskOut_19_TDATA(sum_stealSide_taskOut_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_20 */
    /* is_slave = False */
    sum_stealSide_taskOut_20_TREADY(sum_stealSide_taskOut_20_signals_.tready);
    sum_stealSide_taskOut_20_TVALID(sum_stealSide_taskOut_20_signals_.tvalid);
    sum_stealSide_taskOut_20_TDATA(sum_stealSide_taskOut_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_21 */
    /* is_slave = False */
    sum_stealSide_taskOut_21_TREADY(sum_stealSide_taskOut_21_signals_.tready);
    sum_stealSide_taskOut_21_TVALID(sum_stealSide_taskOut_21_signals_.tvalid);
    sum_stealSide_taskOut_21_TDATA(sum_stealSide_taskOut_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_22 */
    /* is_slave = False */
    sum_stealSide_taskOut_22_TREADY(sum_stealSide_taskOut_22_signals_.tready);
    sum_stealSide_taskOut_22_TVALID(sum_stealSide_taskOut_22_signals_.tvalid);
    sum_stealSide_taskOut_22_TDATA(sum_stealSide_taskOut_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_23 */
    /* is_slave = False */
    sum_stealSide_taskOut_23_TREADY(sum_stealSide_taskOut_23_signals_.tready);
    sum_stealSide_taskOut_23_TVALID(sum_stealSide_taskOut_23_signals_.tvalid);
    sum_stealSide_taskOut_23_TDATA(sum_stealSide_taskOut_23_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_24 */
    /* is_slave = False */
    sum_stealSide_taskOut_24_TREADY(sum_stealSide_taskOut_24_signals_.tready);
    sum_stealSide_taskOut_24_TVALID(sum_stealSide_taskOut_24_signals_.tvalid);
    sum_stealSide_taskOut_24_TDATA(sum_stealSide_taskOut_24_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_25 */
    /* is_slave = False */
    sum_stealSide_taskOut_25_TREADY(sum_stealSide_taskOut_25_signals_.tready);
    sum_stealSide_taskOut_25_TVALID(sum_stealSide_taskOut_25_signals_.tvalid);
    sum_stealSide_taskOut_25_TDATA(sum_stealSide_taskOut_25_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_26 */
    /* is_slave = False */
    sum_stealSide_taskOut_26_TREADY(sum_stealSide_taskOut_26_signals_.tready);
    sum_stealSide_taskOut_26_TVALID(sum_stealSide_taskOut_26_signals_.tvalid);
    sum_stealSide_taskOut_26_TDATA(sum_stealSide_taskOut_26_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_27 */
    /* is_slave = False */
    sum_stealSide_taskOut_27_TREADY(sum_stealSide_taskOut_27_signals_.tready);
    sum_stealSide_taskOut_27_TVALID(sum_stealSide_taskOut_27_signals_.tvalid);
    sum_stealSide_taskOut_27_TDATA(sum_stealSide_taskOut_27_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_28 */
    /* is_slave = False */
    sum_stealSide_taskOut_28_TREADY(sum_stealSide_taskOut_28_signals_.tready);
    sum_stealSide_taskOut_28_TVALID(sum_stealSide_taskOut_28_signals_.tvalid);
    sum_stealSide_taskOut_28_TDATA(sum_stealSide_taskOut_28_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_29 */
    /* is_slave = False */
    sum_stealSide_taskOut_29_TREADY(sum_stealSide_taskOut_29_signals_.tready);
    sum_stealSide_taskOut_29_TVALID(sum_stealSide_taskOut_29_signals_.tvalid);
    sum_stealSide_taskOut_29_TDATA(sum_stealSide_taskOut_29_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_30 */
    /* is_slave = False */
    sum_stealSide_taskOut_30_TREADY(sum_stealSide_taskOut_30_signals_.tready);
    sum_stealSide_taskOut_30_TVALID(sum_stealSide_taskOut_30_signals_.tvalid);
    sum_stealSide_taskOut_30_TDATA(sum_stealSide_taskOut_30_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_stealSide_taskOut_31 */
    /* is_slave = False */
    sum_stealSide_taskOut_31_TREADY(sum_stealSide_taskOut_31_signals_.tready);
    sum_stealSide_taskOut_31_TVALID(sum_stealSide_taskOut_31_signals_.tvalid);
    sum_stealSide_taskOut_31_TDATA(sum_stealSide_taskOut_31_signals_.tdata);
    
    
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
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_10 */
    /* is_slave = True */
    sum_syncSide_addrIn_10_TREADY(sum_syncSide_addrIn_10_signals_.tready);
    sum_syncSide_addrIn_10_TVALID(sum_syncSide_addrIn_10_signals_.tvalid);
    sum_syncSide_addrIn_10_TDATA(sum_syncSide_addrIn_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_11 */
    /* is_slave = True */
    sum_syncSide_addrIn_11_TREADY(sum_syncSide_addrIn_11_signals_.tready);
    sum_syncSide_addrIn_11_TVALID(sum_syncSide_addrIn_11_signals_.tvalid);
    sum_syncSide_addrIn_11_TDATA(sum_syncSide_addrIn_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_12 */
    /* is_slave = True */
    sum_syncSide_addrIn_12_TREADY(sum_syncSide_addrIn_12_signals_.tready);
    sum_syncSide_addrIn_12_TVALID(sum_syncSide_addrIn_12_signals_.tvalid);
    sum_syncSide_addrIn_12_TDATA(sum_syncSide_addrIn_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_13 */
    /* is_slave = True */
    sum_syncSide_addrIn_13_TREADY(sum_syncSide_addrIn_13_signals_.tready);
    sum_syncSide_addrIn_13_TVALID(sum_syncSide_addrIn_13_signals_.tvalid);
    sum_syncSide_addrIn_13_TDATA(sum_syncSide_addrIn_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_14 */
    /* is_slave = True */
    sum_syncSide_addrIn_14_TREADY(sum_syncSide_addrIn_14_signals_.tready);
    sum_syncSide_addrIn_14_TVALID(sum_syncSide_addrIn_14_signals_.tvalid);
    sum_syncSide_addrIn_14_TDATA(sum_syncSide_addrIn_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_15 */
    /* is_slave = True */
    sum_syncSide_addrIn_15_TREADY(sum_syncSide_addrIn_15_signals_.tready);
    sum_syncSide_addrIn_15_TVALID(sum_syncSide_addrIn_15_signals_.tvalid);
    sum_syncSide_addrIn_15_TDATA(sum_syncSide_addrIn_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_16 */
    /* is_slave = True */
    sum_syncSide_addrIn_16_TREADY(sum_syncSide_addrIn_16_signals_.tready);
    sum_syncSide_addrIn_16_TVALID(sum_syncSide_addrIn_16_signals_.tvalid);
    sum_syncSide_addrIn_16_TDATA(sum_syncSide_addrIn_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_17 */
    /* is_slave = True */
    sum_syncSide_addrIn_17_TREADY(sum_syncSide_addrIn_17_signals_.tready);
    sum_syncSide_addrIn_17_TVALID(sum_syncSide_addrIn_17_signals_.tvalid);
    sum_syncSide_addrIn_17_TDATA(sum_syncSide_addrIn_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_18 */
    /* is_slave = True */
    sum_syncSide_addrIn_18_TREADY(sum_syncSide_addrIn_18_signals_.tready);
    sum_syncSide_addrIn_18_TVALID(sum_syncSide_addrIn_18_signals_.tvalid);
    sum_syncSide_addrIn_18_TDATA(sum_syncSide_addrIn_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_19 */
    /* is_slave = True */
    sum_syncSide_addrIn_19_TREADY(sum_syncSide_addrIn_19_signals_.tready);
    sum_syncSide_addrIn_19_TVALID(sum_syncSide_addrIn_19_signals_.tvalid);
    sum_syncSide_addrIn_19_TDATA(sum_syncSide_addrIn_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_20 */
    /* is_slave = True */
    sum_syncSide_addrIn_20_TREADY(sum_syncSide_addrIn_20_signals_.tready);
    sum_syncSide_addrIn_20_TVALID(sum_syncSide_addrIn_20_signals_.tvalid);
    sum_syncSide_addrIn_20_TDATA(sum_syncSide_addrIn_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_21 */
    /* is_slave = True */
    sum_syncSide_addrIn_21_TREADY(sum_syncSide_addrIn_21_signals_.tready);
    sum_syncSide_addrIn_21_TVALID(sum_syncSide_addrIn_21_signals_.tvalid);
    sum_syncSide_addrIn_21_TDATA(sum_syncSide_addrIn_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_22 */
    /* is_slave = True */
    sum_syncSide_addrIn_22_TREADY(sum_syncSide_addrIn_22_signals_.tready);
    sum_syncSide_addrIn_22_TVALID(sum_syncSide_addrIn_22_signals_.tvalid);
    sum_syncSide_addrIn_22_TDATA(sum_syncSide_addrIn_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_23 */
    /* is_slave = True */
    sum_syncSide_addrIn_23_TREADY(sum_syncSide_addrIn_23_signals_.tready);
    sum_syncSide_addrIn_23_TVALID(sum_syncSide_addrIn_23_signals_.tvalid);
    sum_syncSide_addrIn_23_TDATA(sum_syncSide_addrIn_23_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_24 */
    /* is_slave = True */
    sum_syncSide_addrIn_24_TREADY(sum_syncSide_addrIn_24_signals_.tready);
    sum_syncSide_addrIn_24_TVALID(sum_syncSide_addrIn_24_signals_.tvalid);
    sum_syncSide_addrIn_24_TDATA(sum_syncSide_addrIn_24_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_25 */
    /* is_slave = True */
    sum_syncSide_addrIn_25_TREADY(sum_syncSide_addrIn_25_signals_.tready);
    sum_syncSide_addrIn_25_TVALID(sum_syncSide_addrIn_25_signals_.tvalid);
    sum_syncSide_addrIn_25_TDATA(sum_syncSide_addrIn_25_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_26 */
    /* is_slave = True */
    sum_syncSide_addrIn_26_TREADY(sum_syncSide_addrIn_26_signals_.tready);
    sum_syncSide_addrIn_26_TVALID(sum_syncSide_addrIn_26_signals_.tvalid);
    sum_syncSide_addrIn_26_TDATA(sum_syncSide_addrIn_26_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_27 */
    /* is_slave = True */
    sum_syncSide_addrIn_27_TREADY(sum_syncSide_addrIn_27_signals_.tready);
    sum_syncSide_addrIn_27_TVALID(sum_syncSide_addrIn_27_signals_.tvalid);
    sum_syncSide_addrIn_27_TDATA(sum_syncSide_addrIn_27_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_28 */
    /* is_slave = True */
    sum_syncSide_addrIn_28_TREADY(sum_syncSide_addrIn_28_signals_.tready);
    sum_syncSide_addrIn_28_TVALID(sum_syncSide_addrIn_28_signals_.tvalid);
    sum_syncSide_addrIn_28_TDATA(sum_syncSide_addrIn_28_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_29 */
    /* is_slave = True */
    sum_syncSide_addrIn_29_TREADY(sum_syncSide_addrIn_29_signals_.tready);
    sum_syncSide_addrIn_29_TVALID(sum_syncSide_addrIn_29_signals_.tvalid);
    sum_syncSide_addrIn_29_TDATA(sum_syncSide_addrIn_29_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_30 */
    /* is_slave = True */
    sum_syncSide_addrIn_30_TREADY(sum_syncSide_addrIn_30_signals_.tready);
    sum_syncSide_addrIn_30_TVALID(sum_syncSide_addrIn_30_signals_.tvalid);
    sum_syncSide_addrIn_30_TDATA(sum_syncSide_addrIn_30_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_31 */
    /* is_slave = True */
    sum_syncSide_addrIn_31_TREADY(sum_syncSide_addrIn_31_signals_.tready);
    sum_syncSide_addrIn_31_TVALID(sum_syncSide_addrIn_31_signals_.tvalid);
    sum_syncSide_addrIn_31_TDATA(sum_syncSide_addrIn_31_signals_.tdata);
    
    
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
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_5 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_5_TREADY(sum_continuationAllocationSide_contOut_5_signals_.tready);
    sum_continuationAllocationSide_contOut_5_TVALID(sum_continuationAllocationSide_contOut_5_signals_.tvalid);
    sum_continuationAllocationSide_contOut_5_TDATA(sum_continuationAllocationSide_contOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_6 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_6_TREADY(sum_continuationAllocationSide_contOut_6_signals_.tready);
    sum_continuationAllocationSide_contOut_6_TVALID(sum_continuationAllocationSide_contOut_6_signals_.tvalid);
    sum_continuationAllocationSide_contOut_6_TDATA(sum_continuationAllocationSide_contOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_7 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_7_TREADY(sum_continuationAllocationSide_contOut_7_signals_.tready);
    sum_continuationAllocationSide_contOut_7_TVALID(sum_continuationAllocationSide_contOut_7_signals_.tvalid);
    sum_continuationAllocationSide_contOut_7_TDATA(sum_continuationAllocationSide_contOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_8 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_8_TREADY(sum_continuationAllocationSide_contOut_8_signals_.tready);
    sum_continuationAllocationSide_contOut_8_TVALID(sum_continuationAllocationSide_contOut_8_signals_.tvalid);
    sum_continuationAllocationSide_contOut_8_TDATA(sum_continuationAllocationSide_contOut_8_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_9 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_9_TREADY(sum_continuationAllocationSide_contOut_9_signals_.tready);
    sum_continuationAllocationSide_contOut_9_TVALID(sum_continuationAllocationSide_contOut_9_signals_.tvalid);
    sum_continuationAllocationSide_contOut_9_TDATA(sum_continuationAllocationSide_contOut_9_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_10 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_10_TREADY(sum_continuationAllocationSide_contOut_10_signals_.tready);
    sum_continuationAllocationSide_contOut_10_TVALID(sum_continuationAllocationSide_contOut_10_signals_.tvalid);
    sum_continuationAllocationSide_contOut_10_TDATA(sum_continuationAllocationSide_contOut_10_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_11 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_11_TREADY(sum_continuationAllocationSide_contOut_11_signals_.tready);
    sum_continuationAllocationSide_contOut_11_TVALID(sum_continuationAllocationSide_contOut_11_signals_.tvalid);
    sum_continuationAllocationSide_contOut_11_TDATA(sum_continuationAllocationSide_contOut_11_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_12 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_12_TREADY(sum_continuationAllocationSide_contOut_12_signals_.tready);
    sum_continuationAllocationSide_contOut_12_TVALID(sum_continuationAllocationSide_contOut_12_signals_.tvalid);
    sum_continuationAllocationSide_contOut_12_TDATA(sum_continuationAllocationSide_contOut_12_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_13 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_13_TREADY(sum_continuationAllocationSide_contOut_13_signals_.tready);
    sum_continuationAllocationSide_contOut_13_TVALID(sum_continuationAllocationSide_contOut_13_signals_.tvalid);
    sum_continuationAllocationSide_contOut_13_TDATA(sum_continuationAllocationSide_contOut_13_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_14 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_14_TREADY(sum_continuationAllocationSide_contOut_14_signals_.tready);
    sum_continuationAllocationSide_contOut_14_TVALID(sum_continuationAllocationSide_contOut_14_signals_.tvalid);
    sum_continuationAllocationSide_contOut_14_TDATA(sum_continuationAllocationSide_contOut_14_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_15 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_15_TREADY(sum_continuationAllocationSide_contOut_15_signals_.tready);
    sum_continuationAllocationSide_contOut_15_TVALID(sum_continuationAllocationSide_contOut_15_signals_.tvalid);
    sum_continuationAllocationSide_contOut_15_TDATA(sum_continuationAllocationSide_contOut_15_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_16 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_16_TREADY(sum_continuationAllocationSide_contOut_16_signals_.tready);
    sum_continuationAllocationSide_contOut_16_TVALID(sum_continuationAllocationSide_contOut_16_signals_.tvalid);
    sum_continuationAllocationSide_contOut_16_TDATA(sum_continuationAllocationSide_contOut_16_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_17 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_17_TREADY(sum_continuationAllocationSide_contOut_17_signals_.tready);
    sum_continuationAllocationSide_contOut_17_TVALID(sum_continuationAllocationSide_contOut_17_signals_.tvalid);
    sum_continuationAllocationSide_contOut_17_TDATA(sum_continuationAllocationSide_contOut_17_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_18 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_18_TREADY(sum_continuationAllocationSide_contOut_18_signals_.tready);
    sum_continuationAllocationSide_contOut_18_TVALID(sum_continuationAllocationSide_contOut_18_signals_.tvalid);
    sum_continuationAllocationSide_contOut_18_TDATA(sum_continuationAllocationSide_contOut_18_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_19 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_19_TREADY(sum_continuationAllocationSide_contOut_19_signals_.tready);
    sum_continuationAllocationSide_contOut_19_TVALID(sum_continuationAllocationSide_contOut_19_signals_.tvalid);
    sum_continuationAllocationSide_contOut_19_TDATA(sum_continuationAllocationSide_contOut_19_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_20 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_20_TREADY(sum_continuationAllocationSide_contOut_20_signals_.tready);
    sum_continuationAllocationSide_contOut_20_TVALID(sum_continuationAllocationSide_contOut_20_signals_.tvalid);
    sum_continuationAllocationSide_contOut_20_TDATA(sum_continuationAllocationSide_contOut_20_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_21 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_21_TREADY(sum_continuationAllocationSide_contOut_21_signals_.tready);
    sum_continuationAllocationSide_contOut_21_TVALID(sum_continuationAllocationSide_contOut_21_signals_.tvalid);
    sum_continuationAllocationSide_contOut_21_TDATA(sum_continuationAllocationSide_contOut_21_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_22 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_22_TREADY(sum_continuationAllocationSide_contOut_22_signals_.tready);
    sum_continuationAllocationSide_contOut_22_TVALID(sum_continuationAllocationSide_contOut_22_signals_.tvalid);
    sum_continuationAllocationSide_contOut_22_TDATA(sum_continuationAllocationSide_contOut_22_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_23 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_23_TREADY(sum_continuationAllocationSide_contOut_23_signals_.tready);
    sum_continuationAllocationSide_contOut_23_TVALID(sum_continuationAllocationSide_contOut_23_signals_.tvalid);
    sum_continuationAllocationSide_contOut_23_TDATA(sum_continuationAllocationSide_contOut_23_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_24 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_24_TREADY(sum_continuationAllocationSide_contOut_24_signals_.tready);
    sum_continuationAllocationSide_contOut_24_TVALID(sum_continuationAllocationSide_contOut_24_signals_.tvalid);
    sum_continuationAllocationSide_contOut_24_TDATA(sum_continuationAllocationSide_contOut_24_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_25 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_25_TREADY(sum_continuationAllocationSide_contOut_25_signals_.tready);
    sum_continuationAllocationSide_contOut_25_TVALID(sum_continuationAllocationSide_contOut_25_signals_.tvalid);
    sum_continuationAllocationSide_contOut_25_TDATA(sum_continuationAllocationSide_contOut_25_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_26 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_26_TREADY(sum_continuationAllocationSide_contOut_26_signals_.tready);
    sum_continuationAllocationSide_contOut_26_TVALID(sum_continuationAllocationSide_contOut_26_signals_.tvalid);
    sum_continuationAllocationSide_contOut_26_TDATA(sum_continuationAllocationSide_contOut_26_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_27 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_27_TREADY(sum_continuationAllocationSide_contOut_27_signals_.tready);
    sum_continuationAllocationSide_contOut_27_TVALID(sum_continuationAllocationSide_contOut_27_signals_.tvalid);
    sum_continuationAllocationSide_contOut_27_TDATA(sum_continuationAllocationSide_contOut_27_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_28 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_28_TREADY(sum_continuationAllocationSide_contOut_28_signals_.tready);
    sum_continuationAllocationSide_contOut_28_TVALID(sum_continuationAllocationSide_contOut_28_signals_.tvalid);
    sum_continuationAllocationSide_contOut_28_TDATA(sum_continuationAllocationSide_contOut_28_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_29 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_29_TREADY(sum_continuationAllocationSide_contOut_29_signals_.tready);
    sum_continuationAllocationSide_contOut_29_TVALID(sum_continuationAllocationSide_contOut_29_signals_.tvalid);
    sum_continuationAllocationSide_contOut_29_TDATA(sum_continuationAllocationSide_contOut_29_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_30 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_30_TREADY(sum_continuationAllocationSide_contOut_30_signals_.tready);
    sum_continuationAllocationSide_contOut_30_TVALID(sum_continuationAllocationSide_contOut_30_signals_.tvalid);
    sum_continuationAllocationSide_contOut_30_TDATA(sum_continuationAllocationSide_contOut_30_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_continuationAllocationSide_contOut_31 */
    /* is_slave = False */
    sum_continuationAllocationSide_contOut_31_TREADY(sum_continuationAllocationSide_contOut_31_signals_.tready);
    sum_continuationAllocationSide_contOut_31_TVALID(sum_continuationAllocationSide_contOut_31_signals_.tvalid);
    sum_continuationAllocationSide_contOut_31_TDATA(sum_continuationAllocationSide_contOut_31_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_32 */
    /* is_slave = True */
    sum_syncSide_addrIn_32_TREADY(sum_syncSide_addrIn_32_signals_.tready);
    sum_syncSide_addrIn_32_TVALID(sum_syncSide_addrIn_32_signals_.tvalid);
    sum_syncSide_addrIn_32_TDATA(sum_syncSide_addrIn_32_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_33 */
    /* is_slave = True */
    sum_syncSide_addrIn_33_TREADY(sum_syncSide_addrIn_33_signals_.tready);
    sum_syncSide_addrIn_33_TVALID(sum_syncSide_addrIn_33_signals_.tvalid);
    sum_syncSide_addrIn_33_TDATA(sum_syncSide_addrIn_33_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_34 */
    /* is_slave = True */
    sum_syncSide_addrIn_34_TREADY(sum_syncSide_addrIn_34_signals_.tready);
    sum_syncSide_addrIn_34_TVALID(sum_syncSide_addrIn_34_signals_.tvalid);
    sum_syncSide_addrIn_34_TDATA(sum_syncSide_addrIn_34_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_35 */
    /* is_slave = True */
    sum_syncSide_addrIn_35_TREADY(sum_syncSide_addrIn_35_signals_.tready);
    sum_syncSide_addrIn_35_TVALID(sum_syncSide_addrIn_35_signals_.tvalid);
    sum_syncSide_addrIn_35_TDATA(sum_syncSide_addrIn_35_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_36 */
    /* is_slave = True */
    sum_syncSide_addrIn_36_TREADY(sum_syncSide_addrIn_36_signals_.tready);
    sum_syncSide_addrIn_36_TVALID(sum_syncSide_addrIn_36_signals_.tvalid);
    sum_syncSide_addrIn_36_TDATA(sum_syncSide_addrIn_36_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_37 */
    /* is_slave = True */
    sum_syncSide_addrIn_37_TREADY(sum_syncSide_addrIn_37_signals_.tready);
    sum_syncSide_addrIn_37_TVALID(sum_syncSide_addrIn_37_signals_.tvalid);
    sum_syncSide_addrIn_37_TDATA(sum_syncSide_addrIn_37_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_38 */
    /* is_slave = True */
    sum_syncSide_addrIn_38_TREADY(sum_syncSide_addrIn_38_signals_.tready);
    sum_syncSide_addrIn_38_TVALID(sum_syncSide_addrIn_38_signals_.tvalid);
    sum_syncSide_addrIn_38_TDATA(sum_syncSide_addrIn_38_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_39 */
    /* is_slave = True */
    sum_syncSide_addrIn_39_TREADY(sum_syncSide_addrIn_39_signals_.tready);
    sum_syncSide_addrIn_39_TVALID(sum_syncSide_addrIn_39_signals_.tvalid);
    sum_syncSide_addrIn_39_TDATA(sum_syncSide_addrIn_39_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_40 */
    /* is_slave = True */
    sum_syncSide_addrIn_40_TREADY(sum_syncSide_addrIn_40_signals_.tready);
    sum_syncSide_addrIn_40_TVALID(sum_syncSide_addrIn_40_signals_.tvalid);
    sum_syncSide_addrIn_40_TDATA(sum_syncSide_addrIn_40_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_41 */
    /* is_slave = True */
    sum_syncSide_addrIn_41_TREADY(sum_syncSide_addrIn_41_signals_.tready);
    sum_syncSide_addrIn_41_TVALID(sum_syncSide_addrIn_41_signals_.tvalid);
    sum_syncSide_addrIn_41_TDATA(sum_syncSide_addrIn_41_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_42 */
    /* is_slave = True */
    sum_syncSide_addrIn_42_TREADY(sum_syncSide_addrIn_42_signals_.tready);
    sum_syncSide_addrIn_42_TVALID(sum_syncSide_addrIn_42_signals_.tvalid);
    sum_syncSide_addrIn_42_TDATA(sum_syncSide_addrIn_42_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_43 */
    /* is_slave = True */
    sum_syncSide_addrIn_43_TREADY(sum_syncSide_addrIn_43_signals_.tready);
    sum_syncSide_addrIn_43_TVALID(sum_syncSide_addrIn_43_signals_.tvalid);
    sum_syncSide_addrIn_43_TDATA(sum_syncSide_addrIn_43_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_44 */
    /* is_slave = True */
    sum_syncSide_addrIn_44_TREADY(sum_syncSide_addrIn_44_signals_.tready);
    sum_syncSide_addrIn_44_TVALID(sum_syncSide_addrIn_44_signals_.tvalid);
    sum_syncSide_addrIn_44_TDATA(sum_syncSide_addrIn_44_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_45 */
    /* is_slave = True */
    sum_syncSide_addrIn_45_TREADY(sum_syncSide_addrIn_45_signals_.tready);
    sum_syncSide_addrIn_45_TVALID(sum_syncSide_addrIn_45_signals_.tvalid);
    sum_syncSide_addrIn_45_TDATA(sum_syncSide_addrIn_45_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_46 */
    /* is_slave = True */
    sum_syncSide_addrIn_46_TREADY(sum_syncSide_addrIn_46_signals_.tready);
    sum_syncSide_addrIn_46_TVALID(sum_syncSide_addrIn_46_signals_.tvalid);
    sum_syncSide_addrIn_46_TDATA(sum_syncSide_addrIn_46_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_47 */
    /* is_slave = True */
    sum_syncSide_addrIn_47_TREADY(sum_syncSide_addrIn_47_signals_.tready);
    sum_syncSide_addrIn_47_TVALID(sum_syncSide_addrIn_47_signals_.tvalid);
    sum_syncSide_addrIn_47_TDATA(sum_syncSide_addrIn_47_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_48 */
    /* is_slave = True */
    sum_syncSide_addrIn_48_TREADY(sum_syncSide_addrIn_48_signals_.tready);
    sum_syncSide_addrIn_48_TVALID(sum_syncSide_addrIn_48_signals_.tvalid);
    sum_syncSide_addrIn_48_TDATA(sum_syncSide_addrIn_48_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_49 */
    /* is_slave = True */
    sum_syncSide_addrIn_49_TREADY(sum_syncSide_addrIn_49_signals_.tready);
    sum_syncSide_addrIn_49_TVALID(sum_syncSide_addrIn_49_signals_.tvalid);
    sum_syncSide_addrIn_49_TDATA(sum_syncSide_addrIn_49_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_50 */
    /* is_slave = True */
    sum_syncSide_addrIn_50_TREADY(sum_syncSide_addrIn_50_signals_.tready);
    sum_syncSide_addrIn_50_TVALID(sum_syncSide_addrIn_50_signals_.tvalid);
    sum_syncSide_addrIn_50_TDATA(sum_syncSide_addrIn_50_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_51 */
    /* is_slave = True */
    sum_syncSide_addrIn_51_TREADY(sum_syncSide_addrIn_51_signals_.tready);
    sum_syncSide_addrIn_51_TVALID(sum_syncSide_addrIn_51_signals_.tvalid);
    sum_syncSide_addrIn_51_TDATA(sum_syncSide_addrIn_51_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_52 */
    /* is_slave = True */
    sum_syncSide_addrIn_52_TREADY(sum_syncSide_addrIn_52_signals_.tready);
    sum_syncSide_addrIn_52_TVALID(sum_syncSide_addrIn_52_signals_.tvalid);
    sum_syncSide_addrIn_52_TDATA(sum_syncSide_addrIn_52_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_53 */
    /* is_slave = True */
    sum_syncSide_addrIn_53_TREADY(sum_syncSide_addrIn_53_signals_.tready);
    sum_syncSide_addrIn_53_TVALID(sum_syncSide_addrIn_53_signals_.tvalid);
    sum_syncSide_addrIn_53_TDATA(sum_syncSide_addrIn_53_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_54 */
    /* is_slave = True */
    sum_syncSide_addrIn_54_TREADY(sum_syncSide_addrIn_54_signals_.tready);
    sum_syncSide_addrIn_54_TVALID(sum_syncSide_addrIn_54_signals_.tvalid);
    sum_syncSide_addrIn_54_TDATA(sum_syncSide_addrIn_54_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_55 */
    /* is_slave = True */
    sum_syncSide_addrIn_55_TREADY(sum_syncSide_addrIn_55_signals_.tready);
    sum_syncSide_addrIn_55_TVALID(sum_syncSide_addrIn_55_signals_.tvalid);
    sum_syncSide_addrIn_55_TDATA(sum_syncSide_addrIn_55_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_56 */
    /* is_slave = True */
    sum_syncSide_addrIn_56_TREADY(sum_syncSide_addrIn_56_signals_.tready);
    sum_syncSide_addrIn_56_TVALID(sum_syncSide_addrIn_56_signals_.tvalid);
    sum_syncSide_addrIn_56_TDATA(sum_syncSide_addrIn_56_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_57 */
    /* is_slave = True */
    sum_syncSide_addrIn_57_TREADY(sum_syncSide_addrIn_57_signals_.tready);
    sum_syncSide_addrIn_57_TVALID(sum_syncSide_addrIn_57_signals_.tvalid);
    sum_syncSide_addrIn_57_TDATA(sum_syncSide_addrIn_57_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_58 */
    /* is_slave = True */
    sum_syncSide_addrIn_58_TREADY(sum_syncSide_addrIn_58_signals_.tready);
    sum_syncSide_addrIn_58_TVALID(sum_syncSide_addrIn_58_signals_.tvalid);
    sum_syncSide_addrIn_58_TDATA(sum_syncSide_addrIn_58_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_59 */
    /* is_slave = True */
    sum_syncSide_addrIn_59_TREADY(sum_syncSide_addrIn_59_signals_.tready);
    sum_syncSide_addrIn_59_TVALID(sum_syncSide_addrIn_59_signals_.tvalid);
    sum_syncSide_addrIn_59_TDATA(sum_syncSide_addrIn_59_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_60 */
    /* is_slave = True */
    sum_syncSide_addrIn_60_TREADY(sum_syncSide_addrIn_60_signals_.tready);
    sum_syncSide_addrIn_60_TVALID(sum_syncSide_addrIn_60_signals_.tvalid);
    sum_syncSide_addrIn_60_TDATA(sum_syncSide_addrIn_60_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_61 */
    /* is_slave = True */
    sum_syncSide_addrIn_61_TREADY(sum_syncSide_addrIn_61_signals_.tready);
    sum_syncSide_addrIn_61_TVALID(sum_syncSide_addrIn_61_signals_.tvalid);
    sum_syncSide_addrIn_61_TDATA(sum_syncSide_addrIn_61_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_62 */
    /* is_slave = True */
    sum_syncSide_addrIn_62_TREADY(sum_syncSide_addrIn_62_signals_.tready);
    sum_syncSide_addrIn_62_TVALID(sum_syncSide_addrIn_62_signals_.tvalid);
    sum_syncSide_addrIn_62_TDATA(sum_syncSide_addrIn_62_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: sum_syncSide_addrIn_63 */
    /* is_slave = True */
    sum_syncSide_addrIn_63_TREADY(sum_syncSide_addrIn_63_signals_.tready);
    sum_syncSide_addrIn_63_TVALID(sum_syncSide_addrIn_63_signals_.tvalid);
    sum_syncSide_addrIn_63_TDATA(sum_syncSide_addrIn_63_signals_.tdata);
    
    
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

void fibonacci__peCountFib_32__peCountSum_32::do_init_()
{
    set("clock", clock);
    set("reset", reset);
    set("description", description);
}

hardcilk::desc::HardCilkSystem fibonacci__peCountFib_32__peCountSum_32::description = [] {
    using namespace hardcilk::desc;
    auto description = HardCilkSystem{
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
                .numProcessingElements = 32,
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
                    r["pe_5"] = ProcessingElement{
                        .name = "pe_5",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_5",
                        .portName = "fib_PE_5",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_5",
                                .path = "/tasks:fib/processingElements:pe_5/interfaces:mem",
                                .portName = "fib_PE_5_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_5",
                                .path = "/tasks:fib/processingElements:pe_5/interfaces:taskIn",
                                .portName = "fib_PE_5_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_5",
                                .path = "/tasks:fib/processingElements:pe_5/interfaces:taskOut",
                                .portName = "fib_PE_5_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_5",
                                .path = "/tasks:fib/processingElements:pe_5/interfaces:contOut_sum",
                                .portName = "fib_PE_5_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_5",
                                .path = "/tasks:fib/processingElements:pe_5/interfaces:addrIn_sum",
                                .portName = "fib_PE_5_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_6",
                        .portName = "fib_PE_6",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_6",
                                .path = "/tasks:fib/processingElements:pe_6/interfaces:mem",
                                .portName = "fib_PE_6_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_6",
                                .path = "/tasks:fib/processingElements:pe_6/interfaces:taskIn",
                                .portName = "fib_PE_6_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_6",
                                .path = "/tasks:fib/processingElements:pe_6/interfaces:taskOut",
                                .portName = "fib_PE_6_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_6",
                                .path = "/tasks:fib/processingElements:pe_6/interfaces:contOut_sum",
                                .portName = "fib_PE_6_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_6",
                                .path = "/tasks:fib/processingElements:pe_6/interfaces:addrIn_sum",
                                .portName = "fib_PE_6_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_7",
                        .portName = "fib_PE_7",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_7",
                                .path = "/tasks:fib/processingElements:pe_7/interfaces:mem",
                                .portName = "fib_PE_7_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_7",
                                .path = "/tasks:fib/processingElements:pe_7/interfaces:taskIn",
                                .portName = "fib_PE_7_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_7",
                                .path = "/tasks:fib/processingElements:pe_7/interfaces:taskOut",
                                .portName = "fib_PE_7_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_7",
                                .path = "/tasks:fib/processingElements:pe_7/interfaces:contOut_sum",
                                .portName = "fib_PE_7_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_7",
                                .path = "/tasks:fib/processingElements:pe_7/interfaces:addrIn_sum",
                                .portName = "fib_PE_7_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_8",
                        .portName = "fib_PE_8",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_8",
                                .path = "/tasks:fib/processingElements:pe_8/interfaces:mem",
                                .portName = "fib_PE_8_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_8",
                                .path = "/tasks:fib/processingElements:pe_8/interfaces:taskIn",
                                .portName = "fib_PE_8_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_8",
                                .path = "/tasks:fib/processingElements:pe_8/interfaces:taskOut",
                                .portName = "fib_PE_8_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_8",
                                .path = "/tasks:fib/processingElements:pe_8/interfaces:contOut_sum",
                                .portName = "fib_PE_8_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_8",
                                .path = "/tasks:fib/processingElements:pe_8/interfaces:addrIn_sum",
                                .portName = "fib_PE_8_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_9",
                        .portName = "fib_PE_9",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_9",
                                .path = "/tasks:fib/processingElements:pe_9/interfaces:mem",
                                .portName = "fib_PE_9_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_9",
                                .path = "/tasks:fib/processingElements:pe_9/interfaces:taskIn",
                                .portName = "fib_PE_9_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_9",
                                .path = "/tasks:fib/processingElements:pe_9/interfaces:taskOut",
                                .portName = "fib_PE_9_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_9",
                                .path = "/tasks:fib/processingElements:pe_9/interfaces:contOut_sum",
                                .portName = "fib_PE_9_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_9",
                                .path = "/tasks:fib/processingElements:pe_9/interfaces:addrIn_sum",
                                .portName = "fib_PE_9_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_10",
                        .portName = "fib_PE_10",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_10",
                                .path = "/tasks:fib/processingElements:pe_10/interfaces:mem",
                                .portName = "fib_PE_10_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_10",
                                .path = "/tasks:fib/processingElements:pe_10/interfaces:taskIn",
                                .portName = "fib_PE_10_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_10",
                                .path = "/tasks:fib/processingElements:pe_10/interfaces:taskOut",
                                .portName = "fib_PE_10_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_10",
                                .path = "/tasks:fib/processingElements:pe_10/interfaces:contOut_sum",
                                .portName = "fib_PE_10_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_10",
                                .path = "/tasks:fib/processingElements:pe_10/interfaces:addrIn_sum",
                                .portName = "fib_PE_10_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_11",
                        .portName = "fib_PE_11",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_11",
                                .path = "/tasks:fib/processingElements:pe_11/interfaces:mem",
                                .portName = "fib_PE_11_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_11",
                                .path = "/tasks:fib/processingElements:pe_11/interfaces:taskIn",
                                .portName = "fib_PE_11_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_11",
                                .path = "/tasks:fib/processingElements:pe_11/interfaces:taskOut",
                                .portName = "fib_PE_11_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_11",
                                .path = "/tasks:fib/processingElements:pe_11/interfaces:contOut_sum",
                                .portName = "fib_PE_11_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_11",
                                .path = "/tasks:fib/processingElements:pe_11/interfaces:addrIn_sum",
                                .portName = "fib_PE_11_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_12",
                        .portName = "fib_PE_12",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_12",
                                .path = "/tasks:fib/processingElements:pe_12/interfaces:mem",
                                .portName = "fib_PE_12_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_12",
                                .path = "/tasks:fib/processingElements:pe_12/interfaces:taskIn",
                                .portName = "fib_PE_12_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_12",
                                .path = "/tasks:fib/processingElements:pe_12/interfaces:taskOut",
                                .portName = "fib_PE_12_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_12",
                                .path = "/tasks:fib/processingElements:pe_12/interfaces:contOut_sum",
                                .portName = "fib_PE_12_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_12",
                                .path = "/tasks:fib/processingElements:pe_12/interfaces:addrIn_sum",
                                .portName = "fib_PE_12_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_13",
                        .portName = "fib_PE_13",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_13",
                                .path = "/tasks:fib/processingElements:pe_13/interfaces:mem",
                                .portName = "fib_PE_13_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_13",
                                .path = "/tasks:fib/processingElements:pe_13/interfaces:taskIn",
                                .portName = "fib_PE_13_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_13",
                                .path = "/tasks:fib/processingElements:pe_13/interfaces:taskOut",
                                .portName = "fib_PE_13_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_13",
                                .path = "/tasks:fib/processingElements:pe_13/interfaces:contOut_sum",
                                .portName = "fib_PE_13_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_13",
                                .path = "/tasks:fib/processingElements:pe_13/interfaces:addrIn_sum",
                                .portName = "fib_PE_13_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_14",
                        .portName = "fib_PE_14",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_14",
                                .path = "/tasks:fib/processingElements:pe_14/interfaces:mem",
                                .portName = "fib_PE_14_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_14",
                                .path = "/tasks:fib/processingElements:pe_14/interfaces:taskIn",
                                .portName = "fib_PE_14_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_14",
                                .path = "/tasks:fib/processingElements:pe_14/interfaces:taskOut",
                                .portName = "fib_PE_14_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_14",
                                .path = "/tasks:fib/processingElements:pe_14/interfaces:contOut_sum",
                                .portName = "fib_PE_14_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_14",
                                .path = "/tasks:fib/processingElements:pe_14/interfaces:addrIn_sum",
                                .portName = "fib_PE_14_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_15",
                        .portName = "fib_PE_15",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_15",
                                .path = "/tasks:fib/processingElements:pe_15/interfaces:mem",
                                .portName = "fib_PE_15_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_15",
                                .path = "/tasks:fib/processingElements:pe_15/interfaces:taskIn",
                                .portName = "fib_PE_15_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_15",
                                .path = "/tasks:fib/processingElements:pe_15/interfaces:taskOut",
                                .portName = "fib_PE_15_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_15",
                                .path = "/tasks:fib/processingElements:pe_15/interfaces:contOut_sum",
                                .portName = "fib_PE_15_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_15",
                                .path = "/tasks:fib/processingElements:pe_15/interfaces:addrIn_sum",
                                .portName = "fib_PE_15_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_16",
                        .portName = "fib_PE_16",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_16",
                                .path = "/tasks:fib/processingElements:pe_16/interfaces:mem",
                                .portName = "fib_PE_16_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_16",
                                .path = "/tasks:fib/processingElements:pe_16/interfaces:taskIn",
                                .portName = "fib_PE_16_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_16",
                                .path = "/tasks:fib/processingElements:pe_16/interfaces:taskOut",
                                .portName = "fib_PE_16_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_16",
                                .path = "/tasks:fib/processingElements:pe_16/interfaces:contOut_sum",
                                .portName = "fib_PE_16_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_16",
                                .path = "/tasks:fib/processingElements:pe_16/interfaces:addrIn_sum",
                                .portName = "fib_PE_16_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_17",
                        .portName = "fib_PE_17",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_17",
                                .path = "/tasks:fib/processingElements:pe_17/interfaces:mem",
                                .portName = "fib_PE_17_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_17",
                                .path = "/tasks:fib/processingElements:pe_17/interfaces:taskIn",
                                .portName = "fib_PE_17_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_17",
                                .path = "/tasks:fib/processingElements:pe_17/interfaces:taskOut",
                                .portName = "fib_PE_17_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_17",
                                .path = "/tasks:fib/processingElements:pe_17/interfaces:contOut_sum",
                                .portName = "fib_PE_17_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_17",
                                .path = "/tasks:fib/processingElements:pe_17/interfaces:addrIn_sum",
                                .portName = "fib_PE_17_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_18",
                        .portName = "fib_PE_18",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_18",
                                .path = "/tasks:fib/processingElements:pe_18/interfaces:mem",
                                .portName = "fib_PE_18_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_18",
                                .path = "/tasks:fib/processingElements:pe_18/interfaces:taskIn",
                                .portName = "fib_PE_18_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_18",
                                .path = "/tasks:fib/processingElements:pe_18/interfaces:taskOut",
                                .portName = "fib_PE_18_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_18",
                                .path = "/tasks:fib/processingElements:pe_18/interfaces:contOut_sum",
                                .portName = "fib_PE_18_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_18",
                                .path = "/tasks:fib/processingElements:pe_18/interfaces:addrIn_sum",
                                .portName = "fib_PE_18_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_19",
                        .portName = "fib_PE_19",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_19",
                                .path = "/tasks:fib/processingElements:pe_19/interfaces:mem",
                                .portName = "fib_PE_19_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_19",
                                .path = "/tasks:fib/processingElements:pe_19/interfaces:taskIn",
                                .portName = "fib_PE_19_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_19",
                                .path = "/tasks:fib/processingElements:pe_19/interfaces:taskOut",
                                .portName = "fib_PE_19_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_19",
                                .path = "/tasks:fib/processingElements:pe_19/interfaces:contOut_sum",
                                .portName = "fib_PE_19_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_19",
                                .path = "/tasks:fib/processingElements:pe_19/interfaces:addrIn_sum",
                                .portName = "fib_PE_19_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_20",
                        .portName = "fib_PE_20",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_20",
                                .path = "/tasks:fib/processingElements:pe_20/interfaces:mem",
                                .portName = "fib_PE_20_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_20",
                                .path = "/tasks:fib/processingElements:pe_20/interfaces:taskIn",
                                .portName = "fib_PE_20_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_20",
                                .path = "/tasks:fib/processingElements:pe_20/interfaces:taskOut",
                                .portName = "fib_PE_20_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_20",
                                .path = "/tasks:fib/processingElements:pe_20/interfaces:contOut_sum",
                                .portName = "fib_PE_20_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_20",
                                .path = "/tasks:fib/processingElements:pe_20/interfaces:addrIn_sum",
                                .portName = "fib_PE_20_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_21",
                        .portName = "fib_PE_21",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_21",
                                .path = "/tasks:fib/processingElements:pe_21/interfaces:mem",
                                .portName = "fib_PE_21_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_21",
                                .path = "/tasks:fib/processingElements:pe_21/interfaces:taskIn",
                                .portName = "fib_PE_21_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_21",
                                .path = "/tasks:fib/processingElements:pe_21/interfaces:taskOut",
                                .portName = "fib_PE_21_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_21",
                                .path = "/tasks:fib/processingElements:pe_21/interfaces:contOut_sum",
                                .portName = "fib_PE_21_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_21",
                                .path = "/tasks:fib/processingElements:pe_21/interfaces:addrIn_sum",
                                .portName = "fib_PE_21_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_22",
                        .portName = "fib_PE_22",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_22",
                                .path = "/tasks:fib/processingElements:pe_22/interfaces:mem",
                                .portName = "fib_PE_22_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_22",
                                .path = "/tasks:fib/processingElements:pe_22/interfaces:taskIn",
                                .portName = "fib_PE_22_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_22",
                                .path = "/tasks:fib/processingElements:pe_22/interfaces:taskOut",
                                .portName = "fib_PE_22_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_22",
                                .path = "/tasks:fib/processingElements:pe_22/interfaces:contOut_sum",
                                .portName = "fib_PE_22_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_22",
                                .path = "/tasks:fib/processingElements:pe_22/interfaces:addrIn_sum",
                                .portName = "fib_PE_22_addrIn_sum",
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
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_23",
                        .portName = "fib_PE_23",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_23",
                                .path = "/tasks:fib/processingElements:pe_23/interfaces:mem",
                                .portName = "fib_PE_23_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_23",
                                .path = "/tasks:fib/processingElements:pe_23/interfaces:taskIn",
                                .portName = "fib_PE_23_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_23",
                                .path = "/tasks:fib/processingElements:pe_23/interfaces:taskOut",
                                .portName = "fib_PE_23_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_23",
                                .path = "/tasks:fib/processingElements:pe_23/interfaces:contOut_sum",
                                .portName = "fib_PE_23_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_23",
                                .path = "/tasks:fib/processingElements:pe_23/interfaces:addrIn_sum",
                                .portName = "fib_PE_23_addrIn_sum",
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
                    r["pe_24"] = ProcessingElement{
                        .name = "pe_24",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_24",
                        .portName = "fib_PE_24",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_24",
                                .path = "/tasks:fib/processingElements:pe_24/interfaces:mem",
                                .portName = "fib_PE_24_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_24",
                                .path = "/tasks:fib/processingElements:pe_24/interfaces:taskIn",
                                .portName = "fib_PE_24_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_24",
                                .path = "/tasks:fib/processingElements:pe_24/interfaces:taskOut",
                                .portName = "fib_PE_24_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_24",
                                .path = "/tasks:fib/processingElements:pe_24/interfaces:contOut_sum",
                                .portName = "fib_PE_24_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_24",
                                .path = "/tasks:fib/processingElements:pe_24/interfaces:addrIn_sum",
                                .portName = "fib_PE_24_addrIn_sum",
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
                    r["pe_25"] = ProcessingElement{
                        .name = "pe_25",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_25",
                        .portName = "fib_PE_25",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_25",
                                .path = "/tasks:fib/processingElements:pe_25/interfaces:mem",
                                .portName = "fib_PE_25_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_25",
                                .path = "/tasks:fib/processingElements:pe_25/interfaces:taskIn",
                                .portName = "fib_PE_25_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_25",
                                .path = "/tasks:fib/processingElements:pe_25/interfaces:taskOut",
                                .portName = "fib_PE_25_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_25",
                                .path = "/tasks:fib/processingElements:pe_25/interfaces:contOut_sum",
                                .portName = "fib_PE_25_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_25",
                                .path = "/tasks:fib/processingElements:pe_25/interfaces:addrIn_sum",
                                .portName = "fib_PE_25_addrIn_sum",
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
                    r["pe_26"] = ProcessingElement{
                        .name = "pe_26",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_26",
                        .portName = "fib_PE_26",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_26",
                                .path = "/tasks:fib/processingElements:pe_26/interfaces:mem",
                                .portName = "fib_PE_26_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_26",
                                .path = "/tasks:fib/processingElements:pe_26/interfaces:taskIn",
                                .portName = "fib_PE_26_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_26",
                                .path = "/tasks:fib/processingElements:pe_26/interfaces:taskOut",
                                .portName = "fib_PE_26_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_26",
                                .path = "/tasks:fib/processingElements:pe_26/interfaces:contOut_sum",
                                .portName = "fib_PE_26_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_26",
                                .path = "/tasks:fib/processingElements:pe_26/interfaces:addrIn_sum",
                                .portName = "fib_PE_26_addrIn_sum",
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
                    r["pe_27"] = ProcessingElement{
                        .name = "pe_27",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_27",
                        .portName = "fib_PE_27",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_27",
                                .path = "/tasks:fib/processingElements:pe_27/interfaces:mem",
                                .portName = "fib_PE_27_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_27",
                                .path = "/tasks:fib/processingElements:pe_27/interfaces:taskIn",
                                .portName = "fib_PE_27_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_27",
                                .path = "/tasks:fib/processingElements:pe_27/interfaces:taskOut",
                                .portName = "fib_PE_27_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_27",
                                .path = "/tasks:fib/processingElements:pe_27/interfaces:contOut_sum",
                                .portName = "fib_PE_27_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_27",
                                .path = "/tasks:fib/processingElements:pe_27/interfaces:addrIn_sum",
                                .portName = "fib_PE_27_addrIn_sum",
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
                    r["pe_28"] = ProcessingElement{
                        .name = "pe_28",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_28",
                        .portName = "fib_PE_28",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_28",
                                .path = "/tasks:fib/processingElements:pe_28/interfaces:mem",
                                .portName = "fib_PE_28_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_28",
                                .path = "/tasks:fib/processingElements:pe_28/interfaces:taskIn",
                                .portName = "fib_PE_28_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_28",
                                .path = "/tasks:fib/processingElements:pe_28/interfaces:taskOut",
                                .portName = "fib_PE_28_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_28",
                                .path = "/tasks:fib/processingElements:pe_28/interfaces:contOut_sum",
                                .portName = "fib_PE_28_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_28",
                                .path = "/tasks:fib/processingElements:pe_28/interfaces:addrIn_sum",
                                .portName = "fib_PE_28_addrIn_sum",
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
                    r["pe_29"] = ProcessingElement{
                        .name = "pe_29",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_29",
                        .portName = "fib_PE_29",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_29",
                                .path = "/tasks:fib/processingElements:pe_29/interfaces:mem",
                                .portName = "fib_PE_29_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_29",
                                .path = "/tasks:fib/processingElements:pe_29/interfaces:taskIn",
                                .portName = "fib_PE_29_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_29",
                                .path = "/tasks:fib/processingElements:pe_29/interfaces:taskOut",
                                .portName = "fib_PE_29_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_29",
                                .path = "/tasks:fib/processingElements:pe_29/interfaces:contOut_sum",
                                .portName = "fib_PE_29_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_29",
                                .path = "/tasks:fib/processingElements:pe_29/interfaces:addrIn_sum",
                                .portName = "fib_PE_29_addrIn_sum",
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
                    r["pe_30"] = ProcessingElement{
                        .name = "pe_30",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_30",
                        .portName = "fib_PE_30",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_30",
                                .path = "/tasks:fib/processingElements:pe_30/interfaces:mem",
                                .portName = "fib_PE_30_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_30",
                                .path = "/tasks:fib/processingElements:pe_30/interfaces:taskIn",
                                .portName = "fib_PE_30_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_30",
                                .path = "/tasks:fib/processingElements:pe_30/interfaces:taskOut",
                                .portName = "fib_PE_30_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_30",
                                .path = "/tasks:fib/processingElements:pe_30/interfaces:contOut_sum",
                                .portName = "fib_PE_30_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_30",
                                .path = "/tasks:fib/processingElements:pe_30/interfaces:addrIn_sum",
                                .portName = "fib_PE_30_addrIn_sum",
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
                    r["pe_31"] = ProcessingElement{
                        .name = "pe_31",
                        .parent = "/tasks:fib",
                        .path = "/tasks:fib/processingElements:pe_31",
                        .portName = "fib_PE_31",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:fib/processingElements:pe_31",
                                .path = "/tasks:fib/processingElements:pe_31/interfaces:mem",
                                .portName = "fib_PE_31_mem",
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
                                .parent = "/tasks:fib/processingElements:pe_31",
                                .path = "/tasks:fib/processingElements:pe_31/interfaces:taskIn",
                                .portName = "fib_PE_31_taskIn",
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
                                .parent = "/tasks:fib/processingElements:pe_31",
                                .path = "/tasks:fib/processingElements:pe_31/interfaces:taskOut",
                                .portName = "fib_PE_31_taskOut",
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
                                .parent = "/tasks:fib/processingElements:pe_31",
                                .path = "/tasks:fib/processingElements:pe_31/interfaces:contOut_sum",
                                .portName = "fib_PE_31_contOut_sum",
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
                                .parent = "/tasks:fib/processingElements:pe_31",
                                .path = "/tasks:fib/processingElements:pe_31/interfaces:addrIn_sum",
                                .portName = "fib_PE_31_addrIn_sum",
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
                .numProcessingElements = 32,
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
                    r["pe_5"] = ProcessingElement{
                        .name = "pe_5",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_5",
                        .portName = "sum_PE_5",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_5",
                                .path = "/tasks:sum/processingElements:pe_5/interfaces:mem",
                                .portName = "sum_PE_5_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_5",
                                .path = "/tasks:sum/processingElements:pe_5/interfaces:taskIn",
                                .portName = "sum_PE_5_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_5",
                                .path = "/tasks:sum/processingElements:pe_5/interfaces:contOut_sum",
                                .portName = "sum_PE_5_contOut_sum",
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
                    r["pe_6"] = ProcessingElement{
                        .name = "pe_6",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_6",
                        .portName = "sum_PE_6",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_6",
                                .path = "/tasks:sum/processingElements:pe_6/interfaces:mem",
                                .portName = "sum_PE_6_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_6",
                                .path = "/tasks:sum/processingElements:pe_6/interfaces:taskIn",
                                .portName = "sum_PE_6_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_6",
                                .path = "/tasks:sum/processingElements:pe_6/interfaces:contOut_sum",
                                .portName = "sum_PE_6_contOut_sum",
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
                    r["pe_7"] = ProcessingElement{
                        .name = "pe_7",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_7",
                        .portName = "sum_PE_7",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_7",
                                .path = "/tasks:sum/processingElements:pe_7/interfaces:mem",
                                .portName = "sum_PE_7_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_7",
                                .path = "/tasks:sum/processingElements:pe_7/interfaces:taskIn",
                                .portName = "sum_PE_7_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_7",
                                .path = "/tasks:sum/processingElements:pe_7/interfaces:contOut_sum",
                                .portName = "sum_PE_7_contOut_sum",
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
                    r["pe_8"] = ProcessingElement{
                        .name = "pe_8",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_8",
                        .portName = "sum_PE_8",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_8",
                                .path = "/tasks:sum/processingElements:pe_8/interfaces:mem",
                                .portName = "sum_PE_8_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_8",
                                .path = "/tasks:sum/processingElements:pe_8/interfaces:taskIn",
                                .portName = "sum_PE_8_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_8",
                                .path = "/tasks:sum/processingElements:pe_8/interfaces:contOut_sum",
                                .portName = "sum_PE_8_contOut_sum",
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
                    r["pe_9"] = ProcessingElement{
                        .name = "pe_9",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_9",
                        .portName = "sum_PE_9",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_9",
                                .path = "/tasks:sum/processingElements:pe_9/interfaces:mem",
                                .portName = "sum_PE_9_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_9",
                                .path = "/tasks:sum/processingElements:pe_9/interfaces:taskIn",
                                .portName = "sum_PE_9_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_9",
                                .path = "/tasks:sum/processingElements:pe_9/interfaces:contOut_sum",
                                .portName = "sum_PE_9_contOut_sum",
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
                    r["pe_10"] = ProcessingElement{
                        .name = "pe_10",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_10",
                        .portName = "sum_PE_10",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_10",
                                .path = "/tasks:sum/processingElements:pe_10/interfaces:mem",
                                .portName = "sum_PE_10_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_10",
                                .path = "/tasks:sum/processingElements:pe_10/interfaces:taskIn",
                                .portName = "sum_PE_10_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_10",
                                .path = "/tasks:sum/processingElements:pe_10/interfaces:contOut_sum",
                                .portName = "sum_PE_10_contOut_sum",
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
                    r["pe_11"] = ProcessingElement{
                        .name = "pe_11",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_11",
                        .portName = "sum_PE_11",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_11",
                                .path = "/tasks:sum/processingElements:pe_11/interfaces:mem",
                                .portName = "sum_PE_11_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_11",
                                .path = "/tasks:sum/processingElements:pe_11/interfaces:taskIn",
                                .portName = "sum_PE_11_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_11",
                                .path = "/tasks:sum/processingElements:pe_11/interfaces:contOut_sum",
                                .portName = "sum_PE_11_contOut_sum",
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
                    r["pe_12"] = ProcessingElement{
                        .name = "pe_12",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_12",
                        .portName = "sum_PE_12",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_12",
                                .path = "/tasks:sum/processingElements:pe_12/interfaces:mem",
                                .portName = "sum_PE_12_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_12",
                                .path = "/tasks:sum/processingElements:pe_12/interfaces:taskIn",
                                .portName = "sum_PE_12_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_12",
                                .path = "/tasks:sum/processingElements:pe_12/interfaces:contOut_sum",
                                .portName = "sum_PE_12_contOut_sum",
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
                    r["pe_13"] = ProcessingElement{
                        .name = "pe_13",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_13",
                        .portName = "sum_PE_13",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_13",
                                .path = "/tasks:sum/processingElements:pe_13/interfaces:mem",
                                .portName = "sum_PE_13_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_13",
                                .path = "/tasks:sum/processingElements:pe_13/interfaces:taskIn",
                                .portName = "sum_PE_13_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_13",
                                .path = "/tasks:sum/processingElements:pe_13/interfaces:contOut_sum",
                                .portName = "sum_PE_13_contOut_sum",
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
                    r["pe_14"] = ProcessingElement{
                        .name = "pe_14",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_14",
                        .portName = "sum_PE_14",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_14",
                                .path = "/tasks:sum/processingElements:pe_14/interfaces:mem",
                                .portName = "sum_PE_14_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_14",
                                .path = "/tasks:sum/processingElements:pe_14/interfaces:taskIn",
                                .portName = "sum_PE_14_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_14",
                                .path = "/tasks:sum/processingElements:pe_14/interfaces:contOut_sum",
                                .portName = "sum_PE_14_contOut_sum",
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
                    r["pe_15"] = ProcessingElement{
                        .name = "pe_15",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_15",
                        .portName = "sum_PE_15",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_15",
                                .path = "/tasks:sum/processingElements:pe_15/interfaces:mem",
                                .portName = "sum_PE_15_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_15",
                                .path = "/tasks:sum/processingElements:pe_15/interfaces:taskIn",
                                .portName = "sum_PE_15_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_15",
                                .path = "/tasks:sum/processingElements:pe_15/interfaces:contOut_sum",
                                .portName = "sum_PE_15_contOut_sum",
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
                    r["pe_16"] = ProcessingElement{
                        .name = "pe_16",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_16",
                        .portName = "sum_PE_16",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_16",
                                .path = "/tasks:sum/processingElements:pe_16/interfaces:mem",
                                .portName = "sum_PE_16_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_16",
                                .path = "/tasks:sum/processingElements:pe_16/interfaces:taskIn",
                                .portName = "sum_PE_16_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_16",
                                .path = "/tasks:sum/processingElements:pe_16/interfaces:contOut_sum",
                                .portName = "sum_PE_16_contOut_sum",
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
                    r["pe_17"] = ProcessingElement{
                        .name = "pe_17",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_17",
                        .portName = "sum_PE_17",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_17",
                                .path = "/tasks:sum/processingElements:pe_17/interfaces:mem",
                                .portName = "sum_PE_17_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_17",
                                .path = "/tasks:sum/processingElements:pe_17/interfaces:taskIn",
                                .portName = "sum_PE_17_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_17",
                                .path = "/tasks:sum/processingElements:pe_17/interfaces:contOut_sum",
                                .portName = "sum_PE_17_contOut_sum",
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
                    r["pe_18"] = ProcessingElement{
                        .name = "pe_18",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_18",
                        .portName = "sum_PE_18",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_18",
                                .path = "/tasks:sum/processingElements:pe_18/interfaces:mem",
                                .portName = "sum_PE_18_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_18",
                                .path = "/tasks:sum/processingElements:pe_18/interfaces:taskIn",
                                .portName = "sum_PE_18_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_18",
                                .path = "/tasks:sum/processingElements:pe_18/interfaces:contOut_sum",
                                .portName = "sum_PE_18_contOut_sum",
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
                    r["pe_19"] = ProcessingElement{
                        .name = "pe_19",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_19",
                        .portName = "sum_PE_19",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_19",
                                .path = "/tasks:sum/processingElements:pe_19/interfaces:mem",
                                .portName = "sum_PE_19_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_19",
                                .path = "/tasks:sum/processingElements:pe_19/interfaces:taskIn",
                                .portName = "sum_PE_19_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_19",
                                .path = "/tasks:sum/processingElements:pe_19/interfaces:contOut_sum",
                                .portName = "sum_PE_19_contOut_sum",
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
                    r["pe_20"] = ProcessingElement{
                        .name = "pe_20",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_20",
                        .portName = "sum_PE_20",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_20",
                                .path = "/tasks:sum/processingElements:pe_20/interfaces:mem",
                                .portName = "sum_PE_20_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_20",
                                .path = "/tasks:sum/processingElements:pe_20/interfaces:taskIn",
                                .portName = "sum_PE_20_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_20",
                                .path = "/tasks:sum/processingElements:pe_20/interfaces:contOut_sum",
                                .portName = "sum_PE_20_contOut_sum",
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
                    r["pe_21"] = ProcessingElement{
                        .name = "pe_21",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_21",
                        .portName = "sum_PE_21",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_21",
                                .path = "/tasks:sum/processingElements:pe_21/interfaces:mem",
                                .portName = "sum_PE_21_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_21",
                                .path = "/tasks:sum/processingElements:pe_21/interfaces:taskIn",
                                .portName = "sum_PE_21_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_21",
                                .path = "/tasks:sum/processingElements:pe_21/interfaces:contOut_sum",
                                .portName = "sum_PE_21_contOut_sum",
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
                    r["pe_22"] = ProcessingElement{
                        .name = "pe_22",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_22",
                        .portName = "sum_PE_22",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_22",
                                .path = "/tasks:sum/processingElements:pe_22/interfaces:mem",
                                .portName = "sum_PE_22_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_22",
                                .path = "/tasks:sum/processingElements:pe_22/interfaces:taskIn",
                                .portName = "sum_PE_22_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_22",
                                .path = "/tasks:sum/processingElements:pe_22/interfaces:contOut_sum",
                                .portName = "sum_PE_22_contOut_sum",
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
                    r["pe_23"] = ProcessingElement{
                        .name = "pe_23",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_23",
                        .portName = "sum_PE_23",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_23",
                                .path = "/tasks:sum/processingElements:pe_23/interfaces:mem",
                                .portName = "sum_PE_23_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_23",
                                .path = "/tasks:sum/processingElements:pe_23/interfaces:taskIn",
                                .portName = "sum_PE_23_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_23",
                                .path = "/tasks:sum/processingElements:pe_23/interfaces:contOut_sum",
                                .portName = "sum_PE_23_contOut_sum",
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
                    r["pe_24"] = ProcessingElement{
                        .name = "pe_24",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_24",
                        .portName = "sum_PE_24",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_24",
                                .path = "/tasks:sum/processingElements:pe_24/interfaces:mem",
                                .portName = "sum_PE_24_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_24",
                                .path = "/tasks:sum/processingElements:pe_24/interfaces:taskIn",
                                .portName = "sum_PE_24_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_24",
                                .path = "/tasks:sum/processingElements:pe_24/interfaces:contOut_sum",
                                .portName = "sum_PE_24_contOut_sum",
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
                    r["pe_25"] = ProcessingElement{
                        .name = "pe_25",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_25",
                        .portName = "sum_PE_25",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_25",
                                .path = "/tasks:sum/processingElements:pe_25/interfaces:mem",
                                .portName = "sum_PE_25_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_25",
                                .path = "/tasks:sum/processingElements:pe_25/interfaces:taskIn",
                                .portName = "sum_PE_25_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_25",
                                .path = "/tasks:sum/processingElements:pe_25/interfaces:contOut_sum",
                                .portName = "sum_PE_25_contOut_sum",
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
                    r["pe_26"] = ProcessingElement{
                        .name = "pe_26",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_26",
                        .portName = "sum_PE_26",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_26",
                                .path = "/tasks:sum/processingElements:pe_26/interfaces:mem",
                                .portName = "sum_PE_26_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_26",
                                .path = "/tasks:sum/processingElements:pe_26/interfaces:taskIn",
                                .portName = "sum_PE_26_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_26",
                                .path = "/tasks:sum/processingElements:pe_26/interfaces:contOut_sum",
                                .portName = "sum_PE_26_contOut_sum",
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
                    r["pe_27"] = ProcessingElement{
                        .name = "pe_27",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_27",
                        .portName = "sum_PE_27",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_27",
                                .path = "/tasks:sum/processingElements:pe_27/interfaces:mem",
                                .portName = "sum_PE_27_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_27",
                                .path = "/tasks:sum/processingElements:pe_27/interfaces:taskIn",
                                .portName = "sum_PE_27_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_27",
                                .path = "/tasks:sum/processingElements:pe_27/interfaces:contOut_sum",
                                .portName = "sum_PE_27_contOut_sum",
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
                    r["pe_28"] = ProcessingElement{
                        .name = "pe_28",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_28",
                        .portName = "sum_PE_28",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_28",
                                .path = "/tasks:sum/processingElements:pe_28/interfaces:mem",
                                .portName = "sum_PE_28_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_28",
                                .path = "/tasks:sum/processingElements:pe_28/interfaces:taskIn",
                                .portName = "sum_PE_28_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_28",
                                .path = "/tasks:sum/processingElements:pe_28/interfaces:contOut_sum",
                                .portName = "sum_PE_28_contOut_sum",
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
                    r["pe_29"] = ProcessingElement{
                        .name = "pe_29",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_29",
                        .portName = "sum_PE_29",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_29",
                                .path = "/tasks:sum/processingElements:pe_29/interfaces:mem",
                                .portName = "sum_PE_29_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_29",
                                .path = "/tasks:sum/processingElements:pe_29/interfaces:taskIn",
                                .portName = "sum_PE_29_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_29",
                                .path = "/tasks:sum/processingElements:pe_29/interfaces:contOut_sum",
                                .portName = "sum_PE_29_contOut_sum",
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
                    r["pe_30"] = ProcessingElement{
                        .name = "pe_30",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_30",
                        .portName = "sum_PE_30",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_30",
                                .path = "/tasks:sum/processingElements:pe_30/interfaces:mem",
                                .portName = "sum_PE_30_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_30",
                                .path = "/tasks:sum/processingElements:pe_30/interfaces:taskIn",
                                .portName = "sum_PE_30_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_30",
                                .path = "/tasks:sum/processingElements:pe_30/interfaces:contOut_sum",
                                .portName = "sum_PE_30_contOut_sum",
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
                    r["pe_31"] = ProcessingElement{
                        .name = "pe_31",
                        .parent = "/tasks:sum",
                        .path = "/tasks:sum/processingElements:pe_31",
                        .portName = "sum_PE_31",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:sum/processingElements:pe_31",
                                .path = "/tasks:sum/processingElements:pe_31/interfaces:mem",
                                .portName = "sum_PE_31_mem",
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
                                .parent = "/tasks:sum/processingElements:pe_31",
                                .path = "/tasks:sum/processingElements:pe_31/interfaces:taskIn",
                                .portName = "sum_PE_31_taskIn",
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
                                .parent = "/tasks:sum/processingElements:pe_31",
                                .path = "/tasks:sum/processingElements:pe_31/interfaces:contOut_sum",
                                .portName = "sum_PE_31_contOut_sum",
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
                r["fib_stealSide_taskOut_5"] = Interface{
                    .name = "fib_stealSide_taskOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_5",
                    .portName = "fib_stealSide_taskOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_6"] = Interface{
                    .name = "fib_stealSide_taskOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_6",
                    .portName = "fib_stealSide_taskOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_7"] = Interface{
                    .name = "fib_stealSide_taskOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_7",
                    .portName = "fib_stealSide_taskOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_8"] = Interface{
                    .name = "fib_stealSide_taskOut_8",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_8",
                    .portName = "fib_stealSide_taskOut_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_9"] = Interface{
                    .name = "fib_stealSide_taskOut_9",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_9",
                    .portName = "fib_stealSide_taskOut_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_10"] = Interface{
                    .name = "fib_stealSide_taskOut_10",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_10",
                    .portName = "fib_stealSide_taskOut_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_11"] = Interface{
                    .name = "fib_stealSide_taskOut_11",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_11",
                    .portName = "fib_stealSide_taskOut_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_12"] = Interface{
                    .name = "fib_stealSide_taskOut_12",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_12",
                    .portName = "fib_stealSide_taskOut_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_13"] = Interface{
                    .name = "fib_stealSide_taskOut_13",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_13",
                    .portName = "fib_stealSide_taskOut_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_14"] = Interface{
                    .name = "fib_stealSide_taskOut_14",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_14",
                    .portName = "fib_stealSide_taskOut_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_15"] = Interface{
                    .name = "fib_stealSide_taskOut_15",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_15",
                    .portName = "fib_stealSide_taskOut_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_16"] = Interface{
                    .name = "fib_stealSide_taskOut_16",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_16",
                    .portName = "fib_stealSide_taskOut_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_17"] = Interface{
                    .name = "fib_stealSide_taskOut_17",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_17",
                    .portName = "fib_stealSide_taskOut_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_18"] = Interface{
                    .name = "fib_stealSide_taskOut_18",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_18",
                    .portName = "fib_stealSide_taskOut_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_19"] = Interface{
                    .name = "fib_stealSide_taskOut_19",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_19",
                    .portName = "fib_stealSide_taskOut_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_20"] = Interface{
                    .name = "fib_stealSide_taskOut_20",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_20",
                    .portName = "fib_stealSide_taskOut_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_21"] = Interface{
                    .name = "fib_stealSide_taskOut_21",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_21",
                    .portName = "fib_stealSide_taskOut_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_22"] = Interface{
                    .name = "fib_stealSide_taskOut_22",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_22",
                    .portName = "fib_stealSide_taskOut_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_23"] = Interface{
                    .name = "fib_stealSide_taskOut_23",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_23",
                    .portName = "fib_stealSide_taskOut_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_24"] = Interface{
                    .name = "fib_stealSide_taskOut_24",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_24",
                    .portName = "fib_stealSide_taskOut_24",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_25"] = Interface{
                    .name = "fib_stealSide_taskOut_25",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_25",
                    .portName = "fib_stealSide_taskOut_25",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_26"] = Interface{
                    .name = "fib_stealSide_taskOut_26",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_26",
                    .portName = "fib_stealSide_taskOut_26",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_27"] = Interface{
                    .name = "fib_stealSide_taskOut_27",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_27",
                    .portName = "fib_stealSide_taskOut_27",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_28"] = Interface{
                    .name = "fib_stealSide_taskOut_28",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_28",
                    .portName = "fib_stealSide_taskOut_28",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_29"] = Interface{
                    .name = "fib_stealSide_taskOut_29",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_29",
                    .portName = "fib_stealSide_taskOut_29",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_30"] = Interface{
                    .name = "fib_stealSide_taskOut_30",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_30",
                    .portName = "fib_stealSide_taskOut_30",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskOut_31"] = Interface{
                    .name = "fib_stealSide_taskOut_31",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskOut_31",
                    .portName = "fib_stealSide_taskOut_31",
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
                r["fib_stealSide_taskIn_5"] = Interface{
                    .name = "fib_stealSide_taskIn_5",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_5",
                    .portName = "fib_stealSide_taskIn_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_6"] = Interface{
                    .name = "fib_stealSide_taskIn_6",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_6",
                    .portName = "fib_stealSide_taskIn_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_7"] = Interface{
                    .name = "fib_stealSide_taskIn_7",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_7",
                    .portName = "fib_stealSide_taskIn_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_8"] = Interface{
                    .name = "fib_stealSide_taskIn_8",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_8",
                    .portName = "fib_stealSide_taskIn_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_9"] = Interface{
                    .name = "fib_stealSide_taskIn_9",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_9",
                    .portName = "fib_stealSide_taskIn_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_10"] = Interface{
                    .name = "fib_stealSide_taskIn_10",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_10",
                    .portName = "fib_stealSide_taskIn_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_11"] = Interface{
                    .name = "fib_stealSide_taskIn_11",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_11",
                    .portName = "fib_stealSide_taskIn_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_12"] = Interface{
                    .name = "fib_stealSide_taskIn_12",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_12",
                    .portName = "fib_stealSide_taskIn_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_13"] = Interface{
                    .name = "fib_stealSide_taskIn_13",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_13",
                    .portName = "fib_stealSide_taskIn_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_14"] = Interface{
                    .name = "fib_stealSide_taskIn_14",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_14",
                    .portName = "fib_stealSide_taskIn_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_15"] = Interface{
                    .name = "fib_stealSide_taskIn_15",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_15",
                    .portName = "fib_stealSide_taskIn_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_16"] = Interface{
                    .name = "fib_stealSide_taskIn_16",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_16",
                    .portName = "fib_stealSide_taskIn_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_17"] = Interface{
                    .name = "fib_stealSide_taskIn_17",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_17",
                    .portName = "fib_stealSide_taskIn_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_18"] = Interface{
                    .name = "fib_stealSide_taskIn_18",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_18",
                    .portName = "fib_stealSide_taskIn_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_19"] = Interface{
                    .name = "fib_stealSide_taskIn_19",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_19",
                    .portName = "fib_stealSide_taskIn_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_20"] = Interface{
                    .name = "fib_stealSide_taskIn_20",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_20",
                    .portName = "fib_stealSide_taskIn_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_21"] = Interface{
                    .name = "fib_stealSide_taskIn_21",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_21",
                    .portName = "fib_stealSide_taskIn_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_22"] = Interface{
                    .name = "fib_stealSide_taskIn_22",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_22",
                    .portName = "fib_stealSide_taskIn_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_23"] = Interface{
                    .name = "fib_stealSide_taskIn_23",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_23",
                    .portName = "fib_stealSide_taskIn_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_24"] = Interface{
                    .name = "fib_stealSide_taskIn_24",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_24",
                    .portName = "fib_stealSide_taskIn_24",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_25"] = Interface{
                    .name = "fib_stealSide_taskIn_25",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_25",
                    .portName = "fib_stealSide_taskIn_25",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_26"] = Interface{
                    .name = "fib_stealSide_taskIn_26",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_26",
                    .portName = "fib_stealSide_taskIn_26",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_27"] = Interface{
                    .name = "fib_stealSide_taskIn_27",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_27",
                    .portName = "fib_stealSide_taskIn_27",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_28"] = Interface{
                    .name = "fib_stealSide_taskIn_28",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_28",
                    .portName = "fib_stealSide_taskIn_28",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_29"] = Interface{
                    .name = "fib_stealSide_taskIn_29",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_29",
                    .portName = "fib_stealSide_taskIn_29",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_30"] = Interface{
                    .name = "fib_stealSide_taskIn_30",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_30",
                    .portName = "fib_stealSide_taskIn_30",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 128,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["fib_stealSide_taskIn_31"] = Interface{
                    .name = "fib_stealSide_taskIn_31",
                    .parent = "/system",
                    .path = "/system/interfaces:fib_stealSide_taskIn_31",
                    .portName = "fib_stealSide_taskIn_31",
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
                r["sum_stealSide_taskOut_5"] = Interface{
                    .name = "sum_stealSide_taskOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_5",
                    .portName = "sum_stealSide_taskOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_6"] = Interface{
                    .name = "sum_stealSide_taskOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_6",
                    .portName = "sum_stealSide_taskOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_7"] = Interface{
                    .name = "sum_stealSide_taskOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_7",
                    .portName = "sum_stealSide_taskOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_8"] = Interface{
                    .name = "sum_stealSide_taskOut_8",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_8",
                    .portName = "sum_stealSide_taskOut_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_9"] = Interface{
                    .name = "sum_stealSide_taskOut_9",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_9",
                    .portName = "sum_stealSide_taskOut_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_10"] = Interface{
                    .name = "sum_stealSide_taskOut_10",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_10",
                    .portName = "sum_stealSide_taskOut_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_11"] = Interface{
                    .name = "sum_stealSide_taskOut_11",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_11",
                    .portName = "sum_stealSide_taskOut_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_12"] = Interface{
                    .name = "sum_stealSide_taskOut_12",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_12",
                    .portName = "sum_stealSide_taskOut_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_13"] = Interface{
                    .name = "sum_stealSide_taskOut_13",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_13",
                    .portName = "sum_stealSide_taskOut_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_14"] = Interface{
                    .name = "sum_stealSide_taskOut_14",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_14",
                    .portName = "sum_stealSide_taskOut_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_15"] = Interface{
                    .name = "sum_stealSide_taskOut_15",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_15",
                    .portName = "sum_stealSide_taskOut_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_16"] = Interface{
                    .name = "sum_stealSide_taskOut_16",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_16",
                    .portName = "sum_stealSide_taskOut_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_17"] = Interface{
                    .name = "sum_stealSide_taskOut_17",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_17",
                    .portName = "sum_stealSide_taskOut_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_18"] = Interface{
                    .name = "sum_stealSide_taskOut_18",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_18",
                    .portName = "sum_stealSide_taskOut_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_19"] = Interface{
                    .name = "sum_stealSide_taskOut_19",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_19",
                    .portName = "sum_stealSide_taskOut_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_20"] = Interface{
                    .name = "sum_stealSide_taskOut_20",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_20",
                    .portName = "sum_stealSide_taskOut_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_21"] = Interface{
                    .name = "sum_stealSide_taskOut_21",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_21",
                    .portName = "sum_stealSide_taskOut_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_22"] = Interface{
                    .name = "sum_stealSide_taskOut_22",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_22",
                    .portName = "sum_stealSide_taskOut_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_23"] = Interface{
                    .name = "sum_stealSide_taskOut_23",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_23",
                    .portName = "sum_stealSide_taskOut_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_24"] = Interface{
                    .name = "sum_stealSide_taskOut_24",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_24",
                    .portName = "sum_stealSide_taskOut_24",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_25"] = Interface{
                    .name = "sum_stealSide_taskOut_25",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_25",
                    .portName = "sum_stealSide_taskOut_25",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_26"] = Interface{
                    .name = "sum_stealSide_taskOut_26",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_26",
                    .portName = "sum_stealSide_taskOut_26",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_27"] = Interface{
                    .name = "sum_stealSide_taskOut_27",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_27",
                    .portName = "sum_stealSide_taskOut_27",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_28"] = Interface{
                    .name = "sum_stealSide_taskOut_28",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_28",
                    .portName = "sum_stealSide_taskOut_28",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_29"] = Interface{
                    .name = "sum_stealSide_taskOut_29",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_29",
                    .portName = "sum_stealSide_taskOut_29",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_30"] = Interface{
                    .name = "sum_stealSide_taskOut_30",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_30",
                    .portName = "sum_stealSide_taskOut_30",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 256,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_stealSide_taskOut_31"] = Interface{
                    .name = "sum_stealSide_taskOut_31",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_stealSide_taskOut_31",
                    .portName = "sum_stealSide_taskOut_31",
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
                r["sum_syncSide_addrIn_10"] = Interface{
                    .name = "sum_syncSide_addrIn_10",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_10",
                    .portName = "sum_syncSide_addrIn_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_11"] = Interface{
                    .name = "sum_syncSide_addrIn_11",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_11",
                    .portName = "sum_syncSide_addrIn_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_12"] = Interface{
                    .name = "sum_syncSide_addrIn_12",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_12",
                    .portName = "sum_syncSide_addrIn_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_13"] = Interface{
                    .name = "sum_syncSide_addrIn_13",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_13",
                    .portName = "sum_syncSide_addrIn_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_14"] = Interface{
                    .name = "sum_syncSide_addrIn_14",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_14",
                    .portName = "sum_syncSide_addrIn_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_15"] = Interface{
                    .name = "sum_syncSide_addrIn_15",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_15",
                    .portName = "sum_syncSide_addrIn_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_16"] = Interface{
                    .name = "sum_syncSide_addrIn_16",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_16",
                    .portName = "sum_syncSide_addrIn_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_17"] = Interface{
                    .name = "sum_syncSide_addrIn_17",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_17",
                    .portName = "sum_syncSide_addrIn_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_18"] = Interface{
                    .name = "sum_syncSide_addrIn_18",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_18",
                    .portName = "sum_syncSide_addrIn_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_19"] = Interface{
                    .name = "sum_syncSide_addrIn_19",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_19",
                    .portName = "sum_syncSide_addrIn_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_20"] = Interface{
                    .name = "sum_syncSide_addrIn_20",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_20",
                    .portName = "sum_syncSide_addrIn_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_21"] = Interface{
                    .name = "sum_syncSide_addrIn_21",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_21",
                    .portName = "sum_syncSide_addrIn_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_22"] = Interface{
                    .name = "sum_syncSide_addrIn_22",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_22",
                    .portName = "sum_syncSide_addrIn_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_23"] = Interface{
                    .name = "sum_syncSide_addrIn_23",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_23",
                    .portName = "sum_syncSide_addrIn_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_24"] = Interface{
                    .name = "sum_syncSide_addrIn_24",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_24",
                    .portName = "sum_syncSide_addrIn_24",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_25"] = Interface{
                    .name = "sum_syncSide_addrIn_25",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_25",
                    .portName = "sum_syncSide_addrIn_25",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_26"] = Interface{
                    .name = "sum_syncSide_addrIn_26",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_26",
                    .portName = "sum_syncSide_addrIn_26",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_27"] = Interface{
                    .name = "sum_syncSide_addrIn_27",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_27",
                    .portName = "sum_syncSide_addrIn_27",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_28"] = Interface{
                    .name = "sum_syncSide_addrIn_28",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_28",
                    .portName = "sum_syncSide_addrIn_28",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_29"] = Interface{
                    .name = "sum_syncSide_addrIn_29",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_29",
                    .portName = "sum_syncSide_addrIn_29",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_30"] = Interface{
                    .name = "sum_syncSide_addrIn_30",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_30",
                    .portName = "sum_syncSide_addrIn_30",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_31"] = Interface{
                    .name = "sum_syncSide_addrIn_31",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_31",
                    .portName = "sum_syncSide_addrIn_31",
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
                r["sum_continuationAllocationSide_contOut_5"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_5",
                    .portName = "sum_continuationAllocationSide_contOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_6"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_6",
                    .portName = "sum_continuationAllocationSide_contOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_7"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_7",
                    .portName = "sum_continuationAllocationSide_contOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_8"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_8",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_8",
                    .portName = "sum_continuationAllocationSide_contOut_8",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_9"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_9",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_9",
                    .portName = "sum_continuationAllocationSide_contOut_9",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_10"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_10",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_10",
                    .portName = "sum_continuationAllocationSide_contOut_10",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_11"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_11",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_11",
                    .portName = "sum_continuationAllocationSide_contOut_11",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_12"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_12",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_12",
                    .portName = "sum_continuationAllocationSide_contOut_12",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_13"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_13",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_13",
                    .portName = "sum_continuationAllocationSide_contOut_13",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_14"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_14",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_14",
                    .portName = "sum_continuationAllocationSide_contOut_14",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_15"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_15",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_15",
                    .portName = "sum_continuationAllocationSide_contOut_15",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_16"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_16",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_16",
                    .portName = "sum_continuationAllocationSide_contOut_16",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_17"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_17",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_17",
                    .portName = "sum_continuationAllocationSide_contOut_17",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_18"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_18",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_18",
                    .portName = "sum_continuationAllocationSide_contOut_18",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_19"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_19",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_19",
                    .portName = "sum_continuationAllocationSide_contOut_19",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_20"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_20",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_20",
                    .portName = "sum_continuationAllocationSide_contOut_20",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_21"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_21",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_21",
                    .portName = "sum_continuationAllocationSide_contOut_21",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_22"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_22",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_22",
                    .portName = "sum_continuationAllocationSide_contOut_22",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_23"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_23",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_23",
                    .portName = "sum_continuationAllocationSide_contOut_23",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_24"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_24",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_24",
                    .portName = "sum_continuationAllocationSide_contOut_24",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_25"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_25",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_25",
                    .portName = "sum_continuationAllocationSide_contOut_25",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_26"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_26",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_26",
                    .portName = "sum_continuationAllocationSide_contOut_26",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_27"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_27",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_27",
                    .portName = "sum_continuationAllocationSide_contOut_27",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_28"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_28",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_28",
                    .portName = "sum_continuationAllocationSide_contOut_28",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_29"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_29",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_29",
                    .portName = "sum_continuationAllocationSide_contOut_29",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_30"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_30",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_30",
                    .portName = "sum_continuationAllocationSide_contOut_30",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_continuationAllocationSide_contOut_31"] = Interface{
                    .name = "sum_continuationAllocationSide_contOut_31",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_continuationAllocationSide_contOut_31",
                    .portName = "sum_continuationAllocationSide_contOut_31",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_32"] = Interface{
                    .name = "sum_syncSide_addrIn_32",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_32",
                    .portName = "sum_syncSide_addrIn_32",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_33"] = Interface{
                    .name = "sum_syncSide_addrIn_33",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_33",
                    .portName = "sum_syncSide_addrIn_33",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_34"] = Interface{
                    .name = "sum_syncSide_addrIn_34",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_34",
                    .portName = "sum_syncSide_addrIn_34",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_35"] = Interface{
                    .name = "sum_syncSide_addrIn_35",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_35",
                    .portName = "sum_syncSide_addrIn_35",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_36"] = Interface{
                    .name = "sum_syncSide_addrIn_36",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_36",
                    .portName = "sum_syncSide_addrIn_36",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_37"] = Interface{
                    .name = "sum_syncSide_addrIn_37",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_37",
                    .portName = "sum_syncSide_addrIn_37",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_38"] = Interface{
                    .name = "sum_syncSide_addrIn_38",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_38",
                    .portName = "sum_syncSide_addrIn_38",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_39"] = Interface{
                    .name = "sum_syncSide_addrIn_39",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_39",
                    .portName = "sum_syncSide_addrIn_39",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_40"] = Interface{
                    .name = "sum_syncSide_addrIn_40",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_40",
                    .portName = "sum_syncSide_addrIn_40",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_41"] = Interface{
                    .name = "sum_syncSide_addrIn_41",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_41",
                    .portName = "sum_syncSide_addrIn_41",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_42"] = Interface{
                    .name = "sum_syncSide_addrIn_42",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_42",
                    .portName = "sum_syncSide_addrIn_42",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_43"] = Interface{
                    .name = "sum_syncSide_addrIn_43",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_43",
                    .portName = "sum_syncSide_addrIn_43",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_44"] = Interface{
                    .name = "sum_syncSide_addrIn_44",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_44",
                    .portName = "sum_syncSide_addrIn_44",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_45"] = Interface{
                    .name = "sum_syncSide_addrIn_45",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_45",
                    .portName = "sum_syncSide_addrIn_45",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_46"] = Interface{
                    .name = "sum_syncSide_addrIn_46",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_46",
                    .portName = "sum_syncSide_addrIn_46",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_47"] = Interface{
                    .name = "sum_syncSide_addrIn_47",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_47",
                    .portName = "sum_syncSide_addrIn_47",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_48"] = Interface{
                    .name = "sum_syncSide_addrIn_48",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_48",
                    .portName = "sum_syncSide_addrIn_48",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_49"] = Interface{
                    .name = "sum_syncSide_addrIn_49",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_49",
                    .portName = "sum_syncSide_addrIn_49",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_50"] = Interface{
                    .name = "sum_syncSide_addrIn_50",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_50",
                    .portName = "sum_syncSide_addrIn_50",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_51"] = Interface{
                    .name = "sum_syncSide_addrIn_51",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_51",
                    .portName = "sum_syncSide_addrIn_51",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_52"] = Interface{
                    .name = "sum_syncSide_addrIn_52",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_52",
                    .portName = "sum_syncSide_addrIn_52",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_53"] = Interface{
                    .name = "sum_syncSide_addrIn_53",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_53",
                    .portName = "sum_syncSide_addrIn_53",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_54"] = Interface{
                    .name = "sum_syncSide_addrIn_54",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_54",
                    .portName = "sum_syncSide_addrIn_54",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_55"] = Interface{
                    .name = "sum_syncSide_addrIn_55",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_55",
                    .portName = "sum_syncSide_addrIn_55",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_56"] = Interface{
                    .name = "sum_syncSide_addrIn_56",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_56",
                    .portName = "sum_syncSide_addrIn_56",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_57"] = Interface{
                    .name = "sum_syncSide_addrIn_57",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_57",
                    .portName = "sum_syncSide_addrIn_57",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_58"] = Interface{
                    .name = "sum_syncSide_addrIn_58",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_58",
                    .portName = "sum_syncSide_addrIn_58",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_59"] = Interface{
                    .name = "sum_syncSide_addrIn_59",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_59",
                    .portName = "sum_syncSide_addrIn_59",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_60"] = Interface{
                    .name = "sum_syncSide_addrIn_60",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_60",
                    .portName = "sum_syncSide_addrIn_60",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_61"] = Interface{
                    .name = "sum_syncSide_addrIn_61",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_61",
                    .portName = "sum_syncSide_addrIn_61",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_62"] = Interface{
                    .name = "sum_syncSide_addrIn_62",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_62",
                    .portName = "sum_syncSide_addrIn_62",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["sum_syncSide_addrIn_63"] = Interface{
                    .name = "sum_syncSide_addrIn_63",
                    .parent = "/system",
                    .path = "/system/interfaces:sum_syncSide_addrIn_63",
                    .portName = "sum_syncSide_addrIn_63",
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
                "/system/interfaces:fib_stealSide_taskOut_5",
                "/tasks:fib/processingElements:pe_5/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_6",
                "/tasks:fib/processingElements:pe_6/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_7",
                "/tasks:fib/processingElements:pe_7/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_8",
                "/tasks:fib/processingElements:pe_8/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_9",
                "/tasks:fib/processingElements:pe_9/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_10",
                "/tasks:fib/processingElements:pe_10/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_11",
                "/tasks:fib/processingElements:pe_11/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_12",
                "/tasks:fib/processingElements:pe_12/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_13",
                "/tasks:fib/processingElements:pe_13/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_14",
                "/tasks:fib/processingElements:pe_14/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_15",
                "/tasks:fib/processingElements:pe_15/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_16",
                "/tasks:fib/processingElements:pe_16/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_17",
                "/tasks:fib/processingElements:pe_17/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_18",
                "/tasks:fib/processingElements:pe_18/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_19",
                "/tasks:fib/processingElements:pe_19/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_20",
                "/tasks:fib/processingElements:pe_20/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_21",
                "/tasks:fib/processingElements:pe_21/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_22",
                "/tasks:fib/processingElements:pe_22/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_23",
                "/tasks:fib/processingElements:pe_23/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_24",
                "/tasks:fib/processingElements:pe_24/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_25",
                "/tasks:fib/processingElements:pe_25/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_26",
                "/tasks:fib/processingElements:pe_26/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_27",
                "/tasks:fib/processingElements:pe_27/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_28",
                "/tasks:fib/processingElements:pe_28/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_29",
                "/tasks:fib/processingElements:pe_29/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_30",
                "/tasks:fib/processingElements:pe_30/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:fib_stealSide_taskOut_31",
                "/tasks:fib/processingElements:pe_31/interfaces:taskIn"
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
                "/tasks:fib/processingElements:pe_5/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_6/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_7/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_7"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_8/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_8"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_9/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_9"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_10/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_10"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_11/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_11"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_12/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_12"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_13/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_13"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_14/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_14"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_15/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_15"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_16/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_16"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_17/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_17"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_18/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_18"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_19/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_19"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_20/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_20"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_21/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_21"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_22/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_22"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_23/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_23"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_24/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_24"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_25/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_25"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_26/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_26"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_27/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_27"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_28/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_28"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_29/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_29"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_30/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_30"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_31/interfaces:taskOut",
                "/system/interfaces:fib_stealSide_taskIn_31"
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
                "/system/interfaces:sum_stealSide_taskOut_5",
                "/tasks:sum/processingElements:pe_5/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_6",
                "/tasks:sum/processingElements:pe_6/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_7",
                "/tasks:sum/processingElements:pe_7/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_8",
                "/tasks:sum/processingElements:pe_8/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_9",
                "/tasks:sum/processingElements:pe_9/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_10",
                "/tasks:sum/processingElements:pe_10/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_11",
                "/tasks:sum/processingElements:pe_11/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_12",
                "/tasks:sum/processingElements:pe_12/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_13",
                "/tasks:sum/processingElements:pe_13/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_14",
                "/tasks:sum/processingElements:pe_14/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_15",
                "/tasks:sum/processingElements:pe_15/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_16",
                "/tasks:sum/processingElements:pe_16/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_17",
                "/tasks:sum/processingElements:pe_17/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_18",
                "/tasks:sum/processingElements:pe_18/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_19",
                "/tasks:sum/processingElements:pe_19/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_20",
                "/tasks:sum/processingElements:pe_20/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_21",
                "/tasks:sum/processingElements:pe_21/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_22",
                "/tasks:sum/processingElements:pe_22/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_23",
                "/tasks:sum/processingElements:pe_23/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_24",
                "/tasks:sum/processingElements:pe_24/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_25",
                "/tasks:sum/processingElements:pe_25/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_26",
                "/tasks:sum/processingElements:pe_26/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_27",
                "/tasks:sum/processingElements:pe_27/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_28",
                "/tasks:sum/processingElements:pe_28/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_29",
                "/tasks:sum/processingElements:pe_29/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_30",
                "/tasks:sum/processingElements:pe_30/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_stealSide_taskOut_31",
                "/tasks:sum/processingElements:pe_31/interfaces:taskIn"
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
                "/tasks:fib/processingElements:pe_5/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_6/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_7/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_7"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_8/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_8"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_9/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_9"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_10/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_10"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_11/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_11"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_12/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_12"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_13/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_13"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_14/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_14"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_15/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_15"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_16/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_16"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_17/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_17"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_18/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_18"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_19/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_19"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_20/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_20"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_21/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_21"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_22/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_22"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_23/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_23"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_24/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_24"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_25/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_25"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_26/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_26"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_27/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_27"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_28/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_28"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_29/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_29"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_30/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_30"
            },
            std::pair<std::string, std::string>{
                "/tasks:fib/processingElements:pe_31/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_31"
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
                "/system/interfaces:sum_continuationAllocationSide_contOut_5",
                "/tasks:fib/processingElements:pe_5/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_6",
                "/tasks:fib/processingElements:pe_6/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_7",
                "/tasks:fib/processingElements:pe_7/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_8",
                "/tasks:fib/processingElements:pe_8/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_9",
                "/tasks:fib/processingElements:pe_9/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_10",
                "/tasks:fib/processingElements:pe_10/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_11",
                "/tasks:fib/processingElements:pe_11/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_12",
                "/tasks:fib/processingElements:pe_12/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_13",
                "/tasks:fib/processingElements:pe_13/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_14",
                "/tasks:fib/processingElements:pe_14/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_15",
                "/tasks:fib/processingElements:pe_15/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_16",
                "/tasks:fib/processingElements:pe_16/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_17",
                "/tasks:fib/processingElements:pe_17/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_18",
                "/tasks:fib/processingElements:pe_18/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_19",
                "/tasks:fib/processingElements:pe_19/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_20",
                "/tasks:fib/processingElements:pe_20/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_21",
                "/tasks:fib/processingElements:pe_21/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_22",
                "/tasks:fib/processingElements:pe_22/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_23",
                "/tasks:fib/processingElements:pe_23/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_24",
                "/tasks:fib/processingElements:pe_24/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_25",
                "/tasks:fib/processingElements:pe_25/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_26",
                "/tasks:fib/processingElements:pe_26/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_27",
                "/tasks:fib/processingElements:pe_27/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_28",
                "/tasks:fib/processingElements:pe_28/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_29",
                "/tasks:fib/processingElements:pe_29/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_30",
                "/tasks:fib/processingElements:pe_30/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:sum_continuationAllocationSide_contOut_31",
                "/tasks:fib/processingElements:pe_31/interfaces:addrIn_sum"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_0/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_32"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_1/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_33"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_2/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_34"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_3/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_35"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_4/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_36"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_5/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_37"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_6/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_38"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_7/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_39"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_8/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_40"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_9/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_41"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_10/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_42"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_11/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_43"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_12/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_44"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_13/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_45"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_14/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_46"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_15/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_47"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_16/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_48"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_17/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_49"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_18/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_50"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_19/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_51"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_20/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_52"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_21/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_53"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_22/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_54"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_23/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_55"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_24/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_56"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_25/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_57"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_26/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_58"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_27/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_59"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_28/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_60"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_29/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_61"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_30/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_62"
            },
            std::pair<std::string, std::string>{
                "/tasks:sum/processingElements:pe_31/interfaces:contOut_sum",
                "/system/interfaces:sum_syncSide_addrIn_63"
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
        .interconnectMasters = 79,
        .interconnectSlaves = 7,
        .isElaborated = true
    };
    return description;
}();



}