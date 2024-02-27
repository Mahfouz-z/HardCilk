#include "paper_exp_dae_0__peCountExecute_8__vssNumberExecute_1.hpp"

namespace paper_exp_dae_0::generated
{

paper_exp_dae_0__peCountExecute_8__vssNumberExecute_1::paper_exp_dae_0__peCountExecute_8__vssNumberExecute_1(sc_core::sc_module_name const &name):
    Vpaper_exp_dae_0__peCountExecute_8__vssNumberExecute_1(name),
    execute_stealSide_taskOut_0_signals_("execute_stealSide_taskOut_0_signals"),
    execute_stealSide_taskOut_1_signals_("execute_stealSide_taskOut_1_signals"),
    execute_stealSide_taskOut_2_signals_("execute_stealSide_taskOut_2_signals"),
    execute_stealSide_taskOut_3_signals_("execute_stealSide_taskOut_3_signals"),
    execute_stealSide_taskOut_4_signals_("execute_stealSide_taskOut_4_signals"),
    execute_stealSide_taskOut_5_signals_("execute_stealSide_taskOut_5_signals"),
    execute_stealSide_taskOut_6_signals_("execute_stealSide_taskOut_6_signals"),
    execute_stealSide_taskOut_7_signals_("execute_stealSide_taskOut_7_signals"),
    execute_stealSide_taskIn_0_signals_("execute_stealSide_taskIn_0_signals"),
    execute_stealSide_taskIn_1_signals_("execute_stealSide_taskIn_1_signals"),
    execute_stealSide_taskIn_2_signals_("execute_stealSide_taskIn_2_signals"),
    execute_stealSide_taskIn_3_signals_("execute_stealSide_taskIn_3_signals"),
    execute_stealSide_taskIn_4_signals_("execute_stealSide_taskIn_4_signals"),
    execute_stealSide_taskIn_5_signals_("execute_stealSide_taskIn_5_signals"),
    execute_stealSide_taskIn_6_signals_("execute_stealSide_taskIn_6_signals"),
    execute_stealSide_taskIn_7_signals_("execute_stealSide_taskIn_7_signals"),
    execute_stealSide_axi_mgmt_vss_0_signals_("execute_stealSide_axi_mgmt_vss_0_signals"),
    execute_stealSide_vss_axi_full_0_signals_("execute_stealSide_vss_axi_full_0_signals"),
    execute_stealSide_taskOut_0_bridge_("execute_stealSide_taskOut_0_bridge"),
    execute_stealSide_taskOut_1_bridge_("execute_stealSide_taskOut_1_bridge"),
    execute_stealSide_taskOut_2_bridge_("execute_stealSide_taskOut_2_bridge"),
    execute_stealSide_taskOut_3_bridge_("execute_stealSide_taskOut_3_bridge"),
    execute_stealSide_taskOut_4_bridge_("execute_stealSide_taskOut_4_bridge"),
    execute_stealSide_taskOut_5_bridge_("execute_stealSide_taskOut_5_bridge"),
    execute_stealSide_taskOut_6_bridge_("execute_stealSide_taskOut_6_bridge"),
    execute_stealSide_taskOut_7_bridge_("execute_stealSide_taskOut_7_bridge"),
    execute_stealSide_taskIn_0_bridge_("execute_stealSide_taskIn_0_bridge"),
    execute_stealSide_taskIn_1_bridge_("execute_stealSide_taskIn_1_bridge"),
    execute_stealSide_taskIn_2_bridge_("execute_stealSide_taskIn_2_bridge"),
    execute_stealSide_taskIn_3_bridge_("execute_stealSide_taskIn_3_bridge"),
    execute_stealSide_taskIn_4_bridge_("execute_stealSide_taskIn_4_bridge"),
    execute_stealSide_taskIn_5_bridge_("execute_stealSide_taskIn_5_bridge"),
    execute_stealSide_taskIn_6_bridge_("execute_stealSide_taskIn_6_bridge"),
    execute_stealSide_taskIn_7_bridge_("execute_stealSide_taskIn_7_bridge"),
    execute_stealSide_axi_mgmt_vss_0_bridge_("execute_stealSide_axi_mgmt_vss_0_bridge"),
    execute_stealSide_vss_axi_full_0_bridge_("execute_stealSide_vss_axi_full_0_bridge")
    
{
    do_connect_();

    /* initialize the map for accessing TLM sockets */
    sockets_["execute_stealSide_taskOut_0"] = &execute_stealSide_taskOut_0_bridge_.socket;
    sockets_["execute_stealSide_taskOut_1"] = &execute_stealSide_taskOut_1_bridge_.socket;
    sockets_["execute_stealSide_taskOut_2"] = &execute_stealSide_taskOut_2_bridge_.socket;
    sockets_["execute_stealSide_taskOut_3"] = &execute_stealSide_taskOut_3_bridge_.socket;
    sockets_["execute_stealSide_taskOut_4"] = &execute_stealSide_taskOut_4_bridge_.socket;
    sockets_["execute_stealSide_taskOut_5"] = &execute_stealSide_taskOut_5_bridge_.socket;
    sockets_["execute_stealSide_taskOut_6"] = &execute_stealSide_taskOut_6_bridge_.socket;
    sockets_["execute_stealSide_taskOut_7"] = &execute_stealSide_taskOut_7_bridge_.socket;
    sockets_["execute_stealSide_taskIn_0"] = &execute_stealSide_taskIn_0_bridge_.tgt_socket;
    sockets_["execute_stealSide_taskIn_1"] = &execute_stealSide_taskIn_1_bridge_.tgt_socket;
    sockets_["execute_stealSide_taskIn_2"] = &execute_stealSide_taskIn_2_bridge_.tgt_socket;
    sockets_["execute_stealSide_taskIn_3"] = &execute_stealSide_taskIn_3_bridge_.tgt_socket;
    sockets_["execute_stealSide_taskIn_4"] = &execute_stealSide_taskIn_4_bridge_.tgt_socket;
    sockets_["execute_stealSide_taskIn_5"] = &execute_stealSide_taskIn_5_bridge_.tgt_socket;
    sockets_["execute_stealSide_taskIn_6"] = &execute_stealSide_taskIn_6_bridge_.tgt_socket;
    sockets_["execute_stealSide_taskIn_7"] = &execute_stealSide_taskIn_7_bridge_.tgt_socket;
    sockets_["execute_stealSide_axi_mgmt_vss_0"] = &execute_stealSide_axi_mgmt_vss_0_bridge_.tgt_socket;
    sockets_["execute_stealSide_vss_axi_full_0"] = &execute_stealSide_vss_axi_full_0_bridge_.socket;

    /* thread that generates the ACTIVE_LOW reset signal */
    SC_THREAD(reset_n_generate_);
    sensitive << reset;

    do_init_();
}


void paper_exp_dae_0__peCountExecute_8__vssNumberExecute_1::reset_n_generate_()
{
    reset_n_.write(!reset.read());
}

void paper_exp_dae_0__peCountExecute_8__vssNumberExecute_1::do_connect_()
{
    /* initialize bridges */
    execute_stealSide_taskOut_0_bridge_.clk(clock);
    execute_stealSide_taskOut_0_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskOut_1_bridge_.clk(clock);
    execute_stealSide_taskOut_1_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskOut_2_bridge_.clk(clock);
    execute_stealSide_taskOut_2_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskOut_3_bridge_.clk(clock);
    execute_stealSide_taskOut_3_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskOut_4_bridge_.clk(clock);
    execute_stealSide_taskOut_4_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskOut_5_bridge_.clk(clock);
    execute_stealSide_taskOut_5_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskOut_6_bridge_.clk(clock);
    execute_stealSide_taskOut_6_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskOut_7_bridge_.clk(clock);
    execute_stealSide_taskOut_7_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_0_bridge_.clk(clock);
    execute_stealSide_taskIn_0_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_1_bridge_.clk(clock);
    execute_stealSide_taskIn_1_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_2_bridge_.clk(clock);
    execute_stealSide_taskIn_2_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_3_bridge_.clk(clock);
    execute_stealSide_taskIn_3_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_4_bridge_.clk(clock);
    execute_stealSide_taskIn_4_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_5_bridge_.clk(clock);
    execute_stealSide_taskIn_5_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_6_bridge_.clk(clock);
    execute_stealSide_taskIn_6_bridge_.resetn(reset_n_);
    
    execute_stealSide_taskIn_7_bridge_.clk(clock);
    execute_stealSide_taskIn_7_bridge_.resetn(reset_n_);
    
    execute_stealSide_axi_mgmt_vss_0_bridge_.clk(clock);
    execute_stealSide_axi_mgmt_vss_0_bridge_.resetn(reset_n_);
    
    execute_stealSide_vss_axi_full_0_bridge_.clk(clock);
    execute_stealSide_vss_axi_full_0_bridge_.resetn(reset_n_);
    


    /* connect bridges */
    execute_stealSide_taskOut_0_signals_.connect(execute_stealSide_taskOut_0_bridge_);
    execute_stealSide_taskOut_1_signals_.connect(execute_stealSide_taskOut_1_bridge_);
    execute_stealSide_taskOut_2_signals_.connect(execute_stealSide_taskOut_2_bridge_);
    execute_stealSide_taskOut_3_signals_.connect(execute_stealSide_taskOut_3_bridge_);
    execute_stealSide_taskOut_4_signals_.connect(execute_stealSide_taskOut_4_bridge_);
    execute_stealSide_taskOut_5_signals_.connect(execute_stealSide_taskOut_5_bridge_);
    execute_stealSide_taskOut_6_signals_.connect(execute_stealSide_taskOut_6_bridge_);
    execute_stealSide_taskOut_7_signals_.connect(execute_stealSide_taskOut_7_bridge_);
    execute_stealSide_taskIn_0_signals_.connect(execute_stealSide_taskIn_0_bridge_);
    execute_stealSide_taskIn_1_signals_.connect(execute_stealSide_taskIn_1_bridge_);
    execute_stealSide_taskIn_2_signals_.connect(execute_stealSide_taskIn_2_bridge_);
    execute_stealSide_taskIn_3_signals_.connect(execute_stealSide_taskIn_3_bridge_);
    execute_stealSide_taskIn_4_signals_.connect(execute_stealSide_taskIn_4_bridge_);
    execute_stealSide_taskIn_5_signals_.connect(execute_stealSide_taskIn_5_bridge_);
    execute_stealSide_taskIn_6_signals_.connect(execute_stealSide_taskIn_6_bridge_);
    execute_stealSide_taskIn_7_signals_.connect(execute_stealSide_taskIn_7_bridge_);
    execute_stealSide_axi_mgmt_vss_0_signals_.connect(execute_stealSide_axi_mgmt_vss_0_bridge_);
    execute_stealSide_vss_axi_full_0_signals_.connect(execute_stealSide_vss_axi_full_0_bridge_);


    /* connect signals */
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_0 */
    /* is_slave = False */
    execute_stealSide_taskOut_0_TREADY(execute_stealSide_taskOut_0_signals_.tready);
    execute_stealSide_taskOut_0_TVALID(execute_stealSide_taskOut_0_signals_.tvalid);
    execute_stealSide_taskOut_0_TDATA(execute_stealSide_taskOut_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_1 */
    /* is_slave = False */
    execute_stealSide_taskOut_1_TREADY(execute_stealSide_taskOut_1_signals_.tready);
    execute_stealSide_taskOut_1_TVALID(execute_stealSide_taskOut_1_signals_.tvalid);
    execute_stealSide_taskOut_1_TDATA(execute_stealSide_taskOut_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_2 */
    /* is_slave = False */
    execute_stealSide_taskOut_2_TREADY(execute_stealSide_taskOut_2_signals_.tready);
    execute_stealSide_taskOut_2_TVALID(execute_stealSide_taskOut_2_signals_.tvalid);
    execute_stealSide_taskOut_2_TDATA(execute_stealSide_taskOut_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_3 */
    /* is_slave = False */
    execute_stealSide_taskOut_3_TREADY(execute_stealSide_taskOut_3_signals_.tready);
    execute_stealSide_taskOut_3_TVALID(execute_stealSide_taskOut_3_signals_.tvalid);
    execute_stealSide_taskOut_3_TDATA(execute_stealSide_taskOut_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_4 */
    /* is_slave = False */
    execute_stealSide_taskOut_4_TREADY(execute_stealSide_taskOut_4_signals_.tready);
    execute_stealSide_taskOut_4_TVALID(execute_stealSide_taskOut_4_signals_.tvalid);
    execute_stealSide_taskOut_4_TDATA(execute_stealSide_taskOut_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_5 */
    /* is_slave = False */
    execute_stealSide_taskOut_5_TREADY(execute_stealSide_taskOut_5_signals_.tready);
    execute_stealSide_taskOut_5_TVALID(execute_stealSide_taskOut_5_signals_.tvalid);
    execute_stealSide_taskOut_5_TDATA(execute_stealSide_taskOut_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_6 */
    /* is_slave = False */
    execute_stealSide_taskOut_6_TREADY(execute_stealSide_taskOut_6_signals_.tready);
    execute_stealSide_taskOut_6_TVALID(execute_stealSide_taskOut_6_signals_.tvalid);
    execute_stealSide_taskOut_6_TDATA(execute_stealSide_taskOut_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskOut_7 */
    /* is_slave = False */
    execute_stealSide_taskOut_7_TREADY(execute_stealSide_taskOut_7_signals_.tready);
    execute_stealSide_taskOut_7_TVALID(execute_stealSide_taskOut_7_signals_.tvalid);
    execute_stealSide_taskOut_7_TDATA(execute_stealSide_taskOut_7_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_0 */
    /* is_slave = True */
    execute_stealSide_taskIn_0_TREADY(execute_stealSide_taskIn_0_signals_.tready);
    execute_stealSide_taskIn_0_TVALID(execute_stealSide_taskIn_0_signals_.tvalid);
    execute_stealSide_taskIn_0_TDATA(execute_stealSide_taskIn_0_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_1 */
    /* is_slave = True */
    execute_stealSide_taskIn_1_TREADY(execute_stealSide_taskIn_1_signals_.tready);
    execute_stealSide_taskIn_1_TVALID(execute_stealSide_taskIn_1_signals_.tvalid);
    execute_stealSide_taskIn_1_TDATA(execute_stealSide_taskIn_1_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_2 */
    /* is_slave = True */
    execute_stealSide_taskIn_2_TREADY(execute_stealSide_taskIn_2_signals_.tready);
    execute_stealSide_taskIn_2_TVALID(execute_stealSide_taskIn_2_signals_.tvalid);
    execute_stealSide_taskIn_2_TDATA(execute_stealSide_taskIn_2_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_3 */
    /* is_slave = True */
    execute_stealSide_taskIn_3_TREADY(execute_stealSide_taskIn_3_signals_.tready);
    execute_stealSide_taskIn_3_TVALID(execute_stealSide_taskIn_3_signals_.tvalid);
    execute_stealSide_taskIn_3_TDATA(execute_stealSide_taskIn_3_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_4 */
    /* is_slave = True */
    execute_stealSide_taskIn_4_TREADY(execute_stealSide_taskIn_4_signals_.tready);
    execute_stealSide_taskIn_4_TVALID(execute_stealSide_taskIn_4_signals_.tvalid);
    execute_stealSide_taskIn_4_TDATA(execute_stealSide_taskIn_4_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_5 */
    /* is_slave = True */
    execute_stealSide_taskIn_5_TREADY(execute_stealSide_taskIn_5_signals_.tready);
    execute_stealSide_taskIn_5_TVALID(execute_stealSide_taskIn_5_signals_.tvalid);
    execute_stealSide_taskIn_5_TDATA(execute_stealSide_taskIn_5_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_6 */
    /* is_slave = True */
    execute_stealSide_taskIn_6_TREADY(execute_stealSide_taskIn_6_signals_.tready);
    execute_stealSide_taskIn_6_TVALID(execute_stealSide_taskIn_6_signals_.tvalid);
    execute_stealSide_taskIn_6_TDATA(execute_stealSide_taskIn_6_signals_.tdata);
    
    
    /* connecting AXI Stream interface with name: execute_stealSide_taskIn_7 */
    /* is_slave = True */
    execute_stealSide_taskIn_7_TREADY(execute_stealSide_taskIn_7_signals_.tready);
    execute_stealSide_taskIn_7_TVALID(execute_stealSide_taskIn_7_signals_.tvalid);
    execute_stealSide_taskIn_7_TDATA(execute_stealSide_taskIn_7_signals_.tdata);
    
    
    /* connecting AXI4-Lite interface with name: execute_stealSide_axi_mgmt_vss_0 */
    /* is_slave = True */
    execute_stealSide_axi_mgmt_vss_0_AWVALID(execute_stealSide_axi_mgmt_vss_0_signals_.awvalid);
    execute_stealSide_axi_mgmt_vss_0_AWREADY(execute_stealSide_axi_mgmt_vss_0_signals_.awready);
    execute_stealSide_axi_mgmt_vss_0_AWADDR(execute_stealSide_axi_mgmt_vss_0_signals_.awaddr);
    execute_stealSide_axi_mgmt_vss_0_AWPROT(execute_stealSide_axi_mgmt_vss_0_signals_.awprot);
    execute_stealSide_axi_mgmt_vss_0_WVALID(execute_stealSide_axi_mgmt_vss_0_signals_.wvalid);
    execute_stealSide_axi_mgmt_vss_0_WREADY(execute_stealSide_axi_mgmt_vss_0_signals_.wready);
    execute_stealSide_axi_mgmt_vss_0_WDATA(execute_stealSide_axi_mgmt_vss_0_signals_.wdata);
    execute_stealSide_axi_mgmt_vss_0_WSTRB(execute_stealSide_axi_mgmt_vss_0_signals_.wstrb);
    execute_stealSide_axi_mgmt_vss_0_BVALID(execute_stealSide_axi_mgmt_vss_0_signals_.bvalid);
    execute_stealSide_axi_mgmt_vss_0_BREADY(execute_stealSide_axi_mgmt_vss_0_signals_.bready);
    execute_stealSide_axi_mgmt_vss_0_BRESP(execute_stealSide_axi_mgmt_vss_0_signals_.bresp);
    execute_stealSide_axi_mgmt_vss_0_ARVALID(execute_stealSide_axi_mgmt_vss_0_signals_.arvalid);
    execute_stealSide_axi_mgmt_vss_0_ARREADY(execute_stealSide_axi_mgmt_vss_0_signals_.arready);
    execute_stealSide_axi_mgmt_vss_0_ARADDR(execute_stealSide_axi_mgmt_vss_0_signals_.araddr);
    execute_stealSide_axi_mgmt_vss_0_ARPROT(execute_stealSide_axi_mgmt_vss_0_signals_.arprot);
    execute_stealSide_axi_mgmt_vss_0_RVALID(execute_stealSide_axi_mgmt_vss_0_signals_.rvalid);
    execute_stealSide_axi_mgmt_vss_0_RREADY(execute_stealSide_axi_mgmt_vss_0_signals_.rready);
    execute_stealSide_axi_mgmt_vss_0_RDATA(execute_stealSide_axi_mgmt_vss_0_signals_.rdata);
    execute_stealSide_axi_mgmt_vss_0_RRESP(execute_stealSide_axi_mgmt_vss_0_signals_.rresp);
    
    
    /* connecting AXI4 interface with name: execute_stealSide_vss_axi_full_0 */
    /* is_slave = False */
    execute_stealSide_vss_axi_full_0_AWVALID(execute_stealSide_vss_axi_full_0_signals_.awvalid);
    execute_stealSide_vss_axi_full_0_AWREADY(execute_stealSide_vss_axi_full_0_signals_.awready);
    execute_stealSide_vss_axi_full_0_AWADDR(execute_stealSide_vss_axi_full_0_signals_.awaddr);
    execute_stealSide_vss_axi_full_0_AWPROT(execute_stealSide_vss_axi_full_0_signals_.awprot);
    execute_stealSide_vss_axi_full_0_AWREGION(execute_stealSide_vss_axi_full_0_signals_.awregion);
    execute_stealSide_vss_axi_full_0_AWQOS(execute_stealSide_vss_axi_full_0_signals_.awqos);
    execute_stealSide_vss_axi_full_0_AWCACHE(execute_stealSide_vss_axi_full_0_signals_.awcache);
    execute_stealSide_vss_axi_full_0_AWBURST(execute_stealSide_vss_axi_full_0_signals_.awburst);
    execute_stealSide_vss_axi_full_0_AWSIZE(execute_stealSide_vss_axi_full_0_signals_.awsize);
    execute_stealSide_vss_axi_full_0_AWLEN(execute_stealSide_vss_axi_full_0_signals_.awlen);
    execute_stealSide_vss_axi_full_0_AWID(execute_stealSide_vss_axi_full_0_signals_.awid);
    execute_stealSide_vss_axi_full_0_AWLOCK(execute_stealSide_vss_axi_full_0_signals_.awlock);
    execute_stealSide_vss_axi_full_0_WID(execute_stealSide_vss_axi_full_0_signals_.wid);
    execute_stealSide_vss_axi_full_0_WVALID(execute_stealSide_vss_axi_full_0_signals_.wvalid);
    execute_stealSide_vss_axi_full_0_WREADY(execute_stealSide_vss_axi_full_0_signals_.wready);
    execute_stealSide_vss_axi_full_0_WDATA(execute_stealSide_vss_axi_full_0_signals_.wdata);
    execute_stealSide_vss_axi_full_0_WSTRB(execute_stealSide_vss_axi_full_0_signals_.wstrb);
    execute_stealSide_vss_axi_full_0_WLAST(execute_stealSide_vss_axi_full_0_signals_.wlast);
    execute_stealSide_vss_axi_full_0_BVALID(execute_stealSide_vss_axi_full_0_signals_.bvalid);
    execute_stealSide_vss_axi_full_0_BREADY(execute_stealSide_vss_axi_full_0_signals_.bready);
    execute_stealSide_vss_axi_full_0_BRESP(execute_stealSide_vss_axi_full_0_signals_.bresp);
    execute_stealSide_vss_axi_full_0_BID(execute_stealSide_vss_axi_full_0_signals_.bid);
    execute_stealSide_vss_axi_full_0_ARVALID(execute_stealSide_vss_axi_full_0_signals_.arvalid);
    execute_stealSide_vss_axi_full_0_ARREADY(execute_stealSide_vss_axi_full_0_signals_.arready);
    execute_stealSide_vss_axi_full_0_ARADDR(execute_stealSide_vss_axi_full_0_signals_.araddr);
    execute_stealSide_vss_axi_full_0_ARPROT(execute_stealSide_vss_axi_full_0_signals_.arprot);
    execute_stealSide_vss_axi_full_0_ARREGION(execute_stealSide_vss_axi_full_0_signals_.arregion);
    execute_stealSide_vss_axi_full_0_ARQOS(execute_stealSide_vss_axi_full_0_signals_.arqos);
    execute_stealSide_vss_axi_full_0_ARCACHE(execute_stealSide_vss_axi_full_0_signals_.arcache);
    execute_stealSide_vss_axi_full_0_ARBURST(execute_stealSide_vss_axi_full_0_signals_.arburst);
    execute_stealSide_vss_axi_full_0_ARSIZE(execute_stealSide_vss_axi_full_0_signals_.arsize);
    execute_stealSide_vss_axi_full_0_ARLEN(execute_stealSide_vss_axi_full_0_signals_.arlen);
    execute_stealSide_vss_axi_full_0_ARID(execute_stealSide_vss_axi_full_0_signals_.arid);
    execute_stealSide_vss_axi_full_0_ARLOCK(execute_stealSide_vss_axi_full_0_signals_.arlock);
    execute_stealSide_vss_axi_full_0_RVALID(execute_stealSide_vss_axi_full_0_signals_.rvalid);
    execute_stealSide_vss_axi_full_0_RREADY(execute_stealSide_vss_axi_full_0_signals_.rready);
    execute_stealSide_vss_axi_full_0_RDATA(execute_stealSide_vss_axi_full_0_signals_.rdata);
    execute_stealSide_vss_axi_full_0_RRESP(execute_stealSide_vss_axi_full_0_signals_.rresp);
    execute_stealSide_vss_axi_full_0_RID(execute_stealSide_vss_axi_full_0_signals_.rid);
    execute_stealSide_vss_axi_full_0_RLAST(execute_stealSide_vss_axi_full_0_signals_.rlast);
    
    
}

void paper_exp_dae_0__peCountExecute_8__vssNumberExecute_1::do_init_()
{
    set("clock", clock);
    set("reset", reset);
    set("description", description);
}

hardcilk::desc::HardCilkSystem paper_exp_dae_0__peCountExecute_8__vssNumberExecute_1::description = [] {
    using namespace hardcilk::desc;
    auto description = HardCilkSystem{
        .tasks = []() {
            std::map<std::string, Task> r;
            r["execute"] = Task{
                .name = "execute",
                .parent = "/tasks",
                .path = "/tasks:execute",
                .isRoot = true,
                .isCont = false,
                .widthTask = 64,
                .widthCont = 64,
                .widthArg = 64,
                .numProcessingElements = 8,
                .processingElements = []() {
                    std::map<std::string, ProcessingElement> r;
                    r["pe_0"] = ProcessingElement{
                        .name = "pe_0",
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_0",
                        .portName = "execute_PE_0",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_0",
                                .path = "/tasks:execute/processingElements:pe_0/interfaces:mem",
                                .portName = "execute_PE_0_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_0",
                                .path = "/tasks:execute/processingElements:pe_0/interfaces:taskIn",
                                .portName = "execute_PE_0_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_0",
                                .path = "/tasks:execute/processingElements:pe_0/interfaces:taskOut",
                                .portName = "execute_PE_0_taskOut",
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
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_1",
                        .portName = "execute_PE_1",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_1",
                                .path = "/tasks:execute/processingElements:pe_1/interfaces:mem",
                                .portName = "execute_PE_1_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_1",
                                .path = "/tasks:execute/processingElements:pe_1/interfaces:taskIn",
                                .portName = "execute_PE_1_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_1",
                                .path = "/tasks:execute/processingElements:pe_1/interfaces:taskOut",
                                .portName = "execute_PE_1_taskOut",
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
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_2",
                        .portName = "execute_PE_2",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_2",
                                .path = "/tasks:execute/processingElements:pe_2/interfaces:mem",
                                .portName = "execute_PE_2_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_2",
                                .path = "/tasks:execute/processingElements:pe_2/interfaces:taskIn",
                                .portName = "execute_PE_2_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_2",
                                .path = "/tasks:execute/processingElements:pe_2/interfaces:taskOut",
                                .portName = "execute_PE_2_taskOut",
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
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_3",
                        .portName = "execute_PE_3",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_3",
                                .path = "/tasks:execute/processingElements:pe_3/interfaces:mem",
                                .portName = "execute_PE_3_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_3",
                                .path = "/tasks:execute/processingElements:pe_3/interfaces:taskIn",
                                .portName = "execute_PE_3_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_3",
                                .path = "/tasks:execute/processingElements:pe_3/interfaces:taskOut",
                                .portName = "execute_PE_3_taskOut",
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
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_4",
                        .portName = "execute_PE_4",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_4",
                                .path = "/tasks:execute/processingElements:pe_4/interfaces:mem",
                                .portName = "execute_PE_4_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_4",
                                .path = "/tasks:execute/processingElements:pe_4/interfaces:taskIn",
                                .portName = "execute_PE_4_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_4",
                                .path = "/tasks:execute/processingElements:pe_4/interfaces:taskOut",
                                .portName = "execute_PE_4_taskOut",
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
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_5",
                        .portName = "execute_PE_5",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_5",
                                .path = "/tasks:execute/processingElements:pe_5/interfaces:mem",
                                .portName = "execute_PE_5_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_5",
                                .path = "/tasks:execute/processingElements:pe_5/interfaces:taskIn",
                                .portName = "execute_PE_5_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_5",
                                .path = "/tasks:execute/processingElements:pe_5/interfaces:taskOut",
                                .portName = "execute_PE_5_taskOut",
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
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_6",
                        .portName = "execute_PE_6",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_6",
                                .path = "/tasks:execute/processingElements:pe_6/interfaces:mem",
                                .portName = "execute_PE_6_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_6",
                                .path = "/tasks:execute/processingElements:pe_6/interfaces:taskIn",
                                .portName = "execute_PE_6_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_6",
                                .path = "/tasks:execute/processingElements:pe_6/interfaces:taskOut",
                                .portName = "execute_PE_6_taskOut",
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
                        .parent = "/tasks:execute",
                        .path = "/tasks:execute/processingElements:pe_7",
                        .portName = "execute_PE_7",
                        .interfaces = []() {
                            std::map<std::string, Interface> r;
                            r["mem"] = Interface{
                                .name = "mem",
                                .parent = "/tasks:execute/processingElements:pe_7",
                                .path = "/tasks:execute/processingElements:pe_7/interfaces:mem",
                                .portName = "execute_PE_7_mem",
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
                                .parent = "/tasks:execute/processingElements:pe_7",
                                .path = "/tasks:execute/processingElements:pe_7/interfaces:taskIn",
                                .portName = "execute_PE_7_taskIn",
                                .protocol = InterfaceProtocol::Axis,
                                .isSlave = true,
                                .config = AxisConfig{
                                    .data_width = 64,
                                    .user_width = 0,
                                    .no_tstrb = true,
                                    .no_tlast = true
                                }
                            };
                            r["taskOut"] = Interface{
                                .name = "taskOut",
                                .parent = "/tasks:execute/processingElements:pe_7",
                                .path = "/tasks:execute/processingElements:pe_7/interfaces:taskOut",
                                .portName = "execute_PE_7_taskOut",
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
                .capacityVirtualStealQueue = 10000000,
                .virtualStealServers = []() {
                    std::map<std::string, VirtualStealServer> r;
                    r["vss_0"] = VirtualStealServer{
                        .name = "vss_0",
                        .parent = "execute",
                        .path = "/tasks:execute/virtualStealServers:vss_0",
                        .addressSpace = AddressSpace{
                            .base = addr_type(0x000000003ff00000ull),
                            .size = addr_type(0x0000000000010000ull)
                        },
                        .pathInterface = "/system/interfaces:execute_stealSide_axi_mgmt_vss_0",
                        .capacity = 10000000,
                        .numBytesTask = 8
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
                r["execute_stealSide_taskOut_0"] = Interface{
                    .name = "execute_stealSide_taskOut_0",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_0",
                    .portName = "execute_stealSide_taskOut_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskOut_1"] = Interface{
                    .name = "execute_stealSide_taskOut_1",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_1",
                    .portName = "execute_stealSide_taskOut_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskOut_2"] = Interface{
                    .name = "execute_stealSide_taskOut_2",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_2",
                    .portName = "execute_stealSide_taskOut_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskOut_3"] = Interface{
                    .name = "execute_stealSide_taskOut_3",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_3",
                    .portName = "execute_stealSide_taskOut_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskOut_4"] = Interface{
                    .name = "execute_stealSide_taskOut_4",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_4",
                    .portName = "execute_stealSide_taskOut_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskOut_5"] = Interface{
                    .name = "execute_stealSide_taskOut_5",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_5",
                    .portName = "execute_stealSide_taskOut_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskOut_6"] = Interface{
                    .name = "execute_stealSide_taskOut_6",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_6",
                    .portName = "execute_stealSide_taskOut_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskOut_7"] = Interface{
                    .name = "execute_stealSide_taskOut_7",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskOut_7",
                    .portName = "execute_stealSide_taskOut_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = false,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_0"] = Interface{
                    .name = "execute_stealSide_taskIn_0",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_0",
                    .portName = "execute_stealSide_taskIn_0",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_1"] = Interface{
                    .name = "execute_stealSide_taskIn_1",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_1",
                    .portName = "execute_stealSide_taskIn_1",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_2"] = Interface{
                    .name = "execute_stealSide_taskIn_2",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_2",
                    .portName = "execute_stealSide_taskIn_2",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_3"] = Interface{
                    .name = "execute_stealSide_taskIn_3",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_3",
                    .portName = "execute_stealSide_taskIn_3",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_4"] = Interface{
                    .name = "execute_stealSide_taskIn_4",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_4",
                    .portName = "execute_stealSide_taskIn_4",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_5"] = Interface{
                    .name = "execute_stealSide_taskIn_5",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_5",
                    .portName = "execute_stealSide_taskIn_5",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_6"] = Interface{
                    .name = "execute_stealSide_taskIn_6",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_6",
                    .portName = "execute_stealSide_taskIn_6",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_taskIn_7"] = Interface{
                    .name = "execute_stealSide_taskIn_7",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_taskIn_7",
                    .portName = "execute_stealSide_taskIn_7",
                    .protocol = InterfaceProtocol::Axis,
                    .isSlave = true,
                    .config = AxisConfig{
                        .data_width = 64,
                        .user_width = 0,
                        .no_tstrb = true,
                        .no_tlast = true
                    }
                };
                r["execute_stealSide_axi_mgmt_vss_0"] = Interface{
                    .name = "execute_stealSide_axi_mgmt_vss_0",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_axi_mgmt_vss_0",
                    .portName = "execute_stealSide_axi_mgmt_vss_0",
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
                r["execute_stealSide_vss_axi_full_0"] = Interface{
                    .name = "execute_stealSide_vss_axi_full_0",
                    .parent = "/system",
                    .path = "/system/interfaces:execute_stealSide_vss_axi_full_0",
                    .portName = "execute_stealSide_vss_axi_full_0",
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
                return r;
            }()
        },
        .connections = std::vector<std::pair<std::string, std::string>>{
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_0",
                "/tasks:execute/processingElements:pe_0/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_1",
                "/tasks:execute/processingElements:pe_1/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_2",
                "/tasks:execute/processingElements:pe_2/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_3",
                "/tasks:execute/processingElements:pe_3/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_4",
                "/tasks:execute/processingElements:pe_4/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_5",
                "/tasks:execute/processingElements:pe_5/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_6",
                "/tasks:execute/processingElements:pe_6/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/system/interfaces:execute_stealSide_taskOut_7",
                "/tasks:execute/processingElements:pe_7/interfaces:taskIn"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_0/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_0"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_1/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_1"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_2/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_2"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_3/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_3"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_4/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_4"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_5/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_5"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_6/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_6"
            },
            std::pair<std::string, std::string>{
                "/tasks:execute/processingElements:pe_7/interfaces:taskOut",
                "/system/interfaces:execute_stealSide_taskIn_7"
            }
        },
        .widthAddress = 64,
        .widthContinuationCounter = 32,
        .spawnList = []() {
            std::map<std::string, std::vector<std::string>> r;
            r["execute"] = std::vector<std::string>{
                "execute"
            };
            return r;
        }(),
        .managementBase = addr_type(0x000000003ff00000ull),
        .memory = AddressSpace{
            .base = addr_type(0x0000000040000000ull),
            .size = addr_type(0x00000000c0000000ull)
        },
        .interconnectMasters = 10,
        .interconnectSlaves = 2,
        .isElaborated = true
    };
    return description;
}();



}