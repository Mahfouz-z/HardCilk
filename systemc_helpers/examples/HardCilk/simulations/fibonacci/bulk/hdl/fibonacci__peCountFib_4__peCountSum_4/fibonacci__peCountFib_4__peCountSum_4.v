module stealNetworkDataUnit(
  input          clock,
  input          reset,
  input  [255:0] io_taskIn,
  output [255:0] io_taskOut,
  input          io_validIn,
  output         io_validOut,
  input          io_connSS_availableTask_ready,
  output         io_connSS_availableTask_valid,
  output [255:0] io_connSS_availableTask_bits,
  output         io_connSS_qOutTask_ready,
  input          io_connSS_qOutTask_valid,
  input  [255:0] io_connSS_qOutTask_bits,
  output         io_occupied
);
`ifdef RANDOMIZE_REG_INIT
  reg [255:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [255:0] taskReg; // @[stealNetworkDataUnit.scala 32:33]
  reg  validReg; // @[stealNetworkDataUnit.scala 33:33]
  wire  _T_2 = io_connSS_qOutTask_valid & ~io_validIn; // @[stealNetworkDataUnit.scala 50:41]
  wire  _GEN_2 = io_connSS_qOutTask_valid & ~io_validIn | io_validIn; // @[stealNetworkDataUnit.scala 50:56 51:32]
  assign io_taskOut = taskReg; // @[stealNetworkDataUnit.scala 63:25]
  assign io_validOut = validReg; // @[stealNetworkDataUnit.scala 64:25]
  assign io_connSS_availableTask_valid = io_connSS_availableTask_ready & io_validIn; // @[stealNetworkDataUnit.scala 45:40]
  assign io_connSS_availableTask_bits = io_connSS_availableTask_ready & io_validIn ? io_taskIn : 256'h0; // @[stealNetworkDataUnit.scala 42:35 45:54 49:37]
  assign io_connSS_qOutTask_ready = io_connSS_availableTask_ready & io_validIn ? 1'h0 : _T_2; // @[stealNetworkDataUnit.scala 41:30 45:54]
  assign io_occupied = validReg; // @[stealNetworkDataUnit.scala 65:25]
  always @(posedge clock) begin
    if (reset) begin // @[stealNetworkDataUnit.scala 32:33]
      taskReg <= 256'h0; // @[stealNetworkDataUnit.scala 32:33]
    end else if (io_connSS_availableTask_ready & io_validIn) begin // @[stealNetworkDataUnit.scala 45:54]
      taskReg <= 256'h0; // @[stealNetworkDataUnit.scala 47:37]
    end else if (io_connSS_qOutTask_valid & ~io_validIn) begin // @[stealNetworkDataUnit.scala 50:56]
      taskReg <= io_connSS_qOutTask_bits; // @[stealNetworkDataUnit.scala 52:32]
    end else if (io_validIn) begin // @[stealNetworkDataUnit.scala 54:27]
      taskReg <= io_taskIn; // @[stealNetworkDataUnit.scala 56:19]
    end else begin
      taskReg <= 256'h0; // @[stealNetworkDataUnit.scala 59:22]
    end
    if (reset) begin // @[stealNetworkDataUnit.scala 33:33]
      validReg <= 1'h0; // @[stealNetworkDataUnit.scala 33:33]
    end else if (io_connSS_availableTask_ready & io_validIn) begin // @[stealNetworkDataUnit.scala 45:54]
      validReg <= 1'h0; // @[stealNetworkDataUnit.scala 46:37]
    end else begin
      validReg <= _GEN_2;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {8{`RANDOM}};
  taskReg = _RAND_0[255:0];
  _RAND_1 = {1{`RANDOM}};
  validReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module stealNetworkCtrlUnit(
  input   clock,
  input   reset,
  input   io_reqTaskIn,
  output  io_reqTaskOut,
  output  io_connSS_serveStealReq_ready,
  input   io_connSS_serveStealReq_valid,
  output  io_connSS_stealReq_ready,
  input   io_connSS_stealReq_valid
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  stealReqReg; // @[stealNetworkCtrlUnit.scala 20:28]
  wire  _GEN_0 = io_connSS_serveStealReq_valid ? 1'h0 : stealReqReg; // @[stealNetworkCtrlUnit.scala 24:44 25:19 27:19]
  assign io_reqTaskOut = io_connSS_stealReq_valid | _GEN_0; // @[stealNetworkCtrlUnit.scala 22:33 23:19]
  assign io_connSS_serveStealReq_ready = stealReqReg; // @[stealNetworkCtrlUnit.scala 31:33]
  assign io_connSS_stealReq_ready = ~stealReqReg; // @[stealNetworkCtrlUnit.scala 30:36]
  always @(posedge clock) begin
    if (reset) begin // @[stealNetworkCtrlUnit.scala 20:28]
      stealReqReg <= 1'h0; // @[stealNetworkCtrlUnit.scala 20:28]
    end else begin
      stealReqReg <= io_reqTaskIn; // @[stealNetworkCtrlUnit.scala 32:33]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stealReqReg = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module stealNetwork(
  input          clock,
  input          reset,
  output         io_connSS_0_ctrl_serveStealReq_ready,
  input          io_connSS_0_ctrl_serveStealReq_valid,
  input          io_connSS_0_data_availableTask_ready,
  output         io_connSS_0_data_availableTask_valid,
  output [255:0] io_connSS_0_data_availableTask_bits,
  output         io_connSS_0_data_qOutTask_ready,
  input          io_connSS_0_data_qOutTask_valid,
  input  [255:0] io_connSS_0_data_qOutTask_bits,
  output         io_connSS_1_ctrl_serveStealReq_ready,
  input          io_connSS_1_ctrl_serveStealReq_valid,
  output         io_connSS_1_data_qOutTask_ready,
  input          io_connSS_1_data_qOutTask_valid,
  input  [255:0] io_connSS_1_data_qOutTask_bits,
  output         io_connSS_2_ctrl_serveStealReq_ready,
  input          io_connSS_2_ctrl_serveStealReq_valid,
  output         io_connSS_2_ctrl_stealReq_ready,
  input          io_connSS_2_ctrl_stealReq_valid,
  input          io_connSS_2_data_availableTask_ready,
  output         io_connSS_2_data_availableTask_valid,
  output [255:0] io_connSS_2_data_availableTask_bits,
  output         io_connSS_2_data_qOutTask_ready,
  input          io_connSS_2_data_qOutTask_valid,
  input  [255:0] io_connSS_2_data_qOutTask_bits,
  output         io_connSS_3_ctrl_serveStealReq_ready,
  input          io_connSS_3_ctrl_serveStealReq_valid,
  output         io_connSS_3_data_qOutTask_ready,
  input          io_connSS_3_data_qOutTask_valid,
  input  [255:0] io_connSS_3_data_qOutTask_bits,
  output         io_connSS_4_ctrl_serveStealReq_ready,
  input          io_connSS_4_ctrl_serveStealReq_valid,
  output         io_connSS_4_ctrl_stealReq_ready,
  input          io_connSS_4_ctrl_stealReq_valid,
  input          io_connSS_4_data_availableTask_ready,
  output         io_connSS_4_data_availableTask_valid,
  output [255:0] io_connSS_4_data_availableTask_bits,
  output         io_connSS_4_data_qOutTask_ready,
  input          io_connSS_4_data_qOutTask_valid,
  input  [255:0] io_connSS_4_data_qOutTask_bits,
  output         io_connSS_5_ctrl_serveStealReq_ready,
  input          io_connSS_5_ctrl_serveStealReq_valid,
  output         io_connSS_5_data_qOutTask_ready,
  input          io_connSS_5_data_qOutTask_valid,
  input  [255:0] io_connSS_5_data_qOutTask_bits,
  output         io_connSS_6_ctrl_serveStealReq_ready,
  input          io_connSS_6_ctrl_serveStealReq_valid,
  output         io_connSS_6_ctrl_stealReq_ready,
  input          io_connSS_6_ctrl_stealReq_valid,
  input          io_connSS_6_data_availableTask_ready,
  output         io_connSS_6_data_availableTask_valid,
  output [255:0] io_connSS_6_data_availableTask_bits,
  output         io_connSS_6_data_qOutTask_ready,
  input          io_connSS_6_data_qOutTask_valid,
  input  [255:0] io_connSS_6_data_qOutTask_bits,
  output         io_connSS_7_ctrl_serveStealReq_ready,
  input          io_connSS_7_ctrl_serveStealReq_valid,
  output         io_connSS_7_data_qOutTask_ready,
  input          io_connSS_7_data_qOutTask_valid,
  input  [255:0] io_connSS_7_data_qOutTask_bits,
  output         io_connSS_8_ctrl_serveStealReq_ready,
  input          io_connSS_8_ctrl_serveStealReq_valid,
  output         io_connSS_8_ctrl_stealReq_ready,
  input          io_connSS_8_ctrl_stealReq_valid,
  input          io_connSS_8_data_availableTask_ready,
  output         io_connSS_8_data_availableTask_valid,
  output [255:0] io_connSS_8_data_availableTask_bits,
  output         io_connSS_8_data_qOutTask_ready,
  input          io_connSS_8_data_qOutTask_valid,
  input  [255:0] io_connSS_8_data_qOutTask_bits,
  output         io_ntwDataUnitOccupancyVSS_0
);
  wire  dataUnits_0_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_0_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_0_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_0_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_0_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_1_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_1_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_1_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_1_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_2_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_2_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_2_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_2_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_3_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_3_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_3_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_3_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_4_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_4_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_4_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_5_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_5_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_5_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_5_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_6_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_6_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_6_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_6_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_7_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_7_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_7_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_7_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_reset; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_8_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_8_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_8_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [255:0] dataUnits_8_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_occupied; // @[stealNetwork.scala 23:42]
  wire  ctrlunits_0_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_8_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  stealNetworkDataUnit dataUnits_0 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_0_clock),
    .reset(dataUnits_0_reset),
    .io_taskIn(dataUnits_0_io_taskIn),
    .io_taskOut(dataUnits_0_io_taskOut),
    .io_validIn(dataUnits_0_io_validIn),
    .io_validOut(dataUnits_0_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_0_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_0_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_0_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_0_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_0_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_0_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_0_io_occupied)
  );
  stealNetworkDataUnit dataUnits_1 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_1_clock),
    .reset(dataUnits_1_reset),
    .io_taskIn(dataUnits_1_io_taskIn),
    .io_taskOut(dataUnits_1_io_taskOut),
    .io_validIn(dataUnits_1_io_validIn),
    .io_validOut(dataUnits_1_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_1_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_1_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_1_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_1_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_1_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_1_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_1_io_occupied)
  );
  stealNetworkDataUnit dataUnits_2 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_2_clock),
    .reset(dataUnits_2_reset),
    .io_taskIn(dataUnits_2_io_taskIn),
    .io_taskOut(dataUnits_2_io_taskOut),
    .io_validIn(dataUnits_2_io_validIn),
    .io_validOut(dataUnits_2_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_2_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_2_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_2_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_2_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_2_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_2_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_2_io_occupied)
  );
  stealNetworkDataUnit dataUnits_3 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_3_clock),
    .reset(dataUnits_3_reset),
    .io_taskIn(dataUnits_3_io_taskIn),
    .io_taskOut(dataUnits_3_io_taskOut),
    .io_validIn(dataUnits_3_io_validIn),
    .io_validOut(dataUnits_3_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_3_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_3_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_3_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_3_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_3_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_3_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_3_io_occupied)
  );
  stealNetworkDataUnit dataUnits_4 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_4_clock),
    .reset(dataUnits_4_reset),
    .io_taskIn(dataUnits_4_io_taskIn),
    .io_taskOut(dataUnits_4_io_taskOut),
    .io_validIn(dataUnits_4_io_validIn),
    .io_validOut(dataUnits_4_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_4_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_4_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_4_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_4_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_4_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_4_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_4_io_occupied)
  );
  stealNetworkDataUnit dataUnits_5 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_5_clock),
    .reset(dataUnits_5_reset),
    .io_taskIn(dataUnits_5_io_taskIn),
    .io_taskOut(dataUnits_5_io_taskOut),
    .io_validIn(dataUnits_5_io_validIn),
    .io_validOut(dataUnits_5_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_5_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_5_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_5_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_5_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_5_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_5_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_5_io_occupied)
  );
  stealNetworkDataUnit dataUnits_6 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_6_clock),
    .reset(dataUnits_6_reset),
    .io_taskIn(dataUnits_6_io_taskIn),
    .io_taskOut(dataUnits_6_io_taskOut),
    .io_validIn(dataUnits_6_io_validIn),
    .io_validOut(dataUnits_6_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_6_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_6_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_6_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_6_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_6_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_6_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_6_io_occupied)
  );
  stealNetworkDataUnit dataUnits_7 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_7_clock),
    .reset(dataUnits_7_reset),
    .io_taskIn(dataUnits_7_io_taskIn),
    .io_taskOut(dataUnits_7_io_taskOut),
    .io_validIn(dataUnits_7_io_validIn),
    .io_validOut(dataUnits_7_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_7_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_7_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_7_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_7_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_7_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_7_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_7_io_occupied)
  );
  stealNetworkDataUnit dataUnits_8 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_8_clock),
    .reset(dataUnits_8_reset),
    .io_taskIn(dataUnits_8_io_taskIn),
    .io_taskOut(dataUnits_8_io_taskOut),
    .io_validIn(dataUnits_8_io_validIn),
    .io_validOut(dataUnits_8_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_8_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_8_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_8_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_8_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_8_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_8_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_8_io_occupied)
  );
  stealNetworkCtrlUnit ctrlunits_0 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_0_clock),
    .reset(ctrlunits_0_reset),
    .io_reqTaskIn(ctrlunits_0_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_0_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_0_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_0_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_0_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_0_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_1 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_1_clock),
    .reset(ctrlunits_1_reset),
    .io_reqTaskIn(ctrlunits_1_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_1_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_1_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_1_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_1_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_1_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_2 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_2_clock),
    .reset(ctrlunits_2_reset),
    .io_reqTaskIn(ctrlunits_2_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_2_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_2_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_2_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_2_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_2_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_3 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_3_clock),
    .reset(ctrlunits_3_reset),
    .io_reqTaskIn(ctrlunits_3_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_3_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_3_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_3_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_3_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_3_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_4 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_4_clock),
    .reset(ctrlunits_4_reset),
    .io_reqTaskIn(ctrlunits_4_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_4_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_4_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_4_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_4_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_4_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_5 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_5_clock),
    .reset(ctrlunits_5_reset),
    .io_reqTaskIn(ctrlunits_5_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_5_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_5_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_5_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_5_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_5_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_6 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_6_clock),
    .reset(ctrlunits_6_reset),
    .io_reqTaskIn(ctrlunits_6_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_6_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_6_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_6_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_6_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_6_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_7 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_7_clock),
    .reset(ctrlunits_7_reset),
    .io_reqTaskIn(ctrlunits_7_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_7_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_7_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_7_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_7_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_7_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_8 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_8_clock),
    .reset(ctrlunits_8_reset),
    .io_reqTaskIn(ctrlunits_8_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_8_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_8_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_8_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_8_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_8_io_connSS_stealReq_valid)
  );
  assign io_connSS_0_ctrl_serveStealReq_ready = ctrlunits_0_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_0_data_availableTask_valid = dataUnits_0_io_connSS_availableTask_valid; // @[stealNetwork.scala 36:27]
  assign io_connSS_0_data_availableTask_bits = dataUnits_0_io_connSS_availableTask_bits; // @[stealNetwork.scala 36:27]
  assign io_connSS_0_data_qOutTask_ready = dataUnits_0_io_connSS_qOutTask_ready; // @[stealNetwork.scala 36:27]
  assign io_connSS_1_ctrl_serveStealReq_ready = ctrlunits_1_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_1_data_qOutTask_ready = dataUnits_1_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_ctrl_serveStealReq_ready = ctrlunits_2_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_2_ctrl_stealReq_ready = ctrlunits_2_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_2_data_availableTask_valid = dataUnits_2_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_data_availableTask_bits = dataUnits_2_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_data_qOutTask_ready = dataUnits_2_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_3_ctrl_serveStealReq_ready = ctrlunits_3_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_3_data_qOutTask_ready = dataUnits_3_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_ctrl_serveStealReq_ready = ctrlunits_4_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_4_ctrl_stealReq_ready = ctrlunits_4_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_4_data_availableTask_valid = dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_availableTask_bits = dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_qOutTask_ready = dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_5_ctrl_serveStealReq_ready = ctrlunits_5_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_5_data_qOutTask_ready = dataUnits_5_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_ctrl_serveStealReq_ready = ctrlunits_6_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_6_ctrl_stealReq_ready = ctrlunits_6_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_6_data_availableTask_valid = dataUnits_6_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_data_availableTask_bits = dataUnits_6_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_data_qOutTask_ready = dataUnits_6_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_7_ctrl_serveStealReq_ready = ctrlunits_7_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_7_data_qOutTask_ready = dataUnits_7_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_8_ctrl_serveStealReq_ready = ctrlunits_8_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_8_ctrl_stealReq_ready = ctrlunits_8_io_connSS_stealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_8_data_availableTask_valid = dataUnits_8_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_8_data_availableTask_bits = dataUnits_8_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_8_data_qOutTask_ready = dataUnits_8_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_ntwDataUnitOccupancyVSS_0 = dataUnits_0_io_occupied; // @[stealNetwork.scala 49:54]
  assign dataUnits_0_clock = clock;
  assign dataUnits_0_reset = reset;
  assign dataUnits_0_io_taskIn = dataUnits_8_io_taskOut; // @[stealNetwork.scala 34:27]
  assign dataUnits_0_io_validIn = dataUnits_8_io_validOut; // @[stealNetwork.scala 35:27]
  assign dataUnits_0_io_connSS_availableTask_ready = io_connSS_0_data_availableTask_ready; // @[stealNetwork.scala 36:27]
  assign dataUnits_0_io_connSS_qOutTask_valid = io_connSS_0_data_qOutTask_valid; // @[stealNetwork.scala 36:27]
  assign dataUnits_0_io_connSS_qOutTask_bits = io_connSS_0_data_qOutTask_bits; // @[stealNetwork.scala 36:27]
  assign dataUnits_1_clock = clock;
  assign dataUnits_1_reset = reset;
  assign dataUnits_1_io_taskIn = dataUnits_0_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_1_io_validIn = dataUnits_0_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_1_io_connSS_availableTask_ready = 1'h0; // @[stealNetwork.scala 31:32]
  assign dataUnits_1_io_connSS_qOutTask_valid = io_connSS_1_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_1_io_connSS_qOutTask_bits = io_connSS_1_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_2_clock = clock;
  assign dataUnits_2_reset = reset;
  assign dataUnits_2_io_taskIn = dataUnits_1_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_2_io_validIn = dataUnits_1_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_2_io_connSS_availableTask_ready = io_connSS_2_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_2_io_connSS_qOutTask_valid = io_connSS_2_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_2_io_connSS_qOutTask_bits = io_connSS_2_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_3_clock = clock;
  assign dataUnits_3_reset = reset;
  assign dataUnits_3_io_taskIn = dataUnits_2_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_3_io_validIn = dataUnits_2_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_3_io_connSS_availableTask_ready = 1'h0; // @[stealNetwork.scala 31:32]
  assign dataUnits_3_io_connSS_qOutTask_valid = io_connSS_3_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_3_io_connSS_qOutTask_bits = io_connSS_3_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_4_clock = clock;
  assign dataUnits_4_reset = reset;
  assign dataUnits_4_io_taskIn = dataUnits_3_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_4_io_validIn = dataUnits_3_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_4_io_connSS_availableTask_ready = io_connSS_4_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_4_io_connSS_qOutTask_valid = io_connSS_4_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_4_io_connSS_qOutTask_bits = io_connSS_4_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_5_clock = clock;
  assign dataUnits_5_reset = reset;
  assign dataUnits_5_io_taskIn = dataUnits_4_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_5_io_validIn = dataUnits_4_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_5_io_connSS_availableTask_ready = 1'h0; // @[stealNetwork.scala 31:32]
  assign dataUnits_5_io_connSS_qOutTask_valid = io_connSS_5_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_5_io_connSS_qOutTask_bits = io_connSS_5_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_6_clock = clock;
  assign dataUnits_6_reset = reset;
  assign dataUnits_6_io_taskIn = dataUnits_5_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_6_io_validIn = dataUnits_5_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_6_io_connSS_availableTask_ready = io_connSS_6_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_6_io_connSS_qOutTask_valid = io_connSS_6_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_6_io_connSS_qOutTask_bits = io_connSS_6_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_7_clock = clock;
  assign dataUnits_7_reset = reset;
  assign dataUnits_7_io_taskIn = dataUnits_6_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_7_io_validIn = dataUnits_6_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_7_io_connSS_availableTask_ready = 1'h0; // @[stealNetwork.scala 31:32]
  assign dataUnits_7_io_connSS_qOutTask_valid = io_connSS_7_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_7_io_connSS_qOutTask_bits = io_connSS_7_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_8_clock = clock;
  assign dataUnits_8_reset = reset;
  assign dataUnits_8_io_taskIn = dataUnits_7_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_8_io_validIn = dataUnits_7_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_8_io_connSS_availableTask_ready = io_connSS_8_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_8_io_connSS_qOutTask_valid = io_connSS_8_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_8_io_connSS_qOutTask_bits = io_connSS_8_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign ctrlunits_0_clock = clock;
  assign ctrlunits_0_reset = reset;
  assign ctrlunits_0_io_reqTaskIn = ctrlunits_1_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_0_io_connSS_serveStealReq_valid = io_connSS_0_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_0_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_1_clock = clock;
  assign ctrlunits_1_reset = reset;
  assign ctrlunits_1_io_reqTaskIn = ctrlunits_2_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_1_io_connSS_serveStealReq_valid = io_connSS_1_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_1_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_2_clock = clock;
  assign ctrlunits_2_reset = reset;
  assign ctrlunits_2_io_reqTaskIn = ctrlunits_3_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_2_io_connSS_serveStealReq_valid = io_connSS_2_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_2_io_connSS_stealReq_valid = io_connSS_2_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_3_clock = clock;
  assign ctrlunits_3_reset = reset;
  assign ctrlunits_3_io_reqTaskIn = ctrlunits_4_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_3_io_connSS_serveStealReq_valid = io_connSS_3_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_3_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_4_clock = clock;
  assign ctrlunits_4_reset = reset;
  assign ctrlunits_4_io_reqTaskIn = ctrlunits_5_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_4_io_connSS_serveStealReq_valid = io_connSS_4_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_4_io_connSS_stealReq_valid = io_connSS_4_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_5_clock = clock;
  assign ctrlunits_5_reset = reset;
  assign ctrlunits_5_io_reqTaskIn = ctrlunits_6_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_5_io_connSS_serveStealReq_valid = io_connSS_5_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_5_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_6_clock = clock;
  assign ctrlunits_6_reset = reset;
  assign ctrlunits_6_io_reqTaskIn = ctrlunits_7_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_6_io_connSS_serveStealReq_valid = io_connSS_6_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_6_io_connSS_stealReq_valid = io_connSS_6_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_7_clock = clock;
  assign ctrlunits_7_reset = reset;
  assign ctrlunits_7_io_reqTaskIn = ctrlunits_8_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_7_io_connSS_serveStealReq_valid = io_connSS_7_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_7_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_8_clock = clock;
  assign ctrlunits_8_reset = reset;
  assign ctrlunits_8_io_reqTaskIn = ctrlunits_0_io_reqTaskOut; // @[stealNetwork.scala 44:36]
  assign ctrlunits_8_io_connSS_serveStealReq_valid = io_connSS_8_ctrl_serveStealReq_valid; // @[stealNetwork.scala 45:36]
  assign ctrlunits_8_io_connSS_stealReq_valid = io_connSS_8_ctrl_stealReq_valid; // @[stealNetwork.scala 45:36]
endmodule
module stealServer(
  input          clock,
  input          reset,
  input          io_connNetwork_ctrl_serveStealReq_ready,
  output         io_connNetwork_ctrl_serveStealReq_valid,
  input          io_connNetwork_ctrl_stealReq_ready,
  output         io_connNetwork_ctrl_stealReq_valid,
  output         io_connNetwork_data_availableTask_ready,
  input          io_connNetwork_data_availableTask_valid,
  input  [255:0] io_connNetwork_data_availableTask_bits,
  input          io_connNetwork_data_qOutTask_ready,
  output         io_connNetwork_data_qOutTask_valid,
  output [255:0] io_connNetwork_data_qOutTask_bits,
  input  [5:0]   io_connQ_currLength,
  input          io_connQ_push_ready,
  output         io_connQ_push_valid,
  output [255:0] io_connQ_push_bits,
  output         io_connQ_pop_ready,
  input          io_connQ_pop_valid,
  input  [255:0] io_connQ_pop_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [255:0] _RAND_1;
  reg [255:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] stateReg; // @[stealServer.scala 28:39]
  reg [255:0] stolenTaskReg; // @[stealServer.scala 29:39]
  reg [255:0] giveTaskReg; // @[stealServer.scala 30:39]
  reg [1:0] taskRequestCount; // @[stealServer.scala 33:39]
  reg [31:0] tasksGivenAwayCount; // @[stealServer.scala 35:38]
  reg [31:0] requestKilledCount; // @[stealServer.scala 37:37]
  reg [31:0] requestFullCount; // @[stealServer.scala 38:35]
  wire  _T_1 = io_connQ_currLength < 6'h2; // @[stealServer.scala 54:34]
  wire  _T_2 = io_connQ_currLength > 6'h1f; // @[stealServer.scala 57:40]
  wire [2:0] _GEN_0 = io_connQ_currLength > 6'h2 ? 3'h6 : 3'h0; // @[stealServer.scala 59:60 60:50 62:50]
  wire [31:0] _GEN_2 = io_connQ_currLength < 6'h2 ? 32'h9 : requestFullCount; // @[stealServer.scala 38:35 54:54 55:50]
  wire  _T_4 = stateReg == 3'h1; // @[stealServer.scala 64:25]
  wire  _T_9 = io_connQ_currLength >= 6'h2; // @[stealServer.scala 73:40]
  wire  _T_10 = tasksGivenAwayCount > 32'h0; // @[stealServer.scala 75:40]
  wire [31:0] _tasksGivenAwayCount_T_1 = tasksGivenAwayCount - 32'h1; // @[stealServer.scala 78:56]
  wire [1:0] _GEN_4 = requestFullCount == 32'h0 ? 2'h2 : 2'h1; // @[stealServer.scala 80:45 81:50 83:50]
  wire [1:0] _GEN_5 = tasksGivenAwayCount > 32'h0 ? 2'h2 : _GEN_4; // @[stealServer.scala 75:46 76:50]
  wire [31:0] _GEN_6 = tasksGivenAwayCount > 32'h0 ? 32'h9 : requestKilledCount; // @[stealServer.scala 37:37 75:46 77:50]
  wire [31:0] _GEN_7 = tasksGivenAwayCount > 32'h0 ? _tasksGivenAwayCount_T_1 : tasksGivenAwayCount; // @[stealServer.scala 75:46 78:33 35:38]
  wire [2:0] _GEN_9 = io_connQ_currLength >= 6'h2 ? 3'h6 : {{1'd0}, _GEN_5}; // @[stealServer.scala 73:61 74:50]
  wire [31:0] _GEN_10 = io_connQ_currLength >= 6'h2 ? requestKilledCount : _GEN_6; // @[stealServer.scala 37:37 73:61]
  wire [31:0] _GEN_11 = io_connQ_currLength >= 6'h2 ? tasksGivenAwayCount : _GEN_7; // @[stealServer.scala 35:38 73:61]
  wire  _GEN_12 = io_connQ_currLength >= 6'h2 ? 1'h0 : _T_10; // @[stealServer.scala 50:47 73:61]
  wire [1:0] _GEN_13 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 2'h1 : taskRequestCount; // @[stealServer.scala 33:39 69:83 70:50]
  wire [2:0] _GEN_15 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 3'h1 : _GEN_9; // @[stealServer.scala 69:83 72:50]
  wire [31:0] _GEN_16 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? requestKilledCount : _GEN_10; // @[stealServer.scala 37:37 69:83]
  wire [31:0] _GEN_17 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? tasksGivenAwayCount : _GEN_11; // @[stealServer.scala 35:38 69:83]
  wire  _GEN_18 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 1'h0 : _GEN_12; // @[stealServer.scala 50:47 69:83]
  wire  _GEN_24 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1 ? 1'h0 : _GEN_18; // @[stealServer.scala 50:47 66:77]
  wire [31:0] _requestFullCount_T_1 = requestFullCount - 32'h1; // @[stealServer.scala 87:70]
  wire  _T_12 = stateReg == 3'h2; // @[stealServer.scala 91:25]
  wire [31:0] _GEN_26 = requestKilledCount == 32'h0 ? 32'h9 : requestFullCount; // @[stealServer.scala 38:35 98:47 99:50]
  wire [1:0] _GEN_27 = requestKilledCount == 32'h0 ? 2'h1 : 2'h2; // @[stealServer.scala 98:47 100:50 102:50]
  wire [1:0] _GEN_28 = _T_9 ? 2'h0 : _GEN_27; // @[stealServer.scala 96:61 97:50]
  wire [31:0] _GEN_29 = _T_9 ? requestFullCount : _GEN_26; // @[stealServer.scala 38:35 96:61]
  wire [1:0] _GEN_30 = io_connNetwork_data_availableTask_valid ? 2'h3 : _GEN_28; // @[stealServer.scala 93:54 94:50]
  wire [255:0] _GEN_31 = io_connNetwork_data_availableTask_valid ? io_connNetwork_data_availableTask_bits :
    stolenTaskReg; // @[stealServer.scala 29:39 93:54 95:50]
  wire [31:0] _GEN_32 = io_connNetwork_data_availableTask_valid ? requestFullCount : _GEN_29; // @[stealServer.scala 38:35 93:54]
  wire [31:0] _requestKilledCount_T_1 = requestKilledCount - 32'h1; // @[stealServer.scala 106:72]
  wire [31:0] _GEN_33 = ~io_connNetwork_ctrl_serveStealReq_ready ? _requestKilledCount_T_1 : 32'h9; // @[stealServer.scala 105:55 106:50 108:50]
  wire  _T_16 = stateReg == 3'h3; // @[stealServer.scala 113:25]
  wire [2:0] _GEN_34 = io_connQ_currLength >= 6'h1f ? 3'h5 : 3'h3; // @[stealServer.scala 116:61 117:50 120:50]
  wire [255:0] _GEN_35 = io_connQ_currLength >= 6'h1f ? stolenTaskReg : giveTaskReg; // @[stealServer.scala 116:61 118:50 30:39]
  wire [2:0] _GEN_36 = io_connQ_push_ready ? 3'h0 : _GEN_34; // @[stealServer.scala 114:34 115:50]
  wire [255:0] _GEN_37 = io_connQ_push_ready ? giveTaskReg : _GEN_35; // @[stealServer.scala 114:34 30:39]
  wire  _T_18 = stateReg == 3'h4; // @[stealServer.scala 126:25]
  wire [31:0] _GEN_38 = io_connQ_currLength == 6'h0 ? 32'h9 : requestFullCount; // @[stealServer.scala 130:48 131:50 38:35]
  wire [2:0] _GEN_39 = io_connQ_currLength == 6'h0 ? 3'h1 : 3'h4; // @[stealServer.scala 130:48 132:50 134:50]
  wire [2:0] _GEN_40 = io_connQ_pop_valid ? 3'h5 : _GEN_39; // @[stealServer.scala 127:33 128:50]
  wire [255:0] _GEN_41 = io_connQ_pop_valid ? io_connQ_pop_bits : giveTaskReg; // @[stealServer.scala 127:33 129:50 30:39]
  wire [31:0] _GEN_42 = io_connQ_pop_valid ? requestFullCount : _GEN_38; // @[stealServer.scala 127:33 38:35]
  wire  _T_20 = stateReg == 3'h5; // @[stealServer.scala 139:25]
  wire [31:0] _tasksGivenAwayCount_T_3 = tasksGivenAwayCount + 32'h1; // @[stealServer.scala 141:73]
  wire [31:0] _GEN_43 = io_connNetwork_data_qOutTask_ready ? _tasksGivenAwayCount_T_3 : tasksGivenAwayCount; // @[stealServer.scala 140:49 141:50 35:38]
  wire [2:0] _GEN_44 = io_connNetwork_data_qOutTask_ready ? 3'h0 : 3'h5; // @[stealServer.scala 140:49 142:50 144:50]
  wire  _T_21 = stateReg == 3'h6; // @[stealServer.scala 150:25]
  wire  _T_24 = io_connNetwork_ctrl_serveStealReq_ready & _T_9; // @[stealServer.scala 152:50]
  wire  _T_25 = _T_2 | _T_24; // @[stealServer.scala 151:53]
  wire [2:0] _GEN_46 = _T_1 ? 3'h1 : 3'h6; // @[stealServer.scala 158:60 160:50 163:50]
  wire [1:0] _GEN_47 = _T_1 ? 2'h1 : taskRequestCount; // @[stealServer.scala 158:60 161:50 33:39]
  wire [31:0] _GEN_48 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 32'h9 : _GEN_2; // @[stealServer.scala 154:103 155:50]
  wire [2:0] _GEN_49 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 3'h1 : _GEN_46; // @[stealServer.scala 154:103 156:50]
  wire [1:0] _GEN_50 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 2'h2 : _GEN_47; // @[stealServer.scala 154:103 157:50]
  wire [2:0] _GEN_51 = _T_25 ? 3'h4 : _GEN_49; // @[stealServer.scala 152:95 153:50]
  wire [31:0] _GEN_52 = _T_25 ? requestFullCount : _GEN_48; // @[stealServer.scala 152:95 38:35]
  wire [1:0] _GEN_53 = _T_25 ? taskRequestCount : _GEN_50; // @[stealServer.scala 152:95 33:39]
  wire [2:0] _GEN_54 = stateReg == 3'h6 ? _GEN_51 : stateReg; // @[stealServer.scala 150:54 28:39]
  wire [31:0] _GEN_55 = stateReg == 3'h6 ? _GEN_52 : requestFullCount; // @[stealServer.scala 150:54 38:35]
  wire [1:0] _GEN_56 = stateReg == 3'h6 ? _GEN_53 : taskRequestCount; // @[stealServer.scala 150:54 33:39]
  wire [31:0] _GEN_58 = stateReg == 3'h5 ? _GEN_43 : tasksGivenAwayCount; // @[stealServer.scala 139:48 35:38]
  wire [2:0] _GEN_59 = stateReg == 3'h5 ? _GEN_44 : _GEN_54; // @[stealServer.scala 139:48]
  wire [255:0] _GEN_61 = stateReg == 3'h5 ? giveTaskReg : 256'h0; // @[stealServer.scala 139:48 148:51 47:47]
  wire [31:0] _GEN_62 = stateReg == 3'h5 ? requestFullCount : _GEN_55; // @[stealServer.scala 139:48 38:35]
  wire [1:0] _GEN_63 = stateReg == 3'h5 ? taskRequestCount : _GEN_56; // @[stealServer.scala 139:48 33:39]
  wire  _GEN_64 = stateReg == 3'h5 ? 1'h0 : _T_21; // @[stealServer.scala 139:48 50:47]
  wire [2:0] _GEN_65 = stateReg == 3'h4 ? _GEN_40 : _GEN_59; // @[stealServer.scala 126:43]
  wire [255:0] _GEN_66 = stateReg == 3'h4 ? _GEN_41 : giveTaskReg; // @[stealServer.scala 126:43 30:39]
  wire [31:0] _GEN_67 = stateReg == 3'h4 ? _GEN_42 : _GEN_62; // @[stealServer.scala 126:43]
  wire [31:0] _GEN_69 = stateReg == 3'h4 ? tasksGivenAwayCount : _GEN_58; // @[stealServer.scala 126:43 35:38]
  wire  _GEN_70 = stateReg == 3'h4 ? 1'h0 : _T_20; // @[stealServer.scala 126:43 46:47]
  wire [255:0] _GEN_71 = stateReg == 3'h4 ? 256'h0 : _GEN_61; // @[stealServer.scala 126:43 47:47]
  wire [1:0] _GEN_72 = stateReg == 3'h4 ? taskRequestCount : _GEN_63; // @[stealServer.scala 126:43 33:39]
  wire  _GEN_73 = stateReg == 3'h4 ? 1'h0 : _GEN_64; // @[stealServer.scala 126:43 50:47]
  wire [2:0] _GEN_74 = stateReg == 3'h3 ? _GEN_36 : _GEN_65; // @[stealServer.scala 113:44]
  wire [255:0] _GEN_75 = stateReg == 3'h3 ? _GEN_37 : _GEN_66; // @[stealServer.scala 113:44]
  wire [255:0] _GEN_76 = stateReg == 3'h3 ? stolenTaskReg : 256'h0; // @[stealServer.scala 113:44 123:51 42:47]
  wire [31:0] _GEN_78 = stateReg == 3'h3 ? requestFullCount : _GEN_67; // @[stealServer.scala 113:44 38:35]
  wire  _GEN_79 = stateReg == 3'h3 ? 1'h0 : _T_18; // @[stealServer.scala 113:44 41:47]
  wire [31:0] _GEN_80 = stateReg == 3'h3 ? tasksGivenAwayCount : _GEN_69; // @[stealServer.scala 113:44 35:38]
  wire  _GEN_81 = stateReg == 3'h3 ? 1'h0 : _GEN_70; // @[stealServer.scala 113:44 46:47]
  wire [255:0] _GEN_82 = stateReg == 3'h3 ? 256'h0 : _GEN_71; // @[stealServer.scala 113:44 47:47]
  wire [1:0] _GEN_83 = stateReg == 3'h3 ? taskRequestCount : _GEN_72; // @[stealServer.scala 113:44 33:39]
  wire  _GEN_84 = stateReg == 3'h3 ? 1'h0 : _GEN_73; // @[stealServer.scala 113:44 50:47]
  wire [255:0] _GEN_91 = stateReg == 3'h2 ? 256'h0 : _GEN_76; // @[stealServer.scala 91:46 42:47]
  wire  _GEN_92 = stateReg == 3'h2 ? 1'h0 : _T_16; // @[stealServer.scala 91:46 43:47]
  wire  _GEN_93 = stateReg == 3'h2 ? 1'h0 : _GEN_79; // @[stealServer.scala 91:46 41:47]
  wire  _GEN_95 = stateReg == 3'h2 ? 1'h0 : _GEN_81; // @[stealServer.scala 91:46 46:47]
  wire [255:0] _GEN_96 = stateReg == 3'h2 ? 256'h0 : _GEN_82; // @[stealServer.scala 91:46 47:47]
  wire  _GEN_98 = stateReg == 3'h2 ? 1'h0 : _GEN_84; // @[stealServer.scala 91:46 50:47]
  wire  _GEN_105 = stateReg == 3'h1 ? _GEN_24 : _GEN_98; // @[stealServer.scala 64:47]
  wire  _GEN_107 = stateReg == 3'h1 ? 1'h0 : _T_12; // @[stealServer.scala 45:47 64:47]
  wire [255:0] _GEN_109 = stateReg == 3'h1 ? 256'h0 : _GEN_91; // @[stealServer.scala 42:47 64:47]
  wire  _GEN_110 = stateReg == 3'h1 ? 1'h0 : _GEN_92; // @[stealServer.scala 43:47 64:47]
  wire  _GEN_111 = stateReg == 3'h1 ? 1'h0 : _GEN_93; // @[stealServer.scala 41:47 64:47]
  wire  _GEN_112 = stateReg == 3'h1 ? 1'h0 : _GEN_95; // @[stealServer.scala 46:47 64:47]
  wire [255:0] _GEN_113 = stateReg == 3'h1 ? 256'h0 : _GEN_96; // @[stealServer.scala 47:47 64:47]
  assign io_connNetwork_ctrl_serveStealReq_valid = stateReg == 3'h0 ? 1'h0 : _GEN_105; // @[stealServer.scala 53:34 50:47]
  assign io_connNetwork_ctrl_stealReq_valid = stateReg == 3'h0 ? 1'h0 : _T_4; // @[stealServer.scala 53:34 49:47]
  assign io_connNetwork_data_availableTask_ready = stateReg == 3'h0 ? 1'h0 : _GEN_107; // @[stealServer.scala 53:34 45:47]
  assign io_connNetwork_data_qOutTask_valid = stateReg == 3'h0 ? 1'h0 : _GEN_112; // @[stealServer.scala 53:34 46:47]
  assign io_connNetwork_data_qOutTask_bits = stateReg == 3'h0 ? 256'h0 : _GEN_113; // @[stealServer.scala 53:34 47:47]
  assign io_connQ_push_valid = stateReg == 3'h0 ? 1'h0 : _GEN_110; // @[stealServer.scala 53:34 43:47]
  assign io_connQ_push_bits = stateReg == 3'h0 ? 256'h0 : _GEN_109; // @[stealServer.scala 53:34 42:47]
  assign io_connQ_pop_ready = stateReg == 3'h0 ? 1'h0 : _GEN_111; // @[stealServer.scala 53:34 41:47]
  always @(posedge clock) begin
    if (reset) begin // @[stealServer.scala 28:39]
      stateReg <= 3'h0; // @[stealServer.scala 28:39]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 53:34]
      if (io_connQ_currLength < 6'h2) begin // @[stealServer.scala 54:54]
        stateReg <= 3'h1; // @[stealServer.scala 56:50]
      end else if (io_connQ_currLength > 6'h1f) begin // @[stealServer.scala 57:60]
        stateReg <= 3'h4; // @[stealServer.scala 58:50]
      end else begin
        stateReg <= _GEN_0;
      end
    end else if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
      if (io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1) begin // @[stealServer.scala 66:77]
        stateReg <= 3'h2; // @[stealServer.scala 67:50]
      end else begin
        stateReg <= _GEN_15;
      end
    end else if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
      stateReg <= {{1'd0}, _GEN_30};
    end else begin
      stateReg <= _GEN_74;
    end
    if (reset) begin // @[stealServer.scala 29:39]
      stolenTaskReg <= 256'h0; // @[stealServer.scala 29:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (!(stateReg == 3'h1)) begin // @[stealServer.scala 64:47]
        if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
          stolenTaskReg <= _GEN_31;
        end
      end
    end
    if (reset) begin // @[stealServer.scala 30:39]
      giveTaskReg <= 256'h0; // @[stealServer.scala 30:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (!(stateReg == 3'h1)) begin // @[stealServer.scala 64:47]
        if (!(stateReg == 3'h2)) begin // @[stealServer.scala 91:46]
          giveTaskReg <= _GEN_75;
        end
      end
    end
    if (reset) begin // @[stealServer.scala 33:39]
      taskRequestCount <= 2'h1; // @[stealServer.scala 33:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
        if (!(io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1)) begin // @[stealServer.scala 66:77]
          taskRequestCount <= _GEN_13;
        end
      end else if (!(stateReg == 3'h2)) begin // @[stealServer.scala 91:46]
        taskRequestCount <= _GEN_83;
      end
    end
    if (reset) begin // @[stealServer.scala 35:38]
      tasksGivenAwayCount <= 32'h0; // @[stealServer.scala 35:38]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
        if (!(io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1)) begin // @[stealServer.scala 66:77]
          tasksGivenAwayCount <= _GEN_17;
        end
      end else if (!(stateReg == 3'h2)) begin // @[stealServer.scala 91:46]
        tasksGivenAwayCount <= _GEN_80;
      end
    end
    if (reset) begin // @[stealServer.scala 37:37]
      requestKilledCount <= 32'h9; // @[stealServer.scala 37:37]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
        if (io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1) begin // @[stealServer.scala 66:77]
          requestKilledCount <= 32'h9; // @[stealServer.scala 68:50]
        end else begin
          requestKilledCount <= _GEN_16;
        end
      end else if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
        requestKilledCount <= _GEN_33;
      end
    end
    if (reset) begin // @[stealServer.scala 38:35]
      requestFullCount <= 32'h9; // @[stealServer.scala 38:35]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 53:34]
      if (io_connQ_currLength < 6'h2) begin // @[stealServer.scala 54:54]
        requestFullCount <= 32'h9; // @[stealServer.scala 55:50]
      end
    end else if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
      if (io_connNetwork_ctrl_serveStealReq_ready) begin // @[stealServer.scala 86:54]
        requestFullCount <= _requestFullCount_T_1; // @[stealServer.scala 87:50]
      end else begin
        requestFullCount <= 32'h9; // @[stealServer.scala 89:50]
      end
    end else if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
      requestFullCount <= _GEN_32;
    end else begin
      requestFullCount <= _GEN_78;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[2:0];
  _RAND_1 = {8{`RANDOM}};
  stolenTaskReg = _RAND_1[255:0];
  _RAND_2 = {8{`RANDOM}};
  giveTaskReg = _RAND_2[255:0];
  _RAND_3 = {1{`RANDOM}};
  taskRequestCount = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  tasksGivenAwayCount = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  requestKilledCount = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  requestFullCount = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module hw_deque(
  input          clock,
  input          reset,
  input          io_connVec_0_pop_ready,
  output         io_connVec_0_pop_valid,
  output [255:0] io_connVec_0_pop_bits,
  output [6:0]   io_connVec_1_currLength,
  output         io_connVec_1_push_ready,
  input          io_connVec_1_push_valid,
  input  [255:0] io_connVec_1_push_bits,
  input          io_connVec_1_pop_ready,
  output         io_connVec_1_pop_valid,
  output [255:0] io_connVec_1_pop_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  bramMem_clk; // @[deque.scala 34:30]
  wire  bramMem_rst; // @[deque.scala 34:30]
  wire [8:0] bramMem_a_addr; // @[deque.scala 34:30]
  wire [255:0] bramMem_a_din; // @[deque.scala 34:30]
  wire  bramMem_a_wr; // @[deque.scala 34:30]
  wire [255:0] bramMem_a_dout; // @[deque.scala 34:30]
  wire [8:0] bramMem_b_addr; // @[deque.scala 34:30]
  wire [255:0] bramMem_b_din; // @[deque.scala 34:30]
  wire  bramMem_b_wr; // @[deque.scala 34:30]
  wire [255:0] bramMem_b_dout; // @[deque.scala 34:30]
  reg [6:0] sideReg_0; // @[deque.scala 23:35]
  reg [6:0] sideReg_1; // @[deque.scala 23:81]
  reg  readLatency_0; // @[deque.scala 29:43]
  reg  readLatency_1; // @[deque.scala 29:43]
  reg [1:0] writeLatency_0; // @[deque.scala 30:43]
  reg [1:0] writeLatency_1; // @[deque.scala 30:43]
  reg [2:0] stateRegs_0; // @[deque.scala 54:40]
  reg [2:0] stateRegs_1; // @[deque.scala 54:40]
  wire [6:0] _currLen_T_1 = 7'h22 + sideReg_1; // @[deque.scala 176:31]
  wire [6:0] _currLen_T_3 = _currLen_T_1 - sideReg_0; // @[deque.scala 176:44]
  wire [6:0] _currLen_T_5 = _currLen_T_3 - 7'h1; // @[deque.scala 176:58]
  wire [6:0] _currLen_T_7 = sideReg_1 - sideReg_0; // @[deque.scala 178:31]
  wire [6:0] _currLen_T_9 = _currLen_T_7 - 7'h1; // @[deque.scala 178:44]
  wire [6:0] currLen = sideReg_0 > sideReg_1 ? _currLen_T_5 : _currLen_T_9; // @[deque.scala 175:34 176:17 178:17]
  wire  _T_3 = currLen > 7'h1; // @[deque.scala 75:64]
  wire  _T_5 = stateRegs_1 == 3'h0; // @[deque.scala 75:115]
  wire  _T_7 = currLen > 7'h0; // @[deque.scala 75:141]
  wire [1:0] _GEN_0 = io_connVec_0_pop_ready & currLen > 7'h1 | io_connVec_0_pop_ready & stateRegs_1 == 3'h0 & currLen
     > 7'h0 ? 2'h2 : 2'h0; // @[deque.scala 75:148 76:34 78:34]
  wire  _T_10 = stateRegs_0 == 3'h1; // @[deque.scala 92:33]
  wire [1:0] _writeLatency_0_T_1 = writeLatency_0 - 2'h1; // @[deque.scala 98:52]
  wire [1:0] _GEN_3 = writeLatency_0 == 2'h0 ? 2'h3 : 2'h1; // @[deque.scala 94:42 96:33 99:33]
  wire  _GEN_4 = ~readLatency_0 ? 1'h0 : readLatency_0 - 1'h1; // @[deque.scala 107:41 108:33 111:33]
  wire [2:0] _GEN_5 = ~readLatency_0 ? 3'h4 : 3'h2; // @[deque.scala 107:41 109:33 112:33]
  wire [6:0] _T_15 = 7'h22 - 7'h1; // @[deque.scala 117:48]
  wire [6:0] _bramMem_io_a_addr_T_1 = sideReg_0 + 7'h1; // @[deque.scala 120:54]
  wire [6:0] _GEN_6 = sideReg_0 == _T_15 ? 7'h0 : _bramMem_io_a_addr_T_1; // @[deque.scala 117:54 118:39 120:39]
  wire  _T_17 = stateRegs_0 == 3'h4; // @[deque.scala 129:33]
  wire [6:0] _sideReg_0_T_5 = sideReg_0 - 7'h1; // @[deque.scala 162:46]
  wire [6:0] _GEN_9 = sideReg_0 == 7'h0 ? _T_15 : _sideReg_0_T_5; // @[deque.scala 159:41 160:32 162:32]
  wire [2:0] _GEN_10 = stateRegs_0 == 3'h3 ? 3'h0 : stateRegs_0; // @[deque.scala 153:48 155:38 54:40]
  wire [6:0] _GEN_11 = stateRegs_0 == 3'h3 ? _GEN_9 : sideReg_0; // @[deque.scala 153:48 23:35]
  wire [2:0] _GEN_13 = stateRegs_0 == 3'h4 ? 3'h0 : _GEN_10; // @[deque.scala 129:47 131:38]
  wire [6:0] _GEN_14 = stateRegs_0 == 3'h4 ? _GEN_6 : _GEN_11; // @[deque.scala 129:47]
  wire [27:0] _GEN_15 = stateRegs_0 == 3'h4 ? {{21'd0}, _GEN_6} : 28'hfffffff; // @[deque.scala 129:47 59:34]
  wire [255:0] _GEN_17 = stateRegs_0 == 3'h4 ? bramMem_a_dout : 256'h0; // @[deque.scala 129:47 152:38 67:34]
  wire [27:0] _GEN_21 = stateRegs_0 == 3'h2 ? {{21'd0}, _GEN_6} : _GEN_15; // @[deque.scala 105:51]
  wire  _GEN_23 = stateRegs_0 == 3'h2 ? 1'h0 : _T_17; // @[deque.scala 105:51 66:34]
  wire [255:0] _GEN_24 = stateRegs_0 == 3'h2 ? 256'h0 : _GEN_17; // @[deque.scala 105:51 67:34]
  wire [27:0] _GEN_28 = stateRegs_0 == 3'h1 ? {{21'd0}, sideReg_0} : _GEN_21; // @[deque.scala 102:38 92:52]
  wire  _GEN_32 = stateRegs_0 == 3'h1 ? 1'h0 : _GEN_23; // @[deque.scala 66:34 92:52]
  wire [255:0] _GEN_33 = stateRegs_0 == 3'h1 ? 256'h0 : _GEN_24; // @[deque.scala 67:34 92:52]
  wire [27:0] _GEN_37 = stateRegs_0 == 3'h0 ? 28'hfffffff : _GEN_28; // @[deque.scala 59:34 71:42]
  wire [1:0] _GEN_44 = io_connVec_1_pop_ready & _T_3 | io_connVec_1_pop_ready & ~io_connVec_0_pop_ready & _T_7 &
    stateRegs_0 != 3'h4 ? 2'h2 : 2'h0; // @[deque.scala 83:175 87:34 89:34]
  wire [1:0] _GEN_45 = io_connVec_1_push_valid & currLen < _T_15 ? 2'h1 : _GEN_44; // @[deque.scala 81:79 82:34]
  wire  _T_37 = stateRegs_1 == 3'h1; // @[deque.scala 92:33]
  wire [1:0] _writeLatency_1_T_1 = writeLatency_1 - 2'h1; // @[deque.scala 98:52]
  wire [1:0] _GEN_47 = writeLatency_1 == 2'h0 ? 2'h3 : 2'h1; // @[deque.scala 94:42 96:33 99:33]
  wire  _GEN_48 = ~readLatency_1 ? 1'h0 : readLatency_1 - 1'h1; // @[deque.scala 107:41 108:33 111:33]
  wire [2:0] _GEN_49 = ~readLatency_1 ? 3'h4 : 3'h2; // @[deque.scala 107:41 109:33 112:33]
  wire [6:0] _bramMem_io_b_addr_T_3 = sideReg_1 - 7'h1; // @[deque.scala 126:54]
  wire [6:0] _GEN_50 = sideReg_1 == 7'h0 ? _T_15 : _bramMem_io_b_addr_T_3; // @[deque.scala 123:41 124:39 126:39]
  wire  _T_42 = stateRegs_1 == 3'h4; // @[deque.scala 129:33]
  wire  _T_44 = stateRegs_1 == 3'h3; // @[deque.scala 153:33]
  wire [6:0] _sideReg_1_T_5 = sideReg_1 + 7'h1; // @[deque.scala 168:46]
  wire [6:0] _GEN_53 = sideReg_1 == _T_15 ? 7'h0 : _sideReg_1_T_5; // @[deque.scala 165:56 166:32 168:32]
  wire [2:0] _GEN_54 = stateRegs_1 == 3'h3 ? 3'h0 : stateRegs_1; // @[deque.scala 153:48 155:38 54:40]
  wire [6:0] _GEN_55 = stateRegs_1 == 3'h3 ? _GEN_53 : sideReg_1; // @[deque.scala 153:48 23:81]
  wire [2:0] _GEN_57 = stateRegs_1 == 3'h4 ? 3'h0 : _GEN_54; // @[deque.scala 129:47 131:38]
  wire [6:0] _GEN_58 = stateRegs_1 == 3'h4 ? _GEN_50 : _GEN_55; // @[deque.scala 129:47]
  wire [27:0] _GEN_59 = stateRegs_1 == 3'h4 ? {{21'd0}, _GEN_50} : 28'hfffffff; // @[deque.scala 129:47 59:34]
  wire [255:0] _GEN_61 = stateRegs_1 == 3'h4 ? bramMem_b_dout : 256'h0; // @[deque.scala 129:47 152:38 67:34]
  wire  _GEN_62 = stateRegs_1 == 3'h4 ? 1'h0 : _T_44; // @[deque.scala 129:47 65:34]
  wire [27:0] _GEN_65 = stateRegs_1 == 3'h2 ? {{21'd0}, _GEN_50} : _GEN_59; // @[deque.scala 105:51]
  wire  _GEN_67 = stateRegs_1 == 3'h2 ? 1'h0 : _T_42; // @[deque.scala 105:51 66:34]
  wire [255:0] _GEN_68 = stateRegs_1 == 3'h2 ? 256'h0 : _GEN_61; // @[deque.scala 105:51 67:34]
  wire  _GEN_69 = stateRegs_1 == 3'h2 ? 1'h0 : _GEN_62; // @[deque.scala 105:51 65:34]
  wire [27:0] _GEN_72 = stateRegs_1 == 3'h1 ? {{21'd0}, sideReg_1} : _GEN_65; // @[deque.scala 102:38 92:52]
  wire  _GEN_76 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_67; // @[deque.scala 66:34 92:52]
  wire [255:0] _GEN_77 = stateRegs_1 == 3'h1 ? 256'h0 : _GEN_68; // @[deque.scala 67:34 92:52]
  wire  _GEN_78 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_69; // @[deque.scala 65:34 92:52]
  wire [27:0] _GEN_81 = _T_5 ? 28'hfffffff : _GEN_72; // @[deque.scala 59:34 71:42]
  DualPortBRAM #(.DATA(256), .ADDR(9)) bramMem ( // @[deque.scala 34:30]
    .clk(bramMem_clk),
    .rst(bramMem_rst),
    .a_addr(bramMem_a_addr),
    .a_din(bramMem_a_din),
    .a_wr(bramMem_a_wr),
    .a_dout(bramMem_a_dout),
    .b_addr(bramMem_b_addr),
    .b_din(bramMem_b_din),
    .b_wr(bramMem_b_wr),
    .b_dout(bramMem_b_dout)
  );
  assign io_connVec_0_pop_valid = stateRegs_0 == 3'h0 ? 1'h0 : _GEN_32; // @[deque.scala 66:34 71:42]
  assign io_connVec_0_pop_bits = stateRegs_0 == 3'h0 ? 256'h0 : _GEN_33; // @[deque.scala 67:34 71:42]
  assign io_connVec_1_currLength = sideReg_0 > sideReg_1 ? _currLen_T_5 : _currLen_T_9; // @[deque.scala 175:34 176:17 178:17]
  assign io_connVec_1_push_ready = _T_5 ? 1'h0 : _GEN_78; // @[deque.scala 65:34 71:42]
  assign io_connVec_1_pop_valid = _T_5 ? 1'h0 : _GEN_76; // @[deque.scala 66:34 71:42]
  assign io_connVec_1_pop_bits = _T_5 ? 256'h0 : _GEN_77; // @[deque.scala 67:34 71:42]
  assign bramMem_clk = clock; // @[deque.scala 36:22]
  assign bramMem_rst = reset; // @[deque.scala 37:22]
  assign bramMem_a_addr = _GEN_37[8:0];
  assign bramMem_a_din = 256'h0; // @[deque.scala 60:34]
  assign bramMem_a_wr = stateRegs_0 == 3'h0 ? 1'h0 : _T_10; // @[deque.scala 61:34 71:42]
  assign bramMem_b_addr = _GEN_81[8:0];
  assign bramMem_b_din = io_connVec_1_push_bits; // @[deque.scala 60:34]
  assign bramMem_b_wr = _T_5 ? 1'h0 : _T_37; // @[deque.scala 61:34 71:42]
  always @(posedge clock) begin
    if (reset) begin // @[deque.scala 23:35]
      sideReg_0 <= 7'h0; // @[deque.scala 23:35]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (!(stateRegs_0 == 3'h1)) begin // @[deque.scala 92:52]
        if (!(stateRegs_0 == 3'h2)) begin // @[deque.scala 105:51]
          sideReg_0 <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[deque.scala 23:81]
      sideReg_1 <= 7'h1; // @[deque.scala 23:81]
    end else if (!(_T_5)) begin // @[deque.scala 71:42]
      if (!(stateRegs_1 == 3'h1)) begin // @[deque.scala 92:52]
        if (!(stateRegs_1 == 3'h2)) begin // @[deque.scala 105:51]
          sideReg_1 <= _GEN_58;
        end
      end
    end
    if (reset) begin // @[deque.scala 29:43]
      readLatency_0 <= 1'h0; // @[deque.scala 29:43]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (!(stateRegs_0 == 3'h1)) begin // @[deque.scala 92:52]
        if (stateRegs_0 == 3'h2) begin // @[deque.scala 105:51]
          readLatency_0 <= _GEN_4;
        end
      end
    end
    if (reset) begin // @[deque.scala 29:43]
      readLatency_1 <= 1'h0; // @[deque.scala 29:43]
    end else if (!(_T_5)) begin // @[deque.scala 71:42]
      if (!(stateRegs_1 == 3'h1)) begin // @[deque.scala 92:52]
        if (stateRegs_1 == 3'h2) begin // @[deque.scala 105:51]
          readLatency_1 <= _GEN_48;
        end
      end
    end
    if (reset) begin // @[deque.scala 30:43]
      writeLatency_0 <= 2'h1; // @[deque.scala 30:43]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (stateRegs_0 == 3'h1) begin // @[deque.scala 92:52]
        if (writeLatency_0 == 2'h0) begin // @[deque.scala 94:42]
          writeLatency_0 <= 2'h1; // @[deque.scala 95:33]
        end else begin
          writeLatency_0 <= _writeLatency_0_T_1; // @[deque.scala 98:33]
        end
      end
    end
    if (reset) begin // @[deque.scala 30:43]
      writeLatency_1 <= 2'h1; // @[deque.scala 30:43]
    end else if (!(_T_5)) begin // @[deque.scala 71:42]
      if (stateRegs_1 == 3'h1) begin // @[deque.scala 92:52]
        if (writeLatency_1 == 2'h0) begin // @[deque.scala 94:42]
          writeLatency_1 <= 2'h1; // @[deque.scala 95:33]
        end else begin
          writeLatency_1 <= _writeLatency_1_T_1; // @[deque.scala 98:33]
        end
      end
    end
    if (reset) begin // @[deque.scala 54:40]
      stateRegs_0 <= 3'h0; // @[deque.scala 54:40]
    end else if (stateRegs_0 == 3'h0) begin // @[deque.scala 71:42]
      stateRegs_0 <= {{1'd0}, _GEN_0};
    end else if (stateRegs_0 == 3'h1) begin // @[deque.scala 92:52]
      stateRegs_0 <= {{1'd0}, _GEN_3};
    end else if (stateRegs_0 == 3'h2) begin // @[deque.scala 105:51]
      stateRegs_0 <= _GEN_5;
    end else begin
      stateRegs_0 <= _GEN_13;
    end
    if (reset) begin // @[deque.scala 54:40]
      stateRegs_1 <= 3'h0; // @[deque.scala 54:40]
    end else if (_T_5) begin // @[deque.scala 71:42]
      stateRegs_1 <= {{1'd0}, _GEN_45};
    end else if (stateRegs_1 == 3'h1) begin // @[deque.scala 92:52]
      stateRegs_1 <= {{1'd0}, _GEN_47};
    end else if (stateRegs_1 == 3'h2) begin // @[deque.scala 105:51]
      stateRegs_1 <= _GEN_49;
    end else begin
      stateRegs_1 <= _GEN_57;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sideReg_0 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  sideReg_1 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  readLatency_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  readLatency_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  writeLatency_0 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  writeLatency_1 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  stateRegs_0 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  stateRegs_1 = _RAND_7[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module stealNW_TQ(
  input          clock,
  input          reset,
  input          io_connPE_0_pop_ready,
  output         io_connPE_0_pop_valid,
  output [255:0] io_connPE_0_pop_bits,
  input          io_connPE_1_pop_ready,
  output         io_connPE_1_pop_valid,
  output [255:0] io_connPE_1_pop_bits,
  input          io_connPE_2_pop_ready,
  output         io_connPE_2_pop_valid,
  output [255:0] io_connPE_2_pop_bits,
  input          io_connPE_3_pop_ready,
  output         io_connPE_3_pop_valid,
  output [255:0] io_connPE_3_pop_bits,
  output         io_connVSS_0_ctrl_serveStealReq_ready,
  input          io_connVSS_0_ctrl_serveStealReq_valid,
  input          io_connVSS_0_data_availableTask_ready,
  output         io_connVSS_0_data_availableTask_valid,
  output [255:0] io_connVSS_0_data_availableTask_bits,
  output         io_connVSS_0_data_qOutTask_ready,
  input          io_connVSS_0_data_qOutTask_valid,
  input  [255:0] io_connVSS_0_data_qOutTask_bits,
  output         io_connVAS_0_ctrl_serveStealReq_ready,
  input          io_connVAS_0_ctrl_serveStealReq_valid,
  output         io_connVAS_0_data_qOutTask_ready,
  input          io_connVAS_0_data_qOutTask_valid,
  input  [255:0] io_connVAS_0_data_qOutTask_bits,
  output         io_connVAS_1_ctrl_serveStealReq_ready,
  input          io_connVAS_1_ctrl_serveStealReq_valid,
  output         io_connVAS_1_data_qOutTask_ready,
  input          io_connVAS_1_data_qOutTask_valid,
  input  [255:0] io_connVAS_1_data_qOutTask_bits,
  output         io_connVAS_2_ctrl_serveStealReq_ready,
  input          io_connVAS_2_ctrl_serveStealReq_valid,
  output         io_connVAS_2_data_qOutTask_ready,
  input          io_connVAS_2_data_qOutTask_valid,
  input  [255:0] io_connVAS_2_data_qOutTask_bits,
  output         io_connVAS_3_ctrl_serveStealReq_ready,
  input          io_connVAS_3_ctrl_serveStealReq_valid,
  output         io_connVAS_3_data_qOutTask_ready,
  input          io_connVAS_3_data_qOutTask_valid,
  input  [255:0] io_connVAS_3_data_qOutTask_bits,
  output         io_ntwDataUnitOccupancyVSS_0
);
  wire  stealNet_clock; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_reset; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_1_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_2_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_3_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_4_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_5_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_6_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_6_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_7_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_8_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [255:0] stealNet_io_connSS_8_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 31:30]
  wire  stealServers_0_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_0_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_0_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_0_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_0_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_1_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_1_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_1_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_1_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_2_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_2_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_2_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_2_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_3_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_3_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_3_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [255:0] stealServers_3_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  taskQueues_0_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_0_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_0_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_0_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_1_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_1_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_1_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_2_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_2_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_2_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_3_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_3_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_3_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [255:0] taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  stealNetwork stealNet ( // @[stealNW_TQ.scala 31:30]
    .clock(stealNet_clock),
    .reset(stealNet_reset),
    .io_connSS_0_ctrl_serveStealReq_ready(stealNet_io_connSS_0_ctrl_serveStealReq_ready),
    .io_connSS_0_ctrl_serveStealReq_valid(stealNet_io_connSS_0_ctrl_serveStealReq_valid),
    .io_connSS_0_data_availableTask_ready(stealNet_io_connSS_0_data_availableTask_ready),
    .io_connSS_0_data_availableTask_valid(stealNet_io_connSS_0_data_availableTask_valid),
    .io_connSS_0_data_availableTask_bits(stealNet_io_connSS_0_data_availableTask_bits),
    .io_connSS_0_data_qOutTask_ready(stealNet_io_connSS_0_data_qOutTask_ready),
    .io_connSS_0_data_qOutTask_valid(stealNet_io_connSS_0_data_qOutTask_valid),
    .io_connSS_0_data_qOutTask_bits(stealNet_io_connSS_0_data_qOutTask_bits),
    .io_connSS_1_ctrl_serveStealReq_ready(stealNet_io_connSS_1_ctrl_serveStealReq_ready),
    .io_connSS_1_ctrl_serveStealReq_valid(stealNet_io_connSS_1_ctrl_serveStealReq_valid),
    .io_connSS_1_data_qOutTask_ready(stealNet_io_connSS_1_data_qOutTask_ready),
    .io_connSS_1_data_qOutTask_valid(stealNet_io_connSS_1_data_qOutTask_valid),
    .io_connSS_1_data_qOutTask_bits(stealNet_io_connSS_1_data_qOutTask_bits),
    .io_connSS_2_ctrl_serveStealReq_ready(stealNet_io_connSS_2_ctrl_serveStealReq_ready),
    .io_connSS_2_ctrl_serveStealReq_valid(stealNet_io_connSS_2_ctrl_serveStealReq_valid),
    .io_connSS_2_ctrl_stealReq_ready(stealNet_io_connSS_2_ctrl_stealReq_ready),
    .io_connSS_2_ctrl_stealReq_valid(stealNet_io_connSS_2_ctrl_stealReq_valid),
    .io_connSS_2_data_availableTask_ready(stealNet_io_connSS_2_data_availableTask_ready),
    .io_connSS_2_data_availableTask_valid(stealNet_io_connSS_2_data_availableTask_valid),
    .io_connSS_2_data_availableTask_bits(stealNet_io_connSS_2_data_availableTask_bits),
    .io_connSS_2_data_qOutTask_ready(stealNet_io_connSS_2_data_qOutTask_ready),
    .io_connSS_2_data_qOutTask_valid(stealNet_io_connSS_2_data_qOutTask_valid),
    .io_connSS_2_data_qOutTask_bits(stealNet_io_connSS_2_data_qOutTask_bits),
    .io_connSS_3_ctrl_serveStealReq_ready(stealNet_io_connSS_3_ctrl_serveStealReq_ready),
    .io_connSS_3_ctrl_serveStealReq_valid(stealNet_io_connSS_3_ctrl_serveStealReq_valid),
    .io_connSS_3_data_qOutTask_ready(stealNet_io_connSS_3_data_qOutTask_ready),
    .io_connSS_3_data_qOutTask_valid(stealNet_io_connSS_3_data_qOutTask_valid),
    .io_connSS_3_data_qOutTask_bits(stealNet_io_connSS_3_data_qOutTask_bits),
    .io_connSS_4_ctrl_serveStealReq_ready(stealNet_io_connSS_4_ctrl_serveStealReq_ready),
    .io_connSS_4_ctrl_serveStealReq_valid(stealNet_io_connSS_4_ctrl_serveStealReq_valid),
    .io_connSS_4_ctrl_stealReq_ready(stealNet_io_connSS_4_ctrl_stealReq_ready),
    .io_connSS_4_ctrl_stealReq_valid(stealNet_io_connSS_4_ctrl_stealReq_valid),
    .io_connSS_4_data_availableTask_ready(stealNet_io_connSS_4_data_availableTask_ready),
    .io_connSS_4_data_availableTask_valid(stealNet_io_connSS_4_data_availableTask_valid),
    .io_connSS_4_data_availableTask_bits(stealNet_io_connSS_4_data_availableTask_bits),
    .io_connSS_4_data_qOutTask_ready(stealNet_io_connSS_4_data_qOutTask_ready),
    .io_connSS_4_data_qOutTask_valid(stealNet_io_connSS_4_data_qOutTask_valid),
    .io_connSS_4_data_qOutTask_bits(stealNet_io_connSS_4_data_qOutTask_bits),
    .io_connSS_5_ctrl_serveStealReq_ready(stealNet_io_connSS_5_ctrl_serveStealReq_ready),
    .io_connSS_5_ctrl_serveStealReq_valid(stealNet_io_connSS_5_ctrl_serveStealReq_valid),
    .io_connSS_5_data_qOutTask_ready(stealNet_io_connSS_5_data_qOutTask_ready),
    .io_connSS_5_data_qOutTask_valid(stealNet_io_connSS_5_data_qOutTask_valid),
    .io_connSS_5_data_qOutTask_bits(stealNet_io_connSS_5_data_qOutTask_bits),
    .io_connSS_6_ctrl_serveStealReq_ready(stealNet_io_connSS_6_ctrl_serveStealReq_ready),
    .io_connSS_6_ctrl_serveStealReq_valid(stealNet_io_connSS_6_ctrl_serveStealReq_valid),
    .io_connSS_6_ctrl_stealReq_ready(stealNet_io_connSS_6_ctrl_stealReq_ready),
    .io_connSS_6_ctrl_stealReq_valid(stealNet_io_connSS_6_ctrl_stealReq_valid),
    .io_connSS_6_data_availableTask_ready(stealNet_io_connSS_6_data_availableTask_ready),
    .io_connSS_6_data_availableTask_valid(stealNet_io_connSS_6_data_availableTask_valid),
    .io_connSS_6_data_availableTask_bits(stealNet_io_connSS_6_data_availableTask_bits),
    .io_connSS_6_data_qOutTask_ready(stealNet_io_connSS_6_data_qOutTask_ready),
    .io_connSS_6_data_qOutTask_valid(stealNet_io_connSS_6_data_qOutTask_valid),
    .io_connSS_6_data_qOutTask_bits(stealNet_io_connSS_6_data_qOutTask_bits),
    .io_connSS_7_ctrl_serveStealReq_ready(stealNet_io_connSS_7_ctrl_serveStealReq_ready),
    .io_connSS_7_ctrl_serveStealReq_valid(stealNet_io_connSS_7_ctrl_serveStealReq_valid),
    .io_connSS_7_data_qOutTask_ready(stealNet_io_connSS_7_data_qOutTask_ready),
    .io_connSS_7_data_qOutTask_valid(stealNet_io_connSS_7_data_qOutTask_valid),
    .io_connSS_7_data_qOutTask_bits(stealNet_io_connSS_7_data_qOutTask_bits),
    .io_connSS_8_ctrl_serveStealReq_ready(stealNet_io_connSS_8_ctrl_serveStealReq_ready),
    .io_connSS_8_ctrl_serveStealReq_valid(stealNet_io_connSS_8_ctrl_serveStealReq_valid),
    .io_connSS_8_ctrl_stealReq_ready(stealNet_io_connSS_8_ctrl_stealReq_ready),
    .io_connSS_8_ctrl_stealReq_valid(stealNet_io_connSS_8_ctrl_stealReq_valid),
    .io_connSS_8_data_availableTask_ready(stealNet_io_connSS_8_data_availableTask_ready),
    .io_connSS_8_data_availableTask_valid(stealNet_io_connSS_8_data_availableTask_valid),
    .io_connSS_8_data_availableTask_bits(stealNet_io_connSS_8_data_availableTask_bits),
    .io_connSS_8_data_qOutTask_ready(stealNet_io_connSS_8_data_qOutTask_ready),
    .io_connSS_8_data_qOutTask_valid(stealNet_io_connSS_8_data_qOutTask_valid),
    .io_connSS_8_data_qOutTask_bits(stealNet_io_connSS_8_data_qOutTask_bits),
    .io_ntwDataUnitOccupancyVSS_0(stealNet_io_ntwDataUnitOccupancyVSS_0)
  );
  stealServer stealServers_0 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_0_clock),
    .reset(stealServers_0_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_0_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_0_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_0_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_0_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_0_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_0_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_0_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_0_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_0_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_0_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_0_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_0_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_0_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_0_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_0_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_0_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_0_io_connQ_pop_bits)
  );
  stealServer stealServers_1 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_1_clock),
    .reset(stealServers_1_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_1_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_1_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_1_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_1_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_1_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_1_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_1_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_1_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_1_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_1_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_1_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_1_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_1_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_1_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_1_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_1_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_1_io_connQ_pop_bits)
  );
  stealServer stealServers_2 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_2_clock),
    .reset(stealServers_2_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_2_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_2_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_2_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_2_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_2_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_2_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_2_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_2_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_2_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_2_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_2_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_2_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_2_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_2_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_2_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_2_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_2_io_connQ_pop_bits)
  );
  stealServer stealServers_3 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_3_clock),
    .reset(stealServers_3_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_3_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_3_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_3_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_3_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_3_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_3_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_3_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_3_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_3_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_3_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_3_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_3_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_3_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_3_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_3_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_3_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_3_io_connQ_pop_bits)
  );
  hw_deque taskQueues_0 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_0_clock),
    .reset(taskQueues_0_reset),
    .io_connVec_0_pop_ready(taskQueues_0_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_0_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_0_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_0_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_0_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_0_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_0_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_0_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_0_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_0_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_1 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_1_clock),
    .reset(taskQueues_1_reset),
    .io_connVec_0_pop_ready(taskQueues_1_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_1_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_1_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_1_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_1_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_1_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_1_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_1_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_1_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_1_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_2 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_2_clock),
    .reset(taskQueues_2_reset),
    .io_connVec_0_pop_ready(taskQueues_2_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_2_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_2_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_2_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_2_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_2_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_2_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_2_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_2_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_2_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_3 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_3_clock),
    .reset(taskQueues_3_reset),
    .io_connVec_0_pop_ready(taskQueues_3_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_3_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_3_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_3_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_3_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_3_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_3_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_3_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_3_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_3_io_connVec_1_pop_bits)
  );
  assign io_connPE_0_pop_valid = taskQueues_0_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_0_pop_bits = taskQueues_0_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_1_pop_valid = taskQueues_1_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_1_pop_bits = taskQueues_1_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_2_pop_valid = taskQueues_2_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_2_pop_bits = taskQueues_2_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_3_pop_valid = taskQueues_3_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_3_pop_bits = taskQueues_3_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connVSS_0_ctrl_serveStealReq_ready = stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_0_data_availableTask_valid = stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_0_data_availableTask_bits = stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_0_data_qOutTask_ready = stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVAS_0_ctrl_serveStealReq_ready = stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 88:35]
  assign io_connVAS_0_data_qOutTask_ready = stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 88:35]
  assign io_connVAS_1_ctrl_serveStealReq_ready = stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 88:35]
  assign io_connVAS_1_data_qOutTask_ready = stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 88:35]
  assign io_connVAS_2_ctrl_serveStealReq_ready = stealNet_io_connSS_5_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 88:35]
  assign io_connVAS_2_data_qOutTask_ready = stealNet_io_connSS_5_data_qOutTask_ready; // @[stealNW_TQ.scala 88:35]
  assign io_connVAS_3_ctrl_serveStealReq_ready = stealNet_io_connSS_7_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 88:35]
  assign io_connVAS_3_data_qOutTask_ready = stealNet_io_connSS_7_data_qOutTask_ready; // @[stealNW_TQ.scala 88:35]
  assign io_ntwDataUnitOccupancyVSS_0 = stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 103:48]
  assign stealNet_clock = clock;
  assign stealNet_reset = reset;
  assign stealNet_io_connSS_0_ctrl_serveStealReq_valid = io_connVSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_0_data_availableTask_ready = io_connVSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_0_data_qOutTask_valid = io_connVSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_0_data_qOutTask_bits = io_connVSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_1_ctrl_serveStealReq_valid = io_connVAS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_1_data_qOutTask_valid = io_connVAS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_1_data_qOutTask_bits = io_connVAS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_2_ctrl_serveStealReq_valid = stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_2_ctrl_stealReq_valid = stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_2_data_availableTask_ready = stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_2_data_qOutTask_valid = stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_2_data_qOutTask_bits = stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_3_ctrl_serveStealReq_valid = io_connVAS_1_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_3_data_qOutTask_valid = io_connVAS_1_data_qOutTask_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_3_data_qOutTask_bits = io_connVAS_1_data_qOutTask_bits; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_4_ctrl_serveStealReq_valid = stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_4_ctrl_stealReq_valid = stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_4_data_availableTask_ready = stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_4_data_qOutTask_valid = stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_4_data_qOutTask_bits = stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_5_ctrl_serveStealReq_valid = io_connVAS_2_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_5_data_qOutTask_valid = io_connVAS_2_data_qOutTask_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_5_data_qOutTask_bits = io_connVAS_2_data_qOutTask_bits; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_6_ctrl_serveStealReq_valid = stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_6_ctrl_stealReq_valid = stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_6_data_availableTask_ready = stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_6_data_qOutTask_valid = stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_6_data_qOutTask_bits = stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_7_ctrl_serveStealReq_valid = io_connVAS_3_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_7_data_qOutTask_valid = io_connVAS_3_data_qOutTask_valid; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_7_data_qOutTask_bits = io_connVAS_3_data_qOutTask_bits; // @[stealNW_TQ.scala 88:35]
  assign stealNet_io_connSS_8_ctrl_serveStealReq_valid = stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_8_ctrl_stealReq_valid = stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_8_data_availableTask_ready = stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_8_data_qOutTask_valid = stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_8_data_qOutTask_bits = stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_clock = clock;
  assign stealServers_0_reset = reset;
  assign stealServers_0_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_2_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connQ_currLength = taskQueues_0_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_push_ready = taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_pop_valid = taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_pop_bits = taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_clock = clock;
  assign stealServers_1_reset = reset;
  assign stealServers_1_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_4_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connQ_currLength = taskQueues_1_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_push_ready = taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_pop_valid = taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_pop_bits = taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_clock = clock;
  assign stealServers_2_reset = reset;
  assign stealServers_2_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_6_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_6_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_6_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_6_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_6_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connQ_currLength = taskQueues_2_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_push_ready = taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_pop_valid = taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_pop_bits = taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_clock = clock;
  assign stealServers_3_reset = reset;
  assign stealServers_3_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_8_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_8_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_8_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_8_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_8_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connQ_currLength = taskQueues_3_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_push_ready = taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_pop_valid = taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_pop_bits = taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_0_clock = clock;
  assign taskQueues_0_reset = reset;
  assign taskQueues_0_io_connVec_0_pop_ready = io_connPE_0_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_0_io_connVec_1_push_valid = stealServers_0_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_0_io_connVec_1_push_bits = stealServers_0_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_0_io_connVec_1_pop_ready = stealServers_0_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_1_clock = clock;
  assign taskQueues_1_reset = reset;
  assign taskQueues_1_io_connVec_0_pop_ready = io_connPE_1_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_1_io_connVec_1_push_valid = stealServers_1_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_1_io_connVec_1_push_bits = stealServers_1_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_1_io_connVec_1_pop_ready = stealServers_1_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_2_clock = clock;
  assign taskQueues_2_reset = reset;
  assign taskQueues_2_io_connVec_0_pop_ready = io_connPE_2_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_2_io_connVec_1_push_valid = stealServers_2_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_2_io_connVec_1_push_bits = stealServers_2_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_2_io_connVec_1_pop_ready = stealServers_2_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_3_clock = clock;
  assign taskQueues_3_reset = reset;
  assign taskQueues_3_io_connVec_0_pop_ready = io_connPE_3_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_3_io_connVec_1_push_valid = stealServers_3_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_3_io_connVec_1_push_bits = stealServers_3_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_3_io_connVec_1_pop_ready = stealServers_3_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
endmodule
module Queue(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [5:0] io_enq_bits_addr,
  input        io_deq_ready,
  output       io_deq_valid,
  output [5:0] io_deq_bits_addr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [5:0] ram_addr [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [5:0] ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [5:0] ram_addr_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_addr_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_addr_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_addr_MPORT_en; // @[Decoupled.scala 275:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_addr_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = enq_ptr_value;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_addr = ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_addr[initvar] = _RAND_0[5:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[1:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_2(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits_data,
  input  [7:0]  io_enq_bits_strb,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits_data,
  output [7:0]  io_deq_bits_strb
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram_data [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_data_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_data_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 275:95]
  reg [7:0] ram_strb [0:3]; // @[Decoupled.scala 275:95]
  wire  ram_strb_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [1:0] ram_strb_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [7:0] ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [7:0] ram_strb_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_strb_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_strb_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_strb_MPORT_en; // @[Decoupled.scala 275:95]
  reg [1:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [1:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [1:0] _value_T_1 = enq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  wire [1:0] _value_T_3 = deq_ptr_value + 2'h1; // @[Counter.scala 77:24]
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = enq_ptr_value;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_strb_io_deq_bits_MPORT_en = 1'h1;
  assign ram_strb_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_strb_io_deq_bits_MPORT_data = ram_strb[ram_strb_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_strb_MPORT_data = io_enq_bits_strb;
  assign ram_strb_MPORT_addr = enq_ptr_value;
  assign ram_strb_MPORT_mask = 1'h1;
  assign ram_strb_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_strb = ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_strb_MPORT_en & ram_strb_MPORT_mask) begin
      ram_strb[ram_strb_MPORT_addr] <= ram_strb_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 2'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 4; initvar = initvar+1)
    ram_strb[initvar] = _RAND_1[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  enq_ptr_value = _RAND_2[1:0];
  _RAND_3 = {1{`RANDOM}};
  deq_ptr_value = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  maybe_full = _RAND_4[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_3(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [255:0] io_enq_bits,
  input          io_deq_ready,
  output         io_deq_valid,
  output [255:0] io_deq_bits,
  output [4:0]   io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [255:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [255:0] ram [0:15]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [255:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [255:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [3:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [3:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [3:0] _value_T_1 = enq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] _value_T_3 = deq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] ptr_diff = enq_ptr_value - deq_ptr_value; // @[Decoupled.scala 328:32]
  wire [4:0] _io_count_T_1 = maybe_full & ptr_match ? 5'h10 : 5'h0; // @[Decoupled.scala 331:20]
  wire [4:0] _GEN_11 = {{1'd0}, ptr_diff}; // @[Decoupled.scala 331:62]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_count = _io_count_T_1 | _GEN_11; // @[Decoupled.scala 331:62]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {8{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[255:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module virtualStealServer(
  input          clock,
  input          reset,
  input          io_connNetwork_ctrl_serveStealReq_ready,
  output         io_connNetwork_ctrl_serveStealReq_valid,
  output         io_connNetwork_data_availableTask_ready,
  input          io_connNetwork_data_availableTask_valid,
  input  [255:0] io_connNetwork_data_availableTask_bits,
  input          io_connNetwork_data_qOutTask_ready,
  output         io_connNetwork_data_qOutTask_valid,
  output [255:0] io_connNetwork_data_qOutTask_bits,
  output         io_axi_mgmt_ARREADY,
  input          io_axi_mgmt_ARVALID,
  input  [5:0]   io_axi_mgmt_ARADDR,
  input          io_axi_mgmt_RREADY,
  output         io_axi_mgmt_RVALID,
  output [63:0]  io_axi_mgmt_RDATA,
  output         io_axi_mgmt_AWREADY,
  input          io_axi_mgmt_AWVALID,
  input  [5:0]   io_axi_mgmt_AWADDR,
  output         io_axi_mgmt_WREADY,
  input          io_axi_mgmt_WVALID,
  input  [63:0]  io_axi_mgmt_WDATA,
  input  [7:0]   io_axi_mgmt_WSTRB,
  input          io_axi_mgmt_BREADY,
  output         io_axi_mgmt_BVALID,
  input          io_read_address_ready,
  output         io_read_address_valid,
  output [63:0]  io_read_address_bits,
  output         io_read_data_ready,
  input          io_read_data_valid,
  input  [255:0] io_read_data_bits,
  output [3:0]   io_read_burst_len,
  input          io_write_address_ready,
  output         io_write_address_valid,
  output [63:0]  io_write_address_bits,
  input          io_write_data_ready,
  output         io_write_data_valid,
  output [255:0] io_write_data_bits,
  output [3:0]   io_write_burst_len,
  output         io_write_last,
  input          io_ntwDataUnitOccupancy
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire  rdReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] rdReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] wrReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_clock; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_reset; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] wrReqData__deq_io_enq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] wrReqData__deq_io_enq_bits_strb; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 377:21]
  wire  taskQueueBuffer_clock; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_reset; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_enq_ready; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_enq_valid; // @[virtualStealServer.scala 80:43]
  wire [255:0] taskQueueBuffer_io_enq_bits; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_deq_ready; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_deq_valid; // @[virtualStealServer.scala 80:43]
  wire [255:0] taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 80:43]
  wire [4:0] taskQueueBuffer_io_count; // @[virtualStealServer.scala 80:43]
  wire  rdReq__valid = rdReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  rdReq = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  wire [5:0] rdReq__bits_addr = rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] rdAddr = rdReq__bits_addr & 6'h38; // @[RegisterBlock.scala 214:48]
  wire  wrReq__valid = wrReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReqData__valid = wrReqData__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReq = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  wire [5:0] wrReq__bits_addr = wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] wrAddr = wrReq__bits_addr & 6'h38; // @[RegisterBlock.scala 243:48]
  reg [63:0] rAddr; // @[virtualStealServer.scala 64:44]
  reg [63:0] rPause; // @[virtualStealServer.scala 65:44]
  reg [63:0] procInterrupt; // @[virtualStealServer.scala 66:44]
  reg [63:0] maxLength; // @[virtualStealServer.scala 67:44]
  reg [3:0] stateReg; // @[virtualStealServer.scala 68:44]
  reg [63:0] contentionCounter; // @[virtualStealServer.scala 70:44]
  reg  networkCongested; // @[virtualStealServer.scala 72:44]
  reg [63:0] fifoTailReg; // @[virtualStealServer.scala 76:44]
  reg [63:0] fifoHeadReg; // @[virtualStealServer.scala 77:44]
  reg  popOrPush; // @[virtualStealServer.scala 78:44]
  reg [4:0] memDataCounter; // @[virtualStealServer.scala 81:44]
  wire  _T_1 = ~io_connNetwork_ctrl_serveStealReq_ready & io_ntwDataUnitOccupancy; // @[virtualStealServer.scala 94:52]
  wire [63:0] _contentionCounter_T_1 = contentionCounter + 64'h1; // @[virtualStealServer.scala 97:48]
  wire  _T_4 = contentionCounter != 64'h0; // @[virtualStealServer.scala 99:36]
  wire  _T_5 = io_connNetwork_ctrl_serveStealReq_ready & _T_4; // @[virtualStealServer.scala 98:56]
  wire [63:0] _contentionCounter_T_3 = contentionCounter - 64'h1; // @[virtualStealServer.scala 101:48]
  wire [63:0] _T_12 = 64'h6 - 64'h0; // @[virtualStealServer.scala 109:54]
  wire  _GEN_2 = contentionCounter < _T_12 ? 1'h0 : networkCongested; // @[virtualStealServer.scala 109:63 110:26 112:26]
  wire  _GEN_3 = contentionCounter >= 64'h6 | _GEN_2; // @[virtualStealServer.scala 107:58 108:26]
  wire [63:0] _currLen_T_1 = fifoTailReg - fifoHeadReg; // @[virtualStealServer.scala 346:32]
  wire [63:0] _currLen_T_3 = maxLength - fifoHeadReg; // @[virtualStealServer.scala 351:30]
  wire [63:0] _currLen_T_5 = _currLen_T_3 + fifoTailReg; // @[virtualStealServer.scala 351:44]
  reg [63:0] lengthHistroy; // @[virtualStealServer.scala 342:32]
  wire [63:0] _currLen_T_7 = lengthHistroy + 64'h1; // @[virtualStealServer.scala 364:38]
  wire [63:0] _GEN_138 = popOrPush ? 64'h0 : _currLen_T_7; // @[virtualStealServer.scala 358:24 360:21 364:21]
  wire [63:0] _GEN_139 = fifoTailReg < fifoHeadReg ? _currLen_T_5 : _GEN_138; // @[virtualStealServer.scala 349:42 351:17]
  wire [63:0] currLen = fifoTailReg > fifoHeadReg ? _currLen_T_1 : _GEN_139; // @[virtualStealServer.scala 344:36 346:17]
  wire [63:0] _T_18 = 64'h10 + currLen; // @[virtualStealServer.scala 119:79]
  wire  _T_23 = ~networkCongested; // @[virtualStealServer.scala 132:20]
  wire [3:0] _GEN_4 = procInterrupt != 64'h0 ? 4'ha : stateReg; // @[virtualStealServer.scala 140:42 142:22 68:44]
  wire [63:0] _GEN_5 = procInterrupt != 64'h0 ? 64'hffffffffffffffff : rPause; // @[virtualStealServer.scala 140:42 143:22 65:44]
  wire [3:0] _GEN_6 = _T_23 & taskQueueBuffer_io_count != 5'h0 ? 4'h7 : _GEN_4; // @[virtualStealServer.scala 136:74 138:22]
  wire [63:0] _GEN_7 = _T_23 & taskQueueBuffer_io_count != 5'h0 ? rPause : _GEN_5; // @[virtualStealServer.scala 136:74 65:44]
  wire [3:0] _GEN_8 = ~networkCongested & currLen != 64'h0 & taskQueueBuffer_io_count == 5'h0 ? 4'h6 : _GEN_6; // @[virtualStealServer.scala 132:93 134:22]
  wire [63:0] _GEN_9 = ~networkCongested & currLen != 64'h0 & taskQueueBuffer_io_count == 5'h0 ? rPause : _GEN_7; // @[virtualStealServer.scala 132:93 65:44]
  wire [3:0] _GEN_10 = networkCongested ? 4'h2 : _GEN_8; // @[virtualStealServer.scala 128:37 130:22]
  wire [63:0] _GEN_11 = networkCongested ? rPause : _GEN_9; // @[virtualStealServer.scala 128:37 65:44]
  wire [63:0] _GEN_13 = networkCongested & taskQueueBuffer_io_count == 5'h10 ? rPause : _GEN_11; // @[virtualStealServer.scala 124:74 65:44]
  wire [63:0] _GEN_15 = currLen == maxLength & networkCongested | maxLength < _T_18 ? 64'hffffffffffffffff : _GEN_13; // @[virtualStealServer.scala 119:90 122:22]
  wire  _T_32 = stateReg == 4'h2; // @[virtualStealServer.scala 147:25]
  wire [3:0] _GEN_16 = _T_23 ? 4'h0 : stateReg; // @[virtualStealServer.scala 157:38 159:22 68:44]
  wire [3:0] _GEN_17 = io_connNetwork_data_availableTask_valid & networkCongested ? 4'h2 : _GEN_16; // @[virtualStealServer.scala 153:80 155:22]
  wire  _T_37 = stateReg == 4'h4; // @[virtualStealServer.scala 163:25]
  wire [3:0] _GEN_19 = io_write_address_ready ? 4'h3 : stateReg; // @[virtualStealServer.scala 165:37 166:22 68:44]
  wire [4:0] _GEN_20 = io_write_address_ready ? 5'h10 : memDataCounter; // @[virtualStealServer.scala 165:37 167:28 81:44]
  wire  _T_38 = stateReg == 4'h3; // @[virtualStealServer.scala 170:25]
  wire  _T_39 = memDataCounter == 5'h1; // @[virtualStealServer.scala 172:52]
  wire [63:0] _T_42 = maxLength - 64'h1; // @[virtualStealServer.scala 176:42]
  wire [63:0] _fifoTailReg_T_1 = fifoTailReg + 64'h1; // @[virtualStealServer.scala 177:44]
  wire [63:0] _GEN_21 = fifoTailReg < _T_42 ? _fifoTailReg_T_1 : 64'h0; // @[virtualStealServer.scala 176:48 177:29 179:29]
  wire [4:0] _memDataCounter_T_1 = memDataCounter - 5'h1; // @[virtualStealServer.scala 183:46]
  wire [4:0] _GEN_23 = io_write_data_ready ? _memDataCounter_T_1 : memDataCounter; // @[virtualStealServer.scala 182:40 183:28 81:44]
  wire [63:0] _GEN_24 = io_write_data_ready ? _GEN_21 : fifoTailReg; // @[virtualStealServer.scala 182:40 76:44]
  wire [3:0] _GEN_25 = io_write_data_ready & memDataCounter == 5'h1 ? 4'h0 : stateReg; // @[virtualStealServer.scala 172:60 173:22 68:44]
  wire  _GEN_26 = io_write_data_ready & memDataCounter == 5'h1 ? 1'h0 : popOrPush; // @[virtualStealServer.scala 172:60 174:23 78:44]
  wire [63:0] _GEN_27 = io_write_data_ready & memDataCounter == 5'h1 ? _GEN_21 : _GEN_24; // @[virtualStealServer.scala 172:60]
  wire [4:0] _GEN_28 = io_write_data_ready & memDataCounter == 5'h1 ? memDataCounter : _GEN_23; // @[virtualStealServer.scala 172:60 81:44]
  wire  _T_47 = stateReg == 4'h6; // @[virtualStealServer.scala 191:25]
  wire  _memDataCounter_T_2 = currLen < 64'h10; // @[virtualStealServer.scala 195:43]
  wire [63:0] _memDataCounter_T_3 = currLen < 64'h10 ? currLen : 64'h10; // @[virtualStealServer.scala 195:34]
  wire [3:0] _GEN_29 = io_read_address_ready ? 4'h5 : stateReg; // @[virtualStealServer.scala 193:36 194:22 68:44]
  wire [63:0] _GEN_30 = io_read_address_ready ? _memDataCounter_T_3 : {{59'd0}, memDataCounter}; // @[virtualStealServer.scala 193:36 195:28 81:44]
  wire  _T_48 = stateReg == 4'h5; // @[virtualStealServer.scala 198:25]
  wire [63:0] _fifoHeadReg_T_1 = fifoHeadReg + 64'h1; // @[virtualStealServer.scala 205:44]
  wire [63:0] _GEN_31 = fifoHeadReg < _T_42 ? _fifoHeadReg_T_1 : 64'h0; // @[virtualStealServer.scala 204:48 205:29 207:29]
  wire [4:0] _GEN_33 = io_read_data_valid ? _memDataCounter_T_1 : memDataCounter; // @[virtualStealServer.scala 209:39 210:28 81:44]
  wire [63:0] _GEN_34 = io_read_data_valid ? _GEN_31 : fifoHeadReg; // @[virtualStealServer.scala 209:39 77:44]
  wire [3:0] _GEN_35 = io_read_data_valid & _T_39 ? 4'h8 : stateReg; // @[virtualStealServer.scala 200:59 201:22 68:44]
  wire  _GEN_36 = io_read_data_valid & _T_39 | popOrPush; // @[virtualStealServer.scala 200:59 202:23 78:44]
  wire [63:0] _GEN_37 = io_read_data_valid & _T_39 ? _GEN_31 : _GEN_34; // @[virtualStealServer.scala 200:59]
  wire [4:0] _GEN_38 = io_read_data_valid & _T_39 ? memDataCounter : _GEN_33; // @[virtualStealServer.scala 200:59 81:44]
  wire  _T_57 = stateReg == 4'h7; // @[virtualStealServer.scala 218:25]
  wire [2:0] _GEN_39 = networkCongested ? 3'h0 : 3'h7; // @[virtualStealServer.scala 222:37 223:22 225:22]
  wire [2:0] _GEN_40 = io_connNetwork_data_qOutTask_ready ? 3'h0 : _GEN_39; // @[virtualStealServer.scala 220:49 221:22]
  wire  _T_58 = stateReg == 4'h8; // @[virtualStealServer.scala 228:25]
  wire [3:0] _GEN_41 = networkCongested ? 4'h0 : stateReg; // @[virtualStealServer.scala 234:37 236:22 68:44]
  wire [3:0] _GEN_42 = io_connNetwork_ctrl_serveStealReq_ready ? 4'h7 : _GEN_41; // @[virtualStealServer.scala 230:54 232:22]
  wire  _T_60 = rPause == 64'h0; // @[virtualStealServer.scala 242:21]
  wire [3:0] _GEN_43 = rPause == 64'h0 ? 4'h0 : 4'h9; // @[virtualStealServer.scala 242:33 244:22 248:22]
  wire [3:0] _GEN_44 = _T_60 ? 4'h0 : 4'ha; // @[virtualStealServer.scala 254:33 255:22 257:22]
  wire [3:0] _GEN_45 = stateReg == 4'ha ? _GEN_44 : stateReg; // @[virtualStealServer.scala 252:57 68:44]
  wire [3:0] _GEN_46 = stateReg == 4'h9 ? _GEN_43 : _GEN_45; // @[virtualStealServer.scala 240:46]
  wire [3:0] _GEN_47 = stateReg == 4'h8 ? _GEN_42 : _GEN_46; // @[virtualStealServer.scala 228:54]
  wire [3:0] _GEN_48 = stateReg == 4'h7 ? {{1'd0}, _GEN_40} : _GEN_47; // @[virtualStealServer.scala 218:48]
  wire [3:0] _GEN_49 = stateReg == 4'h5 ? _GEN_35 : _GEN_48; // @[virtualStealServer.scala 198:46]
  wire  _GEN_50 = stateReg == 4'h5 ? _GEN_36 : popOrPush; // @[virtualStealServer.scala 198:46 78:44]
  wire [63:0] _GEN_51 = stateReg == 4'h5 ? _GEN_37 : fifoHeadReg; // @[virtualStealServer.scala 198:46 77:44]
  wire [4:0] _GEN_52 = stateReg == 4'h5 ? _GEN_38 : memDataCounter; // @[virtualStealServer.scala 198:46 81:44]
  wire [3:0] _GEN_53 = stateReg == 4'h6 ? _GEN_29 : _GEN_49; // @[virtualStealServer.scala 191:53]
  wire [63:0] _GEN_54 = stateReg == 4'h6 ? _GEN_30 : {{59'd0}, _GEN_52}; // @[virtualStealServer.scala 191:53]
  wire  _GEN_55 = stateReg == 4'h6 ? popOrPush : _GEN_50; // @[virtualStealServer.scala 191:53 78:44]
  wire [63:0] _GEN_56 = stateReg == 4'h6 ? fifoHeadReg : _GEN_51; // @[virtualStealServer.scala 191:53 77:44]
  wire [3:0] _GEN_57 = stateReg == 4'h3 ? _GEN_25 : _GEN_53; // @[virtualStealServer.scala 170:47]
  wire  _GEN_58 = stateReg == 4'h3 ? _GEN_26 : _GEN_55; // @[virtualStealServer.scala 170:47]
  wire [63:0] _GEN_59 = stateReg == 4'h3 ? _GEN_27 : fifoTailReg; // @[virtualStealServer.scala 170:47 76:44]
  wire [63:0] _GEN_60 = stateReg == 4'h3 ? {{59'd0}, _GEN_28} : _GEN_54; // @[virtualStealServer.scala 170:47]
  wire [63:0] _GEN_61 = stateReg == 4'h3 ? fifoHeadReg : _GEN_56; // @[virtualStealServer.scala 170:47 77:44]
  wire [63:0] _GEN_63 = stateReg == 4'h4 ? {{59'd0}, _GEN_20} : _GEN_60; // @[virtualStealServer.scala 163:54]
  wire  _GEN_64 = stateReg == 4'h4 ? popOrPush : _GEN_58; // @[virtualStealServer.scala 163:54 78:44]
  wire [63:0] _GEN_65 = stateReg == 4'h4 ? fifoTailReg : _GEN_59; // @[virtualStealServer.scala 163:54 76:44]
  wire [63:0] _GEN_66 = stateReg == 4'h4 ? fifoHeadReg : _GEN_61; // @[virtualStealServer.scala 163:54 77:44]
  wire [63:0] _GEN_68 = stateReg == 4'h2 ? {{59'd0}, memDataCounter} : _GEN_63; // @[virtualStealServer.scala 147:46 81:44]
  wire  _GEN_69 = stateReg == 4'h2 ? popOrPush : _GEN_64; // @[virtualStealServer.scala 147:46 78:44]
  wire [63:0] _GEN_70 = stateReg == 4'h2 ? fifoTailReg : _GEN_65; // @[virtualStealServer.scala 147:46 76:44]
  wire [63:0] _GEN_71 = stateReg == 4'h2 ? fifoHeadReg : _GEN_66; // @[virtualStealServer.scala 147:46 77:44]
  wire [63:0] _GEN_73 = stateReg == 4'h0 ? _GEN_15 : rPause; // @[virtualStealServer.scala 117:34 65:44]
  wire [63:0] _GEN_74 = stateReg == 4'h0 ? {{59'd0}, memDataCounter} : _GEN_68; // @[virtualStealServer.scala 117:34 81:44]
  wire  _GEN_75 = stateReg == 4'h0 ? popOrPush : _GEN_69; // @[virtualStealServer.scala 117:34 78:44]
  wire [63:0] _GEN_76 = stateReg == 4'h0 ? fifoTailReg : _GEN_70; // @[virtualStealServer.scala 117:34 76:44]
  wire [63:0] _GEN_77 = stateReg == 4'h0 ? fifoHeadReg : _GEN_71; // @[virtualStealServer.scala 117:34 77:44]
  wire [68:0] _GEN_166 = {fifoTailReg, 5'h0}; // @[virtualStealServer.scala 305:65]
  wire [70:0] _io_write_address_bits_T = {{2'd0}, _GEN_166}; // @[virtualStealServer.scala 305:65]
  wire [70:0] _GEN_167 = {{7'd0}, rAddr}; // @[virtualStealServer.scala 305:79]
  wire [70:0] _io_write_address_bits_T_2 = _io_write_address_bits_T + _GEN_167; // @[virtualStealServer.scala 305:79]
  wire [68:0] _GEN_168 = {fifoHeadReg, 5'h0}; // @[virtualStealServer.scala 320:65]
  wire [70:0] _io_read_address_bits_T = {{2'd0}, _GEN_168}; // @[virtualStealServer.scala 320:65]
  wire [70:0] _io_read_address_bits_T_2 = _io_read_address_bits_T + _GEN_167; // @[virtualStealServer.scala 320:79]
  wire [63:0] _io_read_burst_len_T_2 = currLen - 64'h1; // @[virtualStealServer.scala 321:79]
  wire [63:0] _io_read_burst_len_T_3 = _memDataCounter_T_2 ? _io_read_burst_len_T_2 : 64'hf; // @[virtualStealServer.scala 321:55]
  wire  _GEN_81 = _T_57 & io_connNetwork_data_qOutTask_ready; // @[virtualStealServer.scala 286:45 329:48 332:49]
  wire  _GEN_82 = _T_57 ? 1'h0 : _T_58; // @[virtualStealServer.scala 280:45 329:48]
  wire [255:0] _GEN_84 = _T_48 ? io_read_data_bits : 256'h0; // @[virtualStealServer.scala 284:45 323:46 326:49]
  wire  _GEN_85 = _T_48 & io_read_data_valid; // @[virtualStealServer.scala 283:45 323:46 327:49]
  wire  _GEN_86 = _T_48 ? 1'h0 : _T_57; // @[virtualStealServer.scala 276:45 323:46]
  wire  _GEN_87 = _T_48 ? 1'h0 : _GEN_81; // @[virtualStealServer.scala 286:45 323:46]
  wire  _GEN_88 = _T_48 ? 1'h0 : _GEN_82; // @[virtualStealServer.scala 280:45 323:46]
  wire [70:0] _GEN_90 = _T_47 ? _io_read_address_bits_T_2 : 71'h0; // @[virtualStealServer.scala 268:45 317:53 320:49]
  wire [63:0] _GEN_91 = _T_47 ? _io_read_burst_len_T_3 : 64'h0; // @[virtualStealServer.scala 291:45 317:53 321:49]
  wire  _GEN_92 = _T_47 ? 1'h0 : _T_48; // @[virtualStealServer.scala 269:45 317:53]
  wire [255:0] _GEN_93 = _T_47 ? 256'h0 : _GEN_84; // @[virtualStealServer.scala 284:45 317:53]
  wire  _GEN_94 = _T_47 ? 1'h0 : _GEN_85; // @[virtualStealServer.scala 283:45 317:53]
  wire  _GEN_95 = _T_47 ? 1'h0 : _GEN_86; // @[virtualStealServer.scala 276:45 317:53]
  wire  _GEN_96 = _T_47 ? 1'h0 : _GEN_87; // @[virtualStealServer.scala 286:45 317:53]
  wire  _GEN_97 = _T_47 ? 1'h0 : _GEN_88; // @[virtualStealServer.scala 280:45 317:53]
  wire  _GEN_99 = _T_38 ? io_write_data_ready : _GEN_96; // @[virtualStealServer.scala 308:47 311:49]
  wire  _GEN_100 = _T_38 & _T_39; // @[virtualStealServer.scala 290:45 308:47]
  wire  _GEN_101 = _T_38 ? 1'h0 : _T_47; // @[virtualStealServer.scala 267:45 308:47]
  wire [70:0] _GEN_102 = _T_38 ? 71'h0 : _GEN_90; // @[virtualStealServer.scala 268:45 308:47]
  wire [63:0] _GEN_103 = _T_38 ? 64'h0 : _GEN_91; // @[virtualStealServer.scala 291:45 308:47]
  wire  _GEN_104 = _T_38 ? 1'h0 : _GEN_92; // @[virtualStealServer.scala 269:45 308:47]
  wire [255:0] _GEN_105 = _T_38 ? 256'h0 : _GEN_93; // @[virtualStealServer.scala 284:45 308:47]
  wire  _GEN_106 = _T_38 ? 1'h0 : _GEN_94; // @[virtualStealServer.scala 283:45 308:47]
  wire  _GEN_107 = _T_38 ? 1'h0 : _GEN_95; // @[virtualStealServer.scala 276:45 308:47]
  wire  _GEN_108 = _T_38 ? 1'h0 : _GEN_97; // @[virtualStealServer.scala 280:45 308:47]
  wire [70:0] _GEN_110 = _T_37 ? _io_write_address_bits_T_2 : 71'h0; // @[virtualStealServer.scala 271:45 302:54 305:49]
  wire [3:0] _GEN_111 = _T_37 ? 4'hf : 4'h0; // @[virtualStealServer.scala 289:45 302:54 306:49]
  wire  _GEN_112 = _T_37 ? 1'h0 : _T_38; // @[virtualStealServer.scala 272:45 302:54]
  wire  _GEN_113 = _T_37 ? 1'h0 : _GEN_99; // @[virtualStealServer.scala 286:45 302:54]
  wire  _GEN_114 = _T_37 ? 1'h0 : _GEN_100; // @[virtualStealServer.scala 290:45 302:54]
  wire  _GEN_115 = _T_37 ? 1'h0 : _GEN_101; // @[virtualStealServer.scala 267:45 302:54]
  wire [70:0] _GEN_116 = _T_37 ? 71'h0 : _GEN_102; // @[virtualStealServer.scala 268:45 302:54]
  wire [63:0] _GEN_117 = _T_37 ? 64'h0 : _GEN_103; // @[virtualStealServer.scala 291:45 302:54]
  wire  _GEN_118 = _T_37 ? 1'h0 : _GEN_104; // @[virtualStealServer.scala 269:45 302:54]
  wire [255:0] _GEN_119 = _T_37 ? 256'h0 : _GEN_105; // @[virtualStealServer.scala 284:45 302:54]
  wire  _GEN_120 = _T_37 ? 1'h0 : _GEN_106; // @[virtualStealServer.scala 283:45 302:54]
  wire  _GEN_121 = _T_37 ? 1'h0 : _GEN_107; // @[virtualStealServer.scala 276:45 302:54]
  wire  _GEN_122 = _T_37 ? 1'h0 : _GEN_108; // @[virtualStealServer.scala 280:45 302:54]
  wire [70:0] _GEN_127 = _T_32 ? 71'h0 : _GEN_110; // @[virtualStealServer.scala 296:40 271:45]
  wire [70:0] _GEN_133 = _T_32 ? 71'h0 : _GEN_116; // @[virtualStealServer.scala 296:40 268:45]
  wire [63:0] _GEN_134 = _T_32 ? 64'h0 : _GEN_117; // @[virtualStealServer.scala 296:40 291:45]
  wire [63:0] _GEN_143 = 6'h0 == rdAddr ? rPause : 64'hffffffffffffffff; // @[RegisterBlock.scala 220:10 224:38 225:16]
  wire [63:0] _GEN_144 = 6'h8 == rdAddr ? rAddr : _GEN_143; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_145 = 6'h10 == rdAddr ? maxLength : _GEN_144; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_146 = 6'h18 == rdAddr ? fifoTailReg : _GEN_145; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_147 = 6'h20 == rdAddr ? fifoHeadReg : _GEN_146; // @[RegisterBlock.scala 224:38 225:16]
  wire  _T_80 = ~reset; // @[RegisterBlock.scala 182:11]
  wire [7:0] wrReqData__bits_strb = wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 417:19 418:14]
  wire [63:0] wrReqData__bits_data = wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 417:19 418:14]
  wire [7:0] rPause_byte_wdata = wrReqData__bits_data[7:0]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original = rPause[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : rPause_byte_original; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_1 = wrReqData__bits_data[15:8]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_1 = rPause[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : rPause_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_2 = wrReqData__bits_data[23:16]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_2 = rPause[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : rPause_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_3 = wrReqData__bits_data[31:24]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_3 = rPause[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : rPause_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_4 = wrReqData__bits_data[39:32]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_4 = rPause[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : rPause_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_5 = wrReqData__bits_data[47:40]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_5 = rPause[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : rPause_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_6 = wrReqData__bits_data[55:48]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_6 = rPause[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : rPause_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_7 = wrReqData__bits_data[63:56]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_7 = rPause[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : rPause_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _rPause_T_16 = {_rPause_T_15,_rPause_T_14,_rPause_T_13,_rPause_T_12,_rPause_T_11,_rPause_T_10,_rPause_T_9,
    _rPause_T_8}; // @[Interface.scala 262:7]
  wire [7:0] rAddr_byte_original = rAddr[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : rAddr_byte_original; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_1 = rAddr[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : rAddr_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_2 = rAddr[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : rAddr_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_3 = rAddr[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : rAddr_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_4 = rAddr[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : rAddr_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_5 = rAddr[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : rAddr_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_6 = rAddr[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : rAddr_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_7 = rAddr[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : rAddr_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _rAddr_T_16 = {_rAddr_T_15,_rAddr_T_14,_rAddr_T_13,_rAddr_T_12,_rAddr_T_11,_rAddr_T_10,_rAddr_T_9,
    _rAddr_T_8}; // @[Interface.scala 262:7]
  wire [7:0] maxLength_byte_original = maxLength[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : maxLength_byte_original; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_1 = maxLength[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : maxLength_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_2 = maxLength[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : maxLength_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_3 = maxLength[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : maxLength_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_4 = maxLength[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : maxLength_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_5 = maxLength[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : maxLength_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_6 = maxLength[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : maxLength_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_7 = maxLength[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : maxLength_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _maxLength_T_16 = {_maxLength_T_15,_maxLength_T_14,_maxLength_T_13,_maxLength_T_12,_maxLength_T_11,
    _maxLength_T_10,_maxLength_T_9,_maxLength_T_8}; // @[Interface.scala 262:7]
  wire [7:0] fifoTailReg_byte_original = fifoTailReg[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_12 = wrReqData__bits_strb[0] ? rPause_byte_wdata : fifoTailReg_byte_original; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_1 = fifoTailReg[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_13 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : fifoTailReg_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_2 = fifoTailReg[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_14 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : fifoTailReg_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_3 = fifoTailReg[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_15 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : fifoTailReg_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_4 = fifoTailReg[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_16 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : fifoTailReg_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_5 = fifoTailReg[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_17 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : fifoTailReg_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_6 = fifoTailReg[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_18 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : fifoTailReg_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_7 = fifoTailReg[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_19 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : fifoTailReg_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _fifoTailReg_T_20 = {_fifoTailReg_T_19,_fifoTailReg_T_18,_fifoTailReg_T_17,_fifoTailReg_T_16,
    _fifoTailReg_T_15,_fifoTailReg_T_14,_fifoTailReg_T_13,_fifoTailReg_T_12}; // @[Interface.scala 262:7]
  wire [7:0] fifoHeadReg_byte_original = fifoHeadReg[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_12 = wrReqData__bits_strb[0] ? rPause_byte_wdata : fifoHeadReg_byte_original; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_1 = fifoHeadReg[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_13 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : fifoHeadReg_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_2 = fifoHeadReg[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_14 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : fifoHeadReg_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_3 = fifoHeadReg[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_15 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : fifoHeadReg_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_4 = fifoHeadReg[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_16 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : fifoHeadReg_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_5 = fifoHeadReg[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_17 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : fifoHeadReg_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_6 = fifoHeadReg[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_18 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : fifoHeadReg_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_7 = fifoHeadReg[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_19 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : fifoHeadReg_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _fifoHeadReg_T_20 = {_fifoHeadReg_T_19,_fifoHeadReg_T_18,_fifoHeadReg_T_17,_fifoHeadReg_T_16,
    _fifoHeadReg_T_15,_fifoHeadReg_T_14,_fifoHeadReg_T_13,_fifoHeadReg_T_12}; // @[Interface.scala 262:7]
  wire [7:0] procInterrupt_byte_original = procInterrupt[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : procInterrupt_byte_original; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_1 = procInterrupt[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : procInterrupt_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_2 = procInterrupt[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : procInterrupt_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_3 = procInterrupt[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : procInterrupt_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_4 = procInterrupt[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : procInterrupt_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_5 = procInterrupt[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : procInterrupt_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_6 = procInterrupt[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : procInterrupt_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_7 = procInterrupt[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : procInterrupt_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _procInterrupt_T_16 = {_procInterrupt_T_15,_procInterrupt_T_14,_procInterrupt_T_13,_procInterrupt_T_12,
    _procInterrupt_T_11,_procInterrupt_T_10,_procInterrupt_T_9,_procInterrupt_T_8}; // @[Interface.scala 262:7]
  wire [63:0] _GEN_170 = reset ? 64'h0 : _GEN_74; // @[virtualStealServer.scala 81:{44,44}]
  Queue rdReq__deq ( // @[Decoupled.scala 377:21]
    .clock(rdReq__deq_clock),
    .reset(rdReq__deq_reset),
    .io_enq_ready(rdReq__deq_io_enq_ready),
    .io_enq_valid(rdReq__deq_io_enq_valid),
    .io_enq_bits_addr(rdReq__deq_io_enq_bits_addr),
    .io_deq_ready(rdReq__deq_io_deq_ready),
    .io_deq_valid(rdReq__deq_io_deq_valid),
    .io_deq_bits_addr(rdReq__deq_io_deq_bits_addr)
  );
  Queue wrReq__deq ( // @[Decoupled.scala 377:21]
    .clock(wrReq__deq_clock),
    .reset(wrReq__deq_reset),
    .io_enq_ready(wrReq__deq_io_enq_ready),
    .io_enq_valid(wrReq__deq_io_enq_valid),
    .io_enq_bits_addr(wrReq__deq_io_enq_bits_addr),
    .io_deq_ready(wrReq__deq_io_deq_ready),
    .io_deq_valid(wrReq__deq_io_deq_valid),
    .io_deq_bits_addr(wrReq__deq_io_deq_bits_addr)
  );
  Queue_2 wrReqData__deq ( // @[Decoupled.scala 377:21]
    .clock(wrReqData__deq_clock),
    .reset(wrReqData__deq_reset),
    .io_enq_ready(wrReqData__deq_io_enq_ready),
    .io_enq_valid(wrReqData__deq_io_enq_valid),
    .io_enq_bits_data(wrReqData__deq_io_enq_bits_data),
    .io_enq_bits_strb(wrReqData__deq_io_enq_bits_strb),
    .io_deq_ready(wrReqData__deq_io_deq_ready),
    .io_deq_valid(wrReqData__deq_io_deq_valid),
    .io_deq_bits_data(wrReqData__deq_io_deq_bits_data),
    .io_deq_bits_strb(wrReqData__deq_io_deq_bits_strb)
  );
  Queue_3 taskQueueBuffer ( // @[virtualStealServer.scala 80:43]
    .clock(taskQueueBuffer_clock),
    .reset(taskQueueBuffer_reset),
    .io_enq_ready(taskQueueBuffer_io_enq_ready),
    .io_enq_valid(taskQueueBuffer_io_enq_valid),
    .io_enq_bits(taskQueueBuffer_io_enq_bits),
    .io_deq_ready(taskQueueBuffer_io_deq_ready),
    .io_deq_valid(taskQueueBuffer_io_deq_valid),
    .io_deq_bits(taskQueueBuffer_io_deq_bits),
    .io_count(taskQueueBuffer_io_count)
  );
  assign io_connNetwork_ctrl_serveStealReq_valid = _T_32 ? 1'h0 : _GEN_122; // @[virtualStealServer.scala 296:40 280:45]
  assign io_connNetwork_data_availableTask_ready = stateReg == 4'h2; // @[virtualStealServer.scala 296:19]
  assign io_connNetwork_data_qOutTask_valid = _T_32 ? 1'h0 : _GEN_121; // @[virtualStealServer.scala 296:40 276:45]
  assign io_connNetwork_data_qOutTask_bits = taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 262:45]
  assign io_axi_mgmt_ARREADY = rdReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_RVALID = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign io_axi_mgmt_RDATA = 6'h28 == rdAddr ? procInterrupt : _GEN_147; // @[RegisterBlock.scala 224:38 225:16]
  assign io_axi_mgmt_AWREADY = wrReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_WREADY = wrReqData__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_BVALID = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign io_read_address_valid = _T_32 ? 1'h0 : _GEN_115; // @[virtualStealServer.scala 296:40 267:45]
  assign io_read_address_bits = _GEN_133[63:0];
  assign io_read_data_ready = _T_32 ? 1'h0 : _GEN_118; // @[virtualStealServer.scala 296:40 269:45]
  assign io_read_burst_len = _GEN_134[3:0];
  assign io_write_address_valid = _T_32 ? 1'h0 : _T_37; // @[virtualStealServer.scala 296:40 270:45]
  assign io_write_address_bits = _GEN_127[63:0];
  assign io_write_data_valid = _T_32 ? 1'h0 : _GEN_112; // @[virtualStealServer.scala 296:40 272:45]
  assign io_write_data_bits = taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 263:45]
  assign io_write_burst_len = _T_32 ? 4'h0 : _GEN_111; // @[virtualStealServer.scala 296:40 289:45]
  assign io_write_last = _T_32 ? 1'h0 : _GEN_114; // @[virtualStealServer.scala 296:40 290:45]
  assign rdReq__deq_clock = clock;
  assign rdReq__deq_reset = reset;
  assign rdReq__deq_io_enq_valid = io_axi_mgmt_ARVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign rdReq__deq_io_enq_bits_addr = io_axi_mgmt_ARADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign rdReq__deq_io_deq_ready = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign wrReq__deq_clock = clock;
  assign wrReq__deq_reset = reset;
  assign wrReq__deq_io_enq_valid = io_axi_mgmt_AWVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReq__deq_io_enq_bits_addr = io_axi_mgmt_AWADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReq__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign wrReqData__deq_clock = clock;
  assign wrReqData__deq_reset = reset;
  assign wrReqData__deq_io_enq_valid = io_axi_mgmt_WVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReqData__deq_io_enq_bits_data = io_axi_mgmt_WDATA; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReqData__deq_io_enq_bits_strb = io_axi_mgmt_WSTRB; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReqData__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign taskQueueBuffer_clock = clock;
  assign taskQueueBuffer_reset = reset;
  assign taskQueueBuffer_io_enq_valid = _T_32 ? io_connNetwork_data_availableTask_valid : _GEN_120; // @[virtualStealServer.scala 296:40 300:49]
  assign taskQueueBuffer_io_enq_bits = _T_32 ? io_connNetwork_data_availableTask_bits : _GEN_119; // @[virtualStealServer.scala 296:40 298:49]
  assign taskQueueBuffer_io_deq_ready = _T_32 ? 1'h0 : _GEN_113; // @[virtualStealServer.scala 296:40 286:45]
  always @(posedge clock) begin
    if (reset) begin // @[virtualStealServer.scala 64:44]
      rAddr <= 64'h0; // @[virtualStealServer.scala 64:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h8 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rAddr <= _rAddr_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 65:44]
      rPause <= 64'h0; // @[virtualStealServer.scala 65:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h0 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rPause <= _rPause_T_16; // @[RegisterBlock.scala 118:11]
      end else begin
        rPause <= _GEN_73;
      end
    end else begin
      rPause <= _GEN_73;
    end
    if (reset) begin // @[virtualStealServer.scala 66:44]
      procInterrupt <= 64'h0; // @[virtualStealServer.scala 66:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h28 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        procInterrupt <= _procInterrupt_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 67:44]
      maxLength <= 64'h0; // @[virtualStealServer.scala 67:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h10 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        maxLength <= _maxLength_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 68:44]
      stateReg <= 4'h0; // @[virtualStealServer.scala 68:44]
    end else if (stateReg == 4'h0) begin // @[virtualStealServer.scala 117:34]
      if (currLen == maxLength & networkCongested | maxLength < _T_18) begin // @[virtualStealServer.scala 119:90]
        stateReg <= 4'h9; // @[virtualStealServer.scala 121:22]
      end else if (networkCongested & taskQueueBuffer_io_count == 5'h10) begin // @[virtualStealServer.scala 124:74]
        stateReg <= 4'h4; // @[virtualStealServer.scala 126:22]
      end else begin
        stateReg <= _GEN_10;
      end
    end else if (stateReg == 4'h2) begin // @[virtualStealServer.scala 147:46]
      if (taskQueueBuffer_io_count == 5'hf & io_connNetwork_data_availableTask_valid) begin // @[virtualStealServer.scala 149:91]
        stateReg <= 4'h4; // @[virtualStealServer.scala 151:22]
      end else begin
        stateReg <= _GEN_17;
      end
    end else if (stateReg == 4'h4) begin // @[virtualStealServer.scala 163:54]
      stateReg <= _GEN_19;
    end else begin
      stateReg <= _GEN_57;
    end
    if (reset) begin // @[virtualStealServer.scala 70:44]
      contentionCounter <= 64'h0; // @[virtualStealServer.scala 70:44]
    end else if (_T_1 & contentionCounter != 64'h8) begin // @[virtualStealServer.scala 96:57]
      contentionCounter <= _contentionCounter_T_1; // @[virtualStealServer.scala 97:27]
    end else if (_T_5 & ~io_ntwDataUnitOccupancy) begin // @[virtualStealServer.scala 100:46]
      contentionCounter <= _contentionCounter_T_3; // @[virtualStealServer.scala 101:27]
    end
    if (reset) begin // @[virtualStealServer.scala 72:44]
      networkCongested <= 1'h0; // @[virtualStealServer.scala 72:44]
    end else begin
      networkCongested <= _GEN_3;
    end
    if (reset) begin // @[virtualStealServer.scala 76:44]
      fifoTailReg <= 64'h0; // @[virtualStealServer.scala 76:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h18 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoTailReg <= _fifoTailReg_T_20; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoTailReg <= _GEN_76;
      end
    end else begin
      fifoTailReg <= _GEN_76;
    end
    if (reset) begin // @[virtualStealServer.scala 77:44]
      fifoHeadReg <= 64'h0; // @[virtualStealServer.scala 77:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h20 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoHeadReg <= _fifoHeadReg_T_20; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoHeadReg <= _GEN_77;
      end
    end else begin
      fifoHeadReg <= _GEN_77;
    end
    popOrPush <= reset | _GEN_75; // @[virtualStealServer.scala 78:{44,44}]
    memDataCounter <= _GEN_170[4:0]; // @[virtualStealServer.scala 81:{44,44}]
    if (reset) begin // @[virtualStealServer.scala 342:32]
      lengthHistroy <= 64'h0; // @[virtualStealServer.scala 342:32]
    end else if (fifoTailReg > fifoHeadReg) begin // @[virtualStealServer.scala 344:36]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 347:23]
    end else if (fifoTailReg < fifoHeadReg) begin // @[virtualStealServer.scala 349:42]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 352:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (rdReq & ~reset & ~rdReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:182 assert(rdReq)\n"); // @[RegisterBlock.scala 182:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~rdReq & (rdReq & ~reset)) begin
          $fatal; // @[RegisterBlock.scala 182:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wrReq & _T_80 & ~wrReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:198 assert(wrReq)\n"); // @[RegisterBlock.scala 198:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~wrReq & (wrReq & _T_80)) begin
          $fatal; // @[RegisterBlock.scala 198:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  rAddr = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  rPause = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  procInterrupt = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  maxLength = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  stateReg = _RAND_4[3:0];
  _RAND_5 = {2{`RANDOM}};
  contentionCounter = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  networkCongested = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  fifoTailReg = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  fifoHeadReg = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  popOrPush = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  memDataCounter = _RAND_10[4:0];
  _RAND_11 = {2{`RANDOM}};
  lengthHistroy = _RAND_11[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module readyValidMem(
  input          clock,
  input          reset,
  output         io_read_address_ready,
  input          io_read_address_valid,
  input  [63:0]  io_read_address_bits,
  input          io_read_data_ready,
  output         io_read_data_valid,
  output [255:0] io_read_data_bits,
  output         io_write_address_ready,
  input          io_write_address_valid,
  input  [63:0]  io_write_address_bits,
  output         io_write_data_ready,
  input          io_write_data_valid,
  input  [255:0] io_write_data_bits,
  input  [3:0]   io_writeBurst_len,
  input          io_writeBurst_last,
  input  [3:0]   io_readBurst_len,
  input          axi_ARREADY,
  output         axi_ARVALID,
  output [63:0]  axi_ARADDR,
  output [7:0]   axi_ARLEN,
  output         axi_RREADY,
  input          axi_RVALID,
  input  [255:0] axi_RDATA,
  input          axi_AWREADY,
  output         axi_AWVALID,
  output [63:0]  axi_AWADDR,
  output [7:0]   axi_AWLEN,
  input          axi_WREADY,
  output         axi_WVALID,
  output [255:0] axi_WDATA,
  output         axi_WLAST,
  input          axi_BVALID
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  writeHandshakeDetector; // @[readyValidMem.scala 49:39]
  wire  _T_1 = ~writeHandshakeDetector; // @[readyValidMem.scala 81:58]
  wire  _GEN_0 = io_writeBurst_last | writeHandshakeDetector; // @[readyValidMem.scala 84:45 85:34 49:39]
  assign io_read_address_ready = axi_ARREADY; // @[readyValidMem.scala 155:31]
  assign io_read_data_valid = axi_RVALID; // @[readyValidMem.scala 171:31]
  assign io_read_data_bits = axi_RDATA; // @[readyValidMem.scala 172:31]
  assign io_write_address_ready = axi_AWREADY; // @[readyValidMem.scala 143:32]
  assign io_write_data_ready = axi_WREADY & _T_1; // @[readyValidMem.scala 94:53]
  assign axi_ARVALID = io_read_address_valid; // @[readyValidMem.scala 153:31]
  assign axi_ARADDR = io_read_address_bits; // @[readyValidMem.scala 154:31]
  assign axi_ARLEN = {{4'd0}, io_readBurst_len}; // @[readyValidMem.scala 158:33]
  assign axi_RREADY = io_read_data_ready; // @[readyValidMem.scala 169:31]
  assign axi_AWVALID = io_write_address_valid; // @[readyValidMem.scala 116:28]
  assign axi_AWADDR = io_write_address_bits; // @[readyValidMem.scala 117:28]
  assign axi_AWLEN = {{4'd0}, io_writeBurst_len}; // @[readyValidMem.scala 120:30]
  assign axi_WVALID = io_write_data_valid & axi_WREADY & ~writeHandshakeDetector; // @[readyValidMem.scala 81:55]
  assign axi_WDATA = io_write_data_bits; // @[readyValidMem.scala 130:28]
  assign axi_WLAST = io_writeBurst_last; // @[readyValidMem.scala 134:30]
  always @(posedge clock) begin
    if (reset) begin // @[readyValidMem.scala 49:39]
      writeHandshakeDetector <= 1'h0; // @[readyValidMem.scala 49:39]
    end else if (io_write_data_valid & axi_WREADY & ~writeHandshakeDetector) begin // @[readyValidMem.scala 81:82]
      writeHandshakeDetector <= _GEN_0;
    end else if (axi_BVALID) begin // @[readyValidMem.scala 88:34]
      writeHandshakeDetector <= 1'h0; // @[readyValidMem.scala 90:32]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  writeHandshakeDetector = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module stealSide(
  input          clock,
  input          reset,
  output         io_axi_mgmt_vss_0_ARREADY,
  input          io_axi_mgmt_vss_0_ARVALID,
  input  [5:0]   io_axi_mgmt_vss_0_ARADDR,
  input          io_axi_mgmt_vss_0_RREADY,
  output         io_axi_mgmt_vss_0_RVALID,
  output [63:0]  io_axi_mgmt_vss_0_RDATA,
  output         io_axi_mgmt_vss_0_AWREADY,
  input          io_axi_mgmt_vss_0_AWVALID,
  input  [5:0]   io_axi_mgmt_vss_0_AWADDR,
  output         io_axi_mgmt_vss_0_WREADY,
  input          io_axi_mgmt_vss_0_WVALID,
  input  [63:0]  io_axi_mgmt_vss_0_WDATA,
  input  [7:0]   io_axi_mgmt_vss_0_WSTRB,
  input          io_axi_mgmt_vss_0_BREADY,
  output         io_axi_mgmt_vss_0_BVALID,
  input          io_vss_axi_full_0_ARREADY,
  output         io_vss_axi_full_0_ARVALID,
  output [63:0]  io_vss_axi_full_0_ARADDR,
  output [7:0]   io_vss_axi_full_0_ARLEN,
  output         io_vss_axi_full_0_RREADY,
  input          io_vss_axi_full_0_RVALID,
  input  [255:0] io_vss_axi_full_0_RDATA,
  input          io_vss_axi_full_0_AWREADY,
  output         io_vss_axi_full_0_AWVALID,
  output [63:0]  io_vss_axi_full_0_AWADDR,
  output [7:0]   io_vss_axi_full_0_AWLEN,
  input          io_vss_axi_full_0_WREADY,
  output         io_vss_axi_full_0_WVALID,
  output [255:0] io_vss_axi_full_0_WDATA,
  output         io_vss_axi_full_0_WLAST,
  input          io_vss_axi_full_0_BVALID,
  input          io_taskOut_0_TREADY,
  output         io_taskOut_0_TVALID,
  output [255:0] io_taskOut_0_TDATA,
  input          io_taskOut_1_TREADY,
  output         io_taskOut_1_TVALID,
  output [255:0] io_taskOut_1_TDATA,
  input          io_taskOut_2_TREADY,
  output         io_taskOut_2_TVALID,
  output [255:0] io_taskOut_2_TDATA,
  input          io_taskOut_3_TREADY,
  output         io_taskOut_3_TVALID,
  output [255:0] io_taskOut_3_TDATA,
  output         connSyncSide_0_ctrl_serveStealReq_ready,
  input          connSyncSide_0_ctrl_serveStealReq_valid,
  output         connSyncSide_0_data_qOutTask_ready,
  input          connSyncSide_0_data_qOutTask_valid,
  input  [255:0] connSyncSide_0_data_qOutTask_bits,
  output         connSyncSide_1_ctrl_serveStealReq_ready,
  input          connSyncSide_1_ctrl_serveStealReq_valid,
  output         connSyncSide_1_data_qOutTask_ready,
  input          connSyncSide_1_data_qOutTask_valid,
  input  [255:0] connSyncSide_1_data_qOutTask_bits,
  output         connSyncSide_2_ctrl_serveStealReq_ready,
  input          connSyncSide_2_ctrl_serveStealReq_valid,
  output         connSyncSide_2_data_qOutTask_ready,
  input          connSyncSide_2_data_qOutTask_valid,
  input  [255:0] connSyncSide_2_data_qOutTask_bits,
  output         connSyncSide_3_ctrl_serveStealReq_ready,
  input          connSyncSide_3_ctrl_serveStealReq_valid,
  output         connSyncSide_3_data_qOutTask_ready,
  input          connSyncSide_3_data_qOutTask_valid,
  input  [255:0] connSyncSide_3_data_qOutTask_bits
);
  wire  stealNW_TQ_clock; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_reset; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connVSS_0_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_0_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_0_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_0_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connVAS_0_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_1_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_1_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_1_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_1_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connVAS_1_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_2_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_2_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_2_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_2_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connVAS_2_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_3_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_3_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_3_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVAS_3_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [255:0] stealNW_TQ_io_connVAS_3_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_0; // @[stealSide.scala 53:28]
  wire  virtualStealServers_0_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [255:0] virtualStealServers_0_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [255:0] virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_ARREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_ARVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_0_io_axi_mgmt_ARADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_RREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_RVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_axi_mgmt_RDATA; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_AWREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_AWVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_0_io_axi_mgmt_AWADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_WREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_WVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_axi_mgmt_WDATA; // @[stealSide.scala 63:75]
  wire [7:0] virtualStealServers_0_io_axi_mgmt_WSTRB; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_BREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_BVALID; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_read_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_data_valid; // @[stealSide.scala 63:75]
  wire [255:0] virtualStealServers_0_io_read_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_0_io_read_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [255:0] virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_0_io_write_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_last; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  vssRvm_0_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_0_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [255:0] vssRvm_0_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [255:0] vssRvm_0_io_write_data_bits; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_0_io_writeBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_writeBurst_last; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_0_io_readBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_axi_ARADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_0_axi_ARLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_RVALID; // @[stealSide.scala 87:68]
  wire [255:0] vssRvm_0_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_axi_AWADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_0_axi_AWLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WVALID; // @[stealSide.scala 87:68]
  wire [255:0] vssRvm_0_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WLAST; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_BVALID; // @[stealSide.scala 87:68]
  stealNW_TQ stealNW_TQ ( // @[stealSide.scala 53:28]
    .clock(stealNW_TQ_clock),
    .reset(stealNW_TQ_reset),
    .io_connPE_0_pop_ready(stealNW_TQ_io_connPE_0_pop_ready),
    .io_connPE_0_pop_valid(stealNW_TQ_io_connPE_0_pop_valid),
    .io_connPE_0_pop_bits(stealNW_TQ_io_connPE_0_pop_bits),
    .io_connPE_1_pop_ready(stealNW_TQ_io_connPE_1_pop_ready),
    .io_connPE_1_pop_valid(stealNW_TQ_io_connPE_1_pop_valid),
    .io_connPE_1_pop_bits(stealNW_TQ_io_connPE_1_pop_bits),
    .io_connPE_2_pop_ready(stealNW_TQ_io_connPE_2_pop_ready),
    .io_connPE_2_pop_valid(stealNW_TQ_io_connPE_2_pop_valid),
    .io_connPE_2_pop_bits(stealNW_TQ_io_connPE_2_pop_bits),
    .io_connPE_3_pop_ready(stealNW_TQ_io_connPE_3_pop_ready),
    .io_connPE_3_pop_valid(stealNW_TQ_io_connPE_3_pop_valid),
    .io_connPE_3_pop_bits(stealNW_TQ_io_connPE_3_pop_bits),
    .io_connVSS_0_ctrl_serveStealReq_ready(stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready),
    .io_connVSS_0_ctrl_serveStealReq_valid(stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid),
    .io_connVSS_0_data_availableTask_ready(stealNW_TQ_io_connVSS_0_data_availableTask_ready),
    .io_connVSS_0_data_availableTask_valid(stealNW_TQ_io_connVSS_0_data_availableTask_valid),
    .io_connVSS_0_data_availableTask_bits(stealNW_TQ_io_connVSS_0_data_availableTask_bits),
    .io_connVSS_0_data_qOutTask_ready(stealNW_TQ_io_connVSS_0_data_qOutTask_ready),
    .io_connVSS_0_data_qOutTask_valid(stealNW_TQ_io_connVSS_0_data_qOutTask_valid),
    .io_connVSS_0_data_qOutTask_bits(stealNW_TQ_io_connVSS_0_data_qOutTask_bits),
    .io_connVAS_0_ctrl_serveStealReq_ready(stealNW_TQ_io_connVAS_0_ctrl_serveStealReq_ready),
    .io_connVAS_0_ctrl_serveStealReq_valid(stealNW_TQ_io_connVAS_0_ctrl_serveStealReq_valid),
    .io_connVAS_0_data_qOutTask_ready(stealNW_TQ_io_connVAS_0_data_qOutTask_ready),
    .io_connVAS_0_data_qOutTask_valid(stealNW_TQ_io_connVAS_0_data_qOutTask_valid),
    .io_connVAS_0_data_qOutTask_bits(stealNW_TQ_io_connVAS_0_data_qOutTask_bits),
    .io_connVAS_1_ctrl_serveStealReq_ready(stealNW_TQ_io_connVAS_1_ctrl_serveStealReq_ready),
    .io_connVAS_1_ctrl_serveStealReq_valid(stealNW_TQ_io_connVAS_1_ctrl_serveStealReq_valid),
    .io_connVAS_1_data_qOutTask_ready(stealNW_TQ_io_connVAS_1_data_qOutTask_ready),
    .io_connVAS_1_data_qOutTask_valid(stealNW_TQ_io_connVAS_1_data_qOutTask_valid),
    .io_connVAS_1_data_qOutTask_bits(stealNW_TQ_io_connVAS_1_data_qOutTask_bits),
    .io_connVAS_2_ctrl_serveStealReq_ready(stealNW_TQ_io_connVAS_2_ctrl_serveStealReq_ready),
    .io_connVAS_2_ctrl_serveStealReq_valid(stealNW_TQ_io_connVAS_2_ctrl_serveStealReq_valid),
    .io_connVAS_2_data_qOutTask_ready(stealNW_TQ_io_connVAS_2_data_qOutTask_ready),
    .io_connVAS_2_data_qOutTask_valid(stealNW_TQ_io_connVAS_2_data_qOutTask_valid),
    .io_connVAS_2_data_qOutTask_bits(stealNW_TQ_io_connVAS_2_data_qOutTask_bits),
    .io_connVAS_3_ctrl_serveStealReq_ready(stealNW_TQ_io_connVAS_3_ctrl_serveStealReq_ready),
    .io_connVAS_3_ctrl_serveStealReq_valid(stealNW_TQ_io_connVAS_3_ctrl_serveStealReq_valid),
    .io_connVAS_3_data_qOutTask_ready(stealNW_TQ_io_connVAS_3_data_qOutTask_ready),
    .io_connVAS_3_data_qOutTask_valid(stealNW_TQ_io_connVAS_3_data_qOutTask_valid),
    .io_connVAS_3_data_qOutTask_bits(stealNW_TQ_io_connVAS_3_data_qOutTask_bits),
    .io_ntwDataUnitOccupancyVSS_0(stealNW_TQ_io_ntwDataUnitOccupancyVSS_0)
  );
  virtualStealServer virtualStealServers_0 ( // @[stealSide.scala 63:75]
    .clock(virtualStealServers_0_clock),
    .reset(virtualStealServers_0_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_data_availableTask_ready(virtualStealServers_0_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(virtualStealServers_0_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(virtualStealServers_0_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(virtualStealServers_0_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(virtualStealServers_0_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(virtualStealServers_0_io_connNetwork_data_qOutTask_bits),
    .io_axi_mgmt_ARREADY(virtualStealServers_0_io_axi_mgmt_ARREADY),
    .io_axi_mgmt_ARVALID(virtualStealServers_0_io_axi_mgmt_ARVALID),
    .io_axi_mgmt_ARADDR(virtualStealServers_0_io_axi_mgmt_ARADDR),
    .io_axi_mgmt_RREADY(virtualStealServers_0_io_axi_mgmt_RREADY),
    .io_axi_mgmt_RVALID(virtualStealServers_0_io_axi_mgmt_RVALID),
    .io_axi_mgmt_RDATA(virtualStealServers_0_io_axi_mgmt_RDATA),
    .io_axi_mgmt_AWREADY(virtualStealServers_0_io_axi_mgmt_AWREADY),
    .io_axi_mgmt_AWVALID(virtualStealServers_0_io_axi_mgmt_AWVALID),
    .io_axi_mgmt_AWADDR(virtualStealServers_0_io_axi_mgmt_AWADDR),
    .io_axi_mgmt_WREADY(virtualStealServers_0_io_axi_mgmt_WREADY),
    .io_axi_mgmt_WVALID(virtualStealServers_0_io_axi_mgmt_WVALID),
    .io_axi_mgmt_WDATA(virtualStealServers_0_io_axi_mgmt_WDATA),
    .io_axi_mgmt_WSTRB(virtualStealServers_0_io_axi_mgmt_WSTRB),
    .io_axi_mgmt_BREADY(virtualStealServers_0_io_axi_mgmt_BREADY),
    .io_axi_mgmt_BVALID(virtualStealServers_0_io_axi_mgmt_BVALID),
    .io_read_address_ready(virtualStealServers_0_io_read_address_ready),
    .io_read_address_valid(virtualStealServers_0_io_read_address_valid),
    .io_read_address_bits(virtualStealServers_0_io_read_address_bits),
    .io_read_data_ready(virtualStealServers_0_io_read_data_ready),
    .io_read_data_valid(virtualStealServers_0_io_read_data_valid),
    .io_read_data_bits(virtualStealServers_0_io_read_data_bits),
    .io_read_burst_len(virtualStealServers_0_io_read_burst_len),
    .io_write_address_ready(virtualStealServers_0_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_0_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_0_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_0_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_0_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_0_io_write_data_bits),
    .io_write_burst_len(virtualStealServers_0_io_write_burst_len),
    .io_write_last(virtualStealServers_0_io_write_last),
    .io_ntwDataUnitOccupancy(virtualStealServers_0_io_ntwDataUnitOccupancy)
  );
  readyValidMem vssRvm_0 ( // @[stealSide.scala 87:68]
    .clock(vssRvm_0_clock),
    .reset(vssRvm_0_reset),
    .io_read_address_ready(vssRvm_0_io_read_address_ready),
    .io_read_address_valid(vssRvm_0_io_read_address_valid),
    .io_read_address_bits(vssRvm_0_io_read_address_bits),
    .io_read_data_ready(vssRvm_0_io_read_data_ready),
    .io_read_data_valid(vssRvm_0_io_read_data_valid),
    .io_read_data_bits(vssRvm_0_io_read_data_bits),
    .io_write_address_ready(vssRvm_0_io_write_address_ready),
    .io_write_address_valid(vssRvm_0_io_write_address_valid),
    .io_write_address_bits(vssRvm_0_io_write_address_bits),
    .io_write_data_ready(vssRvm_0_io_write_data_ready),
    .io_write_data_valid(vssRvm_0_io_write_data_valid),
    .io_write_data_bits(vssRvm_0_io_write_data_bits),
    .io_writeBurst_len(vssRvm_0_io_writeBurst_len),
    .io_writeBurst_last(vssRvm_0_io_writeBurst_last),
    .io_readBurst_len(vssRvm_0_io_readBurst_len),
    .axi_ARREADY(vssRvm_0_axi_ARREADY),
    .axi_ARVALID(vssRvm_0_axi_ARVALID),
    .axi_ARADDR(vssRvm_0_axi_ARADDR),
    .axi_ARLEN(vssRvm_0_axi_ARLEN),
    .axi_RREADY(vssRvm_0_axi_RREADY),
    .axi_RVALID(vssRvm_0_axi_RVALID),
    .axi_RDATA(vssRvm_0_axi_RDATA),
    .axi_AWREADY(vssRvm_0_axi_AWREADY),
    .axi_AWVALID(vssRvm_0_axi_AWVALID),
    .axi_AWADDR(vssRvm_0_axi_AWADDR),
    .axi_AWLEN(vssRvm_0_axi_AWLEN),
    .axi_WREADY(vssRvm_0_axi_WREADY),
    .axi_WVALID(vssRvm_0_axi_WVALID),
    .axi_WDATA(vssRvm_0_axi_WDATA),
    .axi_WLAST(vssRvm_0_axi_WLAST),
    .axi_BVALID(vssRvm_0_axi_BVALID)
  );
  assign io_axi_mgmt_vss_0_ARREADY = virtualStealServers_0_io_axi_mgmt_ARREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_RVALID = virtualStealServers_0_io_axi_mgmt_RVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_RDATA = virtualStealServers_0_io_axi_mgmt_RDATA; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_AWREADY = virtualStealServers_0_io_axi_mgmt_AWREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_WREADY = virtualStealServers_0_io_axi_mgmt_WREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_BVALID = virtualStealServers_0_io_axi_mgmt_BVALID; // @[stealSide.scala 83:28]
  assign io_vss_axi_full_0_ARVALID = vssRvm_0_axi_ARVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_ARADDR = vssRvm_0_axi_ARADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_ARLEN = vssRvm_0_axi_ARLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_RREADY = vssRvm_0_axi_RREADY; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_AWVALID = vssRvm_0_axi_AWVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_AWADDR = vssRvm_0_axi_AWADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_AWLEN = vssRvm_0_axi_AWLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_WVALID = vssRvm_0_axi_WVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_WDATA = vssRvm_0_axi_WDATA; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_WLAST = vssRvm_0_axi_WLAST; // @[stealSide.scala 98:47]
  assign io_taskOut_0_TVALID = stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_0_TDATA = stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 103:39]
  assign io_taskOut_1_TVALID = stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_1_TDATA = stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 103:39]
  assign io_taskOut_2_TVALID = stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_2_TDATA = stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 103:39]
  assign io_taskOut_3_TVALID = stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_3_TDATA = stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 103:39]
  assign connSyncSide_0_ctrl_serveStealReq_ready = stealNW_TQ_io_connVAS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 114:38]
  assign connSyncSide_0_data_qOutTask_ready = stealNW_TQ_io_connVAS_0_data_qOutTask_ready; // @[stealSide.scala 114:38]
  assign connSyncSide_1_ctrl_serveStealReq_ready = stealNW_TQ_io_connVAS_1_ctrl_serveStealReq_ready; // @[stealSide.scala 114:38]
  assign connSyncSide_1_data_qOutTask_ready = stealNW_TQ_io_connVAS_1_data_qOutTask_ready; // @[stealSide.scala 114:38]
  assign connSyncSide_2_ctrl_serveStealReq_ready = stealNW_TQ_io_connVAS_2_ctrl_serveStealReq_ready; // @[stealSide.scala 114:38]
  assign connSyncSide_2_data_qOutTask_ready = stealNW_TQ_io_connVAS_2_data_qOutTask_ready; // @[stealSide.scala 114:38]
  assign connSyncSide_3_ctrl_serveStealReq_ready = stealNW_TQ_io_connVAS_3_ctrl_serveStealReq_ready; // @[stealSide.scala 114:38]
  assign connSyncSide_3_data_qOutTask_ready = stealNW_TQ_io_connVAS_3_data_qOutTask_ready; // @[stealSide.scala 114:38]
  assign stealNW_TQ_clock = clock;
  assign stealNW_TQ_reset = reset;
  assign stealNW_TQ_io_connPE_0_pop_ready = io_taskOut_0_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connPE_1_pop_ready = io_taskOut_1_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connPE_2_pop_ready = io_taskOut_2_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connPE_3_pop_ready = io_taskOut_3_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid =
    virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_0_data_availableTask_ready =
    virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_valid = virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_bits = virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVAS_0_ctrl_serveStealReq_valid = connSyncSide_0_ctrl_serveStealReq_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_0_data_qOutTask_valid = connSyncSide_0_data_qOutTask_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_0_data_qOutTask_bits = connSyncSide_0_data_qOutTask_bits; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_1_ctrl_serveStealReq_valid = connSyncSide_1_ctrl_serveStealReq_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_1_data_qOutTask_valid = connSyncSide_1_data_qOutTask_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_1_data_qOutTask_bits = connSyncSide_1_data_qOutTask_bits; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_2_ctrl_serveStealReq_valid = connSyncSide_2_ctrl_serveStealReq_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_2_data_qOutTask_valid = connSyncSide_2_data_qOutTask_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_2_data_qOutTask_bits = connSyncSide_2_data_qOutTask_bits; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_3_ctrl_serveStealReq_valid = connSyncSide_3_ctrl_serveStealReq_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_3_data_qOutTask_valid = connSyncSide_3_data_qOutTask_valid; // @[stealSide.scala 114:38]
  assign stealNW_TQ_io_connVAS_3_data_qOutTask_bits = connSyncSide_3_data_qOutTask_bits; // @[stealSide.scala 114:38]
  assign virtualStealServers_0_clock = clock;
  assign virtualStealServers_0_reset = reset;
  assign virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_axi_mgmt_ARVALID = io_axi_mgmt_vss_0_ARVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_ARADDR = io_axi_mgmt_vss_0_ARADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_RREADY = io_axi_mgmt_vss_0_RREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_AWVALID = io_axi_mgmt_vss_0_AWVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_AWADDR = io_axi_mgmt_vss_0_AWADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_WVALID = io_axi_mgmt_vss_0_WVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_WDATA = io_axi_mgmt_vss_0_WDATA; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_WSTRB = io_axi_mgmt_vss_0_WSTRB; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_BREADY = io_axi_mgmt_vss_0_BREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_read_address_ready = vssRvm_0_io_read_address_ready; // @[stealSide.scala 91:47]
  assign virtualStealServers_0_io_read_data_valid = vssRvm_0_io_read_data_valid; // @[stealSide.scala 92:47]
  assign virtualStealServers_0_io_read_data_bits = vssRvm_0_io_read_data_bits; // @[stealSide.scala 92:47]
  assign virtualStealServers_0_io_write_address_ready = vssRvm_0_io_write_address_ready; // @[stealSide.scala 93:47]
  assign virtualStealServers_0_io_write_data_ready = vssRvm_0_io_write_data_ready; // @[stealSide.scala 94:47]
  assign virtualStealServers_0_io_ntwDataUnitOccupancy = stealNW_TQ_io_ntwDataUnitOccupancyVSS_0; // @[stealSide.scala 84:56]
  assign vssRvm_0_clock = clock;
  assign vssRvm_0_reset = reset;
  assign vssRvm_0_io_read_address_valid = virtualStealServers_0_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_0_io_read_address_bits = virtualStealServers_0_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_0_io_read_data_ready = virtualStealServers_0_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_0_io_write_address_valid = virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_0_io_write_address_bits = virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_0_io_write_data_valid = virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_0_io_write_data_bits = virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_0_io_writeBurst_len = virtualStealServers_0_io_write_burst_len; // @[stealSide.scala 96:47]
  assign vssRvm_0_io_writeBurst_last = virtualStealServers_0_io_write_last; // @[stealSide.scala 97:47]
  assign vssRvm_0_io_readBurst_len = virtualStealServers_0_io_read_burst_len; // @[stealSide.scala 95:47]
  assign vssRvm_0_axi_ARREADY = io_vss_axi_full_0_ARREADY; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_RVALID = io_vss_axi_full_0_RVALID; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_RDATA = io_vss_axi_full_0_RDATA; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_AWREADY = io_vss_axi_full_0_AWREADY; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_WREADY = io_vss_axi_full_0_WREADY; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_BVALID = io_vss_axi_full_0_BVALID; // @[stealSide.scala 98:47]
endmodule
module contAddrNtwUnit(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits,
  input         io_casAddressOut_ready,
  output        io_casAddressOut_valid,
  output [63:0] io_casAddressOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[contAddrNtwUnit.scala 22:30]
  reg [63:0] addressReg; // @[contAddrNtwUnit.scala 23:30]
  reg  priorityReg; // @[contAddrNtwUnit.scala 24:30]
  wire  _T = ~stateReg; // @[contAddrNtwUnit.scala 33:19]
  wire  _GEN_1 = io_addressIn_valid | stateReg; // @[contAddrNtwUnit.scala 34:33 36:24 22:30]
  wire  _GEN_2 = io_addressOut_ready | io_casAddressOut_ready ? 1'h0 : stateReg; // @[contAddrNtwUnit.scala 39:60 40:22 22:30]
  wire  _GEN_3 = io_addressOut_ready | io_casAddressOut_ready ? ~priorityReg : priorityReg; // @[contAddrNtwUnit.scala 39:60 41:25 24:30]
  wire  _GEN_4 = stateReg & _GEN_2; // @[contAddrNtwUnit.scala 38:44 44:18]
  wire  _GEN_5 = stateReg ? _GEN_3 : priorityReg; // @[contAddrNtwUnit.scala 24:30 38:44]
  wire  _GEN_8 = ~stateReg ? priorityReg : _GEN_5; // @[contAddrNtwUnit.scala 24:30 33:43]
  wire  _GEN_11 = priorityReg & io_casAddressOut_ready; // @[contAddrNtwUnit.scala 29:28 51:30]
  wire  _GEN_12 = priorityReg ? 1'h0 : io_addressOut_ready; // @[contAddrNtwUnit.scala 27:28 51:30]
  wire  _GEN_13 = io_casAddressOut_ready ? 1'h0 : io_addressOut_ready; // @[contAddrNtwUnit.scala 27:28 61:41]
  wire  _GEN_14 = io_addressOut_ready & io_casAddressOut_ready ? _GEN_11 : io_casAddressOut_ready; // @[contAddrNtwUnit.scala 50:60]
  wire  _GEN_15 = io_addressOut_ready & io_casAddressOut_ready ? _GEN_12 : _GEN_13; // @[contAddrNtwUnit.scala 50:60]
  wire  _GEN_16 = stateReg & _GEN_14; // @[contAddrNtwUnit.scala 29:28 49:44]
  wire  _GEN_17 = stateReg & _GEN_15; // @[contAddrNtwUnit.scala 27:28 49:44]
  assign io_addressIn_ready = ~stateReg; // @[contAddrNtwUnit.scala 47:19]
  assign io_addressOut_valid = _T ? 1'h0 : _GEN_17; // @[contAddrNtwUnit.scala 27:28 47:43]
  assign io_addressOut_bits = addressReg; // @[contAddrNtwUnit.scala 28:28]
  assign io_casAddressOut_valid = _T ? 1'h0 : _GEN_16; // @[contAddrNtwUnit.scala 29:28 47:43]
  assign io_casAddressOut_bits = addressReg; // @[contAddrNtwUnit.scala 30:28]
  always @(posedge clock) begin
    if (reset) begin // @[contAddrNtwUnit.scala 22:30]
      stateReg <= 1'h0; // @[contAddrNtwUnit.scala 22:30]
    end else if (~stateReg) begin // @[contAddrNtwUnit.scala 33:43]
      stateReg <= _GEN_1;
    end else begin
      stateReg <= _GEN_4;
    end
    if (reset) begin // @[contAddrNtwUnit.scala 23:30]
      addressReg <= 64'h0; // @[contAddrNtwUnit.scala 23:30]
    end else if (~stateReg) begin // @[contAddrNtwUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[contAddrNtwUnit.scala 34:33]
        addressReg <= io_addressIn_bits; // @[contAddrNtwUnit.scala 35:24]
      end
    end
    priorityReg <= reset | _GEN_8; // @[contAddrNtwUnit.scala 24:{30,30}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  addressReg = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  priorityReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module contAddrServer(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[contAddrServer.scala 21:27]
  reg [63:0] addressReg; // @[contAddrServer.scala 22:29]
  wire  _T = ~stateReg; // @[contAddrServer.scala 28:19]
  wire  _GEN_0 = io_addressIn_valid | stateReg; // @[contAddrServer.scala 29:33 30:24 21:27]
  wire  _GEN_2 = io_addressOut_ready ? 1'h0 : stateReg; // @[contAddrServer.scala 34:34 35:24 21:27]
  wire  _GEN_3 = stateReg & _GEN_2; // @[contAddrServer.scala 33:53 38:18]
  assign io_addressIn_ready = ~stateReg; // @[contAddrServer.scala 41:19]
  assign io_addressOut_valid = _T ? 1'h0 : stateReg; // @[contAddrServer.scala 25:25 41:43]
  assign io_addressOut_bits = addressReg; // @[contAddrServer.scala 24:25]
  always @(posedge clock) begin
    if (reset) begin // @[contAddrServer.scala 21:27]
      stateReg <= 1'h0; // @[contAddrServer.scala 21:27]
    end else if (~stateReg) begin // @[contAddrServer.scala 28:43]
      stateReg <= _GEN_0;
    end else begin
      stateReg <= _GEN_3;
    end
    if (reset) begin // @[contAddrServer.scala 22:29]
      addressReg <= 64'h0; // @[contAddrServer.scala 22:29]
    end else if (~stateReg) begin // @[contAddrServer.scala 28:43]
      if (io_addressIn_valid) begin // @[contAddrServer.scala 29:33]
        addressReg <= io_addressIn_bits; // @[contAddrServer.scala 31:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  addressReg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_4(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:7]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [2:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [2:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [2:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [2:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [2:0] _value_T_1 = enq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  wire [2:0] _value_T_3 = deq_ptr_value + 3'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 3'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 8; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[2:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[2:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module contQueue(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits
);
  wire  q_clock; // @[contQueue.scala 13:19]
  wire  q_reset; // @[contQueue.scala 13:19]
  wire  q_io_enq_ready; // @[contQueue.scala 13:19]
  wire  q_io_enq_valid; // @[contQueue.scala 13:19]
  wire [63:0] q_io_enq_bits; // @[contQueue.scala 13:19]
  wire  q_io_deq_ready; // @[contQueue.scala 13:19]
  wire  q_io_deq_valid; // @[contQueue.scala 13:19]
  wire [63:0] q_io_deq_bits; // @[contQueue.scala 13:19]
  Queue_4 q ( // @[contQueue.scala 13:19]
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits(q_io_enq_bits),
    .io_deq_ready(q_io_deq_ready),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits(q_io_deq_bits)
  );
  assign io_addressIn_ready = q_io_enq_ready; // @[contQueue.scala 15:14]
  assign io_addressOut_valid = q_io_deq_valid; // @[contQueue.scala 16:19]
  assign io_addressOut_bits = q_io_deq_bits; // @[contQueue.scala 16:19]
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = io_addressIn_valid; // @[contQueue.scala 15:14]
  assign q_io_enq_bits = io_addressIn_bits; // @[contQueue.scala 15:14]
  assign q_io_deq_ready = io_addressOut_ready; // @[contQueue.scala 16:19]
endmodule
module contNetwork(
  input         clock,
  input         reset,
  output        io_connVCAS_ready,
  input         io_connVCAS_valid,
  input  [63:0] io_connVCAS_bits,
  input         io_connPE_0_ready,
  output        io_connPE_0_valid,
  output [63:0] io_connPE_0_bits,
  input         io_connPE_1_ready,
  output        io_connPE_1_valid,
  output [63:0] io_connPE_1_bits,
  input         io_connPE_2_ready,
  output        io_connPE_2_valid,
  output [63:0] io_connPE_2_bits,
  input         io_connPE_3_ready,
  output        io_connPE_3_valid,
  output [63:0] io_connPE_3_bits
);
  wire  networkUnits_0_clock; // @[contNetwork.scala 15:49]
  wire  networkUnits_0_reset; // @[contNetwork.scala 15:49]
  wire  networkUnits_0_io_addressIn_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_0_io_addressIn_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_0_io_addressIn_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_0_io_addressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_0_io_addressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_0_io_addressOut_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_0_io_casAddressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_0_io_casAddressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_0_io_casAddressOut_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_clock; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_reset; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_io_addressIn_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_io_addressIn_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_1_io_addressIn_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_io_addressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_io_addressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_1_io_addressOut_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_io_casAddressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_1_io_casAddressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_1_io_casAddressOut_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_clock; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_reset; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_io_addressIn_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_io_addressIn_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_2_io_addressIn_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_io_addressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_io_addressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_2_io_addressOut_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_io_casAddressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_2_io_casAddressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_2_io_casAddressOut_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_clock; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_reset; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_io_addressIn_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_io_addressIn_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_3_io_addressIn_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_io_addressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_io_addressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_3_io_addressOut_bits; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_io_casAddressOut_ready; // @[contNetwork.scala 15:49]
  wire  networkUnits_3_io_casAddressOut_valid; // @[contNetwork.scala 15:49]
  wire [63:0] networkUnits_3_io_casAddressOut_bits; // @[contNetwork.scala 15:49]
  wire  casServers_0_clock; // @[contNetwork.scala 16:49]
  wire  casServers_0_reset; // @[contNetwork.scala 16:49]
  wire  casServers_0_io_addressIn_ready; // @[contNetwork.scala 16:49]
  wire  casServers_0_io_addressIn_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_0_io_addressIn_bits; // @[contNetwork.scala 16:49]
  wire  casServers_0_io_addressOut_ready; // @[contNetwork.scala 16:49]
  wire  casServers_0_io_addressOut_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_0_io_addressOut_bits; // @[contNetwork.scala 16:49]
  wire  casServers_1_clock; // @[contNetwork.scala 16:49]
  wire  casServers_1_reset; // @[contNetwork.scala 16:49]
  wire  casServers_1_io_addressIn_ready; // @[contNetwork.scala 16:49]
  wire  casServers_1_io_addressIn_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_1_io_addressIn_bits; // @[contNetwork.scala 16:49]
  wire  casServers_1_io_addressOut_ready; // @[contNetwork.scala 16:49]
  wire  casServers_1_io_addressOut_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_1_io_addressOut_bits; // @[contNetwork.scala 16:49]
  wire  casServers_2_clock; // @[contNetwork.scala 16:49]
  wire  casServers_2_reset; // @[contNetwork.scala 16:49]
  wire  casServers_2_io_addressIn_ready; // @[contNetwork.scala 16:49]
  wire  casServers_2_io_addressIn_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_2_io_addressIn_bits; // @[contNetwork.scala 16:49]
  wire  casServers_2_io_addressOut_ready; // @[contNetwork.scala 16:49]
  wire  casServers_2_io_addressOut_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_2_io_addressOut_bits; // @[contNetwork.scala 16:49]
  wire  casServers_3_clock; // @[contNetwork.scala 16:49]
  wire  casServers_3_reset; // @[contNetwork.scala 16:49]
  wire  casServers_3_io_addressIn_ready; // @[contNetwork.scala 16:49]
  wire  casServers_3_io_addressIn_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_3_io_addressIn_bits; // @[contNetwork.scala 16:49]
  wire  casServers_3_io_addressOut_ready; // @[contNetwork.scala 16:49]
  wire  casServers_3_io_addressOut_valid; // @[contNetwork.scala 16:49]
  wire [63:0] casServers_3_io_addressOut_bits; // @[contNetwork.scala 16:49]
  wire  queues_0_clock; // @[contNetwork.scala 17:49]
  wire  queues_0_reset; // @[contNetwork.scala 17:49]
  wire  queues_0_io_addressIn_ready; // @[contNetwork.scala 17:49]
  wire  queues_0_io_addressIn_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_0_io_addressIn_bits; // @[contNetwork.scala 17:49]
  wire  queues_0_io_addressOut_ready; // @[contNetwork.scala 17:49]
  wire  queues_0_io_addressOut_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_0_io_addressOut_bits; // @[contNetwork.scala 17:49]
  wire  queues_1_clock; // @[contNetwork.scala 17:49]
  wire  queues_1_reset; // @[contNetwork.scala 17:49]
  wire  queues_1_io_addressIn_ready; // @[contNetwork.scala 17:49]
  wire  queues_1_io_addressIn_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_1_io_addressIn_bits; // @[contNetwork.scala 17:49]
  wire  queues_1_io_addressOut_ready; // @[contNetwork.scala 17:49]
  wire  queues_1_io_addressOut_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_1_io_addressOut_bits; // @[contNetwork.scala 17:49]
  wire  queues_2_clock; // @[contNetwork.scala 17:49]
  wire  queues_2_reset; // @[contNetwork.scala 17:49]
  wire  queues_2_io_addressIn_ready; // @[contNetwork.scala 17:49]
  wire  queues_2_io_addressIn_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_2_io_addressIn_bits; // @[contNetwork.scala 17:49]
  wire  queues_2_io_addressOut_ready; // @[contNetwork.scala 17:49]
  wire  queues_2_io_addressOut_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_2_io_addressOut_bits; // @[contNetwork.scala 17:49]
  wire  queues_3_clock; // @[contNetwork.scala 17:49]
  wire  queues_3_reset; // @[contNetwork.scala 17:49]
  wire  queues_3_io_addressIn_ready; // @[contNetwork.scala 17:49]
  wire  queues_3_io_addressIn_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_3_io_addressIn_bits; // @[contNetwork.scala 17:49]
  wire  queues_3_io_addressOut_ready; // @[contNetwork.scala 17:49]
  wire  queues_3_io_addressOut_valid; // @[contNetwork.scala 17:49]
  wire [63:0] queues_3_io_addressOut_bits; // @[contNetwork.scala 17:49]
  contAddrNtwUnit networkUnits_0 ( // @[contNetwork.scala 15:49]
    .clock(networkUnits_0_clock),
    .reset(networkUnits_0_reset),
    .io_addressIn_ready(networkUnits_0_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_0_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_0_io_addressIn_bits),
    .io_addressOut_ready(networkUnits_0_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_0_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_0_io_addressOut_bits),
    .io_casAddressOut_ready(networkUnits_0_io_casAddressOut_ready),
    .io_casAddressOut_valid(networkUnits_0_io_casAddressOut_valid),
    .io_casAddressOut_bits(networkUnits_0_io_casAddressOut_bits)
  );
  contAddrNtwUnit networkUnits_1 ( // @[contNetwork.scala 15:49]
    .clock(networkUnits_1_clock),
    .reset(networkUnits_1_reset),
    .io_addressIn_ready(networkUnits_1_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_1_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_1_io_addressIn_bits),
    .io_addressOut_ready(networkUnits_1_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_1_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_1_io_addressOut_bits),
    .io_casAddressOut_ready(networkUnits_1_io_casAddressOut_ready),
    .io_casAddressOut_valid(networkUnits_1_io_casAddressOut_valid),
    .io_casAddressOut_bits(networkUnits_1_io_casAddressOut_bits)
  );
  contAddrNtwUnit networkUnits_2 ( // @[contNetwork.scala 15:49]
    .clock(networkUnits_2_clock),
    .reset(networkUnits_2_reset),
    .io_addressIn_ready(networkUnits_2_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_2_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_2_io_addressIn_bits),
    .io_addressOut_ready(networkUnits_2_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_2_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_2_io_addressOut_bits),
    .io_casAddressOut_ready(networkUnits_2_io_casAddressOut_ready),
    .io_casAddressOut_valid(networkUnits_2_io_casAddressOut_valid),
    .io_casAddressOut_bits(networkUnits_2_io_casAddressOut_bits)
  );
  contAddrNtwUnit networkUnits_3 ( // @[contNetwork.scala 15:49]
    .clock(networkUnits_3_clock),
    .reset(networkUnits_3_reset),
    .io_addressIn_ready(networkUnits_3_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_3_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_3_io_addressIn_bits),
    .io_addressOut_ready(networkUnits_3_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_3_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_3_io_addressOut_bits),
    .io_casAddressOut_ready(networkUnits_3_io_casAddressOut_ready),
    .io_casAddressOut_valid(networkUnits_3_io_casAddressOut_valid),
    .io_casAddressOut_bits(networkUnits_3_io_casAddressOut_bits)
  );
  contAddrServer casServers_0 ( // @[contNetwork.scala 16:49]
    .clock(casServers_0_clock),
    .reset(casServers_0_reset),
    .io_addressIn_ready(casServers_0_io_addressIn_ready),
    .io_addressIn_valid(casServers_0_io_addressIn_valid),
    .io_addressIn_bits(casServers_0_io_addressIn_bits),
    .io_addressOut_ready(casServers_0_io_addressOut_ready),
    .io_addressOut_valid(casServers_0_io_addressOut_valid),
    .io_addressOut_bits(casServers_0_io_addressOut_bits)
  );
  contAddrServer casServers_1 ( // @[contNetwork.scala 16:49]
    .clock(casServers_1_clock),
    .reset(casServers_1_reset),
    .io_addressIn_ready(casServers_1_io_addressIn_ready),
    .io_addressIn_valid(casServers_1_io_addressIn_valid),
    .io_addressIn_bits(casServers_1_io_addressIn_bits),
    .io_addressOut_ready(casServers_1_io_addressOut_ready),
    .io_addressOut_valid(casServers_1_io_addressOut_valid),
    .io_addressOut_bits(casServers_1_io_addressOut_bits)
  );
  contAddrServer casServers_2 ( // @[contNetwork.scala 16:49]
    .clock(casServers_2_clock),
    .reset(casServers_2_reset),
    .io_addressIn_ready(casServers_2_io_addressIn_ready),
    .io_addressIn_valid(casServers_2_io_addressIn_valid),
    .io_addressIn_bits(casServers_2_io_addressIn_bits),
    .io_addressOut_ready(casServers_2_io_addressOut_ready),
    .io_addressOut_valid(casServers_2_io_addressOut_valid),
    .io_addressOut_bits(casServers_2_io_addressOut_bits)
  );
  contAddrServer casServers_3 ( // @[contNetwork.scala 16:49]
    .clock(casServers_3_clock),
    .reset(casServers_3_reset),
    .io_addressIn_ready(casServers_3_io_addressIn_ready),
    .io_addressIn_valid(casServers_3_io_addressIn_valid),
    .io_addressIn_bits(casServers_3_io_addressIn_bits),
    .io_addressOut_ready(casServers_3_io_addressOut_ready),
    .io_addressOut_valid(casServers_3_io_addressOut_valid),
    .io_addressOut_bits(casServers_3_io_addressOut_bits)
  );
  contQueue queues_0 ( // @[contNetwork.scala 17:49]
    .clock(queues_0_clock),
    .reset(queues_0_reset),
    .io_addressIn_ready(queues_0_io_addressIn_ready),
    .io_addressIn_valid(queues_0_io_addressIn_valid),
    .io_addressIn_bits(queues_0_io_addressIn_bits),
    .io_addressOut_ready(queues_0_io_addressOut_ready),
    .io_addressOut_valid(queues_0_io_addressOut_valid),
    .io_addressOut_bits(queues_0_io_addressOut_bits)
  );
  contQueue queues_1 ( // @[contNetwork.scala 17:49]
    .clock(queues_1_clock),
    .reset(queues_1_reset),
    .io_addressIn_ready(queues_1_io_addressIn_ready),
    .io_addressIn_valid(queues_1_io_addressIn_valid),
    .io_addressIn_bits(queues_1_io_addressIn_bits),
    .io_addressOut_ready(queues_1_io_addressOut_ready),
    .io_addressOut_valid(queues_1_io_addressOut_valid),
    .io_addressOut_bits(queues_1_io_addressOut_bits)
  );
  contQueue queues_2 ( // @[contNetwork.scala 17:49]
    .clock(queues_2_clock),
    .reset(queues_2_reset),
    .io_addressIn_ready(queues_2_io_addressIn_ready),
    .io_addressIn_valid(queues_2_io_addressIn_valid),
    .io_addressIn_bits(queues_2_io_addressIn_bits),
    .io_addressOut_ready(queues_2_io_addressOut_ready),
    .io_addressOut_valid(queues_2_io_addressOut_valid),
    .io_addressOut_bits(queues_2_io_addressOut_bits)
  );
  contQueue queues_3 ( // @[contNetwork.scala 17:49]
    .clock(queues_3_clock),
    .reset(queues_3_reset),
    .io_addressIn_ready(queues_3_io_addressIn_ready),
    .io_addressIn_valid(queues_3_io_addressIn_valid),
    .io_addressIn_bits(queues_3_io_addressIn_bits),
    .io_addressOut_ready(queues_3_io_addressOut_ready),
    .io_addressOut_valid(queues_3_io_addressOut_valid),
    .io_addressOut_bits(queues_3_io_addressOut_bits)
  );
  assign io_connVCAS_ready = networkUnits_0_io_addressIn_ready; // @[contNetwork.scala 19:17]
  assign io_connPE_0_valid = queues_0_io_addressOut_valid; // @[contNetwork.scala 29:42]
  assign io_connPE_0_bits = queues_0_io_addressOut_bits; // @[contNetwork.scala 29:42]
  assign io_connPE_1_valid = queues_1_io_addressOut_valid; // @[contNetwork.scala 29:42]
  assign io_connPE_1_bits = queues_1_io_addressOut_bits; // @[contNetwork.scala 29:42]
  assign io_connPE_2_valid = queues_2_io_addressOut_valid; // @[contNetwork.scala 29:42]
  assign io_connPE_2_bits = queues_2_io_addressOut_bits; // @[contNetwork.scala 29:42]
  assign io_connPE_3_valid = queues_3_io_addressOut_valid; // @[contNetwork.scala 29:42]
  assign io_connPE_3_bits = queues_3_io_addressOut_bits; // @[contNetwork.scala 29:42]
  assign networkUnits_0_clock = clock;
  assign networkUnits_0_reset = reset;
  assign networkUnits_0_io_addressIn_valid = io_connVCAS_valid; // @[contNetwork.scala 19:17]
  assign networkUnits_0_io_addressIn_bits = io_connVCAS_bits; // @[contNetwork.scala 19:17]
  assign networkUnits_0_io_addressOut_ready = networkUnits_1_io_addressIn_ready; // @[contNetwork.scala 23:39]
  assign networkUnits_0_io_casAddressOut_ready = casServers_0_io_addressIn_ready; // @[contNetwork.scala 27:42]
  assign networkUnits_1_clock = clock;
  assign networkUnits_1_reset = reset;
  assign networkUnits_1_io_addressIn_valid = networkUnits_0_io_addressOut_valid; // @[contNetwork.scala 23:39]
  assign networkUnits_1_io_addressIn_bits = networkUnits_0_io_addressOut_bits; // @[contNetwork.scala 23:39]
  assign networkUnits_1_io_addressOut_ready = networkUnits_2_io_addressIn_ready; // @[contNetwork.scala 23:39]
  assign networkUnits_1_io_casAddressOut_ready = casServers_1_io_addressIn_ready; // @[contNetwork.scala 27:42]
  assign networkUnits_2_clock = clock;
  assign networkUnits_2_reset = reset;
  assign networkUnits_2_io_addressIn_valid = networkUnits_1_io_addressOut_valid; // @[contNetwork.scala 23:39]
  assign networkUnits_2_io_addressIn_bits = networkUnits_1_io_addressOut_bits; // @[contNetwork.scala 23:39]
  assign networkUnits_2_io_addressOut_ready = networkUnits_3_io_addressIn_ready; // @[contNetwork.scala 23:39]
  assign networkUnits_2_io_casAddressOut_ready = casServers_2_io_addressIn_ready; // @[contNetwork.scala 27:42]
  assign networkUnits_3_clock = clock;
  assign networkUnits_3_reset = reset;
  assign networkUnits_3_io_addressIn_valid = networkUnits_2_io_addressOut_valid; // @[contNetwork.scala 23:39]
  assign networkUnits_3_io_addressIn_bits = networkUnits_2_io_addressOut_bits; // @[contNetwork.scala 23:39]
  assign networkUnits_3_io_addressOut_ready = 1'h0; // @[contNetwork.scala 20:49]
  assign networkUnits_3_io_casAddressOut_ready = casServers_3_io_addressIn_ready; // @[contNetwork.scala 27:42]
  assign casServers_0_clock = clock;
  assign casServers_0_reset = reset;
  assign casServers_0_io_addressIn_valid = networkUnits_0_io_casAddressOut_valid; // @[contNetwork.scala 27:42]
  assign casServers_0_io_addressIn_bits = networkUnits_0_io_casAddressOut_bits; // @[contNetwork.scala 27:42]
  assign casServers_0_io_addressOut_ready = queues_0_io_addressIn_ready; // @[contNetwork.scala 28:42]
  assign casServers_1_clock = clock;
  assign casServers_1_reset = reset;
  assign casServers_1_io_addressIn_valid = networkUnits_1_io_casAddressOut_valid; // @[contNetwork.scala 27:42]
  assign casServers_1_io_addressIn_bits = networkUnits_1_io_casAddressOut_bits; // @[contNetwork.scala 27:42]
  assign casServers_1_io_addressOut_ready = queues_1_io_addressIn_ready; // @[contNetwork.scala 28:42]
  assign casServers_2_clock = clock;
  assign casServers_2_reset = reset;
  assign casServers_2_io_addressIn_valid = networkUnits_2_io_casAddressOut_valid; // @[contNetwork.scala 27:42]
  assign casServers_2_io_addressIn_bits = networkUnits_2_io_casAddressOut_bits; // @[contNetwork.scala 27:42]
  assign casServers_2_io_addressOut_ready = queues_2_io_addressIn_ready; // @[contNetwork.scala 28:42]
  assign casServers_3_clock = clock;
  assign casServers_3_reset = reset;
  assign casServers_3_io_addressIn_valid = networkUnits_3_io_casAddressOut_valid; // @[contNetwork.scala 27:42]
  assign casServers_3_io_addressIn_bits = networkUnits_3_io_casAddressOut_bits; // @[contNetwork.scala 27:42]
  assign casServers_3_io_addressOut_ready = queues_3_io_addressIn_ready; // @[contNetwork.scala 28:42]
  assign queues_0_clock = clock;
  assign queues_0_reset = reset;
  assign queues_0_io_addressIn_valid = casServers_0_io_addressOut_valid; // @[contNetwork.scala 28:42]
  assign queues_0_io_addressIn_bits = casServers_0_io_addressOut_bits; // @[contNetwork.scala 28:42]
  assign queues_0_io_addressOut_ready = io_connPE_0_ready; // @[contNetwork.scala 29:42]
  assign queues_1_clock = clock;
  assign queues_1_reset = reset;
  assign queues_1_io_addressIn_valid = casServers_1_io_addressOut_valid; // @[contNetwork.scala 28:42]
  assign queues_1_io_addressIn_bits = casServers_1_io_addressOut_bits; // @[contNetwork.scala 28:42]
  assign queues_1_io_addressOut_ready = io_connPE_1_ready; // @[contNetwork.scala 29:42]
  assign queues_2_clock = clock;
  assign queues_2_reset = reset;
  assign queues_2_io_addressIn_valid = casServers_2_io_addressOut_valid; // @[contNetwork.scala 28:42]
  assign queues_2_io_addressIn_bits = casServers_2_io_addressOut_bits; // @[contNetwork.scala 28:42]
  assign queues_2_io_addressOut_ready = io_connPE_2_ready; // @[contNetwork.scala 29:42]
  assign queues_3_clock = clock;
  assign queues_3_reset = reset;
  assign queues_3_io_addressIn_valid = casServers_3_io_addressOut_valid; // @[contNetwork.scala 28:42]
  assign queues_3_io_addressIn_bits = casServers_3_io_addressOut_bits; // @[contNetwork.scala 28:42]
  assign queues_3_io_addressOut_ready = io_connPE_3_ready; // @[contNetwork.scala 29:42]
endmodule
module virtContAddrServer(
  input         clock,
  input         reset,
  input         io_dataOut_ready,
  output        io_dataOut_valid,
  output [63:0] io_dataOut_bits,
  output        io_axi_mgmt_ARREADY,
  input         io_axi_mgmt_ARVALID,
  input  [5:0]  io_axi_mgmt_ARADDR,
  input         io_axi_mgmt_RREADY,
  output        io_axi_mgmt_RVALID,
  output [63:0] io_axi_mgmt_RDATA,
  output        io_axi_mgmt_AWREADY,
  input         io_axi_mgmt_AWVALID,
  input  [5:0]  io_axi_mgmt_AWADDR,
  output        io_axi_mgmt_WREADY,
  input         io_axi_mgmt_WVALID,
  input  [63:0] io_axi_mgmt_WDATA,
  input  [7:0]  io_axi_mgmt_WSTRB,
  input         io_axi_mgmt_BREADY,
  output        io_axi_mgmt_BVALID,
  input         io_read_address_ready,
  output        io_read_address_valid,
  output [63:0] io_read_address_bits,
  output        io_read_data_ready,
  input         io_read_data_valid,
  input  [63:0] io_read_data_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [63:0] _RAND_11;
  reg [63:0] _RAND_12;
  reg [63:0] _RAND_13;
  reg [63:0] _RAND_14;
  reg [63:0] _RAND_15;
  reg [63:0] _RAND_16;
  reg [63:0] _RAND_17;
  reg [63:0] _RAND_18;
  reg [63:0] _RAND_19;
  reg [31:0] _RAND_20;
`endif // RANDOMIZE_REG_INIT
  wire  rdReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] rdReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] wrReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_clock; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_reset; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] wrReqData__deq_io_enq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] wrReqData__deq_io_enq_bits_strb; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 377:21]
  wire  rdReq__valid = rdReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  rdReq = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  wire [5:0] rdReq__bits_addr = rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] rdAddr = rdReq__bits_addr & 6'h38; // @[RegisterBlock.scala 214:48]
  wire  wrReq__valid = wrReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReqData__valid = wrReqData__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReq = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  wire [5:0] wrReq__bits_addr = wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] wrAddr = wrReq__bits_addr & 6'h38; // @[RegisterBlock.scala 243:48]
  reg [63:0] rAddr; // @[virtContAddrServer.scala 37:49]
  reg [63:0] rPause; // @[virtContAddrServer.scala 38:49]
  reg [63:0] avaialbleSize; // @[virtContAddrServer.scala 39:49]
  reg [2:0] stateReg; // @[virtContAddrServer.scala 40:49]
  wire [63:0] index = avaialbleSize - 64'h10; // @[virtContAddrServer.scala 42:56]
  reg [63:0] continuationsRegisters_0; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_1; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_2; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_3; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_4; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_5; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_6; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_7; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_8; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_9; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_10; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_11; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_12; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_13; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_14; // @[virtContAddrServer.scala 43:49]
  reg [63:0] continuationsRegisters_15; // @[virtContAddrServer.scala 43:49]
  reg [3:0] burstCounter; // @[virtContAddrServer.scala 44:49]
  wire [63:0] _GEN_1 = avaialbleSize >= 64'h10 ? rPause : 64'hffffffffffffffff; // @[virtContAddrServer.scala 38:49 52:52 56:22]
  wire  _T_2 = stateReg == 3'h1; // @[virtContAddrServer.scala 58:25]
  wire  _T_3 = stateReg == 3'h2; // @[virtContAddrServer.scala 63:25]
  wire [63:0] _GEN_4 = 4'h0 == burstCounter ? io_read_data_bits : continuationsRegisters_0; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_5 = 4'h1 == burstCounter ? io_read_data_bits : continuationsRegisters_1; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_6 = 4'h2 == burstCounter ? io_read_data_bits : continuationsRegisters_2; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_7 = 4'h3 == burstCounter ? io_read_data_bits : continuationsRegisters_3; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_8 = 4'h4 == burstCounter ? io_read_data_bits : continuationsRegisters_4; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_9 = 4'h5 == burstCounter ? io_read_data_bits : continuationsRegisters_5; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_10 = 4'h6 == burstCounter ? io_read_data_bits : continuationsRegisters_6; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_11 = 4'h7 == burstCounter ? io_read_data_bits : continuationsRegisters_7; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_12 = 4'h8 == burstCounter ? io_read_data_bits : continuationsRegisters_8; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_13 = 4'h9 == burstCounter ? io_read_data_bits : continuationsRegisters_9; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_14 = 4'ha == burstCounter ? io_read_data_bits : continuationsRegisters_10; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_15 = 4'hb == burstCounter ? io_read_data_bits : continuationsRegisters_11; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_16 = 4'hc == burstCounter ? io_read_data_bits : continuationsRegisters_12; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_17 = 4'hd == burstCounter ? io_read_data_bits : continuationsRegisters_13; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_18 = 4'he == burstCounter ? io_read_data_bits : continuationsRegisters_14; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [63:0] _GEN_19 = 4'hf == burstCounter ? io_read_data_bits : continuationsRegisters_15; // @[virtContAddrServer.scala 43:49 65:{50,50}]
  wire [3:0] _burstCounter_T_1 = burstCounter - 4'h1; // @[virtContAddrServer.scala 66:66]
  wire [63:0] _avaialbleSize_T_1 = avaialbleSize - 64'h1; // @[virtContAddrServer.scala 67:44]
  wire [63:0] _GEN_20 = io_read_data_valid ? _GEN_4 : continuationsRegisters_0; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_21 = io_read_data_valid ? _GEN_5 : continuationsRegisters_1; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_22 = io_read_data_valid ? _GEN_6 : continuationsRegisters_2; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_23 = io_read_data_valid ? _GEN_7 : continuationsRegisters_3; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_24 = io_read_data_valid ? _GEN_8 : continuationsRegisters_4; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_25 = io_read_data_valid ? _GEN_9 : continuationsRegisters_5; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_26 = io_read_data_valid ? _GEN_10 : continuationsRegisters_6; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_27 = io_read_data_valid ? _GEN_11 : continuationsRegisters_7; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_28 = io_read_data_valid ? _GEN_12 : continuationsRegisters_8; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_29 = io_read_data_valid ? _GEN_13 : continuationsRegisters_9; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_30 = io_read_data_valid ? _GEN_14 : continuationsRegisters_10; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_31 = io_read_data_valid ? _GEN_15 : continuationsRegisters_11; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_32 = io_read_data_valid ? _GEN_16 : continuationsRegisters_12; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_33 = io_read_data_valid ? _GEN_17 : continuationsRegisters_13; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_34 = io_read_data_valid ? _GEN_18 : continuationsRegisters_14; // @[virtContAddrServer.scala 64:33 43:49]
  wire [63:0] _GEN_35 = io_read_data_valid ? _GEN_19 : continuationsRegisters_15; // @[virtContAddrServer.scala 64:33 43:49]
  wire [3:0] _GEN_36 = io_read_data_valid ? _burstCounter_T_1 : burstCounter; // @[virtContAddrServer.scala 64:33 44:49 66:50]
  wire [63:0] _GEN_37 = io_read_data_valid ? _avaialbleSize_T_1 : avaialbleSize; // @[virtContAddrServer.scala 64:33 67:27 39:49]
  wire  _T_4 = burstCounter == 4'h0; // @[virtContAddrServer.scala 70:27]
  wire [2:0] _GEN_38 = burstCounter == 4'h0 & io_read_data_valid ? 3'h3 : stateReg; // @[virtContAddrServer.scala 70:57 71:27 40:49]
  wire [63:0] _GEN_39 = burstCounter == 4'h0 & io_read_data_valid ? index : _GEN_37; // @[virtContAddrServer.scala 70:57 72:27]
  wire [3:0] _GEN_40 = burstCounter == 4'h0 & io_read_data_valid ? 4'hf : _GEN_36; // @[virtContAddrServer.scala 70:57 73:27]
  wire  _T_6 = stateReg == 3'h3; // @[virtContAddrServer.scala 76:25]
  wire [3:0] _GEN_41 = io_dataOut_ready ? _burstCounter_T_1 : burstCounter; // @[virtContAddrServer.scala 77:31 78:26 44:49]
  wire [2:0] _GEN_42 = _T_4 & io_dataOut_ready ? 3'h0 : stateReg; // @[virtContAddrServer.scala 80:55 81:22 40:49]
  wire [2:0] _GEN_43 = rPause == 64'h0 ? 3'h0 : stateReg; // @[virtContAddrServer.scala 85:33 86:22 40:49]
  wire [2:0] _GEN_44 = stateReg == 3'h4 ? _GEN_43 : stateReg; // @[virtContAddrServer.scala 84:46 40:49]
  wire [3:0] _GEN_45 = stateReg == 3'h3 ? _GEN_41 : burstCounter; // @[virtContAddrServer.scala 76:44 44:49]
  wire [2:0] _GEN_46 = stateReg == 3'h3 ? _GEN_42 : _GEN_44; // @[virtContAddrServer.scala 76:44]
  wire [63:0] _GEN_64 = stateReg == 3'h2 ? _GEN_39 : avaialbleSize; // @[virtContAddrServer.scala 63:44 39:49]
  wire [63:0] _GEN_84 = stateReg == 3'h1 ? avaialbleSize : _GEN_64; // @[virtContAddrServer.scala 39:49 58:54]
  wire [63:0] _GEN_86 = stateReg == 3'h0 ? _GEN_1 : rPause; // @[virtContAddrServer.scala 51:34 38:49]
  wire [63:0] _GEN_104 = stateReg == 3'h0 ? avaialbleSize : _GEN_84; // @[virtContAddrServer.scala 51:34 39:49]
  wire  _GEN_107 = _T_3 ? 1'h0 : _T_6; // @[virtContAddrServer.scala 92:27 98:44]
  wire [66:0] _io_read_address_bits_T = {index, 3'h0}; // @[virtContAddrServer.scala 105:45]
  wire [66:0] _GEN_141 = {{3'd0}, rAddr}; // @[virtContAddrServer.scala 105:36]
  wire [66:0] _io_read_address_bits_T_2 = _GEN_141 + _io_read_address_bits_T; // @[virtContAddrServer.scala 105:36]
  wire [63:0] _GEN_112 = 4'h1 == burstCounter ? continuationsRegisters_1 : continuationsRegisters_0; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_113 = 4'h2 == burstCounter ? continuationsRegisters_2 : _GEN_112; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_114 = 4'h3 == burstCounter ? continuationsRegisters_3 : _GEN_113; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_115 = 4'h4 == burstCounter ? continuationsRegisters_4 : _GEN_114; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_116 = 4'h5 == burstCounter ? continuationsRegisters_5 : _GEN_115; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_117 = 4'h6 == burstCounter ? continuationsRegisters_6 : _GEN_116; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_118 = 4'h7 == burstCounter ? continuationsRegisters_7 : _GEN_117; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_119 = 4'h8 == burstCounter ? continuationsRegisters_8 : _GEN_118; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_120 = 4'h9 == burstCounter ? continuationsRegisters_9 : _GEN_119; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_121 = 4'ha == burstCounter ? continuationsRegisters_10 : _GEN_120; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_122 = 4'hb == burstCounter ? continuationsRegisters_11 : _GEN_121; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_123 = 4'hc == burstCounter ? continuationsRegisters_12 : _GEN_122; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_124 = 4'hd == burstCounter ? continuationsRegisters_13 : _GEN_123; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_125 = 4'he == burstCounter ? continuationsRegisters_14 : _GEN_124; // @[virtContAddrServer.scala 106:{27,27}]
  wire [63:0] _GEN_127 = 6'h0 == rdAddr ? rPause : 64'hffffffffffffffff; // @[RegisterBlock.scala 220:10 224:38 225:16]
  wire [63:0] _GEN_128 = 6'h8 == rdAddr ? rAddr : _GEN_127; // @[RegisterBlock.scala 224:38 225:16]
  wire  _T_18 = ~reset; // @[RegisterBlock.scala 182:11]
  wire [7:0] wrReqData__bits_strb = wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 417:19 418:14]
  wire [63:0] wrReqData__bits_data = wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 417:19 418:14]
  wire [7:0] rPause_byte_wdata = wrReqData__bits_data[7:0]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original = rPause[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : rPause_byte_original; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_1 = wrReqData__bits_data[15:8]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_1 = rPause[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : rPause_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_2 = wrReqData__bits_data[23:16]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_2 = rPause[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : rPause_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_3 = wrReqData__bits_data[31:24]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_3 = rPause[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : rPause_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_4 = wrReqData__bits_data[39:32]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_4 = rPause[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : rPause_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_5 = wrReqData__bits_data[47:40]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_5 = rPause[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : rPause_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_6 = wrReqData__bits_data[55:48]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_6 = rPause[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : rPause_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_7 = wrReqData__bits_data[63:56]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_7 = rPause[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : rPause_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _rPause_T_16 = {_rPause_T_15,_rPause_T_14,_rPause_T_13,_rPause_T_12,_rPause_T_11,_rPause_T_10,_rPause_T_9,
    _rPause_T_8}; // @[Interface.scala 262:7]
  wire [7:0] rAddr_byte_original = rAddr[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : rAddr_byte_original; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_1 = rAddr[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : rAddr_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_2 = rAddr[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : rAddr_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_3 = rAddr[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : rAddr_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_4 = rAddr[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : rAddr_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_5 = rAddr[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : rAddr_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_6 = rAddr[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : rAddr_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_7 = rAddr[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : rAddr_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _rAddr_T_16 = {_rAddr_T_15,_rAddr_T_14,_rAddr_T_13,_rAddr_T_12,_rAddr_T_11,_rAddr_T_10,_rAddr_T_9,
    _rAddr_T_8}; // @[Interface.scala 262:7]
  wire [7:0] avaialbleSize_byte_original = avaialbleSize[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_12 = wrReqData__bits_strb[0] ? rPause_byte_wdata : avaialbleSize_byte_original; // @[Interface.scala 259:14]
  wire [7:0] avaialbleSize_byte_original_1 = avaialbleSize[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_13 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : avaialbleSize_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] avaialbleSize_byte_original_2 = avaialbleSize[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_14 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : avaialbleSize_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] avaialbleSize_byte_original_3 = avaialbleSize[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_15 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : avaialbleSize_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] avaialbleSize_byte_original_4 = avaialbleSize[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_16 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : avaialbleSize_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] avaialbleSize_byte_original_5 = avaialbleSize[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_17 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : avaialbleSize_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] avaialbleSize_byte_original_6 = avaialbleSize[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_18 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : avaialbleSize_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] avaialbleSize_byte_original_7 = avaialbleSize[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _avaialbleSize_T_19 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : avaialbleSize_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _avaialbleSize_T_20 = {_avaialbleSize_T_19,_avaialbleSize_T_18,_avaialbleSize_T_17,_avaialbleSize_T_16,
    _avaialbleSize_T_15,_avaialbleSize_T_14,_avaialbleSize_T_13,_avaialbleSize_T_12}; // @[Interface.scala 262:7]
  Queue rdReq__deq ( // @[Decoupled.scala 377:21]
    .clock(rdReq__deq_clock),
    .reset(rdReq__deq_reset),
    .io_enq_ready(rdReq__deq_io_enq_ready),
    .io_enq_valid(rdReq__deq_io_enq_valid),
    .io_enq_bits_addr(rdReq__deq_io_enq_bits_addr),
    .io_deq_ready(rdReq__deq_io_deq_ready),
    .io_deq_valid(rdReq__deq_io_deq_valid),
    .io_deq_bits_addr(rdReq__deq_io_deq_bits_addr)
  );
  Queue wrReq__deq ( // @[Decoupled.scala 377:21]
    .clock(wrReq__deq_clock),
    .reset(wrReq__deq_reset),
    .io_enq_ready(wrReq__deq_io_enq_ready),
    .io_enq_valid(wrReq__deq_io_enq_valid),
    .io_enq_bits_addr(wrReq__deq_io_enq_bits_addr),
    .io_deq_ready(wrReq__deq_io_deq_ready),
    .io_deq_valid(wrReq__deq_io_deq_valid),
    .io_deq_bits_addr(wrReq__deq_io_deq_bits_addr)
  );
  Queue_2 wrReqData__deq ( // @[Decoupled.scala 377:21]
    .clock(wrReqData__deq_clock),
    .reset(wrReqData__deq_reset),
    .io_enq_ready(wrReqData__deq_io_enq_ready),
    .io_enq_valid(wrReqData__deq_io_enq_valid),
    .io_enq_bits_data(wrReqData__deq_io_enq_bits_data),
    .io_enq_bits_strb(wrReqData__deq_io_enq_bits_strb),
    .io_deq_ready(wrReqData__deq_io_deq_ready),
    .io_deq_valid(wrReqData__deq_io_deq_valid),
    .io_deq_bits_data(wrReqData__deq_io_deq_bits_data),
    .io_deq_bits_strb(wrReqData__deq_io_deq_bits_strb)
  );
  assign io_dataOut_valid = _T_2 ? 1'h0 : _GEN_107; // @[virtContAddrServer.scala 92:27 96:48]
  assign io_dataOut_bits = 4'hf == burstCounter ? continuationsRegisters_15 : _GEN_125; // @[virtContAddrServer.scala 106:{27,27}]
  assign io_axi_mgmt_ARREADY = rdReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_RVALID = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign io_axi_mgmt_RDATA = 6'h10 == rdAddr ? avaialbleSize : _GEN_128; // @[RegisterBlock.scala 224:38 225:16]
  assign io_axi_mgmt_AWREADY = wrReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_WREADY = wrReqData__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_BVALID = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign io_read_address_valid = stateReg == 3'h1; // @[virtContAddrServer.scala 96:19]
  assign io_read_address_bits = _io_read_address_bits_T_2[63:0]; // @[virtContAddrServer.scala 105:27]
  assign io_read_data_ready = _T_2 ? 1'h0 : _T_3; // @[virtContAddrServer.scala 90:27 96:48]
  assign rdReq__deq_clock = clock;
  assign rdReq__deq_reset = reset;
  assign rdReq__deq_io_enq_valid = io_axi_mgmt_ARVALID; // @[RegisterBlock.scala 60:19 virtContAddrServer.scala 34:20]
  assign rdReq__deq_io_enq_bits_addr = io_axi_mgmt_ARADDR; // @[RegisterBlock.scala 60:19 virtContAddrServer.scala 34:20]
  assign rdReq__deq_io_deq_ready = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign wrReq__deq_clock = clock;
  assign wrReq__deq_reset = reset;
  assign wrReq__deq_io_enq_valid = io_axi_mgmt_AWVALID; // @[RegisterBlock.scala 60:19 virtContAddrServer.scala 34:20]
  assign wrReq__deq_io_enq_bits_addr = io_axi_mgmt_AWADDR; // @[RegisterBlock.scala 60:19 virtContAddrServer.scala 34:20]
  assign wrReq__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign wrReqData__deq_clock = clock;
  assign wrReqData__deq_reset = reset;
  assign wrReqData__deq_io_enq_valid = io_axi_mgmt_WVALID; // @[RegisterBlock.scala 60:19 virtContAddrServer.scala 34:20]
  assign wrReqData__deq_io_enq_bits_data = io_axi_mgmt_WDATA; // @[RegisterBlock.scala 60:19 virtContAddrServer.scala 34:20]
  assign wrReqData__deq_io_enq_bits_strb = io_axi_mgmt_WSTRB; // @[RegisterBlock.scala 60:19 virtContAddrServer.scala 34:20]
  assign wrReqData__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  always @(posedge clock) begin
    if (reset) begin // @[virtContAddrServer.scala 37:49]
      rAddr <= 64'h0; // @[virtContAddrServer.scala 37:49]
    end else if (wrReq) begin // @[virtContAddrServer.scala 113:27]
      if (6'h8 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rAddr <= _rAddr_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 38:49]
      rPause <= 64'h0; // @[virtContAddrServer.scala 38:49]
    end else if (wrReq) begin // @[virtContAddrServer.scala 113:27]
      if (6'h0 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rPause <= _rPause_T_16; // @[RegisterBlock.scala 118:11]
      end else begin
        rPause <= _GEN_86;
      end
    end else begin
      rPause <= _GEN_86;
    end
    if (reset) begin // @[virtContAddrServer.scala 39:49]
      avaialbleSize <= 64'h0; // @[virtContAddrServer.scala 39:49]
    end else if (wrReq) begin // @[virtContAddrServer.scala 113:27]
      if (6'h10 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        avaialbleSize <= _avaialbleSize_T_20; // @[RegisterBlock.scala 118:11]
      end else begin
        avaialbleSize <= _GEN_104;
      end
    end else begin
      avaialbleSize <= _GEN_104;
    end
    if (reset) begin // @[virtContAddrServer.scala 40:49]
      stateReg <= 3'h0; // @[virtContAddrServer.scala 40:49]
    end else if (stateReg == 3'h0) begin // @[virtContAddrServer.scala 51:34]
      if (avaialbleSize >= 64'h10) begin // @[virtContAddrServer.scala 52:52]
        stateReg <= 3'h1; // @[virtContAddrServer.scala 53:22]
      end else begin
        stateReg <= 3'h4; // @[virtContAddrServer.scala 55:22]
      end
    end else if (stateReg == 3'h1) begin // @[virtContAddrServer.scala 58:54]
      if (io_read_address_ready) begin // @[virtContAddrServer.scala 59:36]
        stateReg <= 3'h2; // @[virtContAddrServer.scala 60:26]
      end
    end else if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
      stateReg <= _GEN_38;
    end else begin
      stateReg <= _GEN_46;
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_0 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_0 <= _GEN_20;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_1 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_1 <= _GEN_21;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_2 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_2 <= _GEN_22;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_3 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_3 <= _GEN_23;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_4 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_4 <= _GEN_24;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_5 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_5 <= _GEN_25;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_6 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_6 <= _GEN_26;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_7 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_7 <= _GEN_27;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_8 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_8 <= _GEN_28;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_9 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_9 <= _GEN_29;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_10 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_10 <= _GEN_30;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_11 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_11 <= _GEN_31;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_12 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_12 <= _GEN_32;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_13 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_13 <= _GEN_33;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_14 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_14 <= _GEN_34;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 43:49]
      continuationsRegisters_15 <= 64'h0; // @[virtContAddrServer.scala 43:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (!(stateReg == 3'h1)) begin // @[virtContAddrServer.scala 58:54]
        if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
          continuationsRegisters_15 <= _GEN_35;
        end
      end
    end
    if (reset) begin // @[virtContAddrServer.scala 44:49]
      burstCounter <= 4'hf; // @[virtContAddrServer.scala 44:49]
    end else if (!(stateReg == 3'h0)) begin // @[virtContAddrServer.scala 51:34]
      if (stateReg == 3'h1) begin // @[virtContAddrServer.scala 58:54]
        if (io_read_address_ready) begin // @[virtContAddrServer.scala 59:36]
          burstCounter <= 4'hf; // @[virtContAddrServer.scala 61:26]
        end
      end else if (stateReg == 3'h2) begin // @[virtContAddrServer.scala 63:44]
        burstCounter <= _GEN_40;
      end else begin
        burstCounter <= _GEN_45;
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (rdReq & ~reset & ~rdReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:182 assert(rdReq)\n"); // @[RegisterBlock.scala 182:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~rdReq & (rdReq & ~reset)) begin
          $fatal; // @[RegisterBlock.scala 182:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wrReq & _T_18 & ~wrReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:198 assert(wrReq)\n"); // @[RegisterBlock.scala 198:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~wrReq & (wrReq & _T_18)) begin
          $fatal; // @[RegisterBlock.scala 198:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  rAddr = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  rPause = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  avaialbleSize = _RAND_2[63:0];
  _RAND_3 = {1{`RANDOM}};
  stateReg = _RAND_3[2:0];
  _RAND_4 = {2{`RANDOM}};
  continuationsRegisters_0 = _RAND_4[63:0];
  _RAND_5 = {2{`RANDOM}};
  continuationsRegisters_1 = _RAND_5[63:0];
  _RAND_6 = {2{`RANDOM}};
  continuationsRegisters_2 = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  continuationsRegisters_3 = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  continuationsRegisters_4 = _RAND_8[63:0];
  _RAND_9 = {2{`RANDOM}};
  continuationsRegisters_5 = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  continuationsRegisters_6 = _RAND_10[63:0];
  _RAND_11 = {2{`RANDOM}};
  continuationsRegisters_7 = _RAND_11[63:0];
  _RAND_12 = {2{`RANDOM}};
  continuationsRegisters_8 = _RAND_12[63:0];
  _RAND_13 = {2{`RANDOM}};
  continuationsRegisters_9 = _RAND_13[63:0];
  _RAND_14 = {2{`RANDOM}};
  continuationsRegisters_10 = _RAND_14[63:0];
  _RAND_15 = {2{`RANDOM}};
  continuationsRegisters_11 = _RAND_15[63:0];
  _RAND_16 = {2{`RANDOM}};
  continuationsRegisters_12 = _RAND_16[63:0];
  _RAND_17 = {2{`RANDOM}};
  continuationsRegisters_13 = _RAND_17[63:0];
  _RAND_18 = {2{`RANDOM}};
  continuationsRegisters_14 = _RAND_18[63:0];
  _RAND_19 = {2{`RANDOM}};
  continuationsRegisters_15 = _RAND_19[63:0];
  _RAND_20 = {1{`RANDOM}};
  burstCounter = _RAND_20[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module readyValidMem_1(
  output        io_read_address_ready,
  input         io_read_address_valid,
  input  [63:0] io_read_address_bits,
  input         io_read_data_ready,
  output        io_read_data_valid,
  output [63:0] io_read_data_bits,
  input         axi_ARREADY,
  output        axi_ARVALID,
  output [63:0] axi_ARADDR,
  output        axi_RREADY,
  input         axi_RVALID,
  input  [63:0] axi_RDATA
);
  assign io_read_address_ready = axi_ARREADY; // @[readyValidMem.scala 155:31]
  assign io_read_data_valid = axi_RVALID; // @[readyValidMem.scala 171:31]
  assign io_read_data_bits = axi_RDATA; // @[readyValidMem.scala 172:31]
  assign axi_ARVALID = io_read_address_valid; // @[readyValidMem.scala 153:31]
  assign axi_ARADDR = io_read_address_bits; // @[readyValidMem.scala 154:31]
  assign axi_RREADY = io_read_data_ready; // @[readyValidMem.scala 169:31]
endmodule
module continuationAllocationSide(
  input         clock,
  input         reset,
  input         io_contOut_0_TREADY,
  output        io_contOut_0_TVALID,
  output [63:0] io_contOut_0_TDATA,
  input         io_contOut_1_TREADY,
  output        io_contOut_1_TVALID,
  output [63:0] io_contOut_1_TDATA,
  input         io_contOut_2_TREADY,
  output        io_contOut_2_TVALID,
  output [63:0] io_contOut_2_TDATA,
  input         io_contOut_3_TREADY,
  output        io_contOut_3_TVALID,
  output [63:0] io_contOut_3_TDATA,
  output        io_axi_mgmt_vcas_ARREADY,
  input         io_axi_mgmt_vcas_ARVALID,
  input  [5:0]  io_axi_mgmt_vcas_ARADDR,
  input         io_axi_mgmt_vcas_RREADY,
  output        io_axi_mgmt_vcas_RVALID,
  output [63:0] io_axi_mgmt_vcas_RDATA,
  output        io_axi_mgmt_vcas_AWREADY,
  input         io_axi_mgmt_vcas_AWVALID,
  input  [5:0]  io_axi_mgmt_vcas_AWADDR,
  output        io_axi_mgmt_vcas_WREADY,
  input         io_axi_mgmt_vcas_WVALID,
  input  [63:0] io_axi_mgmt_vcas_WDATA,
  input  [7:0]  io_axi_mgmt_vcas_WSTRB,
  input         io_axi_mgmt_vcas_BREADY,
  output        io_axi_mgmt_vcas_BVALID,
  input         io_vcas_axi_full_ARREADY,
  output        io_vcas_axi_full_ARVALID,
  output [63:0] io_vcas_axi_full_ARADDR,
  output        io_vcas_axi_full_RREADY,
  input         io_vcas_axi_full_RVALID,
  input  [63:0] io_vcas_axi_full_RDATA
);
  wire  continuationNetwork_clock; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_reset; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connVCAS_ready; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connVCAS_valid; // @[continuationAllocationSide.scala 51:37]
  wire [63:0] continuationNetwork_io_connVCAS_bits; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_0_ready; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_0_valid; // @[continuationAllocationSide.scala 51:37]
  wire [63:0] continuationNetwork_io_connPE_0_bits; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_1_ready; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_1_valid; // @[continuationAllocationSide.scala 51:37]
  wire [63:0] continuationNetwork_io_connPE_1_bits; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_2_ready; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_2_valid; // @[continuationAllocationSide.scala 51:37]
  wire [63:0] continuationNetwork_io_connPE_2_bits; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_3_ready; // @[continuationAllocationSide.scala 51:37]
  wire  continuationNetwork_io_connPE_3_valid; // @[continuationAllocationSide.scala 51:37]
  wire [63:0] continuationNetwork_io_connPE_3_bits; // @[continuationAllocationSide.scala 51:37]
  wire  vcas0_clock; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_reset; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_dataOut_ready; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_dataOut_valid; // @[continuationAllocationSide.scala 56:23]
  wire [63:0] vcas0_io_dataOut_bits; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_ARREADY; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_ARVALID; // @[continuationAllocationSide.scala 56:23]
  wire [5:0] vcas0_io_axi_mgmt_ARADDR; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_RREADY; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_RVALID; // @[continuationAllocationSide.scala 56:23]
  wire [63:0] vcas0_io_axi_mgmt_RDATA; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_AWREADY; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_AWVALID; // @[continuationAllocationSide.scala 56:23]
  wire [5:0] vcas0_io_axi_mgmt_AWADDR; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_WREADY; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_WVALID; // @[continuationAllocationSide.scala 56:23]
  wire [63:0] vcas0_io_axi_mgmt_WDATA; // @[continuationAllocationSide.scala 56:23]
  wire [7:0] vcas0_io_axi_mgmt_WSTRB; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_BREADY; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_axi_mgmt_BVALID; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_read_address_ready; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_read_address_valid; // @[continuationAllocationSide.scala 56:23]
  wire [63:0] vcas0_io_read_address_bits; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_read_data_ready; // @[continuationAllocationSide.scala 56:23]
  wire  vcas0_io_read_data_valid; // @[continuationAllocationSide.scala 56:23]
  wire [63:0] vcas0_io_read_data_bits; // @[continuationAllocationSide.scala 56:23]
  wire  vcasRvmRO_io_read_address_ready; // @[continuationAllocationSide.scala 74:31]
  wire  vcasRvmRO_io_read_address_valid; // @[continuationAllocationSide.scala 74:31]
  wire [63:0] vcasRvmRO_io_read_address_bits; // @[continuationAllocationSide.scala 74:31]
  wire  vcasRvmRO_io_read_data_ready; // @[continuationAllocationSide.scala 74:31]
  wire  vcasRvmRO_io_read_data_valid; // @[continuationAllocationSide.scala 74:31]
  wire [63:0] vcasRvmRO_io_read_data_bits; // @[continuationAllocationSide.scala 74:31]
  wire  vcasRvmRO_axi_ARREADY; // @[continuationAllocationSide.scala 74:31]
  wire  vcasRvmRO_axi_ARVALID; // @[continuationAllocationSide.scala 74:31]
  wire [63:0] vcasRvmRO_axi_ARADDR; // @[continuationAllocationSide.scala 74:31]
  wire  vcasRvmRO_axi_RREADY; // @[continuationAllocationSide.scala 74:31]
  wire  vcasRvmRO_axi_RVALID; // @[continuationAllocationSide.scala 74:31]
  wire [63:0] vcasRvmRO_axi_RDATA; // @[continuationAllocationSide.scala 74:31]
  contNetwork continuationNetwork ( // @[continuationAllocationSide.scala 51:37]
    .clock(continuationNetwork_clock),
    .reset(continuationNetwork_reset),
    .io_connVCAS_ready(continuationNetwork_io_connVCAS_ready),
    .io_connVCAS_valid(continuationNetwork_io_connVCAS_valid),
    .io_connVCAS_bits(continuationNetwork_io_connVCAS_bits),
    .io_connPE_0_ready(continuationNetwork_io_connPE_0_ready),
    .io_connPE_0_valid(continuationNetwork_io_connPE_0_valid),
    .io_connPE_0_bits(continuationNetwork_io_connPE_0_bits),
    .io_connPE_1_ready(continuationNetwork_io_connPE_1_ready),
    .io_connPE_1_valid(continuationNetwork_io_connPE_1_valid),
    .io_connPE_1_bits(continuationNetwork_io_connPE_1_bits),
    .io_connPE_2_ready(continuationNetwork_io_connPE_2_ready),
    .io_connPE_2_valid(continuationNetwork_io_connPE_2_valid),
    .io_connPE_2_bits(continuationNetwork_io_connPE_2_bits),
    .io_connPE_3_ready(continuationNetwork_io_connPE_3_ready),
    .io_connPE_3_valid(continuationNetwork_io_connPE_3_valid),
    .io_connPE_3_bits(continuationNetwork_io_connPE_3_bits)
  );
  virtContAddrServer vcas0 ( // @[continuationAllocationSide.scala 56:23]
    .clock(vcas0_clock),
    .reset(vcas0_reset),
    .io_dataOut_ready(vcas0_io_dataOut_ready),
    .io_dataOut_valid(vcas0_io_dataOut_valid),
    .io_dataOut_bits(vcas0_io_dataOut_bits),
    .io_axi_mgmt_ARREADY(vcas0_io_axi_mgmt_ARREADY),
    .io_axi_mgmt_ARVALID(vcas0_io_axi_mgmt_ARVALID),
    .io_axi_mgmt_ARADDR(vcas0_io_axi_mgmt_ARADDR),
    .io_axi_mgmt_RREADY(vcas0_io_axi_mgmt_RREADY),
    .io_axi_mgmt_RVALID(vcas0_io_axi_mgmt_RVALID),
    .io_axi_mgmt_RDATA(vcas0_io_axi_mgmt_RDATA),
    .io_axi_mgmt_AWREADY(vcas0_io_axi_mgmt_AWREADY),
    .io_axi_mgmt_AWVALID(vcas0_io_axi_mgmt_AWVALID),
    .io_axi_mgmt_AWADDR(vcas0_io_axi_mgmt_AWADDR),
    .io_axi_mgmt_WREADY(vcas0_io_axi_mgmt_WREADY),
    .io_axi_mgmt_WVALID(vcas0_io_axi_mgmt_WVALID),
    .io_axi_mgmt_WDATA(vcas0_io_axi_mgmt_WDATA),
    .io_axi_mgmt_WSTRB(vcas0_io_axi_mgmt_WSTRB),
    .io_axi_mgmt_BREADY(vcas0_io_axi_mgmt_BREADY),
    .io_axi_mgmt_BVALID(vcas0_io_axi_mgmt_BVALID),
    .io_read_address_ready(vcas0_io_read_address_ready),
    .io_read_address_valid(vcas0_io_read_address_valid),
    .io_read_address_bits(vcas0_io_read_address_bits),
    .io_read_data_ready(vcas0_io_read_data_ready),
    .io_read_data_valid(vcas0_io_read_data_valid),
    .io_read_data_bits(vcas0_io_read_data_bits)
  );
  readyValidMem_1 vcasRvmRO ( // @[continuationAllocationSide.scala 74:31]
    .io_read_address_ready(vcasRvmRO_io_read_address_ready),
    .io_read_address_valid(vcasRvmRO_io_read_address_valid),
    .io_read_address_bits(vcasRvmRO_io_read_address_bits),
    .io_read_data_ready(vcasRvmRO_io_read_data_ready),
    .io_read_data_valid(vcasRvmRO_io_read_data_valid),
    .io_read_data_bits(vcasRvmRO_io_read_data_bits),
    .axi_ARREADY(vcasRvmRO_axi_ARREADY),
    .axi_ARVALID(vcasRvmRO_axi_ARVALID),
    .axi_ARADDR(vcasRvmRO_axi_ARADDR),
    .axi_RREADY(vcasRvmRO_axi_RREADY),
    .axi_RVALID(vcasRvmRO_axi_RVALID),
    .axi_RDATA(vcasRvmRO_axi_RDATA)
  );
  assign io_contOut_0_TVALID = continuationNetwork_io_connPE_0_valid; // @[continuationAllocationSide.scala 83:42]
  assign io_contOut_0_TDATA = continuationNetwork_io_connPE_0_bits; // @[continuationAllocationSide.scala 83:42]
  assign io_contOut_1_TVALID = continuationNetwork_io_connPE_1_valid; // @[continuationAllocationSide.scala 83:42]
  assign io_contOut_1_TDATA = continuationNetwork_io_connPE_1_bits; // @[continuationAllocationSide.scala 83:42]
  assign io_contOut_2_TVALID = continuationNetwork_io_connPE_2_valid; // @[continuationAllocationSide.scala 83:42]
  assign io_contOut_2_TDATA = continuationNetwork_io_connPE_2_bits; // @[continuationAllocationSide.scala 83:42]
  assign io_contOut_3_TVALID = continuationNetwork_io_connPE_3_valid; // @[continuationAllocationSide.scala 83:42]
  assign io_contOut_3_TDATA = continuationNetwork_io_connPE_3_bits; // @[continuationAllocationSide.scala 83:42]
  assign io_axi_mgmt_vcas_ARREADY = vcas0_io_axi_mgmt_ARREADY; // @[continuationAllocationSide.scala 69:22]
  assign io_axi_mgmt_vcas_RVALID = vcas0_io_axi_mgmt_RVALID; // @[continuationAllocationSide.scala 69:22]
  assign io_axi_mgmt_vcas_RDATA = vcas0_io_axi_mgmt_RDATA; // @[continuationAllocationSide.scala 69:22]
  assign io_axi_mgmt_vcas_AWREADY = vcas0_io_axi_mgmt_AWREADY; // @[continuationAllocationSide.scala 69:22]
  assign io_axi_mgmt_vcas_WREADY = vcas0_io_axi_mgmt_WREADY; // @[continuationAllocationSide.scala 69:22]
  assign io_axi_mgmt_vcas_BVALID = vcas0_io_axi_mgmt_BVALID; // @[continuationAllocationSide.scala 69:22]
  assign io_vcas_axi_full_ARVALID = vcasRvmRO_axi_ARVALID; // @[continuationAllocationSide.scala 79:36]
  assign io_vcas_axi_full_ARADDR = vcasRvmRO_axi_ARADDR; // @[continuationAllocationSide.scala 79:36]
  assign io_vcas_axi_full_RREADY = vcasRvmRO_axi_RREADY; // @[continuationAllocationSide.scala 79:36]
  assign continuationNetwork_clock = clock;
  assign continuationNetwork_reset = reset;
  assign continuationNetwork_io_connVCAS_valid = vcas0_io_dataOut_valid; // @[continuationAllocationSide.scala 80:36]
  assign continuationNetwork_io_connVCAS_bits = vcas0_io_dataOut_bits; // @[continuationAllocationSide.scala 80:36]
  assign continuationNetwork_io_connPE_0_ready = io_contOut_0_TREADY; // @[continuationAllocationSide.scala 83:42]
  assign continuationNetwork_io_connPE_1_ready = io_contOut_1_TREADY; // @[continuationAllocationSide.scala 83:42]
  assign continuationNetwork_io_connPE_2_ready = io_contOut_2_TREADY; // @[continuationAllocationSide.scala 83:42]
  assign continuationNetwork_io_connPE_3_ready = io_contOut_3_TREADY; // @[continuationAllocationSide.scala 83:42]
  assign vcas0_clock = clock;
  assign vcas0_reset = reset;
  assign vcas0_io_dataOut_ready = continuationNetwork_io_connVCAS_ready; // @[continuationAllocationSide.scala 80:36]
  assign vcas0_io_axi_mgmt_ARVALID = io_axi_mgmt_vcas_ARVALID; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_ARADDR = io_axi_mgmt_vcas_ARADDR; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_RREADY = io_axi_mgmt_vcas_RREADY; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_AWVALID = io_axi_mgmt_vcas_AWVALID; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_AWADDR = io_axi_mgmt_vcas_AWADDR; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_WVALID = io_axi_mgmt_vcas_WVALID; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_WDATA = io_axi_mgmt_vcas_WDATA; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_WSTRB = io_axi_mgmt_vcas_WSTRB; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_axi_mgmt_BREADY = io_axi_mgmt_vcas_BREADY; // @[continuationAllocationSide.scala 69:22]
  assign vcas0_io_read_address_ready = vcasRvmRO_io_read_address_ready; // @[continuationAllocationSide.scala 77:36]
  assign vcas0_io_read_data_valid = vcasRvmRO_io_read_data_valid; // @[continuationAllocationSide.scala 78:36]
  assign vcas0_io_read_data_bits = vcasRvmRO_io_read_data_bits; // @[continuationAllocationSide.scala 78:36]
  assign vcasRvmRO_io_read_address_valid = vcas0_io_read_address_valid; // @[continuationAllocationSide.scala 77:36]
  assign vcasRvmRO_io_read_address_bits = vcas0_io_read_address_bits; // @[continuationAllocationSide.scala 77:36]
  assign vcasRvmRO_io_read_data_ready = vcas0_io_read_data_ready; // @[continuationAllocationSide.scala 78:36]
  assign vcasRvmRO_axi_ARREADY = io_vcas_axi_full_ARREADY; // @[continuationAllocationSide.scala 79:36]
  assign vcasRvmRO_axi_RVALID = io_vcas_axi_full_RVALID; // @[continuationAllocationSide.scala 79:36]
  assign vcasRvmRO_axi_RDATA = io_vcas_axi_full_RDATA; // @[continuationAllocationSide.scala 79:36]
endmodule
module argRouteNtwUnit(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  output        io_peAddress_ready,
  input         io_peAddress_valid,
  input  [63:0] io_peAddress_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg  stateReg; // @[argRouteNtwUnit.scala 22:30]
  reg [63:0] addressReg; // @[argRouteNtwUnit.scala 23:30]
  reg  priorityReg; // @[argRouteNtwUnit.scala 24:30]
  wire  _T = ~stateReg; // @[argRouteNtwUnit.scala 33:19]
  wire  _T_1 = io_addressIn_valid & io_peAddress_valid; // @[argRouteNtwUnit.scala 34:33]
  wire [63:0] _GEN_1 = io_addressIn_valid ? io_addressIn_bits : addressReg; // @[argRouteNtwUnit.scala 44:43 45:28 23:30]
  wire  _GEN_4 = io_addressIn_valid & io_peAddress_valid ? ~priorityReg : priorityReg; // @[argRouteNtwUnit.scala 34:55 40:25 24:30]
  wire  _GEN_5 = io_addressIn_valid | io_peAddress_valid | stateReg; // @[argRouteNtwUnit.scala 49:55 50:24 22:30]
  wire  _GEN_6 = io_addressOut_ready ? 1'h0 : stateReg; // @[argRouteNtwUnit.scala 54:34 55:22 22:30]
  wire  _GEN_7 = stateReg & _GEN_6; // @[argRouteNtwUnit.scala 53:44 58:18]
  wire  _GEN_9 = ~stateReg ? _GEN_4 : priorityReg; // @[argRouteNtwUnit.scala 24:30 33:43]
  wire  _GEN_12 = priorityReg ? 1'h0 : 1'h1; // @[argRouteNtwUnit.scala 26:28 64:30 67:36]
  wire  _GEN_15 = io_peAddress_valid ? 1'h0 : io_addressIn_valid; // @[argRouteNtwUnit.scala 26:28 70:37]
  wire  _GEN_16 = _T_1 ? priorityReg : io_peAddress_valid; // @[argRouteNtwUnit.scala 63:55]
  wire  _GEN_17 = _T_1 ? _GEN_12 : _GEN_15; // @[argRouteNtwUnit.scala 63:55]
  assign io_addressIn_ready = _T & _GEN_17; // @[argRouteNtwUnit.scala 26:28 62:43]
  assign io_peAddress_ready = _T & _GEN_16; // @[argRouteNtwUnit.scala 27:28 62:43]
  assign io_addressOut_valid = _T ? 1'h0 : stateReg; // @[argRouteNtwUnit.scala 28:28 62:43]
  assign io_addressOut_bits = addressReg; // @[argRouteNtwUnit.scala 29:28]
  always @(posedge clock) begin
    if (reset) begin // @[argRouteNtwUnit.scala 22:30]
      stateReg <= 1'h0; // @[argRouteNtwUnit.scala 22:30]
    end else if (~stateReg) begin // @[argRouteNtwUnit.scala 33:43]
      stateReg <= _GEN_5;
    end else begin
      stateReg <= _GEN_7;
    end
    if (reset) begin // @[argRouteNtwUnit.scala 23:30]
      addressReg <= 64'h0; // @[argRouteNtwUnit.scala 23:30]
    end else if (~stateReg) begin // @[argRouteNtwUnit.scala 33:43]
      if (io_addressIn_valid & io_peAddress_valid) begin // @[argRouteNtwUnit.scala 34:55]
        if (priorityReg) begin // @[argRouteNtwUnit.scala 35:30]
          addressReg <= io_peAddress_bits; // @[argRouteNtwUnit.scala 36:28]
        end else begin
          addressReg <= io_addressIn_bits; // @[argRouteNtwUnit.scala 38:28]
        end
      end else if (io_peAddress_valid) begin // @[argRouteNtwUnit.scala 42:37]
        addressReg <= io_peAddress_bits; // @[argRouteNtwUnit.scala 43:28]
      end else begin
        addressReg <= _GEN_1;
      end
    end
    priorityReg <= reset | _GEN_9; // @[argRouteNtwUnit.scala 24:{30,30}]
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  addressReg = _RAND_1[63:0];
  _RAND_2 = {1{`RANDOM}};
  priorityReg = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module argRouteNtwVirtUnit(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_vasAddressOut_ready,
  output        io_vasAddressOut_valid,
  output [63:0] io_vasAddressOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[argRouteNtwVirtUnit.scala 23:32]
  reg [63:0] addressReg; // @[argRouteNtwVirtUnit.scala 24:32]
  wire [2:0] mask = 3'h4 - 3'h1; // @[argRouteNtwVirtUnit.scala 25:49]
  wire  _T = stateReg == 2'h0; // @[argRouteNtwVirtUnit.scala 33:19]
  wire [58:0] _GEN_7 = {{56'd0}, mask}; // @[argRouteNtwVirtUnit.scala 45:57]
  wire [58:0] _T_2 = io_addressIn_bits[63:5] & _GEN_7; // @[argRouteNtwVirtUnit.scala 45:57]
  wire  _T_4 = stateReg == 2'h1; // @[argRouteNtwVirtUnit.scala 52:25]
  wire  _T_5 = stateReg == 2'h2; // @[argRouteNtwVirtUnit.scala 57:25]
  wire [1:0] _GEN_4 = io_vasAddressOut_ready ? 2'h0 : stateReg; // @[argRouteNtwVirtUnit.scala 59:37 60:22 23:32]
  wire  _GEN_9 = stateReg == 2'h1 ? 1'h0 : _T_5; // @[argRouteNtwVirtUnit.scala 28:28 52:48]
  wire  _GEN_14 = stateReg == 2'h0 ? 1'h0 : _GEN_9; // @[argRouteNtwVirtUnit.scala 28:28 33:43]
  wire  _GEN_15 = _T_5 | _GEN_14; // @[argRouteNtwVirtUnit.scala 68:47 69:32]
  wire  _GEN_17 = _T_4 ? _GEN_14 : _GEN_15; // @[argRouteNtwVirtUnit.scala 66:48]
  assign io_addressIn_ready = _T | _T; // @[argRouteNtwVirtUnit.scala 64:43 65:28]
  assign io_vasAddressOut_valid = _T ? _GEN_14 : _GEN_17; // @[argRouteNtwVirtUnit.scala 64:43]
  assign io_vasAddressOut_bits = addressReg; // @[argRouteNtwVirtUnit.scala 30:28]
  always @(posedge clock) begin
    if (reset) begin // @[argRouteNtwVirtUnit.scala 23:32]
      stateReg <= 2'h0; // @[argRouteNtwVirtUnit.scala 23:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        if (_T_2 == 59'h0) begin // @[argRouteNtwVirtUnit.scala 45:104]
          stateReg <= 2'h2; // @[argRouteNtwVirtUnit.scala 46:30]
        end else begin
          stateReg <= 2'h1; // @[argRouteNtwVirtUnit.scala 48:30]
        end
      end
    end else if (!(stateReg == 2'h1)) begin // @[argRouteNtwVirtUnit.scala 52:48]
      if (stateReg == 2'h2) begin // @[argRouteNtwVirtUnit.scala 57:47]
        stateReg <= _GEN_4;
      end
    end
    if (reset) begin // @[argRouteNtwVirtUnit.scala 24:32]
      addressReg <= 64'h0; // @[argRouteNtwVirtUnit.scala 24:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        addressReg <= io_addressIn_bits; // @[argRouteNtwVirtUnit.scala 36:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  addressReg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module argRouteNtwVirtUnit_1(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_vasAddressOut_ready,
  output        io_vasAddressOut_valid,
  output [63:0] io_vasAddressOut_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[argRouteNtwVirtUnit.scala 23:32]
  reg [63:0] addressReg; // @[argRouteNtwVirtUnit.scala 24:32]
  wire [2:0] mask = 3'h4 - 3'h1; // @[argRouteNtwVirtUnit.scala 25:49]
  wire  _T = stateReg == 2'h0; // @[argRouteNtwVirtUnit.scala 33:19]
  wire [58:0] _GEN_21 = {{56'd0}, mask}; // @[argRouteNtwVirtUnit.scala 45:57]
  wire [58:0] _T_2 = io_addressIn_bits[63:5] & _GEN_21; // @[argRouteNtwVirtUnit.scala 45:57]
  wire  _T_4 = stateReg == 2'h1; // @[argRouteNtwVirtUnit.scala 52:25]
  wire  _T_5 = stateReg == 2'h2; // @[argRouteNtwVirtUnit.scala 57:25]
  wire [1:0] _GEN_4 = io_vasAddressOut_ready ? 2'h0 : stateReg; // @[argRouteNtwVirtUnit.scala 59:37 60:22 23:32]
  wire  _GEN_9 = stateReg == 2'h1 ? 1'h0 : _T_5; // @[argRouteNtwVirtUnit.scala 28:28 52:48]
  wire  _GEN_13 = stateReg == 2'h0 ? 1'h0 : _T_4; // @[argRouteNtwVirtUnit.scala 29:28 33:43]
  wire  _GEN_14 = stateReg == 2'h0 ? 1'h0 : _GEN_9; // @[argRouteNtwVirtUnit.scala 28:28 33:43]
  wire  _GEN_15 = _T_5 | _GEN_14; // @[argRouteNtwVirtUnit.scala 68:47 69:32]
  wire  _GEN_16 = _T_4 | _GEN_13; // @[argRouteNtwVirtUnit.scala 66:48 67:29]
  wire  _GEN_17 = _T_4 ? _GEN_14 : _GEN_15; // @[argRouteNtwVirtUnit.scala 66:48]
  assign io_addressIn_ready = _T | _T; // @[argRouteNtwVirtUnit.scala 64:43 65:28]
  assign io_vasAddressOut_valid = _T ? _GEN_14 : _GEN_17; // @[argRouteNtwVirtUnit.scala 64:43]
  assign io_vasAddressOut_bits = addressReg; // @[argRouteNtwVirtUnit.scala 30:28]
  assign io_addressOut_valid = _T ? _GEN_13 : _GEN_16; // @[argRouteNtwVirtUnit.scala 64:43]
  assign io_addressOut_bits = addressReg; // @[argRouteNtwVirtUnit.scala 31:28]
  always @(posedge clock) begin
    if (reset) begin // @[argRouteNtwVirtUnit.scala 23:32]
      stateReg <= 2'h0; // @[argRouteNtwVirtUnit.scala 23:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        if (_T_2 == 59'h1) begin // @[argRouteNtwVirtUnit.scala 45:104]
          stateReg <= 2'h2; // @[argRouteNtwVirtUnit.scala 46:30]
        end else begin
          stateReg <= 2'h1; // @[argRouteNtwVirtUnit.scala 48:30]
        end
      end
    end else if (stateReg == 2'h1) begin // @[argRouteNtwVirtUnit.scala 52:48]
      if (io_addressOut_ready) begin // @[argRouteNtwVirtUnit.scala 54:34]
        stateReg <= 2'h0; // @[argRouteNtwVirtUnit.scala 55:22]
      end
    end else if (stateReg == 2'h2) begin // @[argRouteNtwVirtUnit.scala 57:47]
      stateReg <= _GEN_4;
    end
    if (reset) begin // @[argRouteNtwVirtUnit.scala 24:32]
      addressReg <= 64'h0; // @[argRouteNtwVirtUnit.scala 24:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        addressReg <= io_addressIn_bits; // @[argRouteNtwVirtUnit.scala 36:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  addressReg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module argRouteNtwVirtUnit_2(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_vasAddressOut_ready,
  output        io_vasAddressOut_valid,
  output [63:0] io_vasAddressOut_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[argRouteNtwVirtUnit.scala 23:32]
  reg [63:0] addressReg; // @[argRouteNtwVirtUnit.scala 24:32]
  wire [2:0] mask = 3'h4 - 3'h1; // @[argRouteNtwVirtUnit.scala 25:49]
  wire  _T = stateReg == 2'h0; // @[argRouteNtwVirtUnit.scala 33:19]
  wire [58:0] _GEN_21 = {{56'd0}, mask}; // @[argRouteNtwVirtUnit.scala 45:57]
  wire [58:0] _T_2 = io_addressIn_bits[63:5] & _GEN_21; // @[argRouteNtwVirtUnit.scala 45:57]
  wire  _T_4 = stateReg == 2'h1; // @[argRouteNtwVirtUnit.scala 52:25]
  wire  _T_5 = stateReg == 2'h2; // @[argRouteNtwVirtUnit.scala 57:25]
  wire [1:0] _GEN_4 = io_vasAddressOut_ready ? 2'h0 : stateReg; // @[argRouteNtwVirtUnit.scala 59:37 60:22 23:32]
  wire  _GEN_9 = stateReg == 2'h1 ? 1'h0 : _T_5; // @[argRouteNtwVirtUnit.scala 28:28 52:48]
  wire  _GEN_13 = stateReg == 2'h0 ? 1'h0 : _T_4; // @[argRouteNtwVirtUnit.scala 29:28 33:43]
  wire  _GEN_14 = stateReg == 2'h0 ? 1'h0 : _GEN_9; // @[argRouteNtwVirtUnit.scala 28:28 33:43]
  wire  _GEN_15 = _T_5 | _GEN_14; // @[argRouteNtwVirtUnit.scala 68:47 69:32]
  wire  _GEN_16 = _T_4 | _GEN_13; // @[argRouteNtwVirtUnit.scala 66:48 67:29]
  wire  _GEN_17 = _T_4 ? _GEN_14 : _GEN_15; // @[argRouteNtwVirtUnit.scala 66:48]
  assign io_addressIn_ready = _T | _T; // @[argRouteNtwVirtUnit.scala 64:43 65:28]
  assign io_vasAddressOut_valid = _T ? _GEN_14 : _GEN_17; // @[argRouteNtwVirtUnit.scala 64:43]
  assign io_vasAddressOut_bits = addressReg; // @[argRouteNtwVirtUnit.scala 30:28]
  assign io_addressOut_valid = _T ? _GEN_13 : _GEN_16; // @[argRouteNtwVirtUnit.scala 64:43]
  assign io_addressOut_bits = addressReg; // @[argRouteNtwVirtUnit.scala 31:28]
  always @(posedge clock) begin
    if (reset) begin // @[argRouteNtwVirtUnit.scala 23:32]
      stateReg <= 2'h0; // @[argRouteNtwVirtUnit.scala 23:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        if (_T_2 == 59'h2) begin // @[argRouteNtwVirtUnit.scala 45:104]
          stateReg <= 2'h2; // @[argRouteNtwVirtUnit.scala 46:30]
        end else begin
          stateReg <= 2'h1; // @[argRouteNtwVirtUnit.scala 48:30]
        end
      end
    end else if (stateReg == 2'h1) begin // @[argRouteNtwVirtUnit.scala 52:48]
      if (io_addressOut_ready) begin // @[argRouteNtwVirtUnit.scala 54:34]
        stateReg <= 2'h0; // @[argRouteNtwVirtUnit.scala 55:22]
      end
    end else if (stateReg == 2'h2) begin // @[argRouteNtwVirtUnit.scala 57:47]
      stateReg <= _GEN_4;
    end
    if (reset) begin // @[argRouteNtwVirtUnit.scala 24:32]
      addressReg <= 64'h0; // @[argRouteNtwVirtUnit.scala 24:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        addressReg <= io_addressIn_bits; // @[argRouteNtwVirtUnit.scala 36:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  addressReg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module argRouteNtwVirtUnit_3(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_vasAddressOut_ready,
  output        io_vasAddressOut_valid,
  output [63:0] io_vasAddressOut_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] stateReg; // @[argRouteNtwVirtUnit.scala 23:32]
  reg [63:0] addressReg; // @[argRouteNtwVirtUnit.scala 24:32]
  wire [2:0] mask = 3'h4 - 3'h1; // @[argRouteNtwVirtUnit.scala 25:49]
  wire  _T = stateReg == 2'h0; // @[argRouteNtwVirtUnit.scala 33:19]
  wire [58:0] _GEN_21 = {{56'd0}, mask}; // @[argRouteNtwVirtUnit.scala 45:57]
  wire [58:0] _T_2 = io_addressIn_bits[63:5] & _GEN_21; // @[argRouteNtwVirtUnit.scala 45:57]
  wire  _T_4 = stateReg == 2'h1; // @[argRouteNtwVirtUnit.scala 52:25]
  wire  _T_5 = stateReg == 2'h2; // @[argRouteNtwVirtUnit.scala 57:25]
  wire [1:0] _GEN_4 = io_vasAddressOut_ready ? 2'h0 : stateReg; // @[argRouteNtwVirtUnit.scala 59:37 60:22 23:32]
  wire  _GEN_9 = stateReg == 2'h1 ? 1'h0 : _T_5; // @[argRouteNtwVirtUnit.scala 28:28 52:48]
  wire  _GEN_13 = stateReg == 2'h0 ? 1'h0 : _T_4; // @[argRouteNtwVirtUnit.scala 29:28 33:43]
  wire  _GEN_14 = stateReg == 2'h0 ? 1'h0 : _GEN_9; // @[argRouteNtwVirtUnit.scala 28:28 33:43]
  wire  _GEN_15 = _T_5 | _GEN_14; // @[argRouteNtwVirtUnit.scala 68:47 69:32]
  wire  _GEN_16 = _T_4 | _GEN_13; // @[argRouteNtwVirtUnit.scala 66:48 67:29]
  wire  _GEN_17 = _T_4 ? _GEN_14 : _GEN_15; // @[argRouteNtwVirtUnit.scala 66:48]
  assign io_addressIn_ready = _T | _T; // @[argRouteNtwVirtUnit.scala 64:43 65:28]
  assign io_vasAddressOut_valid = _T ? _GEN_14 : _GEN_17; // @[argRouteNtwVirtUnit.scala 64:43]
  assign io_vasAddressOut_bits = addressReg; // @[argRouteNtwVirtUnit.scala 30:28]
  assign io_addressOut_valid = _T ? _GEN_13 : _GEN_16; // @[argRouteNtwVirtUnit.scala 64:43]
  assign io_addressOut_bits = addressReg; // @[argRouteNtwVirtUnit.scala 31:28]
  always @(posedge clock) begin
    if (reset) begin // @[argRouteNtwVirtUnit.scala 23:32]
      stateReg <= 2'h0; // @[argRouteNtwVirtUnit.scala 23:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        if (_T_2 == 59'h3) begin // @[argRouteNtwVirtUnit.scala 45:104]
          stateReg <= 2'h2; // @[argRouteNtwVirtUnit.scala 46:30]
        end else begin
          stateReg <= 2'h1; // @[argRouteNtwVirtUnit.scala 48:30]
        end
      end
    end else if (stateReg == 2'h1) begin // @[argRouteNtwVirtUnit.scala 52:48]
      if (io_addressOut_ready) begin // @[argRouteNtwVirtUnit.scala 54:34]
        stateReg <= 2'h0; // @[argRouteNtwVirtUnit.scala 55:22]
      end
    end else if (stateReg == 2'h2) begin // @[argRouteNtwVirtUnit.scala 57:47]
      stateReg <= _GEN_4;
    end
    if (reset) begin // @[argRouteNtwVirtUnit.scala 24:32]
      addressReg <= 64'h0; // @[argRouteNtwVirtUnit.scala 24:32]
    end else if (stateReg == 2'h0) begin // @[argRouteNtwVirtUnit.scala 33:43]
      if (io_addressIn_valid) begin // @[argRouteNtwVirtUnit.scala 35:33]
        addressReg <= io_addressIn_bits; // @[argRouteNtwVirtUnit.scala 36:24]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[1:0];
  _RAND_1 = {2{`RANDOM}};
  addressReg = _RAND_1[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_11(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:31]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [4:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [4:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [4:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [4:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [4:0] _value_T_1 = enq_ptr_value + 5'h1; // @[Counter.scala 77:24]
  wire [4:0] _value_T_3 = deq_ptr_value + 5'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 5'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[4:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[4:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module contQueue_4(
  input         clock,
  input         reset,
  output        io_addressIn_ready,
  input         io_addressIn_valid,
  input  [63:0] io_addressIn_bits,
  input         io_addressOut_ready,
  output        io_addressOut_valid,
  output [63:0] io_addressOut_bits
);
  wire  q_clock; // @[contQueue.scala 13:19]
  wire  q_reset; // @[contQueue.scala 13:19]
  wire  q_io_enq_ready; // @[contQueue.scala 13:19]
  wire  q_io_enq_valid; // @[contQueue.scala 13:19]
  wire [63:0] q_io_enq_bits; // @[contQueue.scala 13:19]
  wire  q_io_deq_ready; // @[contQueue.scala 13:19]
  wire  q_io_deq_valid; // @[contQueue.scala 13:19]
  wire [63:0] q_io_deq_bits; // @[contQueue.scala 13:19]
  Queue_11 q ( // @[contQueue.scala 13:19]
    .clock(q_clock),
    .reset(q_reset),
    .io_enq_ready(q_io_enq_ready),
    .io_enq_valid(q_io_enq_valid),
    .io_enq_bits(q_io_enq_bits),
    .io_deq_ready(q_io_deq_ready),
    .io_deq_valid(q_io_deq_valid),
    .io_deq_bits(q_io_deq_bits)
  );
  assign io_addressIn_ready = q_io_enq_ready; // @[contQueue.scala 15:14]
  assign io_addressOut_valid = q_io_deq_valid; // @[contQueue.scala 16:19]
  assign io_addressOut_bits = q_io_deq_bits; // @[contQueue.scala 16:19]
  assign q_clock = clock;
  assign q_reset = reset;
  assign q_io_enq_valid = io_addressIn_valid; // @[contQueue.scala 15:14]
  assign q_io_enq_bits = io_addressIn_bits; // @[contQueue.scala 15:14]
  assign q_io_deq_ready = io_addressOut_ready; // @[contQueue.scala 16:19]
endmodule
module argRouteNetwork(
  input         clock,
  input         reset,
  input         io_connVAS_0_ready,
  output        io_connVAS_0_valid,
  output [63:0] io_connVAS_0_bits,
  input         io_connVAS_1_ready,
  output        io_connVAS_1_valid,
  output [63:0] io_connVAS_1_bits,
  input         io_connVAS_2_ready,
  output        io_connVAS_2_valid,
  output [63:0] io_connVAS_2_bits,
  input         io_connVAS_3_ready,
  output        io_connVAS_3_valid,
  output [63:0] io_connVAS_3_bits,
  output        io_connPE_0_ready,
  input         io_connPE_0_valid,
  input  [63:0] io_connPE_0_bits,
  output        io_connPE_1_ready,
  input         io_connPE_1_valid,
  input  [63:0] io_connPE_1_bits,
  output        io_connPE_2_ready,
  input         io_connPE_2_valid,
  input  [63:0] io_connPE_2_bits,
  output        io_connPE_3_ready,
  input         io_connPE_3_valid,
  input  [63:0] io_connPE_3_bits,
  output        io_connPE_4_ready,
  input         io_connPE_4_valid,
  input  [63:0] io_connPE_4_bits,
  output        io_connPE_5_ready,
  input         io_connPE_5_valid,
  input  [63:0] io_connPE_5_bits,
  output        io_connPE_6_ready,
  input         io_connPE_6_valid,
  input  [63:0] io_connPE_6_bits,
  output        io_connPE_7_ready,
  input         io_connPE_7_valid,
  input  [63:0] io_connPE_7_bits
);
  wire  networkUnits_0_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_0_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_0_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_0_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_0_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_0_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_0_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_0_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_0_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_0_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_0_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_1_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_1_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_1_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_1_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_2_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_2_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_2_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_2_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_3_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_3_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_3_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_3_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_4_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_4_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_4_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_4_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_5_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_5_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_5_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_5_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_6_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_6_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_6_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_6_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_clock; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_reset; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_io_addressIn_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_io_addressIn_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_7_io_addressIn_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_io_peAddress_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_io_peAddress_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_7_io_peAddress_bits; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_io_addressOut_ready; // @[argRouteNetwork.scala 52:52]
  wire  networkUnits_7_io_addressOut_valid; // @[argRouteNetwork.scala 52:52]
  wire [63:0] networkUnits_7_io_addressOut_bits; // @[argRouteNetwork.scala 52:52]
  wire  virtNetworkUnits_0_clock; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_0_reset; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_0_io_addressIn_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_0_io_addressIn_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_0_io_addressIn_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_0_io_vasAddressOut_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_0_io_vasAddressOut_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_0_io_vasAddressOut_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_clock; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_reset; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_io_addressIn_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_io_addressIn_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_1_io_addressIn_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_io_vasAddressOut_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_io_vasAddressOut_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_1_io_vasAddressOut_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_io_addressOut_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_1_io_addressOut_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_1_io_addressOut_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_clock; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_reset; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_io_addressIn_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_io_addressIn_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_2_io_addressIn_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_io_vasAddressOut_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_io_vasAddressOut_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_2_io_vasAddressOut_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_io_addressOut_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_2_io_addressOut_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_2_io_addressOut_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_clock; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_reset; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_io_addressIn_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_io_addressIn_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_3_io_addressIn_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_io_vasAddressOut_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_io_vasAddressOut_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_3_io_vasAddressOut_bits; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_io_addressOut_ready; // @[argRouteNetwork.scala 67:58]
  wire  virtNetworkUnits_3_io_addressOut_valid; // @[argRouteNetwork.scala 67:58]
  wire [63:0] virtNetworkUnits_3_io_addressOut_bits; // @[argRouteNetwork.scala 67:58]
  wire  queues_0_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_0_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_0_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_0_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_0_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_0_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_0_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_0_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_1_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_1_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_1_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_1_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_1_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_1_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_1_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_1_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_2_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_2_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_2_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_2_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_2_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_2_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_2_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_2_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_3_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_3_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_3_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_3_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_3_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_3_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_3_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_3_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_4_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_4_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_4_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_4_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_4_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_4_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_4_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_4_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_5_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_5_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_5_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_5_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_5_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_5_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_5_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_5_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_6_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_6_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_6_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_6_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_6_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_6_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_6_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_6_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_7_clock; // @[argRouteNetwork.scala 79:49]
  wire  queues_7_reset; // @[argRouteNetwork.scala 79:49]
  wire  queues_7_io_addressIn_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_7_io_addressIn_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_7_io_addressIn_bits; // @[argRouteNetwork.scala 79:49]
  wire  queues_7_io_addressOut_ready; // @[argRouteNetwork.scala 79:49]
  wire  queues_7_io_addressOut_valid; // @[argRouteNetwork.scala 79:49]
  wire [63:0] queues_7_io_addressOut_bits; // @[argRouteNetwork.scala 79:49]
  argRouteNtwUnit networkUnits_0 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_0_clock),
    .reset(networkUnits_0_reset),
    .io_addressIn_ready(networkUnits_0_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_0_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_0_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_0_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_0_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_0_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_0_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_0_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_0_io_addressOut_bits)
  );
  argRouteNtwUnit networkUnits_1 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_1_clock),
    .reset(networkUnits_1_reset),
    .io_addressIn_ready(networkUnits_1_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_1_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_1_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_1_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_1_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_1_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_1_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_1_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_1_io_addressOut_bits)
  );
  argRouteNtwUnit networkUnits_2 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_2_clock),
    .reset(networkUnits_2_reset),
    .io_addressIn_ready(networkUnits_2_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_2_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_2_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_2_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_2_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_2_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_2_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_2_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_2_io_addressOut_bits)
  );
  argRouteNtwUnit networkUnits_3 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_3_clock),
    .reset(networkUnits_3_reset),
    .io_addressIn_ready(networkUnits_3_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_3_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_3_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_3_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_3_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_3_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_3_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_3_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_3_io_addressOut_bits)
  );
  argRouteNtwUnit networkUnits_4 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_4_clock),
    .reset(networkUnits_4_reset),
    .io_addressIn_ready(networkUnits_4_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_4_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_4_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_4_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_4_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_4_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_4_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_4_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_4_io_addressOut_bits)
  );
  argRouteNtwUnit networkUnits_5 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_5_clock),
    .reset(networkUnits_5_reset),
    .io_addressIn_ready(networkUnits_5_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_5_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_5_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_5_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_5_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_5_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_5_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_5_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_5_io_addressOut_bits)
  );
  argRouteNtwUnit networkUnits_6 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_6_clock),
    .reset(networkUnits_6_reset),
    .io_addressIn_ready(networkUnits_6_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_6_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_6_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_6_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_6_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_6_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_6_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_6_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_6_io_addressOut_bits)
  );
  argRouteNtwUnit networkUnits_7 ( // @[argRouteNetwork.scala 52:52]
    .clock(networkUnits_7_clock),
    .reset(networkUnits_7_reset),
    .io_addressIn_ready(networkUnits_7_io_addressIn_ready),
    .io_addressIn_valid(networkUnits_7_io_addressIn_valid),
    .io_addressIn_bits(networkUnits_7_io_addressIn_bits),
    .io_peAddress_ready(networkUnits_7_io_peAddress_ready),
    .io_peAddress_valid(networkUnits_7_io_peAddress_valid),
    .io_peAddress_bits(networkUnits_7_io_peAddress_bits),
    .io_addressOut_ready(networkUnits_7_io_addressOut_ready),
    .io_addressOut_valid(networkUnits_7_io_addressOut_valid),
    .io_addressOut_bits(networkUnits_7_io_addressOut_bits)
  );
  argRouteNtwVirtUnit virtNetworkUnits_0 ( // @[argRouteNetwork.scala 67:58]
    .clock(virtNetworkUnits_0_clock),
    .reset(virtNetworkUnits_0_reset),
    .io_addressIn_ready(virtNetworkUnits_0_io_addressIn_ready),
    .io_addressIn_valid(virtNetworkUnits_0_io_addressIn_valid),
    .io_addressIn_bits(virtNetworkUnits_0_io_addressIn_bits),
    .io_vasAddressOut_ready(virtNetworkUnits_0_io_vasAddressOut_ready),
    .io_vasAddressOut_valid(virtNetworkUnits_0_io_vasAddressOut_valid),
    .io_vasAddressOut_bits(virtNetworkUnits_0_io_vasAddressOut_bits)
  );
  argRouteNtwVirtUnit_1 virtNetworkUnits_1 ( // @[argRouteNetwork.scala 67:58]
    .clock(virtNetworkUnits_1_clock),
    .reset(virtNetworkUnits_1_reset),
    .io_addressIn_ready(virtNetworkUnits_1_io_addressIn_ready),
    .io_addressIn_valid(virtNetworkUnits_1_io_addressIn_valid),
    .io_addressIn_bits(virtNetworkUnits_1_io_addressIn_bits),
    .io_vasAddressOut_ready(virtNetworkUnits_1_io_vasAddressOut_ready),
    .io_vasAddressOut_valid(virtNetworkUnits_1_io_vasAddressOut_valid),
    .io_vasAddressOut_bits(virtNetworkUnits_1_io_vasAddressOut_bits),
    .io_addressOut_ready(virtNetworkUnits_1_io_addressOut_ready),
    .io_addressOut_valid(virtNetworkUnits_1_io_addressOut_valid),
    .io_addressOut_bits(virtNetworkUnits_1_io_addressOut_bits)
  );
  argRouteNtwVirtUnit_2 virtNetworkUnits_2 ( // @[argRouteNetwork.scala 67:58]
    .clock(virtNetworkUnits_2_clock),
    .reset(virtNetworkUnits_2_reset),
    .io_addressIn_ready(virtNetworkUnits_2_io_addressIn_ready),
    .io_addressIn_valid(virtNetworkUnits_2_io_addressIn_valid),
    .io_addressIn_bits(virtNetworkUnits_2_io_addressIn_bits),
    .io_vasAddressOut_ready(virtNetworkUnits_2_io_vasAddressOut_ready),
    .io_vasAddressOut_valid(virtNetworkUnits_2_io_vasAddressOut_valid),
    .io_vasAddressOut_bits(virtNetworkUnits_2_io_vasAddressOut_bits),
    .io_addressOut_ready(virtNetworkUnits_2_io_addressOut_ready),
    .io_addressOut_valid(virtNetworkUnits_2_io_addressOut_valid),
    .io_addressOut_bits(virtNetworkUnits_2_io_addressOut_bits)
  );
  argRouteNtwVirtUnit_3 virtNetworkUnits_3 ( // @[argRouteNetwork.scala 67:58]
    .clock(virtNetworkUnits_3_clock),
    .reset(virtNetworkUnits_3_reset),
    .io_addressIn_ready(virtNetworkUnits_3_io_addressIn_ready),
    .io_addressIn_valid(virtNetworkUnits_3_io_addressIn_valid),
    .io_addressIn_bits(virtNetworkUnits_3_io_addressIn_bits),
    .io_vasAddressOut_ready(virtNetworkUnits_3_io_vasAddressOut_ready),
    .io_vasAddressOut_valid(virtNetworkUnits_3_io_vasAddressOut_valid),
    .io_vasAddressOut_bits(virtNetworkUnits_3_io_vasAddressOut_bits),
    .io_addressOut_ready(virtNetworkUnits_3_io_addressOut_ready),
    .io_addressOut_valid(virtNetworkUnits_3_io_addressOut_valid),
    .io_addressOut_bits(virtNetworkUnits_3_io_addressOut_bits)
  );
  contQueue_4 queues_0 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_0_clock),
    .reset(queues_0_reset),
    .io_addressIn_ready(queues_0_io_addressIn_ready),
    .io_addressIn_valid(queues_0_io_addressIn_valid),
    .io_addressIn_bits(queues_0_io_addressIn_bits),
    .io_addressOut_ready(queues_0_io_addressOut_ready),
    .io_addressOut_valid(queues_0_io_addressOut_valid),
    .io_addressOut_bits(queues_0_io_addressOut_bits)
  );
  contQueue_4 queues_1 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_1_clock),
    .reset(queues_1_reset),
    .io_addressIn_ready(queues_1_io_addressIn_ready),
    .io_addressIn_valid(queues_1_io_addressIn_valid),
    .io_addressIn_bits(queues_1_io_addressIn_bits),
    .io_addressOut_ready(queues_1_io_addressOut_ready),
    .io_addressOut_valid(queues_1_io_addressOut_valid),
    .io_addressOut_bits(queues_1_io_addressOut_bits)
  );
  contQueue_4 queues_2 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_2_clock),
    .reset(queues_2_reset),
    .io_addressIn_ready(queues_2_io_addressIn_ready),
    .io_addressIn_valid(queues_2_io_addressIn_valid),
    .io_addressIn_bits(queues_2_io_addressIn_bits),
    .io_addressOut_ready(queues_2_io_addressOut_ready),
    .io_addressOut_valid(queues_2_io_addressOut_valid),
    .io_addressOut_bits(queues_2_io_addressOut_bits)
  );
  contQueue_4 queues_3 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_3_clock),
    .reset(queues_3_reset),
    .io_addressIn_ready(queues_3_io_addressIn_ready),
    .io_addressIn_valid(queues_3_io_addressIn_valid),
    .io_addressIn_bits(queues_3_io_addressIn_bits),
    .io_addressOut_ready(queues_3_io_addressOut_ready),
    .io_addressOut_valid(queues_3_io_addressOut_valid),
    .io_addressOut_bits(queues_3_io_addressOut_bits)
  );
  contQueue_4 queues_4 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_4_clock),
    .reset(queues_4_reset),
    .io_addressIn_ready(queues_4_io_addressIn_ready),
    .io_addressIn_valid(queues_4_io_addressIn_valid),
    .io_addressIn_bits(queues_4_io_addressIn_bits),
    .io_addressOut_ready(queues_4_io_addressOut_ready),
    .io_addressOut_valid(queues_4_io_addressOut_valid),
    .io_addressOut_bits(queues_4_io_addressOut_bits)
  );
  contQueue_4 queues_5 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_5_clock),
    .reset(queues_5_reset),
    .io_addressIn_ready(queues_5_io_addressIn_ready),
    .io_addressIn_valid(queues_5_io_addressIn_valid),
    .io_addressIn_bits(queues_5_io_addressIn_bits),
    .io_addressOut_ready(queues_5_io_addressOut_ready),
    .io_addressOut_valid(queues_5_io_addressOut_valid),
    .io_addressOut_bits(queues_5_io_addressOut_bits)
  );
  contQueue_4 queues_6 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_6_clock),
    .reset(queues_6_reset),
    .io_addressIn_ready(queues_6_io_addressIn_ready),
    .io_addressIn_valid(queues_6_io_addressIn_valid),
    .io_addressIn_bits(queues_6_io_addressIn_bits),
    .io_addressOut_ready(queues_6_io_addressOut_ready),
    .io_addressOut_valid(queues_6_io_addressOut_valid),
    .io_addressOut_bits(queues_6_io_addressOut_bits)
  );
  contQueue_4 queues_7 ( // @[argRouteNetwork.scala 79:49]
    .clock(queues_7_clock),
    .reset(queues_7_reset),
    .io_addressIn_ready(queues_7_io_addressIn_ready),
    .io_addressIn_valid(queues_7_io_addressIn_valid),
    .io_addressIn_bits(queues_7_io_addressIn_bits),
    .io_addressOut_ready(queues_7_io_addressOut_ready),
    .io_addressOut_valid(queues_7_io_addressOut_valid),
    .io_addressOut_bits(queues_7_io_addressOut_bits)
  );
  assign io_connVAS_0_valid = virtNetworkUnits_0_io_vasAddressOut_valid; // @[argRouteNetwork.scala 107:46]
  assign io_connVAS_0_bits = virtNetworkUnits_0_io_vasAddressOut_bits; // @[argRouteNetwork.scala 107:46]
  assign io_connVAS_1_valid = virtNetworkUnits_1_io_vasAddressOut_valid; // @[argRouteNetwork.scala 107:46]
  assign io_connVAS_1_bits = virtNetworkUnits_1_io_vasAddressOut_bits; // @[argRouteNetwork.scala 107:46]
  assign io_connVAS_2_valid = virtNetworkUnits_2_io_vasAddressOut_valid; // @[argRouteNetwork.scala 107:46]
  assign io_connVAS_2_bits = virtNetworkUnits_2_io_vasAddressOut_bits; // @[argRouteNetwork.scala 107:46]
  assign io_connVAS_3_valid = virtNetworkUnits_3_io_vasAddressOut_valid; // @[argRouteNetwork.scala 107:46]
  assign io_connVAS_3_bits = virtNetworkUnits_3_io_vasAddressOut_bits; // @[argRouteNetwork.scala 107:46]
  assign io_connPE_0_ready = queues_0_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign io_connPE_1_ready = queues_1_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign io_connPE_2_ready = queues_2_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign io_connPE_3_ready = queues_3_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign io_connPE_4_ready = queues_4_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign io_connPE_5_ready = queues_5_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign io_connPE_6_ready = queues_6_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign io_connPE_7_ready = queues_7_io_addressIn_ready; // @[argRouteNetwork.scala 83:21]
  assign networkUnits_0_clock = clock;
  assign networkUnits_0_reset = reset;
  assign networkUnits_0_io_addressIn_valid = networkUnits_1_io_addressOut_valid; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_0_io_addressIn_bits = networkUnits_1_io_addressOut_bits; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_0_io_peAddress_valid = queues_0_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_0_io_peAddress_bits = queues_0_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_0_io_addressOut_ready = virtNetworkUnits_3_io_addressIn_ready; // @[argRouteNetwork.scala 99:47]
  assign networkUnits_1_clock = clock;
  assign networkUnits_1_reset = reset;
  assign networkUnits_1_io_addressIn_valid = networkUnits_2_io_addressOut_valid; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_1_io_addressIn_bits = networkUnits_2_io_addressOut_bits; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_1_io_peAddress_valid = queues_1_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_1_io_peAddress_bits = queues_1_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_1_io_addressOut_ready = networkUnits_0_io_addressIn_ready; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_2_clock = clock;
  assign networkUnits_2_reset = reset;
  assign networkUnits_2_io_addressIn_valid = networkUnits_3_io_addressOut_valid; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_2_io_addressIn_bits = networkUnits_3_io_addressOut_bits; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_2_io_peAddress_valid = queues_2_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_2_io_peAddress_bits = queues_2_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_2_io_addressOut_ready = networkUnits_1_io_addressIn_ready; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_3_clock = clock;
  assign networkUnits_3_reset = reset;
  assign networkUnits_3_io_addressIn_valid = networkUnits_4_io_addressOut_valid; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_3_io_addressIn_bits = networkUnits_4_io_addressOut_bits; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_3_io_peAddress_valid = queues_3_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_3_io_peAddress_bits = queues_3_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_3_io_addressOut_ready = networkUnits_2_io_addressIn_ready; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_4_clock = clock;
  assign networkUnits_4_reset = reset;
  assign networkUnits_4_io_addressIn_valid = networkUnits_5_io_addressOut_valid; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_4_io_addressIn_bits = networkUnits_5_io_addressOut_bits; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_4_io_peAddress_valid = queues_4_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_4_io_peAddress_bits = queues_4_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_4_io_addressOut_ready = networkUnits_3_io_addressIn_ready; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_5_clock = clock;
  assign networkUnits_5_reset = reset;
  assign networkUnits_5_io_addressIn_valid = networkUnits_6_io_addressOut_valid; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_5_io_addressIn_bits = networkUnits_6_io_addressOut_bits; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_5_io_peAddress_valid = queues_5_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_5_io_peAddress_bits = queues_5_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_5_io_addressOut_ready = networkUnits_4_io_addressIn_ready; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_6_clock = clock;
  assign networkUnits_6_reset = reset;
  assign networkUnits_6_io_addressIn_valid = networkUnits_7_io_addressOut_valid; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_6_io_addressIn_bits = networkUnits_7_io_addressOut_bits; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_6_io_peAddress_valid = queues_6_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_6_io_peAddress_bits = queues_6_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_6_io_addressOut_ready = networkUnits_5_io_addressIn_ready; // @[argRouteNetwork.scala 88:38]
  assign networkUnits_7_clock = clock;
  assign networkUnits_7_reset = reset;
  assign networkUnits_7_io_addressIn_valid = 1'h0; // @[argRouteNetwork.scala 95:50]
  assign networkUnits_7_io_addressIn_bits = 64'h0; // @[argRouteNetwork.scala 42:{46,46}]
  assign networkUnits_7_io_peAddress_valid = queues_7_io_addressOut_valid; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_7_io_peAddress_bits = queues_7_io_addressOut_bits; // @[argRouteNetwork.scala 92:38]
  assign networkUnits_7_io_addressOut_ready = networkUnits_6_io_addressIn_ready; // @[argRouteNetwork.scala 88:38]
  assign virtNetworkUnits_0_clock = clock;
  assign virtNetworkUnits_0_reset = reset;
  assign virtNetworkUnits_0_io_addressIn_valid = virtNetworkUnits_1_io_addressOut_valid; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_0_io_addressIn_bits = virtNetworkUnits_1_io_addressOut_bits; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_0_io_vasAddressOut_ready = io_connVAS_0_ready; // @[argRouteNetwork.scala 107:46]
  assign virtNetworkUnits_1_clock = clock;
  assign virtNetworkUnits_1_reset = reset;
  assign virtNetworkUnits_1_io_addressIn_valid = virtNetworkUnits_2_io_addressOut_valid; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_1_io_addressIn_bits = virtNetworkUnits_2_io_addressOut_bits; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_1_io_vasAddressOut_ready = io_connVAS_1_ready; // @[argRouteNetwork.scala 107:46]
  assign virtNetworkUnits_1_io_addressOut_ready = virtNetworkUnits_0_io_addressIn_ready; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_2_clock = clock;
  assign virtNetworkUnits_2_reset = reset;
  assign virtNetworkUnits_2_io_addressIn_valid = virtNetworkUnits_3_io_addressOut_valid; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_2_io_addressIn_bits = virtNetworkUnits_3_io_addressOut_bits; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_2_io_vasAddressOut_ready = io_connVAS_2_ready; // @[argRouteNetwork.scala 107:46]
  assign virtNetworkUnits_2_io_addressOut_ready = virtNetworkUnits_1_io_addressIn_ready; // @[argRouteNetwork.scala 103:42]
  assign virtNetworkUnits_3_clock = clock;
  assign virtNetworkUnits_3_reset = reset;
  assign virtNetworkUnits_3_io_addressIn_valid = networkUnits_0_io_addressOut_valid; // @[argRouteNetwork.scala 99:47]
  assign virtNetworkUnits_3_io_addressIn_bits = networkUnits_0_io_addressOut_bits; // @[argRouteNetwork.scala 99:47]
  assign virtNetworkUnits_3_io_vasAddressOut_ready = io_connVAS_3_ready; // @[argRouteNetwork.scala 107:46]
  assign virtNetworkUnits_3_io_addressOut_ready = virtNetworkUnits_2_io_addressIn_ready; // @[argRouteNetwork.scala 103:42]
  assign queues_0_clock = clock;
  assign queues_0_reset = reset;
  assign queues_0_io_addressIn_valid = io_connPE_0_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_0_io_addressIn_bits = io_connPE_0_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_0_io_addressOut_ready = networkUnits_0_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
  assign queues_1_clock = clock;
  assign queues_1_reset = reset;
  assign queues_1_io_addressIn_valid = io_connPE_1_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_1_io_addressIn_bits = io_connPE_1_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_1_io_addressOut_ready = networkUnits_1_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
  assign queues_2_clock = clock;
  assign queues_2_reset = reset;
  assign queues_2_io_addressIn_valid = io_connPE_2_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_2_io_addressIn_bits = io_connPE_2_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_2_io_addressOut_ready = networkUnits_2_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
  assign queues_3_clock = clock;
  assign queues_3_reset = reset;
  assign queues_3_io_addressIn_valid = io_connPE_3_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_3_io_addressIn_bits = io_connPE_3_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_3_io_addressOut_ready = networkUnits_3_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
  assign queues_4_clock = clock;
  assign queues_4_reset = reset;
  assign queues_4_io_addressIn_valid = io_connPE_4_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_4_io_addressIn_bits = io_connPE_4_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_4_io_addressOut_ready = networkUnits_4_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
  assign queues_5_clock = clock;
  assign queues_5_reset = reset;
  assign queues_5_io_addressIn_valid = io_connPE_5_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_5_io_addressIn_bits = io_connPE_5_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_5_io_addressOut_ready = networkUnits_5_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
  assign queues_6_clock = clock;
  assign queues_6_reset = reset;
  assign queues_6_io_addressIn_valid = io_connPE_6_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_6_io_addressIn_bits = io_connPE_6_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_6_io_addressOut_ready = networkUnits_6_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
  assign queues_7_clock = clock;
  assign queues_7_reset = reset;
  assign queues_7_io_addressIn_valid = io_connPE_7_valid; // @[argRouteNetwork.scala 83:21]
  assign queues_7_io_addressIn_bits = io_connPE_7_bits; // @[argRouteNetwork.scala 83:21]
  assign queues_7_io_addressOut_ready = networkUnits_7_io_peAddress_ready; // @[argRouteNetwork.scala 92:38]
endmodule
module Queue_19(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:15]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [3:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [3:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [3:0] _value_T_1 = enq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] _value_T_3 = deq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_20(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram [0:15]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [3:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [3:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [3:0] _value_T_1 = enq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] _value_T_3 = deq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {2{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[63:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module argRouteVirtServerV2(
  input          clock,
  input          reset,
  output         io_connNetwork_ready,
  input          io_connNetwork_valid,
  input  [63:0]  io_connNetwork_bits,
  input          io_connStealNtw_ctrl_serveStealReq_ready,
  output         io_connStealNtw_ctrl_serveStealReq_valid,
  input          io_connStealNtw_data_qOutTask_ready,
  output         io_connStealNtw_data_qOutTask_valid,
  output [255:0] io_connStealNtw_data_qOutTask_bits,
  input          io_read_address_ready,
  output         io_read_address_valid,
  output [63:0]  io_read_address_bits,
  output         io_read_data_ready,
  input          io_read_data_valid,
  input  [31:0]  io_read_data_bits,
  input          io_write_address_ready,
  output         io_write_address_valid,
  output [63:0]  io_write_address_bits,
  input          io_write_data_ready,
  output         io_write_data_valid,
  output [31:0]  io_write_data_bits,
  input          io_read_address_task_ready,
  output         io_read_address_task_valid,
  output [63:0]  io_read_address_task_bits,
  output         io_read_data_task_ready,
  input          io_read_data_task_valid,
  input  [31:0]  io_read_data_task_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [63:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [31:0] _RAND_12;
  reg [31:0] _RAND_13;
  reg [31:0] _RAND_14;
  reg [31:0] _RAND_15;
  reg [31:0] _RAND_16;
  reg [31:0] _RAND_17;
  reg [255:0] _RAND_18;
  reg [31:0] _RAND_19;
`endif // RANDOMIZE_REG_INIT
  wire  addrNtwInQueue_clock; // @[argRouteServerV2.scala 48:32]
  wire  addrNtwInQueue_reset; // @[argRouteServerV2.scala 48:32]
  wire  addrNtwInQueue_io_enq_ready; // @[argRouteServerV2.scala 48:32]
  wire  addrNtwInQueue_io_enq_valid; // @[argRouteServerV2.scala 48:32]
  wire [63:0] addrNtwInQueue_io_enq_bits; // @[argRouteServerV2.scala 48:32]
  wire  addrNtwInQueue_io_deq_ready; // @[argRouteServerV2.scala 48:32]
  wire  addrNtwInQueue_io_deq_valid; // @[argRouteServerV2.scala 48:32]
  wire [63:0] addrNtwInQueue_io_deq_bits; // @[argRouteServerV2.scala 48:32]
  wire  addressesOfReadyTasks_clock; // @[argRouteServerV2.scala 53:39]
  wire  addressesOfReadyTasks_reset; // @[argRouteServerV2.scala 53:39]
  wire  addressesOfReadyTasks_io_enq_ready; // @[argRouteServerV2.scala 53:39]
  wire  addressesOfReadyTasks_io_enq_valid; // @[argRouteServerV2.scala 53:39]
  wire [63:0] addressesOfReadyTasks_io_enq_bits; // @[argRouteServerV2.scala 53:39]
  wire  addressesOfReadyTasks_io_deq_ready; // @[argRouteServerV2.scala 53:39]
  wire  addressesOfReadyTasks_io_deq_valid; // @[argRouteServerV2.scala 53:39]
  wire [63:0] addressesOfReadyTasks_io_deq_bits; // @[argRouteServerV2.scala 53:39]
  wire  readyTasksQueue_clock; // @[argRouteServerV2.scala 54:33]
  wire  readyTasksQueue_reset; // @[argRouteServerV2.scala 54:33]
  wire  readyTasksQueue_io_enq_ready; // @[argRouteServerV2.scala 54:33]
  wire  readyTasksQueue_io_enq_valid; // @[argRouteServerV2.scala 54:33]
  wire [255:0] readyTasksQueue_io_enq_bits; // @[argRouteServerV2.scala 54:33]
  wire  readyTasksQueue_io_deq_ready; // @[argRouteServerV2.scala 54:33]
  wire  readyTasksQueue_io_deq_valid; // @[argRouteServerV2.scala 54:33]
  wire [255:0] readyTasksQueue_io_deq_bits; // @[argRouteServerV2.scala 54:33]
  wire [4:0] readyTasksQueue_io_count; // @[argRouteServerV2.scala 54:33]
  reg [3:0] counterStateReg; // @[argRouteServerV2.scala 78:46]
  reg [63:0] counterReg; // @[argRouteServerV2.scala 79:46]
  reg [63:0] currReadAddr; // @[argRouteServerV2.scala 80:46]
  reg [63:0] counterAddr; // @[argRouteServerV2.scala 81:46]
  reg [63:0] addrMask; // @[argRouteServerV2.scala 82:46]
  wire  _T = counterStateReg == 4'h1; // @[argRouteServerV2.scala 103:26]
  wire [63:0] _counterAddr_T = addrNtwInQueue_io_deq_bits & addrMask; // @[argRouteServerV2.scala 106:55]
  wire  _T_1 = counterStateReg == 4'h2; // @[argRouteServerV2.scala 108:32]
  wire  _T_2 = counterStateReg == 4'h3; // @[argRouteServerV2.scala 112:32]
  wire [63:0] _currReadAddr_T_1 = counterAddr + 64'h4; // @[argRouteServerV2.scala 116:41]
  wire [31:0] _counterReg_T_1 = io_read_data_bits - 32'h1; // @[argRouteServerV2.scala 119:45]
  wire [63:0] _GEN_3 = io_read_data_valid ? {{32'd0}, _counterReg_T_1} : counterReg; // @[argRouteServerV2.scala 118:39 119:24 79:46]
  wire [3:0] _GEN_4 = io_read_data_valid ? 4'h4 : counterStateReg; // @[argRouteServerV2.scala 118:39 120:29 78:46]
  wire [63:0] _GEN_5 = io_read_data_valid & io_read_data_bits == 32'h1 ? _currReadAddr_T_1 : currReadAddr; // @[argRouteServerV2.scala 113:62 116:26 80:46]
  wire [3:0] _GEN_6 = io_read_data_valid & io_read_data_bits == 32'h1 ? 4'h7 : _GEN_4; // @[argRouteServerV2.scala 113:62 117:29]
  wire [63:0] _GEN_7 = io_read_data_valid & io_read_data_bits == 32'h1 ? counterReg : _GEN_3; // @[argRouteServerV2.scala 113:62 79:46]
  wire  _T_5 = counterStateReg == 4'h4; // @[argRouteServerV2.scala 122:32]
  wire [3:0] _GEN_8 = io_write_address_ready ? 4'h5 : counterStateReg; // @[argRouteServerV2.scala 123:37 124:29 78:46]
  wire  _T_6 = counterStateReg == 4'h5; // @[argRouteServerV2.scala 126:32]
  wire [3:0] _GEN_9 = io_write_data_ready ? 4'h1 : counterStateReg; // @[argRouteServerV2.scala 127:34 128:29 78:46]
  wire  _T_7 = counterStateReg == 4'h7; // @[argRouteServerV2.scala 130:32]
  wire [3:0] _GEN_10 = addressesOfReadyTasks_io_enq_ready ? 4'h1 : counterStateReg; // @[argRouteServerV2.scala 131:49 132:29 78:46]
  wire [3:0] _GEN_11 = counterStateReg == 4'h7 ? _GEN_10 : counterStateReg; // @[argRouteServerV2.scala 130:58 78:46]
  wire [3:0] _GEN_12 = counterStateReg == 4'h5 ? _GEN_9 : _GEN_11; // @[argRouteServerV2.scala 126:60]
  wire [3:0] _GEN_13 = counterStateReg == 4'h4 ? _GEN_8 : _GEN_12; // @[argRouteServerV2.scala 122:60]
  wire  _GEN_26 = _T_6 ? 1'h0 : _T_7; // @[argRouteServerV2.scala 144:60 88:40]
  wire  _GEN_28 = _T_5 ? 1'h0 : _T_6; // @[argRouteServerV2.scala 142:60 97:27]
  wire  _GEN_29 = _T_5 ? 1'h0 : _GEN_26; // @[argRouteServerV2.scala 142:60 88:40]
  wire  _GEN_31 = _T_2 ? 1'h0 : _T_5; // @[argRouteServerV2.scala 140:59 96:27]
  wire  _GEN_32 = _T_2 ? 1'h0 : _GEN_28; // @[argRouteServerV2.scala 140:59 97:27]
  wire  _GEN_33 = _T_2 ? 1'h0 : _GEN_29; // @[argRouteServerV2.scala 140:59 88:40]
  wire  _GEN_35 = _T_1 ? 1'h0 : _T_2; // @[argRouteServerV2.scala 138:59 98:27]
  wire  _GEN_36 = _T_1 ? 1'h0 : _GEN_31; // @[argRouteServerV2.scala 138:59 96:27]
  wire  _GEN_37 = _T_1 ? 1'h0 : _GEN_32; // @[argRouteServerV2.scala 138:59 97:27]
  wire  _GEN_38 = _T_1 ? 1'h0 : _GEN_33; // @[argRouteServerV2.scala 138:59 88:40]
  reg [3:0] taskReadAddressStateReg; // @[argRouteServerV2.scala 159:50]
  reg [63:0] taskAddr; // @[argRouteServerV2.scala 160:50]
  wire  _T_14 = taskReadAddressStateReg == 4'h6; // @[argRouteServerV2.scala 170:34]
  wire  _T_15 = taskReadAddressStateReg == 4'h8; // @[argRouteServerV2.scala 176:40]
  wire [63:0] _GEN_52 = _T_15 ? taskAddr : 64'h0; // @[argRouteServerV2.scala 167:32 193:71 195:36]
  reg [3:0] taskReadStateReg; // @[argRouteServerV2.scala 206:43]
  reg [2:0] taskReadCount; // @[argRouteServerV2.scala 207:43]
  reg [31:0] taskRegisters_0; // @[argRouteServerV2.scala 208:40]
  reg [31:0] taskRegisters_1; // @[argRouteServerV2.scala 208:40]
  reg [31:0] taskRegisters_2; // @[argRouteServerV2.scala 208:40]
  reg [31:0] taskRegisters_3; // @[argRouteServerV2.scala 208:40]
  reg [31:0] taskRegisters_4; // @[argRouteServerV2.scala 208:40]
  reg [31:0] taskRegisters_5; // @[argRouteServerV2.scala 208:40]
  reg [31:0] taskRegisters_6; // @[argRouteServerV2.scala 208:40]
  reg [31:0] taskRegisters_7; // @[argRouteServerV2.scala 208:40]
  wire [223:0] _readyTasksQueue_io_enq_bits_T_5 = {taskRegisters_0,taskRegisters_1,taskRegisters_2,taskRegisters_3,
    taskRegisters_4,taskRegisters_5,taskRegisters_6}; // @[Cat.scala 33:92]
  wire  _T_18 = taskReadStateReg == 4'h9; // @[argRouteServerV2.scala 217:27]
  wire [2:0] _T_20 = taskReadCount - 3'h1; // @[argRouteServerV2.scala 220:40]
  wire  _T_25 = taskReadStateReg == 4'ha; // @[argRouteServerV2.scala 228:33]
  reg [31:0] tasksGivenAwayCount; // @[argRouteServerV2.scala 247:48]
  reg [255:0] taskReg; // @[argRouteServerV2.scala 248:34]
  reg [3:0] taskWriteStateReg; // @[argRouteServerV2.scala 249:44]
  wire  _T_28 = taskWriteStateReg == 4'hb; // @[argRouteServerV2.scala 258:28]
  wire  _T_29 = taskWriteStateReg == 4'hc; // @[argRouteServerV2.scala 263:34]
  wire [31:0] _tasksGivenAwayCount_T_1 = tasksGivenAwayCount + 32'h1; // @[argRouteServerV2.scala 266:56]
  wire [31:0] _GEN_94 = io_connStealNtw_data_qOutTask_ready ? _tasksGivenAwayCount_T_1 : tasksGivenAwayCount; // @[argRouteServerV2.scala 264:50 266:33 247:48]
  wire [31:0] _GEN_96 = taskWriteStateReg == 4'hc ? _GEN_94 : tasksGivenAwayCount; // @[argRouteServerV2.scala 247:48 263:57]
  wire [31:0] _GEN_99 = taskWriteStateReg == 4'hb ? tasksGivenAwayCount : _GEN_96; // @[argRouteServerV2.scala 247:48 258:57]
  wire [31:0] _tasksGivenAwayCount_T_3 = tasksGivenAwayCount - 32'h1; // @[argRouteServerV2.scala 293:56]
  wire [70:0] _GEN_106 = reset ? 71'h0 : 71'h1fffffffffffffffe0; // @[argRouteServerV2.scala 82:{46,46} 83:37]
  Queue_19 addrNtwInQueue ( // @[argRouteServerV2.scala 48:32]
    .clock(addrNtwInQueue_clock),
    .reset(addrNtwInQueue_reset),
    .io_enq_ready(addrNtwInQueue_io_enq_ready),
    .io_enq_valid(addrNtwInQueue_io_enq_valid),
    .io_enq_bits(addrNtwInQueue_io_enq_bits),
    .io_deq_ready(addrNtwInQueue_io_deq_ready),
    .io_deq_valid(addrNtwInQueue_io_deq_valid),
    .io_deq_bits(addrNtwInQueue_io_deq_bits)
  );
  Queue_20 addressesOfReadyTasks ( // @[argRouteServerV2.scala 53:39]
    .clock(addressesOfReadyTasks_clock),
    .reset(addressesOfReadyTasks_reset),
    .io_enq_ready(addressesOfReadyTasks_io_enq_ready),
    .io_enq_valid(addressesOfReadyTasks_io_enq_valid),
    .io_enq_bits(addressesOfReadyTasks_io_enq_bits),
    .io_deq_ready(addressesOfReadyTasks_io_deq_ready),
    .io_deq_valid(addressesOfReadyTasks_io_deq_valid),
    .io_deq_bits(addressesOfReadyTasks_io_deq_bits)
  );
  Queue_3 readyTasksQueue ( // @[argRouteServerV2.scala 54:33]
    .clock(readyTasksQueue_clock),
    .reset(readyTasksQueue_reset),
    .io_enq_ready(readyTasksQueue_io_enq_ready),
    .io_enq_valid(readyTasksQueue_io_enq_valid),
    .io_enq_bits(readyTasksQueue_io_enq_bits),
    .io_deq_ready(readyTasksQueue_io_deq_ready),
    .io_deq_valid(readyTasksQueue_io_deq_valid),
    .io_deq_bits(readyTasksQueue_io_deq_bits),
    .io_count(readyTasksQueue_io_count)
  );
  assign io_connNetwork_ready = addrNtwInQueue_io_enq_ready; // @[argRouteServerV2.scala 57:27]
  assign io_connStealNtw_ctrl_serveStealReq_valid = tasksGivenAwayCount > 32'h0 & taskWriteStateReg != 4'hc; // @[argRouteServerV2.scala 290:36]
  assign io_connStealNtw_data_qOutTask_valid = _T_28 ? 1'h0 : _T_29; // @[argRouteServerV2.scala 256:46 270:57]
  assign io_connStealNtw_data_qOutTask_bits = taskReg; // @[argRouteServerV2.scala 254:46]
  assign io_read_address_valid = _T ? 1'h0 : _T_1; // @[argRouteServerV2.scala 136:48 95:27]
  assign io_read_address_bits = counterAddr; // @[argRouteServerV2.scala 92:27]
  assign io_read_data_ready = _T ? 1'h0 : _GEN_35; // @[argRouteServerV2.scala 136:48 98:27]
  assign io_write_address_valid = _T ? 1'h0 : _GEN_36; // @[argRouteServerV2.scala 136:48 96:27]
  assign io_write_address_bits = counterAddr; // @[argRouteServerV2.scala 93:27]
  assign io_write_data_valid = _T ? 1'h0 : _GEN_37; // @[argRouteServerV2.scala 136:48 97:27]
  assign io_write_data_bits = counterReg[31:0]; // @[argRouteServerV2.scala 94:27]
  assign io_read_address_task_valid = _T_14 ? 1'h0 : _T_15; // @[argRouteServerV2.scala 168:32 191:60]
  assign io_read_address_task_bits = _T_14 ? 64'h0 : _GEN_52; // @[argRouteServerV2.scala 167:32 191:60]
  assign io_read_data_task_ready = taskReadStateReg == 4'h9; // @[argRouteServerV2.scala 235:27]
  assign addrNtwInQueue_clock = clock;
  assign addrNtwInQueue_reset = reset;
  assign addrNtwInQueue_io_enq_valid = io_connNetwork_valid; // @[argRouteServerV2.scala 57:27]
  assign addrNtwInQueue_io_enq_bits = io_connNetwork_bits; // @[argRouteServerV2.scala 57:27]
  assign addrNtwInQueue_io_deq_ready = counterStateReg == 4'h1; // @[argRouteServerV2.scala 136:26]
  assign addressesOfReadyTasks_clock = clock;
  assign addressesOfReadyTasks_reset = reset;
  assign addressesOfReadyTasks_io_enq_valid = _T ? 1'h0 : _GEN_38; // @[argRouteServerV2.scala 136:48 88:40]
  assign addressesOfReadyTasks_io_enq_bits = currReadAddr; // @[argRouteServerV2.scala 89:40]
  assign addressesOfReadyTasks_io_deq_ready = taskReadAddressStateReg == 4'h6; // @[argRouteServerV2.scala 191:34]
  assign readyTasksQueue_clock = clock;
  assign readyTasksQueue_reset = reset;
  assign readyTasksQueue_io_enq_valid = _T_18 ? 1'h0 : _T_25; // @[argRouteServerV2.scala 211:34 235:46]
  assign readyTasksQueue_io_enq_bits = {_readyTasksQueue_io_enq_bits_T_5,taskRegisters_7}; // @[Cat.scala 33:92]
  assign readyTasksQueue_io_deq_ready = taskWriteStateReg == 4'hb; // @[argRouteServerV2.scala 270:28]
  always @(posedge clock) begin
    if (reset) begin // @[argRouteServerV2.scala 78:46]
      counterStateReg <= 4'h1; // @[argRouteServerV2.scala 78:46]
    end else if (counterStateReg == 4'h1) begin // @[argRouteServerV2.scala 103:48]
      if (addrNtwInQueue_io_deq_valid) begin // @[argRouteServerV2.scala 104:42]
        counterStateReg <= 4'h2; // @[argRouteServerV2.scala 105:32]
      end
    end else if (counterStateReg == 4'h2) begin // @[argRouteServerV2.scala 108:59]
      if (io_read_address_ready) begin // @[argRouteServerV2.scala 109:36]
        counterStateReg <= 4'h3; // @[argRouteServerV2.scala 110:29]
      end
    end else if (counterStateReg == 4'h3) begin // @[argRouteServerV2.scala 112:59]
      counterStateReg <= _GEN_6;
    end else begin
      counterStateReg <= _GEN_13;
    end
    if (reset) begin // @[argRouteServerV2.scala 79:46]
      counterReg <= 64'h0; // @[argRouteServerV2.scala 79:46]
    end else if (!(counterStateReg == 4'h1)) begin // @[argRouteServerV2.scala 103:48]
      if (!(counterStateReg == 4'h2)) begin // @[argRouteServerV2.scala 108:59]
        if (counterStateReg == 4'h3) begin // @[argRouteServerV2.scala 112:59]
          counterReg <= _GEN_7;
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 80:46]
      currReadAddr <= 64'h0; // @[argRouteServerV2.scala 80:46]
    end else if (!(counterStateReg == 4'h1)) begin // @[argRouteServerV2.scala 103:48]
      if (!(counterStateReg == 4'h2)) begin // @[argRouteServerV2.scala 108:59]
        if (counterStateReg == 4'h3) begin // @[argRouteServerV2.scala 112:59]
          currReadAddr <= _GEN_5;
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 81:46]
      counterAddr <= 64'h0; // @[argRouteServerV2.scala 81:46]
    end else if (counterStateReg == 4'h1) begin // @[argRouteServerV2.scala 103:48]
      if (addrNtwInQueue_io_deq_valid) begin // @[argRouteServerV2.scala 104:42]
        counterAddr <= _counterAddr_T; // @[argRouteServerV2.scala 106:25]
      end
    end
    addrMask <= _GEN_106[63:0]; // @[argRouteServerV2.scala 82:{46,46} 83:37]
    if (reset) begin // @[argRouteServerV2.scala 159:50]
      taskReadAddressStateReg <= 4'h6; // @[argRouteServerV2.scala 159:50]
    end else if (taskReadAddressStateReg == 4'h6) begin // @[argRouteServerV2.scala 170:60]
      if (addressesOfReadyTasks_io_deq_valid) begin // @[argRouteServerV2.scala 171:49]
        taskReadAddressStateReg <= 4'h8; // @[argRouteServerV2.scala 172:37]
      end
    end else if (taskReadAddressStateReg == 4'h8) begin // @[argRouteServerV2.scala 176:71]
      if (io_read_address_task_ready) begin // @[argRouteServerV2.scala 186:41]
        taskReadAddressStateReg <= 4'h6; // @[argRouteServerV2.scala 187:45]
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 160:50]
      taskAddr <= 64'h0; // @[argRouteServerV2.scala 160:50]
    end else if (taskReadAddressStateReg == 4'h6) begin // @[argRouteServerV2.scala 170:60]
      if (addressesOfReadyTasks_io_deq_valid) begin // @[argRouteServerV2.scala 171:49]
        taskAddr <= addressesOfReadyTasks_io_deq_bits; // @[argRouteServerV2.scala 173:22]
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 206:43]
      taskReadStateReg <= 4'h9; // @[argRouteServerV2.scala 206:43]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (taskReadCount == 3'h1 & io_read_data_task_valid) begin // @[argRouteServerV2.scala 224:63]
        taskReadStateReg <= 4'ha; // @[argRouteServerV2.scala 225:38]
      end
    end else if (taskReadStateReg == 4'ha) begin // @[argRouteServerV2.scala 228:61]
      if (readyTasksQueue_io_enq_ready) begin // @[argRouteServerV2.scala 229:43]
        taskReadStateReg <= 4'h9; // @[argRouteServerV2.scala 230:30]
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 207:43]
      taskReadCount <= 3'h7; // @[argRouteServerV2.scala 207:43]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        taskReadCount <= _T_20; // @[argRouteServerV2.scala 221:27]
      end
    end else if (taskReadStateReg == 4'ha) begin // @[argRouteServerV2.scala 228:61]
      if (readyTasksQueue_io_enq_ready) begin // @[argRouteServerV2.scala 229:43]
        taskReadCount <= 3'h7; // @[argRouteServerV2.scala 231:30]
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_0 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h0 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_0 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_1 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h1 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_1 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_2 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h2 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_2 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_3 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h3 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_3 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_4 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h4 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_4 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_5 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h5 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_5 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_6 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h6 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_6 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 208:40]
      taskRegisters_7 <= 32'h0; // @[argRouteServerV2.scala 208:40]
    end else if (taskReadStateReg == 4'h9) begin // @[argRouteServerV2.scala 217:46]
      if (io_read_data_task_valid) begin // @[argRouteServerV2.scala 219:38]
        if (3'h7 == _T_20) begin // @[argRouteServerV2.scala 220:46]
          taskRegisters_7 <= io_read_data_task_bits; // @[argRouteServerV2.scala 220:46]
        end
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 247:48]
      tasksGivenAwayCount <= 32'h0; // @[argRouteServerV2.scala 247:48]
    end else if (tasksGivenAwayCount > 32'h0 & taskWriteStateReg != 4'hc) begin // @[argRouteServerV2.scala 290:80]
      if (io_connStealNtw_ctrl_serveStealReq_ready) begin // @[argRouteServerV2.scala 292:55]
        tasksGivenAwayCount <= _tasksGivenAwayCount_T_3; // @[argRouteServerV2.scala 293:33]
      end else begin
        tasksGivenAwayCount <= _GEN_99;
      end
    end else begin
      tasksGivenAwayCount <= _GEN_99;
    end
    if (reset) begin // @[argRouteServerV2.scala 248:34]
      taskReg <= 256'h0; // @[argRouteServerV2.scala 248:34]
    end else if (taskWriteStateReg == 4'hb) begin // @[argRouteServerV2.scala 258:57]
      if (readyTasksQueue_io_deq_valid) begin // @[argRouteServerV2.scala 259:43]
        taskReg <= readyTasksQueue_io_deq_bits; // @[argRouteServerV2.scala 261:21]
      end
    end
    if (reset) begin // @[argRouteServerV2.scala 249:44]
      taskWriteStateReg <= 4'hb; // @[argRouteServerV2.scala 249:44]
    end else if (taskWriteStateReg == 4'hb) begin // @[argRouteServerV2.scala 258:57]
      if (readyTasksQueue_io_deq_valid) begin // @[argRouteServerV2.scala 259:43]
        taskWriteStateReg <= 4'hc; // @[argRouteServerV2.scala 260:31]
      end
    end else if (taskWriteStateReg == 4'hc) begin // @[argRouteServerV2.scala 263:57]
      if (io_connStealNtw_data_qOutTask_ready) begin // @[argRouteServerV2.scala 264:50]
        taskWriteStateReg <= 4'hb; // @[argRouteServerV2.scala 265:31]
      end
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  counterStateReg = _RAND_0[3:0];
  _RAND_1 = {2{`RANDOM}};
  counterReg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  currReadAddr = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  counterAddr = _RAND_3[63:0];
  _RAND_4 = {2{`RANDOM}};
  addrMask = _RAND_4[63:0];
  _RAND_5 = {1{`RANDOM}};
  taskReadAddressStateReg = _RAND_5[3:0];
  _RAND_6 = {2{`RANDOM}};
  taskAddr = _RAND_6[63:0];
  _RAND_7 = {1{`RANDOM}};
  taskReadStateReg = _RAND_7[3:0];
  _RAND_8 = {1{`RANDOM}};
  taskReadCount = _RAND_8[2:0];
  _RAND_9 = {1{`RANDOM}};
  taskRegisters_0 = _RAND_9[31:0];
  _RAND_10 = {1{`RANDOM}};
  taskRegisters_1 = _RAND_10[31:0];
  _RAND_11 = {1{`RANDOM}};
  taskRegisters_2 = _RAND_11[31:0];
  _RAND_12 = {1{`RANDOM}};
  taskRegisters_3 = _RAND_12[31:0];
  _RAND_13 = {1{`RANDOM}};
  taskRegisters_4 = _RAND_13[31:0];
  _RAND_14 = {1{`RANDOM}};
  taskRegisters_5 = _RAND_14[31:0];
  _RAND_15 = {1{`RANDOM}};
  taskRegisters_6 = _RAND_15[31:0];
  _RAND_16 = {1{`RANDOM}};
  taskRegisters_7 = _RAND_16[31:0];
  _RAND_17 = {1{`RANDOM}};
  tasksGivenAwayCount = _RAND_17[31:0];
  _RAND_18 = {8{`RANDOM}};
  taskReg = _RAND_18[255:0];
  _RAND_19 = {1{`RANDOM}};
  taskWriteStateReg = _RAND_19[3:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module readyValidMem_2(
  input         clock,
  input         reset,
  output        io_read_address_ready,
  input         io_read_address_valid,
  input  [63:0] io_read_address_bits,
  input         io_read_data_ready,
  output        io_read_data_valid,
  output [31:0] io_read_data_bits,
  output        io_write_address_ready,
  input         io_write_address_valid,
  input  [63:0] io_write_address_bits,
  output        io_write_data_ready,
  input         io_write_data_valid,
  input  [31:0] io_write_data_bits,
  input         axi_ARREADY,
  output        axi_ARVALID,
  output [63:0] axi_ARADDR,
  output        axi_RREADY,
  input         axi_RVALID,
  input  [31:0] axi_RDATA,
  input         axi_AWREADY,
  output        axi_AWVALID,
  output [63:0] axi_AWADDR,
  input         axi_WREADY,
  output        axi_WVALID,
  output [31:0] axi_WDATA,
  input         axi_BVALID
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] writeDataDone; // @[readyValidMem.scala 47:30]
  reg  writeHandshakeDetector; // @[readyValidMem.scala 49:39]
  wire  _T_2 = writeDataDone == 2'h1; // @[readyValidMem.scala 100:32]
  wire  _GEN_2 = axi_BVALID ? 1'h0 : writeHandshakeDetector; // @[readyValidMem.scala 107:34 108:34 49:39]
  wire  _GEN_4 = io_write_data_valid & axi_WREADY & ~writeHandshakeDetector | _GEN_2; // @[readyValidMem.scala 104:82 106:34]
  assign io_read_address_ready = axi_ARREADY; // @[readyValidMem.scala 155:31]
  assign io_read_data_valid = axi_RVALID; // @[readyValidMem.scala 171:31]
  assign io_read_data_bits = axi_RDATA; // @[readyValidMem.scala 172:31]
  assign io_write_address_ready = axi_AWREADY; // @[readyValidMem.scala 143:32]
  assign io_write_data_ready = _T_2 & axi_BVALID; // @[readyValidMem.scala 111:62]
  assign axi_ARVALID = io_read_address_valid; // @[readyValidMem.scala 153:31]
  assign axi_ARADDR = io_read_address_bits; // @[readyValidMem.scala 154:31]
  assign axi_RREADY = io_read_data_ready; // @[readyValidMem.scala 169:31]
  assign axi_AWVALID = io_write_address_valid; // @[readyValidMem.scala 116:28]
  assign axi_AWADDR = io_write_address_bits; // @[readyValidMem.scala 117:28]
  assign axi_WVALID = io_write_data_valid & axi_WREADY & ~writeHandshakeDetector; // @[readyValidMem.scala 104:55]
  assign axi_WDATA = io_write_data_bits; // @[readyValidMem.scala 130:28]
  always @(posedge clock) begin
    if (reset) begin // @[readyValidMem.scala 47:30]
      writeDataDone <= 2'h0; // @[readyValidMem.scala 47:30]
    end else if (writeDataDone == 2'h0 & axi_WREADY) begin // @[readyValidMem.scala 98:53]
      writeDataDone <= 2'h1; // @[readyValidMem.scala 99:23]
    end else if (writeDataDone == 2'h1 & axi_BVALID) begin // @[readyValidMem.scala 100:59]
      writeDataDone <= 2'h0; // @[readyValidMem.scala 101:23]
    end
    if (reset) begin // @[readyValidMem.scala 49:39]
      writeHandshakeDetector <= 1'h0; // @[readyValidMem.scala 49:39]
    end else begin
      writeHandshakeDetector <= _GEN_4;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  writeDataDone = _RAND_0[1:0];
  _RAND_1 = {1{`RANDOM}};
  writeHandshakeDetector = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module readyValidMem_6(
  output        io_read_address_ready,
  input         io_read_address_valid,
  input  [63:0] io_read_address_bits,
  input         io_read_data_ready,
  output        io_read_data_valid,
  output [31:0] io_read_data_bits,
  input         axi_ARREADY,
  output        axi_ARVALID,
  output [63:0] axi_ARADDR,
  output        axi_RREADY,
  input         axi_RVALID,
  input  [31:0] axi_RDATA
);
  assign io_read_address_ready = axi_ARREADY; // @[readyValidMem.scala 155:31]
  assign io_read_data_valid = axi_RVALID; // @[readyValidMem.scala 171:31]
  assign io_read_data_bits = axi_RDATA; // @[readyValidMem.scala 172:31]
  assign axi_ARVALID = io_read_address_valid; // @[readyValidMem.scala 153:31]
  assign axi_ARADDR = io_read_address_bits; // @[readyValidMem.scala 154:31]
  assign axi_RREADY = io_read_data_ready; // @[readyValidMem.scala 169:31]
endmodule
module syncSide(
  input          clock,
  input          reset,
  output         io_addrIn_0_TREADY,
  input          io_addrIn_0_TVALID,
  input  [63:0]  io_addrIn_0_TDATA,
  output         io_addrIn_1_TREADY,
  input          io_addrIn_1_TVALID,
  input  [63:0]  io_addrIn_1_TDATA,
  output         io_addrIn_2_TREADY,
  input          io_addrIn_2_TVALID,
  input  [63:0]  io_addrIn_2_TDATA,
  output         io_addrIn_3_TREADY,
  input          io_addrIn_3_TVALID,
  input  [63:0]  io_addrIn_3_TDATA,
  output         io_addrIn_4_TREADY,
  input          io_addrIn_4_TVALID,
  input  [63:0]  io_addrIn_4_TDATA,
  output         io_addrIn_5_TREADY,
  input          io_addrIn_5_TVALID,
  input  [63:0]  io_addrIn_5_TDATA,
  output         io_addrIn_6_TREADY,
  input          io_addrIn_6_TVALID,
  input  [63:0]  io_addrIn_6_TDATA,
  output         io_addrIn_7_TREADY,
  input          io_addrIn_7_TVALID,
  input  [63:0]  io_addrIn_7_TDATA,
  input          io_axi_full_argRoute_0_ARREADY,
  output         io_axi_full_argRoute_0_ARVALID,
  output [63:0]  io_axi_full_argRoute_0_ARADDR,
  output         io_axi_full_argRoute_0_RREADY,
  input          io_axi_full_argRoute_0_RVALID,
  input  [31:0]  io_axi_full_argRoute_0_RDATA,
  input          io_axi_full_argRoute_0_AWREADY,
  output         io_axi_full_argRoute_0_AWVALID,
  output [63:0]  io_axi_full_argRoute_0_AWADDR,
  input          io_axi_full_argRoute_0_WREADY,
  output         io_axi_full_argRoute_0_WVALID,
  output [31:0]  io_axi_full_argRoute_0_WDATA,
  input          io_axi_full_argRoute_0_BVALID,
  input          io_axi_full_argRoute_1_ARREADY,
  output         io_axi_full_argRoute_1_ARVALID,
  output [63:0]  io_axi_full_argRoute_1_ARADDR,
  output         io_axi_full_argRoute_1_RREADY,
  input          io_axi_full_argRoute_1_RVALID,
  input  [31:0]  io_axi_full_argRoute_1_RDATA,
  input          io_axi_full_argRoute_1_AWREADY,
  output         io_axi_full_argRoute_1_AWVALID,
  output [63:0]  io_axi_full_argRoute_1_AWADDR,
  input          io_axi_full_argRoute_1_WREADY,
  output         io_axi_full_argRoute_1_WVALID,
  output [31:0]  io_axi_full_argRoute_1_WDATA,
  input          io_axi_full_argRoute_1_BVALID,
  input          io_axi_full_argRoute_2_ARREADY,
  output         io_axi_full_argRoute_2_ARVALID,
  output [63:0]  io_axi_full_argRoute_2_ARADDR,
  output         io_axi_full_argRoute_2_RREADY,
  input          io_axi_full_argRoute_2_RVALID,
  input  [31:0]  io_axi_full_argRoute_2_RDATA,
  input          io_axi_full_argRoute_2_AWREADY,
  output         io_axi_full_argRoute_2_AWVALID,
  output [63:0]  io_axi_full_argRoute_2_AWADDR,
  input          io_axi_full_argRoute_2_WREADY,
  output         io_axi_full_argRoute_2_WVALID,
  output [31:0]  io_axi_full_argRoute_2_WDATA,
  input          io_axi_full_argRoute_2_BVALID,
  input          io_axi_full_argRoute_3_ARREADY,
  output         io_axi_full_argRoute_3_ARVALID,
  output [63:0]  io_axi_full_argRoute_3_ARADDR,
  output         io_axi_full_argRoute_3_RREADY,
  input          io_axi_full_argRoute_3_RVALID,
  input  [31:0]  io_axi_full_argRoute_3_RDATA,
  input          io_axi_full_argRoute_3_AWREADY,
  output         io_axi_full_argRoute_3_AWVALID,
  output [63:0]  io_axi_full_argRoute_3_AWADDR,
  input          io_axi_full_argRoute_3_WREADY,
  output         io_axi_full_argRoute_3_WVALID,
  output [31:0]  io_axi_full_argRoute_3_WDATA,
  input          io_axi_full_argRoute_3_BVALID,
  input          io_axi_full_argRoute_4_ARREADY,
  output         io_axi_full_argRoute_4_ARVALID,
  output [63:0]  io_axi_full_argRoute_4_ARADDR,
  output         io_axi_full_argRoute_4_RREADY,
  input          io_axi_full_argRoute_4_RVALID,
  input  [31:0]  io_axi_full_argRoute_4_RDATA,
  input          io_axi_full_argRoute_5_ARREADY,
  output         io_axi_full_argRoute_5_ARVALID,
  output [63:0]  io_axi_full_argRoute_5_ARADDR,
  output         io_axi_full_argRoute_5_RREADY,
  input          io_axi_full_argRoute_5_RVALID,
  input  [31:0]  io_axi_full_argRoute_5_RDATA,
  input          io_axi_full_argRoute_6_ARREADY,
  output         io_axi_full_argRoute_6_ARVALID,
  output [63:0]  io_axi_full_argRoute_6_ARADDR,
  output         io_axi_full_argRoute_6_RREADY,
  input          io_axi_full_argRoute_6_RVALID,
  input  [31:0]  io_axi_full_argRoute_6_RDATA,
  input          io_axi_full_argRoute_7_ARREADY,
  output         io_axi_full_argRoute_7_ARVALID,
  output [63:0]  io_axi_full_argRoute_7_ARADDR,
  output         io_axi_full_argRoute_7_RREADY,
  input          io_axi_full_argRoute_7_RVALID,
  input  [31:0]  io_axi_full_argRoute_7_RDATA,
  input          connStealNtw_0_ctrl_serveStealReq_ready,
  output         connStealNtw_0_ctrl_serveStealReq_valid,
  input          connStealNtw_0_data_qOutTask_ready,
  output         connStealNtw_0_data_qOutTask_valid,
  output [255:0] connStealNtw_0_data_qOutTask_bits,
  input          connStealNtw_1_ctrl_serveStealReq_ready,
  output         connStealNtw_1_ctrl_serveStealReq_valid,
  input          connStealNtw_1_data_qOutTask_ready,
  output         connStealNtw_1_data_qOutTask_valid,
  output [255:0] connStealNtw_1_data_qOutTask_bits,
  input          connStealNtw_2_ctrl_serveStealReq_ready,
  output         connStealNtw_2_ctrl_serveStealReq_valid,
  input          connStealNtw_2_data_qOutTask_ready,
  output         connStealNtw_2_data_qOutTask_valid,
  output [255:0] connStealNtw_2_data_qOutTask_bits,
  input          connStealNtw_3_ctrl_serveStealReq_ready,
  output         connStealNtw_3_ctrl_serveStealReq_valid,
  input          connStealNtw_3_data_qOutTask_ready,
  output         connStealNtw_3_data_qOutTask_valid,
  output [255:0] connStealNtw_3_data_qOutTask_bits
);
  wire  argSide_clock; // @[syncSide.scala 46:25]
  wire  argSide_reset; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_0_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_0_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connVAS_0_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_1_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_1_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connVAS_1_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_2_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_2_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connVAS_2_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_3_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connVAS_3_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connVAS_3_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_0_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_0_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_0_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_1_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_1_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_1_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_2_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_2_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_2_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_3_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_3_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_3_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_4_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_4_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_4_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_5_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_5_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_5_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_6_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_6_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_6_bits; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_7_ready; // @[syncSide.scala 46:25]
  wire  argSide_io_connPE_7_valid; // @[syncSide.scala 46:25]
  wire [63:0] argSide_io_connPE_7_bits; // @[syncSide.scala 46:25]
  wire  argRouteServers_0_clock; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_reset; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_connNetwork_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_connNetwork_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_0_io_connNetwork_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_connStealNtw_ctrl_serveStealReq_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_connStealNtw_data_qOutTask_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 55:15]
  wire [255:0] argRouteServers_0_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_0_io_read_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_0_io_read_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_write_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_write_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_0_io_write_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_write_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_write_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_0_io_write_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_address_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_address_task_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_0_io_read_address_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_data_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_0_io_read_data_task_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_0_io_read_data_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_clock; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_reset; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_connNetwork_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_connNetwork_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_1_io_connNetwork_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_connStealNtw_ctrl_serveStealReq_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_connStealNtw_data_qOutTask_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 55:15]
  wire [255:0] argRouteServers_1_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_1_io_read_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_1_io_read_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_write_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_write_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_1_io_write_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_write_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_write_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_1_io_write_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_address_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_address_task_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_1_io_read_address_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_data_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_1_io_read_data_task_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_1_io_read_data_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_clock; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_reset; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_connNetwork_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_connNetwork_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_2_io_connNetwork_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_connStealNtw_ctrl_serveStealReq_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_connStealNtw_data_qOutTask_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 55:15]
  wire [255:0] argRouteServers_2_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_2_io_read_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_2_io_read_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_write_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_write_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_2_io_write_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_write_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_write_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_2_io_write_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_address_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_address_task_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_2_io_read_address_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_data_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_2_io_read_data_task_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_2_io_read_data_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_clock; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_reset; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_connNetwork_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_connNetwork_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_3_io_connNetwork_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_connStealNtw_ctrl_serveStealReq_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_connStealNtw_data_qOutTask_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 55:15]
  wire [255:0] argRouteServers_3_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_3_io_read_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_3_io_read_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_write_address_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_write_address_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_3_io_write_address_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_write_data_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_write_data_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_3_io_write_data_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_address_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_address_task_valid; // @[syncSide.scala 55:15]
  wire [63:0] argRouteServers_3_io_read_address_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_data_task_ready; // @[syncSide.scala 55:15]
  wire  argRouteServers_3_io_read_data_task_valid; // @[syncSide.scala 55:15]
  wire [31:0] argRouteServers_3_io_read_data_task_bits; // @[syncSide.scala 55:15]
  wire  argRouteRvm_0_clock; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_reset; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_read_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_read_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_0_io_read_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_read_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_read_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_0_io_read_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_write_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_write_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_0_io_write_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_write_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_io_write_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_0_io_write_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_ARREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_ARVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_0_axi_ARADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_RREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_RVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_0_axi_RDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_AWREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_AWVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_0_axi_AWADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_WREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_WVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_0_axi_WDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_0_axi_BVALID; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_clock; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_reset; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_read_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_read_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_1_io_read_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_read_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_read_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_1_io_read_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_write_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_write_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_1_io_write_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_write_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_io_write_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_1_io_write_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_ARREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_ARVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_1_axi_ARADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_RREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_RVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_1_axi_RDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_AWREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_AWVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_1_axi_AWADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_WREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_WVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_1_axi_WDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_1_axi_BVALID; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_clock; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_reset; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_read_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_read_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_2_io_read_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_read_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_read_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_2_io_read_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_write_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_write_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_2_io_write_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_write_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_io_write_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_2_io_write_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_ARREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_ARVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_2_axi_ARADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_RREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_RVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_2_axi_RDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_AWREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_AWVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_2_axi_AWADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_WREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_WVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_2_axi_WDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_2_axi_BVALID; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_clock; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_reset; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_read_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_read_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_3_io_read_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_read_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_read_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_3_io_read_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_write_address_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_write_address_valid; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_3_io_write_address_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_write_data_ready; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_io_write_data_valid; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_3_io_write_data_bits; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_ARREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_ARVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_3_axi_ARADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_RREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_RVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_3_axi_RDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_AWREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_AWVALID; // @[syncSide.scala 65:67]
  wire [63:0] argRouteRvm_3_axi_AWADDR; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_WREADY; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_WVALID; // @[syncSide.scala 65:67]
  wire [31:0] argRouteRvm_3_axi_WDATA; // @[syncSide.scala 65:67]
  wire  argRouteRvm_3_axi_BVALID; // @[syncSide.scala 65:67]
  wire  argRouteRvmReadOnly_0_io_read_address_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_0_io_read_address_valid; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_0_io_read_address_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_0_io_read_data_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_0_io_read_data_valid; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_0_io_read_data_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_0_axi_ARREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_0_axi_ARVALID; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_0_axi_ARADDR; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_0_axi_RREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_0_axi_RVALID; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_0_axi_RDATA; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_io_read_address_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_io_read_address_valid; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_1_io_read_address_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_io_read_data_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_io_read_data_valid; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_1_io_read_data_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_axi_ARREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_axi_ARVALID; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_1_axi_ARADDR; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_axi_RREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_1_axi_RVALID; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_1_axi_RDATA; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_io_read_address_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_io_read_address_valid; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_2_io_read_address_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_io_read_data_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_io_read_data_valid; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_2_io_read_data_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_axi_ARREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_axi_ARVALID; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_2_axi_ARADDR; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_axi_RREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_2_axi_RVALID; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_2_axi_RDATA; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_io_read_address_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_io_read_address_valid; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_3_io_read_address_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_io_read_data_ready; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_io_read_data_valid; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_3_io_read_data_bits; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_axi_ARREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_axi_ARVALID; // @[syncSide.scala 66:69]
  wire [63:0] argRouteRvmReadOnly_3_axi_ARADDR; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_axi_RREADY; // @[syncSide.scala 66:69]
  wire  argRouteRvmReadOnly_3_axi_RVALID; // @[syncSide.scala 66:69]
  wire [31:0] argRouteRvmReadOnly_3_axi_RDATA; // @[syncSide.scala 66:69]
  argRouteNetwork argSide ( // @[syncSide.scala 46:25]
    .clock(argSide_clock),
    .reset(argSide_reset),
    .io_connVAS_0_ready(argSide_io_connVAS_0_ready),
    .io_connVAS_0_valid(argSide_io_connVAS_0_valid),
    .io_connVAS_0_bits(argSide_io_connVAS_0_bits),
    .io_connVAS_1_ready(argSide_io_connVAS_1_ready),
    .io_connVAS_1_valid(argSide_io_connVAS_1_valid),
    .io_connVAS_1_bits(argSide_io_connVAS_1_bits),
    .io_connVAS_2_ready(argSide_io_connVAS_2_ready),
    .io_connVAS_2_valid(argSide_io_connVAS_2_valid),
    .io_connVAS_2_bits(argSide_io_connVAS_2_bits),
    .io_connVAS_3_ready(argSide_io_connVAS_3_ready),
    .io_connVAS_3_valid(argSide_io_connVAS_3_valid),
    .io_connVAS_3_bits(argSide_io_connVAS_3_bits),
    .io_connPE_0_ready(argSide_io_connPE_0_ready),
    .io_connPE_0_valid(argSide_io_connPE_0_valid),
    .io_connPE_0_bits(argSide_io_connPE_0_bits),
    .io_connPE_1_ready(argSide_io_connPE_1_ready),
    .io_connPE_1_valid(argSide_io_connPE_1_valid),
    .io_connPE_1_bits(argSide_io_connPE_1_bits),
    .io_connPE_2_ready(argSide_io_connPE_2_ready),
    .io_connPE_2_valid(argSide_io_connPE_2_valid),
    .io_connPE_2_bits(argSide_io_connPE_2_bits),
    .io_connPE_3_ready(argSide_io_connPE_3_ready),
    .io_connPE_3_valid(argSide_io_connPE_3_valid),
    .io_connPE_3_bits(argSide_io_connPE_3_bits),
    .io_connPE_4_ready(argSide_io_connPE_4_ready),
    .io_connPE_4_valid(argSide_io_connPE_4_valid),
    .io_connPE_4_bits(argSide_io_connPE_4_bits),
    .io_connPE_5_ready(argSide_io_connPE_5_ready),
    .io_connPE_5_valid(argSide_io_connPE_5_valid),
    .io_connPE_5_bits(argSide_io_connPE_5_bits),
    .io_connPE_6_ready(argSide_io_connPE_6_ready),
    .io_connPE_6_valid(argSide_io_connPE_6_valid),
    .io_connPE_6_bits(argSide_io_connPE_6_bits),
    .io_connPE_7_ready(argSide_io_connPE_7_ready),
    .io_connPE_7_valid(argSide_io_connPE_7_valid),
    .io_connPE_7_bits(argSide_io_connPE_7_bits)
  );
  argRouteVirtServerV2 argRouteServers_0 ( // @[syncSide.scala 55:15]
    .clock(argRouteServers_0_clock),
    .reset(argRouteServers_0_reset),
    .io_connNetwork_ready(argRouteServers_0_io_connNetwork_ready),
    .io_connNetwork_valid(argRouteServers_0_io_connNetwork_valid),
    .io_connNetwork_bits(argRouteServers_0_io_connNetwork_bits),
    .io_connStealNtw_ctrl_serveStealReq_ready(argRouteServers_0_io_connStealNtw_ctrl_serveStealReq_ready),
    .io_connStealNtw_ctrl_serveStealReq_valid(argRouteServers_0_io_connStealNtw_ctrl_serveStealReq_valid),
    .io_connStealNtw_data_qOutTask_ready(argRouteServers_0_io_connStealNtw_data_qOutTask_ready),
    .io_connStealNtw_data_qOutTask_valid(argRouteServers_0_io_connStealNtw_data_qOutTask_valid),
    .io_connStealNtw_data_qOutTask_bits(argRouteServers_0_io_connStealNtw_data_qOutTask_bits),
    .io_read_address_ready(argRouteServers_0_io_read_address_ready),
    .io_read_address_valid(argRouteServers_0_io_read_address_valid),
    .io_read_address_bits(argRouteServers_0_io_read_address_bits),
    .io_read_data_ready(argRouteServers_0_io_read_data_ready),
    .io_read_data_valid(argRouteServers_0_io_read_data_valid),
    .io_read_data_bits(argRouteServers_0_io_read_data_bits),
    .io_write_address_ready(argRouteServers_0_io_write_address_ready),
    .io_write_address_valid(argRouteServers_0_io_write_address_valid),
    .io_write_address_bits(argRouteServers_0_io_write_address_bits),
    .io_write_data_ready(argRouteServers_0_io_write_data_ready),
    .io_write_data_valid(argRouteServers_0_io_write_data_valid),
    .io_write_data_bits(argRouteServers_0_io_write_data_bits),
    .io_read_address_task_ready(argRouteServers_0_io_read_address_task_ready),
    .io_read_address_task_valid(argRouteServers_0_io_read_address_task_valid),
    .io_read_address_task_bits(argRouteServers_0_io_read_address_task_bits),
    .io_read_data_task_ready(argRouteServers_0_io_read_data_task_ready),
    .io_read_data_task_valid(argRouteServers_0_io_read_data_task_valid),
    .io_read_data_task_bits(argRouteServers_0_io_read_data_task_bits)
  );
  argRouteVirtServerV2 argRouteServers_1 ( // @[syncSide.scala 55:15]
    .clock(argRouteServers_1_clock),
    .reset(argRouteServers_1_reset),
    .io_connNetwork_ready(argRouteServers_1_io_connNetwork_ready),
    .io_connNetwork_valid(argRouteServers_1_io_connNetwork_valid),
    .io_connNetwork_bits(argRouteServers_1_io_connNetwork_bits),
    .io_connStealNtw_ctrl_serveStealReq_ready(argRouteServers_1_io_connStealNtw_ctrl_serveStealReq_ready),
    .io_connStealNtw_ctrl_serveStealReq_valid(argRouteServers_1_io_connStealNtw_ctrl_serveStealReq_valid),
    .io_connStealNtw_data_qOutTask_ready(argRouteServers_1_io_connStealNtw_data_qOutTask_ready),
    .io_connStealNtw_data_qOutTask_valid(argRouteServers_1_io_connStealNtw_data_qOutTask_valid),
    .io_connStealNtw_data_qOutTask_bits(argRouteServers_1_io_connStealNtw_data_qOutTask_bits),
    .io_read_address_ready(argRouteServers_1_io_read_address_ready),
    .io_read_address_valid(argRouteServers_1_io_read_address_valid),
    .io_read_address_bits(argRouteServers_1_io_read_address_bits),
    .io_read_data_ready(argRouteServers_1_io_read_data_ready),
    .io_read_data_valid(argRouteServers_1_io_read_data_valid),
    .io_read_data_bits(argRouteServers_1_io_read_data_bits),
    .io_write_address_ready(argRouteServers_1_io_write_address_ready),
    .io_write_address_valid(argRouteServers_1_io_write_address_valid),
    .io_write_address_bits(argRouteServers_1_io_write_address_bits),
    .io_write_data_ready(argRouteServers_1_io_write_data_ready),
    .io_write_data_valid(argRouteServers_1_io_write_data_valid),
    .io_write_data_bits(argRouteServers_1_io_write_data_bits),
    .io_read_address_task_ready(argRouteServers_1_io_read_address_task_ready),
    .io_read_address_task_valid(argRouteServers_1_io_read_address_task_valid),
    .io_read_address_task_bits(argRouteServers_1_io_read_address_task_bits),
    .io_read_data_task_ready(argRouteServers_1_io_read_data_task_ready),
    .io_read_data_task_valid(argRouteServers_1_io_read_data_task_valid),
    .io_read_data_task_bits(argRouteServers_1_io_read_data_task_bits)
  );
  argRouteVirtServerV2 argRouteServers_2 ( // @[syncSide.scala 55:15]
    .clock(argRouteServers_2_clock),
    .reset(argRouteServers_2_reset),
    .io_connNetwork_ready(argRouteServers_2_io_connNetwork_ready),
    .io_connNetwork_valid(argRouteServers_2_io_connNetwork_valid),
    .io_connNetwork_bits(argRouteServers_2_io_connNetwork_bits),
    .io_connStealNtw_ctrl_serveStealReq_ready(argRouteServers_2_io_connStealNtw_ctrl_serveStealReq_ready),
    .io_connStealNtw_ctrl_serveStealReq_valid(argRouteServers_2_io_connStealNtw_ctrl_serveStealReq_valid),
    .io_connStealNtw_data_qOutTask_ready(argRouteServers_2_io_connStealNtw_data_qOutTask_ready),
    .io_connStealNtw_data_qOutTask_valid(argRouteServers_2_io_connStealNtw_data_qOutTask_valid),
    .io_connStealNtw_data_qOutTask_bits(argRouteServers_2_io_connStealNtw_data_qOutTask_bits),
    .io_read_address_ready(argRouteServers_2_io_read_address_ready),
    .io_read_address_valid(argRouteServers_2_io_read_address_valid),
    .io_read_address_bits(argRouteServers_2_io_read_address_bits),
    .io_read_data_ready(argRouteServers_2_io_read_data_ready),
    .io_read_data_valid(argRouteServers_2_io_read_data_valid),
    .io_read_data_bits(argRouteServers_2_io_read_data_bits),
    .io_write_address_ready(argRouteServers_2_io_write_address_ready),
    .io_write_address_valid(argRouteServers_2_io_write_address_valid),
    .io_write_address_bits(argRouteServers_2_io_write_address_bits),
    .io_write_data_ready(argRouteServers_2_io_write_data_ready),
    .io_write_data_valid(argRouteServers_2_io_write_data_valid),
    .io_write_data_bits(argRouteServers_2_io_write_data_bits),
    .io_read_address_task_ready(argRouteServers_2_io_read_address_task_ready),
    .io_read_address_task_valid(argRouteServers_2_io_read_address_task_valid),
    .io_read_address_task_bits(argRouteServers_2_io_read_address_task_bits),
    .io_read_data_task_ready(argRouteServers_2_io_read_data_task_ready),
    .io_read_data_task_valid(argRouteServers_2_io_read_data_task_valid),
    .io_read_data_task_bits(argRouteServers_2_io_read_data_task_bits)
  );
  argRouteVirtServerV2 argRouteServers_3 ( // @[syncSide.scala 55:15]
    .clock(argRouteServers_3_clock),
    .reset(argRouteServers_3_reset),
    .io_connNetwork_ready(argRouteServers_3_io_connNetwork_ready),
    .io_connNetwork_valid(argRouteServers_3_io_connNetwork_valid),
    .io_connNetwork_bits(argRouteServers_3_io_connNetwork_bits),
    .io_connStealNtw_ctrl_serveStealReq_ready(argRouteServers_3_io_connStealNtw_ctrl_serveStealReq_ready),
    .io_connStealNtw_ctrl_serveStealReq_valid(argRouteServers_3_io_connStealNtw_ctrl_serveStealReq_valid),
    .io_connStealNtw_data_qOutTask_ready(argRouteServers_3_io_connStealNtw_data_qOutTask_ready),
    .io_connStealNtw_data_qOutTask_valid(argRouteServers_3_io_connStealNtw_data_qOutTask_valid),
    .io_connStealNtw_data_qOutTask_bits(argRouteServers_3_io_connStealNtw_data_qOutTask_bits),
    .io_read_address_ready(argRouteServers_3_io_read_address_ready),
    .io_read_address_valid(argRouteServers_3_io_read_address_valid),
    .io_read_address_bits(argRouteServers_3_io_read_address_bits),
    .io_read_data_ready(argRouteServers_3_io_read_data_ready),
    .io_read_data_valid(argRouteServers_3_io_read_data_valid),
    .io_read_data_bits(argRouteServers_3_io_read_data_bits),
    .io_write_address_ready(argRouteServers_3_io_write_address_ready),
    .io_write_address_valid(argRouteServers_3_io_write_address_valid),
    .io_write_address_bits(argRouteServers_3_io_write_address_bits),
    .io_write_data_ready(argRouteServers_3_io_write_data_ready),
    .io_write_data_valid(argRouteServers_3_io_write_data_valid),
    .io_write_data_bits(argRouteServers_3_io_write_data_bits),
    .io_read_address_task_ready(argRouteServers_3_io_read_address_task_ready),
    .io_read_address_task_valid(argRouteServers_3_io_read_address_task_valid),
    .io_read_address_task_bits(argRouteServers_3_io_read_address_task_bits),
    .io_read_data_task_ready(argRouteServers_3_io_read_data_task_ready),
    .io_read_data_task_valid(argRouteServers_3_io_read_data_task_valid),
    .io_read_data_task_bits(argRouteServers_3_io_read_data_task_bits)
  );
  readyValidMem_2 argRouteRvm_0 ( // @[syncSide.scala 65:67]
    .clock(argRouteRvm_0_clock),
    .reset(argRouteRvm_0_reset),
    .io_read_address_ready(argRouteRvm_0_io_read_address_ready),
    .io_read_address_valid(argRouteRvm_0_io_read_address_valid),
    .io_read_address_bits(argRouteRvm_0_io_read_address_bits),
    .io_read_data_ready(argRouteRvm_0_io_read_data_ready),
    .io_read_data_valid(argRouteRvm_0_io_read_data_valid),
    .io_read_data_bits(argRouteRvm_0_io_read_data_bits),
    .io_write_address_ready(argRouteRvm_0_io_write_address_ready),
    .io_write_address_valid(argRouteRvm_0_io_write_address_valid),
    .io_write_address_bits(argRouteRvm_0_io_write_address_bits),
    .io_write_data_ready(argRouteRvm_0_io_write_data_ready),
    .io_write_data_valid(argRouteRvm_0_io_write_data_valid),
    .io_write_data_bits(argRouteRvm_0_io_write_data_bits),
    .axi_ARREADY(argRouteRvm_0_axi_ARREADY),
    .axi_ARVALID(argRouteRvm_0_axi_ARVALID),
    .axi_ARADDR(argRouteRvm_0_axi_ARADDR),
    .axi_RREADY(argRouteRvm_0_axi_RREADY),
    .axi_RVALID(argRouteRvm_0_axi_RVALID),
    .axi_RDATA(argRouteRvm_0_axi_RDATA),
    .axi_AWREADY(argRouteRvm_0_axi_AWREADY),
    .axi_AWVALID(argRouteRvm_0_axi_AWVALID),
    .axi_AWADDR(argRouteRvm_0_axi_AWADDR),
    .axi_WREADY(argRouteRvm_0_axi_WREADY),
    .axi_WVALID(argRouteRvm_0_axi_WVALID),
    .axi_WDATA(argRouteRvm_0_axi_WDATA),
    .axi_BVALID(argRouteRvm_0_axi_BVALID)
  );
  readyValidMem_2 argRouteRvm_1 ( // @[syncSide.scala 65:67]
    .clock(argRouteRvm_1_clock),
    .reset(argRouteRvm_1_reset),
    .io_read_address_ready(argRouteRvm_1_io_read_address_ready),
    .io_read_address_valid(argRouteRvm_1_io_read_address_valid),
    .io_read_address_bits(argRouteRvm_1_io_read_address_bits),
    .io_read_data_ready(argRouteRvm_1_io_read_data_ready),
    .io_read_data_valid(argRouteRvm_1_io_read_data_valid),
    .io_read_data_bits(argRouteRvm_1_io_read_data_bits),
    .io_write_address_ready(argRouteRvm_1_io_write_address_ready),
    .io_write_address_valid(argRouteRvm_1_io_write_address_valid),
    .io_write_address_bits(argRouteRvm_1_io_write_address_bits),
    .io_write_data_ready(argRouteRvm_1_io_write_data_ready),
    .io_write_data_valid(argRouteRvm_1_io_write_data_valid),
    .io_write_data_bits(argRouteRvm_1_io_write_data_bits),
    .axi_ARREADY(argRouteRvm_1_axi_ARREADY),
    .axi_ARVALID(argRouteRvm_1_axi_ARVALID),
    .axi_ARADDR(argRouteRvm_1_axi_ARADDR),
    .axi_RREADY(argRouteRvm_1_axi_RREADY),
    .axi_RVALID(argRouteRvm_1_axi_RVALID),
    .axi_RDATA(argRouteRvm_1_axi_RDATA),
    .axi_AWREADY(argRouteRvm_1_axi_AWREADY),
    .axi_AWVALID(argRouteRvm_1_axi_AWVALID),
    .axi_AWADDR(argRouteRvm_1_axi_AWADDR),
    .axi_WREADY(argRouteRvm_1_axi_WREADY),
    .axi_WVALID(argRouteRvm_1_axi_WVALID),
    .axi_WDATA(argRouteRvm_1_axi_WDATA),
    .axi_BVALID(argRouteRvm_1_axi_BVALID)
  );
  readyValidMem_2 argRouteRvm_2 ( // @[syncSide.scala 65:67]
    .clock(argRouteRvm_2_clock),
    .reset(argRouteRvm_2_reset),
    .io_read_address_ready(argRouteRvm_2_io_read_address_ready),
    .io_read_address_valid(argRouteRvm_2_io_read_address_valid),
    .io_read_address_bits(argRouteRvm_2_io_read_address_bits),
    .io_read_data_ready(argRouteRvm_2_io_read_data_ready),
    .io_read_data_valid(argRouteRvm_2_io_read_data_valid),
    .io_read_data_bits(argRouteRvm_2_io_read_data_bits),
    .io_write_address_ready(argRouteRvm_2_io_write_address_ready),
    .io_write_address_valid(argRouteRvm_2_io_write_address_valid),
    .io_write_address_bits(argRouteRvm_2_io_write_address_bits),
    .io_write_data_ready(argRouteRvm_2_io_write_data_ready),
    .io_write_data_valid(argRouteRvm_2_io_write_data_valid),
    .io_write_data_bits(argRouteRvm_2_io_write_data_bits),
    .axi_ARREADY(argRouteRvm_2_axi_ARREADY),
    .axi_ARVALID(argRouteRvm_2_axi_ARVALID),
    .axi_ARADDR(argRouteRvm_2_axi_ARADDR),
    .axi_RREADY(argRouteRvm_2_axi_RREADY),
    .axi_RVALID(argRouteRvm_2_axi_RVALID),
    .axi_RDATA(argRouteRvm_2_axi_RDATA),
    .axi_AWREADY(argRouteRvm_2_axi_AWREADY),
    .axi_AWVALID(argRouteRvm_2_axi_AWVALID),
    .axi_AWADDR(argRouteRvm_2_axi_AWADDR),
    .axi_WREADY(argRouteRvm_2_axi_WREADY),
    .axi_WVALID(argRouteRvm_2_axi_WVALID),
    .axi_WDATA(argRouteRvm_2_axi_WDATA),
    .axi_BVALID(argRouteRvm_2_axi_BVALID)
  );
  readyValidMem_2 argRouteRvm_3 ( // @[syncSide.scala 65:67]
    .clock(argRouteRvm_3_clock),
    .reset(argRouteRvm_3_reset),
    .io_read_address_ready(argRouteRvm_3_io_read_address_ready),
    .io_read_address_valid(argRouteRvm_3_io_read_address_valid),
    .io_read_address_bits(argRouteRvm_3_io_read_address_bits),
    .io_read_data_ready(argRouteRvm_3_io_read_data_ready),
    .io_read_data_valid(argRouteRvm_3_io_read_data_valid),
    .io_read_data_bits(argRouteRvm_3_io_read_data_bits),
    .io_write_address_ready(argRouteRvm_3_io_write_address_ready),
    .io_write_address_valid(argRouteRvm_3_io_write_address_valid),
    .io_write_address_bits(argRouteRvm_3_io_write_address_bits),
    .io_write_data_ready(argRouteRvm_3_io_write_data_ready),
    .io_write_data_valid(argRouteRvm_3_io_write_data_valid),
    .io_write_data_bits(argRouteRvm_3_io_write_data_bits),
    .axi_ARREADY(argRouteRvm_3_axi_ARREADY),
    .axi_ARVALID(argRouteRvm_3_axi_ARVALID),
    .axi_ARADDR(argRouteRvm_3_axi_ARADDR),
    .axi_RREADY(argRouteRvm_3_axi_RREADY),
    .axi_RVALID(argRouteRvm_3_axi_RVALID),
    .axi_RDATA(argRouteRvm_3_axi_RDATA),
    .axi_AWREADY(argRouteRvm_3_axi_AWREADY),
    .axi_AWVALID(argRouteRvm_3_axi_AWVALID),
    .axi_AWADDR(argRouteRvm_3_axi_AWADDR),
    .axi_WREADY(argRouteRvm_3_axi_WREADY),
    .axi_WVALID(argRouteRvm_3_axi_WVALID),
    .axi_WDATA(argRouteRvm_3_axi_WDATA),
    .axi_BVALID(argRouteRvm_3_axi_BVALID)
  );
  readyValidMem_6 argRouteRvmReadOnly_0 ( // @[syncSide.scala 66:69]
    .io_read_address_ready(argRouteRvmReadOnly_0_io_read_address_ready),
    .io_read_address_valid(argRouteRvmReadOnly_0_io_read_address_valid),
    .io_read_address_bits(argRouteRvmReadOnly_0_io_read_address_bits),
    .io_read_data_ready(argRouteRvmReadOnly_0_io_read_data_ready),
    .io_read_data_valid(argRouteRvmReadOnly_0_io_read_data_valid),
    .io_read_data_bits(argRouteRvmReadOnly_0_io_read_data_bits),
    .axi_ARREADY(argRouteRvmReadOnly_0_axi_ARREADY),
    .axi_ARVALID(argRouteRvmReadOnly_0_axi_ARVALID),
    .axi_ARADDR(argRouteRvmReadOnly_0_axi_ARADDR),
    .axi_RREADY(argRouteRvmReadOnly_0_axi_RREADY),
    .axi_RVALID(argRouteRvmReadOnly_0_axi_RVALID),
    .axi_RDATA(argRouteRvmReadOnly_0_axi_RDATA)
  );
  readyValidMem_6 argRouteRvmReadOnly_1 ( // @[syncSide.scala 66:69]
    .io_read_address_ready(argRouteRvmReadOnly_1_io_read_address_ready),
    .io_read_address_valid(argRouteRvmReadOnly_1_io_read_address_valid),
    .io_read_address_bits(argRouteRvmReadOnly_1_io_read_address_bits),
    .io_read_data_ready(argRouteRvmReadOnly_1_io_read_data_ready),
    .io_read_data_valid(argRouteRvmReadOnly_1_io_read_data_valid),
    .io_read_data_bits(argRouteRvmReadOnly_1_io_read_data_bits),
    .axi_ARREADY(argRouteRvmReadOnly_1_axi_ARREADY),
    .axi_ARVALID(argRouteRvmReadOnly_1_axi_ARVALID),
    .axi_ARADDR(argRouteRvmReadOnly_1_axi_ARADDR),
    .axi_RREADY(argRouteRvmReadOnly_1_axi_RREADY),
    .axi_RVALID(argRouteRvmReadOnly_1_axi_RVALID),
    .axi_RDATA(argRouteRvmReadOnly_1_axi_RDATA)
  );
  readyValidMem_6 argRouteRvmReadOnly_2 ( // @[syncSide.scala 66:69]
    .io_read_address_ready(argRouteRvmReadOnly_2_io_read_address_ready),
    .io_read_address_valid(argRouteRvmReadOnly_2_io_read_address_valid),
    .io_read_address_bits(argRouteRvmReadOnly_2_io_read_address_bits),
    .io_read_data_ready(argRouteRvmReadOnly_2_io_read_data_ready),
    .io_read_data_valid(argRouteRvmReadOnly_2_io_read_data_valid),
    .io_read_data_bits(argRouteRvmReadOnly_2_io_read_data_bits),
    .axi_ARREADY(argRouteRvmReadOnly_2_axi_ARREADY),
    .axi_ARVALID(argRouteRvmReadOnly_2_axi_ARVALID),
    .axi_ARADDR(argRouteRvmReadOnly_2_axi_ARADDR),
    .axi_RREADY(argRouteRvmReadOnly_2_axi_RREADY),
    .axi_RVALID(argRouteRvmReadOnly_2_axi_RVALID),
    .axi_RDATA(argRouteRvmReadOnly_2_axi_RDATA)
  );
  readyValidMem_6 argRouteRvmReadOnly_3 ( // @[syncSide.scala 66:69]
    .io_read_address_ready(argRouteRvmReadOnly_3_io_read_address_ready),
    .io_read_address_valid(argRouteRvmReadOnly_3_io_read_address_valid),
    .io_read_address_bits(argRouteRvmReadOnly_3_io_read_address_bits),
    .io_read_data_ready(argRouteRvmReadOnly_3_io_read_data_ready),
    .io_read_data_valid(argRouteRvmReadOnly_3_io_read_data_valid),
    .io_read_data_bits(argRouteRvmReadOnly_3_io_read_data_bits),
    .axi_ARREADY(argRouteRvmReadOnly_3_axi_ARREADY),
    .axi_ARVALID(argRouteRvmReadOnly_3_axi_ARVALID),
    .axi_ARADDR(argRouteRvmReadOnly_3_axi_ARADDR),
    .axi_RREADY(argRouteRvmReadOnly_3_axi_RREADY),
    .axi_RVALID(argRouteRvmReadOnly_3_axi_RVALID),
    .axi_RDATA(argRouteRvmReadOnly_3_axi_RDATA)
  );
  assign io_addrIn_0_TREADY = argSide_io_connPE_0_ready; // @[syncSide.scala 83:30]
  assign io_addrIn_1_TREADY = argSide_io_connPE_1_ready; // @[syncSide.scala 83:30]
  assign io_addrIn_2_TREADY = argSide_io_connPE_2_ready; // @[syncSide.scala 83:30]
  assign io_addrIn_3_TREADY = argSide_io_connPE_3_ready; // @[syncSide.scala 83:30]
  assign io_addrIn_4_TREADY = argSide_io_connPE_4_ready; // @[syncSide.scala 83:30]
  assign io_addrIn_5_TREADY = argSide_io_connPE_5_ready; // @[syncSide.scala 83:30]
  assign io_addrIn_6_TREADY = argSide_io_connPE_6_ready; // @[syncSide.scala 83:30]
  assign io_addrIn_7_TREADY = argSide_io_connPE_7_ready; // @[syncSide.scala 83:30]
  assign io_axi_full_argRoute_0_ARVALID = argRouteRvm_0_axi_ARVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_0_ARADDR = argRouteRvm_0_axi_ARADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_0_RREADY = argRouteRvm_0_axi_RREADY; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_0_AWVALID = argRouteRvm_0_axi_AWVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_0_AWADDR = argRouteRvm_0_axi_AWADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_0_WVALID = argRouteRvm_0_axi_WVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_0_WDATA = argRouteRvm_0_axi_WDATA; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_1_ARVALID = argRouteRvm_1_axi_ARVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_1_ARADDR = argRouteRvm_1_axi_ARADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_1_RREADY = argRouteRvm_1_axi_RREADY; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_1_AWVALID = argRouteRvm_1_axi_AWVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_1_AWADDR = argRouteRvm_1_axi_AWADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_1_WVALID = argRouteRvm_1_axi_WVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_1_WDATA = argRouteRvm_1_axi_WDATA; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_2_ARVALID = argRouteRvm_2_axi_ARVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_2_ARADDR = argRouteRvm_2_axi_ARADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_2_RREADY = argRouteRvm_2_axi_RREADY; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_2_AWVALID = argRouteRvm_2_axi_AWVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_2_AWADDR = argRouteRvm_2_axi_AWADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_2_WVALID = argRouteRvm_2_axi_WVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_2_WDATA = argRouteRvm_2_axi_WDATA; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_3_ARVALID = argRouteRvm_3_axi_ARVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_3_ARADDR = argRouteRvm_3_axi_ARADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_3_RREADY = argRouteRvm_3_axi_RREADY; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_3_AWVALID = argRouteRvm_3_axi_AWVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_3_AWADDR = argRouteRvm_3_axi_AWADDR; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_3_WVALID = argRouteRvm_3_axi_WVALID; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_3_WDATA = argRouteRvm_3_axi_WDATA; // @[syncSide.scala 69:45]
  assign io_axi_full_argRoute_4_ARVALID = argRouteRvmReadOnly_0_axi_ARVALID; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_4_ARADDR = argRouteRvmReadOnly_0_axi_ARADDR; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_4_RREADY = argRouteRvmReadOnly_0_axi_RREADY; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_5_ARVALID = argRouteRvmReadOnly_1_axi_ARVALID; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_5_ARADDR = argRouteRvmReadOnly_1_axi_ARADDR; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_5_RREADY = argRouteRvmReadOnly_1_axi_RREADY; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_6_ARVALID = argRouteRvmReadOnly_2_axi_ARVALID; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_6_ARADDR = argRouteRvmReadOnly_2_axi_ARADDR; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_6_RREADY = argRouteRvmReadOnly_2_axi_RREADY; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_7_ARVALID = argRouteRvmReadOnly_3_axi_ARVALID; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_7_ARADDR = argRouteRvmReadOnly_3_axi_ARADDR; // @[syncSide.scala 77:55]
  assign io_axi_full_argRoute_7_RREADY = argRouteRvmReadOnly_3_axi_RREADY; // @[syncSide.scala 77:55]
  assign connStealNtw_0_ctrl_serveStealReq_valid = argRouteServers_0_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_0_data_qOutTask_valid = argRouteServers_0_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_0_data_qOutTask_bits = argRouteServers_0_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 75:45]
  assign connStealNtw_1_ctrl_serveStealReq_valid = argRouteServers_1_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_1_data_qOutTask_valid = argRouteServers_1_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_1_data_qOutTask_bits = argRouteServers_1_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 75:45]
  assign connStealNtw_2_ctrl_serveStealReq_valid = argRouteServers_2_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_2_data_qOutTask_valid = argRouteServers_2_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_2_data_qOutTask_bits = argRouteServers_2_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 75:45]
  assign connStealNtw_3_ctrl_serveStealReq_valid = argRouteServers_3_io_connStealNtw_ctrl_serveStealReq_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_3_data_qOutTask_valid = argRouteServers_3_io_connStealNtw_data_qOutTask_valid; // @[syncSide.scala 75:45]
  assign connStealNtw_3_data_qOutTask_bits = argRouteServers_3_io_connStealNtw_data_qOutTask_bits; // @[syncSide.scala 75:45]
  assign argSide_clock = clock;
  assign argSide_reset = reset;
  assign argSide_io_connVAS_0_ready = argRouteServers_0_io_connNetwork_ready; // @[syncSide.scala 74:45]
  assign argSide_io_connVAS_1_ready = argRouteServers_1_io_connNetwork_ready; // @[syncSide.scala 74:45]
  assign argSide_io_connVAS_2_ready = argRouteServers_2_io_connNetwork_ready; // @[syncSide.scala 74:45]
  assign argSide_io_connVAS_3_ready = argRouteServers_3_io_connNetwork_ready; // @[syncSide.scala 74:45]
  assign argSide_io_connPE_0_valid = io_addrIn_0_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_0_bits = io_addrIn_0_TDATA; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_1_valid = io_addrIn_1_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_1_bits = io_addrIn_1_TDATA; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_2_valid = io_addrIn_2_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_2_bits = io_addrIn_2_TDATA; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_3_valid = io_addrIn_3_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_3_bits = io_addrIn_3_TDATA; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_4_valid = io_addrIn_4_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_4_bits = io_addrIn_4_TDATA; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_5_valid = io_addrIn_5_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_5_bits = io_addrIn_5_TDATA; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_6_valid = io_addrIn_6_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_6_bits = io_addrIn_6_TDATA; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_7_valid = io_addrIn_7_TVALID; // @[syncSide.scala 83:30]
  assign argSide_io_connPE_7_bits = io_addrIn_7_TDATA; // @[syncSide.scala 83:30]
  assign argRouteServers_0_clock = clock;
  assign argRouteServers_0_reset = reset;
  assign argRouteServers_0_io_connNetwork_valid = argSide_io_connVAS_0_valid; // @[syncSide.scala 74:45]
  assign argRouteServers_0_io_connNetwork_bits = argSide_io_connVAS_0_bits; // @[syncSide.scala 74:45]
  assign argRouteServers_0_io_connStealNtw_ctrl_serveStealReq_ready = connStealNtw_0_ctrl_serveStealReq_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_0_io_connStealNtw_data_qOutTask_ready = connStealNtw_0_data_qOutTask_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_0_io_read_address_ready = argRouteRvm_0_io_read_address_ready; // @[syncSide.scala 70:45]
  assign argRouteServers_0_io_read_data_valid = argRouteRvm_0_io_read_data_valid; // @[syncSide.scala 71:45]
  assign argRouteServers_0_io_read_data_bits = argRouteRvm_0_io_read_data_bits; // @[syncSide.scala 71:45]
  assign argRouteServers_0_io_write_address_ready = argRouteRvm_0_io_write_address_ready; // @[syncSide.scala 72:45]
  assign argRouteServers_0_io_write_data_ready = argRouteRvm_0_io_write_data_ready; // @[syncSide.scala 73:45]
  assign argRouteServers_0_io_read_address_task_ready = argRouteRvmReadOnly_0_io_read_address_ready; // @[syncSide.scala 78:53]
  assign argRouteServers_0_io_read_data_task_valid = argRouteRvmReadOnly_0_io_read_data_valid; // @[syncSide.scala 79:53]
  assign argRouteServers_0_io_read_data_task_bits = argRouteRvmReadOnly_0_io_read_data_bits; // @[syncSide.scala 79:53]
  assign argRouteServers_1_clock = clock;
  assign argRouteServers_1_reset = reset;
  assign argRouteServers_1_io_connNetwork_valid = argSide_io_connVAS_1_valid; // @[syncSide.scala 74:45]
  assign argRouteServers_1_io_connNetwork_bits = argSide_io_connVAS_1_bits; // @[syncSide.scala 74:45]
  assign argRouteServers_1_io_connStealNtw_ctrl_serveStealReq_ready = connStealNtw_1_ctrl_serveStealReq_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_1_io_connStealNtw_data_qOutTask_ready = connStealNtw_1_data_qOutTask_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_1_io_read_address_ready = argRouteRvm_1_io_read_address_ready; // @[syncSide.scala 70:45]
  assign argRouteServers_1_io_read_data_valid = argRouteRvm_1_io_read_data_valid; // @[syncSide.scala 71:45]
  assign argRouteServers_1_io_read_data_bits = argRouteRvm_1_io_read_data_bits; // @[syncSide.scala 71:45]
  assign argRouteServers_1_io_write_address_ready = argRouteRvm_1_io_write_address_ready; // @[syncSide.scala 72:45]
  assign argRouteServers_1_io_write_data_ready = argRouteRvm_1_io_write_data_ready; // @[syncSide.scala 73:45]
  assign argRouteServers_1_io_read_address_task_ready = argRouteRvmReadOnly_1_io_read_address_ready; // @[syncSide.scala 78:53]
  assign argRouteServers_1_io_read_data_task_valid = argRouteRvmReadOnly_1_io_read_data_valid; // @[syncSide.scala 79:53]
  assign argRouteServers_1_io_read_data_task_bits = argRouteRvmReadOnly_1_io_read_data_bits; // @[syncSide.scala 79:53]
  assign argRouteServers_2_clock = clock;
  assign argRouteServers_2_reset = reset;
  assign argRouteServers_2_io_connNetwork_valid = argSide_io_connVAS_2_valid; // @[syncSide.scala 74:45]
  assign argRouteServers_2_io_connNetwork_bits = argSide_io_connVAS_2_bits; // @[syncSide.scala 74:45]
  assign argRouteServers_2_io_connStealNtw_ctrl_serveStealReq_ready = connStealNtw_2_ctrl_serveStealReq_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_2_io_connStealNtw_data_qOutTask_ready = connStealNtw_2_data_qOutTask_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_2_io_read_address_ready = argRouteRvm_2_io_read_address_ready; // @[syncSide.scala 70:45]
  assign argRouteServers_2_io_read_data_valid = argRouteRvm_2_io_read_data_valid; // @[syncSide.scala 71:45]
  assign argRouteServers_2_io_read_data_bits = argRouteRvm_2_io_read_data_bits; // @[syncSide.scala 71:45]
  assign argRouteServers_2_io_write_address_ready = argRouteRvm_2_io_write_address_ready; // @[syncSide.scala 72:45]
  assign argRouteServers_2_io_write_data_ready = argRouteRvm_2_io_write_data_ready; // @[syncSide.scala 73:45]
  assign argRouteServers_2_io_read_address_task_ready = argRouteRvmReadOnly_2_io_read_address_ready; // @[syncSide.scala 78:53]
  assign argRouteServers_2_io_read_data_task_valid = argRouteRvmReadOnly_2_io_read_data_valid; // @[syncSide.scala 79:53]
  assign argRouteServers_2_io_read_data_task_bits = argRouteRvmReadOnly_2_io_read_data_bits; // @[syncSide.scala 79:53]
  assign argRouteServers_3_clock = clock;
  assign argRouteServers_3_reset = reset;
  assign argRouteServers_3_io_connNetwork_valid = argSide_io_connVAS_3_valid; // @[syncSide.scala 74:45]
  assign argRouteServers_3_io_connNetwork_bits = argSide_io_connVAS_3_bits; // @[syncSide.scala 74:45]
  assign argRouteServers_3_io_connStealNtw_ctrl_serveStealReq_ready = connStealNtw_3_ctrl_serveStealReq_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_3_io_connStealNtw_data_qOutTask_ready = connStealNtw_3_data_qOutTask_ready; // @[syncSide.scala 75:45]
  assign argRouteServers_3_io_read_address_ready = argRouteRvm_3_io_read_address_ready; // @[syncSide.scala 70:45]
  assign argRouteServers_3_io_read_data_valid = argRouteRvm_3_io_read_data_valid; // @[syncSide.scala 71:45]
  assign argRouteServers_3_io_read_data_bits = argRouteRvm_3_io_read_data_bits; // @[syncSide.scala 71:45]
  assign argRouteServers_3_io_write_address_ready = argRouteRvm_3_io_write_address_ready; // @[syncSide.scala 72:45]
  assign argRouteServers_3_io_write_data_ready = argRouteRvm_3_io_write_data_ready; // @[syncSide.scala 73:45]
  assign argRouteServers_3_io_read_address_task_ready = argRouteRvmReadOnly_3_io_read_address_ready; // @[syncSide.scala 78:53]
  assign argRouteServers_3_io_read_data_task_valid = argRouteRvmReadOnly_3_io_read_data_valid; // @[syncSide.scala 79:53]
  assign argRouteServers_3_io_read_data_task_bits = argRouteRvmReadOnly_3_io_read_data_bits; // @[syncSide.scala 79:53]
  assign argRouteRvm_0_clock = clock;
  assign argRouteRvm_0_reset = reset;
  assign argRouteRvm_0_io_read_address_valid = argRouteServers_0_io_read_address_valid; // @[syncSide.scala 70:45]
  assign argRouteRvm_0_io_read_address_bits = argRouteServers_0_io_read_address_bits; // @[syncSide.scala 70:45]
  assign argRouteRvm_0_io_read_data_ready = argRouteServers_0_io_read_data_ready; // @[syncSide.scala 71:45]
  assign argRouteRvm_0_io_write_address_valid = argRouteServers_0_io_write_address_valid; // @[syncSide.scala 72:45]
  assign argRouteRvm_0_io_write_address_bits = argRouteServers_0_io_write_address_bits; // @[syncSide.scala 72:45]
  assign argRouteRvm_0_io_write_data_valid = argRouteServers_0_io_write_data_valid; // @[syncSide.scala 73:45]
  assign argRouteRvm_0_io_write_data_bits = argRouteServers_0_io_write_data_bits; // @[syncSide.scala 73:45]
  assign argRouteRvm_0_axi_ARREADY = io_axi_full_argRoute_0_ARREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_0_axi_RVALID = io_axi_full_argRoute_0_RVALID; // @[syncSide.scala 69:45]
  assign argRouteRvm_0_axi_RDATA = io_axi_full_argRoute_0_RDATA; // @[syncSide.scala 69:45]
  assign argRouteRvm_0_axi_AWREADY = io_axi_full_argRoute_0_AWREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_0_axi_WREADY = io_axi_full_argRoute_0_WREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_0_axi_BVALID = io_axi_full_argRoute_0_BVALID; // @[syncSide.scala 69:45]
  assign argRouteRvm_1_clock = clock;
  assign argRouteRvm_1_reset = reset;
  assign argRouteRvm_1_io_read_address_valid = argRouteServers_1_io_read_address_valid; // @[syncSide.scala 70:45]
  assign argRouteRvm_1_io_read_address_bits = argRouteServers_1_io_read_address_bits; // @[syncSide.scala 70:45]
  assign argRouteRvm_1_io_read_data_ready = argRouteServers_1_io_read_data_ready; // @[syncSide.scala 71:45]
  assign argRouteRvm_1_io_write_address_valid = argRouteServers_1_io_write_address_valid; // @[syncSide.scala 72:45]
  assign argRouteRvm_1_io_write_address_bits = argRouteServers_1_io_write_address_bits; // @[syncSide.scala 72:45]
  assign argRouteRvm_1_io_write_data_valid = argRouteServers_1_io_write_data_valid; // @[syncSide.scala 73:45]
  assign argRouteRvm_1_io_write_data_bits = argRouteServers_1_io_write_data_bits; // @[syncSide.scala 73:45]
  assign argRouteRvm_1_axi_ARREADY = io_axi_full_argRoute_1_ARREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_1_axi_RVALID = io_axi_full_argRoute_1_RVALID; // @[syncSide.scala 69:45]
  assign argRouteRvm_1_axi_RDATA = io_axi_full_argRoute_1_RDATA; // @[syncSide.scala 69:45]
  assign argRouteRvm_1_axi_AWREADY = io_axi_full_argRoute_1_AWREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_1_axi_WREADY = io_axi_full_argRoute_1_WREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_1_axi_BVALID = io_axi_full_argRoute_1_BVALID; // @[syncSide.scala 69:45]
  assign argRouteRvm_2_clock = clock;
  assign argRouteRvm_2_reset = reset;
  assign argRouteRvm_2_io_read_address_valid = argRouteServers_2_io_read_address_valid; // @[syncSide.scala 70:45]
  assign argRouteRvm_2_io_read_address_bits = argRouteServers_2_io_read_address_bits; // @[syncSide.scala 70:45]
  assign argRouteRvm_2_io_read_data_ready = argRouteServers_2_io_read_data_ready; // @[syncSide.scala 71:45]
  assign argRouteRvm_2_io_write_address_valid = argRouteServers_2_io_write_address_valid; // @[syncSide.scala 72:45]
  assign argRouteRvm_2_io_write_address_bits = argRouteServers_2_io_write_address_bits; // @[syncSide.scala 72:45]
  assign argRouteRvm_2_io_write_data_valid = argRouteServers_2_io_write_data_valid; // @[syncSide.scala 73:45]
  assign argRouteRvm_2_io_write_data_bits = argRouteServers_2_io_write_data_bits; // @[syncSide.scala 73:45]
  assign argRouteRvm_2_axi_ARREADY = io_axi_full_argRoute_2_ARREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_2_axi_RVALID = io_axi_full_argRoute_2_RVALID; // @[syncSide.scala 69:45]
  assign argRouteRvm_2_axi_RDATA = io_axi_full_argRoute_2_RDATA; // @[syncSide.scala 69:45]
  assign argRouteRvm_2_axi_AWREADY = io_axi_full_argRoute_2_AWREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_2_axi_WREADY = io_axi_full_argRoute_2_WREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_2_axi_BVALID = io_axi_full_argRoute_2_BVALID; // @[syncSide.scala 69:45]
  assign argRouteRvm_3_clock = clock;
  assign argRouteRvm_3_reset = reset;
  assign argRouteRvm_3_io_read_address_valid = argRouteServers_3_io_read_address_valid; // @[syncSide.scala 70:45]
  assign argRouteRvm_3_io_read_address_bits = argRouteServers_3_io_read_address_bits; // @[syncSide.scala 70:45]
  assign argRouteRvm_3_io_read_data_ready = argRouteServers_3_io_read_data_ready; // @[syncSide.scala 71:45]
  assign argRouteRvm_3_io_write_address_valid = argRouteServers_3_io_write_address_valid; // @[syncSide.scala 72:45]
  assign argRouteRvm_3_io_write_address_bits = argRouteServers_3_io_write_address_bits; // @[syncSide.scala 72:45]
  assign argRouteRvm_3_io_write_data_valid = argRouteServers_3_io_write_data_valid; // @[syncSide.scala 73:45]
  assign argRouteRvm_3_io_write_data_bits = argRouteServers_3_io_write_data_bits; // @[syncSide.scala 73:45]
  assign argRouteRvm_3_axi_ARREADY = io_axi_full_argRoute_3_ARREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_3_axi_RVALID = io_axi_full_argRoute_3_RVALID; // @[syncSide.scala 69:45]
  assign argRouteRvm_3_axi_RDATA = io_axi_full_argRoute_3_RDATA; // @[syncSide.scala 69:45]
  assign argRouteRvm_3_axi_AWREADY = io_axi_full_argRoute_3_AWREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_3_axi_WREADY = io_axi_full_argRoute_3_WREADY; // @[syncSide.scala 69:45]
  assign argRouteRvm_3_axi_BVALID = io_axi_full_argRoute_3_BVALID; // @[syncSide.scala 69:45]
  assign argRouteRvmReadOnly_0_io_read_address_valid = argRouteServers_0_io_read_address_task_valid; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_0_io_read_address_bits = argRouteServers_0_io_read_address_task_bits; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_0_io_read_data_ready = argRouteServers_0_io_read_data_task_ready; // @[syncSide.scala 79:53]
  assign argRouteRvmReadOnly_0_axi_ARREADY = io_axi_full_argRoute_4_ARREADY; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_0_axi_RVALID = io_axi_full_argRoute_4_RVALID; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_0_axi_RDATA = io_axi_full_argRoute_4_RDATA; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_1_io_read_address_valid = argRouteServers_1_io_read_address_task_valid; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_1_io_read_address_bits = argRouteServers_1_io_read_address_task_bits; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_1_io_read_data_ready = argRouteServers_1_io_read_data_task_ready; // @[syncSide.scala 79:53]
  assign argRouteRvmReadOnly_1_axi_ARREADY = io_axi_full_argRoute_5_ARREADY; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_1_axi_RVALID = io_axi_full_argRoute_5_RVALID; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_1_axi_RDATA = io_axi_full_argRoute_5_RDATA; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_2_io_read_address_valid = argRouteServers_2_io_read_address_task_valid; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_2_io_read_address_bits = argRouteServers_2_io_read_address_task_bits; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_2_io_read_data_ready = argRouteServers_2_io_read_data_task_ready; // @[syncSide.scala 79:53]
  assign argRouteRvmReadOnly_2_axi_ARREADY = io_axi_full_argRoute_6_ARREADY; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_2_axi_RVALID = io_axi_full_argRoute_6_RVALID; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_2_axi_RDATA = io_axi_full_argRoute_6_RDATA; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_3_io_read_address_valid = argRouteServers_3_io_read_address_task_valid; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_3_io_read_address_bits = argRouteServers_3_io_read_address_task_bits; // @[syncSide.scala 78:53]
  assign argRouteRvmReadOnly_3_io_read_data_ready = argRouteServers_3_io_read_data_task_ready; // @[syncSide.scala 79:53]
  assign argRouteRvmReadOnly_3_axi_ARREADY = io_axi_full_argRoute_7_ARREADY; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_3_axi_RVALID = io_axi_full_argRoute_7_RVALID; // @[syncSide.scala 77:55]
  assign argRouteRvmReadOnly_3_axi_RDATA = io_axi_full_argRoute_7_RDATA; // @[syncSide.scala 77:55]
endmodule
module stealNetworkDataUnit_9(
  input          clock,
  input          reset,
  input  [127:0] io_taskIn,
  output [127:0] io_taskOut,
  input          io_validIn,
  output         io_validOut,
  input          io_connSS_availableTask_ready,
  output         io_connSS_availableTask_valid,
  output [127:0] io_connSS_availableTask_bits,
  output         io_connSS_qOutTask_ready,
  input          io_connSS_qOutTask_valid,
  input  [127:0] io_connSS_qOutTask_bits,
  output         io_occupied
);
`ifdef RANDOMIZE_REG_INIT
  reg [127:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] taskReg; // @[stealNetworkDataUnit.scala 32:33]
  reg  validReg; // @[stealNetworkDataUnit.scala 33:33]
  wire  _T_2 = io_connSS_qOutTask_valid & ~io_validIn; // @[stealNetworkDataUnit.scala 50:41]
  wire  _GEN_2 = io_connSS_qOutTask_valid & ~io_validIn | io_validIn; // @[stealNetworkDataUnit.scala 50:56 51:32]
  assign io_taskOut = taskReg; // @[stealNetworkDataUnit.scala 63:25]
  assign io_validOut = validReg; // @[stealNetworkDataUnit.scala 64:25]
  assign io_connSS_availableTask_valid = io_connSS_availableTask_ready & io_validIn; // @[stealNetworkDataUnit.scala 45:40]
  assign io_connSS_availableTask_bits = io_connSS_availableTask_ready & io_validIn ? io_taskIn : 128'h0; // @[stealNetworkDataUnit.scala 42:35 45:54 49:37]
  assign io_connSS_qOutTask_ready = io_connSS_availableTask_ready & io_validIn ? 1'h0 : _T_2; // @[stealNetworkDataUnit.scala 41:30 45:54]
  assign io_occupied = validReg; // @[stealNetworkDataUnit.scala 65:25]
  always @(posedge clock) begin
    if (reset) begin // @[stealNetworkDataUnit.scala 32:33]
      taskReg <= 128'h0; // @[stealNetworkDataUnit.scala 32:33]
    end else if (io_connSS_availableTask_ready & io_validIn) begin // @[stealNetworkDataUnit.scala 45:54]
      taskReg <= 128'h0; // @[stealNetworkDataUnit.scala 47:37]
    end else if (io_connSS_qOutTask_valid & ~io_validIn) begin // @[stealNetworkDataUnit.scala 50:56]
      taskReg <= io_connSS_qOutTask_bits; // @[stealNetworkDataUnit.scala 52:32]
    end else if (io_validIn) begin // @[stealNetworkDataUnit.scala 54:27]
      taskReg <= io_taskIn; // @[stealNetworkDataUnit.scala 56:19]
    end else begin
      taskReg <= 128'h0; // @[stealNetworkDataUnit.scala 59:22]
    end
    if (reset) begin // @[stealNetworkDataUnit.scala 33:33]
      validReg <= 1'h0; // @[stealNetworkDataUnit.scala 33:33]
    end else if (io_connSS_availableTask_ready & io_validIn) begin // @[stealNetworkDataUnit.scala 45:54]
      validReg <= 1'h0; // @[stealNetworkDataUnit.scala 46:37]
    end else begin
      validReg <= _GEN_2;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {4{`RANDOM}};
  taskReg = _RAND_0[127:0];
  _RAND_1 = {1{`RANDOM}};
  validReg = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module stealNetwork_1(
  input          clock,
  input          reset,
  output         io_connSS_0_ctrl_serveStealReq_ready,
  input          io_connSS_0_ctrl_serveStealReq_valid,
  input          io_connSS_0_data_availableTask_ready,
  output         io_connSS_0_data_availableTask_valid,
  output [127:0] io_connSS_0_data_availableTask_bits,
  output         io_connSS_0_data_qOutTask_ready,
  input          io_connSS_0_data_qOutTask_valid,
  input  [127:0] io_connSS_0_data_qOutTask_bits,
  output         io_connSS_1_ctrl_serveStealReq_ready,
  input          io_connSS_1_ctrl_serveStealReq_valid,
  output         io_connSS_1_ctrl_stealReq_ready,
  input          io_connSS_1_ctrl_stealReq_valid,
  input          io_connSS_1_data_availableTask_ready,
  output         io_connSS_1_data_availableTask_valid,
  output [127:0] io_connSS_1_data_availableTask_bits,
  output         io_connSS_1_data_qOutTask_ready,
  input          io_connSS_1_data_qOutTask_valid,
  input  [127:0] io_connSS_1_data_qOutTask_bits,
  output         io_connSS_2_ctrl_serveStealReq_ready,
  input          io_connSS_2_ctrl_serveStealReq_valid,
  input          io_connSS_2_data_availableTask_ready,
  output         io_connSS_2_data_availableTask_valid,
  output [127:0] io_connSS_2_data_availableTask_bits,
  output         io_connSS_2_data_qOutTask_ready,
  input          io_connSS_2_data_qOutTask_valid,
  input  [127:0] io_connSS_2_data_qOutTask_bits,
  output         io_connSS_3_ctrl_serveStealReq_ready,
  input          io_connSS_3_ctrl_serveStealReq_valid,
  output         io_connSS_3_ctrl_stealReq_ready,
  input          io_connSS_3_ctrl_stealReq_valid,
  input          io_connSS_3_data_availableTask_ready,
  output         io_connSS_3_data_availableTask_valid,
  output [127:0] io_connSS_3_data_availableTask_bits,
  output         io_connSS_3_data_qOutTask_ready,
  input          io_connSS_3_data_qOutTask_valid,
  input  [127:0] io_connSS_3_data_qOutTask_bits,
  output         io_connSS_4_ctrl_serveStealReq_ready,
  input          io_connSS_4_ctrl_serveStealReq_valid,
  input          io_connSS_4_data_availableTask_ready,
  output         io_connSS_4_data_availableTask_valid,
  output [127:0] io_connSS_4_data_availableTask_bits,
  output         io_connSS_4_data_qOutTask_ready,
  input          io_connSS_4_data_qOutTask_valid,
  input  [127:0] io_connSS_4_data_qOutTask_bits,
  output         io_connSS_5_ctrl_serveStealReq_ready,
  input          io_connSS_5_ctrl_serveStealReq_valid,
  output         io_connSS_5_ctrl_stealReq_ready,
  input          io_connSS_5_ctrl_stealReq_valid,
  input          io_connSS_5_data_availableTask_ready,
  output         io_connSS_5_data_availableTask_valid,
  output [127:0] io_connSS_5_data_availableTask_bits,
  output         io_connSS_5_data_qOutTask_ready,
  input          io_connSS_5_data_qOutTask_valid,
  input  [127:0] io_connSS_5_data_qOutTask_bits,
  output         io_connSS_6_ctrl_serveStealReq_ready,
  input          io_connSS_6_ctrl_serveStealReq_valid,
  input          io_connSS_6_data_availableTask_ready,
  output         io_connSS_6_data_availableTask_valid,
  output [127:0] io_connSS_6_data_availableTask_bits,
  output         io_connSS_6_data_qOutTask_ready,
  input          io_connSS_6_data_qOutTask_valid,
  input  [127:0] io_connSS_6_data_qOutTask_bits,
  output         io_connSS_7_ctrl_serveStealReq_ready,
  input          io_connSS_7_ctrl_serveStealReq_valid,
  output         io_connSS_7_ctrl_stealReq_ready,
  input          io_connSS_7_ctrl_stealReq_valid,
  input          io_connSS_7_data_availableTask_ready,
  output         io_connSS_7_data_availableTask_valid,
  output [127:0] io_connSS_7_data_availableTask_bits,
  output         io_connSS_7_data_qOutTask_ready,
  input          io_connSS_7_data_qOutTask_valid,
  input  [127:0] io_connSS_7_data_qOutTask_bits,
  output         io_ntwDataUnitOccupancyVSS_0,
  output         io_ntwDataUnitOccupancyVSS_1,
  output         io_ntwDataUnitOccupancyVSS_2,
  output         io_ntwDataUnitOccupancyVSS_3
);
  wire  dataUnits_0_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_0_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_0_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_0_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_0_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_1_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_1_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_1_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_1_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_2_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_2_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_2_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_2_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_3_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_3_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_3_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_3_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_4_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_4_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_4_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_5_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_5_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_5_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_5_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_6_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_6_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_6_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_6_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_reset; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_7_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_7_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_7_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [127:0] dataUnits_7_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_occupied; // @[stealNetwork.scala 23:42]
  wire  ctrlunits_0_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_0_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_1_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_2_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_3_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_4_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_5_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_6_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_7_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  stealNetworkDataUnit_9 dataUnits_0 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_0_clock),
    .reset(dataUnits_0_reset),
    .io_taskIn(dataUnits_0_io_taskIn),
    .io_taskOut(dataUnits_0_io_taskOut),
    .io_validIn(dataUnits_0_io_validIn),
    .io_validOut(dataUnits_0_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_0_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_0_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_0_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_0_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_0_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_0_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_0_io_occupied)
  );
  stealNetworkDataUnit_9 dataUnits_1 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_1_clock),
    .reset(dataUnits_1_reset),
    .io_taskIn(dataUnits_1_io_taskIn),
    .io_taskOut(dataUnits_1_io_taskOut),
    .io_validIn(dataUnits_1_io_validIn),
    .io_validOut(dataUnits_1_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_1_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_1_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_1_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_1_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_1_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_1_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_1_io_occupied)
  );
  stealNetworkDataUnit_9 dataUnits_2 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_2_clock),
    .reset(dataUnits_2_reset),
    .io_taskIn(dataUnits_2_io_taskIn),
    .io_taskOut(dataUnits_2_io_taskOut),
    .io_validIn(dataUnits_2_io_validIn),
    .io_validOut(dataUnits_2_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_2_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_2_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_2_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_2_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_2_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_2_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_2_io_occupied)
  );
  stealNetworkDataUnit_9 dataUnits_3 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_3_clock),
    .reset(dataUnits_3_reset),
    .io_taskIn(dataUnits_3_io_taskIn),
    .io_taskOut(dataUnits_3_io_taskOut),
    .io_validIn(dataUnits_3_io_validIn),
    .io_validOut(dataUnits_3_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_3_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_3_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_3_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_3_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_3_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_3_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_3_io_occupied)
  );
  stealNetworkDataUnit_9 dataUnits_4 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_4_clock),
    .reset(dataUnits_4_reset),
    .io_taskIn(dataUnits_4_io_taskIn),
    .io_taskOut(dataUnits_4_io_taskOut),
    .io_validIn(dataUnits_4_io_validIn),
    .io_validOut(dataUnits_4_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_4_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_4_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_4_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_4_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_4_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_4_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_4_io_occupied)
  );
  stealNetworkDataUnit_9 dataUnits_5 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_5_clock),
    .reset(dataUnits_5_reset),
    .io_taskIn(dataUnits_5_io_taskIn),
    .io_taskOut(dataUnits_5_io_taskOut),
    .io_validIn(dataUnits_5_io_validIn),
    .io_validOut(dataUnits_5_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_5_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_5_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_5_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_5_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_5_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_5_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_5_io_occupied)
  );
  stealNetworkDataUnit_9 dataUnits_6 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_6_clock),
    .reset(dataUnits_6_reset),
    .io_taskIn(dataUnits_6_io_taskIn),
    .io_taskOut(dataUnits_6_io_taskOut),
    .io_validIn(dataUnits_6_io_validIn),
    .io_validOut(dataUnits_6_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_6_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_6_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_6_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_6_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_6_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_6_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_6_io_occupied)
  );
  stealNetworkDataUnit_9 dataUnits_7 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_7_clock),
    .reset(dataUnits_7_reset),
    .io_taskIn(dataUnits_7_io_taskIn),
    .io_taskOut(dataUnits_7_io_taskOut),
    .io_validIn(dataUnits_7_io_validIn),
    .io_validOut(dataUnits_7_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_7_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_7_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_7_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_7_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_7_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_7_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_7_io_occupied)
  );
  stealNetworkCtrlUnit ctrlunits_0 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_0_clock),
    .reset(ctrlunits_0_reset),
    .io_reqTaskIn(ctrlunits_0_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_0_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_0_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_0_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_0_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_0_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_1 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_1_clock),
    .reset(ctrlunits_1_reset),
    .io_reqTaskIn(ctrlunits_1_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_1_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_1_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_1_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_1_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_1_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_2 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_2_clock),
    .reset(ctrlunits_2_reset),
    .io_reqTaskIn(ctrlunits_2_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_2_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_2_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_2_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_2_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_2_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_3 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_3_clock),
    .reset(ctrlunits_3_reset),
    .io_reqTaskIn(ctrlunits_3_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_3_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_3_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_3_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_3_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_3_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_4 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_4_clock),
    .reset(ctrlunits_4_reset),
    .io_reqTaskIn(ctrlunits_4_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_4_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_4_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_4_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_4_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_4_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_5 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_5_clock),
    .reset(ctrlunits_5_reset),
    .io_reqTaskIn(ctrlunits_5_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_5_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_5_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_5_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_5_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_5_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_6 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_6_clock),
    .reset(ctrlunits_6_reset),
    .io_reqTaskIn(ctrlunits_6_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_6_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_6_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_6_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_6_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_6_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_7 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_7_clock),
    .reset(ctrlunits_7_reset),
    .io_reqTaskIn(ctrlunits_7_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_7_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_7_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_7_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_7_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_7_io_connSS_stealReq_valid)
  );
  assign io_connSS_0_ctrl_serveStealReq_ready = ctrlunits_0_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_0_data_availableTask_valid = dataUnits_0_io_connSS_availableTask_valid; // @[stealNetwork.scala 36:27]
  assign io_connSS_0_data_availableTask_bits = dataUnits_0_io_connSS_availableTask_bits; // @[stealNetwork.scala 36:27]
  assign io_connSS_0_data_qOutTask_ready = dataUnits_0_io_connSS_qOutTask_ready; // @[stealNetwork.scala 36:27]
  assign io_connSS_1_ctrl_serveStealReq_ready = ctrlunits_1_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_1_ctrl_stealReq_ready = ctrlunits_1_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_1_data_availableTask_valid = dataUnits_1_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_1_data_availableTask_bits = dataUnits_1_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_1_data_qOutTask_ready = dataUnits_1_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_ctrl_serveStealReq_ready = ctrlunits_2_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_2_data_availableTask_valid = dataUnits_2_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_data_availableTask_bits = dataUnits_2_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_data_qOutTask_ready = dataUnits_2_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_3_ctrl_serveStealReq_ready = ctrlunits_3_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_3_ctrl_stealReq_ready = ctrlunits_3_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_3_data_availableTask_valid = dataUnits_3_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_3_data_availableTask_bits = dataUnits_3_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_3_data_qOutTask_ready = dataUnits_3_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_ctrl_serveStealReq_ready = ctrlunits_4_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_4_data_availableTask_valid = dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_availableTask_bits = dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_qOutTask_ready = dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_5_ctrl_serveStealReq_ready = ctrlunits_5_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_5_ctrl_stealReq_ready = ctrlunits_5_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_5_data_availableTask_valid = dataUnits_5_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_5_data_availableTask_bits = dataUnits_5_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_5_data_qOutTask_ready = dataUnits_5_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_ctrl_serveStealReq_ready = ctrlunits_6_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_6_data_availableTask_valid = dataUnits_6_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_data_availableTask_bits = dataUnits_6_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_data_qOutTask_ready = dataUnits_6_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_7_ctrl_serveStealReq_ready = ctrlunits_7_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_7_ctrl_stealReq_ready = ctrlunits_7_io_connSS_stealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_7_data_availableTask_valid = dataUnits_7_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_7_data_availableTask_bits = dataUnits_7_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_7_data_qOutTask_ready = dataUnits_7_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_ntwDataUnitOccupancyVSS_0 = dataUnits_0_io_occupied; // @[stealNetwork.scala 49:54]
  assign io_ntwDataUnitOccupancyVSS_1 = dataUnits_2_io_occupied; // @[stealNetwork.scala 49:54]
  assign io_ntwDataUnitOccupancyVSS_2 = dataUnits_4_io_occupied; // @[stealNetwork.scala 49:54]
  assign io_ntwDataUnitOccupancyVSS_3 = dataUnits_6_io_occupied; // @[stealNetwork.scala 49:54]
  assign dataUnits_0_clock = clock;
  assign dataUnits_0_reset = reset;
  assign dataUnits_0_io_taskIn = dataUnits_7_io_taskOut; // @[stealNetwork.scala 34:27]
  assign dataUnits_0_io_validIn = dataUnits_7_io_validOut; // @[stealNetwork.scala 35:27]
  assign dataUnits_0_io_connSS_availableTask_ready = io_connSS_0_data_availableTask_ready; // @[stealNetwork.scala 36:27]
  assign dataUnits_0_io_connSS_qOutTask_valid = io_connSS_0_data_qOutTask_valid; // @[stealNetwork.scala 36:27]
  assign dataUnits_0_io_connSS_qOutTask_bits = io_connSS_0_data_qOutTask_bits; // @[stealNetwork.scala 36:27]
  assign dataUnits_1_clock = clock;
  assign dataUnits_1_reset = reset;
  assign dataUnits_1_io_taskIn = dataUnits_0_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_1_io_validIn = dataUnits_0_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_1_io_connSS_availableTask_ready = io_connSS_1_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_1_io_connSS_qOutTask_valid = io_connSS_1_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_1_io_connSS_qOutTask_bits = io_connSS_1_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_2_clock = clock;
  assign dataUnits_2_reset = reset;
  assign dataUnits_2_io_taskIn = dataUnits_1_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_2_io_validIn = dataUnits_1_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_2_io_connSS_availableTask_ready = io_connSS_2_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_2_io_connSS_qOutTask_valid = io_connSS_2_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_2_io_connSS_qOutTask_bits = io_connSS_2_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_3_clock = clock;
  assign dataUnits_3_reset = reset;
  assign dataUnits_3_io_taskIn = dataUnits_2_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_3_io_validIn = dataUnits_2_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_3_io_connSS_availableTask_ready = io_connSS_3_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_3_io_connSS_qOutTask_valid = io_connSS_3_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_3_io_connSS_qOutTask_bits = io_connSS_3_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_4_clock = clock;
  assign dataUnits_4_reset = reset;
  assign dataUnits_4_io_taskIn = dataUnits_3_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_4_io_validIn = dataUnits_3_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_4_io_connSS_availableTask_ready = io_connSS_4_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_4_io_connSS_qOutTask_valid = io_connSS_4_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_4_io_connSS_qOutTask_bits = io_connSS_4_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_5_clock = clock;
  assign dataUnits_5_reset = reset;
  assign dataUnits_5_io_taskIn = dataUnits_4_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_5_io_validIn = dataUnits_4_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_5_io_connSS_availableTask_ready = io_connSS_5_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_5_io_connSS_qOutTask_valid = io_connSS_5_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_5_io_connSS_qOutTask_bits = io_connSS_5_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_6_clock = clock;
  assign dataUnits_6_reset = reset;
  assign dataUnits_6_io_taskIn = dataUnits_5_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_6_io_validIn = dataUnits_5_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_6_io_connSS_availableTask_ready = io_connSS_6_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_6_io_connSS_qOutTask_valid = io_connSS_6_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_6_io_connSS_qOutTask_bits = io_connSS_6_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_7_clock = clock;
  assign dataUnits_7_reset = reset;
  assign dataUnits_7_io_taskIn = dataUnits_6_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_7_io_validIn = dataUnits_6_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_7_io_connSS_availableTask_ready = io_connSS_7_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_7_io_connSS_qOutTask_valid = io_connSS_7_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_7_io_connSS_qOutTask_bits = io_connSS_7_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign ctrlunits_0_clock = clock;
  assign ctrlunits_0_reset = reset;
  assign ctrlunits_0_io_reqTaskIn = ctrlunits_1_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_0_io_connSS_serveStealReq_valid = io_connSS_0_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_0_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_1_clock = clock;
  assign ctrlunits_1_reset = reset;
  assign ctrlunits_1_io_reqTaskIn = ctrlunits_2_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_1_io_connSS_serveStealReq_valid = io_connSS_1_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_1_io_connSS_stealReq_valid = io_connSS_1_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_2_clock = clock;
  assign ctrlunits_2_reset = reset;
  assign ctrlunits_2_io_reqTaskIn = ctrlunits_3_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_2_io_connSS_serveStealReq_valid = io_connSS_2_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_2_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_3_clock = clock;
  assign ctrlunits_3_reset = reset;
  assign ctrlunits_3_io_reqTaskIn = ctrlunits_4_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_3_io_connSS_serveStealReq_valid = io_connSS_3_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_3_io_connSS_stealReq_valid = io_connSS_3_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_4_clock = clock;
  assign ctrlunits_4_reset = reset;
  assign ctrlunits_4_io_reqTaskIn = ctrlunits_5_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_4_io_connSS_serveStealReq_valid = io_connSS_4_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_4_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_5_clock = clock;
  assign ctrlunits_5_reset = reset;
  assign ctrlunits_5_io_reqTaskIn = ctrlunits_6_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_5_io_connSS_serveStealReq_valid = io_connSS_5_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_5_io_connSS_stealReq_valid = io_connSS_5_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_6_clock = clock;
  assign ctrlunits_6_reset = reset;
  assign ctrlunits_6_io_reqTaskIn = ctrlunits_7_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_6_io_connSS_serveStealReq_valid = io_connSS_6_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_6_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_7_clock = clock;
  assign ctrlunits_7_reset = reset;
  assign ctrlunits_7_io_reqTaskIn = ctrlunits_0_io_reqTaskOut; // @[stealNetwork.scala 44:36]
  assign ctrlunits_7_io_connSS_serveStealReq_valid = io_connSS_7_ctrl_serveStealReq_valid; // @[stealNetwork.scala 45:36]
  assign ctrlunits_7_io_connSS_stealReq_valid = io_connSS_7_ctrl_stealReq_valid; // @[stealNetwork.scala 45:36]
endmodule
module stealServer_4(
  input          clock,
  input          reset,
  input          io_connNetwork_ctrl_serveStealReq_ready,
  output         io_connNetwork_ctrl_serveStealReq_valid,
  input          io_connNetwork_ctrl_stealReq_ready,
  output         io_connNetwork_ctrl_stealReq_valid,
  output         io_connNetwork_data_availableTask_ready,
  input          io_connNetwork_data_availableTask_valid,
  input  [127:0] io_connNetwork_data_availableTask_bits,
  input          io_connNetwork_data_qOutTask_ready,
  output         io_connNetwork_data_qOutTask_valid,
  output [127:0] io_connNetwork_data_qOutTask_bits,
  input  [5:0]   io_connQ_currLength,
  input          io_connQ_push_ready,
  output         io_connQ_push_valid,
  output [127:0] io_connQ_push_bits,
  output         io_connQ_pop_ready,
  input          io_connQ_pop_valid,
  input  [127:0] io_connQ_pop_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [127:0] _RAND_1;
  reg [127:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] stateReg; // @[stealServer.scala 28:39]
  reg [127:0] stolenTaskReg; // @[stealServer.scala 29:39]
  reg [127:0] giveTaskReg; // @[stealServer.scala 30:39]
  reg [1:0] taskRequestCount; // @[stealServer.scala 33:39]
  reg [31:0] tasksGivenAwayCount; // @[stealServer.scala 35:38]
  reg [31:0] requestKilledCount; // @[stealServer.scala 37:37]
  reg [31:0] requestFullCount; // @[stealServer.scala 38:35]
  wire  _T_1 = io_connQ_currLength < 6'h2; // @[stealServer.scala 54:34]
  wire  _T_2 = io_connQ_currLength > 6'h16; // @[stealServer.scala 57:40]
  wire [2:0] _GEN_0 = io_connQ_currLength > 6'h2 ? 3'h6 : 3'h0; // @[stealServer.scala 59:60 60:50 62:50]
  wire [31:0] _GEN_2 = io_connQ_currLength < 6'h2 ? 32'h8 : requestFullCount; // @[stealServer.scala 38:35 54:54 55:50]
  wire  _T_4 = stateReg == 3'h1; // @[stealServer.scala 64:25]
  wire  _T_9 = io_connQ_currLength >= 6'h2; // @[stealServer.scala 73:40]
  wire  _T_10 = tasksGivenAwayCount > 32'h0; // @[stealServer.scala 75:40]
  wire [31:0] _tasksGivenAwayCount_T_1 = tasksGivenAwayCount - 32'h1; // @[stealServer.scala 78:56]
  wire [1:0] _GEN_4 = requestFullCount == 32'h0 ? 2'h2 : 2'h1; // @[stealServer.scala 80:45 81:50 83:50]
  wire [1:0] _GEN_5 = tasksGivenAwayCount > 32'h0 ? 2'h2 : _GEN_4; // @[stealServer.scala 75:46 76:50]
  wire [31:0] _GEN_6 = tasksGivenAwayCount > 32'h0 ? 32'h8 : requestKilledCount; // @[stealServer.scala 37:37 75:46 77:50]
  wire [31:0] _GEN_7 = tasksGivenAwayCount > 32'h0 ? _tasksGivenAwayCount_T_1 : tasksGivenAwayCount; // @[stealServer.scala 75:46 78:33 35:38]
  wire [2:0] _GEN_9 = io_connQ_currLength >= 6'h2 ? 3'h6 : {{1'd0}, _GEN_5}; // @[stealServer.scala 73:61 74:50]
  wire [31:0] _GEN_10 = io_connQ_currLength >= 6'h2 ? requestKilledCount : _GEN_6; // @[stealServer.scala 37:37 73:61]
  wire [31:0] _GEN_11 = io_connQ_currLength >= 6'h2 ? tasksGivenAwayCount : _GEN_7; // @[stealServer.scala 35:38 73:61]
  wire  _GEN_12 = io_connQ_currLength >= 6'h2 ? 1'h0 : _T_10; // @[stealServer.scala 50:47 73:61]
  wire [1:0] _GEN_13 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 2'h1 : taskRequestCount; // @[stealServer.scala 33:39 69:83 70:50]
  wire [2:0] _GEN_15 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 3'h1 : _GEN_9; // @[stealServer.scala 69:83 72:50]
  wire [31:0] _GEN_16 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? requestKilledCount : _GEN_10; // @[stealServer.scala 37:37 69:83]
  wire [31:0] _GEN_17 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? tasksGivenAwayCount : _GEN_11; // @[stealServer.scala 35:38 69:83]
  wire  _GEN_18 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 1'h0 : _GEN_12; // @[stealServer.scala 50:47 69:83]
  wire  _GEN_24 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1 ? 1'h0 : _GEN_18; // @[stealServer.scala 50:47 66:77]
  wire [31:0] _requestFullCount_T_1 = requestFullCount - 32'h1; // @[stealServer.scala 87:70]
  wire  _T_12 = stateReg == 3'h2; // @[stealServer.scala 91:25]
  wire [31:0] _GEN_26 = requestKilledCount == 32'h0 ? 32'h8 : requestFullCount; // @[stealServer.scala 38:35 98:47 99:50]
  wire [1:0] _GEN_27 = requestKilledCount == 32'h0 ? 2'h1 : 2'h2; // @[stealServer.scala 98:47 100:50 102:50]
  wire [1:0] _GEN_28 = _T_9 ? 2'h0 : _GEN_27; // @[stealServer.scala 96:61 97:50]
  wire [31:0] _GEN_29 = _T_9 ? requestFullCount : _GEN_26; // @[stealServer.scala 38:35 96:61]
  wire [1:0] _GEN_30 = io_connNetwork_data_availableTask_valid ? 2'h3 : _GEN_28; // @[stealServer.scala 93:54 94:50]
  wire [127:0] _GEN_31 = io_connNetwork_data_availableTask_valid ? io_connNetwork_data_availableTask_bits :
    stolenTaskReg; // @[stealServer.scala 29:39 93:54 95:50]
  wire [31:0] _GEN_32 = io_connNetwork_data_availableTask_valid ? requestFullCount : _GEN_29; // @[stealServer.scala 38:35 93:54]
  wire [31:0] _requestKilledCount_T_1 = requestKilledCount - 32'h1; // @[stealServer.scala 106:72]
  wire [31:0] _GEN_33 = ~io_connNetwork_ctrl_serveStealReq_ready ? _requestKilledCount_T_1 : 32'h8; // @[stealServer.scala 105:55 106:50 108:50]
  wire  _T_16 = stateReg == 3'h3; // @[stealServer.scala 113:25]
  wire [2:0] _GEN_34 = io_connQ_currLength >= 6'h16 ? 3'h5 : 3'h3; // @[stealServer.scala 116:61 117:50 120:50]
  wire [127:0] _GEN_35 = io_connQ_currLength >= 6'h16 ? stolenTaskReg : giveTaskReg; // @[stealServer.scala 116:61 118:50 30:39]
  wire [2:0] _GEN_36 = io_connQ_push_ready ? 3'h0 : _GEN_34; // @[stealServer.scala 114:34 115:50]
  wire [127:0] _GEN_37 = io_connQ_push_ready ? giveTaskReg : _GEN_35; // @[stealServer.scala 114:34 30:39]
  wire  _T_18 = stateReg == 3'h4; // @[stealServer.scala 126:25]
  wire [31:0] _GEN_38 = io_connQ_currLength == 6'h0 ? 32'h8 : requestFullCount; // @[stealServer.scala 130:48 131:50 38:35]
  wire [2:0] _GEN_39 = io_connQ_currLength == 6'h0 ? 3'h1 : 3'h4; // @[stealServer.scala 130:48 132:50 134:50]
  wire [2:0] _GEN_40 = io_connQ_pop_valid ? 3'h5 : _GEN_39; // @[stealServer.scala 127:33 128:50]
  wire [127:0] _GEN_41 = io_connQ_pop_valid ? io_connQ_pop_bits : giveTaskReg; // @[stealServer.scala 127:33 129:50 30:39]
  wire [31:0] _GEN_42 = io_connQ_pop_valid ? requestFullCount : _GEN_38; // @[stealServer.scala 127:33 38:35]
  wire  _T_20 = stateReg == 3'h5; // @[stealServer.scala 139:25]
  wire [31:0] _tasksGivenAwayCount_T_3 = tasksGivenAwayCount + 32'h1; // @[stealServer.scala 141:73]
  wire [31:0] _GEN_43 = io_connNetwork_data_qOutTask_ready ? _tasksGivenAwayCount_T_3 : tasksGivenAwayCount; // @[stealServer.scala 140:49 141:50 35:38]
  wire [2:0] _GEN_44 = io_connNetwork_data_qOutTask_ready ? 3'h0 : 3'h5; // @[stealServer.scala 140:49 142:50 144:50]
  wire  _T_21 = stateReg == 3'h6; // @[stealServer.scala 150:25]
  wire  _T_24 = io_connNetwork_ctrl_serveStealReq_ready & _T_9; // @[stealServer.scala 152:50]
  wire  _T_25 = _T_2 | _T_24; // @[stealServer.scala 151:53]
  wire [2:0] _GEN_46 = _T_1 ? 3'h1 : 3'h6; // @[stealServer.scala 158:60 160:50 163:50]
  wire [1:0] _GEN_47 = _T_1 ? 2'h1 : taskRequestCount; // @[stealServer.scala 158:60 161:50 33:39]
  wire [31:0] _GEN_48 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 32'h8 : _GEN_2; // @[stealServer.scala 154:103 155:50]
  wire [2:0] _GEN_49 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 3'h1 : _GEN_46; // @[stealServer.scala 154:103 156:50]
  wire [1:0] _GEN_50 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 2'h2 : _GEN_47; // @[stealServer.scala 154:103 157:50]
  wire [2:0] _GEN_51 = _T_25 ? 3'h4 : _GEN_49; // @[stealServer.scala 152:95 153:50]
  wire [31:0] _GEN_52 = _T_25 ? requestFullCount : _GEN_48; // @[stealServer.scala 152:95 38:35]
  wire [1:0] _GEN_53 = _T_25 ? taskRequestCount : _GEN_50; // @[stealServer.scala 152:95 33:39]
  wire [2:0] _GEN_54 = stateReg == 3'h6 ? _GEN_51 : stateReg; // @[stealServer.scala 150:54 28:39]
  wire [31:0] _GEN_55 = stateReg == 3'h6 ? _GEN_52 : requestFullCount; // @[stealServer.scala 150:54 38:35]
  wire [1:0] _GEN_56 = stateReg == 3'h6 ? _GEN_53 : taskRequestCount; // @[stealServer.scala 150:54 33:39]
  wire [31:0] _GEN_58 = stateReg == 3'h5 ? _GEN_43 : tasksGivenAwayCount; // @[stealServer.scala 139:48 35:38]
  wire [2:0] _GEN_59 = stateReg == 3'h5 ? _GEN_44 : _GEN_54; // @[stealServer.scala 139:48]
  wire [127:0] _GEN_61 = stateReg == 3'h5 ? giveTaskReg : 128'h0; // @[stealServer.scala 139:48 148:51 47:47]
  wire [31:0] _GEN_62 = stateReg == 3'h5 ? requestFullCount : _GEN_55; // @[stealServer.scala 139:48 38:35]
  wire [1:0] _GEN_63 = stateReg == 3'h5 ? taskRequestCount : _GEN_56; // @[stealServer.scala 139:48 33:39]
  wire  _GEN_64 = stateReg == 3'h5 ? 1'h0 : _T_21; // @[stealServer.scala 139:48 50:47]
  wire [2:0] _GEN_65 = stateReg == 3'h4 ? _GEN_40 : _GEN_59; // @[stealServer.scala 126:43]
  wire [127:0] _GEN_66 = stateReg == 3'h4 ? _GEN_41 : giveTaskReg; // @[stealServer.scala 126:43 30:39]
  wire [31:0] _GEN_67 = stateReg == 3'h4 ? _GEN_42 : _GEN_62; // @[stealServer.scala 126:43]
  wire [31:0] _GEN_69 = stateReg == 3'h4 ? tasksGivenAwayCount : _GEN_58; // @[stealServer.scala 126:43 35:38]
  wire  _GEN_70 = stateReg == 3'h4 ? 1'h0 : _T_20; // @[stealServer.scala 126:43 46:47]
  wire [127:0] _GEN_71 = stateReg == 3'h4 ? 128'h0 : _GEN_61; // @[stealServer.scala 126:43 47:47]
  wire [1:0] _GEN_72 = stateReg == 3'h4 ? taskRequestCount : _GEN_63; // @[stealServer.scala 126:43 33:39]
  wire  _GEN_73 = stateReg == 3'h4 ? 1'h0 : _GEN_64; // @[stealServer.scala 126:43 50:47]
  wire [2:0] _GEN_74 = stateReg == 3'h3 ? _GEN_36 : _GEN_65; // @[stealServer.scala 113:44]
  wire [127:0] _GEN_75 = stateReg == 3'h3 ? _GEN_37 : _GEN_66; // @[stealServer.scala 113:44]
  wire [127:0] _GEN_76 = stateReg == 3'h3 ? stolenTaskReg : 128'h0; // @[stealServer.scala 113:44 123:51 42:47]
  wire [31:0] _GEN_78 = stateReg == 3'h3 ? requestFullCount : _GEN_67; // @[stealServer.scala 113:44 38:35]
  wire  _GEN_79 = stateReg == 3'h3 ? 1'h0 : _T_18; // @[stealServer.scala 113:44 41:47]
  wire [31:0] _GEN_80 = stateReg == 3'h3 ? tasksGivenAwayCount : _GEN_69; // @[stealServer.scala 113:44 35:38]
  wire  _GEN_81 = stateReg == 3'h3 ? 1'h0 : _GEN_70; // @[stealServer.scala 113:44 46:47]
  wire [127:0] _GEN_82 = stateReg == 3'h3 ? 128'h0 : _GEN_71; // @[stealServer.scala 113:44 47:47]
  wire [1:0] _GEN_83 = stateReg == 3'h3 ? taskRequestCount : _GEN_72; // @[stealServer.scala 113:44 33:39]
  wire  _GEN_84 = stateReg == 3'h3 ? 1'h0 : _GEN_73; // @[stealServer.scala 113:44 50:47]
  wire [127:0] _GEN_91 = stateReg == 3'h2 ? 128'h0 : _GEN_76; // @[stealServer.scala 91:46 42:47]
  wire  _GEN_92 = stateReg == 3'h2 ? 1'h0 : _T_16; // @[stealServer.scala 91:46 43:47]
  wire  _GEN_93 = stateReg == 3'h2 ? 1'h0 : _GEN_79; // @[stealServer.scala 91:46 41:47]
  wire  _GEN_95 = stateReg == 3'h2 ? 1'h0 : _GEN_81; // @[stealServer.scala 91:46 46:47]
  wire [127:0] _GEN_96 = stateReg == 3'h2 ? 128'h0 : _GEN_82; // @[stealServer.scala 91:46 47:47]
  wire  _GEN_98 = stateReg == 3'h2 ? 1'h0 : _GEN_84; // @[stealServer.scala 91:46 50:47]
  wire  _GEN_105 = stateReg == 3'h1 ? _GEN_24 : _GEN_98; // @[stealServer.scala 64:47]
  wire  _GEN_107 = stateReg == 3'h1 ? 1'h0 : _T_12; // @[stealServer.scala 45:47 64:47]
  wire [127:0] _GEN_109 = stateReg == 3'h1 ? 128'h0 : _GEN_91; // @[stealServer.scala 42:47 64:47]
  wire  _GEN_110 = stateReg == 3'h1 ? 1'h0 : _GEN_92; // @[stealServer.scala 43:47 64:47]
  wire  _GEN_111 = stateReg == 3'h1 ? 1'h0 : _GEN_93; // @[stealServer.scala 41:47 64:47]
  wire  _GEN_112 = stateReg == 3'h1 ? 1'h0 : _GEN_95; // @[stealServer.scala 46:47 64:47]
  wire [127:0] _GEN_113 = stateReg == 3'h1 ? 128'h0 : _GEN_96; // @[stealServer.scala 47:47 64:47]
  assign io_connNetwork_ctrl_serveStealReq_valid = stateReg == 3'h0 ? 1'h0 : _GEN_105; // @[stealServer.scala 53:34 50:47]
  assign io_connNetwork_ctrl_stealReq_valid = stateReg == 3'h0 ? 1'h0 : _T_4; // @[stealServer.scala 53:34 49:47]
  assign io_connNetwork_data_availableTask_ready = stateReg == 3'h0 ? 1'h0 : _GEN_107; // @[stealServer.scala 53:34 45:47]
  assign io_connNetwork_data_qOutTask_valid = stateReg == 3'h0 ? 1'h0 : _GEN_112; // @[stealServer.scala 53:34 46:47]
  assign io_connNetwork_data_qOutTask_bits = stateReg == 3'h0 ? 128'h0 : _GEN_113; // @[stealServer.scala 53:34 47:47]
  assign io_connQ_push_valid = stateReg == 3'h0 ? 1'h0 : _GEN_110; // @[stealServer.scala 53:34 43:47]
  assign io_connQ_push_bits = stateReg == 3'h0 ? 128'h0 : _GEN_109; // @[stealServer.scala 53:34 42:47]
  assign io_connQ_pop_ready = stateReg == 3'h0 ? 1'h0 : _GEN_111; // @[stealServer.scala 53:34 41:47]
  always @(posedge clock) begin
    if (reset) begin // @[stealServer.scala 28:39]
      stateReg <= 3'h0; // @[stealServer.scala 28:39]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 53:34]
      if (io_connQ_currLength < 6'h2) begin // @[stealServer.scala 54:54]
        stateReg <= 3'h1; // @[stealServer.scala 56:50]
      end else if (io_connQ_currLength > 6'h16) begin // @[stealServer.scala 57:60]
        stateReg <= 3'h4; // @[stealServer.scala 58:50]
      end else begin
        stateReg <= _GEN_0;
      end
    end else if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
      if (io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1) begin // @[stealServer.scala 66:77]
        stateReg <= 3'h2; // @[stealServer.scala 67:50]
      end else begin
        stateReg <= _GEN_15;
      end
    end else if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
      stateReg <= {{1'd0}, _GEN_30};
    end else begin
      stateReg <= _GEN_74;
    end
    if (reset) begin // @[stealServer.scala 29:39]
      stolenTaskReg <= 128'h0; // @[stealServer.scala 29:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (!(stateReg == 3'h1)) begin // @[stealServer.scala 64:47]
        if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
          stolenTaskReg <= _GEN_31;
        end
      end
    end
    if (reset) begin // @[stealServer.scala 30:39]
      giveTaskReg <= 128'h0; // @[stealServer.scala 30:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (!(stateReg == 3'h1)) begin // @[stealServer.scala 64:47]
        if (!(stateReg == 3'h2)) begin // @[stealServer.scala 91:46]
          giveTaskReg <= _GEN_75;
        end
      end
    end
    if (reset) begin // @[stealServer.scala 33:39]
      taskRequestCount <= 2'h1; // @[stealServer.scala 33:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
        if (!(io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1)) begin // @[stealServer.scala 66:77]
          taskRequestCount <= _GEN_13;
        end
      end else if (!(stateReg == 3'h2)) begin // @[stealServer.scala 91:46]
        taskRequestCount <= _GEN_83;
      end
    end
    if (reset) begin // @[stealServer.scala 35:38]
      tasksGivenAwayCount <= 32'h0; // @[stealServer.scala 35:38]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
        if (!(io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1)) begin // @[stealServer.scala 66:77]
          tasksGivenAwayCount <= _GEN_17;
        end
      end else if (!(stateReg == 3'h2)) begin // @[stealServer.scala 91:46]
        tasksGivenAwayCount <= _GEN_80;
      end
    end
    if (reset) begin // @[stealServer.scala 37:37]
      requestKilledCount <= 32'h8; // @[stealServer.scala 37:37]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
        if (io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1) begin // @[stealServer.scala 66:77]
          requestKilledCount <= 32'h8; // @[stealServer.scala 68:50]
        end else begin
          requestKilledCount <= _GEN_16;
        end
      end else if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
        requestKilledCount <= _GEN_33;
      end
    end
    if (reset) begin // @[stealServer.scala 38:35]
      requestFullCount <= 32'h8; // @[stealServer.scala 38:35]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 53:34]
      if (io_connQ_currLength < 6'h2) begin // @[stealServer.scala 54:54]
        requestFullCount <= 32'h8; // @[stealServer.scala 55:50]
      end
    end else if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
      if (io_connNetwork_ctrl_serveStealReq_ready) begin // @[stealServer.scala 86:54]
        requestFullCount <= _requestFullCount_T_1; // @[stealServer.scala 87:50]
      end else begin
        requestFullCount <= 32'h8; // @[stealServer.scala 89:50]
      end
    end else if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
      requestFullCount <= _GEN_32;
    end else begin
      requestFullCount <= _GEN_78;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  stateReg = _RAND_0[2:0];
  _RAND_1 = {4{`RANDOM}};
  stolenTaskReg = _RAND_1[127:0];
  _RAND_2 = {4{`RANDOM}};
  giveTaskReg = _RAND_2[127:0];
  _RAND_3 = {1{`RANDOM}};
  taskRequestCount = _RAND_3[1:0];
  _RAND_4 = {1{`RANDOM}};
  tasksGivenAwayCount = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  requestKilledCount = _RAND_5[31:0];
  _RAND_6 = {1{`RANDOM}};
  requestFullCount = _RAND_6[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module hw_deque_4(
  input          clock,
  input          reset,
  output         io_connVec_0_push_ready,
  input          io_connVec_0_push_valid,
  input  [127:0] io_connVec_0_push_bits,
  input          io_connVec_0_pop_ready,
  output         io_connVec_0_pop_valid,
  output [127:0] io_connVec_0_pop_bits,
  output [6:0]   io_connVec_1_currLength,
  output         io_connVec_1_push_ready,
  input          io_connVec_1_push_valid,
  input  [127:0] io_connVec_1_push_bits,
  input          io_connVec_1_pop_ready,
  output         io_connVec_1_pop_valid,
  output [127:0] io_connVec_1_pop_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  bramMem_clk; // @[deque.scala 34:30]
  wire  bramMem_rst; // @[deque.scala 34:30]
  wire [7:0] bramMem_a_addr; // @[deque.scala 34:30]
  wire [127:0] bramMem_a_din; // @[deque.scala 34:30]
  wire  bramMem_a_wr; // @[deque.scala 34:30]
  wire [127:0] bramMem_a_dout; // @[deque.scala 34:30]
  wire [7:0] bramMem_b_addr; // @[deque.scala 34:30]
  wire [127:0] bramMem_b_din; // @[deque.scala 34:30]
  wire  bramMem_b_wr; // @[deque.scala 34:30]
  wire [127:0] bramMem_b_dout; // @[deque.scala 34:30]
  reg [6:0] sideReg_0; // @[deque.scala 23:35]
  reg [6:0] sideReg_1; // @[deque.scala 23:81]
  reg  readLatency_0; // @[deque.scala 29:43]
  reg  readLatency_1; // @[deque.scala 29:43]
  reg [1:0] writeLatency_0; // @[deque.scala 30:43]
  reg [1:0] writeLatency_1; // @[deque.scala 30:43]
  reg [2:0] stateRegs_0; // @[deque.scala 54:40]
  reg [2:0] stateRegs_1; // @[deque.scala 54:40]
  wire [6:0] _currLen_T_1 = 7'h22 + sideReg_1; // @[deque.scala 176:31]
  wire [6:0] _currLen_T_3 = _currLen_T_1 - sideReg_0; // @[deque.scala 176:44]
  wire [6:0] _currLen_T_5 = _currLen_T_3 - 7'h1; // @[deque.scala 176:58]
  wire [6:0] _currLen_T_7 = sideReg_1 - sideReg_0; // @[deque.scala 178:31]
  wire [6:0] _currLen_T_9 = _currLen_T_7 - 7'h1; // @[deque.scala 178:44]
  wire [6:0] currLen = sideReg_0 > sideReg_1 ? _currLen_T_5 : _currLen_T_9; // @[deque.scala 175:34 176:17 178:17]
  wire  _T_3 = currLen > 7'h1; // @[deque.scala 75:64]
  wire  _T_5 = stateRegs_1 == 3'h0; // @[deque.scala 75:115]
  wire  _T_7 = currLen > 7'h0; // @[deque.scala 75:141]
  wire [1:0] _GEN_0 = io_connVec_0_pop_ready & currLen > 7'h1 | io_connVec_0_pop_ready & stateRegs_1 == 3'h0 & currLen
     > 7'h0 ? 2'h2 : 2'h0; // @[deque.scala 75:148 76:34 78:34]
  wire [1:0] _GEN_1 = io_connVec_0_push_valid & currLen < 7'h22 ? 2'h1 : _GEN_0; // @[deque.scala 73:71 74:34]
  wire  _T_10 = stateRegs_0 == 3'h1; // @[deque.scala 92:33]
  wire [1:0] _writeLatency_0_T_1 = writeLatency_0 - 2'h1; // @[deque.scala 98:52]
  wire [1:0] _GEN_3 = writeLatency_0 == 2'h0 ? 2'h3 : 2'h1; // @[deque.scala 94:42 96:33 99:33]
  wire  _GEN_4 = ~readLatency_0 ? 1'h0 : readLatency_0 - 1'h1; // @[deque.scala 107:41 108:33 111:33]
  wire [2:0] _GEN_5 = ~readLatency_0 ? 3'h4 : 3'h2; // @[deque.scala 107:41 109:33 112:33]
  wire [6:0] _T_15 = 7'h22 - 7'h1; // @[deque.scala 117:48]
  wire [6:0] _bramMem_io_a_addr_T_1 = sideReg_0 + 7'h1; // @[deque.scala 120:54]
  wire [6:0] _GEN_6 = sideReg_0 == _T_15 ? 7'h0 : _bramMem_io_a_addr_T_1; // @[deque.scala 117:54 118:39 120:39]
  wire  _T_17 = stateRegs_0 == 3'h4; // @[deque.scala 129:33]
  wire  _T_21 = stateRegs_0 == 3'h3; // @[deque.scala 153:33]
  wire [6:0] _sideReg_0_T_5 = sideReg_0 - 7'h1; // @[deque.scala 162:46]
  wire [6:0] _GEN_9 = sideReg_0 == 7'h0 ? _T_15 : _sideReg_0_T_5; // @[deque.scala 159:41 160:32 162:32]
  wire [2:0] _GEN_10 = stateRegs_0 == 3'h3 ? 3'h0 : stateRegs_0; // @[deque.scala 153:48 155:38 54:40]
  wire [6:0] _GEN_11 = stateRegs_0 == 3'h3 ? _GEN_9 : sideReg_0; // @[deque.scala 153:48 23:35]
  wire [2:0] _GEN_13 = stateRegs_0 == 3'h4 ? 3'h0 : _GEN_10; // @[deque.scala 129:47 131:38]
  wire [6:0] _GEN_14 = stateRegs_0 == 3'h4 ? _GEN_6 : _GEN_11; // @[deque.scala 129:47]
  wire [27:0] _GEN_15 = stateRegs_0 == 3'h4 ? {{21'd0}, _GEN_6} : 28'hfffffff; // @[deque.scala 129:47 59:34]
  wire [127:0] _GEN_17 = stateRegs_0 == 3'h4 ? bramMem_a_dout : 128'h0; // @[deque.scala 129:47 152:38 67:34]
  wire  _GEN_18 = stateRegs_0 == 3'h4 ? 1'h0 : _T_21; // @[deque.scala 129:47 65:34]
  wire [27:0] _GEN_21 = stateRegs_0 == 3'h2 ? {{21'd0}, _GEN_6} : _GEN_15; // @[deque.scala 105:51]
  wire  _GEN_23 = stateRegs_0 == 3'h2 ? 1'h0 : _T_17; // @[deque.scala 105:51 66:34]
  wire [127:0] _GEN_24 = stateRegs_0 == 3'h2 ? 128'h0 : _GEN_17; // @[deque.scala 105:51 67:34]
  wire  _GEN_25 = stateRegs_0 == 3'h2 ? 1'h0 : _GEN_18; // @[deque.scala 105:51 65:34]
  wire [27:0] _GEN_28 = stateRegs_0 == 3'h1 ? {{21'd0}, sideReg_0} : _GEN_21; // @[deque.scala 102:38 92:52]
  wire  _GEN_32 = stateRegs_0 == 3'h1 ? 1'h0 : _GEN_23; // @[deque.scala 66:34 92:52]
  wire [127:0] _GEN_33 = stateRegs_0 == 3'h1 ? 128'h0 : _GEN_24; // @[deque.scala 67:34 92:52]
  wire  _GEN_34 = stateRegs_0 == 3'h1 ? 1'h0 : _GEN_25; // @[deque.scala 65:34 92:52]
  wire [27:0] _GEN_37 = stateRegs_0 == 3'h0 ? 28'hfffffff : _GEN_28; // @[deque.scala 59:34 71:42]
  wire [1:0] _GEN_44 = io_connVec_1_pop_ready & _T_3 | io_connVec_1_pop_ready & ~io_connVec_0_pop_ready & _T_7 &
    stateRegs_0 != 3'h4 ? 2'h2 : 2'h0; // @[deque.scala 83:175 87:34 89:34]
  wire [1:0] _GEN_45 = io_connVec_1_push_valid & currLen < _T_15 ? 2'h1 : _GEN_44; // @[deque.scala 81:79 82:34]
  wire  _T_37 = stateRegs_1 == 3'h1; // @[deque.scala 92:33]
  wire [1:0] _writeLatency_1_T_1 = writeLatency_1 - 2'h1; // @[deque.scala 98:52]
  wire [1:0] _GEN_47 = writeLatency_1 == 2'h0 ? 2'h3 : 2'h1; // @[deque.scala 94:42 96:33 99:33]
  wire  _GEN_48 = ~readLatency_1 ? 1'h0 : readLatency_1 - 1'h1; // @[deque.scala 107:41 108:33 111:33]
  wire [2:0] _GEN_49 = ~readLatency_1 ? 3'h4 : 3'h2; // @[deque.scala 107:41 109:33 112:33]
  wire [6:0] _bramMem_io_b_addr_T_3 = sideReg_1 - 7'h1; // @[deque.scala 126:54]
  wire [6:0] _GEN_50 = sideReg_1 == 7'h0 ? _T_15 : _bramMem_io_b_addr_T_3; // @[deque.scala 123:41 124:39 126:39]
  wire  _T_42 = stateRegs_1 == 3'h4; // @[deque.scala 129:33]
  wire  _T_44 = stateRegs_1 == 3'h3; // @[deque.scala 153:33]
  wire [6:0] _sideReg_1_T_5 = sideReg_1 + 7'h1; // @[deque.scala 168:46]
  wire [6:0] _GEN_53 = sideReg_1 == _T_15 ? 7'h0 : _sideReg_1_T_5; // @[deque.scala 165:56 166:32 168:32]
  wire [2:0] _GEN_54 = stateRegs_1 == 3'h3 ? 3'h0 : stateRegs_1; // @[deque.scala 153:48 155:38 54:40]
  wire [6:0] _GEN_55 = stateRegs_1 == 3'h3 ? _GEN_53 : sideReg_1; // @[deque.scala 153:48 23:81]
  wire [2:0] _GEN_57 = stateRegs_1 == 3'h4 ? 3'h0 : _GEN_54; // @[deque.scala 129:47 131:38]
  wire [6:0] _GEN_58 = stateRegs_1 == 3'h4 ? _GEN_50 : _GEN_55; // @[deque.scala 129:47]
  wire [27:0] _GEN_59 = stateRegs_1 == 3'h4 ? {{21'd0}, _GEN_50} : 28'hfffffff; // @[deque.scala 129:47 59:34]
  wire [127:0] _GEN_61 = stateRegs_1 == 3'h4 ? bramMem_b_dout : 128'h0; // @[deque.scala 129:47 152:38 67:34]
  wire  _GEN_62 = stateRegs_1 == 3'h4 ? 1'h0 : _T_44; // @[deque.scala 129:47 65:34]
  wire [27:0] _GEN_65 = stateRegs_1 == 3'h2 ? {{21'd0}, _GEN_50} : _GEN_59; // @[deque.scala 105:51]
  wire  _GEN_67 = stateRegs_1 == 3'h2 ? 1'h0 : _T_42; // @[deque.scala 105:51 66:34]
  wire [127:0] _GEN_68 = stateRegs_1 == 3'h2 ? 128'h0 : _GEN_61; // @[deque.scala 105:51 67:34]
  wire  _GEN_69 = stateRegs_1 == 3'h2 ? 1'h0 : _GEN_62; // @[deque.scala 105:51 65:34]
  wire [27:0] _GEN_72 = stateRegs_1 == 3'h1 ? {{21'd0}, sideReg_1} : _GEN_65; // @[deque.scala 102:38 92:52]
  wire  _GEN_76 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_67; // @[deque.scala 66:34 92:52]
  wire [127:0] _GEN_77 = stateRegs_1 == 3'h1 ? 128'h0 : _GEN_68; // @[deque.scala 67:34 92:52]
  wire  _GEN_78 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_69; // @[deque.scala 65:34 92:52]
  wire [27:0] _GEN_81 = _T_5 ? 28'hfffffff : _GEN_72; // @[deque.scala 59:34 71:42]
  DualPortBRAM #(.DATA(128), .ADDR(8)) bramMem ( // @[deque.scala 34:30]
    .clk(bramMem_clk),
    .rst(bramMem_rst),
    .a_addr(bramMem_a_addr),
    .a_din(bramMem_a_din),
    .a_wr(bramMem_a_wr),
    .a_dout(bramMem_a_dout),
    .b_addr(bramMem_b_addr),
    .b_din(bramMem_b_din),
    .b_wr(bramMem_b_wr),
    .b_dout(bramMem_b_dout)
  );
  assign io_connVec_0_push_ready = stateRegs_0 == 3'h0 ? 1'h0 : _GEN_34; // @[deque.scala 65:34 71:42]
  assign io_connVec_0_pop_valid = stateRegs_0 == 3'h0 ? 1'h0 : _GEN_32; // @[deque.scala 66:34 71:42]
  assign io_connVec_0_pop_bits = stateRegs_0 == 3'h0 ? 128'h0 : _GEN_33; // @[deque.scala 67:34 71:42]
  assign io_connVec_1_currLength = sideReg_0 > sideReg_1 ? _currLen_T_5 : _currLen_T_9; // @[deque.scala 175:34 176:17 178:17]
  assign io_connVec_1_push_ready = _T_5 ? 1'h0 : _GEN_78; // @[deque.scala 65:34 71:42]
  assign io_connVec_1_pop_valid = _T_5 ? 1'h0 : _GEN_76; // @[deque.scala 66:34 71:42]
  assign io_connVec_1_pop_bits = _T_5 ? 128'h0 : _GEN_77; // @[deque.scala 67:34 71:42]
  assign bramMem_clk = clock; // @[deque.scala 36:22]
  assign bramMem_rst = reset; // @[deque.scala 37:22]
  assign bramMem_a_addr = _GEN_37[7:0];
  assign bramMem_a_din = io_connVec_0_push_bits; // @[deque.scala 60:34]
  assign bramMem_a_wr = stateRegs_0 == 3'h0 ? 1'h0 : _T_10; // @[deque.scala 61:34 71:42]
  assign bramMem_b_addr = _GEN_81[7:0];
  assign bramMem_b_din = io_connVec_1_push_bits; // @[deque.scala 60:34]
  assign bramMem_b_wr = _T_5 ? 1'h0 : _T_37; // @[deque.scala 61:34 71:42]
  always @(posedge clock) begin
    if (reset) begin // @[deque.scala 23:35]
      sideReg_0 <= 7'h0; // @[deque.scala 23:35]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (!(stateRegs_0 == 3'h1)) begin // @[deque.scala 92:52]
        if (!(stateRegs_0 == 3'h2)) begin // @[deque.scala 105:51]
          sideReg_0 <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[deque.scala 23:81]
      sideReg_1 <= 7'h1; // @[deque.scala 23:81]
    end else if (!(_T_5)) begin // @[deque.scala 71:42]
      if (!(stateRegs_1 == 3'h1)) begin // @[deque.scala 92:52]
        if (!(stateRegs_1 == 3'h2)) begin // @[deque.scala 105:51]
          sideReg_1 <= _GEN_58;
        end
      end
    end
    if (reset) begin // @[deque.scala 29:43]
      readLatency_0 <= 1'h0; // @[deque.scala 29:43]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (!(stateRegs_0 == 3'h1)) begin // @[deque.scala 92:52]
        if (stateRegs_0 == 3'h2) begin // @[deque.scala 105:51]
          readLatency_0 <= _GEN_4;
        end
      end
    end
    if (reset) begin // @[deque.scala 29:43]
      readLatency_1 <= 1'h0; // @[deque.scala 29:43]
    end else if (!(_T_5)) begin // @[deque.scala 71:42]
      if (!(stateRegs_1 == 3'h1)) begin // @[deque.scala 92:52]
        if (stateRegs_1 == 3'h2) begin // @[deque.scala 105:51]
          readLatency_1 <= _GEN_48;
        end
      end
    end
    if (reset) begin // @[deque.scala 30:43]
      writeLatency_0 <= 2'h1; // @[deque.scala 30:43]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (stateRegs_0 == 3'h1) begin // @[deque.scala 92:52]
        if (writeLatency_0 == 2'h0) begin // @[deque.scala 94:42]
          writeLatency_0 <= 2'h1; // @[deque.scala 95:33]
        end else begin
          writeLatency_0 <= _writeLatency_0_T_1; // @[deque.scala 98:33]
        end
      end
    end
    if (reset) begin // @[deque.scala 30:43]
      writeLatency_1 <= 2'h1; // @[deque.scala 30:43]
    end else if (!(_T_5)) begin // @[deque.scala 71:42]
      if (stateRegs_1 == 3'h1) begin // @[deque.scala 92:52]
        if (writeLatency_1 == 2'h0) begin // @[deque.scala 94:42]
          writeLatency_1 <= 2'h1; // @[deque.scala 95:33]
        end else begin
          writeLatency_1 <= _writeLatency_1_T_1; // @[deque.scala 98:33]
        end
      end
    end
    if (reset) begin // @[deque.scala 54:40]
      stateRegs_0 <= 3'h0; // @[deque.scala 54:40]
    end else if (stateRegs_0 == 3'h0) begin // @[deque.scala 71:42]
      stateRegs_0 <= {{1'd0}, _GEN_1};
    end else if (stateRegs_0 == 3'h1) begin // @[deque.scala 92:52]
      stateRegs_0 <= {{1'd0}, _GEN_3};
    end else if (stateRegs_0 == 3'h2) begin // @[deque.scala 105:51]
      stateRegs_0 <= _GEN_5;
    end else begin
      stateRegs_0 <= _GEN_13;
    end
    if (reset) begin // @[deque.scala 54:40]
      stateRegs_1 <= 3'h0; // @[deque.scala 54:40]
    end else if (_T_5) begin // @[deque.scala 71:42]
      stateRegs_1 <= {{1'd0}, _GEN_45};
    end else if (stateRegs_1 == 3'h1) begin // @[deque.scala 92:52]
      stateRegs_1 <= {{1'd0}, _GEN_47};
    end else if (stateRegs_1 == 3'h2) begin // @[deque.scala 105:51]
      stateRegs_1 <= _GEN_49;
    end else begin
      stateRegs_1 <= _GEN_57;
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  sideReg_0 = _RAND_0[6:0];
  _RAND_1 = {1{`RANDOM}};
  sideReg_1 = _RAND_1[6:0];
  _RAND_2 = {1{`RANDOM}};
  readLatency_0 = _RAND_2[0:0];
  _RAND_3 = {1{`RANDOM}};
  readLatency_1 = _RAND_3[0:0];
  _RAND_4 = {1{`RANDOM}};
  writeLatency_0 = _RAND_4[1:0];
  _RAND_5 = {1{`RANDOM}};
  writeLatency_1 = _RAND_5[1:0];
  _RAND_6 = {1{`RANDOM}};
  stateRegs_0 = _RAND_6[2:0];
  _RAND_7 = {1{`RANDOM}};
  stateRegs_1 = _RAND_7[2:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module stealNW_TQ_1(
  input          clock,
  input          reset,
  output         io_connPE_0_push_ready,
  input          io_connPE_0_push_valid,
  input  [127:0] io_connPE_0_push_bits,
  input          io_connPE_0_pop_ready,
  output         io_connPE_0_pop_valid,
  output [127:0] io_connPE_0_pop_bits,
  output         io_connPE_1_push_ready,
  input          io_connPE_1_push_valid,
  input  [127:0] io_connPE_1_push_bits,
  input          io_connPE_1_pop_ready,
  output         io_connPE_1_pop_valid,
  output [127:0] io_connPE_1_pop_bits,
  output         io_connPE_2_push_ready,
  input          io_connPE_2_push_valid,
  input  [127:0] io_connPE_2_push_bits,
  input          io_connPE_2_pop_ready,
  output         io_connPE_2_pop_valid,
  output [127:0] io_connPE_2_pop_bits,
  output         io_connPE_3_push_ready,
  input          io_connPE_3_push_valid,
  input  [127:0] io_connPE_3_push_bits,
  input          io_connPE_3_pop_ready,
  output         io_connPE_3_pop_valid,
  output [127:0] io_connPE_3_pop_bits,
  output         io_connVSS_0_ctrl_serveStealReq_ready,
  input          io_connVSS_0_ctrl_serveStealReq_valid,
  input          io_connVSS_0_data_availableTask_ready,
  output         io_connVSS_0_data_availableTask_valid,
  output [127:0] io_connVSS_0_data_availableTask_bits,
  output         io_connVSS_0_data_qOutTask_ready,
  input          io_connVSS_0_data_qOutTask_valid,
  input  [127:0] io_connVSS_0_data_qOutTask_bits,
  output         io_connVSS_1_ctrl_serveStealReq_ready,
  input          io_connVSS_1_ctrl_serveStealReq_valid,
  input          io_connVSS_1_data_availableTask_ready,
  output         io_connVSS_1_data_availableTask_valid,
  output [127:0] io_connVSS_1_data_availableTask_bits,
  output         io_connVSS_1_data_qOutTask_ready,
  input          io_connVSS_1_data_qOutTask_valid,
  input  [127:0] io_connVSS_1_data_qOutTask_bits,
  output         io_connVSS_2_ctrl_serveStealReq_ready,
  input          io_connVSS_2_ctrl_serveStealReq_valid,
  input          io_connVSS_2_data_availableTask_ready,
  output         io_connVSS_2_data_availableTask_valid,
  output [127:0] io_connVSS_2_data_availableTask_bits,
  output         io_connVSS_2_data_qOutTask_ready,
  input          io_connVSS_2_data_qOutTask_valid,
  input  [127:0] io_connVSS_2_data_qOutTask_bits,
  output         io_connVSS_3_ctrl_serveStealReq_ready,
  input          io_connVSS_3_ctrl_serveStealReq_valid,
  input          io_connVSS_3_data_availableTask_ready,
  output         io_connVSS_3_data_availableTask_valid,
  output [127:0] io_connVSS_3_data_availableTask_bits,
  output         io_connVSS_3_data_qOutTask_ready,
  input          io_connVSS_3_data_qOutTask_valid,
  input  [127:0] io_connVSS_3_data_qOutTask_bits,
  output         io_ntwDataUnitOccupancyVSS_0,
  output         io_ntwDataUnitOccupancyVSS_1,
  output         io_ntwDataUnitOccupancyVSS_2,
  output         io_ntwDataUnitOccupancyVSS_3
);
  wire  stealNet_clock; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_reset; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_1_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_1_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_2_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_3_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_3_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_4_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_5_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_5_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_6_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_6_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_7_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [127:0] stealNet_io_connSS_7_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_1; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_2; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_3; // @[stealNW_TQ.scala 31:30]
  wire  stealServers_0_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_0_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_0_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_0_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_0_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_1_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_1_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_1_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_1_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_2_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_2_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_2_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_2_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_3_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_3_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_3_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [127:0] stealServers_3_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  taskQueues_0_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_0_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_0_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_0_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_0_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_1_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_1_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_1_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_1_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_2_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_2_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_2_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_2_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_3_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_3_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_3_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_3_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [127:0] taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  stealNetwork_1 stealNet ( // @[stealNW_TQ.scala 31:30]
    .clock(stealNet_clock),
    .reset(stealNet_reset),
    .io_connSS_0_ctrl_serveStealReq_ready(stealNet_io_connSS_0_ctrl_serveStealReq_ready),
    .io_connSS_0_ctrl_serveStealReq_valid(stealNet_io_connSS_0_ctrl_serveStealReq_valid),
    .io_connSS_0_data_availableTask_ready(stealNet_io_connSS_0_data_availableTask_ready),
    .io_connSS_0_data_availableTask_valid(stealNet_io_connSS_0_data_availableTask_valid),
    .io_connSS_0_data_availableTask_bits(stealNet_io_connSS_0_data_availableTask_bits),
    .io_connSS_0_data_qOutTask_ready(stealNet_io_connSS_0_data_qOutTask_ready),
    .io_connSS_0_data_qOutTask_valid(stealNet_io_connSS_0_data_qOutTask_valid),
    .io_connSS_0_data_qOutTask_bits(stealNet_io_connSS_0_data_qOutTask_bits),
    .io_connSS_1_ctrl_serveStealReq_ready(stealNet_io_connSS_1_ctrl_serveStealReq_ready),
    .io_connSS_1_ctrl_serveStealReq_valid(stealNet_io_connSS_1_ctrl_serveStealReq_valid),
    .io_connSS_1_ctrl_stealReq_ready(stealNet_io_connSS_1_ctrl_stealReq_ready),
    .io_connSS_1_ctrl_stealReq_valid(stealNet_io_connSS_1_ctrl_stealReq_valid),
    .io_connSS_1_data_availableTask_ready(stealNet_io_connSS_1_data_availableTask_ready),
    .io_connSS_1_data_availableTask_valid(stealNet_io_connSS_1_data_availableTask_valid),
    .io_connSS_1_data_availableTask_bits(stealNet_io_connSS_1_data_availableTask_bits),
    .io_connSS_1_data_qOutTask_ready(stealNet_io_connSS_1_data_qOutTask_ready),
    .io_connSS_1_data_qOutTask_valid(stealNet_io_connSS_1_data_qOutTask_valid),
    .io_connSS_1_data_qOutTask_bits(stealNet_io_connSS_1_data_qOutTask_bits),
    .io_connSS_2_ctrl_serveStealReq_ready(stealNet_io_connSS_2_ctrl_serveStealReq_ready),
    .io_connSS_2_ctrl_serveStealReq_valid(stealNet_io_connSS_2_ctrl_serveStealReq_valid),
    .io_connSS_2_data_availableTask_ready(stealNet_io_connSS_2_data_availableTask_ready),
    .io_connSS_2_data_availableTask_valid(stealNet_io_connSS_2_data_availableTask_valid),
    .io_connSS_2_data_availableTask_bits(stealNet_io_connSS_2_data_availableTask_bits),
    .io_connSS_2_data_qOutTask_ready(stealNet_io_connSS_2_data_qOutTask_ready),
    .io_connSS_2_data_qOutTask_valid(stealNet_io_connSS_2_data_qOutTask_valid),
    .io_connSS_2_data_qOutTask_bits(stealNet_io_connSS_2_data_qOutTask_bits),
    .io_connSS_3_ctrl_serveStealReq_ready(stealNet_io_connSS_3_ctrl_serveStealReq_ready),
    .io_connSS_3_ctrl_serveStealReq_valid(stealNet_io_connSS_3_ctrl_serveStealReq_valid),
    .io_connSS_3_ctrl_stealReq_ready(stealNet_io_connSS_3_ctrl_stealReq_ready),
    .io_connSS_3_ctrl_stealReq_valid(stealNet_io_connSS_3_ctrl_stealReq_valid),
    .io_connSS_3_data_availableTask_ready(stealNet_io_connSS_3_data_availableTask_ready),
    .io_connSS_3_data_availableTask_valid(stealNet_io_connSS_3_data_availableTask_valid),
    .io_connSS_3_data_availableTask_bits(stealNet_io_connSS_3_data_availableTask_bits),
    .io_connSS_3_data_qOutTask_ready(stealNet_io_connSS_3_data_qOutTask_ready),
    .io_connSS_3_data_qOutTask_valid(stealNet_io_connSS_3_data_qOutTask_valid),
    .io_connSS_3_data_qOutTask_bits(stealNet_io_connSS_3_data_qOutTask_bits),
    .io_connSS_4_ctrl_serveStealReq_ready(stealNet_io_connSS_4_ctrl_serveStealReq_ready),
    .io_connSS_4_ctrl_serveStealReq_valid(stealNet_io_connSS_4_ctrl_serveStealReq_valid),
    .io_connSS_4_data_availableTask_ready(stealNet_io_connSS_4_data_availableTask_ready),
    .io_connSS_4_data_availableTask_valid(stealNet_io_connSS_4_data_availableTask_valid),
    .io_connSS_4_data_availableTask_bits(stealNet_io_connSS_4_data_availableTask_bits),
    .io_connSS_4_data_qOutTask_ready(stealNet_io_connSS_4_data_qOutTask_ready),
    .io_connSS_4_data_qOutTask_valid(stealNet_io_connSS_4_data_qOutTask_valid),
    .io_connSS_4_data_qOutTask_bits(stealNet_io_connSS_4_data_qOutTask_bits),
    .io_connSS_5_ctrl_serveStealReq_ready(stealNet_io_connSS_5_ctrl_serveStealReq_ready),
    .io_connSS_5_ctrl_serveStealReq_valid(stealNet_io_connSS_5_ctrl_serveStealReq_valid),
    .io_connSS_5_ctrl_stealReq_ready(stealNet_io_connSS_5_ctrl_stealReq_ready),
    .io_connSS_5_ctrl_stealReq_valid(stealNet_io_connSS_5_ctrl_stealReq_valid),
    .io_connSS_5_data_availableTask_ready(stealNet_io_connSS_5_data_availableTask_ready),
    .io_connSS_5_data_availableTask_valid(stealNet_io_connSS_5_data_availableTask_valid),
    .io_connSS_5_data_availableTask_bits(stealNet_io_connSS_5_data_availableTask_bits),
    .io_connSS_5_data_qOutTask_ready(stealNet_io_connSS_5_data_qOutTask_ready),
    .io_connSS_5_data_qOutTask_valid(stealNet_io_connSS_5_data_qOutTask_valid),
    .io_connSS_5_data_qOutTask_bits(stealNet_io_connSS_5_data_qOutTask_bits),
    .io_connSS_6_ctrl_serveStealReq_ready(stealNet_io_connSS_6_ctrl_serveStealReq_ready),
    .io_connSS_6_ctrl_serveStealReq_valid(stealNet_io_connSS_6_ctrl_serveStealReq_valid),
    .io_connSS_6_data_availableTask_ready(stealNet_io_connSS_6_data_availableTask_ready),
    .io_connSS_6_data_availableTask_valid(stealNet_io_connSS_6_data_availableTask_valid),
    .io_connSS_6_data_availableTask_bits(stealNet_io_connSS_6_data_availableTask_bits),
    .io_connSS_6_data_qOutTask_ready(stealNet_io_connSS_6_data_qOutTask_ready),
    .io_connSS_6_data_qOutTask_valid(stealNet_io_connSS_6_data_qOutTask_valid),
    .io_connSS_6_data_qOutTask_bits(stealNet_io_connSS_6_data_qOutTask_bits),
    .io_connSS_7_ctrl_serveStealReq_ready(stealNet_io_connSS_7_ctrl_serveStealReq_ready),
    .io_connSS_7_ctrl_serveStealReq_valid(stealNet_io_connSS_7_ctrl_serveStealReq_valid),
    .io_connSS_7_ctrl_stealReq_ready(stealNet_io_connSS_7_ctrl_stealReq_ready),
    .io_connSS_7_ctrl_stealReq_valid(stealNet_io_connSS_7_ctrl_stealReq_valid),
    .io_connSS_7_data_availableTask_ready(stealNet_io_connSS_7_data_availableTask_ready),
    .io_connSS_7_data_availableTask_valid(stealNet_io_connSS_7_data_availableTask_valid),
    .io_connSS_7_data_availableTask_bits(stealNet_io_connSS_7_data_availableTask_bits),
    .io_connSS_7_data_qOutTask_ready(stealNet_io_connSS_7_data_qOutTask_ready),
    .io_connSS_7_data_qOutTask_valid(stealNet_io_connSS_7_data_qOutTask_valid),
    .io_connSS_7_data_qOutTask_bits(stealNet_io_connSS_7_data_qOutTask_bits),
    .io_ntwDataUnitOccupancyVSS_0(stealNet_io_ntwDataUnitOccupancyVSS_0),
    .io_ntwDataUnitOccupancyVSS_1(stealNet_io_ntwDataUnitOccupancyVSS_1),
    .io_ntwDataUnitOccupancyVSS_2(stealNet_io_ntwDataUnitOccupancyVSS_2),
    .io_ntwDataUnitOccupancyVSS_3(stealNet_io_ntwDataUnitOccupancyVSS_3)
  );
  stealServer_4 stealServers_0 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_0_clock),
    .reset(stealServers_0_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_0_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_0_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_0_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_0_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_0_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_0_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_0_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_0_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_0_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_0_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_0_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_0_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_0_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_0_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_0_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_0_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_0_io_connQ_pop_bits)
  );
  stealServer_4 stealServers_1 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_1_clock),
    .reset(stealServers_1_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_1_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_1_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_1_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_1_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_1_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_1_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_1_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_1_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_1_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_1_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_1_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_1_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_1_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_1_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_1_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_1_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_1_io_connQ_pop_bits)
  );
  stealServer_4 stealServers_2 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_2_clock),
    .reset(stealServers_2_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_2_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_2_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_2_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_2_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_2_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_2_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_2_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_2_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_2_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_2_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_2_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_2_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_2_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_2_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_2_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_2_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_2_io_connQ_pop_bits)
  );
  stealServer_4 stealServers_3 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_3_clock),
    .reset(stealServers_3_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_3_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_3_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_3_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_3_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_3_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_3_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_3_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_3_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_3_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_3_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_3_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_3_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_3_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_3_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_3_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_3_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_3_io_connQ_pop_bits)
  );
  hw_deque_4 taskQueues_0 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_0_clock),
    .reset(taskQueues_0_reset),
    .io_connVec_0_push_ready(taskQueues_0_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_0_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_0_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_0_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_0_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_0_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_0_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_0_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_0_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_0_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_0_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_0_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_0_io_connVec_1_pop_bits)
  );
  hw_deque_4 taskQueues_1 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_1_clock),
    .reset(taskQueues_1_reset),
    .io_connVec_0_push_ready(taskQueues_1_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_1_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_1_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_1_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_1_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_1_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_1_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_1_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_1_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_1_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_1_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_1_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_1_io_connVec_1_pop_bits)
  );
  hw_deque_4 taskQueues_2 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_2_clock),
    .reset(taskQueues_2_reset),
    .io_connVec_0_push_ready(taskQueues_2_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_2_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_2_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_2_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_2_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_2_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_2_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_2_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_2_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_2_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_2_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_2_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_2_io_connVec_1_pop_bits)
  );
  hw_deque_4 taskQueues_3 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_3_clock),
    .reset(taskQueues_3_reset),
    .io_connVec_0_push_ready(taskQueues_3_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_3_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_3_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_3_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_3_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_3_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_3_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_3_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_3_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_3_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_3_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_3_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_3_io_connVec_1_pop_bits)
  );
  assign io_connPE_0_push_ready = taskQueues_0_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_0_pop_valid = taskQueues_0_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_0_pop_bits = taskQueues_0_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_1_push_ready = taskQueues_1_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_1_pop_valid = taskQueues_1_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_1_pop_bits = taskQueues_1_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_2_push_ready = taskQueues_2_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_2_pop_valid = taskQueues_2_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_2_pop_bits = taskQueues_2_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_3_push_ready = taskQueues_3_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_3_pop_valid = taskQueues_3_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_3_pop_bits = taskQueues_3_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connVSS_0_ctrl_serveStealReq_ready = stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_0_data_availableTask_valid = stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_0_data_availableTask_bits = stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_0_data_qOutTask_ready = stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_1_ctrl_serveStealReq_ready = stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_1_data_availableTask_valid = stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_1_data_availableTask_bits = stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_1_data_qOutTask_ready = stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_2_ctrl_serveStealReq_ready = stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_2_data_availableTask_valid = stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_2_data_availableTask_bits = stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_2_data_qOutTask_ready = stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_3_ctrl_serveStealReq_ready = stealNet_io_connSS_6_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_3_data_availableTask_valid = stealNet_io_connSS_6_data_availableTask_valid; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_3_data_availableTask_bits = stealNet_io_connSS_6_data_availableTask_bits; // @[stealNW_TQ.scala 82:35]
  assign io_connVSS_3_data_qOutTask_ready = stealNet_io_connSS_6_data_qOutTask_ready; // @[stealNW_TQ.scala 82:35]
  assign io_ntwDataUnitOccupancyVSS_0 = stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 103:48]
  assign io_ntwDataUnitOccupancyVSS_1 = stealNet_io_ntwDataUnitOccupancyVSS_1; // @[stealNW_TQ.scala 103:48]
  assign io_ntwDataUnitOccupancyVSS_2 = stealNet_io_ntwDataUnitOccupancyVSS_2; // @[stealNW_TQ.scala 103:48]
  assign io_ntwDataUnitOccupancyVSS_3 = stealNet_io_ntwDataUnitOccupancyVSS_3; // @[stealNW_TQ.scala 103:48]
  assign stealNet_clock = clock;
  assign stealNet_reset = reset;
  assign stealNet_io_connSS_0_ctrl_serveStealReq_valid = io_connVSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_0_data_availableTask_ready = io_connVSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_0_data_qOutTask_valid = io_connVSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_0_data_qOutTask_bits = io_connVSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_1_ctrl_serveStealReq_valid = stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_1_ctrl_stealReq_valid = stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_1_data_availableTask_ready = stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_1_data_qOutTask_valid = stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_1_data_qOutTask_bits = stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_2_ctrl_serveStealReq_valid = io_connVSS_1_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_2_data_availableTask_ready = io_connVSS_1_data_availableTask_ready; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_2_data_qOutTask_valid = io_connVSS_1_data_qOutTask_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_2_data_qOutTask_bits = io_connVSS_1_data_qOutTask_bits; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_3_ctrl_serveStealReq_valid = stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_3_ctrl_stealReq_valid = stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_3_data_availableTask_ready = stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_3_data_qOutTask_valid = stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_3_data_qOutTask_bits = stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_4_ctrl_serveStealReq_valid = io_connVSS_2_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_4_data_availableTask_ready = io_connVSS_2_data_availableTask_ready; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_4_data_qOutTask_valid = io_connVSS_2_data_qOutTask_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_4_data_qOutTask_bits = io_connVSS_2_data_qOutTask_bits; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_5_ctrl_serveStealReq_valid = stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_5_ctrl_stealReq_valid = stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_5_data_availableTask_ready = stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_5_data_qOutTask_valid = stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_5_data_qOutTask_bits = stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_6_ctrl_serveStealReq_valid = io_connVSS_3_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_6_data_availableTask_ready = io_connVSS_3_data_availableTask_ready; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_6_data_qOutTask_valid = io_connVSS_3_data_qOutTask_valid; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_6_data_qOutTask_bits = io_connVSS_3_data_qOutTask_bits; // @[stealNW_TQ.scala 82:35]
  assign stealNet_io_connSS_7_ctrl_serveStealReq_valid = stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_7_ctrl_stealReq_valid = stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_7_data_availableTask_ready = stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_7_data_qOutTask_valid = stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealNet_io_connSS_7_data_qOutTask_bits = stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_clock = clock;
  assign stealServers_0_reset = reset;
  assign stealServers_0_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_1_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_1_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_1_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_0_io_connQ_currLength = taskQueues_0_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_push_ready = taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_pop_valid = taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_pop_bits = taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_clock = clock;
  assign stealServers_1_reset = reset;
  assign stealServers_1_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_3_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_3_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_3_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_1_io_connQ_currLength = taskQueues_1_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_push_ready = taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_pop_valid = taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_pop_bits = taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_clock = clock;
  assign stealServers_2_reset = reset;
  assign stealServers_2_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_5_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_5_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_5_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_5_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_5_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_2_io_connQ_currLength = taskQueues_2_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_push_ready = taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_pop_valid = taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_pop_bits = taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_clock = clock;
  assign stealServers_3_reset = reset;
  assign stealServers_3_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_7_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_7_ctrl_stealReq_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_7_data_availableTask_valid; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_7_data_availableTask_bits; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_7_data_qOutTask_ready; // @[stealNW_TQ.scala 92:35]
  assign stealServers_3_io_connQ_currLength = taskQueues_3_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_push_ready = taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_pop_valid = taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_pop_bits = taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_0_clock = clock;
  assign taskQueues_0_reset = reset;
  assign taskQueues_0_io_connVec_0_push_valid = io_connPE_0_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_0_io_connVec_0_push_bits = io_connPE_0_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_0_io_connVec_0_pop_ready = io_connPE_0_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_0_io_connVec_1_push_valid = stealServers_0_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_0_io_connVec_1_push_bits = stealServers_0_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_0_io_connVec_1_pop_ready = stealServers_0_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_1_clock = clock;
  assign taskQueues_1_reset = reset;
  assign taskQueues_1_io_connVec_0_push_valid = io_connPE_1_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_1_io_connVec_0_push_bits = io_connPE_1_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_1_io_connVec_0_pop_ready = io_connPE_1_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_1_io_connVec_1_push_valid = stealServers_1_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_1_io_connVec_1_push_bits = stealServers_1_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_1_io_connVec_1_pop_ready = stealServers_1_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_2_clock = clock;
  assign taskQueues_2_reset = reset;
  assign taskQueues_2_io_connVec_0_push_valid = io_connPE_2_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_2_io_connVec_0_push_bits = io_connPE_2_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_2_io_connVec_0_pop_ready = io_connPE_2_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_2_io_connVec_1_push_valid = stealServers_2_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_2_io_connVec_1_push_bits = stealServers_2_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_2_io_connVec_1_pop_ready = stealServers_2_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_3_clock = clock;
  assign taskQueues_3_reset = reset;
  assign taskQueues_3_io_connVec_0_push_valid = io_connPE_3_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_3_io_connVec_0_push_bits = io_connPE_3_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_3_io_connVec_0_pop_ready = io_connPE_3_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_3_io_connVec_1_push_valid = stealServers_3_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_3_io_connVec_1_push_bits = stealServers_3_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_3_io_connVec_1_pop_ready = stealServers_3_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
endmodule
module Queue_34(
  input          clock,
  input          reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [127:0] io_enq_bits,
  input          io_deq_ready,
  output         io_deq_valid,
  output [127:0] io_deq_bits,
  output [4:0]   io_count
);
`ifdef RANDOMIZE_MEM_INIT
  reg [127:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
`endif // RANDOMIZE_REG_INIT
  reg [127:0] ram [0:15]; // @[Decoupled.scala 275:95]
  wire  ram_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire [3:0] ram_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [127:0] ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [127:0] ram_MPORT_data; // @[Decoupled.scala 275:95]
  wire [3:0] ram_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_MPORT_en; // @[Decoupled.scala 275:95]
  reg [3:0] enq_ptr_value; // @[Counter.scala 61:40]
  reg [3:0] deq_ptr_value; // @[Counter.scala 61:40]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  ptr_match = enq_ptr_value == deq_ptr_value; // @[Decoupled.scala 279:33]
  wire  empty = ptr_match & ~maybe_full; // @[Decoupled.scala 280:25]
  wire  full = ptr_match & maybe_full; // @[Decoupled.scala 281:24]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  wire [3:0] _value_T_1 = enq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] _value_T_3 = deq_ptr_value + 4'h1; // @[Counter.scala 77:24]
  wire [3:0] ptr_diff = enq_ptr_value - deq_ptr_value; // @[Decoupled.scala 328:32]
  wire [4:0] _io_count_T_1 = maybe_full & ptr_match ? 5'h10 : 5'h0; // @[Decoupled.scala 331:20]
  wire [4:0] _GEN_11 = {{1'd0}, ptr_diff}; // @[Decoupled.scala 331:62]
  assign ram_io_deq_bits_MPORT_en = 1'h1;
  assign ram_io_deq_bits_MPORT_addr = deq_ptr_value;
  assign ram_io_deq_bits_MPORT_data = ram[ram_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_MPORT_data = io_enq_bits;
  assign ram_MPORT_addr = enq_ptr_value;
  assign ram_MPORT_mask = 1'h1;
  assign ram_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits = ram_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_count = _io_count_T_1 | _GEN_11; // @[Decoupled.scala 331:62]
  always @(posedge clock) begin
    if (ram_MPORT_en & ram_MPORT_mask) begin
      ram[ram_MPORT_addr] <= ram_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (reset) begin // @[Counter.scala 61:40]
      enq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_enq) begin // @[Decoupled.scala 288:16]
      enq_ptr_value <= _value_T_1; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Counter.scala 61:40]
      deq_ptr_value <= 4'h0; // @[Counter.scala 61:40]
    end else if (do_deq) begin // @[Decoupled.scala 292:16]
      deq_ptr_value <= _value_T_3; // @[Counter.scala 77:15]
    end
    if (reset) begin // @[Decoupled.scala 278:27]
      maybe_full <= 1'h0; // @[Decoupled.scala 278:27]
    end else if (do_enq != do_deq) begin // @[Decoupled.scala 295:27]
      maybe_full <= do_enq; // @[Decoupled.scala 296:16]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_MEM_INIT
  _RAND_0 = {4{`RANDOM}};
  for (initvar = 0; initvar < 16; initvar = initvar+1)
    ram[initvar] = _RAND_0[127:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  enq_ptr_value = _RAND_1[3:0];
  _RAND_2 = {1{`RANDOM}};
  deq_ptr_value = _RAND_2[3:0];
  _RAND_3 = {1{`RANDOM}};
  maybe_full = _RAND_3[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module virtualStealServer_1(
  input          clock,
  input          reset,
  input          io_connNetwork_ctrl_serveStealReq_ready,
  output         io_connNetwork_ctrl_serveStealReq_valid,
  output         io_connNetwork_data_availableTask_ready,
  input          io_connNetwork_data_availableTask_valid,
  input  [127:0] io_connNetwork_data_availableTask_bits,
  input          io_connNetwork_data_qOutTask_ready,
  output         io_connNetwork_data_qOutTask_valid,
  output [127:0] io_connNetwork_data_qOutTask_bits,
  output         io_axi_mgmt_ARREADY,
  input          io_axi_mgmt_ARVALID,
  input  [5:0]   io_axi_mgmt_ARADDR,
  input          io_axi_mgmt_RREADY,
  output         io_axi_mgmt_RVALID,
  output [63:0]  io_axi_mgmt_RDATA,
  output         io_axi_mgmt_AWREADY,
  input          io_axi_mgmt_AWVALID,
  input  [5:0]   io_axi_mgmt_AWADDR,
  output         io_axi_mgmt_WREADY,
  input          io_axi_mgmt_WVALID,
  input  [63:0]  io_axi_mgmt_WDATA,
  input  [7:0]   io_axi_mgmt_WSTRB,
  input          io_axi_mgmt_BREADY,
  output         io_axi_mgmt_BVALID,
  input          io_read_address_ready,
  output         io_read_address_valid,
  output [63:0]  io_read_address_bits,
  output         io_read_data_ready,
  input          io_read_data_valid,
  input  [127:0] io_read_data_bits,
  output [3:0]   io_read_burst_len,
  input          io_write_address_ready,
  output         io_write_address_valid,
  output [63:0]  io_write_address_bits,
  input          io_write_data_ready,
  output         io_write_data_valid,
  output [127:0] io_write_data_bits,
  output [3:0]   io_write_burst_len,
  output         io_write_last,
  input          io_ntwDataUnitOccupancy
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [63:0] _RAND_7;
  reg [63:0] _RAND_8;
  reg [31:0] _RAND_9;
  reg [31:0] _RAND_10;
  reg [63:0] _RAND_11;
`endif // RANDOMIZE_REG_INIT
  wire  rdReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] rdReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  rdReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] wrReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  wrReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [5:0] wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_clock; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_reset; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] wrReqData__deq_io_enq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] wrReqData__deq_io_enq_bits_strb; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  wrReqData__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 377:21]
  wire  taskQueueBuffer_clock; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_reset; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_enq_ready; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_enq_valid; // @[virtualStealServer.scala 80:43]
  wire [127:0] taskQueueBuffer_io_enq_bits; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_deq_ready; // @[virtualStealServer.scala 80:43]
  wire  taskQueueBuffer_io_deq_valid; // @[virtualStealServer.scala 80:43]
  wire [127:0] taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 80:43]
  wire [4:0] taskQueueBuffer_io_count; // @[virtualStealServer.scala 80:43]
  wire  rdReq__valid = rdReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  rdReq = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  wire [5:0] rdReq__bits_addr = rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] rdAddr = rdReq__bits_addr & 6'h38; // @[RegisterBlock.scala 214:48]
  wire  wrReq__valid = wrReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReqData__valid = wrReqData__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReq = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  wire [5:0] wrReq__bits_addr = wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] wrAddr = wrReq__bits_addr & 6'h38; // @[RegisterBlock.scala 243:48]
  reg [63:0] rAddr; // @[virtualStealServer.scala 64:44]
  reg [63:0] rPause; // @[virtualStealServer.scala 65:44]
  reg [63:0] procInterrupt; // @[virtualStealServer.scala 66:44]
  reg [63:0] maxLength; // @[virtualStealServer.scala 67:44]
  reg [3:0] stateReg; // @[virtualStealServer.scala 68:44]
  reg [63:0] contentionCounter; // @[virtualStealServer.scala 70:44]
  reg  networkCongested; // @[virtualStealServer.scala 72:44]
  reg [63:0] fifoTailReg; // @[virtualStealServer.scala 76:44]
  reg [63:0] fifoHeadReg; // @[virtualStealServer.scala 77:44]
  reg  popOrPush; // @[virtualStealServer.scala 78:44]
  reg [4:0] memDataCounter; // @[virtualStealServer.scala 81:44]
  wire  _T_1 = ~io_connNetwork_ctrl_serveStealReq_ready & io_ntwDataUnitOccupancy; // @[virtualStealServer.scala 94:52]
  wire [63:0] _contentionCounter_T_1 = contentionCounter + 64'h1; // @[virtualStealServer.scala 97:48]
  wire  _T_4 = contentionCounter != 64'h0; // @[virtualStealServer.scala 99:36]
  wire  _T_5 = io_connNetwork_ctrl_serveStealReq_ready & _T_4; // @[virtualStealServer.scala 98:56]
  wire [63:0] _contentionCounter_T_3 = contentionCounter - 64'h1; // @[virtualStealServer.scala 101:48]
  wire [63:0] _T_12 = 64'h3 - 64'h0; // @[virtualStealServer.scala 109:54]
  wire  _GEN_2 = contentionCounter < _T_12 ? 1'h0 : networkCongested; // @[virtualStealServer.scala 109:63 110:26 112:26]
  wire  _GEN_3 = contentionCounter >= 64'h3 | _GEN_2; // @[virtualStealServer.scala 107:58 108:26]
  wire [63:0] _currLen_T_1 = fifoTailReg - fifoHeadReg; // @[virtualStealServer.scala 346:32]
  wire [63:0] _currLen_T_3 = maxLength - fifoHeadReg; // @[virtualStealServer.scala 351:30]
  wire [63:0] _currLen_T_5 = _currLen_T_3 + fifoTailReg; // @[virtualStealServer.scala 351:44]
  reg [63:0] lengthHistroy; // @[virtualStealServer.scala 342:32]
  wire [63:0] _currLen_T_7 = lengthHistroy + 64'h1; // @[virtualStealServer.scala 364:38]
  wire [63:0] _GEN_138 = popOrPush ? 64'h0 : _currLen_T_7; // @[virtualStealServer.scala 358:24 360:21 364:21]
  wire [63:0] _GEN_139 = fifoTailReg < fifoHeadReg ? _currLen_T_5 : _GEN_138; // @[virtualStealServer.scala 349:42 351:17]
  wire [63:0] currLen = fifoTailReg > fifoHeadReg ? _currLen_T_1 : _GEN_139; // @[virtualStealServer.scala 344:36 346:17]
  wire [63:0] _T_18 = 64'h10 + currLen; // @[virtualStealServer.scala 119:79]
  wire  _T_23 = ~networkCongested; // @[virtualStealServer.scala 132:20]
  wire [3:0] _GEN_4 = procInterrupt != 64'h0 ? 4'ha : stateReg; // @[virtualStealServer.scala 140:42 142:22 68:44]
  wire [63:0] _GEN_5 = procInterrupt != 64'h0 ? 64'hffffffffffffffff : rPause; // @[virtualStealServer.scala 140:42 143:22 65:44]
  wire [3:0] _GEN_6 = _T_23 & taskQueueBuffer_io_count != 5'h0 ? 4'h7 : _GEN_4; // @[virtualStealServer.scala 136:74 138:22]
  wire [63:0] _GEN_7 = _T_23 & taskQueueBuffer_io_count != 5'h0 ? rPause : _GEN_5; // @[virtualStealServer.scala 136:74 65:44]
  wire [3:0] _GEN_8 = ~networkCongested & currLen != 64'h0 & taskQueueBuffer_io_count == 5'h0 ? 4'h6 : _GEN_6; // @[virtualStealServer.scala 132:93 134:22]
  wire [63:0] _GEN_9 = ~networkCongested & currLen != 64'h0 & taskQueueBuffer_io_count == 5'h0 ? rPause : _GEN_7; // @[virtualStealServer.scala 132:93 65:44]
  wire [3:0] _GEN_10 = networkCongested ? 4'h2 : _GEN_8; // @[virtualStealServer.scala 128:37 130:22]
  wire [63:0] _GEN_11 = networkCongested ? rPause : _GEN_9; // @[virtualStealServer.scala 128:37 65:44]
  wire [63:0] _GEN_13 = networkCongested & taskQueueBuffer_io_count == 5'h10 ? rPause : _GEN_11; // @[virtualStealServer.scala 124:74 65:44]
  wire [63:0] _GEN_15 = currLen == maxLength & networkCongested | maxLength < _T_18 ? 64'hffffffffffffffff : _GEN_13; // @[virtualStealServer.scala 119:90 122:22]
  wire  _T_32 = stateReg == 4'h2; // @[virtualStealServer.scala 147:25]
  wire [3:0] _GEN_16 = _T_23 ? 4'h0 : stateReg; // @[virtualStealServer.scala 157:38 159:22 68:44]
  wire [3:0] _GEN_17 = io_connNetwork_data_availableTask_valid & networkCongested ? 4'h2 : _GEN_16; // @[virtualStealServer.scala 153:80 155:22]
  wire  _T_37 = stateReg == 4'h4; // @[virtualStealServer.scala 163:25]
  wire [3:0] _GEN_19 = io_write_address_ready ? 4'h3 : stateReg; // @[virtualStealServer.scala 165:37 166:22 68:44]
  wire [4:0] _GEN_20 = io_write_address_ready ? 5'h10 : memDataCounter; // @[virtualStealServer.scala 165:37 167:28 81:44]
  wire  _T_38 = stateReg == 4'h3; // @[virtualStealServer.scala 170:25]
  wire  _T_39 = memDataCounter == 5'h1; // @[virtualStealServer.scala 172:52]
  wire [63:0] _T_42 = maxLength - 64'h1; // @[virtualStealServer.scala 176:42]
  wire [63:0] _fifoTailReg_T_1 = fifoTailReg + 64'h1; // @[virtualStealServer.scala 177:44]
  wire [63:0] _GEN_21 = fifoTailReg < _T_42 ? _fifoTailReg_T_1 : 64'h0; // @[virtualStealServer.scala 176:48 177:29 179:29]
  wire [4:0] _memDataCounter_T_1 = memDataCounter - 5'h1; // @[virtualStealServer.scala 183:46]
  wire [4:0] _GEN_23 = io_write_data_ready ? _memDataCounter_T_1 : memDataCounter; // @[virtualStealServer.scala 182:40 183:28 81:44]
  wire [63:0] _GEN_24 = io_write_data_ready ? _GEN_21 : fifoTailReg; // @[virtualStealServer.scala 182:40 76:44]
  wire [3:0] _GEN_25 = io_write_data_ready & memDataCounter == 5'h1 ? 4'h0 : stateReg; // @[virtualStealServer.scala 172:60 173:22 68:44]
  wire  _GEN_26 = io_write_data_ready & memDataCounter == 5'h1 ? 1'h0 : popOrPush; // @[virtualStealServer.scala 172:60 174:23 78:44]
  wire [63:0] _GEN_27 = io_write_data_ready & memDataCounter == 5'h1 ? _GEN_21 : _GEN_24; // @[virtualStealServer.scala 172:60]
  wire [4:0] _GEN_28 = io_write_data_ready & memDataCounter == 5'h1 ? memDataCounter : _GEN_23; // @[virtualStealServer.scala 172:60 81:44]
  wire  _T_47 = stateReg == 4'h6; // @[virtualStealServer.scala 191:25]
  wire  _memDataCounter_T_2 = currLen < 64'h10; // @[virtualStealServer.scala 195:43]
  wire [63:0] _memDataCounter_T_3 = currLen < 64'h10 ? currLen : 64'h10; // @[virtualStealServer.scala 195:34]
  wire [3:0] _GEN_29 = io_read_address_ready ? 4'h5 : stateReg; // @[virtualStealServer.scala 193:36 194:22 68:44]
  wire [63:0] _GEN_30 = io_read_address_ready ? _memDataCounter_T_3 : {{59'd0}, memDataCounter}; // @[virtualStealServer.scala 193:36 195:28 81:44]
  wire  _T_48 = stateReg == 4'h5; // @[virtualStealServer.scala 198:25]
  wire [63:0] _fifoHeadReg_T_1 = fifoHeadReg + 64'h1; // @[virtualStealServer.scala 205:44]
  wire [63:0] _GEN_31 = fifoHeadReg < _T_42 ? _fifoHeadReg_T_1 : 64'h0; // @[virtualStealServer.scala 204:48 205:29 207:29]
  wire [4:0] _GEN_33 = io_read_data_valid ? _memDataCounter_T_1 : memDataCounter; // @[virtualStealServer.scala 209:39 210:28 81:44]
  wire [63:0] _GEN_34 = io_read_data_valid ? _GEN_31 : fifoHeadReg; // @[virtualStealServer.scala 209:39 77:44]
  wire [3:0] _GEN_35 = io_read_data_valid & _T_39 ? 4'h8 : stateReg; // @[virtualStealServer.scala 200:59 201:22 68:44]
  wire  _GEN_36 = io_read_data_valid & _T_39 | popOrPush; // @[virtualStealServer.scala 200:59 202:23 78:44]
  wire [63:0] _GEN_37 = io_read_data_valid & _T_39 ? _GEN_31 : _GEN_34; // @[virtualStealServer.scala 200:59]
  wire [4:0] _GEN_38 = io_read_data_valid & _T_39 ? memDataCounter : _GEN_33; // @[virtualStealServer.scala 200:59 81:44]
  wire  _T_57 = stateReg == 4'h7; // @[virtualStealServer.scala 218:25]
  wire [2:0] _GEN_39 = networkCongested ? 3'h0 : 3'h7; // @[virtualStealServer.scala 222:37 223:22 225:22]
  wire [2:0] _GEN_40 = io_connNetwork_data_qOutTask_ready ? 3'h0 : _GEN_39; // @[virtualStealServer.scala 220:49 221:22]
  wire  _T_58 = stateReg == 4'h8; // @[virtualStealServer.scala 228:25]
  wire [3:0] _GEN_41 = networkCongested ? 4'h0 : stateReg; // @[virtualStealServer.scala 234:37 236:22 68:44]
  wire [3:0] _GEN_42 = io_connNetwork_ctrl_serveStealReq_ready ? 4'h7 : _GEN_41; // @[virtualStealServer.scala 230:54 232:22]
  wire  _T_60 = rPause == 64'h0; // @[virtualStealServer.scala 242:21]
  wire [3:0] _GEN_43 = rPause == 64'h0 ? 4'h0 : 4'h9; // @[virtualStealServer.scala 242:33 244:22 248:22]
  wire [3:0] _GEN_44 = _T_60 ? 4'h0 : 4'ha; // @[virtualStealServer.scala 254:33 255:22 257:22]
  wire [3:0] _GEN_45 = stateReg == 4'ha ? _GEN_44 : stateReg; // @[virtualStealServer.scala 252:57 68:44]
  wire [3:0] _GEN_46 = stateReg == 4'h9 ? _GEN_43 : _GEN_45; // @[virtualStealServer.scala 240:46]
  wire [3:0] _GEN_47 = stateReg == 4'h8 ? _GEN_42 : _GEN_46; // @[virtualStealServer.scala 228:54]
  wire [3:0] _GEN_48 = stateReg == 4'h7 ? {{1'd0}, _GEN_40} : _GEN_47; // @[virtualStealServer.scala 218:48]
  wire [3:0] _GEN_49 = stateReg == 4'h5 ? _GEN_35 : _GEN_48; // @[virtualStealServer.scala 198:46]
  wire  _GEN_50 = stateReg == 4'h5 ? _GEN_36 : popOrPush; // @[virtualStealServer.scala 198:46 78:44]
  wire [63:0] _GEN_51 = stateReg == 4'h5 ? _GEN_37 : fifoHeadReg; // @[virtualStealServer.scala 198:46 77:44]
  wire [4:0] _GEN_52 = stateReg == 4'h5 ? _GEN_38 : memDataCounter; // @[virtualStealServer.scala 198:46 81:44]
  wire [3:0] _GEN_53 = stateReg == 4'h6 ? _GEN_29 : _GEN_49; // @[virtualStealServer.scala 191:53]
  wire [63:0] _GEN_54 = stateReg == 4'h6 ? _GEN_30 : {{59'd0}, _GEN_52}; // @[virtualStealServer.scala 191:53]
  wire  _GEN_55 = stateReg == 4'h6 ? popOrPush : _GEN_50; // @[virtualStealServer.scala 191:53 78:44]
  wire [63:0] _GEN_56 = stateReg == 4'h6 ? fifoHeadReg : _GEN_51; // @[virtualStealServer.scala 191:53 77:44]
  wire [3:0] _GEN_57 = stateReg == 4'h3 ? _GEN_25 : _GEN_53; // @[virtualStealServer.scala 170:47]
  wire  _GEN_58 = stateReg == 4'h3 ? _GEN_26 : _GEN_55; // @[virtualStealServer.scala 170:47]
  wire [63:0] _GEN_59 = stateReg == 4'h3 ? _GEN_27 : fifoTailReg; // @[virtualStealServer.scala 170:47 76:44]
  wire [63:0] _GEN_60 = stateReg == 4'h3 ? {{59'd0}, _GEN_28} : _GEN_54; // @[virtualStealServer.scala 170:47]
  wire [63:0] _GEN_61 = stateReg == 4'h3 ? fifoHeadReg : _GEN_56; // @[virtualStealServer.scala 170:47 77:44]
  wire [63:0] _GEN_63 = stateReg == 4'h4 ? {{59'd0}, _GEN_20} : _GEN_60; // @[virtualStealServer.scala 163:54]
  wire  _GEN_64 = stateReg == 4'h4 ? popOrPush : _GEN_58; // @[virtualStealServer.scala 163:54 78:44]
  wire [63:0] _GEN_65 = stateReg == 4'h4 ? fifoTailReg : _GEN_59; // @[virtualStealServer.scala 163:54 76:44]
  wire [63:0] _GEN_66 = stateReg == 4'h4 ? fifoHeadReg : _GEN_61; // @[virtualStealServer.scala 163:54 77:44]
  wire [63:0] _GEN_68 = stateReg == 4'h2 ? {{59'd0}, memDataCounter} : _GEN_63; // @[virtualStealServer.scala 147:46 81:44]
  wire  _GEN_69 = stateReg == 4'h2 ? popOrPush : _GEN_64; // @[virtualStealServer.scala 147:46 78:44]
  wire [63:0] _GEN_70 = stateReg == 4'h2 ? fifoTailReg : _GEN_65; // @[virtualStealServer.scala 147:46 76:44]
  wire [63:0] _GEN_71 = stateReg == 4'h2 ? fifoHeadReg : _GEN_66; // @[virtualStealServer.scala 147:46 77:44]
  wire [63:0] _GEN_73 = stateReg == 4'h0 ? _GEN_15 : rPause; // @[virtualStealServer.scala 117:34 65:44]
  wire [63:0] _GEN_74 = stateReg == 4'h0 ? {{59'd0}, memDataCounter} : _GEN_68; // @[virtualStealServer.scala 117:34 81:44]
  wire  _GEN_75 = stateReg == 4'h0 ? popOrPush : _GEN_69; // @[virtualStealServer.scala 117:34 78:44]
  wire [63:0] _GEN_76 = stateReg == 4'h0 ? fifoTailReg : _GEN_70; // @[virtualStealServer.scala 117:34 76:44]
  wire [63:0] _GEN_77 = stateReg == 4'h0 ? fifoHeadReg : _GEN_71; // @[virtualStealServer.scala 117:34 77:44]
  wire [67:0] _GEN_166 = {fifoTailReg, 4'h0}; // @[virtualStealServer.scala 305:65]
  wire [70:0] _io_write_address_bits_T = {{3'd0}, _GEN_166}; // @[virtualStealServer.scala 305:65]
  wire [70:0] _GEN_167 = {{7'd0}, rAddr}; // @[virtualStealServer.scala 305:79]
  wire [70:0] _io_write_address_bits_T_2 = _io_write_address_bits_T + _GEN_167; // @[virtualStealServer.scala 305:79]
  wire [67:0] _GEN_168 = {fifoHeadReg, 4'h0}; // @[virtualStealServer.scala 320:65]
  wire [70:0] _io_read_address_bits_T = {{3'd0}, _GEN_168}; // @[virtualStealServer.scala 320:65]
  wire [70:0] _io_read_address_bits_T_2 = _io_read_address_bits_T + _GEN_167; // @[virtualStealServer.scala 320:79]
  wire [63:0] _io_read_burst_len_T_2 = currLen - 64'h1; // @[virtualStealServer.scala 321:79]
  wire [63:0] _io_read_burst_len_T_3 = _memDataCounter_T_2 ? _io_read_burst_len_T_2 : 64'hf; // @[virtualStealServer.scala 321:55]
  wire  _GEN_81 = _T_57 & io_connNetwork_data_qOutTask_ready; // @[virtualStealServer.scala 286:45 329:48 332:49]
  wire  _GEN_82 = _T_57 ? 1'h0 : _T_58; // @[virtualStealServer.scala 280:45 329:48]
  wire [127:0] _GEN_84 = _T_48 ? io_read_data_bits : 128'h0; // @[virtualStealServer.scala 284:45 323:46 326:49]
  wire  _GEN_85 = _T_48 & io_read_data_valid; // @[virtualStealServer.scala 283:45 323:46 327:49]
  wire  _GEN_86 = _T_48 ? 1'h0 : _T_57; // @[virtualStealServer.scala 276:45 323:46]
  wire  _GEN_87 = _T_48 ? 1'h0 : _GEN_81; // @[virtualStealServer.scala 286:45 323:46]
  wire  _GEN_88 = _T_48 ? 1'h0 : _GEN_82; // @[virtualStealServer.scala 280:45 323:46]
  wire [70:0] _GEN_90 = _T_47 ? _io_read_address_bits_T_2 : 71'h0; // @[virtualStealServer.scala 268:45 317:53 320:49]
  wire [63:0] _GEN_91 = _T_47 ? _io_read_burst_len_T_3 : 64'h0; // @[virtualStealServer.scala 291:45 317:53 321:49]
  wire  _GEN_92 = _T_47 ? 1'h0 : _T_48; // @[virtualStealServer.scala 269:45 317:53]
  wire [127:0] _GEN_93 = _T_47 ? 128'h0 : _GEN_84; // @[virtualStealServer.scala 284:45 317:53]
  wire  _GEN_94 = _T_47 ? 1'h0 : _GEN_85; // @[virtualStealServer.scala 283:45 317:53]
  wire  _GEN_95 = _T_47 ? 1'h0 : _GEN_86; // @[virtualStealServer.scala 276:45 317:53]
  wire  _GEN_96 = _T_47 ? 1'h0 : _GEN_87; // @[virtualStealServer.scala 286:45 317:53]
  wire  _GEN_97 = _T_47 ? 1'h0 : _GEN_88; // @[virtualStealServer.scala 280:45 317:53]
  wire  _GEN_99 = _T_38 ? io_write_data_ready : _GEN_96; // @[virtualStealServer.scala 308:47 311:49]
  wire  _GEN_100 = _T_38 & _T_39; // @[virtualStealServer.scala 290:45 308:47]
  wire  _GEN_101 = _T_38 ? 1'h0 : _T_47; // @[virtualStealServer.scala 267:45 308:47]
  wire [70:0] _GEN_102 = _T_38 ? 71'h0 : _GEN_90; // @[virtualStealServer.scala 268:45 308:47]
  wire [63:0] _GEN_103 = _T_38 ? 64'h0 : _GEN_91; // @[virtualStealServer.scala 291:45 308:47]
  wire  _GEN_104 = _T_38 ? 1'h0 : _GEN_92; // @[virtualStealServer.scala 269:45 308:47]
  wire [127:0] _GEN_105 = _T_38 ? 128'h0 : _GEN_93; // @[virtualStealServer.scala 284:45 308:47]
  wire  _GEN_106 = _T_38 ? 1'h0 : _GEN_94; // @[virtualStealServer.scala 283:45 308:47]
  wire  _GEN_107 = _T_38 ? 1'h0 : _GEN_95; // @[virtualStealServer.scala 276:45 308:47]
  wire  _GEN_108 = _T_38 ? 1'h0 : _GEN_97; // @[virtualStealServer.scala 280:45 308:47]
  wire [70:0] _GEN_110 = _T_37 ? _io_write_address_bits_T_2 : 71'h0; // @[virtualStealServer.scala 271:45 302:54 305:49]
  wire [3:0] _GEN_111 = _T_37 ? 4'hf : 4'h0; // @[virtualStealServer.scala 289:45 302:54 306:49]
  wire  _GEN_112 = _T_37 ? 1'h0 : _T_38; // @[virtualStealServer.scala 272:45 302:54]
  wire  _GEN_113 = _T_37 ? 1'h0 : _GEN_99; // @[virtualStealServer.scala 286:45 302:54]
  wire  _GEN_114 = _T_37 ? 1'h0 : _GEN_100; // @[virtualStealServer.scala 290:45 302:54]
  wire  _GEN_115 = _T_37 ? 1'h0 : _GEN_101; // @[virtualStealServer.scala 267:45 302:54]
  wire [70:0] _GEN_116 = _T_37 ? 71'h0 : _GEN_102; // @[virtualStealServer.scala 268:45 302:54]
  wire [63:0] _GEN_117 = _T_37 ? 64'h0 : _GEN_103; // @[virtualStealServer.scala 291:45 302:54]
  wire  _GEN_118 = _T_37 ? 1'h0 : _GEN_104; // @[virtualStealServer.scala 269:45 302:54]
  wire [127:0] _GEN_119 = _T_37 ? 128'h0 : _GEN_105; // @[virtualStealServer.scala 284:45 302:54]
  wire  _GEN_120 = _T_37 ? 1'h0 : _GEN_106; // @[virtualStealServer.scala 283:45 302:54]
  wire  _GEN_121 = _T_37 ? 1'h0 : _GEN_107; // @[virtualStealServer.scala 276:45 302:54]
  wire  _GEN_122 = _T_37 ? 1'h0 : _GEN_108; // @[virtualStealServer.scala 280:45 302:54]
  wire [70:0] _GEN_127 = _T_32 ? 71'h0 : _GEN_110; // @[virtualStealServer.scala 296:40 271:45]
  wire [70:0] _GEN_133 = _T_32 ? 71'h0 : _GEN_116; // @[virtualStealServer.scala 296:40 268:45]
  wire [63:0] _GEN_134 = _T_32 ? 64'h0 : _GEN_117; // @[virtualStealServer.scala 296:40 291:45]
  wire [63:0] _GEN_143 = 6'h0 == rdAddr ? rPause : 64'hffffffffffffffff; // @[RegisterBlock.scala 220:10 224:38 225:16]
  wire [63:0] _GEN_144 = 6'h8 == rdAddr ? rAddr : _GEN_143; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_145 = 6'h10 == rdAddr ? maxLength : _GEN_144; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_146 = 6'h18 == rdAddr ? fifoTailReg : _GEN_145; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_147 = 6'h20 == rdAddr ? fifoHeadReg : _GEN_146; // @[RegisterBlock.scala 224:38 225:16]
  wire  _T_80 = ~reset; // @[RegisterBlock.scala 182:11]
  wire [7:0] wrReqData__bits_strb = wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 417:19 418:14]
  wire [63:0] wrReqData__bits_data = wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 417:19 418:14]
  wire [7:0] rPause_byte_wdata = wrReqData__bits_data[7:0]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original = rPause[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : rPause_byte_original; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_1 = wrReqData__bits_data[15:8]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_1 = rPause[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : rPause_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_2 = wrReqData__bits_data[23:16]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_2 = rPause[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : rPause_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_3 = wrReqData__bits_data[31:24]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_3 = rPause[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : rPause_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_4 = wrReqData__bits_data[39:32]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_4 = rPause[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : rPause_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_5 = wrReqData__bits_data[47:40]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_5 = rPause[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : rPause_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_6 = wrReqData__bits_data[55:48]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_6 = rPause[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : rPause_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] rPause_byte_wdata_7 = wrReqData__bits_data[63:56]; // @[Interface.scala 257:33]
  wire [7:0] rPause_byte_original_7 = rPause[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _rPause_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : rPause_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _rPause_T_16 = {_rPause_T_15,_rPause_T_14,_rPause_T_13,_rPause_T_12,_rPause_T_11,_rPause_T_10,_rPause_T_9,
    _rPause_T_8}; // @[Interface.scala 262:7]
  wire [7:0] rAddr_byte_original = rAddr[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : rAddr_byte_original; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_1 = rAddr[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : rAddr_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_2 = rAddr[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : rAddr_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_3 = rAddr[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : rAddr_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_4 = rAddr[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : rAddr_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_5 = rAddr[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : rAddr_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_6 = rAddr[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : rAddr_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] rAddr_byte_original_7 = rAddr[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _rAddr_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : rAddr_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _rAddr_T_16 = {_rAddr_T_15,_rAddr_T_14,_rAddr_T_13,_rAddr_T_12,_rAddr_T_11,_rAddr_T_10,_rAddr_T_9,
    _rAddr_T_8}; // @[Interface.scala 262:7]
  wire [7:0] maxLength_byte_original = maxLength[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : maxLength_byte_original; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_1 = maxLength[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : maxLength_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_2 = maxLength[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : maxLength_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_3 = maxLength[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : maxLength_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_4 = maxLength[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : maxLength_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_5 = maxLength[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : maxLength_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_6 = maxLength[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : maxLength_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] maxLength_byte_original_7 = maxLength[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _maxLength_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : maxLength_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _maxLength_T_16 = {_maxLength_T_15,_maxLength_T_14,_maxLength_T_13,_maxLength_T_12,_maxLength_T_11,
    _maxLength_T_10,_maxLength_T_9,_maxLength_T_8}; // @[Interface.scala 262:7]
  wire [7:0] fifoTailReg_byte_original = fifoTailReg[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_12 = wrReqData__bits_strb[0] ? rPause_byte_wdata : fifoTailReg_byte_original; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_1 = fifoTailReg[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_13 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : fifoTailReg_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_2 = fifoTailReg[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_14 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : fifoTailReg_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_3 = fifoTailReg[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_15 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : fifoTailReg_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_4 = fifoTailReg[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_16 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : fifoTailReg_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_5 = fifoTailReg[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_17 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : fifoTailReg_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_6 = fifoTailReg[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_18 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : fifoTailReg_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_7 = fifoTailReg[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_19 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : fifoTailReg_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _fifoTailReg_T_20 = {_fifoTailReg_T_19,_fifoTailReg_T_18,_fifoTailReg_T_17,_fifoTailReg_T_16,
    _fifoTailReg_T_15,_fifoTailReg_T_14,_fifoTailReg_T_13,_fifoTailReg_T_12}; // @[Interface.scala 262:7]
  wire [7:0] fifoHeadReg_byte_original = fifoHeadReg[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_12 = wrReqData__bits_strb[0] ? rPause_byte_wdata : fifoHeadReg_byte_original; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_1 = fifoHeadReg[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_13 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : fifoHeadReg_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_2 = fifoHeadReg[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_14 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : fifoHeadReg_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_3 = fifoHeadReg[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_15 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : fifoHeadReg_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_4 = fifoHeadReg[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_16 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : fifoHeadReg_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_5 = fifoHeadReg[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_17 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : fifoHeadReg_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_6 = fifoHeadReg[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_18 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : fifoHeadReg_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_7 = fifoHeadReg[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_19 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : fifoHeadReg_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _fifoHeadReg_T_20 = {_fifoHeadReg_T_19,_fifoHeadReg_T_18,_fifoHeadReg_T_17,_fifoHeadReg_T_16,
    _fifoHeadReg_T_15,_fifoHeadReg_T_14,_fifoHeadReg_T_13,_fifoHeadReg_T_12}; // @[Interface.scala 262:7]
  wire [7:0] procInterrupt_byte_original = procInterrupt[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_8 = wrReqData__bits_strb[0] ? rPause_byte_wdata : procInterrupt_byte_original; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_1 = procInterrupt[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_9 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : procInterrupt_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_2 = procInterrupt[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_10 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : procInterrupt_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_3 = procInterrupt[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_11 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : procInterrupt_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_4 = procInterrupt[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_12 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : procInterrupt_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_5 = procInterrupt[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_13 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : procInterrupt_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_6 = procInterrupt[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_14 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : procInterrupt_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] procInterrupt_byte_original_7 = procInterrupt[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _procInterrupt_T_15 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : procInterrupt_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _procInterrupt_T_16 = {_procInterrupt_T_15,_procInterrupt_T_14,_procInterrupt_T_13,_procInterrupt_T_12,
    _procInterrupt_T_11,_procInterrupt_T_10,_procInterrupt_T_9,_procInterrupt_T_8}; // @[Interface.scala 262:7]
  wire [63:0] _GEN_170 = reset ? 64'h0 : _GEN_74; // @[virtualStealServer.scala 81:{44,44}]
  Queue rdReq__deq ( // @[Decoupled.scala 377:21]
    .clock(rdReq__deq_clock),
    .reset(rdReq__deq_reset),
    .io_enq_ready(rdReq__deq_io_enq_ready),
    .io_enq_valid(rdReq__deq_io_enq_valid),
    .io_enq_bits_addr(rdReq__deq_io_enq_bits_addr),
    .io_deq_ready(rdReq__deq_io_deq_ready),
    .io_deq_valid(rdReq__deq_io_deq_valid),
    .io_deq_bits_addr(rdReq__deq_io_deq_bits_addr)
  );
  Queue wrReq__deq ( // @[Decoupled.scala 377:21]
    .clock(wrReq__deq_clock),
    .reset(wrReq__deq_reset),
    .io_enq_ready(wrReq__deq_io_enq_ready),
    .io_enq_valid(wrReq__deq_io_enq_valid),
    .io_enq_bits_addr(wrReq__deq_io_enq_bits_addr),
    .io_deq_ready(wrReq__deq_io_deq_ready),
    .io_deq_valid(wrReq__deq_io_deq_valid),
    .io_deq_bits_addr(wrReq__deq_io_deq_bits_addr)
  );
  Queue_2 wrReqData__deq ( // @[Decoupled.scala 377:21]
    .clock(wrReqData__deq_clock),
    .reset(wrReqData__deq_reset),
    .io_enq_ready(wrReqData__deq_io_enq_ready),
    .io_enq_valid(wrReqData__deq_io_enq_valid),
    .io_enq_bits_data(wrReqData__deq_io_enq_bits_data),
    .io_enq_bits_strb(wrReqData__deq_io_enq_bits_strb),
    .io_deq_ready(wrReqData__deq_io_deq_ready),
    .io_deq_valid(wrReqData__deq_io_deq_valid),
    .io_deq_bits_data(wrReqData__deq_io_deq_bits_data),
    .io_deq_bits_strb(wrReqData__deq_io_deq_bits_strb)
  );
  Queue_34 taskQueueBuffer ( // @[virtualStealServer.scala 80:43]
    .clock(taskQueueBuffer_clock),
    .reset(taskQueueBuffer_reset),
    .io_enq_ready(taskQueueBuffer_io_enq_ready),
    .io_enq_valid(taskQueueBuffer_io_enq_valid),
    .io_enq_bits(taskQueueBuffer_io_enq_bits),
    .io_deq_ready(taskQueueBuffer_io_deq_ready),
    .io_deq_valid(taskQueueBuffer_io_deq_valid),
    .io_deq_bits(taskQueueBuffer_io_deq_bits),
    .io_count(taskQueueBuffer_io_count)
  );
  assign io_connNetwork_ctrl_serveStealReq_valid = _T_32 ? 1'h0 : _GEN_122; // @[virtualStealServer.scala 296:40 280:45]
  assign io_connNetwork_data_availableTask_ready = stateReg == 4'h2; // @[virtualStealServer.scala 296:19]
  assign io_connNetwork_data_qOutTask_valid = _T_32 ? 1'h0 : _GEN_121; // @[virtualStealServer.scala 296:40 276:45]
  assign io_connNetwork_data_qOutTask_bits = taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 262:45]
  assign io_axi_mgmt_ARREADY = rdReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_RVALID = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign io_axi_mgmt_RDATA = 6'h28 == rdAddr ? procInterrupt : _GEN_147; // @[RegisterBlock.scala 224:38 225:16]
  assign io_axi_mgmt_AWREADY = wrReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_WREADY = wrReqData__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_BVALID = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign io_read_address_valid = _T_32 ? 1'h0 : _GEN_115; // @[virtualStealServer.scala 296:40 267:45]
  assign io_read_address_bits = _GEN_133[63:0];
  assign io_read_data_ready = _T_32 ? 1'h0 : _GEN_118; // @[virtualStealServer.scala 296:40 269:45]
  assign io_read_burst_len = _GEN_134[3:0];
  assign io_write_address_valid = _T_32 ? 1'h0 : _T_37; // @[virtualStealServer.scala 296:40 270:45]
  assign io_write_address_bits = _GEN_127[63:0];
  assign io_write_data_valid = _T_32 ? 1'h0 : _GEN_112; // @[virtualStealServer.scala 296:40 272:45]
  assign io_write_data_bits = taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 263:45]
  assign io_write_burst_len = _T_32 ? 4'h0 : _GEN_111; // @[virtualStealServer.scala 296:40 289:45]
  assign io_write_last = _T_32 ? 1'h0 : _GEN_114; // @[virtualStealServer.scala 296:40 290:45]
  assign rdReq__deq_clock = clock;
  assign rdReq__deq_reset = reset;
  assign rdReq__deq_io_enq_valid = io_axi_mgmt_ARVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign rdReq__deq_io_enq_bits_addr = io_axi_mgmt_ARADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign rdReq__deq_io_deq_ready = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign wrReq__deq_clock = clock;
  assign wrReq__deq_reset = reset;
  assign wrReq__deq_io_enq_valid = io_axi_mgmt_AWVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReq__deq_io_enq_bits_addr = io_axi_mgmt_AWADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReq__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign wrReqData__deq_clock = clock;
  assign wrReqData__deq_reset = reset;
  assign wrReqData__deq_io_enq_valid = io_axi_mgmt_WVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReqData__deq_io_enq_bits_data = io_axi_mgmt_WDATA; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReqData__deq_io_enq_bits_strb = io_axi_mgmt_WSTRB; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 61:20]
  assign wrReqData__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign taskQueueBuffer_clock = clock;
  assign taskQueueBuffer_reset = reset;
  assign taskQueueBuffer_io_enq_valid = _T_32 ? io_connNetwork_data_availableTask_valid : _GEN_120; // @[virtualStealServer.scala 296:40 300:49]
  assign taskQueueBuffer_io_enq_bits = _T_32 ? io_connNetwork_data_availableTask_bits : _GEN_119; // @[virtualStealServer.scala 296:40 298:49]
  assign taskQueueBuffer_io_deq_ready = _T_32 ? 1'h0 : _GEN_113; // @[virtualStealServer.scala 296:40 286:45]
  always @(posedge clock) begin
    if (reset) begin // @[virtualStealServer.scala 64:44]
      rAddr <= 64'h0; // @[virtualStealServer.scala 64:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h8 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rAddr <= _rAddr_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 65:44]
      rPause <= 64'h0; // @[virtualStealServer.scala 65:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h0 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rPause <= _rPause_T_16; // @[RegisterBlock.scala 118:11]
      end else begin
        rPause <= _GEN_73;
      end
    end else begin
      rPause <= _GEN_73;
    end
    if (reset) begin // @[virtualStealServer.scala 66:44]
      procInterrupt <= 64'h0; // @[virtualStealServer.scala 66:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h28 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        procInterrupt <= _procInterrupt_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 67:44]
      maxLength <= 64'h0; // @[virtualStealServer.scala 67:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h10 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        maxLength <= _maxLength_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 68:44]
      stateReg <= 4'h0; // @[virtualStealServer.scala 68:44]
    end else if (stateReg == 4'h0) begin // @[virtualStealServer.scala 117:34]
      if (currLen == maxLength & networkCongested | maxLength < _T_18) begin // @[virtualStealServer.scala 119:90]
        stateReg <= 4'h9; // @[virtualStealServer.scala 121:22]
      end else if (networkCongested & taskQueueBuffer_io_count == 5'h10) begin // @[virtualStealServer.scala 124:74]
        stateReg <= 4'h4; // @[virtualStealServer.scala 126:22]
      end else begin
        stateReg <= _GEN_10;
      end
    end else if (stateReg == 4'h2) begin // @[virtualStealServer.scala 147:46]
      if (taskQueueBuffer_io_count == 5'hf & io_connNetwork_data_availableTask_valid) begin // @[virtualStealServer.scala 149:91]
        stateReg <= 4'h4; // @[virtualStealServer.scala 151:22]
      end else begin
        stateReg <= _GEN_17;
      end
    end else if (stateReg == 4'h4) begin // @[virtualStealServer.scala 163:54]
      stateReg <= _GEN_19;
    end else begin
      stateReg <= _GEN_57;
    end
    if (reset) begin // @[virtualStealServer.scala 70:44]
      contentionCounter <= 64'h0; // @[virtualStealServer.scala 70:44]
    end else if (_T_1 & contentionCounter != 64'h4) begin // @[virtualStealServer.scala 96:57]
      contentionCounter <= _contentionCounter_T_1; // @[virtualStealServer.scala 97:27]
    end else if (_T_5 & ~io_ntwDataUnitOccupancy) begin // @[virtualStealServer.scala 100:46]
      contentionCounter <= _contentionCounter_T_3; // @[virtualStealServer.scala 101:27]
    end
    if (reset) begin // @[virtualStealServer.scala 72:44]
      networkCongested <= 1'h0; // @[virtualStealServer.scala 72:44]
    end else begin
      networkCongested <= _GEN_3;
    end
    if (reset) begin // @[virtualStealServer.scala 76:44]
      fifoTailReg <= 64'h0; // @[virtualStealServer.scala 76:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h18 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoTailReg <= _fifoTailReg_T_20; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoTailReg <= _GEN_76;
      end
    end else begin
      fifoTailReg <= _GEN_76;
    end
    if (reset) begin // @[virtualStealServer.scala 77:44]
      fifoHeadReg <= 64'h0; // @[virtualStealServer.scala 77:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 375:27]
      if (6'h20 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoHeadReg <= _fifoHeadReg_T_20; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoHeadReg <= _GEN_77;
      end
    end else begin
      fifoHeadReg <= _GEN_77;
    end
    popOrPush <= reset | _GEN_75; // @[virtualStealServer.scala 78:{44,44}]
    memDataCounter <= _GEN_170[4:0]; // @[virtualStealServer.scala 81:{44,44}]
    if (reset) begin // @[virtualStealServer.scala 342:32]
      lengthHistroy <= 64'h0; // @[virtualStealServer.scala 342:32]
    end else if (fifoTailReg > fifoHeadReg) begin // @[virtualStealServer.scala 344:36]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 347:23]
    end else if (fifoTailReg < fifoHeadReg) begin // @[virtualStealServer.scala 349:42]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 352:23]
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (rdReq & ~reset & ~rdReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:182 assert(rdReq)\n"); // @[RegisterBlock.scala 182:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~rdReq & (rdReq & ~reset)) begin
          $fatal; // @[RegisterBlock.scala 182:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (wrReq & _T_80 & ~wrReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:198 assert(wrReq)\n"); // @[RegisterBlock.scala 198:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (~wrReq & (wrReq & _T_80)) begin
          $fatal; // @[RegisterBlock.scala 198:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {2{`RANDOM}};
  rAddr = _RAND_0[63:0];
  _RAND_1 = {2{`RANDOM}};
  rPause = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  procInterrupt = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  maxLength = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  stateReg = _RAND_4[3:0];
  _RAND_5 = {2{`RANDOM}};
  contentionCounter = _RAND_5[63:0];
  _RAND_6 = {1{`RANDOM}};
  networkCongested = _RAND_6[0:0];
  _RAND_7 = {2{`RANDOM}};
  fifoTailReg = _RAND_7[63:0];
  _RAND_8 = {2{`RANDOM}};
  fifoHeadReg = _RAND_8[63:0];
  _RAND_9 = {1{`RANDOM}};
  popOrPush = _RAND_9[0:0];
  _RAND_10 = {1{`RANDOM}};
  memDataCounter = _RAND_10[4:0];
  _RAND_11 = {2{`RANDOM}};
  lengthHistroy = _RAND_11[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module readyValidMem_10(
  input          clock,
  input          reset,
  output         io_read_address_ready,
  input          io_read_address_valid,
  input  [63:0]  io_read_address_bits,
  input          io_read_data_ready,
  output         io_read_data_valid,
  output [127:0] io_read_data_bits,
  output         io_write_address_ready,
  input          io_write_address_valid,
  input  [63:0]  io_write_address_bits,
  output         io_write_data_ready,
  input          io_write_data_valid,
  input  [127:0] io_write_data_bits,
  input  [3:0]   io_writeBurst_len,
  input          io_writeBurst_last,
  input  [3:0]   io_readBurst_len,
  input          axi_ARREADY,
  output         axi_ARVALID,
  output [63:0]  axi_ARADDR,
  output [7:0]   axi_ARLEN,
  output         axi_RREADY,
  input          axi_RVALID,
  input  [127:0] axi_RDATA,
  input          axi_AWREADY,
  output         axi_AWVALID,
  output [63:0]  axi_AWADDR,
  output [7:0]   axi_AWLEN,
  input          axi_WREADY,
  output         axi_WVALID,
  output [127:0] axi_WDATA,
  output         axi_WLAST,
  input          axi_BVALID
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_REG_INIT
  reg  writeHandshakeDetector; // @[readyValidMem.scala 49:39]
  wire  _T_1 = ~writeHandshakeDetector; // @[readyValidMem.scala 81:58]
  wire  _GEN_0 = io_writeBurst_last | writeHandshakeDetector; // @[readyValidMem.scala 84:45 85:34 49:39]
  assign io_read_address_ready = axi_ARREADY; // @[readyValidMem.scala 155:31]
  assign io_read_data_valid = axi_RVALID; // @[readyValidMem.scala 171:31]
  assign io_read_data_bits = axi_RDATA; // @[readyValidMem.scala 172:31]
  assign io_write_address_ready = axi_AWREADY; // @[readyValidMem.scala 143:32]
  assign io_write_data_ready = axi_WREADY & _T_1; // @[readyValidMem.scala 94:53]
  assign axi_ARVALID = io_read_address_valid; // @[readyValidMem.scala 153:31]
  assign axi_ARADDR = io_read_address_bits; // @[readyValidMem.scala 154:31]
  assign axi_ARLEN = {{4'd0}, io_readBurst_len}; // @[readyValidMem.scala 158:33]
  assign axi_RREADY = io_read_data_ready; // @[readyValidMem.scala 169:31]
  assign axi_AWVALID = io_write_address_valid; // @[readyValidMem.scala 116:28]
  assign axi_AWADDR = io_write_address_bits; // @[readyValidMem.scala 117:28]
  assign axi_AWLEN = {{4'd0}, io_writeBurst_len}; // @[readyValidMem.scala 120:30]
  assign axi_WVALID = io_write_data_valid & axi_WREADY & ~writeHandshakeDetector; // @[readyValidMem.scala 81:55]
  assign axi_WDATA = io_write_data_bits; // @[readyValidMem.scala 130:28]
  assign axi_WLAST = io_writeBurst_last; // @[readyValidMem.scala 134:30]
  always @(posedge clock) begin
    if (reset) begin // @[readyValidMem.scala 49:39]
      writeHandshakeDetector <= 1'h0; // @[readyValidMem.scala 49:39]
    end else if (io_write_data_valid & axi_WREADY & ~writeHandshakeDetector) begin // @[readyValidMem.scala 81:82]
      writeHandshakeDetector <= _GEN_0;
    end else if (axi_BVALID) begin // @[readyValidMem.scala 88:34]
      writeHandshakeDetector <= 1'h0; // @[readyValidMem.scala 90:32]
    end
  end
// Register and memory initialization
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE_MEM_INIT
  integer initvar;
`endif
`ifndef SYNTHESIS
`ifdef FIRRTL_BEFORE_INITIAL
`FIRRTL_BEFORE_INITIAL
`endif
initial begin
  `ifdef RANDOMIZE
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      `ifdef RANDOMIZE_DELAY
        #`RANDOMIZE_DELAY begin end
      `else
        #0.002 begin end
      `endif
    `endif
`ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  writeHandshakeDetector = _RAND_0[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module stealSide_1(
  input          clock,
  input          reset,
  output         io_axi_mgmt_vss_0_ARREADY,
  input          io_axi_mgmt_vss_0_ARVALID,
  input  [5:0]   io_axi_mgmt_vss_0_ARADDR,
  input          io_axi_mgmt_vss_0_RREADY,
  output         io_axi_mgmt_vss_0_RVALID,
  output [63:0]  io_axi_mgmt_vss_0_RDATA,
  output         io_axi_mgmt_vss_0_AWREADY,
  input          io_axi_mgmt_vss_0_AWVALID,
  input  [5:0]   io_axi_mgmt_vss_0_AWADDR,
  output         io_axi_mgmt_vss_0_WREADY,
  input          io_axi_mgmt_vss_0_WVALID,
  input  [63:0]  io_axi_mgmt_vss_0_WDATA,
  input  [7:0]   io_axi_mgmt_vss_0_WSTRB,
  input          io_axi_mgmt_vss_0_BREADY,
  output         io_axi_mgmt_vss_0_BVALID,
  output         io_axi_mgmt_vss_1_ARREADY,
  input          io_axi_mgmt_vss_1_ARVALID,
  input  [5:0]   io_axi_mgmt_vss_1_ARADDR,
  input          io_axi_mgmt_vss_1_RREADY,
  output         io_axi_mgmt_vss_1_RVALID,
  output [63:0]  io_axi_mgmt_vss_1_RDATA,
  output         io_axi_mgmt_vss_1_AWREADY,
  input          io_axi_mgmt_vss_1_AWVALID,
  input  [5:0]   io_axi_mgmt_vss_1_AWADDR,
  output         io_axi_mgmt_vss_1_WREADY,
  input          io_axi_mgmt_vss_1_WVALID,
  input  [63:0]  io_axi_mgmt_vss_1_WDATA,
  input  [7:0]   io_axi_mgmt_vss_1_WSTRB,
  input          io_axi_mgmt_vss_1_BREADY,
  output         io_axi_mgmt_vss_1_BVALID,
  output         io_axi_mgmt_vss_2_ARREADY,
  input          io_axi_mgmt_vss_2_ARVALID,
  input  [5:0]   io_axi_mgmt_vss_2_ARADDR,
  input          io_axi_mgmt_vss_2_RREADY,
  output         io_axi_mgmt_vss_2_RVALID,
  output [63:0]  io_axi_mgmt_vss_2_RDATA,
  output         io_axi_mgmt_vss_2_AWREADY,
  input          io_axi_mgmt_vss_2_AWVALID,
  input  [5:0]   io_axi_mgmt_vss_2_AWADDR,
  output         io_axi_mgmt_vss_2_WREADY,
  input          io_axi_mgmt_vss_2_WVALID,
  input  [63:0]  io_axi_mgmt_vss_2_WDATA,
  input  [7:0]   io_axi_mgmt_vss_2_WSTRB,
  input          io_axi_mgmt_vss_2_BREADY,
  output         io_axi_mgmt_vss_2_BVALID,
  output         io_axi_mgmt_vss_3_ARREADY,
  input          io_axi_mgmt_vss_3_ARVALID,
  input  [5:0]   io_axi_mgmt_vss_3_ARADDR,
  input          io_axi_mgmt_vss_3_RREADY,
  output         io_axi_mgmt_vss_3_RVALID,
  output [63:0]  io_axi_mgmt_vss_3_RDATA,
  output         io_axi_mgmt_vss_3_AWREADY,
  input          io_axi_mgmt_vss_3_AWVALID,
  input  [5:0]   io_axi_mgmt_vss_3_AWADDR,
  output         io_axi_mgmt_vss_3_WREADY,
  input          io_axi_mgmt_vss_3_WVALID,
  input  [63:0]  io_axi_mgmt_vss_3_WDATA,
  input  [7:0]   io_axi_mgmt_vss_3_WSTRB,
  input          io_axi_mgmt_vss_3_BREADY,
  output         io_axi_mgmt_vss_3_BVALID,
  input          io_vss_axi_full_0_ARREADY,
  output         io_vss_axi_full_0_ARVALID,
  output [63:0]  io_vss_axi_full_0_ARADDR,
  output [7:0]   io_vss_axi_full_0_ARLEN,
  output         io_vss_axi_full_0_RREADY,
  input          io_vss_axi_full_0_RVALID,
  input  [127:0] io_vss_axi_full_0_RDATA,
  input          io_vss_axi_full_0_AWREADY,
  output         io_vss_axi_full_0_AWVALID,
  output [63:0]  io_vss_axi_full_0_AWADDR,
  output [7:0]   io_vss_axi_full_0_AWLEN,
  input          io_vss_axi_full_0_WREADY,
  output         io_vss_axi_full_0_WVALID,
  output [127:0] io_vss_axi_full_0_WDATA,
  output         io_vss_axi_full_0_WLAST,
  input          io_vss_axi_full_0_BVALID,
  input          io_vss_axi_full_1_ARREADY,
  output         io_vss_axi_full_1_ARVALID,
  output [63:0]  io_vss_axi_full_1_ARADDR,
  output [7:0]   io_vss_axi_full_1_ARLEN,
  output         io_vss_axi_full_1_RREADY,
  input          io_vss_axi_full_1_RVALID,
  input  [127:0] io_vss_axi_full_1_RDATA,
  input          io_vss_axi_full_1_AWREADY,
  output         io_vss_axi_full_1_AWVALID,
  output [63:0]  io_vss_axi_full_1_AWADDR,
  output [7:0]   io_vss_axi_full_1_AWLEN,
  input          io_vss_axi_full_1_WREADY,
  output         io_vss_axi_full_1_WVALID,
  output [127:0] io_vss_axi_full_1_WDATA,
  output         io_vss_axi_full_1_WLAST,
  input          io_vss_axi_full_1_BVALID,
  input          io_vss_axi_full_2_ARREADY,
  output         io_vss_axi_full_2_ARVALID,
  output [63:0]  io_vss_axi_full_2_ARADDR,
  output [7:0]   io_vss_axi_full_2_ARLEN,
  output         io_vss_axi_full_2_RREADY,
  input          io_vss_axi_full_2_RVALID,
  input  [127:0] io_vss_axi_full_2_RDATA,
  input          io_vss_axi_full_2_AWREADY,
  output         io_vss_axi_full_2_AWVALID,
  output [63:0]  io_vss_axi_full_2_AWADDR,
  output [7:0]   io_vss_axi_full_2_AWLEN,
  input          io_vss_axi_full_2_WREADY,
  output         io_vss_axi_full_2_WVALID,
  output [127:0] io_vss_axi_full_2_WDATA,
  output         io_vss_axi_full_2_WLAST,
  input          io_vss_axi_full_2_BVALID,
  input          io_vss_axi_full_3_ARREADY,
  output         io_vss_axi_full_3_ARVALID,
  output [63:0]  io_vss_axi_full_3_ARADDR,
  output [7:0]   io_vss_axi_full_3_ARLEN,
  output         io_vss_axi_full_3_RREADY,
  input          io_vss_axi_full_3_RVALID,
  input  [127:0] io_vss_axi_full_3_RDATA,
  input          io_vss_axi_full_3_AWREADY,
  output         io_vss_axi_full_3_AWVALID,
  output [63:0]  io_vss_axi_full_3_AWADDR,
  output [7:0]   io_vss_axi_full_3_AWLEN,
  input          io_vss_axi_full_3_WREADY,
  output         io_vss_axi_full_3_WVALID,
  output [127:0] io_vss_axi_full_3_WDATA,
  output         io_vss_axi_full_3_WLAST,
  input          io_vss_axi_full_3_BVALID,
  input          io_taskOut_0_TREADY,
  output         io_taskOut_0_TVALID,
  output [127:0] io_taskOut_0_TDATA,
  input          io_taskOut_1_TREADY,
  output         io_taskOut_1_TVALID,
  output [127:0] io_taskOut_1_TDATA,
  input          io_taskOut_2_TREADY,
  output         io_taskOut_2_TVALID,
  output [127:0] io_taskOut_2_TDATA,
  input          io_taskOut_3_TREADY,
  output         io_taskOut_3_TVALID,
  output [127:0] io_taskOut_3_TDATA,
  output         io_taskIn_0_TREADY,
  input          io_taskIn_0_TVALID,
  input  [127:0] io_taskIn_0_TDATA,
  output         io_taskIn_1_TREADY,
  input          io_taskIn_1_TVALID,
  input  [127:0] io_taskIn_1_TDATA,
  output         io_taskIn_2_TREADY,
  input          io_taskIn_2_TVALID,
  input  [127:0] io_taskIn_2_TDATA,
  output         io_taskIn_3_TREADY,
  input          io_taskIn_3_TVALID,
  input  [127:0] io_taskIn_3_TDATA
);
  wire  stealNW_TQ_clock; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_reset; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_push_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_0_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_push_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_1_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_push_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_2_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_push_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_3_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_0_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_1_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_1_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_2_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_2_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_3_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [127:0] stealNW_TQ_io_connVSS_3_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_0; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_1; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_2; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_3; // @[stealSide.scala 53:28]
  wire  virtualStealServers_0_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_0_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_ARREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_ARVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_0_io_axi_mgmt_ARADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_RREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_RVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_axi_mgmt_RDATA; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_AWREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_AWVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_0_io_axi_mgmt_AWADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_WREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_WVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_axi_mgmt_WDATA; // @[stealSide.scala 63:75]
  wire [7:0] virtualStealServers_0_io_axi_mgmt_WSTRB; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_BREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_axi_mgmt_BVALID; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_read_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_read_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_0_io_read_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_0_io_read_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_0_io_write_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_last; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_1_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_ARREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_ARVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_1_io_axi_mgmt_ARADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_RREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_RVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_1_io_axi_mgmt_RDATA; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_AWREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_AWVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_1_io_axi_mgmt_AWADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_WREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_WVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_1_io_axi_mgmt_WDATA; // @[stealSide.scala 63:75]
  wire [7:0] virtualStealServers_1_io_axi_mgmt_WSTRB; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_BREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_axi_mgmt_BVALID; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_read_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_read_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_1_io_read_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_read_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_read_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_1_io_read_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_1_io_read_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_1_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_1_io_write_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_1_io_write_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_last; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_2_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_ARREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_ARVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_2_io_axi_mgmt_ARADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_RREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_RVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_2_io_axi_mgmt_RDATA; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_AWREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_AWVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_2_io_axi_mgmt_AWADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_WREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_WVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_2_io_axi_mgmt_WDATA; // @[stealSide.scala 63:75]
  wire [7:0] virtualStealServers_2_io_axi_mgmt_WSTRB; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_BREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_axi_mgmt_BVALID; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_read_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_read_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_2_io_read_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_read_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_read_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_2_io_read_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_2_io_read_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_2_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_2_io_write_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_2_io_write_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_last; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_3_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_ARREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_ARVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_3_io_axi_mgmt_ARADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_RREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_RVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_3_io_axi_mgmt_RDATA; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_AWREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_AWVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_3_io_axi_mgmt_AWADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_WREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_WVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_3_io_axi_mgmt_WDATA; // @[stealSide.scala 63:75]
  wire [7:0] virtualStealServers_3_io_axi_mgmt_WSTRB; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_BREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_axi_mgmt_BVALID; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_read_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_read_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_3_io_read_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_read_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_read_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_3_io_read_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_3_io_read_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_3_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [127:0] virtualStealServers_3_io_write_data_bits; // @[stealSide.scala 63:75]
  wire [3:0] virtualStealServers_3_io_write_burst_len; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_last; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  vssRvm_0_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_0_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_0_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_0_io_write_data_bits; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_0_io_writeBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_writeBurst_last; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_0_io_readBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_axi_ARADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_0_axi_ARLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_RVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_0_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_axi_AWADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_0_axi_AWLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_0_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WLAST; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_BVALID; // @[stealSide.scala 87:68]
  wire  vssRvm_1_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_1_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_1_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_1_io_write_data_bits; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_1_io_writeBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_writeBurst_last; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_1_io_readBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_axi_ARADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_1_axi_ARLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_RVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_1_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_axi_AWADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_1_axi_AWLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_WVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_1_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_WLAST; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_BVALID; // @[stealSide.scala 87:68]
  wire  vssRvm_2_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_2_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_2_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_2_io_write_data_bits; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_2_io_writeBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_writeBurst_last; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_2_io_readBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_axi_ARADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_2_axi_ARLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_RVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_2_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_axi_AWADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_2_axi_AWLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_WVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_2_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_WLAST; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_BVALID; // @[stealSide.scala 87:68]
  wire  vssRvm_3_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_3_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_3_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_3_io_write_data_bits; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_3_io_writeBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_writeBurst_last; // @[stealSide.scala 87:68]
  wire [3:0] vssRvm_3_io_readBurst_len; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_axi_ARADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_3_axi_ARLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_RVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_3_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_axi_AWADDR; // @[stealSide.scala 87:68]
  wire [7:0] vssRvm_3_axi_AWLEN; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_WVALID; // @[stealSide.scala 87:68]
  wire [127:0] vssRvm_3_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_WLAST; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_BVALID; // @[stealSide.scala 87:68]
  stealNW_TQ_1 stealNW_TQ ( // @[stealSide.scala 53:28]
    .clock(stealNW_TQ_clock),
    .reset(stealNW_TQ_reset),
    .io_connPE_0_push_ready(stealNW_TQ_io_connPE_0_push_ready),
    .io_connPE_0_push_valid(stealNW_TQ_io_connPE_0_push_valid),
    .io_connPE_0_push_bits(stealNW_TQ_io_connPE_0_push_bits),
    .io_connPE_0_pop_ready(stealNW_TQ_io_connPE_0_pop_ready),
    .io_connPE_0_pop_valid(stealNW_TQ_io_connPE_0_pop_valid),
    .io_connPE_0_pop_bits(stealNW_TQ_io_connPE_0_pop_bits),
    .io_connPE_1_push_ready(stealNW_TQ_io_connPE_1_push_ready),
    .io_connPE_1_push_valid(stealNW_TQ_io_connPE_1_push_valid),
    .io_connPE_1_push_bits(stealNW_TQ_io_connPE_1_push_bits),
    .io_connPE_1_pop_ready(stealNW_TQ_io_connPE_1_pop_ready),
    .io_connPE_1_pop_valid(stealNW_TQ_io_connPE_1_pop_valid),
    .io_connPE_1_pop_bits(stealNW_TQ_io_connPE_1_pop_bits),
    .io_connPE_2_push_ready(stealNW_TQ_io_connPE_2_push_ready),
    .io_connPE_2_push_valid(stealNW_TQ_io_connPE_2_push_valid),
    .io_connPE_2_push_bits(stealNW_TQ_io_connPE_2_push_bits),
    .io_connPE_2_pop_ready(stealNW_TQ_io_connPE_2_pop_ready),
    .io_connPE_2_pop_valid(stealNW_TQ_io_connPE_2_pop_valid),
    .io_connPE_2_pop_bits(stealNW_TQ_io_connPE_2_pop_bits),
    .io_connPE_3_push_ready(stealNW_TQ_io_connPE_3_push_ready),
    .io_connPE_3_push_valid(stealNW_TQ_io_connPE_3_push_valid),
    .io_connPE_3_push_bits(stealNW_TQ_io_connPE_3_push_bits),
    .io_connPE_3_pop_ready(stealNW_TQ_io_connPE_3_pop_ready),
    .io_connPE_3_pop_valid(stealNW_TQ_io_connPE_3_pop_valid),
    .io_connPE_3_pop_bits(stealNW_TQ_io_connPE_3_pop_bits),
    .io_connVSS_0_ctrl_serveStealReq_ready(stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready),
    .io_connVSS_0_ctrl_serveStealReq_valid(stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid),
    .io_connVSS_0_data_availableTask_ready(stealNW_TQ_io_connVSS_0_data_availableTask_ready),
    .io_connVSS_0_data_availableTask_valid(stealNW_TQ_io_connVSS_0_data_availableTask_valid),
    .io_connVSS_0_data_availableTask_bits(stealNW_TQ_io_connVSS_0_data_availableTask_bits),
    .io_connVSS_0_data_qOutTask_ready(stealNW_TQ_io_connVSS_0_data_qOutTask_ready),
    .io_connVSS_0_data_qOutTask_valid(stealNW_TQ_io_connVSS_0_data_qOutTask_valid),
    .io_connVSS_0_data_qOutTask_bits(stealNW_TQ_io_connVSS_0_data_qOutTask_bits),
    .io_connVSS_1_ctrl_serveStealReq_ready(stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_ready),
    .io_connVSS_1_ctrl_serveStealReq_valid(stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_valid),
    .io_connVSS_1_data_availableTask_ready(stealNW_TQ_io_connVSS_1_data_availableTask_ready),
    .io_connVSS_1_data_availableTask_valid(stealNW_TQ_io_connVSS_1_data_availableTask_valid),
    .io_connVSS_1_data_availableTask_bits(stealNW_TQ_io_connVSS_1_data_availableTask_bits),
    .io_connVSS_1_data_qOutTask_ready(stealNW_TQ_io_connVSS_1_data_qOutTask_ready),
    .io_connVSS_1_data_qOutTask_valid(stealNW_TQ_io_connVSS_1_data_qOutTask_valid),
    .io_connVSS_1_data_qOutTask_bits(stealNW_TQ_io_connVSS_1_data_qOutTask_bits),
    .io_connVSS_2_ctrl_serveStealReq_ready(stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_ready),
    .io_connVSS_2_ctrl_serveStealReq_valid(stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_valid),
    .io_connVSS_2_data_availableTask_ready(stealNW_TQ_io_connVSS_2_data_availableTask_ready),
    .io_connVSS_2_data_availableTask_valid(stealNW_TQ_io_connVSS_2_data_availableTask_valid),
    .io_connVSS_2_data_availableTask_bits(stealNW_TQ_io_connVSS_2_data_availableTask_bits),
    .io_connVSS_2_data_qOutTask_ready(stealNW_TQ_io_connVSS_2_data_qOutTask_ready),
    .io_connVSS_2_data_qOutTask_valid(stealNW_TQ_io_connVSS_2_data_qOutTask_valid),
    .io_connVSS_2_data_qOutTask_bits(stealNW_TQ_io_connVSS_2_data_qOutTask_bits),
    .io_connVSS_3_ctrl_serveStealReq_ready(stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_ready),
    .io_connVSS_3_ctrl_serveStealReq_valid(stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_valid),
    .io_connVSS_3_data_availableTask_ready(stealNW_TQ_io_connVSS_3_data_availableTask_ready),
    .io_connVSS_3_data_availableTask_valid(stealNW_TQ_io_connVSS_3_data_availableTask_valid),
    .io_connVSS_3_data_availableTask_bits(stealNW_TQ_io_connVSS_3_data_availableTask_bits),
    .io_connVSS_3_data_qOutTask_ready(stealNW_TQ_io_connVSS_3_data_qOutTask_ready),
    .io_connVSS_3_data_qOutTask_valid(stealNW_TQ_io_connVSS_3_data_qOutTask_valid),
    .io_connVSS_3_data_qOutTask_bits(stealNW_TQ_io_connVSS_3_data_qOutTask_bits),
    .io_ntwDataUnitOccupancyVSS_0(stealNW_TQ_io_ntwDataUnitOccupancyVSS_0),
    .io_ntwDataUnitOccupancyVSS_1(stealNW_TQ_io_ntwDataUnitOccupancyVSS_1),
    .io_ntwDataUnitOccupancyVSS_2(stealNW_TQ_io_ntwDataUnitOccupancyVSS_2),
    .io_ntwDataUnitOccupancyVSS_3(stealNW_TQ_io_ntwDataUnitOccupancyVSS_3)
  );
  virtualStealServer_1 virtualStealServers_0 ( // @[stealSide.scala 63:75]
    .clock(virtualStealServers_0_clock),
    .reset(virtualStealServers_0_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_data_availableTask_ready(virtualStealServers_0_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(virtualStealServers_0_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(virtualStealServers_0_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(virtualStealServers_0_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(virtualStealServers_0_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(virtualStealServers_0_io_connNetwork_data_qOutTask_bits),
    .io_axi_mgmt_ARREADY(virtualStealServers_0_io_axi_mgmt_ARREADY),
    .io_axi_mgmt_ARVALID(virtualStealServers_0_io_axi_mgmt_ARVALID),
    .io_axi_mgmt_ARADDR(virtualStealServers_0_io_axi_mgmt_ARADDR),
    .io_axi_mgmt_RREADY(virtualStealServers_0_io_axi_mgmt_RREADY),
    .io_axi_mgmt_RVALID(virtualStealServers_0_io_axi_mgmt_RVALID),
    .io_axi_mgmt_RDATA(virtualStealServers_0_io_axi_mgmt_RDATA),
    .io_axi_mgmt_AWREADY(virtualStealServers_0_io_axi_mgmt_AWREADY),
    .io_axi_mgmt_AWVALID(virtualStealServers_0_io_axi_mgmt_AWVALID),
    .io_axi_mgmt_AWADDR(virtualStealServers_0_io_axi_mgmt_AWADDR),
    .io_axi_mgmt_WREADY(virtualStealServers_0_io_axi_mgmt_WREADY),
    .io_axi_mgmt_WVALID(virtualStealServers_0_io_axi_mgmt_WVALID),
    .io_axi_mgmt_WDATA(virtualStealServers_0_io_axi_mgmt_WDATA),
    .io_axi_mgmt_WSTRB(virtualStealServers_0_io_axi_mgmt_WSTRB),
    .io_axi_mgmt_BREADY(virtualStealServers_0_io_axi_mgmt_BREADY),
    .io_axi_mgmt_BVALID(virtualStealServers_0_io_axi_mgmt_BVALID),
    .io_read_address_ready(virtualStealServers_0_io_read_address_ready),
    .io_read_address_valid(virtualStealServers_0_io_read_address_valid),
    .io_read_address_bits(virtualStealServers_0_io_read_address_bits),
    .io_read_data_ready(virtualStealServers_0_io_read_data_ready),
    .io_read_data_valid(virtualStealServers_0_io_read_data_valid),
    .io_read_data_bits(virtualStealServers_0_io_read_data_bits),
    .io_read_burst_len(virtualStealServers_0_io_read_burst_len),
    .io_write_address_ready(virtualStealServers_0_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_0_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_0_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_0_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_0_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_0_io_write_data_bits),
    .io_write_burst_len(virtualStealServers_0_io_write_burst_len),
    .io_write_last(virtualStealServers_0_io_write_last),
    .io_ntwDataUnitOccupancy(virtualStealServers_0_io_ntwDataUnitOccupancy)
  );
  virtualStealServer_1 virtualStealServers_1 ( // @[stealSide.scala 63:75]
    .clock(virtualStealServers_1_clock),
    .reset(virtualStealServers_1_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_data_availableTask_ready(virtualStealServers_1_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(virtualStealServers_1_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(virtualStealServers_1_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(virtualStealServers_1_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(virtualStealServers_1_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(virtualStealServers_1_io_connNetwork_data_qOutTask_bits),
    .io_axi_mgmt_ARREADY(virtualStealServers_1_io_axi_mgmt_ARREADY),
    .io_axi_mgmt_ARVALID(virtualStealServers_1_io_axi_mgmt_ARVALID),
    .io_axi_mgmt_ARADDR(virtualStealServers_1_io_axi_mgmt_ARADDR),
    .io_axi_mgmt_RREADY(virtualStealServers_1_io_axi_mgmt_RREADY),
    .io_axi_mgmt_RVALID(virtualStealServers_1_io_axi_mgmt_RVALID),
    .io_axi_mgmt_RDATA(virtualStealServers_1_io_axi_mgmt_RDATA),
    .io_axi_mgmt_AWREADY(virtualStealServers_1_io_axi_mgmt_AWREADY),
    .io_axi_mgmt_AWVALID(virtualStealServers_1_io_axi_mgmt_AWVALID),
    .io_axi_mgmt_AWADDR(virtualStealServers_1_io_axi_mgmt_AWADDR),
    .io_axi_mgmt_WREADY(virtualStealServers_1_io_axi_mgmt_WREADY),
    .io_axi_mgmt_WVALID(virtualStealServers_1_io_axi_mgmt_WVALID),
    .io_axi_mgmt_WDATA(virtualStealServers_1_io_axi_mgmt_WDATA),
    .io_axi_mgmt_WSTRB(virtualStealServers_1_io_axi_mgmt_WSTRB),
    .io_axi_mgmt_BREADY(virtualStealServers_1_io_axi_mgmt_BREADY),
    .io_axi_mgmt_BVALID(virtualStealServers_1_io_axi_mgmt_BVALID),
    .io_read_address_ready(virtualStealServers_1_io_read_address_ready),
    .io_read_address_valid(virtualStealServers_1_io_read_address_valid),
    .io_read_address_bits(virtualStealServers_1_io_read_address_bits),
    .io_read_data_ready(virtualStealServers_1_io_read_data_ready),
    .io_read_data_valid(virtualStealServers_1_io_read_data_valid),
    .io_read_data_bits(virtualStealServers_1_io_read_data_bits),
    .io_read_burst_len(virtualStealServers_1_io_read_burst_len),
    .io_write_address_ready(virtualStealServers_1_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_1_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_1_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_1_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_1_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_1_io_write_data_bits),
    .io_write_burst_len(virtualStealServers_1_io_write_burst_len),
    .io_write_last(virtualStealServers_1_io_write_last),
    .io_ntwDataUnitOccupancy(virtualStealServers_1_io_ntwDataUnitOccupancy)
  );
  virtualStealServer_1 virtualStealServers_2 ( // @[stealSide.scala 63:75]
    .clock(virtualStealServers_2_clock),
    .reset(virtualStealServers_2_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_data_availableTask_ready(virtualStealServers_2_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(virtualStealServers_2_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(virtualStealServers_2_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(virtualStealServers_2_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(virtualStealServers_2_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(virtualStealServers_2_io_connNetwork_data_qOutTask_bits),
    .io_axi_mgmt_ARREADY(virtualStealServers_2_io_axi_mgmt_ARREADY),
    .io_axi_mgmt_ARVALID(virtualStealServers_2_io_axi_mgmt_ARVALID),
    .io_axi_mgmt_ARADDR(virtualStealServers_2_io_axi_mgmt_ARADDR),
    .io_axi_mgmt_RREADY(virtualStealServers_2_io_axi_mgmt_RREADY),
    .io_axi_mgmt_RVALID(virtualStealServers_2_io_axi_mgmt_RVALID),
    .io_axi_mgmt_RDATA(virtualStealServers_2_io_axi_mgmt_RDATA),
    .io_axi_mgmt_AWREADY(virtualStealServers_2_io_axi_mgmt_AWREADY),
    .io_axi_mgmt_AWVALID(virtualStealServers_2_io_axi_mgmt_AWVALID),
    .io_axi_mgmt_AWADDR(virtualStealServers_2_io_axi_mgmt_AWADDR),
    .io_axi_mgmt_WREADY(virtualStealServers_2_io_axi_mgmt_WREADY),
    .io_axi_mgmt_WVALID(virtualStealServers_2_io_axi_mgmt_WVALID),
    .io_axi_mgmt_WDATA(virtualStealServers_2_io_axi_mgmt_WDATA),
    .io_axi_mgmt_WSTRB(virtualStealServers_2_io_axi_mgmt_WSTRB),
    .io_axi_mgmt_BREADY(virtualStealServers_2_io_axi_mgmt_BREADY),
    .io_axi_mgmt_BVALID(virtualStealServers_2_io_axi_mgmt_BVALID),
    .io_read_address_ready(virtualStealServers_2_io_read_address_ready),
    .io_read_address_valid(virtualStealServers_2_io_read_address_valid),
    .io_read_address_bits(virtualStealServers_2_io_read_address_bits),
    .io_read_data_ready(virtualStealServers_2_io_read_data_ready),
    .io_read_data_valid(virtualStealServers_2_io_read_data_valid),
    .io_read_data_bits(virtualStealServers_2_io_read_data_bits),
    .io_read_burst_len(virtualStealServers_2_io_read_burst_len),
    .io_write_address_ready(virtualStealServers_2_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_2_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_2_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_2_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_2_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_2_io_write_data_bits),
    .io_write_burst_len(virtualStealServers_2_io_write_burst_len),
    .io_write_last(virtualStealServers_2_io_write_last),
    .io_ntwDataUnitOccupancy(virtualStealServers_2_io_ntwDataUnitOccupancy)
  );
  virtualStealServer_1 virtualStealServers_3 ( // @[stealSide.scala 63:75]
    .clock(virtualStealServers_3_clock),
    .reset(virtualStealServers_3_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_data_availableTask_ready(virtualStealServers_3_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(virtualStealServers_3_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(virtualStealServers_3_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(virtualStealServers_3_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(virtualStealServers_3_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(virtualStealServers_3_io_connNetwork_data_qOutTask_bits),
    .io_axi_mgmt_ARREADY(virtualStealServers_3_io_axi_mgmt_ARREADY),
    .io_axi_mgmt_ARVALID(virtualStealServers_3_io_axi_mgmt_ARVALID),
    .io_axi_mgmt_ARADDR(virtualStealServers_3_io_axi_mgmt_ARADDR),
    .io_axi_mgmt_RREADY(virtualStealServers_3_io_axi_mgmt_RREADY),
    .io_axi_mgmt_RVALID(virtualStealServers_3_io_axi_mgmt_RVALID),
    .io_axi_mgmt_RDATA(virtualStealServers_3_io_axi_mgmt_RDATA),
    .io_axi_mgmt_AWREADY(virtualStealServers_3_io_axi_mgmt_AWREADY),
    .io_axi_mgmt_AWVALID(virtualStealServers_3_io_axi_mgmt_AWVALID),
    .io_axi_mgmt_AWADDR(virtualStealServers_3_io_axi_mgmt_AWADDR),
    .io_axi_mgmt_WREADY(virtualStealServers_3_io_axi_mgmt_WREADY),
    .io_axi_mgmt_WVALID(virtualStealServers_3_io_axi_mgmt_WVALID),
    .io_axi_mgmt_WDATA(virtualStealServers_3_io_axi_mgmt_WDATA),
    .io_axi_mgmt_WSTRB(virtualStealServers_3_io_axi_mgmt_WSTRB),
    .io_axi_mgmt_BREADY(virtualStealServers_3_io_axi_mgmt_BREADY),
    .io_axi_mgmt_BVALID(virtualStealServers_3_io_axi_mgmt_BVALID),
    .io_read_address_ready(virtualStealServers_3_io_read_address_ready),
    .io_read_address_valid(virtualStealServers_3_io_read_address_valid),
    .io_read_address_bits(virtualStealServers_3_io_read_address_bits),
    .io_read_data_ready(virtualStealServers_3_io_read_data_ready),
    .io_read_data_valid(virtualStealServers_3_io_read_data_valid),
    .io_read_data_bits(virtualStealServers_3_io_read_data_bits),
    .io_read_burst_len(virtualStealServers_3_io_read_burst_len),
    .io_write_address_ready(virtualStealServers_3_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_3_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_3_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_3_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_3_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_3_io_write_data_bits),
    .io_write_burst_len(virtualStealServers_3_io_write_burst_len),
    .io_write_last(virtualStealServers_3_io_write_last),
    .io_ntwDataUnitOccupancy(virtualStealServers_3_io_ntwDataUnitOccupancy)
  );
  readyValidMem_10 vssRvm_0 ( // @[stealSide.scala 87:68]
    .clock(vssRvm_0_clock),
    .reset(vssRvm_0_reset),
    .io_read_address_ready(vssRvm_0_io_read_address_ready),
    .io_read_address_valid(vssRvm_0_io_read_address_valid),
    .io_read_address_bits(vssRvm_0_io_read_address_bits),
    .io_read_data_ready(vssRvm_0_io_read_data_ready),
    .io_read_data_valid(vssRvm_0_io_read_data_valid),
    .io_read_data_bits(vssRvm_0_io_read_data_bits),
    .io_write_address_ready(vssRvm_0_io_write_address_ready),
    .io_write_address_valid(vssRvm_0_io_write_address_valid),
    .io_write_address_bits(vssRvm_0_io_write_address_bits),
    .io_write_data_ready(vssRvm_0_io_write_data_ready),
    .io_write_data_valid(vssRvm_0_io_write_data_valid),
    .io_write_data_bits(vssRvm_0_io_write_data_bits),
    .io_writeBurst_len(vssRvm_0_io_writeBurst_len),
    .io_writeBurst_last(vssRvm_0_io_writeBurst_last),
    .io_readBurst_len(vssRvm_0_io_readBurst_len),
    .axi_ARREADY(vssRvm_0_axi_ARREADY),
    .axi_ARVALID(vssRvm_0_axi_ARVALID),
    .axi_ARADDR(vssRvm_0_axi_ARADDR),
    .axi_ARLEN(vssRvm_0_axi_ARLEN),
    .axi_RREADY(vssRvm_0_axi_RREADY),
    .axi_RVALID(vssRvm_0_axi_RVALID),
    .axi_RDATA(vssRvm_0_axi_RDATA),
    .axi_AWREADY(vssRvm_0_axi_AWREADY),
    .axi_AWVALID(vssRvm_0_axi_AWVALID),
    .axi_AWADDR(vssRvm_0_axi_AWADDR),
    .axi_AWLEN(vssRvm_0_axi_AWLEN),
    .axi_WREADY(vssRvm_0_axi_WREADY),
    .axi_WVALID(vssRvm_0_axi_WVALID),
    .axi_WDATA(vssRvm_0_axi_WDATA),
    .axi_WLAST(vssRvm_0_axi_WLAST),
    .axi_BVALID(vssRvm_0_axi_BVALID)
  );
  readyValidMem_10 vssRvm_1 ( // @[stealSide.scala 87:68]
    .clock(vssRvm_1_clock),
    .reset(vssRvm_1_reset),
    .io_read_address_ready(vssRvm_1_io_read_address_ready),
    .io_read_address_valid(vssRvm_1_io_read_address_valid),
    .io_read_address_bits(vssRvm_1_io_read_address_bits),
    .io_read_data_ready(vssRvm_1_io_read_data_ready),
    .io_read_data_valid(vssRvm_1_io_read_data_valid),
    .io_read_data_bits(vssRvm_1_io_read_data_bits),
    .io_write_address_ready(vssRvm_1_io_write_address_ready),
    .io_write_address_valid(vssRvm_1_io_write_address_valid),
    .io_write_address_bits(vssRvm_1_io_write_address_bits),
    .io_write_data_ready(vssRvm_1_io_write_data_ready),
    .io_write_data_valid(vssRvm_1_io_write_data_valid),
    .io_write_data_bits(vssRvm_1_io_write_data_bits),
    .io_writeBurst_len(vssRvm_1_io_writeBurst_len),
    .io_writeBurst_last(vssRvm_1_io_writeBurst_last),
    .io_readBurst_len(vssRvm_1_io_readBurst_len),
    .axi_ARREADY(vssRvm_1_axi_ARREADY),
    .axi_ARVALID(vssRvm_1_axi_ARVALID),
    .axi_ARADDR(vssRvm_1_axi_ARADDR),
    .axi_ARLEN(vssRvm_1_axi_ARLEN),
    .axi_RREADY(vssRvm_1_axi_RREADY),
    .axi_RVALID(vssRvm_1_axi_RVALID),
    .axi_RDATA(vssRvm_1_axi_RDATA),
    .axi_AWREADY(vssRvm_1_axi_AWREADY),
    .axi_AWVALID(vssRvm_1_axi_AWVALID),
    .axi_AWADDR(vssRvm_1_axi_AWADDR),
    .axi_AWLEN(vssRvm_1_axi_AWLEN),
    .axi_WREADY(vssRvm_1_axi_WREADY),
    .axi_WVALID(vssRvm_1_axi_WVALID),
    .axi_WDATA(vssRvm_1_axi_WDATA),
    .axi_WLAST(vssRvm_1_axi_WLAST),
    .axi_BVALID(vssRvm_1_axi_BVALID)
  );
  readyValidMem_10 vssRvm_2 ( // @[stealSide.scala 87:68]
    .clock(vssRvm_2_clock),
    .reset(vssRvm_2_reset),
    .io_read_address_ready(vssRvm_2_io_read_address_ready),
    .io_read_address_valid(vssRvm_2_io_read_address_valid),
    .io_read_address_bits(vssRvm_2_io_read_address_bits),
    .io_read_data_ready(vssRvm_2_io_read_data_ready),
    .io_read_data_valid(vssRvm_2_io_read_data_valid),
    .io_read_data_bits(vssRvm_2_io_read_data_bits),
    .io_write_address_ready(vssRvm_2_io_write_address_ready),
    .io_write_address_valid(vssRvm_2_io_write_address_valid),
    .io_write_address_bits(vssRvm_2_io_write_address_bits),
    .io_write_data_ready(vssRvm_2_io_write_data_ready),
    .io_write_data_valid(vssRvm_2_io_write_data_valid),
    .io_write_data_bits(vssRvm_2_io_write_data_bits),
    .io_writeBurst_len(vssRvm_2_io_writeBurst_len),
    .io_writeBurst_last(vssRvm_2_io_writeBurst_last),
    .io_readBurst_len(vssRvm_2_io_readBurst_len),
    .axi_ARREADY(vssRvm_2_axi_ARREADY),
    .axi_ARVALID(vssRvm_2_axi_ARVALID),
    .axi_ARADDR(vssRvm_2_axi_ARADDR),
    .axi_ARLEN(vssRvm_2_axi_ARLEN),
    .axi_RREADY(vssRvm_2_axi_RREADY),
    .axi_RVALID(vssRvm_2_axi_RVALID),
    .axi_RDATA(vssRvm_2_axi_RDATA),
    .axi_AWREADY(vssRvm_2_axi_AWREADY),
    .axi_AWVALID(vssRvm_2_axi_AWVALID),
    .axi_AWADDR(vssRvm_2_axi_AWADDR),
    .axi_AWLEN(vssRvm_2_axi_AWLEN),
    .axi_WREADY(vssRvm_2_axi_WREADY),
    .axi_WVALID(vssRvm_2_axi_WVALID),
    .axi_WDATA(vssRvm_2_axi_WDATA),
    .axi_WLAST(vssRvm_2_axi_WLAST),
    .axi_BVALID(vssRvm_2_axi_BVALID)
  );
  readyValidMem_10 vssRvm_3 ( // @[stealSide.scala 87:68]
    .clock(vssRvm_3_clock),
    .reset(vssRvm_3_reset),
    .io_read_address_ready(vssRvm_3_io_read_address_ready),
    .io_read_address_valid(vssRvm_3_io_read_address_valid),
    .io_read_address_bits(vssRvm_3_io_read_address_bits),
    .io_read_data_ready(vssRvm_3_io_read_data_ready),
    .io_read_data_valid(vssRvm_3_io_read_data_valid),
    .io_read_data_bits(vssRvm_3_io_read_data_bits),
    .io_write_address_ready(vssRvm_3_io_write_address_ready),
    .io_write_address_valid(vssRvm_3_io_write_address_valid),
    .io_write_address_bits(vssRvm_3_io_write_address_bits),
    .io_write_data_ready(vssRvm_3_io_write_data_ready),
    .io_write_data_valid(vssRvm_3_io_write_data_valid),
    .io_write_data_bits(vssRvm_3_io_write_data_bits),
    .io_writeBurst_len(vssRvm_3_io_writeBurst_len),
    .io_writeBurst_last(vssRvm_3_io_writeBurst_last),
    .io_readBurst_len(vssRvm_3_io_readBurst_len),
    .axi_ARREADY(vssRvm_3_axi_ARREADY),
    .axi_ARVALID(vssRvm_3_axi_ARVALID),
    .axi_ARADDR(vssRvm_3_axi_ARADDR),
    .axi_ARLEN(vssRvm_3_axi_ARLEN),
    .axi_RREADY(vssRvm_3_axi_RREADY),
    .axi_RVALID(vssRvm_3_axi_RVALID),
    .axi_RDATA(vssRvm_3_axi_RDATA),
    .axi_AWREADY(vssRvm_3_axi_AWREADY),
    .axi_AWVALID(vssRvm_3_axi_AWVALID),
    .axi_AWADDR(vssRvm_3_axi_AWADDR),
    .axi_AWLEN(vssRvm_3_axi_AWLEN),
    .axi_WREADY(vssRvm_3_axi_WREADY),
    .axi_WVALID(vssRvm_3_axi_WVALID),
    .axi_WDATA(vssRvm_3_axi_WDATA),
    .axi_WLAST(vssRvm_3_axi_WLAST),
    .axi_BVALID(vssRvm_3_axi_BVALID)
  );
  assign io_axi_mgmt_vss_0_ARREADY = virtualStealServers_0_io_axi_mgmt_ARREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_RVALID = virtualStealServers_0_io_axi_mgmt_RVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_RDATA = virtualStealServers_0_io_axi_mgmt_RDATA; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_AWREADY = virtualStealServers_0_io_axi_mgmt_AWREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_WREADY = virtualStealServers_0_io_axi_mgmt_WREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_0_BVALID = virtualStealServers_0_io_axi_mgmt_BVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_1_ARREADY = virtualStealServers_1_io_axi_mgmt_ARREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_1_RVALID = virtualStealServers_1_io_axi_mgmt_RVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_1_RDATA = virtualStealServers_1_io_axi_mgmt_RDATA; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_1_AWREADY = virtualStealServers_1_io_axi_mgmt_AWREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_1_WREADY = virtualStealServers_1_io_axi_mgmt_WREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_1_BVALID = virtualStealServers_1_io_axi_mgmt_BVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_2_ARREADY = virtualStealServers_2_io_axi_mgmt_ARREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_2_RVALID = virtualStealServers_2_io_axi_mgmt_RVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_2_RDATA = virtualStealServers_2_io_axi_mgmt_RDATA; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_2_AWREADY = virtualStealServers_2_io_axi_mgmt_AWREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_2_WREADY = virtualStealServers_2_io_axi_mgmt_WREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_2_BVALID = virtualStealServers_2_io_axi_mgmt_BVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_3_ARREADY = virtualStealServers_3_io_axi_mgmt_ARREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_3_RVALID = virtualStealServers_3_io_axi_mgmt_RVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_3_RDATA = virtualStealServers_3_io_axi_mgmt_RDATA; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_3_AWREADY = virtualStealServers_3_io_axi_mgmt_AWREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_3_WREADY = virtualStealServers_3_io_axi_mgmt_WREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_3_BVALID = virtualStealServers_3_io_axi_mgmt_BVALID; // @[stealSide.scala 83:28]
  assign io_vss_axi_full_0_ARVALID = vssRvm_0_axi_ARVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_ARADDR = vssRvm_0_axi_ARADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_ARLEN = vssRvm_0_axi_ARLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_RREADY = vssRvm_0_axi_RREADY; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_AWVALID = vssRvm_0_axi_AWVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_AWADDR = vssRvm_0_axi_AWADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_AWLEN = vssRvm_0_axi_AWLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_WVALID = vssRvm_0_axi_WVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_WDATA = vssRvm_0_axi_WDATA; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_0_WLAST = vssRvm_0_axi_WLAST; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_ARVALID = vssRvm_1_axi_ARVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_ARADDR = vssRvm_1_axi_ARADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_ARLEN = vssRvm_1_axi_ARLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_RREADY = vssRvm_1_axi_RREADY; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_AWVALID = vssRvm_1_axi_AWVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_AWADDR = vssRvm_1_axi_AWADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_AWLEN = vssRvm_1_axi_AWLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_WVALID = vssRvm_1_axi_WVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_WDATA = vssRvm_1_axi_WDATA; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_1_WLAST = vssRvm_1_axi_WLAST; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_ARVALID = vssRvm_2_axi_ARVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_ARADDR = vssRvm_2_axi_ARADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_ARLEN = vssRvm_2_axi_ARLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_RREADY = vssRvm_2_axi_RREADY; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_AWVALID = vssRvm_2_axi_AWVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_AWADDR = vssRvm_2_axi_AWADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_AWLEN = vssRvm_2_axi_AWLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_WVALID = vssRvm_2_axi_WVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_WDATA = vssRvm_2_axi_WDATA; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_2_WLAST = vssRvm_2_axi_WLAST; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_ARVALID = vssRvm_3_axi_ARVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_ARADDR = vssRvm_3_axi_ARADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_ARLEN = vssRvm_3_axi_ARLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_RREADY = vssRvm_3_axi_RREADY; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_AWVALID = vssRvm_3_axi_AWVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_AWADDR = vssRvm_3_axi_AWADDR; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_AWLEN = vssRvm_3_axi_AWLEN; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_WVALID = vssRvm_3_axi_WVALID; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_WDATA = vssRvm_3_axi_WDATA; // @[stealSide.scala 98:47]
  assign io_vss_axi_full_3_WLAST = vssRvm_3_axi_WLAST; // @[stealSide.scala 98:47]
  assign io_taskOut_0_TVALID = stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_0_TDATA = stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 103:39]
  assign io_taskOut_1_TVALID = stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_1_TDATA = stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 103:39]
  assign io_taskOut_2_TVALID = stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_2_TDATA = stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 103:39]
  assign io_taskOut_3_TVALID = stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 103:39]
  assign io_taskOut_3_TDATA = stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 103:39]
  assign io_taskIn_0_TREADY = stealNW_TQ_io_connPE_0_push_ready; // @[stealSide.scala 105:43]
  assign io_taskIn_1_TREADY = stealNW_TQ_io_connPE_1_push_ready; // @[stealSide.scala 105:43]
  assign io_taskIn_2_TREADY = stealNW_TQ_io_connPE_2_push_ready; // @[stealSide.scala 105:43]
  assign io_taskIn_3_TREADY = stealNW_TQ_io_connPE_3_push_ready; // @[stealSide.scala 105:43]
  assign stealNW_TQ_clock = clock;
  assign stealNW_TQ_reset = reset;
  assign stealNW_TQ_io_connPE_0_push_valid = io_taskIn_0_TVALID; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_0_push_bits = io_taskIn_0_TDATA; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_0_pop_ready = io_taskOut_0_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connPE_1_push_valid = io_taskIn_1_TVALID; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_1_push_bits = io_taskIn_1_TDATA; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_1_pop_ready = io_taskOut_1_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connPE_2_push_valid = io_taskIn_2_TVALID; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_2_push_bits = io_taskIn_2_TDATA; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_2_pop_ready = io_taskOut_2_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connPE_3_push_valid = io_taskIn_3_TVALID; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_3_push_bits = io_taskIn_3_TDATA; // @[stealSide.scala 105:43]
  assign stealNW_TQ_io_connPE_3_pop_ready = io_taskOut_3_TREADY; // @[stealSide.scala 103:39]
  assign stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid =
    virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_0_data_availableTask_ready =
    virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_valid = virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_bits = virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_valid =
    virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_1_data_availableTask_ready =
    virtualStealServers_1_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_1_data_qOutTask_valid = virtualStealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_1_data_qOutTask_bits = virtualStealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_valid =
    virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_2_data_availableTask_ready =
    virtualStealServers_2_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_2_data_qOutTask_valid = virtualStealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_2_data_qOutTask_bits = virtualStealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_valid =
    virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_3_data_availableTask_ready =
    virtualStealServers_3_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_3_data_qOutTask_valid = virtualStealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 99:47]
  assign stealNW_TQ_io_connVSS_3_data_qOutTask_bits = virtualStealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_clock = clock;
  assign virtualStealServers_0_reset = reset;
  assign virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_0_io_axi_mgmt_ARVALID = io_axi_mgmt_vss_0_ARVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_ARADDR = io_axi_mgmt_vss_0_ARADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_RREADY = io_axi_mgmt_vss_0_RREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_AWVALID = io_axi_mgmt_vss_0_AWVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_AWADDR = io_axi_mgmt_vss_0_AWADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_WVALID = io_axi_mgmt_vss_0_WVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_WDATA = io_axi_mgmt_vss_0_WDATA; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_WSTRB = io_axi_mgmt_vss_0_WSTRB; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_axi_mgmt_BREADY = io_axi_mgmt_vss_0_BREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_0_io_read_address_ready = vssRvm_0_io_read_address_ready; // @[stealSide.scala 91:47]
  assign virtualStealServers_0_io_read_data_valid = vssRvm_0_io_read_data_valid; // @[stealSide.scala 92:47]
  assign virtualStealServers_0_io_read_data_bits = vssRvm_0_io_read_data_bits; // @[stealSide.scala 92:47]
  assign virtualStealServers_0_io_write_address_ready = vssRvm_0_io_write_address_ready; // @[stealSide.scala 93:47]
  assign virtualStealServers_0_io_write_data_ready = vssRvm_0_io_write_data_ready; // @[stealSide.scala 94:47]
  assign virtualStealServers_0_io_ntwDataUnitOccupancy = stealNW_TQ_io_ntwDataUnitOccupancyVSS_0; // @[stealSide.scala 84:56]
  assign virtualStealServers_1_clock = clock;
  assign virtualStealServers_1_reset = reset;
  assign virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_1_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_1_data_availableTask_valid; // @[stealSide.scala 99:47]
  assign virtualStealServers_1_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_1_data_availableTask_bits; // @[stealSide.scala 99:47]
  assign virtualStealServers_1_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_1_data_qOutTask_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_1_io_axi_mgmt_ARVALID = io_axi_mgmt_vss_1_ARVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_ARADDR = io_axi_mgmt_vss_1_ARADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_RREADY = io_axi_mgmt_vss_1_RREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_AWVALID = io_axi_mgmt_vss_1_AWVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_AWADDR = io_axi_mgmt_vss_1_AWADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_WVALID = io_axi_mgmt_vss_1_WVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_WDATA = io_axi_mgmt_vss_1_WDATA; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_WSTRB = io_axi_mgmt_vss_1_WSTRB; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_axi_mgmt_BREADY = io_axi_mgmt_vss_1_BREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_1_io_read_address_ready = vssRvm_1_io_read_address_ready; // @[stealSide.scala 91:47]
  assign virtualStealServers_1_io_read_data_valid = vssRvm_1_io_read_data_valid; // @[stealSide.scala 92:47]
  assign virtualStealServers_1_io_read_data_bits = vssRvm_1_io_read_data_bits; // @[stealSide.scala 92:47]
  assign virtualStealServers_1_io_write_address_ready = vssRvm_1_io_write_address_ready; // @[stealSide.scala 93:47]
  assign virtualStealServers_1_io_write_data_ready = vssRvm_1_io_write_data_ready; // @[stealSide.scala 94:47]
  assign virtualStealServers_1_io_ntwDataUnitOccupancy = stealNW_TQ_io_ntwDataUnitOccupancyVSS_1; // @[stealSide.scala 84:56]
  assign virtualStealServers_2_clock = clock;
  assign virtualStealServers_2_reset = reset;
  assign virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_2_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_2_data_availableTask_valid; // @[stealSide.scala 99:47]
  assign virtualStealServers_2_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_2_data_availableTask_bits; // @[stealSide.scala 99:47]
  assign virtualStealServers_2_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_2_data_qOutTask_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_2_io_axi_mgmt_ARVALID = io_axi_mgmt_vss_2_ARVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_ARADDR = io_axi_mgmt_vss_2_ARADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_RREADY = io_axi_mgmt_vss_2_RREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_AWVALID = io_axi_mgmt_vss_2_AWVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_AWADDR = io_axi_mgmt_vss_2_AWADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_WVALID = io_axi_mgmt_vss_2_WVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_WDATA = io_axi_mgmt_vss_2_WDATA; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_WSTRB = io_axi_mgmt_vss_2_WSTRB; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_axi_mgmt_BREADY = io_axi_mgmt_vss_2_BREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_2_io_read_address_ready = vssRvm_2_io_read_address_ready; // @[stealSide.scala 91:47]
  assign virtualStealServers_2_io_read_data_valid = vssRvm_2_io_read_data_valid; // @[stealSide.scala 92:47]
  assign virtualStealServers_2_io_read_data_bits = vssRvm_2_io_read_data_bits; // @[stealSide.scala 92:47]
  assign virtualStealServers_2_io_write_address_ready = vssRvm_2_io_write_address_ready; // @[stealSide.scala 93:47]
  assign virtualStealServers_2_io_write_data_ready = vssRvm_2_io_write_data_ready; // @[stealSide.scala 94:47]
  assign virtualStealServers_2_io_ntwDataUnitOccupancy = stealNW_TQ_io_ntwDataUnitOccupancyVSS_2; // @[stealSide.scala 84:56]
  assign virtualStealServers_3_clock = clock;
  assign virtualStealServers_3_reset = reset;
  assign virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_3_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_3_data_availableTask_valid; // @[stealSide.scala 99:47]
  assign virtualStealServers_3_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_3_data_availableTask_bits; // @[stealSide.scala 99:47]
  assign virtualStealServers_3_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_3_data_qOutTask_ready; // @[stealSide.scala 99:47]
  assign virtualStealServers_3_io_axi_mgmt_ARVALID = io_axi_mgmt_vss_3_ARVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_ARADDR = io_axi_mgmt_vss_3_ARADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_RREADY = io_axi_mgmt_vss_3_RREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_AWVALID = io_axi_mgmt_vss_3_AWVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_AWADDR = io_axi_mgmt_vss_3_AWADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_WVALID = io_axi_mgmt_vss_3_WVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_WDATA = io_axi_mgmt_vss_3_WDATA; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_WSTRB = io_axi_mgmt_vss_3_WSTRB; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_axi_mgmt_BREADY = io_axi_mgmt_vss_3_BREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_3_io_read_address_ready = vssRvm_3_io_read_address_ready; // @[stealSide.scala 91:47]
  assign virtualStealServers_3_io_read_data_valid = vssRvm_3_io_read_data_valid; // @[stealSide.scala 92:47]
  assign virtualStealServers_3_io_read_data_bits = vssRvm_3_io_read_data_bits; // @[stealSide.scala 92:47]
  assign virtualStealServers_3_io_write_address_ready = vssRvm_3_io_write_address_ready; // @[stealSide.scala 93:47]
  assign virtualStealServers_3_io_write_data_ready = vssRvm_3_io_write_data_ready; // @[stealSide.scala 94:47]
  assign virtualStealServers_3_io_ntwDataUnitOccupancy = stealNW_TQ_io_ntwDataUnitOccupancyVSS_3; // @[stealSide.scala 84:56]
  assign vssRvm_0_clock = clock;
  assign vssRvm_0_reset = reset;
  assign vssRvm_0_io_read_address_valid = virtualStealServers_0_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_0_io_read_address_bits = virtualStealServers_0_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_0_io_read_data_ready = virtualStealServers_0_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_0_io_write_address_valid = virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_0_io_write_address_bits = virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_0_io_write_data_valid = virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_0_io_write_data_bits = virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_0_io_writeBurst_len = virtualStealServers_0_io_write_burst_len; // @[stealSide.scala 96:47]
  assign vssRvm_0_io_writeBurst_last = virtualStealServers_0_io_write_last; // @[stealSide.scala 97:47]
  assign vssRvm_0_io_readBurst_len = virtualStealServers_0_io_read_burst_len; // @[stealSide.scala 95:47]
  assign vssRvm_0_axi_ARREADY = io_vss_axi_full_0_ARREADY; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_RVALID = io_vss_axi_full_0_RVALID; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_RDATA = io_vss_axi_full_0_RDATA; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_AWREADY = io_vss_axi_full_0_AWREADY; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_WREADY = io_vss_axi_full_0_WREADY; // @[stealSide.scala 98:47]
  assign vssRvm_0_axi_BVALID = io_vss_axi_full_0_BVALID; // @[stealSide.scala 98:47]
  assign vssRvm_1_clock = clock;
  assign vssRvm_1_reset = reset;
  assign vssRvm_1_io_read_address_valid = virtualStealServers_1_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_1_io_read_address_bits = virtualStealServers_1_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_1_io_read_data_ready = virtualStealServers_1_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_1_io_write_address_valid = virtualStealServers_1_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_1_io_write_address_bits = virtualStealServers_1_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_1_io_write_data_valid = virtualStealServers_1_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_1_io_write_data_bits = virtualStealServers_1_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_1_io_writeBurst_len = virtualStealServers_1_io_write_burst_len; // @[stealSide.scala 96:47]
  assign vssRvm_1_io_writeBurst_last = virtualStealServers_1_io_write_last; // @[stealSide.scala 97:47]
  assign vssRvm_1_io_readBurst_len = virtualStealServers_1_io_read_burst_len; // @[stealSide.scala 95:47]
  assign vssRvm_1_axi_ARREADY = io_vss_axi_full_1_ARREADY; // @[stealSide.scala 98:47]
  assign vssRvm_1_axi_RVALID = io_vss_axi_full_1_RVALID; // @[stealSide.scala 98:47]
  assign vssRvm_1_axi_RDATA = io_vss_axi_full_1_RDATA; // @[stealSide.scala 98:47]
  assign vssRvm_1_axi_AWREADY = io_vss_axi_full_1_AWREADY; // @[stealSide.scala 98:47]
  assign vssRvm_1_axi_WREADY = io_vss_axi_full_1_WREADY; // @[stealSide.scala 98:47]
  assign vssRvm_1_axi_BVALID = io_vss_axi_full_1_BVALID; // @[stealSide.scala 98:47]
  assign vssRvm_2_clock = clock;
  assign vssRvm_2_reset = reset;
  assign vssRvm_2_io_read_address_valid = virtualStealServers_2_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_2_io_read_address_bits = virtualStealServers_2_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_2_io_read_data_ready = virtualStealServers_2_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_2_io_write_address_valid = virtualStealServers_2_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_2_io_write_address_bits = virtualStealServers_2_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_2_io_write_data_valid = virtualStealServers_2_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_2_io_write_data_bits = virtualStealServers_2_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_2_io_writeBurst_len = virtualStealServers_2_io_write_burst_len; // @[stealSide.scala 96:47]
  assign vssRvm_2_io_writeBurst_last = virtualStealServers_2_io_write_last; // @[stealSide.scala 97:47]
  assign vssRvm_2_io_readBurst_len = virtualStealServers_2_io_read_burst_len; // @[stealSide.scala 95:47]
  assign vssRvm_2_axi_ARREADY = io_vss_axi_full_2_ARREADY; // @[stealSide.scala 98:47]
  assign vssRvm_2_axi_RVALID = io_vss_axi_full_2_RVALID; // @[stealSide.scala 98:47]
  assign vssRvm_2_axi_RDATA = io_vss_axi_full_2_RDATA; // @[stealSide.scala 98:47]
  assign vssRvm_2_axi_AWREADY = io_vss_axi_full_2_AWREADY; // @[stealSide.scala 98:47]
  assign vssRvm_2_axi_WREADY = io_vss_axi_full_2_WREADY; // @[stealSide.scala 98:47]
  assign vssRvm_2_axi_BVALID = io_vss_axi_full_2_BVALID; // @[stealSide.scala 98:47]
  assign vssRvm_3_clock = clock;
  assign vssRvm_3_reset = reset;
  assign vssRvm_3_io_read_address_valid = virtualStealServers_3_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_3_io_read_address_bits = virtualStealServers_3_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_3_io_read_data_ready = virtualStealServers_3_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_3_io_write_address_valid = virtualStealServers_3_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_3_io_write_address_bits = virtualStealServers_3_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_3_io_write_data_valid = virtualStealServers_3_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_3_io_write_data_bits = virtualStealServers_3_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_3_io_writeBurst_len = virtualStealServers_3_io_write_burst_len; // @[stealSide.scala 96:47]
  assign vssRvm_3_io_writeBurst_last = virtualStealServers_3_io_write_last; // @[stealSide.scala 97:47]
  assign vssRvm_3_io_readBurst_len = virtualStealServers_3_io_read_burst_len; // @[stealSide.scala 95:47]
  assign vssRvm_3_axi_ARREADY = io_vss_axi_full_3_ARREADY; // @[stealSide.scala 98:47]
  assign vssRvm_3_axi_RVALID = io_vss_axi_full_3_RVALID; // @[stealSide.scala 98:47]
  assign vssRvm_3_axi_RDATA = io_vss_axi_full_3_RDATA; // @[stealSide.scala 98:47]
  assign vssRvm_3_axi_AWREADY = io_vss_axi_full_3_AWREADY; // @[stealSide.scala 98:47]
  assign vssRvm_3_axi_WREADY = io_vss_axi_full_3_WREADY; // @[stealSide.scala 98:47]
  assign vssRvm_3_axi_BVALID = io_vss_axi_full_3_BVALID; // @[stealSide.scala 98:47]
endmodule
module fibonacci__peCountFib_4__peCountSum_4(
  input          clock,
  input          reset,
  output         sum_stealSide_axi_mgmt_vss_0_ARREADY,
  input          sum_stealSide_axi_mgmt_vss_0_ARVALID,
  input  [5:0]   sum_stealSide_axi_mgmt_vss_0_ARADDR,
  input  [2:0]   sum_stealSide_axi_mgmt_vss_0_ARPROT,
  input          sum_stealSide_axi_mgmt_vss_0_RREADY,
  output         sum_stealSide_axi_mgmt_vss_0_RVALID,
  output [63:0]  sum_stealSide_axi_mgmt_vss_0_RDATA,
  output [1:0]   sum_stealSide_axi_mgmt_vss_0_RRESP,
  output         sum_stealSide_axi_mgmt_vss_0_AWREADY,
  input          sum_stealSide_axi_mgmt_vss_0_AWVALID,
  input  [5:0]   sum_stealSide_axi_mgmt_vss_0_AWADDR,
  input  [2:0]   sum_stealSide_axi_mgmt_vss_0_AWPROT,
  output         sum_stealSide_axi_mgmt_vss_0_WREADY,
  input          sum_stealSide_axi_mgmt_vss_0_WVALID,
  input  [63:0]  sum_stealSide_axi_mgmt_vss_0_WDATA,
  input  [7:0]   sum_stealSide_axi_mgmt_vss_0_WSTRB,
  input          sum_stealSide_axi_mgmt_vss_0_BREADY,
  output         sum_stealSide_axi_mgmt_vss_0_BVALID,
  output [1:0]   sum_stealSide_axi_mgmt_vss_0_BRESP,
  input          sum_stealSide_vss_axi_full_0_ARREADY,
  output         sum_stealSide_vss_axi_full_0_ARVALID,
  output [3:0]   sum_stealSide_vss_axi_full_0_ARID,
  output [63:0]  sum_stealSide_vss_axi_full_0_ARADDR,
  output [7:0]   sum_stealSide_vss_axi_full_0_ARLEN,
  output [2:0]   sum_stealSide_vss_axi_full_0_ARSIZE,
  output [1:0]   sum_stealSide_vss_axi_full_0_ARBURST,
  output         sum_stealSide_vss_axi_full_0_ARLOCK,
  output [3:0]   sum_stealSide_vss_axi_full_0_ARCACHE,
  output [2:0]   sum_stealSide_vss_axi_full_0_ARPROT,
  output [3:0]   sum_stealSide_vss_axi_full_0_ARQOS,
  output [3:0]   sum_stealSide_vss_axi_full_0_ARREGION,
  output         sum_stealSide_vss_axi_full_0_RREADY,
  input          sum_stealSide_vss_axi_full_0_RVALID,
  input  [3:0]   sum_stealSide_vss_axi_full_0_RID,
  input  [255:0] sum_stealSide_vss_axi_full_0_RDATA,
  input  [1:0]   sum_stealSide_vss_axi_full_0_RRESP,
  input          sum_stealSide_vss_axi_full_0_RLAST,
  input          sum_stealSide_vss_axi_full_0_AWREADY,
  output         sum_stealSide_vss_axi_full_0_AWVALID,
  output [3:0]   sum_stealSide_vss_axi_full_0_AWID,
  output [63:0]  sum_stealSide_vss_axi_full_0_AWADDR,
  output [7:0]   sum_stealSide_vss_axi_full_0_AWLEN,
  output [2:0]   sum_stealSide_vss_axi_full_0_AWSIZE,
  output [1:0]   sum_stealSide_vss_axi_full_0_AWBURST,
  output         sum_stealSide_vss_axi_full_0_AWLOCK,
  output [3:0]   sum_stealSide_vss_axi_full_0_AWCACHE,
  output [2:0]   sum_stealSide_vss_axi_full_0_AWPROT,
  output [3:0]   sum_stealSide_vss_axi_full_0_AWQOS,
  output [3:0]   sum_stealSide_vss_axi_full_0_AWREGION,
  input          sum_stealSide_vss_axi_full_0_WREADY,
  output         sum_stealSide_vss_axi_full_0_WVALID,
  output [3:0]   sum_stealSide_vss_axi_full_0_WID,
  output [255:0] sum_stealSide_vss_axi_full_0_WDATA,
  output [31:0]  sum_stealSide_vss_axi_full_0_WSTRB,
  output         sum_stealSide_vss_axi_full_0_WLAST,
  output         sum_stealSide_vss_axi_full_0_BREADY,
  input          sum_stealSide_vss_axi_full_0_BVALID,
  input  [3:0]   sum_stealSide_vss_axi_full_0_BID,
  input  [1:0]   sum_stealSide_vss_axi_full_0_BRESP,
  input          sum_stealSide_taskOut_0_TREADY,
  output         sum_stealSide_taskOut_0_TVALID,
  output [255:0] sum_stealSide_taskOut_0_TDATA,
  input          sum_stealSide_taskOut_1_TREADY,
  output         sum_stealSide_taskOut_1_TVALID,
  output [255:0] sum_stealSide_taskOut_1_TDATA,
  input          sum_stealSide_taskOut_2_TREADY,
  output         sum_stealSide_taskOut_2_TVALID,
  output [255:0] sum_stealSide_taskOut_2_TDATA,
  input          sum_stealSide_taskOut_3_TREADY,
  output         sum_stealSide_taskOut_3_TVALID,
  output [255:0] sum_stealSide_taskOut_3_TDATA,
  input          sum_continuationAllocationSide_contOut_0_TREADY,
  output         sum_continuationAllocationSide_contOut_0_TVALID,
  output [63:0]  sum_continuationAllocationSide_contOut_0_TDATA,
  input          sum_continuationAllocationSide_contOut_1_TREADY,
  output         sum_continuationAllocationSide_contOut_1_TVALID,
  output [63:0]  sum_continuationAllocationSide_contOut_1_TDATA,
  input          sum_continuationAllocationSide_contOut_2_TREADY,
  output         sum_continuationAllocationSide_contOut_2_TVALID,
  output [63:0]  sum_continuationAllocationSide_contOut_2_TDATA,
  input          sum_continuationAllocationSide_contOut_3_TREADY,
  output         sum_continuationAllocationSide_contOut_3_TVALID,
  output [63:0]  sum_continuationAllocationSide_contOut_3_TDATA,
  output         sum_continuationAllocationSide_axi_mgmt_vcas_ARREADY,
  input          sum_continuationAllocationSide_axi_mgmt_vcas_ARVALID,
  input  [5:0]   sum_continuationAllocationSide_axi_mgmt_vcas_ARADDR,
  input  [2:0]   sum_continuationAllocationSide_axi_mgmt_vcas_ARPROT,
  input          sum_continuationAllocationSide_axi_mgmt_vcas_RREADY,
  output         sum_continuationAllocationSide_axi_mgmt_vcas_RVALID,
  output [63:0]  sum_continuationAllocationSide_axi_mgmt_vcas_RDATA,
  output [1:0]   sum_continuationAllocationSide_axi_mgmt_vcas_RRESP,
  output         sum_continuationAllocationSide_axi_mgmt_vcas_AWREADY,
  input          sum_continuationAllocationSide_axi_mgmt_vcas_AWVALID,
  input  [5:0]   sum_continuationAllocationSide_axi_mgmt_vcas_AWADDR,
  input  [2:0]   sum_continuationAllocationSide_axi_mgmt_vcas_AWPROT,
  output         sum_continuationAllocationSide_axi_mgmt_vcas_WREADY,
  input          sum_continuationAllocationSide_axi_mgmt_vcas_WVALID,
  input  [63:0]  sum_continuationAllocationSide_axi_mgmt_vcas_WDATA,
  input  [7:0]   sum_continuationAllocationSide_axi_mgmt_vcas_WSTRB,
  input          sum_continuationAllocationSide_axi_mgmt_vcas_BREADY,
  output         sum_continuationAllocationSide_axi_mgmt_vcas_BVALID,
  output [1:0]   sum_continuationAllocationSide_axi_mgmt_vcas_BRESP,
  input          sum_continuationAllocationSide_vcas_axi_full_ARREADY,
  output         sum_continuationAllocationSide_vcas_axi_full_ARVALID,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_ARID,
  output [63:0]  sum_continuationAllocationSide_vcas_axi_full_ARADDR,
  output [7:0]   sum_continuationAllocationSide_vcas_axi_full_ARLEN,
  output [2:0]   sum_continuationAllocationSide_vcas_axi_full_ARSIZE,
  output [1:0]   sum_continuationAllocationSide_vcas_axi_full_ARBURST,
  output         sum_continuationAllocationSide_vcas_axi_full_ARLOCK,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_ARCACHE,
  output [2:0]   sum_continuationAllocationSide_vcas_axi_full_ARPROT,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_ARQOS,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_ARREGION,
  output         sum_continuationAllocationSide_vcas_axi_full_RREADY,
  input          sum_continuationAllocationSide_vcas_axi_full_RVALID,
  input  [3:0]   sum_continuationAllocationSide_vcas_axi_full_RID,
  input  [63:0]  sum_continuationAllocationSide_vcas_axi_full_RDATA,
  input  [1:0]   sum_continuationAllocationSide_vcas_axi_full_RRESP,
  input          sum_continuationAllocationSide_vcas_axi_full_RLAST,
  input          sum_continuationAllocationSide_vcas_axi_full_AWREADY,
  output         sum_continuationAllocationSide_vcas_axi_full_AWVALID,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_AWID,
  output [63:0]  sum_continuationAllocationSide_vcas_axi_full_AWADDR,
  output [7:0]   sum_continuationAllocationSide_vcas_axi_full_AWLEN,
  output [2:0]   sum_continuationAllocationSide_vcas_axi_full_AWSIZE,
  output [1:0]   sum_continuationAllocationSide_vcas_axi_full_AWBURST,
  output         sum_continuationAllocationSide_vcas_axi_full_AWLOCK,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_AWCACHE,
  output [2:0]   sum_continuationAllocationSide_vcas_axi_full_AWPROT,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_AWQOS,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_AWREGION,
  input          sum_continuationAllocationSide_vcas_axi_full_WREADY,
  output         sum_continuationAllocationSide_vcas_axi_full_WVALID,
  output [3:0]   sum_continuationAllocationSide_vcas_axi_full_WID,
  output [63:0]  sum_continuationAllocationSide_vcas_axi_full_WDATA,
  output [7:0]   sum_continuationAllocationSide_vcas_axi_full_WSTRB,
  output         sum_continuationAllocationSide_vcas_axi_full_WLAST,
  output         sum_continuationAllocationSide_vcas_axi_full_BREADY,
  input          sum_continuationAllocationSide_vcas_axi_full_BVALID,
  input  [3:0]   sum_continuationAllocationSide_vcas_axi_full_BID,
  input  [1:0]   sum_continuationAllocationSide_vcas_axi_full_BRESP,
  output         sum_syncSide_addrIn_0_TREADY,
  input          sum_syncSide_addrIn_0_TVALID,
  input  [63:0]  sum_syncSide_addrIn_0_TDATA,
  output         sum_syncSide_addrIn_1_TREADY,
  input          sum_syncSide_addrIn_1_TVALID,
  input  [63:0]  sum_syncSide_addrIn_1_TDATA,
  output         sum_syncSide_addrIn_2_TREADY,
  input          sum_syncSide_addrIn_2_TVALID,
  input  [63:0]  sum_syncSide_addrIn_2_TDATA,
  output         sum_syncSide_addrIn_3_TREADY,
  input          sum_syncSide_addrIn_3_TVALID,
  input  [63:0]  sum_syncSide_addrIn_3_TDATA,
  output         sum_syncSide_addrIn_4_TREADY,
  input          sum_syncSide_addrIn_4_TVALID,
  input  [63:0]  sum_syncSide_addrIn_4_TDATA,
  output         sum_syncSide_addrIn_5_TREADY,
  input          sum_syncSide_addrIn_5_TVALID,
  input  [63:0]  sum_syncSide_addrIn_5_TDATA,
  output         sum_syncSide_addrIn_6_TREADY,
  input          sum_syncSide_addrIn_6_TVALID,
  input  [63:0]  sum_syncSide_addrIn_6_TDATA,
  output         sum_syncSide_addrIn_7_TREADY,
  input          sum_syncSide_addrIn_7_TVALID,
  input  [63:0]  sum_syncSide_addrIn_7_TDATA,
  input          sum_syncSide_axi_full_argRoute_0_ARREADY,
  output         sum_syncSide_axi_full_argRoute_0_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_0_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_0_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_0_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_0_ARBURST,
  output         sum_syncSide_axi_full_argRoute_0_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_0_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_ARREGION,
  output         sum_syncSide_axi_full_argRoute_0_RREADY,
  input          sum_syncSide_axi_full_argRoute_0_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_0_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_0_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_0_RRESP,
  input          sum_syncSide_axi_full_argRoute_0_RLAST,
  input          sum_syncSide_axi_full_argRoute_0_AWREADY,
  output         sum_syncSide_axi_full_argRoute_0_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_0_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_0_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_0_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_0_AWBURST,
  output         sum_syncSide_axi_full_argRoute_0_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_0_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_AWREGION,
  input          sum_syncSide_axi_full_argRoute_0_WREADY,
  output         sum_syncSide_axi_full_argRoute_0_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_0_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_0_WSTRB,
  output         sum_syncSide_axi_full_argRoute_0_WLAST,
  output         sum_syncSide_axi_full_argRoute_0_BREADY,
  input          sum_syncSide_axi_full_argRoute_0_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_0_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_0_BRESP,
  input          sum_syncSide_axi_full_argRoute_1_ARREADY,
  output         sum_syncSide_axi_full_argRoute_1_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_1_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_1_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_1_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_1_ARBURST,
  output         sum_syncSide_axi_full_argRoute_1_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_1_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_ARREGION,
  output         sum_syncSide_axi_full_argRoute_1_RREADY,
  input          sum_syncSide_axi_full_argRoute_1_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_1_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_1_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_1_RRESP,
  input          sum_syncSide_axi_full_argRoute_1_RLAST,
  input          sum_syncSide_axi_full_argRoute_1_AWREADY,
  output         sum_syncSide_axi_full_argRoute_1_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_1_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_1_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_1_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_1_AWBURST,
  output         sum_syncSide_axi_full_argRoute_1_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_1_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_AWREGION,
  input          sum_syncSide_axi_full_argRoute_1_WREADY,
  output         sum_syncSide_axi_full_argRoute_1_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_1_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_1_WSTRB,
  output         sum_syncSide_axi_full_argRoute_1_WLAST,
  output         sum_syncSide_axi_full_argRoute_1_BREADY,
  input          sum_syncSide_axi_full_argRoute_1_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_1_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_1_BRESP,
  input          sum_syncSide_axi_full_argRoute_2_ARREADY,
  output         sum_syncSide_axi_full_argRoute_2_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_2_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_2_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_2_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_2_ARBURST,
  output         sum_syncSide_axi_full_argRoute_2_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_2_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_ARREGION,
  output         sum_syncSide_axi_full_argRoute_2_RREADY,
  input          sum_syncSide_axi_full_argRoute_2_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_2_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_2_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_2_RRESP,
  input          sum_syncSide_axi_full_argRoute_2_RLAST,
  input          sum_syncSide_axi_full_argRoute_2_AWREADY,
  output         sum_syncSide_axi_full_argRoute_2_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_2_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_2_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_2_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_2_AWBURST,
  output         sum_syncSide_axi_full_argRoute_2_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_2_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_AWREGION,
  input          sum_syncSide_axi_full_argRoute_2_WREADY,
  output         sum_syncSide_axi_full_argRoute_2_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_2_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_2_WSTRB,
  output         sum_syncSide_axi_full_argRoute_2_WLAST,
  output         sum_syncSide_axi_full_argRoute_2_BREADY,
  input          sum_syncSide_axi_full_argRoute_2_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_2_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_2_BRESP,
  input          sum_syncSide_axi_full_argRoute_3_ARREADY,
  output         sum_syncSide_axi_full_argRoute_3_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_3_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_3_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_3_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_3_ARBURST,
  output         sum_syncSide_axi_full_argRoute_3_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_3_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_ARREGION,
  output         sum_syncSide_axi_full_argRoute_3_RREADY,
  input          sum_syncSide_axi_full_argRoute_3_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_3_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_3_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_3_RRESP,
  input          sum_syncSide_axi_full_argRoute_3_RLAST,
  input          sum_syncSide_axi_full_argRoute_3_AWREADY,
  output         sum_syncSide_axi_full_argRoute_3_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_3_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_3_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_3_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_3_AWBURST,
  output         sum_syncSide_axi_full_argRoute_3_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_3_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_AWREGION,
  input          sum_syncSide_axi_full_argRoute_3_WREADY,
  output         sum_syncSide_axi_full_argRoute_3_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_3_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_3_WSTRB,
  output         sum_syncSide_axi_full_argRoute_3_WLAST,
  output         sum_syncSide_axi_full_argRoute_3_BREADY,
  input          sum_syncSide_axi_full_argRoute_3_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_3_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_3_BRESP,
  input          sum_syncSide_axi_full_argRoute_4_ARREADY,
  output         sum_syncSide_axi_full_argRoute_4_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_4_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_4_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_4_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_4_ARBURST,
  output         sum_syncSide_axi_full_argRoute_4_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_4_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_ARREGION,
  output         sum_syncSide_axi_full_argRoute_4_RREADY,
  input          sum_syncSide_axi_full_argRoute_4_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_4_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_4_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_4_RRESP,
  input          sum_syncSide_axi_full_argRoute_4_RLAST,
  input          sum_syncSide_axi_full_argRoute_4_AWREADY,
  output         sum_syncSide_axi_full_argRoute_4_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_4_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_4_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_4_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_4_AWBURST,
  output         sum_syncSide_axi_full_argRoute_4_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_4_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_AWREGION,
  input          sum_syncSide_axi_full_argRoute_4_WREADY,
  output         sum_syncSide_axi_full_argRoute_4_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_4_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_4_WSTRB,
  output         sum_syncSide_axi_full_argRoute_4_WLAST,
  output         sum_syncSide_axi_full_argRoute_4_BREADY,
  input          sum_syncSide_axi_full_argRoute_4_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_4_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_4_BRESP,
  input          sum_syncSide_axi_full_argRoute_5_ARREADY,
  output         sum_syncSide_axi_full_argRoute_5_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_5_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_5_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_5_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_5_ARBURST,
  output         sum_syncSide_axi_full_argRoute_5_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_5_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_ARREGION,
  output         sum_syncSide_axi_full_argRoute_5_RREADY,
  input          sum_syncSide_axi_full_argRoute_5_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_5_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_5_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_5_RRESP,
  input          sum_syncSide_axi_full_argRoute_5_RLAST,
  input          sum_syncSide_axi_full_argRoute_5_AWREADY,
  output         sum_syncSide_axi_full_argRoute_5_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_5_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_5_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_5_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_5_AWBURST,
  output         sum_syncSide_axi_full_argRoute_5_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_5_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_AWREGION,
  input          sum_syncSide_axi_full_argRoute_5_WREADY,
  output         sum_syncSide_axi_full_argRoute_5_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_5_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_5_WSTRB,
  output         sum_syncSide_axi_full_argRoute_5_WLAST,
  output         sum_syncSide_axi_full_argRoute_5_BREADY,
  input          sum_syncSide_axi_full_argRoute_5_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_5_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_5_BRESP,
  input          sum_syncSide_axi_full_argRoute_6_ARREADY,
  output         sum_syncSide_axi_full_argRoute_6_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_6_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_6_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_6_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_6_ARBURST,
  output         sum_syncSide_axi_full_argRoute_6_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_6_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_ARREGION,
  output         sum_syncSide_axi_full_argRoute_6_RREADY,
  input          sum_syncSide_axi_full_argRoute_6_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_6_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_6_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_6_RRESP,
  input          sum_syncSide_axi_full_argRoute_6_RLAST,
  input          sum_syncSide_axi_full_argRoute_6_AWREADY,
  output         sum_syncSide_axi_full_argRoute_6_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_6_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_6_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_6_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_6_AWBURST,
  output         sum_syncSide_axi_full_argRoute_6_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_6_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_AWREGION,
  input          sum_syncSide_axi_full_argRoute_6_WREADY,
  output         sum_syncSide_axi_full_argRoute_6_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_6_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_6_WSTRB,
  output         sum_syncSide_axi_full_argRoute_6_WLAST,
  output         sum_syncSide_axi_full_argRoute_6_BREADY,
  input          sum_syncSide_axi_full_argRoute_6_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_6_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_6_BRESP,
  input          sum_syncSide_axi_full_argRoute_7_ARREADY,
  output         sum_syncSide_axi_full_argRoute_7_ARVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_ARID,
  output [63:0]  sum_syncSide_axi_full_argRoute_7_ARADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_7_ARLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_7_ARSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_7_ARBURST,
  output         sum_syncSide_axi_full_argRoute_7_ARLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_ARCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_7_ARPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_ARQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_ARREGION,
  output         sum_syncSide_axi_full_argRoute_7_RREADY,
  input          sum_syncSide_axi_full_argRoute_7_RVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_7_RID,
  input  [31:0]  sum_syncSide_axi_full_argRoute_7_RDATA,
  input  [1:0]   sum_syncSide_axi_full_argRoute_7_RRESP,
  input          sum_syncSide_axi_full_argRoute_7_RLAST,
  input          sum_syncSide_axi_full_argRoute_7_AWREADY,
  output         sum_syncSide_axi_full_argRoute_7_AWVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_AWID,
  output [63:0]  sum_syncSide_axi_full_argRoute_7_AWADDR,
  output [7:0]   sum_syncSide_axi_full_argRoute_7_AWLEN,
  output [2:0]   sum_syncSide_axi_full_argRoute_7_AWSIZE,
  output [1:0]   sum_syncSide_axi_full_argRoute_7_AWBURST,
  output         sum_syncSide_axi_full_argRoute_7_AWLOCK,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_AWCACHE,
  output [2:0]   sum_syncSide_axi_full_argRoute_7_AWPROT,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_AWQOS,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_AWREGION,
  input          sum_syncSide_axi_full_argRoute_7_WREADY,
  output         sum_syncSide_axi_full_argRoute_7_WVALID,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_WID,
  output [31:0]  sum_syncSide_axi_full_argRoute_7_WDATA,
  output [3:0]   sum_syncSide_axi_full_argRoute_7_WSTRB,
  output         sum_syncSide_axi_full_argRoute_7_WLAST,
  output         sum_syncSide_axi_full_argRoute_7_BREADY,
  input          sum_syncSide_axi_full_argRoute_7_BVALID,
  input  [3:0]   sum_syncSide_axi_full_argRoute_7_BID,
  input  [1:0]   sum_syncSide_axi_full_argRoute_7_BRESP,
  output         fib_stealSide_axi_mgmt_vss_0_ARREADY,
  input          fib_stealSide_axi_mgmt_vss_0_ARVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_0_ARADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_0_ARPROT,
  input          fib_stealSide_axi_mgmt_vss_0_RREADY,
  output         fib_stealSide_axi_mgmt_vss_0_RVALID,
  output [63:0]  fib_stealSide_axi_mgmt_vss_0_RDATA,
  output [1:0]   fib_stealSide_axi_mgmt_vss_0_RRESP,
  output         fib_stealSide_axi_mgmt_vss_0_AWREADY,
  input          fib_stealSide_axi_mgmt_vss_0_AWVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_0_AWADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_0_AWPROT,
  output         fib_stealSide_axi_mgmt_vss_0_WREADY,
  input          fib_stealSide_axi_mgmt_vss_0_WVALID,
  input  [63:0]  fib_stealSide_axi_mgmt_vss_0_WDATA,
  input  [7:0]   fib_stealSide_axi_mgmt_vss_0_WSTRB,
  input          fib_stealSide_axi_mgmt_vss_0_BREADY,
  output         fib_stealSide_axi_mgmt_vss_0_BVALID,
  output [1:0]   fib_stealSide_axi_mgmt_vss_0_BRESP,
  output         fib_stealSide_axi_mgmt_vss_1_ARREADY,
  input          fib_stealSide_axi_mgmt_vss_1_ARVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_1_ARADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_1_ARPROT,
  input          fib_stealSide_axi_mgmt_vss_1_RREADY,
  output         fib_stealSide_axi_mgmt_vss_1_RVALID,
  output [63:0]  fib_stealSide_axi_mgmt_vss_1_RDATA,
  output [1:0]   fib_stealSide_axi_mgmt_vss_1_RRESP,
  output         fib_stealSide_axi_mgmt_vss_1_AWREADY,
  input          fib_stealSide_axi_mgmt_vss_1_AWVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_1_AWADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_1_AWPROT,
  output         fib_stealSide_axi_mgmt_vss_1_WREADY,
  input          fib_stealSide_axi_mgmt_vss_1_WVALID,
  input  [63:0]  fib_stealSide_axi_mgmt_vss_1_WDATA,
  input  [7:0]   fib_stealSide_axi_mgmt_vss_1_WSTRB,
  input          fib_stealSide_axi_mgmt_vss_1_BREADY,
  output         fib_stealSide_axi_mgmt_vss_1_BVALID,
  output [1:0]   fib_stealSide_axi_mgmt_vss_1_BRESP,
  output         fib_stealSide_axi_mgmt_vss_2_ARREADY,
  input          fib_stealSide_axi_mgmt_vss_2_ARVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_2_ARADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_2_ARPROT,
  input          fib_stealSide_axi_mgmt_vss_2_RREADY,
  output         fib_stealSide_axi_mgmt_vss_2_RVALID,
  output [63:0]  fib_stealSide_axi_mgmt_vss_2_RDATA,
  output [1:0]   fib_stealSide_axi_mgmt_vss_2_RRESP,
  output         fib_stealSide_axi_mgmt_vss_2_AWREADY,
  input          fib_stealSide_axi_mgmt_vss_2_AWVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_2_AWADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_2_AWPROT,
  output         fib_stealSide_axi_mgmt_vss_2_WREADY,
  input          fib_stealSide_axi_mgmt_vss_2_WVALID,
  input  [63:0]  fib_stealSide_axi_mgmt_vss_2_WDATA,
  input  [7:0]   fib_stealSide_axi_mgmt_vss_2_WSTRB,
  input          fib_stealSide_axi_mgmt_vss_2_BREADY,
  output         fib_stealSide_axi_mgmt_vss_2_BVALID,
  output [1:0]   fib_stealSide_axi_mgmt_vss_2_BRESP,
  output         fib_stealSide_axi_mgmt_vss_3_ARREADY,
  input          fib_stealSide_axi_mgmt_vss_3_ARVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_3_ARADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_3_ARPROT,
  input          fib_stealSide_axi_mgmt_vss_3_RREADY,
  output         fib_stealSide_axi_mgmt_vss_3_RVALID,
  output [63:0]  fib_stealSide_axi_mgmt_vss_3_RDATA,
  output [1:0]   fib_stealSide_axi_mgmt_vss_3_RRESP,
  output         fib_stealSide_axi_mgmt_vss_3_AWREADY,
  input          fib_stealSide_axi_mgmt_vss_3_AWVALID,
  input  [5:0]   fib_stealSide_axi_mgmt_vss_3_AWADDR,
  input  [2:0]   fib_stealSide_axi_mgmt_vss_3_AWPROT,
  output         fib_stealSide_axi_mgmt_vss_3_WREADY,
  input          fib_stealSide_axi_mgmt_vss_3_WVALID,
  input  [63:0]  fib_stealSide_axi_mgmt_vss_3_WDATA,
  input  [7:0]   fib_stealSide_axi_mgmt_vss_3_WSTRB,
  input          fib_stealSide_axi_mgmt_vss_3_BREADY,
  output         fib_stealSide_axi_mgmt_vss_3_BVALID,
  output [1:0]   fib_stealSide_axi_mgmt_vss_3_BRESP,
  input          fib_stealSide_vss_axi_full_0_ARREADY,
  output         fib_stealSide_vss_axi_full_0_ARVALID,
  output [3:0]   fib_stealSide_vss_axi_full_0_ARID,
  output [63:0]  fib_stealSide_vss_axi_full_0_ARADDR,
  output [7:0]   fib_stealSide_vss_axi_full_0_ARLEN,
  output [2:0]   fib_stealSide_vss_axi_full_0_ARSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_0_ARBURST,
  output         fib_stealSide_vss_axi_full_0_ARLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_0_ARCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_0_ARPROT,
  output [3:0]   fib_stealSide_vss_axi_full_0_ARQOS,
  output [3:0]   fib_stealSide_vss_axi_full_0_ARREGION,
  output         fib_stealSide_vss_axi_full_0_RREADY,
  input          fib_stealSide_vss_axi_full_0_RVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_0_RID,
  input  [127:0] fib_stealSide_vss_axi_full_0_RDATA,
  input  [1:0]   fib_stealSide_vss_axi_full_0_RRESP,
  input          fib_stealSide_vss_axi_full_0_RLAST,
  input          fib_stealSide_vss_axi_full_0_AWREADY,
  output         fib_stealSide_vss_axi_full_0_AWVALID,
  output [3:0]   fib_stealSide_vss_axi_full_0_AWID,
  output [63:0]  fib_stealSide_vss_axi_full_0_AWADDR,
  output [7:0]   fib_stealSide_vss_axi_full_0_AWLEN,
  output [2:0]   fib_stealSide_vss_axi_full_0_AWSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_0_AWBURST,
  output         fib_stealSide_vss_axi_full_0_AWLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_0_AWCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_0_AWPROT,
  output [3:0]   fib_stealSide_vss_axi_full_0_AWQOS,
  output [3:0]   fib_stealSide_vss_axi_full_0_AWREGION,
  input          fib_stealSide_vss_axi_full_0_WREADY,
  output         fib_stealSide_vss_axi_full_0_WVALID,
  output [3:0]   fib_stealSide_vss_axi_full_0_WID,
  output [127:0] fib_stealSide_vss_axi_full_0_WDATA,
  output [15:0]  fib_stealSide_vss_axi_full_0_WSTRB,
  output         fib_stealSide_vss_axi_full_0_WLAST,
  output         fib_stealSide_vss_axi_full_0_BREADY,
  input          fib_stealSide_vss_axi_full_0_BVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_0_BID,
  input  [1:0]   fib_stealSide_vss_axi_full_0_BRESP,
  input          fib_stealSide_vss_axi_full_1_ARREADY,
  output         fib_stealSide_vss_axi_full_1_ARVALID,
  output [3:0]   fib_stealSide_vss_axi_full_1_ARID,
  output [63:0]  fib_stealSide_vss_axi_full_1_ARADDR,
  output [7:0]   fib_stealSide_vss_axi_full_1_ARLEN,
  output [2:0]   fib_stealSide_vss_axi_full_1_ARSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_1_ARBURST,
  output         fib_stealSide_vss_axi_full_1_ARLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_1_ARCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_1_ARPROT,
  output [3:0]   fib_stealSide_vss_axi_full_1_ARQOS,
  output [3:0]   fib_stealSide_vss_axi_full_1_ARREGION,
  output         fib_stealSide_vss_axi_full_1_RREADY,
  input          fib_stealSide_vss_axi_full_1_RVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_1_RID,
  input  [127:0] fib_stealSide_vss_axi_full_1_RDATA,
  input  [1:0]   fib_stealSide_vss_axi_full_1_RRESP,
  input          fib_stealSide_vss_axi_full_1_RLAST,
  input          fib_stealSide_vss_axi_full_1_AWREADY,
  output         fib_stealSide_vss_axi_full_1_AWVALID,
  output [3:0]   fib_stealSide_vss_axi_full_1_AWID,
  output [63:0]  fib_stealSide_vss_axi_full_1_AWADDR,
  output [7:0]   fib_stealSide_vss_axi_full_1_AWLEN,
  output [2:0]   fib_stealSide_vss_axi_full_1_AWSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_1_AWBURST,
  output         fib_stealSide_vss_axi_full_1_AWLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_1_AWCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_1_AWPROT,
  output [3:0]   fib_stealSide_vss_axi_full_1_AWQOS,
  output [3:0]   fib_stealSide_vss_axi_full_1_AWREGION,
  input          fib_stealSide_vss_axi_full_1_WREADY,
  output         fib_stealSide_vss_axi_full_1_WVALID,
  output [3:0]   fib_stealSide_vss_axi_full_1_WID,
  output [127:0] fib_stealSide_vss_axi_full_1_WDATA,
  output [15:0]  fib_stealSide_vss_axi_full_1_WSTRB,
  output         fib_stealSide_vss_axi_full_1_WLAST,
  output         fib_stealSide_vss_axi_full_1_BREADY,
  input          fib_stealSide_vss_axi_full_1_BVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_1_BID,
  input  [1:0]   fib_stealSide_vss_axi_full_1_BRESP,
  input          fib_stealSide_vss_axi_full_2_ARREADY,
  output         fib_stealSide_vss_axi_full_2_ARVALID,
  output [3:0]   fib_stealSide_vss_axi_full_2_ARID,
  output [63:0]  fib_stealSide_vss_axi_full_2_ARADDR,
  output [7:0]   fib_stealSide_vss_axi_full_2_ARLEN,
  output [2:0]   fib_stealSide_vss_axi_full_2_ARSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_2_ARBURST,
  output         fib_stealSide_vss_axi_full_2_ARLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_2_ARCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_2_ARPROT,
  output [3:0]   fib_stealSide_vss_axi_full_2_ARQOS,
  output [3:0]   fib_stealSide_vss_axi_full_2_ARREGION,
  output         fib_stealSide_vss_axi_full_2_RREADY,
  input          fib_stealSide_vss_axi_full_2_RVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_2_RID,
  input  [127:0] fib_stealSide_vss_axi_full_2_RDATA,
  input  [1:0]   fib_stealSide_vss_axi_full_2_RRESP,
  input          fib_stealSide_vss_axi_full_2_RLAST,
  input          fib_stealSide_vss_axi_full_2_AWREADY,
  output         fib_stealSide_vss_axi_full_2_AWVALID,
  output [3:0]   fib_stealSide_vss_axi_full_2_AWID,
  output [63:0]  fib_stealSide_vss_axi_full_2_AWADDR,
  output [7:0]   fib_stealSide_vss_axi_full_2_AWLEN,
  output [2:0]   fib_stealSide_vss_axi_full_2_AWSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_2_AWBURST,
  output         fib_stealSide_vss_axi_full_2_AWLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_2_AWCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_2_AWPROT,
  output [3:0]   fib_stealSide_vss_axi_full_2_AWQOS,
  output [3:0]   fib_stealSide_vss_axi_full_2_AWREGION,
  input          fib_stealSide_vss_axi_full_2_WREADY,
  output         fib_stealSide_vss_axi_full_2_WVALID,
  output [3:0]   fib_stealSide_vss_axi_full_2_WID,
  output [127:0] fib_stealSide_vss_axi_full_2_WDATA,
  output [15:0]  fib_stealSide_vss_axi_full_2_WSTRB,
  output         fib_stealSide_vss_axi_full_2_WLAST,
  output         fib_stealSide_vss_axi_full_2_BREADY,
  input          fib_stealSide_vss_axi_full_2_BVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_2_BID,
  input  [1:0]   fib_stealSide_vss_axi_full_2_BRESP,
  input          fib_stealSide_vss_axi_full_3_ARREADY,
  output         fib_stealSide_vss_axi_full_3_ARVALID,
  output [3:0]   fib_stealSide_vss_axi_full_3_ARID,
  output [63:0]  fib_stealSide_vss_axi_full_3_ARADDR,
  output [7:0]   fib_stealSide_vss_axi_full_3_ARLEN,
  output [2:0]   fib_stealSide_vss_axi_full_3_ARSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_3_ARBURST,
  output         fib_stealSide_vss_axi_full_3_ARLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_3_ARCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_3_ARPROT,
  output [3:0]   fib_stealSide_vss_axi_full_3_ARQOS,
  output [3:0]   fib_stealSide_vss_axi_full_3_ARREGION,
  output         fib_stealSide_vss_axi_full_3_RREADY,
  input          fib_stealSide_vss_axi_full_3_RVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_3_RID,
  input  [127:0] fib_stealSide_vss_axi_full_3_RDATA,
  input  [1:0]   fib_stealSide_vss_axi_full_3_RRESP,
  input          fib_stealSide_vss_axi_full_3_RLAST,
  input          fib_stealSide_vss_axi_full_3_AWREADY,
  output         fib_stealSide_vss_axi_full_3_AWVALID,
  output [3:0]   fib_stealSide_vss_axi_full_3_AWID,
  output [63:0]  fib_stealSide_vss_axi_full_3_AWADDR,
  output [7:0]   fib_stealSide_vss_axi_full_3_AWLEN,
  output [2:0]   fib_stealSide_vss_axi_full_3_AWSIZE,
  output [1:0]   fib_stealSide_vss_axi_full_3_AWBURST,
  output         fib_stealSide_vss_axi_full_3_AWLOCK,
  output [3:0]   fib_stealSide_vss_axi_full_3_AWCACHE,
  output [2:0]   fib_stealSide_vss_axi_full_3_AWPROT,
  output [3:0]   fib_stealSide_vss_axi_full_3_AWQOS,
  output [3:0]   fib_stealSide_vss_axi_full_3_AWREGION,
  input          fib_stealSide_vss_axi_full_3_WREADY,
  output         fib_stealSide_vss_axi_full_3_WVALID,
  output [3:0]   fib_stealSide_vss_axi_full_3_WID,
  output [127:0] fib_stealSide_vss_axi_full_3_WDATA,
  output [15:0]  fib_stealSide_vss_axi_full_3_WSTRB,
  output         fib_stealSide_vss_axi_full_3_WLAST,
  output         fib_stealSide_vss_axi_full_3_BREADY,
  input          fib_stealSide_vss_axi_full_3_BVALID,
  input  [3:0]   fib_stealSide_vss_axi_full_3_BID,
  input  [1:0]   fib_stealSide_vss_axi_full_3_BRESP,
  input          fib_stealSide_taskOut_0_TREADY,
  output         fib_stealSide_taskOut_0_TVALID,
  output [127:0] fib_stealSide_taskOut_0_TDATA,
  input          fib_stealSide_taskOut_1_TREADY,
  output         fib_stealSide_taskOut_1_TVALID,
  output [127:0] fib_stealSide_taskOut_1_TDATA,
  input          fib_stealSide_taskOut_2_TREADY,
  output         fib_stealSide_taskOut_2_TVALID,
  output [127:0] fib_stealSide_taskOut_2_TDATA,
  input          fib_stealSide_taskOut_3_TREADY,
  output         fib_stealSide_taskOut_3_TVALID,
  output [127:0] fib_stealSide_taskOut_3_TDATA,
  output         fib_stealSide_taskIn_0_TREADY,
  input          fib_stealSide_taskIn_0_TVALID,
  input  [127:0] fib_stealSide_taskIn_0_TDATA,
  output         fib_stealSide_taskIn_1_TREADY,
  input          fib_stealSide_taskIn_1_TVALID,
  input  [127:0] fib_stealSide_taskIn_1_TDATA,
  output         fib_stealSide_taskIn_2_TREADY,
  input          fib_stealSide_taskIn_2_TVALID,
  input  [127:0] fib_stealSide_taskIn_2_TDATA,
  output         fib_stealSide_taskIn_3_TREADY,
  input          fib_stealSide_taskIn_3_TVALID,
  input  [127:0] fib_stealSide_taskIn_3_TDATA
);
  wire  stealSide_clock; // @[fullSysGen.scala 228:29]
  wire  stealSide_reset; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_0_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_0_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_0_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_0_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_axi_mgmt_vss_0_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_0_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_0_ARADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_vss_axi_full_0_ARLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_RVALID; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_io_vss_axi_full_0_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_vss_axi_full_0_AWLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WLAST; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_0_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_0_TVALID; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_io_taskOut_0_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_1_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_1_TVALID; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_io_taskOut_1_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_2_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_2_TVALID; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_io_taskOut_2_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_3_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_3_TVALID; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_io_taskOut_3_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_0_ctrl_serveStealReq_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_0_ctrl_serveStealReq_valid; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_0_data_qOutTask_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_0_data_qOutTask_valid; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_connSyncSide_0_data_qOutTask_bits; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_1_ctrl_serveStealReq_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_1_ctrl_serveStealReq_valid; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_1_data_qOutTask_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_1_data_qOutTask_valid; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_connSyncSide_1_data_qOutTask_bits; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_2_ctrl_serveStealReq_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_2_ctrl_serveStealReq_valid; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_2_data_qOutTask_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_2_data_qOutTask_valid; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_connSyncSide_2_data_qOutTask_bits; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_3_ctrl_serveStealReq_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_3_ctrl_serveStealReq_valid; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_3_data_qOutTask_ready; // @[fullSysGen.scala 228:29]
  wire  stealSide_connSyncSide_3_data_qOutTask_valid; // @[fullSysGen.scala 228:29]
  wire [255:0] stealSide_connSyncSide_3_data_qOutTask_bits; // @[fullSysGen.scala 228:29]
  wire  continuationAllocationSide_clock; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_reset; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_0_TREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_0_TVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_contOut_0_TDATA; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_1_TREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_1_TVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_contOut_1_TDATA; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_2_TREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_2_TVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_contOut_2_TDATA; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_3_TREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_contOut_3_TVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_contOut_3_TDATA; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_ARREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_ARVALID; // @[fullSysGen.scala 268:48]
  wire [5:0] continuationAllocationSide_io_axi_mgmt_vcas_ARADDR; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_RREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_RVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_axi_mgmt_vcas_RDATA; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_AWREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_AWVALID; // @[fullSysGen.scala 268:48]
  wire [5:0] continuationAllocationSide_io_axi_mgmt_vcas_AWADDR; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_WREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_WVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_axi_mgmt_vcas_WDATA; // @[fullSysGen.scala 268:48]
  wire [7:0] continuationAllocationSide_io_axi_mgmt_vcas_WSTRB; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_BREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_axi_mgmt_vcas_BVALID; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_vcas_axi_full_ARREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_vcas_axi_full_ARVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_vcas_axi_full_ARADDR; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_vcas_axi_full_RREADY; // @[fullSysGen.scala 268:48]
  wire  continuationAllocationSide_io_vcas_axi_full_RVALID; // @[fullSysGen.scala 268:48]
  wire [63:0] continuationAllocationSide_io_vcas_axi_full_RDATA; // @[fullSysGen.scala 268:48]
  wire  syncSide_clock; // @[fullSysGen.scala 282:30]
  wire  syncSide_reset; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_0_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_0_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_0_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_1_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_1_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_1_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_2_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_2_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_2_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_3_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_3_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_3_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_4_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_4_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_4_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_5_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_5_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_5_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_6_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_6_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_6_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_7_TREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_addrIn_7_TVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_addrIn_7_TDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_0_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_0_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_AWREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_AWVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_0_AWADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_WREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_WVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_0_WDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_0_BVALID; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_1_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_1_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_AWREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_AWVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_1_AWADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_WREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_WVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_1_WDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_1_BVALID; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_2_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_2_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_AWREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_AWVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_2_AWADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_WREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_WVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_2_WDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_2_BVALID; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_3_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_3_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_AWREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_AWVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_3_AWADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_WREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_WVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_3_WDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_3_BVALID; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_4_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_4_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_4_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_4_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_4_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_4_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_5_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_5_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_5_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_5_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_5_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_5_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_6_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_6_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_6_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_6_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_6_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_6_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_7_ARREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_7_ARVALID; // @[fullSysGen.scala 282:30]
  wire [63:0] syncSide_io_axi_full_argRoute_7_ARADDR; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_7_RREADY; // @[fullSysGen.scala 282:30]
  wire  syncSide_io_axi_full_argRoute_7_RVALID; // @[fullSysGen.scala 282:30]
  wire [31:0] syncSide_io_axi_full_argRoute_7_RDATA; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_0_ctrl_serveStealReq_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_0_ctrl_serveStealReq_valid; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_0_data_qOutTask_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_0_data_qOutTask_valid; // @[fullSysGen.scala 282:30]
  wire [255:0] syncSide_connStealNtw_0_data_qOutTask_bits; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_1_ctrl_serveStealReq_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_1_ctrl_serveStealReq_valid; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_1_data_qOutTask_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_1_data_qOutTask_valid; // @[fullSysGen.scala 282:30]
  wire [255:0] syncSide_connStealNtw_1_data_qOutTask_bits; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_2_ctrl_serveStealReq_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_2_ctrl_serveStealReq_valid; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_2_data_qOutTask_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_2_data_qOutTask_valid; // @[fullSysGen.scala 282:30]
  wire [255:0] syncSide_connStealNtw_2_data_qOutTask_bits; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_3_ctrl_serveStealReq_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_3_ctrl_serveStealReq_valid; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_3_data_qOutTask_ready; // @[fullSysGen.scala 282:30]
  wire  syncSide_connStealNtw_3_data_qOutTask_valid; // @[fullSysGen.scala 282:30]
  wire [255:0] syncSide_connStealNtw_3_data_qOutTask_bits; // @[fullSysGen.scala 282:30]
  wire  stealSide_1_clock; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_reset; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_0_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_0_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_0_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_0_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_axi_mgmt_vss_0_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_0_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_1_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_1_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_1_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_1_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_axi_mgmt_vss_1_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_1_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_2_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_2_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_2_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_2_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_axi_mgmt_vss_2_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_2_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_3_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_3_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_1_io_axi_mgmt_vss_3_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_axi_mgmt_vss_3_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_axi_mgmt_vss_3_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_axi_mgmt_vss_3_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_0_ARADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_0_ARLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_RVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_0_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_0_AWLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_WLAST; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_0_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_1_ARADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_1_ARLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_RVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_1_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_1_AWADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_1_AWLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_WVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_1_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_WLAST; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_1_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_2_ARADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_2_ARLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_RVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_2_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_2_AWADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_2_AWLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_WVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_2_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_WLAST; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_2_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_3_ARADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_3_ARLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_RVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_3_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_1_io_vss_axi_full_3_AWADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_1_io_vss_axi_full_3_AWLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_WVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_vss_axi_full_3_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_WLAST; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_vss_axi_full_3_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_0_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_0_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskOut_0_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_1_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_1_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskOut_1_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_2_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_2_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskOut_2_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_3_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskOut_3_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskOut_3_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_0_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_0_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskIn_0_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_1_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_1_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskIn_1_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_2_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_2_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskIn_2_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_3_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_1_io_taskIn_3_TVALID; // @[fullSysGen.scala 228:29]
  wire [127:0] stealSide_1_io_taskIn_3_TDATA; // @[fullSysGen.scala 228:29]
  stealSide stealSide ( // @[fullSysGen.scala 228:29]
    .clock(stealSide_clock),
    .reset(stealSide_reset),
    .io_axi_mgmt_vss_0_ARREADY(stealSide_io_axi_mgmt_vss_0_ARREADY),
    .io_axi_mgmt_vss_0_ARVALID(stealSide_io_axi_mgmt_vss_0_ARVALID),
    .io_axi_mgmt_vss_0_ARADDR(stealSide_io_axi_mgmt_vss_0_ARADDR),
    .io_axi_mgmt_vss_0_RREADY(stealSide_io_axi_mgmt_vss_0_RREADY),
    .io_axi_mgmt_vss_0_RVALID(stealSide_io_axi_mgmt_vss_0_RVALID),
    .io_axi_mgmt_vss_0_RDATA(stealSide_io_axi_mgmt_vss_0_RDATA),
    .io_axi_mgmt_vss_0_AWREADY(stealSide_io_axi_mgmt_vss_0_AWREADY),
    .io_axi_mgmt_vss_0_AWVALID(stealSide_io_axi_mgmt_vss_0_AWVALID),
    .io_axi_mgmt_vss_0_AWADDR(stealSide_io_axi_mgmt_vss_0_AWADDR),
    .io_axi_mgmt_vss_0_WREADY(stealSide_io_axi_mgmt_vss_0_WREADY),
    .io_axi_mgmt_vss_0_WVALID(stealSide_io_axi_mgmt_vss_0_WVALID),
    .io_axi_mgmt_vss_0_WDATA(stealSide_io_axi_mgmt_vss_0_WDATA),
    .io_axi_mgmt_vss_0_WSTRB(stealSide_io_axi_mgmt_vss_0_WSTRB),
    .io_axi_mgmt_vss_0_BREADY(stealSide_io_axi_mgmt_vss_0_BREADY),
    .io_axi_mgmt_vss_0_BVALID(stealSide_io_axi_mgmt_vss_0_BVALID),
    .io_vss_axi_full_0_ARREADY(stealSide_io_vss_axi_full_0_ARREADY),
    .io_vss_axi_full_0_ARVALID(stealSide_io_vss_axi_full_0_ARVALID),
    .io_vss_axi_full_0_ARADDR(stealSide_io_vss_axi_full_0_ARADDR),
    .io_vss_axi_full_0_ARLEN(stealSide_io_vss_axi_full_0_ARLEN),
    .io_vss_axi_full_0_RREADY(stealSide_io_vss_axi_full_0_RREADY),
    .io_vss_axi_full_0_RVALID(stealSide_io_vss_axi_full_0_RVALID),
    .io_vss_axi_full_0_RDATA(stealSide_io_vss_axi_full_0_RDATA),
    .io_vss_axi_full_0_AWREADY(stealSide_io_vss_axi_full_0_AWREADY),
    .io_vss_axi_full_0_AWVALID(stealSide_io_vss_axi_full_0_AWVALID),
    .io_vss_axi_full_0_AWADDR(stealSide_io_vss_axi_full_0_AWADDR),
    .io_vss_axi_full_0_AWLEN(stealSide_io_vss_axi_full_0_AWLEN),
    .io_vss_axi_full_0_WREADY(stealSide_io_vss_axi_full_0_WREADY),
    .io_vss_axi_full_0_WVALID(stealSide_io_vss_axi_full_0_WVALID),
    .io_vss_axi_full_0_WDATA(stealSide_io_vss_axi_full_0_WDATA),
    .io_vss_axi_full_0_WLAST(stealSide_io_vss_axi_full_0_WLAST),
    .io_vss_axi_full_0_BVALID(stealSide_io_vss_axi_full_0_BVALID),
    .io_taskOut_0_TREADY(stealSide_io_taskOut_0_TREADY),
    .io_taskOut_0_TVALID(stealSide_io_taskOut_0_TVALID),
    .io_taskOut_0_TDATA(stealSide_io_taskOut_0_TDATA),
    .io_taskOut_1_TREADY(stealSide_io_taskOut_1_TREADY),
    .io_taskOut_1_TVALID(stealSide_io_taskOut_1_TVALID),
    .io_taskOut_1_TDATA(stealSide_io_taskOut_1_TDATA),
    .io_taskOut_2_TREADY(stealSide_io_taskOut_2_TREADY),
    .io_taskOut_2_TVALID(stealSide_io_taskOut_2_TVALID),
    .io_taskOut_2_TDATA(stealSide_io_taskOut_2_TDATA),
    .io_taskOut_3_TREADY(stealSide_io_taskOut_3_TREADY),
    .io_taskOut_3_TVALID(stealSide_io_taskOut_3_TVALID),
    .io_taskOut_3_TDATA(stealSide_io_taskOut_3_TDATA),
    .connSyncSide_0_ctrl_serveStealReq_ready(stealSide_connSyncSide_0_ctrl_serveStealReq_ready),
    .connSyncSide_0_ctrl_serveStealReq_valid(stealSide_connSyncSide_0_ctrl_serveStealReq_valid),
    .connSyncSide_0_data_qOutTask_ready(stealSide_connSyncSide_0_data_qOutTask_ready),
    .connSyncSide_0_data_qOutTask_valid(stealSide_connSyncSide_0_data_qOutTask_valid),
    .connSyncSide_0_data_qOutTask_bits(stealSide_connSyncSide_0_data_qOutTask_bits),
    .connSyncSide_1_ctrl_serveStealReq_ready(stealSide_connSyncSide_1_ctrl_serveStealReq_ready),
    .connSyncSide_1_ctrl_serveStealReq_valid(stealSide_connSyncSide_1_ctrl_serveStealReq_valid),
    .connSyncSide_1_data_qOutTask_ready(stealSide_connSyncSide_1_data_qOutTask_ready),
    .connSyncSide_1_data_qOutTask_valid(stealSide_connSyncSide_1_data_qOutTask_valid),
    .connSyncSide_1_data_qOutTask_bits(stealSide_connSyncSide_1_data_qOutTask_bits),
    .connSyncSide_2_ctrl_serveStealReq_ready(stealSide_connSyncSide_2_ctrl_serveStealReq_ready),
    .connSyncSide_2_ctrl_serveStealReq_valid(stealSide_connSyncSide_2_ctrl_serveStealReq_valid),
    .connSyncSide_2_data_qOutTask_ready(stealSide_connSyncSide_2_data_qOutTask_ready),
    .connSyncSide_2_data_qOutTask_valid(stealSide_connSyncSide_2_data_qOutTask_valid),
    .connSyncSide_2_data_qOutTask_bits(stealSide_connSyncSide_2_data_qOutTask_bits),
    .connSyncSide_3_ctrl_serveStealReq_ready(stealSide_connSyncSide_3_ctrl_serveStealReq_ready),
    .connSyncSide_3_ctrl_serveStealReq_valid(stealSide_connSyncSide_3_ctrl_serveStealReq_valid),
    .connSyncSide_3_data_qOutTask_ready(stealSide_connSyncSide_3_data_qOutTask_ready),
    .connSyncSide_3_data_qOutTask_valid(stealSide_connSyncSide_3_data_qOutTask_valid),
    .connSyncSide_3_data_qOutTask_bits(stealSide_connSyncSide_3_data_qOutTask_bits)
  );
  continuationAllocationSide continuationAllocationSide ( // @[fullSysGen.scala 268:48]
    .clock(continuationAllocationSide_clock),
    .reset(continuationAllocationSide_reset),
    .io_contOut_0_TREADY(continuationAllocationSide_io_contOut_0_TREADY),
    .io_contOut_0_TVALID(continuationAllocationSide_io_contOut_0_TVALID),
    .io_contOut_0_TDATA(continuationAllocationSide_io_contOut_0_TDATA),
    .io_contOut_1_TREADY(continuationAllocationSide_io_contOut_1_TREADY),
    .io_contOut_1_TVALID(continuationAllocationSide_io_contOut_1_TVALID),
    .io_contOut_1_TDATA(continuationAllocationSide_io_contOut_1_TDATA),
    .io_contOut_2_TREADY(continuationAllocationSide_io_contOut_2_TREADY),
    .io_contOut_2_TVALID(continuationAllocationSide_io_contOut_2_TVALID),
    .io_contOut_2_TDATA(continuationAllocationSide_io_contOut_2_TDATA),
    .io_contOut_3_TREADY(continuationAllocationSide_io_contOut_3_TREADY),
    .io_contOut_3_TVALID(continuationAllocationSide_io_contOut_3_TVALID),
    .io_contOut_3_TDATA(continuationAllocationSide_io_contOut_3_TDATA),
    .io_axi_mgmt_vcas_ARREADY(continuationAllocationSide_io_axi_mgmt_vcas_ARREADY),
    .io_axi_mgmt_vcas_ARVALID(continuationAllocationSide_io_axi_mgmt_vcas_ARVALID),
    .io_axi_mgmt_vcas_ARADDR(continuationAllocationSide_io_axi_mgmt_vcas_ARADDR),
    .io_axi_mgmt_vcas_RREADY(continuationAllocationSide_io_axi_mgmt_vcas_RREADY),
    .io_axi_mgmt_vcas_RVALID(continuationAllocationSide_io_axi_mgmt_vcas_RVALID),
    .io_axi_mgmt_vcas_RDATA(continuationAllocationSide_io_axi_mgmt_vcas_RDATA),
    .io_axi_mgmt_vcas_AWREADY(continuationAllocationSide_io_axi_mgmt_vcas_AWREADY),
    .io_axi_mgmt_vcas_AWVALID(continuationAllocationSide_io_axi_mgmt_vcas_AWVALID),
    .io_axi_mgmt_vcas_AWADDR(continuationAllocationSide_io_axi_mgmt_vcas_AWADDR),
    .io_axi_mgmt_vcas_WREADY(continuationAllocationSide_io_axi_mgmt_vcas_WREADY),
    .io_axi_mgmt_vcas_WVALID(continuationAllocationSide_io_axi_mgmt_vcas_WVALID),
    .io_axi_mgmt_vcas_WDATA(continuationAllocationSide_io_axi_mgmt_vcas_WDATA),
    .io_axi_mgmt_vcas_WSTRB(continuationAllocationSide_io_axi_mgmt_vcas_WSTRB),
    .io_axi_mgmt_vcas_BREADY(continuationAllocationSide_io_axi_mgmt_vcas_BREADY),
    .io_axi_mgmt_vcas_BVALID(continuationAllocationSide_io_axi_mgmt_vcas_BVALID),
    .io_vcas_axi_full_ARREADY(continuationAllocationSide_io_vcas_axi_full_ARREADY),
    .io_vcas_axi_full_ARVALID(continuationAllocationSide_io_vcas_axi_full_ARVALID),
    .io_vcas_axi_full_ARADDR(continuationAllocationSide_io_vcas_axi_full_ARADDR),
    .io_vcas_axi_full_RREADY(continuationAllocationSide_io_vcas_axi_full_RREADY),
    .io_vcas_axi_full_RVALID(continuationAllocationSide_io_vcas_axi_full_RVALID),
    .io_vcas_axi_full_RDATA(continuationAllocationSide_io_vcas_axi_full_RDATA)
  );
  syncSide syncSide ( // @[fullSysGen.scala 282:30]
    .clock(syncSide_clock),
    .reset(syncSide_reset),
    .io_addrIn_0_TREADY(syncSide_io_addrIn_0_TREADY),
    .io_addrIn_0_TVALID(syncSide_io_addrIn_0_TVALID),
    .io_addrIn_0_TDATA(syncSide_io_addrIn_0_TDATA),
    .io_addrIn_1_TREADY(syncSide_io_addrIn_1_TREADY),
    .io_addrIn_1_TVALID(syncSide_io_addrIn_1_TVALID),
    .io_addrIn_1_TDATA(syncSide_io_addrIn_1_TDATA),
    .io_addrIn_2_TREADY(syncSide_io_addrIn_2_TREADY),
    .io_addrIn_2_TVALID(syncSide_io_addrIn_2_TVALID),
    .io_addrIn_2_TDATA(syncSide_io_addrIn_2_TDATA),
    .io_addrIn_3_TREADY(syncSide_io_addrIn_3_TREADY),
    .io_addrIn_3_TVALID(syncSide_io_addrIn_3_TVALID),
    .io_addrIn_3_TDATA(syncSide_io_addrIn_3_TDATA),
    .io_addrIn_4_TREADY(syncSide_io_addrIn_4_TREADY),
    .io_addrIn_4_TVALID(syncSide_io_addrIn_4_TVALID),
    .io_addrIn_4_TDATA(syncSide_io_addrIn_4_TDATA),
    .io_addrIn_5_TREADY(syncSide_io_addrIn_5_TREADY),
    .io_addrIn_5_TVALID(syncSide_io_addrIn_5_TVALID),
    .io_addrIn_5_TDATA(syncSide_io_addrIn_5_TDATA),
    .io_addrIn_6_TREADY(syncSide_io_addrIn_6_TREADY),
    .io_addrIn_6_TVALID(syncSide_io_addrIn_6_TVALID),
    .io_addrIn_6_TDATA(syncSide_io_addrIn_6_TDATA),
    .io_addrIn_7_TREADY(syncSide_io_addrIn_7_TREADY),
    .io_addrIn_7_TVALID(syncSide_io_addrIn_7_TVALID),
    .io_addrIn_7_TDATA(syncSide_io_addrIn_7_TDATA),
    .io_axi_full_argRoute_0_ARREADY(syncSide_io_axi_full_argRoute_0_ARREADY),
    .io_axi_full_argRoute_0_ARVALID(syncSide_io_axi_full_argRoute_0_ARVALID),
    .io_axi_full_argRoute_0_ARADDR(syncSide_io_axi_full_argRoute_0_ARADDR),
    .io_axi_full_argRoute_0_RREADY(syncSide_io_axi_full_argRoute_0_RREADY),
    .io_axi_full_argRoute_0_RVALID(syncSide_io_axi_full_argRoute_0_RVALID),
    .io_axi_full_argRoute_0_RDATA(syncSide_io_axi_full_argRoute_0_RDATA),
    .io_axi_full_argRoute_0_AWREADY(syncSide_io_axi_full_argRoute_0_AWREADY),
    .io_axi_full_argRoute_0_AWVALID(syncSide_io_axi_full_argRoute_0_AWVALID),
    .io_axi_full_argRoute_0_AWADDR(syncSide_io_axi_full_argRoute_0_AWADDR),
    .io_axi_full_argRoute_0_WREADY(syncSide_io_axi_full_argRoute_0_WREADY),
    .io_axi_full_argRoute_0_WVALID(syncSide_io_axi_full_argRoute_0_WVALID),
    .io_axi_full_argRoute_0_WDATA(syncSide_io_axi_full_argRoute_0_WDATA),
    .io_axi_full_argRoute_0_BVALID(syncSide_io_axi_full_argRoute_0_BVALID),
    .io_axi_full_argRoute_1_ARREADY(syncSide_io_axi_full_argRoute_1_ARREADY),
    .io_axi_full_argRoute_1_ARVALID(syncSide_io_axi_full_argRoute_1_ARVALID),
    .io_axi_full_argRoute_1_ARADDR(syncSide_io_axi_full_argRoute_1_ARADDR),
    .io_axi_full_argRoute_1_RREADY(syncSide_io_axi_full_argRoute_1_RREADY),
    .io_axi_full_argRoute_1_RVALID(syncSide_io_axi_full_argRoute_1_RVALID),
    .io_axi_full_argRoute_1_RDATA(syncSide_io_axi_full_argRoute_1_RDATA),
    .io_axi_full_argRoute_1_AWREADY(syncSide_io_axi_full_argRoute_1_AWREADY),
    .io_axi_full_argRoute_1_AWVALID(syncSide_io_axi_full_argRoute_1_AWVALID),
    .io_axi_full_argRoute_1_AWADDR(syncSide_io_axi_full_argRoute_1_AWADDR),
    .io_axi_full_argRoute_1_WREADY(syncSide_io_axi_full_argRoute_1_WREADY),
    .io_axi_full_argRoute_1_WVALID(syncSide_io_axi_full_argRoute_1_WVALID),
    .io_axi_full_argRoute_1_WDATA(syncSide_io_axi_full_argRoute_1_WDATA),
    .io_axi_full_argRoute_1_BVALID(syncSide_io_axi_full_argRoute_1_BVALID),
    .io_axi_full_argRoute_2_ARREADY(syncSide_io_axi_full_argRoute_2_ARREADY),
    .io_axi_full_argRoute_2_ARVALID(syncSide_io_axi_full_argRoute_2_ARVALID),
    .io_axi_full_argRoute_2_ARADDR(syncSide_io_axi_full_argRoute_2_ARADDR),
    .io_axi_full_argRoute_2_RREADY(syncSide_io_axi_full_argRoute_2_RREADY),
    .io_axi_full_argRoute_2_RVALID(syncSide_io_axi_full_argRoute_2_RVALID),
    .io_axi_full_argRoute_2_RDATA(syncSide_io_axi_full_argRoute_2_RDATA),
    .io_axi_full_argRoute_2_AWREADY(syncSide_io_axi_full_argRoute_2_AWREADY),
    .io_axi_full_argRoute_2_AWVALID(syncSide_io_axi_full_argRoute_2_AWVALID),
    .io_axi_full_argRoute_2_AWADDR(syncSide_io_axi_full_argRoute_2_AWADDR),
    .io_axi_full_argRoute_2_WREADY(syncSide_io_axi_full_argRoute_2_WREADY),
    .io_axi_full_argRoute_2_WVALID(syncSide_io_axi_full_argRoute_2_WVALID),
    .io_axi_full_argRoute_2_WDATA(syncSide_io_axi_full_argRoute_2_WDATA),
    .io_axi_full_argRoute_2_BVALID(syncSide_io_axi_full_argRoute_2_BVALID),
    .io_axi_full_argRoute_3_ARREADY(syncSide_io_axi_full_argRoute_3_ARREADY),
    .io_axi_full_argRoute_3_ARVALID(syncSide_io_axi_full_argRoute_3_ARVALID),
    .io_axi_full_argRoute_3_ARADDR(syncSide_io_axi_full_argRoute_3_ARADDR),
    .io_axi_full_argRoute_3_RREADY(syncSide_io_axi_full_argRoute_3_RREADY),
    .io_axi_full_argRoute_3_RVALID(syncSide_io_axi_full_argRoute_3_RVALID),
    .io_axi_full_argRoute_3_RDATA(syncSide_io_axi_full_argRoute_3_RDATA),
    .io_axi_full_argRoute_3_AWREADY(syncSide_io_axi_full_argRoute_3_AWREADY),
    .io_axi_full_argRoute_3_AWVALID(syncSide_io_axi_full_argRoute_3_AWVALID),
    .io_axi_full_argRoute_3_AWADDR(syncSide_io_axi_full_argRoute_3_AWADDR),
    .io_axi_full_argRoute_3_WREADY(syncSide_io_axi_full_argRoute_3_WREADY),
    .io_axi_full_argRoute_3_WVALID(syncSide_io_axi_full_argRoute_3_WVALID),
    .io_axi_full_argRoute_3_WDATA(syncSide_io_axi_full_argRoute_3_WDATA),
    .io_axi_full_argRoute_3_BVALID(syncSide_io_axi_full_argRoute_3_BVALID),
    .io_axi_full_argRoute_4_ARREADY(syncSide_io_axi_full_argRoute_4_ARREADY),
    .io_axi_full_argRoute_4_ARVALID(syncSide_io_axi_full_argRoute_4_ARVALID),
    .io_axi_full_argRoute_4_ARADDR(syncSide_io_axi_full_argRoute_4_ARADDR),
    .io_axi_full_argRoute_4_RREADY(syncSide_io_axi_full_argRoute_4_RREADY),
    .io_axi_full_argRoute_4_RVALID(syncSide_io_axi_full_argRoute_4_RVALID),
    .io_axi_full_argRoute_4_RDATA(syncSide_io_axi_full_argRoute_4_RDATA),
    .io_axi_full_argRoute_5_ARREADY(syncSide_io_axi_full_argRoute_5_ARREADY),
    .io_axi_full_argRoute_5_ARVALID(syncSide_io_axi_full_argRoute_5_ARVALID),
    .io_axi_full_argRoute_5_ARADDR(syncSide_io_axi_full_argRoute_5_ARADDR),
    .io_axi_full_argRoute_5_RREADY(syncSide_io_axi_full_argRoute_5_RREADY),
    .io_axi_full_argRoute_5_RVALID(syncSide_io_axi_full_argRoute_5_RVALID),
    .io_axi_full_argRoute_5_RDATA(syncSide_io_axi_full_argRoute_5_RDATA),
    .io_axi_full_argRoute_6_ARREADY(syncSide_io_axi_full_argRoute_6_ARREADY),
    .io_axi_full_argRoute_6_ARVALID(syncSide_io_axi_full_argRoute_6_ARVALID),
    .io_axi_full_argRoute_6_ARADDR(syncSide_io_axi_full_argRoute_6_ARADDR),
    .io_axi_full_argRoute_6_RREADY(syncSide_io_axi_full_argRoute_6_RREADY),
    .io_axi_full_argRoute_6_RVALID(syncSide_io_axi_full_argRoute_6_RVALID),
    .io_axi_full_argRoute_6_RDATA(syncSide_io_axi_full_argRoute_6_RDATA),
    .io_axi_full_argRoute_7_ARREADY(syncSide_io_axi_full_argRoute_7_ARREADY),
    .io_axi_full_argRoute_7_ARVALID(syncSide_io_axi_full_argRoute_7_ARVALID),
    .io_axi_full_argRoute_7_ARADDR(syncSide_io_axi_full_argRoute_7_ARADDR),
    .io_axi_full_argRoute_7_RREADY(syncSide_io_axi_full_argRoute_7_RREADY),
    .io_axi_full_argRoute_7_RVALID(syncSide_io_axi_full_argRoute_7_RVALID),
    .io_axi_full_argRoute_7_RDATA(syncSide_io_axi_full_argRoute_7_RDATA),
    .connStealNtw_0_ctrl_serveStealReq_ready(syncSide_connStealNtw_0_ctrl_serveStealReq_ready),
    .connStealNtw_0_ctrl_serveStealReq_valid(syncSide_connStealNtw_0_ctrl_serveStealReq_valid),
    .connStealNtw_0_data_qOutTask_ready(syncSide_connStealNtw_0_data_qOutTask_ready),
    .connStealNtw_0_data_qOutTask_valid(syncSide_connStealNtw_0_data_qOutTask_valid),
    .connStealNtw_0_data_qOutTask_bits(syncSide_connStealNtw_0_data_qOutTask_bits),
    .connStealNtw_1_ctrl_serveStealReq_ready(syncSide_connStealNtw_1_ctrl_serveStealReq_ready),
    .connStealNtw_1_ctrl_serveStealReq_valid(syncSide_connStealNtw_1_ctrl_serveStealReq_valid),
    .connStealNtw_1_data_qOutTask_ready(syncSide_connStealNtw_1_data_qOutTask_ready),
    .connStealNtw_1_data_qOutTask_valid(syncSide_connStealNtw_1_data_qOutTask_valid),
    .connStealNtw_1_data_qOutTask_bits(syncSide_connStealNtw_1_data_qOutTask_bits),
    .connStealNtw_2_ctrl_serveStealReq_ready(syncSide_connStealNtw_2_ctrl_serveStealReq_ready),
    .connStealNtw_2_ctrl_serveStealReq_valid(syncSide_connStealNtw_2_ctrl_serveStealReq_valid),
    .connStealNtw_2_data_qOutTask_ready(syncSide_connStealNtw_2_data_qOutTask_ready),
    .connStealNtw_2_data_qOutTask_valid(syncSide_connStealNtw_2_data_qOutTask_valid),
    .connStealNtw_2_data_qOutTask_bits(syncSide_connStealNtw_2_data_qOutTask_bits),
    .connStealNtw_3_ctrl_serveStealReq_ready(syncSide_connStealNtw_3_ctrl_serveStealReq_ready),
    .connStealNtw_3_ctrl_serveStealReq_valid(syncSide_connStealNtw_3_ctrl_serveStealReq_valid),
    .connStealNtw_3_data_qOutTask_ready(syncSide_connStealNtw_3_data_qOutTask_ready),
    .connStealNtw_3_data_qOutTask_valid(syncSide_connStealNtw_3_data_qOutTask_valid),
    .connStealNtw_3_data_qOutTask_bits(syncSide_connStealNtw_3_data_qOutTask_bits)
  );
  stealSide_1 stealSide_1 ( // @[fullSysGen.scala 228:29]
    .clock(stealSide_1_clock),
    .reset(stealSide_1_reset),
    .io_axi_mgmt_vss_0_ARREADY(stealSide_1_io_axi_mgmt_vss_0_ARREADY),
    .io_axi_mgmt_vss_0_ARVALID(stealSide_1_io_axi_mgmt_vss_0_ARVALID),
    .io_axi_mgmt_vss_0_ARADDR(stealSide_1_io_axi_mgmt_vss_0_ARADDR),
    .io_axi_mgmt_vss_0_RREADY(stealSide_1_io_axi_mgmt_vss_0_RREADY),
    .io_axi_mgmt_vss_0_RVALID(stealSide_1_io_axi_mgmt_vss_0_RVALID),
    .io_axi_mgmt_vss_0_RDATA(stealSide_1_io_axi_mgmt_vss_0_RDATA),
    .io_axi_mgmt_vss_0_AWREADY(stealSide_1_io_axi_mgmt_vss_0_AWREADY),
    .io_axi_mgmt_vss_0_AWVALID(stealSide_1_io_axi_mgmt_vss_0_AWVALID),
    .io_axi_mgmt_vss_0_AWADDR(stealSide_1_io_axi_mgmt_vss_0_AWADDR),
    .io_axi_mgmt_vss_0_WREADY(stealSide_1_io_axi_mgmt_vss_0_WREADY),
    .io_axi_mgmt_vss_0_WVALID(stealSide_1_io_axi_mgmt_vss_0_WVALID),
    .io_axi_mgmt_vss_0_WDATA(stealSide_1_io_axi_mgmt_vss_0_WDATA),
    .io_axi_mgmt_vss_0_WSTRB(stealSide_1_io_axi_mgmt_vss_0_WSTRB),
    .io_axi_mgmt_vss_0_BREADY(stealSide_1_io_axi_mgmt_vss_0_BREADY),
    .io_axi_mgmt_vss_0_BVALID(stealSide_1_io_axi_mgmt_vss_0_BVALID),
    .io_axi_mgmt_vss_1_ARREADY(stealSide_1_io_axi_mgmt_vss_1_ARREADY),
    .io_axi_mgmt_vss_1_ARVALID(stealSide_1_io_axi_mgmt_vss_1_ARVALID),
    .io_axi_mgmt_vss_1_ARADDR(stealSide_1_io_axi_mgmt_vss_1_ARADDR),
    .io_axi_mgmt_vss_1_RREADY(stealSide_1_io_axi_mgmt_vss_1_RREADY),
    .io_axi_mgmt_vss_1_RVALID(stealSide_1_io_axi_mgmt_vss_1_RVALID),
    .io_axi_mgmt_vss_1_RDATA(stealSide_1_io_axi_mgmt_vss_1_RDATA),
    .io_axi_mgmt_vss_1_AWREADY(stealSide_1_io_axi_mgmt_vss_1_AWREADY),
    .io_axi_mgmt_vss_1_AWVALID(stealSide_1_io_axi_mgmt_vss_1_AWVALID),
    .io_axi_mgmt_vss_1_AWADDR(stealSide_1_io_axi_mgmt_vss_1_AWADDR),
    .io_axi_mgmt_vss_1_WREADY(stealSide_1_io_axi_mgmt_vss_1_WREADY),
    .io_axi_mgmt_vss_1_WVALID(stealSide_1_io_axi_mgmt_vss_1_WVALID),
    .io_axi_mgmt_vss_1_WDATA(stealSide_1_io_axi_mgmt_vss_1_WDATA),
    .io_axi_mgmt_vss_1_WSTRB(stealSide_1_io_axi_mgmt_vss_1_WSTRB),
    .io_axi_mgmt_vss_1_BREADY(stealSide_1_io_axi_mgmt_vss_1_BREADY),
    .io_axi_mgmt_vss_1_BVALID(stealSide_1_io_axi_mgmt_vss_1_BVALID),
    .io_axi_mgmt_vss_2_ARREADY(stealSide_1_io_axi_mgmt_vss_2_ARREADY),
    .io_axi_mgmt_vss_2_ARVALID(stealSide_1_io_axi_mgmt_vss_2_ARVALID),
    .io_axi_mgmt_vss_2_ARADDR(stealSide_1_io_axi_mgmt_vss_2_ARADDR),
    .io_axi_mgmt_vss_2_RREADY(stealSide_1_io_axi_mgmt_vss_2_RREADY),
    .io_axi_mgmt_vss_2_RVALID(stealSide_1_io_axi_mgmt_vss_2_RVALID),
    .io_axi_mgmt_vss_2_RDATA(stealSide_1_io_axi_mgmt_vss_2_RDATA),
    .io_axi_mgmt_vss_2_AWREADY(stealSide_1_io_axi_mgmt_vss_2_AWREADY),
    .io_axi_mgmt_vss_2_AWVALID(stealSide_1_io_axi_mgmt_vss_2_AWVALID),
    .io_axi_mgmt_vss_2_AWADDR(stealSide_1_io_axi_mgmt_vss_2_AWADDR),
    .io_axi_mgmt_vss_2_WREADY(stealSide_1_io_axi_mgmt_vss_2_WREADY),
    .io_axi_mgmt_vss_2_WVALID(stealSide_1_io_axi_mgmt_vss_2_WVALID),
    .io_axi_mgmt_vss_2_WDATA(stealSide_1_io_axi_mgmt_vss_2_WDATA),
    .io_axi_mgmt_vss_2_WSTRB(stealSide_1_io_axi_mgmt_vss_2_WSTRB),
    .io_axi_mgmt_vss_2_BREADY(stealSide_1_io_axi_mgmt_vss_2_BREADY),
    .io_axi_mgmt_vss_2_BVALID(stealSide_1_io_axi_mgmt_vss_2_BVALID),
    .io_axi_mgmt_vss_3_ARREADY(stealSide_1_io_axi_mgmt_vss_3_ARREADY),
    .io_axi_mgmt_vss_3_ARVALID(stealSide_1_io_axi_mgmt_vss_3_ARVALID),
    .io_axi_mgmt_vss_3_ARADDR(stealSide_1_io_axi_mgmt_vss_3_ARADDR),
    .io_axi_mgmt_vss_3_RREADY(stealSide_1_io_axi_mgmt_vss_3_RREADY),
    .io_axi_mgmt_vss_3_RVALID(stealSide_1_io_axi_mgmt_vss_3_RVALID),
    .io_axi_mgmt_vss_3_RDATA(stealSide_1_io_axi_mgmt_vss_3_RDATA),
    .io_axi_mgmt_vss_3_AWREADY(stealSide_1_io_axi_mgmt_vss_3_AWREADY),
    .io_axi_mgmt_vss_3_AWVALID(stealSide_1_io_axi_mgmt_vss_3_AWVALID),
    .io_axi_mgmt_vss_3_AWADDR(stealSide_1_io_axi_mgmt_vss_3_AWADDR),
    .io_axi_mgmt_vss_3_WREADY(stealSide_1_io_axi_mgmt_vss_3_WREADY),
    .io_axi_mgmt_vss_3_WVALID(stealSide_1_io_axi_mgmt_vss_3_WVALID),
    .io_axi_mgmt_vss_3_WDATA(stealSide_1_io_axi_mgmt_vss_3_WDATA),
    .io_axi_mgmt_vss_3_WSTRB(stealSide_1_io_axi_mgmt_vss_3_WSTRB),
    .io_axi_mgmt_vss_3_BREADY(stealSide_1_io_axi_mgmt_vss_3_BREADY),
    .io_axi_mgmt_vss_3_BVALID(stealSide_1_io_axi_mgmt_vss_3_BVALID),
    .io_vss_axi_full_0_ARREADY(stealSide_1_io_vss_axi_full_0_ARREADY),
    .io_vss_axi_full_0_ARVALID(stealSide_1_io_vss_axi_full_0_ARVALID),
    .io_vss_axi_full_0_ARADDR(stealSide_1_io_vss_axi_full_0_ARADDR),
    .io_vss_axi_full_0_ARLEN(stealSide_1_io_vss_axi_full_0_ARLEN),
    .io_vss_axi_full_0_RREADY(stealSide_1_io_vss_axi_full_0_RREADY),
    .io_vss_axi_full_0_RVALID(stealSide_1_io_vss_axi_full_0_RVALID),
    .io_vss_axi_full_0_RDATA(stealSide_1_io_vss_axi_full_0_RDATA),
    .io_vss_axi_full_0_AWREADY(stealSide_1_io_vss_axi_full_0_AWREADY),
    .io_vss_axi_full_0_AWVALID(stealSide_1_io_vss_axi_full_0_AWVALID),
    .io_vss_axi_full_0_AWADDR(stealSide_1_io_vss_axi_full_0_AWADDR),
    .io_vss_axi_full_0_AWLEN(stealSide_1_io_vss_axi_full_0_AWLEN),
    .io_vss_axi_full_0_WREADY(stealSide_1_io_vss_axi_full_0_WREADY),
    .io_vss_axi_full_0_WVALID(stealSide_1_io_vss_axi_full_0_WVALID),
    .io_vss_axi_full_0_WDATA(stealSide_1_io_vss_axi_full_0_WDATA),
    .io_vss_axi_full_0_WLAST(stealSide_1_io_vss_axi_full_0_WLAST),
    .io_vss_axi_full_0_BVALID(stealSide_1_io_vss_axi_full_0_BVALID),
    .io_vss_axi_full_1_ARREADY(stealSide_1_io_vss_axi_full_1_ARREADY),
    .io_vss_axi_full_1_ARVALID(stealSide_1_io_vss_axi_full_1_ARVALID),
    .io_vss_axi_full_1_ARADDR(stealSide_1_io_vss_axi_full_1_ARADDR),
    .io_vss_axi_full_1_ARLEN(stealSide_1_io_vss_axi_full_1_ARLEN),
    .io_vss_axi_full_1_RREADY(stealSide_1_io_vss_axi_full_1_RREADY),
    .io_vss_axi_full_1_RVALID(stealSide_1_io_vss_axi_full_1_RVALID),
    .io_vss_axi_full_1_RDATA(stealSide_1_io_vss_axi_full_1_RDATA),
    .io_vss_axi_full_1_AWREADY(stealSide_1_io_vss_axi_full_1_AWREADY),
    .io_vss_axi_full_1_AWVALID(stealSide_1_io_vss_axi_full_1_AWVALID),
    .io_vss_axi_full_1_AWADDR(stealSide_1_io_vss_axi_full_1_AWADDR),
    .io_vss_axi_full_1_AWLEN(stealSide_1_io_vss_axi_full_1_AWLEN),
    .io_vss_axi_full_1_WREADY(stealSide_1_io_vss_axi_full_1_WREADY),
    .io_vss_axi_full_1_WVALID(stealSide_1_io_vss_axi_full_1_WVALID),
    .io_vss_axi_full_1_WDATA(stealSide_1_io_vss_axi_full_1_WDATA),
    .io_vss_axi_full_1_WLAST(stealSide_1_io_vss_axi_full_1_WLAST),
    .io_vss_axi_full_1_BVALID(stealSide_1_io_vss_axi_full_1_BVALID),
    .io_vss_axi_full_2_ARREADY(stealSide_1_io_vss_axi_full_2_ARREADY),
    .io_vss_axi_full_2_ARVALID(stealSide_1_io_vss_axi_full_2_ARVALID),
    .io_vss_axi_full_2_ARADDR(stealSide_1_io_vss_axi_full_2_ARADDR),
    .io_vss_axi_full_2_ARLEN(stealSide_1_io_vss_axi_full_2_ARLEN),
    .io_vss_axi_full_2_RREADY(stealSide_1_io_vss_axi_full_2_RREADY),
    .io_vss_axi_full_2_RVALID(stealSide_1_io_vss_axi_full_2_RVALID),
    .io_vss_axi_full_2_RDATA(stealSide_1_io_vss_axi_full_2_RDATA),
    .io_vss_axi_full_2_AWREADY(stealSide_1_io_vss_axi_full_2_AWREADY),
    .io_vss_axi_full_2_AWVALID(stealSide_1_io_vss_axi_full_2_AWVALID),
    .io_vss_axi_full_2_AWADDR(stealSide_1_io_vss_axi_full_2_AWADDR),
    .io_vss_axi_full_2_AWLEN(stealSide_1_io_vss_axi_full_2_AWLEN),
    .io_vss_axi_full_2_WREADY(stealSide_1_io_vss_axi_full_2_WREADY),
    .io_vss_axi_full_2_WVALID(stealSide_1_io_vss_axi_full_2_WVALID),
    .io_vss_axi_full_2_WDATA(stealSide_1_io_vss_axi_full_2_WDATA),
    .io_vss_axi_full_2_WLAST(stealSide_1_io_vss_axi_full_2_WLAST),
    .io_vss_axi_full_2_BVALID(stealSide_1_io_vss_axi_full_2_BVALID),
    .io_vss_axi_full_3_ARREADY(stealSide_1_io_vss_axi_full_3_ARREADY),
    .io_vss_axi_full_3_ARVALID(stealSide_1_io_vss_axi_full_3_ARVALID),
    .io_vss_axi_full_3_ARADDR(stealSide_1_io_vss_axi_full_3_ARADDR),
    .io_vss_axi_full_3_ARLEN(stealSide_1_io_vss_axi_full_3_ARLEN),
    .io_vss_axi_full_3_RREADY(stealSide_1_io_vss_axi_full_3_RREADY),
    .io_vss_axi_full_3_RVALID(stealSide_1_io_vss_axi_full_3_RVALID),
    .io_vss_axi_full_3_RDATA(stealSide_1_io_vss_axi_full_3_RDATA),
    .io_vss_axi_full_3_AWREADY(stealSide_1_io_vss_axi_full_3_AWREADY),
    .io_vss_axi_full_3_AWVALID(stealSide_1_io_vss_axi_full_3_AWVALID),
    .io_vss_axi_full_3_AWADDR(stealSide_1_io_vss_axi_full_3_AWADDR),
    .io_vss_axi_full_3_AWLEN(stealSide_1_io_vss_axi_full_3_AWLEN),
    .io_vss_axi_full_3_WREADY(stealSide_1_io_vss_axi_full_3_WREADY),
    .io_vss_axi_full_3_WVALID(stealSide_1_io_vss_axi_full_3_WVALID),
    .io_vss_axi_full_3_WDATA(stealSide_1_io_vss_axi_full_3_WDATA),
    .io_vss_axi_full_3_WLAST(stealSide_1_io_vss_axi_full_3_WLAST),
    .io_vss_axi_full_3_BVALID(stealSide_1_io_vss_axi_full_3_BVALID),
    .io_taskOut_0_TREADY(stealSide_1_io_taskOut_0_TREADY),
    .io_taskOut_0_TVALID(stealSide_1_io_taskOut_0_TVALID),
    .io_taskOut_0_TDATA(stealSide_1_io_taskOut_0_TDATA),
    .io_taskOut_1_TREADY(stealSide_1_io_taskOut_1_TREADY),
    .io_taskOut_1_TVALID(stealSide_1_io_taskOut_1_TVALID),
    .io_taskOut_1_TDATA(stealSide_1_io_taskOut_1_TDATA),
    .io_taskOut_2_TREADY(stealSide_1_io_taskOut_2_TREADY),
    .io_taskOut_2_TVALID(stealSide_1_io_taskOut_2_TVALID),
    .io_taskOut_2_TDATA(stealSide_1_io_taskOut_2_TDATA),
    .io_taskOut_3_TREADY(stealSide_1_io_taskOut_3_TREADY),
    .io_taskOut_3_TVALID(stealSide_1_io_taskOut_3_TVALID),
    .io_taskOut_3_TDATA(stealSide_1_io_taskOut_3_TDATA),
    .io_taskIn_0_TREADY(stealSide_1_io_taskIn_0_TREADY),
    .io_taskIn_0_TVALID(stealSide_1_io_taskIn_0_TVALID),
    .io_taskIn_0_TDATA(stealSide_1_io_taskIn_0_TDATA),
    .io_taskIn_1_TREADY(stealSide_1_io_taskIn_1_TREADY),
    .io_taskIn_1_TVALID(stealSide_1_io_taskIn_1_TVALID),
    .io_taskIn_1_TDATA(stealSide_1_io_taskIn_1_TDATA),
    .io_taskIn_2_TREADY(stealSide_1_io_taskIn_2_TREADY),
    .io_taskIn_2_TVALID(stealSide_1_io_taskIn_2_TVALID),
    .io_taskIn_2_TDATA(stealSide_1_io_taskIn_2_TDATA),
    .io_taskIn_3_TREADY(stealSide_1_io_taskIn_3_TREADY),
    .io_taskIn_3_TVALID(stealSide_1_io_taskIn_3_TVALID),
    .io_taskIn_3_TDATA(stealSide_1_io_taskIn_3_TDATA)
  );
  assign sum_stealSide_axi_mgmt_vss_0_ARREADY = stealSide_io_axi_mgmt_vss_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_axi_mgmt_vss_0_RVALID = stealSide_io_axi_mgmt_vss_0_RVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_axi_mgmt_vss_0_RDATA = stealSide_io_axi_mgmt_vss_0_RDATA; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_axi_mgmt_vss_0_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_axi_mgmt_vss_0_AWREADY = stealSide_io_axi_mgmt_vss_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_axi_mgmt_vss_0_WREADY = stealSide_io_axi_mgmt_vss_0_WREADY; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_axi_mgmt_vss_0_BVALID = stealSide_io_axi_mgmt_vss_0_BVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_axi_mgmt_vss_0_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARVALID = stealSide_io_vss_axi_full_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARADDR = stealSide_io_vss_axi_full_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARLEN = stealSide_io_vss_axi_full_0_ARLEN; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARSIZE = 3'h5; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_RREADY = stealSide_io_vss_axi_full_0_RREADY; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWVALID = stealSide_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWADDR = stealSide_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWLEN = stealSide_io_vss_axi_full_0_AWLEN; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWSIZE = 3'h5; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_WVALID = stealSide_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_WDATA = stealSide_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_WSTRB = 32'hffffffff; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_WLAST = stealSide_io_vss_axi_full_0_WLAST; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_vss_axi_full_0_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_0_TVALID = stealSide_io_taskOut_0_TVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_0_TDATA = stealSide_io_taskOut_0_TDATA; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_1_TVALID = stealSide_io_taskOut_1_TVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_1_TDATA = stealSide_io_taskOut_1_TDATA; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_2_TVALID = stealSide_io_taskOut_2_TVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_2_TDATA = stealSide_io_taskOut_2_TDATA; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_3_TVALID = stealSide_io_taskOut_3_TVALID; // @[fullSysGen.scala 246:23]
  assign sum_stealSide_taskOut_3_TDATA = stealSide_io_taskOut_3_TDATA; // @[fullSysGen.scala 246:23]
  assign sum_continuationAllocationSide_contOut_0_TVALID = continuationAllocationSide_io_contOut_0_TVALID; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_contOut_0_TDATA = continuationAllocationSide_io_contOut_0_TDATA; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_contOut_1_TVALID = continuationAllocationSide_io_contOut_1_TVALID; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_contOut_1_TDATA = continuationAllocationSide_io_contOut_1_TDATA; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_contOut_2_TVALID = continuationAllocationSide_io_contOut_2_TVALID; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_contOut_2_TDATA = continuationAllocationSide_io_contOut_2_TDATA; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_contOut_3_TVALID = continuationAllocationSide_io_contOut_3_TVALID; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_contOut_3_TDATA = continuationAllocationSide_io_contOut_3_TDATA; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_ARREADY = continuationAllocationSide_io_axi_mgmt_vcas_ARREADY; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_RVALID = continuationAllocationSide_io_axi_mgmt_vcas_RVALID; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_RDATA = continuationAllocationSide_io_axi_mgmt_vcas_RDATA; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_RRESP = 2'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_AWREADY = continuationAllocationSide_io_axi_mgmt_vcas_AWREADY; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_WREADY = continuationAllocationSide_io_axi_mgmt_vcas_WREADY; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_BVALID = continuationAllocationSide_io_axi_mgmt_vcas_BVALID; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_axi_mgmt_vcas_BRESP = 2'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARVALID = continuationAllocationSide_io_vcas_axi_full_ARVALID; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARID = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARADDR = continuationAllocationSide_io_vcas_axi_full_ARADDR; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARLEN = 8'hf; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARSIZE = 3'h3; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARBURST = 2'h1; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARLOCK = 1'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARCACHE = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARPROT = 3'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARQOS = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_ARREGION = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_RREADY = continuationAllocationSide_io_vcas_axi_full_RREADY; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWVALID = 1'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWID = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWADDR = 64'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWLEN = 8'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWSIZE = 3'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWBURST = 2'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWLOCK = 1'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWCACHE = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWPROT = 3'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWQOS = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_AWREGION = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_WVALID = 1'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_WID = 4'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_WDATA = 64'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_WSTRB = 8'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_WLAST = 1'h0; // @[fullSysGen.scala 280:42]
  assign sum_continuationAllocationSide_vcas_axi_full_BREADY = 1'h0; // @[fullSysGen.scala 280:42]
  assign sum_syncSide_addrIn_0_TREADY = syncSide_io_addrIn_0_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_addrIn_1_TREADY = syncSide_io_addrIn_1_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_addrIn_2_TREADY = syncSide_io_addrIn_2_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_addrIn_3_TREADY = syncSide_io_addrIn_3_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_addrIn_4_TREADY = syncSide_io_addrIn_4_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_addrIn_5_TREADY = syncSide_io_addrIn_5_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_addrIn_6_TREADY = syncSide_io_addrIn_6_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_addrIn_7_TREADY = syncSide_io_addrIn_7_TREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARVALID = syncSide_io_axi_full_argRoute_0_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARADDR = syncSide_io_axi_full_argRoute_0_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_RREADY = syncSide_io_axi_full_argRoute_0_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWVALID = syncSide_io_axi_full_argRoute_0_AWVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWADDR = syncSide_io_axi_full_argRoute_0_AWADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_WVALID = syncSide_io_axi_full_argRoute_0_WVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_WDATA = syncSide_io_axi_full_argRoute_0_WDATA; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_WSTRB = 4'hf; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_WLAST = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_0_BREADY = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARVALID = syncSide_io_axi_full_argRoute_1_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARADDR = syncSide_io_axi_full_argRoute_1_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_RREADY = syncSide_io_axi_full_argRoute_1_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWVALID = syncSide_io_axi_full_argRoute_1_AWVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWADDR = syncSide_io_axi_full_argRoute_1_AWADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_WVALID = syncSide_io_axi_full_argRoute_1_WVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_WDATA = syncSide_io_axi_full_argRoute_1_WDATA; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_WSTRB = 4'hf; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_WLAST = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_1_BREADY = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARVALID = syncSide_io_axi_full_argRoute_2_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARADDR = syncSide_io_axi_full_argRoute_2_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_RREADY = syncSide_io_axi_full_argRoute_2_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWVALID = syncSide_io_axi_full_argRoute_2_AWVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWADDR = syncSide_io_axi_full_argRoute_2_AWADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_WVALID = syncSide_io_axi_full_argRoute_2_WVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_WDATA = syncSide_io_axi_full_argRoute_2_WDATA; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_WSTRB = 4'hf; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_WLAST = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_2_BREADY = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARVALID = syncSide_io_axi_full_argRoute_3_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARADDR = syncSide_io_axi_full_argRoute_3_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_RREADY = syncSide_io_axi_full_argRoute_3_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWVALID = syncSide_io_axi_full_argRoute_3_AWVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWADDR = syncSide_io_axi_full_argRoute_3_AWADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_WVALID = syncSide_io_axi_full_argRoute_3_WVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_WDATA = syncSide_io_axi_full_argRoute_3_WDATA; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_WSTRB = 4'hf; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_WLAST = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_3_BREADY = 1'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARVALID = syncSide_io_axi_full_argRoute_4_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARADDR = syncSide_io_axi_full_argRoute_4_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARLEN = 8'h6; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_RREADY = syncSide_io_axi_full_argRoute_4_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWADDR = 64'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWSIZE = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWBURST = 2'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_WVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_WDATA = 32'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_WSTRB = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_WLAST = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_4_BREADY = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARVALID = syncSide_io_axi_full_argRoute_5_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARADDR = syncSide_io_axi_full_argRoute_5_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARLEN = 8'h6; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_RREADY = syncSide_io_axi_full_argRoute_5_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWADDR = 64'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWSIZE = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWBURST = 2'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_WVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_WDATA = 32'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_WSTRB = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_WLAST = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_5_BREADY = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARVALID = syncSide_io_axi_full_argRoute_6_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARADDR = syncSide_io_axi_full_argRoute_6_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARLEN = 8'h6; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_RREADY = syncSide_io_axi_full_argRoute_6_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWADDR = 64'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWSIZE = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWBURST = 2'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_WVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_WDATA = 32'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_WSTRB = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_WLAST = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_6_BREADY = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARVALID = syncSide_io_axi_full_argRoute_7_ARVALID; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARADDR = syncSide_io_axi_full_argRoute_7_ARADDR; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARLEN = 8'h6; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARSIZE = 3'h2; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARBURST = 2'h1; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_ARREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_RREADY = syncSide_io_axi_full_argRoute_7_RREADY; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWADDR = 64'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWLEN = 8'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWSIZE = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWBURST = 2'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWLOCK = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWCACHE = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWPROT = 3'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWQOS = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_AWREGION = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_WVALID = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_WID = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_WDATA = 32'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_WSTRB = 4'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_WLAST = 1'h0; // @[fullSysGen.scala 296:24]
  assign sum_syncSide_axi_full_argRoute_7_BREADY = 1'h0; // @[fullSysGen.scala 296:24]
  assign fib_stealSide_axi_mgmt_vss_0_ARREADY = stealSide_1_io_axi_mgmt_vss_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_0_RVALID = stealSide_1_io_axi_mgmt_vss_0_RVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_0_RDATA = stealSide_1_io_axi_mgmt_vss_0_RDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_0_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_0_AWREADY = stealSide_1_io_axi_mgmt_vss_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_0_WREADY = stealSide_1_io_axi_mgmt_vss_0_WREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_0_BVALID = stealSide_1_io_axi_mgmt_vss_0_BVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_0_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_ARREADY = stealSide_1_io_axi_mgmt_vss_1_ARREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_RVALID = stealSide_1_io_axi_mgmt_vss_1_RVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_RDATA = stealSide_1_io_axi_mgmt_vss_1_RDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_AWREADY = stealSide_1_io_axi_mgmt_vss_1_AWREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_WREADY = stealSide_1_io_axi_mgmt_vss_1_WREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_BVALID = stealSide_1_io_axi_mgmt_vss_1_BVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_1_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_ARREADY = stealSide_1_io_axi_mgmt_vss_2_ARREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_RVALID = stealSide_1_io_axi_mgmt_vss_2_RVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_RDATA = stealSide_1_io_axi_mgmt_vss_2_RDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_AWREADY = stealSide_1_io_axi_mgmt_vss_2_AWREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_WREADY = stealSide_1_io_axi_mgmt_vss_2_WREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_BVALID = stealSide_1_io_axi_mgmt_vss_2_BVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_2_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_ARREADY = stealSide_1_io_axi_mgmt_vss_3_ARREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_RVALID = stealSide_1_io_axi_mgmt_vss_3_RVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_RDATA = stealSide_1_io_axi_mgmt_vss_3_RDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_AWREADY = stealSide_1_io_axi_mgmt_vss_3_AWREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_WREADY = stealSide_1_io_axi_mgmt_vss_3_WREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_BVALID = stealSide_1_io_axi_mgmt_vss_3_BVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_axi_mgmt_vss_3_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARVALID = stealSide_1_io_vss_axi_full_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARADDR = stealSide_1_io_vss_axi_full_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARLEN = stealSide_1_io_vss_axi_full_0_ARLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_RREADY = stealSide_1_io_vss_axi_full_0_RREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWVALID = stealSide_1_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWADDR = stealSide_1_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWLEN = stealSide_1_io_vss_axi_full_0_AWLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_WVALID = stealSide_1_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_WDATA = stealSide_1_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_WSTRB = 16'hffff; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_WLAST = stealSide_1_io_vss_axi_full_0_WLAST; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_0_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARVALID = stealSide_1_io_vss_axi_full_1_ARVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARADDR = stealSide_1_io_vss_axi_full_1_ARADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARLEN = stealSide_1_io_vss_axi_full_1_ARLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_RREADY = stealSide_1_io_vss_axi_full_1_RREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWVALID = stealSide_1_io_vss_axi_full_1_AWVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWADDR = stealSide_1_io_vss_axi_full_1_AWADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWLEN = stealSide_1_io_vss_axi_full_1_AWLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_WVALID = stealSide_1_io_vss_axi_full_1_WVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_WDATA = stealSide_1_io_vss_axi_full_1_WDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_WSTRB = 16'hffff; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_WLAST = stealSide_1_io_vss_axi_full_1_WLAST; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_1_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARVALID = stealSide_1_io_vss_axi_full_2_ARVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARADDR = stealSide_1_io_vss_axi_full_2_ARADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARLEN = stealSide_1_io_vss_axi_full_2_ARLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_RREADY = stealSide_1_io_vss_axi_full_2_RREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWVALID = stealSide_1_io_vss_axi_full_2_AWVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWADDR = stealSide_1_io_vss_axi_full_2_AWADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWLEN = stealSide_1_io_vss_axi_full_2_AWLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_WVALID = stealSide_1_io_vss_axi_full_2_WVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_WDATA = stealSide_1_io_vss_axi_full_2_WDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_WSTRB = 16'hffff; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_WLAST = stealSide_1_io_vss_axi_full_2_WLAST; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_2_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARVALID = stealSide_1_io_vss_axi_full_3_ARVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARADDR = stealSide_1_io_vss_axi_full_3_ARADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARLEN = stealSide_1_io_vss_axi_full_3_ARLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_RREADY = stealSide_1_io_vss_axi_full_3_RREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWVALID = stealSide_1_io_vss_axi_full_3_AWVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWADDR = stealSide_1_io_vss_axi_full_3_AWADDR; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWLEN = stealSide_1_io_vss_axi_full_3_AWLEN; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWSIZE = 3'h4; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_WVALID = stealSide_1_io_vss_axi_full_3_WVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_WDATA = stealSide_1_io_vss_axi_full_3_WDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_WSTRB = 16'hffff; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_WLAST = stealSide_1_io_vss_axi_full_3_WLAST; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_vss_axi_full_3_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_0_TVALID = stealSide_1_io_taskOut_0_TVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_0_TDATA = stealSide_1_io_taskOut_0_TDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_1_TVALID = stealSide_1_io_taskOut_1_TVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_1_TDATA = stealSide_1_io_taskOut_1_TDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_2_TVALID = stealSide_1_io_taskOut_2_TVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_2_TDATA = stealSide_1_io_taskOut_2_TDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_3_TVALID = stealSide_1_io_taskOut_3_TVALID; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskOut_3_TDATA = stealSide_1_io_taskOut_3_TDATA; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskIn_0_TREADY = stealSide_1_io_taskIn_0_TREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskIn_1_TREADY = stealSide_1_io_taskIn_1_TREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskIn_2_TREADY = stealSide_1_io_taskIn_2_TREADY; // @[fullSysGen.scala 246:23]
  assign fib_stealSide_taskIn_3_TREADY = stealSide_1_io_taskIn_3_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_clock = clock;
  assign stealSide_reset = reset;
  assign stealSide_io_axi_mgmt_vss_0_ARVALID = sum_stealSide_axi_mgmt_vss_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_ARADDR = sum_stealSide_axi_mgmt_vss_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_RREADY = sum_stealSide_axi_mgmt_vss_0_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_AWVALID = sum_stealSide_axi_mgmt_vss_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_AWADDR = sum_stealSide_axi_mgmt_vss_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WVALID = sum_stealSide_axi_mgmt_vss_0_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WDATA = sum_stealSide_axi_mgmt_vss_0_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WSTRB = sum_stealSide_axi_mgmt_vss_0_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_BREADY = sum_stealSide_axi_mgmt_vss_0_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_ARREADY = sum_stealSide_vss_axi_full_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_RVALID = sum_stealSide_vss_axi_full_0_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_RDATA = sum_stealSide_vss_axi_full_0_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_AWREADY = sum_stealSide_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_WREADY = sum_stealSide_vss_axi_full_0_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_BVALID = sum_stealSide_vss_axi_full_0_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_0_TREADY = sum_stealSide_taskOut_0_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_1_TREADY = sum_stealSide_taskOut_1_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_2_TREADY = sum_stealSide_taskOut_2_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_3_TREADY = sum_stealSide_taskOut_3_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_connSyncSide_0_ctrl_serveStealReq_valid = syncSide_connStealNtw_0_ctrl_serveStealReq_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_0_data_qOutTask_valid = syncSide_connStealNtw_0_data_qOutTask_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_0_data_qOutTask_bits = syncSide_connStealNtw_0_data_qOutTask_bits; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_1_ctrl_serveStealReq_valid = syncSide_connStealNtw_1_ctrl_serveStealReq_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_1_data_qOutTask_valid = syncSide_connStealNtw_1_data_qOutTask_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_1_data_qOutTask_bits = syncSide_connStealNtw_1_data_qOutTask_bits; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_2_ctrl_serveStealReq_valid = syncSide_connStealNtw_2_ctrl_serveStealReq_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_2_data_qOutTask_valid = syncSide_connStealNtw_2_data_qOutTask_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_2_data_qOutTask_bits = syncSide_connStealNtw_2_data_qOutTask_bits; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_3_ctrl_serveStealReq_valid = syncSide_connStealNtw_3_ctrl_serveStealReq_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_3_data_qOutTask_valid = syncSide_connStealNtw_3_data_qOutTask_valid; // @[fullSysGen.scala 298:39]
  assign stealSide_connSyncSide_3_data_qOutTask_bits = syncSide_connStealNtw_3_data_qOutTask_bits; // @[fullSysGen.scala 298:39]
  assign continuationAllocationSide_clock = clock;
  assign continuationAllocationSide_reset = reset;
  assign continuationAllocationSide_io_contOut_0_TREADY = sum_continuationAllocationSide_contOut_0_TREADY; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_contOut_1_TREADY = sum_continuationAllocationSide_contOut_1_TREADY; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_contOut_2_TREADY = sum_continuationAllocationSide_contOut_2_TREADY; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_contOut_3_TREADY = sum_continuationAllocationSide_contOut_3_TREADY; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_ARVALID = sum_continuationAllocationSide_axi_mgmt_vcas_ARVALID; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_ARADDR = sum_continuationAllocationSide_axi_mgmt_vcas_ARADDR; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_RREADY = sum_continuationAllocationSide_axi_mgmt_vcas_RREADY; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_AWVALID = sum_continuationAllocationSide_axi_mgmt_vcas_AWVALID; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_AWADDR = sum_continuationAllocationSide_axi_mgmt_vcas_AWADDR; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_WVALID = sum_continuationAllocationSide_axi_mgmt_vcas_WVALID; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_WDATA = sum_continuationAllocationSide_axi_mgmt_vcas_WDATA; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_WSTRB = sum_continuationAllocationSide_axi_mgmt_vcas_WSTRB; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_axi_mgmt_vcas_BREADY = sum_continuationAllocationSide_axi_mgmt_vcas_BREADY; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_vcas_axi_full_ARREADY = sum_continuationAllocationSide_vcas_axi_full_ARREADY; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_vcas_axi_full_RVALID = sum_continuationAllocationSide_vcas_axi_full_RVALID; // @[fullSysGen.scala 280:42]
  assign continuationAllocationSide_io_vcas_axi_full_RDATA = sum_continuationAllocationSide_vcas_axi_full_RDATA; // @[fullSysGen.scala 280:42]
  assign syncSide_clock = clock;
  assign syncSide_reset = reset;
  assign syncSide_io_addrIn_0_TVALID = sum_syncSide_addrIn_0_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_0_TDATA = sum_syncSide_addrIn_0_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_1_TVALID = sum_syncSide_addrIn_1_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_1_TDATA = sum_syncSide_addrIn_1_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_2_TVALID = sum_syncSide_addrIn_2_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_2_TDATA = sum_syncSide_addrIn_2_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_3_TVALID = sum_syncSide_addrIn_3_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_3_TDATA = sum_syncSide_addrIn_3_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_4_TVALID = sum_syncSide_addrIn_4_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_4_TDATA = sum_syncSide_addrIn_4_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_5_TVALID = sum_syncSide_addrIn_5_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_5_TDATA = sum_syncSide_addrIn_5_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_6_TVALID = sum_syncSide_addrIn_6_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_6_TDATA = sum_syncSide_addrIn_6_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_7_TVALID = sum_syncSide_addrIn_7_TVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_addrIn_7_TDATA = sum_syncSide_addrIn_7_TDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_0_ARREADY = sum_syncSide_axi_full_argRoute_0_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_0_RVALID = sum_syncSide_axi_full_argRoute_0_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_0_RDATA = sum_syncSide_axi_full_argRoute_0_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_0_AWREADY = sum_syncSide_axi_full_argRoute_0_AWREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_0_WREADY = sum_syncSide_axi_full_argRoute_0_WREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_0_BVALID = sum_syncSide_axi_full_argRoute_0_BVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_1_ARREADY = sum_syncSide_axi_full_argRoute_1_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_1_RVALID = sum_syncSide_axi_full_argRoute_1_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_1_RDATA = sum_syncSide_axi_full_argRoute_1_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_1_AWREADY = sum_syncSide_axi_full_argRoute_1_AWREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_1_WREADY = sum_syncSide_axi_full_argRoute_1_WREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_1_BVALID = sum_syncSide_axi_full_argRoute_1_BVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_2_ARREADY = sum_syncSide_axi_full_argRoute_2_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_2_RVALID = sum_syncSide_axi_full_argRoute_2_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_2_RDATA = sum_syncSide_axi_full_argRoute_2_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_2_AWREADY = sum_syncSide_axi_full_argRoute_2_AWREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_2_WREADY = sum_syncSide_axi_full_argRoute_2_WREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_2_BVALID = sum_syncSide_axi_full_argRoute_2_BVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_3_ARREADY = sum_syncSide_axi_full_argRoute_3_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_3_RVALID = sum_syncSide_axi_full_argRoute_3_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_3_RDATA = sum_syncSide_axi_full_argRoute_3_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_3_AWREADY = sum_syncSide_axi_full_argRoute_3_AWREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_3_WREADY = sum_syncSide_axi_full_argRoute_3_WREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_3_BVALID = sum_syncSide_axi_full_argRoute_3_BVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_4_ARREADY = sum_syncSide_axi_full_argRoute_4_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_4_RVALID = sum_syncSide_axi_full_argRoute_4_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_4_RDATA = sum_syncSide_axi_full_argRoute_4_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_5_ARREADY = sum_syncSide_axi_full_argRoute_5_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_5_RVALID = sum_syncSide_axi_full_argRoute_5_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_5_RDATA = sum_syncSide_axi_full_argRoute_5_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_6_ARREADY = sum_syncSide_axi_full_argRoute_6_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_6_RVALID = sum_syncSide_axi_full_argRoute_6_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_6_RDATA = sum_syncSide_axi_full_argRoute_6_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_7_ARREADY = sum_syncSide_axi_full_argRoute_7_ARREADY; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_7_RVALID = sum_syncSide_axi_full_argRoute_7_RVALID; // @[fullSysGen.scala 296:24]
  assign syncSide_io_axi_full_argRoute_7_RDATA = sum_syncSide_axi_full_argRoute_7_RDATA; // @[fullSysGen.scala 296:24]
  assign syncSide_connStealNtw_0_ctrl_serveStealReq_ready = stealSide_connSyncSide_0_ctrl_serveStealReq_ready; // @[fullSysGen.scala 298:39]
  assign syncSide_connStealNtw_0_data_qOutTask_ready = stealSide_connSyncSide_0_data_qOutTask_ready; // @[fullSysGen.scala 298:39]
  assign syncSide_connStealNtw_1_ctrl_serveStealReq_ready = stealSide_connSyncSide_1_ctrl_serveStealReq_ready; // @[fullSysGen.scala 298:39]
  assign syncSide_connStealNtw_1_data_qOutTask_ready = stealSide_connSyncSide_1_data_qOutTask_ready; // @[fullSysGen.scala 298:39]
  assign syncSide_connStealNtw_2_ctrl_serveStealReq_ready = stealSide_connSyncSide_2_ctrl_serveStealReq_ready; // @[fullSysGen.scala 298:39]
  assign syncSide_connStealNtw_2_data_qOutTask_ready = stealSide_connSyncSide_2_data_qOutTask_ready; // @[fullSysGen.scala 298:39]
  assign syncSide_connStealNtw_3_ctrl_serveStealReq_ready = stealSide_connSyncSide_3_ctrl_serveStealReq_ready; // @[fullSysGen.scala 298:39]
  assign syncSide_connStealNtw_3_data_qOutTask_ready = stealSide_connSyncSide_3_data_qOutTask_ready; // @[fullSysGen.scala 298:39]
  assign stealSide_1_clock = clock;
  assign stealSide_1_reset = reset;
  assign stealSide_1_io_axi_mgmt_vss_0_ARVALID = fib_stealSide_axi_mgmt_vss_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_ARADDR = fib_stealSide_axi_mgmt_vss_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_RREADY = fib_stealSide_axi_mgmt_vss_0_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_AWVALID = fib_stealSide_axi_mgmt_vss_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_AWADDR = fib_stealSide_axi_mgmt_vss_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_WVALID = fib_stealSide_axi_mgmt_vss_0_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_WDATA = fib_stealSide_axi_mgmt_vss_0_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_WSTRB = fib_stealSide_axi_mgmt_vss_0_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_0_BREADY = fib_stealSide_axi_mgmt_vss_0_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_ARVALID = fib_stealSide_axi_mgmt_vss_1_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_ARADDR = fib_stealSide_axi_mgmt_vss_1_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_RREADY = fib_stealSide_axi_mgmt_vss_1_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_AWVALID = fib_stealSide_axi_mgmt_vss_1_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_AWADDR = fib_stealSide_axi_mgmt_vss_1_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_WVALID = fib_stealSide_axi_mgmt_vss_1_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_WDATA = fib_stealSide_axi_mgmt_vss_1_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_WSTRB = fib_stealSide_axi_mgmt_vss_1_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_1_BREADY = fib_stealSide_axi_mgmt_vss_1_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_ARVALID = fib_stealSide_axi_mgmt_vss_2_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_ARADDR = fib_stealSide_axi_mgmt_vss_2_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_RREADY = fib_stealSide_axi_mgmt_vss_2_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_AWVALID = fib_stealSide_axi_mgmt_vss_2_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_AWADDR = fib_stealSide_axi_mgmt_vss_2_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_WVALID = fib_stealSide_axi_mgmt_vss_2_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_WDATA = fib_stealSide_axi_mgmt_vss_2_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_WSTRB = fib_stealSide_axi_mgmt_vss_2_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_2_BREADY = fib_stealSide_axi_mgmt_vss_2_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_ARVALID = fib_stealSide_axi_mgmt_vss_3_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_ARADDR = fib_stealSide_axi_mgmt_vss_3_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_RREADY = fib_stealSide_axi_mgmt_vss_3_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_AWVALID = fib_stealSide_axi_mgmt_vss_3_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_AWADDR = fib_stealSide_axi_mgmt_vss_3_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_WVALID = fib_stealSide_axi_mgmt_vss_3_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_WDATA = fib_stealSide_axi_mgmt_vss_3_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_WSTRB = fib_stealSide_axi_mgmt_vss_3_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_axi_mgmt_vss_3_BREADY = fib_stealSide_axi_mgmt_vss_3_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_0_ARREADY = fib_stealSide_vss_axi_full_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_0_RVALID = fib_stealSide_vss_axi_full_0_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_0_RDATA = fib_stealSide_vss_axi_full_0_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_0_AWREADY = fib_stealSide_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_0_WREADY = fib_stealSide_vss_axi_full_0_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_0_BVALID = fib_stealSide_vss_axi_full_0_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_1_ARREADY = fib_stealSide_vss_axi_full_1_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_1_RVALID = fib_stealSide_vss_axi_full_1_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_1_RDATA = fib_stealSide_vss_axi_full_1_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_1_AWREADY = fib_stealSide_vss_axi_full_1_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_1_WREADY = fib_stealSide_vss_axi_full_1_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_1_BVALID = fib_stealSide_vss_axi_full_1_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_2_ARREADY = fib_stealSide_vss_axi_full_2_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_2_RVALID = fib_stealSide_vss_axi_full_2_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_2_RDATA = fib_stealSide_vss_axi_full_2_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_2_AWREADY = fib_stealSide_vss_axi_full_2_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_2_WREADY = fib_stealSide_vss_axi_full_2_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_2_BVALID = fib_stealSide_vss_axi_full_2_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_3_ARREADY = fib_stealSide_vss_axi_full_3_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_3_RVALID = fib_stealSide_vss_axi_full_3_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_3_RDATA = fib_stealSide_vss_axi_full_3_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_3_AWREADY = fib_stealSide_vss_axi_full_3_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_3_WREADY = fib_stealSide_vss_axi_full_3_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_vss_axi_full_3_BVALID = fib_stealSide_vss_axi_full_3_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskOut_0_TREADY = fib_stealSide_taskOut_0_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskOut_1_TREADY = fib_stealSide_taskOut_1_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskOut_2_TREADY = fib_stealSide_taskOut_2_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskOut_3_TREADY = fib_stealSide_taskOut_3_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_0_TVALID = fib_stealSide_taskIn_0_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_0_TDATA = fib_stealSide_taskIn_0_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_1_TVALID = fib_stealSide_taskIn_1_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_1_TDATA = fib_stealSide_taskIn_1_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_2_TVALID = fib_stealSide_taskIn_2_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_2_TDATA = fib_stealSide_taskIn_2_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_3_TVALID = fib_stealSide_taskIn_3_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_1_io_taskIn_3_TDATA = fib_stealSide_taskIn_3_TDATA; // @[fullSysGen.scala 246:23]
endmodule
