module stealNetworkDataUnit(
  input         clock,
  input         reset,
  input  [31:0] io_taskIn,
  output [31:0] io_taskOut,
  input         io_validIn,
  output        io_validOut,
  input         io_connSS_availableTask_ready,
  output        io_connSS_availableTask_valid,
  output [31:0] io_connSS_availableTask_bits,
  output        io_connSS_qOutTask_ready,
  input         io_connSS_qOutTask_valid,
  input  [31:0] io_connSS_qOutTask_bits,
  output        io_occupied
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] taskReg; // @[stealNetworkDataUnit.scala 32:33]
  reg  validReg; // @[stealNetworkDataUnit.scala 33:33]
  wire  _T_2 = io_connSS_qOutTask_valid & ~io_validIn; // @[stealNetworkDataUnit.scala 50:41]
  wire  _GEN_2 = io_connSS_qOutTask_valid & ~io_validIn | io_validIn; // @[stealNetworkDataUnit.scala 50:56 51:32]
  assign io_taskOut = taskReg; // @[stealNetworkDataUnit.scala 63:25]
  assign io_validOut = validReg; // @[stealNetworkDataUnit.scala 64:25]
  assign io_connSS_availableTask_valid = io_connSS_availableTask_ready & io_validIn; // @[stealNetworkDataUnit.scala 45:40]
  assign io_connSS_availableTask_bits = io_connSS_availableTask_ready & io_validIn ? io_taskIn : 32'h0; // @[stealNetworkDataUnit.scala 42:35 45:54 49:37]
  assign io_connSS_qOutTask_ready = io_connSS_availableTask_ready & io_validIn ? 1'h0 : _T_2; // @[stealNetworkDataUnit.scala 41:30 45:54]
  assign io_occupied = validReg; // @[stealNetworkDataUnit.scala 65:25]
  always @(posedge clock) begin
    if (reset) begin // @[stealNetworkDataUnit.scala 32:33]
      taskReg <= 32'h0; // @[stealNetworkDataUnit.scala 32:33]
    end else if (io_connSS_availableTask_ready & io_validIn) begin // @[stealNetworkDataUnit.scala 45:54]
      taskReg <= 32'h0; // @[stealNetworkDataUnit.scala 47:37]
    end else if (io_connSS_qOutTask_valid & ~io_validIn) begin // @[stealNetworkDataUnit.scala 50:56]
      taskReg <= io_connSS_qOutTask_bits; // @[stealNetworkDataUnit.scala 52:32]
    end else if (io_validIn) begin // @[stealNetworkDataUnit.scala 54:27]
      taskReg <= io_taskIn; // @[stealNetworkDataUnit.scala 56:19]
    end else begin
      taskReg <= 32'h0; // @[stealNetworkDataUnit.scala 59:22]
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
  _RAND_0 = {1{`RANDOM}};
  taskReg = _RAND_0[31:0];
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
  input         clock,
  input         reset,
  output        io_connSS_0_ctrl_serveStealReq_ready,
  input         io_connSS_0_ctrl_serveStealReq_valid,
  input         io_connSS_0_data_availableTask_ready,
  output        io_connSS_0_data_availableTask_valid,
  output [31:0] io_connSS_0_data_availableTask_bits,
  output        io_connSS_0_data_qOutTask_ready,
  input         io_connSS_0_data_qOutTask_valid,
  input  [31:0] io_connSS_0_data_qOutTask_bits,
  output        io_connSS_1_ctrl_serveStealReq_ready,
  input         io_connSS_1_ctrl_serveStealReq_valid,
  output        io_connSS_1_ctrl_stealReq_ready,
  input         io_connSS_1_ctrl_stealReq_valid,
  input         io_connSS_1_data_availableTask_ready,
  output        io_connSS_1_data_availableTask_valid,
  output [31:0] io_connSS_1_data_availableTask_bits,
  output        io_connSS_1_data_qOutTask_ready,
  input         io_connSS_1_data_qOutTask_valid,
  input  [31:0] io_connSS_1_data_qOutTask_bits,
  output        io_connSS_2_ctrl_serveStealReq_ready,
  input         io_connSS_2_ctrl_serveStealReq_valid,
  output        io_connSS_2_ctrl_stealReq_ready,
  input         io_connSS_2_ctrl_stealReq_valid,
  input         io_connSS_2_data_availableTask_ready,
  output        io_connSS_2_data_availableTask_valid,
  output [31:0] io_connSS_2_data_availableTask_bits,
  output        io_connSS_2_data_qOutTask_ready,
  input         io_connSS_2_data_qOutTask_valid,
  input  [31:0] io_connSS_2_data_qOutTask_bits,
  output        io_connSS_3_ctrl_serveStealReq_ready,
  input         io_connSS_3_ctrl_serveStealReq_valid,
  output        io_connSS_3_ctrl_stealReq_ready,
  input         io_connSS_3_ctrl_stealReq_valid,
  input         io_connSS_3_data_availableTask_ready,
  output        io_connSS_3_data_availableTask_valid,
  output [31:0] io_connSS_3_data_availableTask_bits,
  output        io_connSS_3_data_qOutTask_ready,
  input         io_connSS_3_data_qOutTask_valid,
  input  [31:0] io_connSS_3_data_qOutTask_bits,
  output        io_connSS_4_ctrl_serveStealReq_ready,
  input         io_connSS_4_ctrl_serveStealReq_valid,
  output        io_connSS_4_ctrl_stealReq_ready,
  input         io_connSS_4_ctrl_stealReq_valid,
  input         io_connSS_4_data_availableTask_ready,
  output        io_connSS_4_data_availableTask_valid,
  output [31:0] io_connSS_4_data_availableTask_bits,
  output        io_connSS_4_data_qOutTask_ready,
  input         io_connSS_4_data_qOutTask_valid,
  input  [31:0] io_connSS_4_data_qOutTask_bits,
  output        io_connSS_5_ctrl_serveStealReq_ready,
  input         io_connSS_5_ctrl_serveStealReq_valid,
  input         io_connSS_5_data_availableTask_ready,
  output        io_connSS_5_data_availableTask_valid,
  output [31:0] io_connSS_5_data_availableTask_bits,
  output        io_connSS_5_data_qOutTask_ready,
  input         io_connSS_5_data_qOutTask_valid,
  input  [31:0] io_connSS_5_data_qOutTask_bits,
  output        io_connSS_6_ctrl_serveStealReq_ready,
  input         io_connSS_6_ctrl_serveStealReq_valid,
  output        io_connSS_6_ctrl_stealReq_ready,
  input         io_connSS_6_ctrl_stealReq_valid,
  input         io_connSS_6_data_availableTask_ready,
  output        io_connSS_6_data_availableTask_valid,
  output [31:0] io_connSS_6_data_availableTask_bits,
  output        io_connSS_6_data_qOutTask_ready,
  input         io_connSS_6_data_qOutTask_valid,
  input  [31:0] io_connSS_6_data_qOutTask_bits,
  output        io_connSS_7_ctrl_serveStealReq_ready,
  input         io_connSS_7_ctrl_serveStealReq_valid,
  output        io_connSS_7_ctrl_stealReq_ready,
  input         io_connSS_7_ctrl_stealReq_valid,
  input         io_connSS_7_data_availableTask_ready,
  output        io_connSS_7_data_availableTask_valid,
  output [31:0] io_connSS_7_data_availableTask_bits,
  output        io_connSS_7_data_qOutTask_ready,
  input         io_connSS_7_data_qOutTask_valid,
  input  [31:0] io_connSS_7_data_qOutTask_bits,
  output        io_connSS_8_ctrl_serveStealReq_ready,
  input         io_connSS_8_ctrl_serveStealReq_valid,
  output        io_connSS_8_ctrl_stealReq_ready,
  input         io_connSS_8_ctrl_stealReq_valid,
  input         io_connSS_8_data_availableTask_ready,
  output        io_connSS_8_data_availableTask_valid,
  output [31:0] io_connSS_8_data_availableTask_bits,
  output        io_connSS_8_data_qOutTask_ready,
  input         io_connSS_8_data_qOutTask_valid,
  input  [31:0] io_connSS_8_data_qOutTask_bits,
  output        io_connSS_9_ctrl_serveStealReq_ready,
  input         io_connSS_9_ctrl_serveStealReq_valid,
  output        io_connSS_9_ctrl_stealReq_ready,
  input         io_connSS_9_ctrl_stealReq_valid,
  input         io_connSS_9_data_availableTask_ready,
  output        io_connSS_9_data_availableTask_valid,
  output [31:0] io_connSS_9_data_availableTask_bits,
  output        io_connSS_9_data_qOutTask_ready,
  input         io_connSS_9_data_qOutTask_valid,
  input  [31:0] io_connSS_9_data_qOutTask_bits,
  output        io_connSS_10_ctrl_serveStealReq_ready,
  input         io_connSS_10_ctrl_serveStealReq_valid,
  input         io_connSS_10_data_availableTask_ready,
  output        io_connSS_10_data_availableTask_valid,
  output [31:0] io_connSS_10_data_availableTask_bits,
  output        io_connSS_10_data_qOutTask_ready,
  input         io_connSS_10_data_qOutTask_valid,
  input  [31:0] io_connSS_10_data_qOutTask_bits,
  output        io_connSS_11_ctrl_serveStealReq_ready,
  input         io_connSS_11_ctrl_serveStealReq_valid,
  output        io_connSS_11_ctrl_stealReq_ready,
  input         io_connSS_11_ctrl_stealReq_valid,
  input         io_connSS_11_data_availableTask_ready,
  output        io_connSS_11_data_availableTask_valid,
  output [31:0] io_connSS_11_data_availableTask_bits,
  output        io_connSS_11_data_qOutTask_ready,
  input         io_connSS_11_data_qOutTask_valid,
  input  [31:0] io_connSS_11_data_qOutTask_bits,
  output        io_connSS_12_ctrl_serveStealReq_ready,
  input         io_connSS_12_ctrl_serveStealReq_valid,
  output        io_connSS_12_ctrl_stealReq_ready,
  input         io_connSS_12_ctrl_stealReq_valid,
  input         io_connSS_12_data_availableTask_ready,
  output        io_connSS_12_data_availableTask_valid,
  output [31:0] io_connSS_12_data_availableTask_bits,
  output        io_connSS_12_data_qOutTask_ready,
  input         io_connSS_12_data_qOutTask_valid,
  input  [31:0] io_connSS_12_data_qOutTask_bits,
  output        io_connSS_13_ctrl_serveStealReq_ready,
  input         io_connSS_13_ctrl_serveStealReq_valid,
  output        io_connSS_13_ctrl_stealReq_ready,
  input         io_connSS_13_ctrl_stealReq_valid,
  input         io_connSS_13_data_availableTask_ready,
  output        io_connSS_13_data_availableTask_valid,
  output [31:0] io_connSS_13_data_availableTask_bits,
  output        io_connSS_13_data_qOutTask_ready,
  input         io_connSS_13_data_qOutTask_valid,
  input  [31:0] io_connSS_13_data_qOutTask_bits,
  output        io_connSS_14_ctrl_serveStealReq_ready,
  input         io_connSS_14_ctrl_serveStealReq_valid,
  output        io_connSS_14_ctrl_stealReq_ready,
  input         io_connSS_14_ctrl_stealReq_valid,
  input         io_connSS_14_data_availableTask_ready,
  output        io_connSS_14_data_availableTask_valid,
  output [31:0] io_connSS_14_data_availableTask_bits,
  output        io_connSS_14_data_qOutTask_ready,
  input         io_connSS_14_data_qOutTask_valid,
  input  [31:0] io_connSS_14_data_qOutTask_bits,
  output        io_connSS_15_ctrl_serveStealReq_ready,
  input         io_connSS_15_ctrl_serveStealReq_valid,
  input         io_connSS_15_data_availableTask_ready,
  output        io_connSS_15_data_availableTask_valid,
  output [31:0] io_connSS_15_data_availableTask_bits,
  output        io_connSS_15_data_qOutTask_ready,
  input         io_connSS_15_data_qOutTask_valid,
  input  [31:0] io_connSS_15_data_qOutTask_bits,
  output        io_connSS_16_ctrl_serveStealReq_ready,
  input         io_connSS_16_ctrl_serveStealReq_valid,
  output        io_connSS_16_ctrl_stealReq_ready,
  input         io_connSS_16_ctrl_stealReq_valid,
  input         io_connSS_16_data_availableTask_ready,
  output        io_connSS_16_data_availableTask_valid,
  output [31:0] io_connSS_16_data_availableTask_bits,
  output        io_connSS_16_data_qOutTask_ready,
  input         io_connSS_16_data_qOutTask_valid,
  input  [31:0] io_connSS_16_data_qOutTask_bits,
  output        io_connSS_17_ctrl_serveStealReq_ready,
  input         io_connSS_17_ctrl_serveStealReq_valid,
  output        io_connSS_17_ctrl_stealReq_ready,
  input         io_connSS_17_ctrl_stealReq_valid,
  input         io_connSS_17_data_availableTask_ready,
  output        io_connSS_17_data_availableTask_valid,
  output [31:0] io_connSS_17_data_availableTask_bits,
  output        io_connSS_17_data_qOutTask_ready,
  input         io_connSS_17_data_qOutTask_valid,
  input  [31:0] io_connSS_17_data_qOutTask_bits,
  output        io_connSS_18_ctrl_serveStealReq_ready,
  input         io_connSS_18_ctrl_serveStealReq_valid,
  output        io_connSS_18_ctrl_stealReq_ready,
  input         io_connSS_18_ctrl_stealReq_valid,
  input         io_connSS_18_data_availableTask_ready,
  output        io_connSS_18_data_availableTask_valid,
  output [31:0] io_connSS_18_data_availableTask_bits,
  output        io_connSS_18_data_qOutTask_ready,
  input         io_connSS_18_data_qOutTask_valid,
  input  [31:0] io_connSS_18_data_qOutTask_bits,
  output        io_connSS_19_ctrl_serveStealReq_ready,
  input         io_connSS_19_ctrl_serveStealReq_valid,
  output        io_connSS_19_ctrl_stealReq_ready,
  input         io_connSS_19_ctrl_stealReq_valid,
  input         io_connSS_19_data_availableTask_ready,
  output        io_connSS_19_data_availableTask_valid,
  output [31:0] io_connSS_19_data_availableTask_bits,
  output        io_connSS_19_data_qOutTask_ready,
  input         io_connSS_19_data_qOutTask_valid,
  input  [31:0] io_connSS_19_data_qOutTask_bits,
  output        io_connSS_20_ctrl_serveStealReq_ready,
  input         io_connSS_20_ctrl_serveStealReq_valid,
  input         io_connSS_20_data_availableTask_ready,
  output        io_connSS_20_data_availableTask_valid,
  output [31:0] io_connSS_20_data_availableTask_bits,
  output        io_connSS_20_data_qOutTask_ready,
  input         io_connSS_20_data_qOutTask_valid,
  input  [31:0] io_connSS_20_data_qOutTask_bits,
  output        io_connSS_21_ctrl_serveStealReq_ready,
  input         io_connSS_21_ctrl_serveStealReq_valid,
  output        io_connSS_21_ctrl_stealReq_ready,
  input         io_connSS_21_ctrl_stealReq_valid,
  input         io_connSS_21_data_availableTask_ready,
  output        io_connSS_21_data_availableTask_valid,
  output [31:0] io_connSS_21_data_availableTask_bits,
  output        io_connSS_21_data_qOutTask_ready,
  input         io_connSS_21_data_qOutTask_valid,
  input  [31:0] io_connSS_21_data_qOutTask_bits,
  output        io_connSS_22_ctrl_serveStealReq_ready,
  input         io_connSS_22_ctrl_serveStealReq_valid,
  output        io_connSS_22_ctrl_stealReq_ready,
  input         io_connSS_22_ctrl_stealReq_valid,
  input         io_connSS_22_data_availableTask_ready,
  output        io_connSS_22_data_availableTask_valid,
  output [31:0] io_connSS_22_data_availableTask_bits,
  output        io_connSS_22_data_qOutTask_ready,
  input         io_connSS_22_data_qOutTask_valid,
  input  [31:0] io_connSS_22_data_qOutTask_bits,
  output        io_connSS_23_ctrl_serveStealReq_ready,
  input         io_connSS_23_ctrl_serveStealReq_valid,
  output        io_connSS_23_ctrl_stealReq_ready,
  input         io_connSS_23_ctrl_stealReq_valid,
  input         io_connSS_23_data_availableTask_ready,
  output        io_connSS_23_data_availableTask_valid,
  output [31:0] io_connSS_23_data_availableTask_bits,
  output        io_connSS_23_data_qOutTask_ready,
  input         io_connSS_23_data_qOutTask_valid,
  input  [31:0] io_connSS_23_data_qOutTask_bits,
  output        io_connSS_24_ctrl_serveStealReq_ready,
  input         io_connSS_24_ctrl_serveStealReq_valid,
  output        io_connSS_24_ctrl_stealReq_ready,
  input         io_connSS_24_ctrl_stealReq_valid,
  input         io_connSS_24_data_availableTask_ready,
  output        io_connSS_24_data_availableTask_valid,
  output [31:0] io_connSS_24_data_availableTask_bits,
  output        io_connSS_24_data_qOutTask_ready,
  input         io_connSS_24_data_qOutTask_valid,
  input  [31:0] io_connSS_24_data_qOutTask_bits,
  output        io_connSS_25_ctrl_serveStealReq_ready,
  input         io_connSS_25_ctrl_serveStealReq_valid,
  output        io_connSS_25_ctrl_stealReq_ready,
  input         io_connSS_25_ctrl_stealReq_valid,
  input         io_connSS_25_data_availableTask_ready,
  output        io_connSS_25_data_availableTask_valid,
  output [31:0] io_connSS_25_data_availableTask_bits,
  output        io_connSS_25_data_qOutTask_ready,
  input         io_connSS_25_data_qOutTask_valid,
  input  [31:0] io_connSS_25_data_qOutTask_bits,
  output        io_connSS_26_ctrl_serveStealReq_ready,
  input         io_connSS_26_ctrl_serveStealReq_valid,
  output        io_connSS_26_ctrl_stealReq_ready,
  input         io_connSS_26_ctrl_stealReq_valid,
  input         io_connSS_26_data_availableTask_ready,
  output        io_connSS_26_data_availableTask_valid,
  output [31:0] io_connSS_26_data_availableTask_bits,
  output        io_connSS_26_data_qOutTask_ready,
  input         io_connSS_26_data_qOutTask_valid,
  input  [31:0] io_connSS_26_data_qOutTask_bits,
  output        io_connSS_27_ctrl_serveStealReq_ready,
  input         io_connSS_27_ctrl_serveStealReq_valid,
  output        io_connSS_27_ctrl_stealReq_ready,
  input         io_connSS_27_ctrl_stealReq_valid,
  input         io_connSS_27_data_availableTask_ready,
  output        io_connSS_27_data_availableTask_valid,
  output [31:0] io_connSS_27_data_availableTask_bits,
  output        io_connSS_27_data_qOutTask_ready,
  input         io_connSS_27_data_qOutTask_valid,
  input  [31:0] io_connSS_27_data_qOutTask_bits,
  output        io_connSS_28_ctrl_serveStealReq_ready,
  input         io_connSS_28_ctrl_serveStealReq_valid,
  output        io_connSS_28_ctrl_stealReq_ready,
  input         io_connSS_28_ctrl_stealReq_valid,
  input         io_connSS_28_data_availableTask_ready,
  output        io_connSS_28_data_availableTask_valid,
  output [31:0] io_connSS_28_data_availableTask_bits,
  output        io_connSS_28_data_qOutTask_ready,
  input         io_connSS_28_data_qOutTask_valid,
  input  [31:0] io_connSS_28_data_qOutTask_bits,
  output        io_ntwDataUnitOccupancyVSS_0,
  output        io_ntwDataUnitOccupancyVSS_1,
  output        io_ntwDataUnitOccupancyVSS_2,
  output        io_ntwDataUnitOccupancyVSS_3,
  output        io_ntwDataUnitOccupancyVSS_4
);
  wire  dataUnits_0_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_0_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_0_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_0_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_0_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_1_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_1_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_1_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_1_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_2_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_2_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_2_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_2_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_3_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_3_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_3_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_3_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_4_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_4_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_4_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_5_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_5_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_5_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_5_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_5_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_6_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_6_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_6_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_6_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_6_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_7_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_7_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_7_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_7_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_7_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_8_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_8_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_8_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_8_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_8_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_9_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_9_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_9_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_9_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_9_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_10_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_10_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_10_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_10_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_10_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_11_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_11_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_11_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_11_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_11_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_12_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_12_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_12_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_12_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_12_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_13_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_13_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_13_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_13_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_13_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_14_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_14_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_14_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_14_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_14_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_15_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_15_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_15_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_15_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_15_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_16_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_16_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_16_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_16_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_16_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_17_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_17_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_17_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_17_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_17_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_18_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_18_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_18_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_18_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_18_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_19_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_19_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_19_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_19_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_19_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_20_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_20_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_20_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_20_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_20_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_21_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_21_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_21_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_21_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_21_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_22_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_22_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_22_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_22_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_22_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_23_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_23_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_23_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_23_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_23_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_24_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_24_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_24_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_24_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_24_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_25_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_25_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_25_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_25_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_25_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_26_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_26_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_26_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_26_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_26_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_27_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_27_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_27_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_27_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_27_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_reset; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_28_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_28_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_28_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [31:0] dataUnits_28_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_28_io_occupied; // @[stealNetwork.scala 23:42]
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
  wire  ctrlunits_9_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_9_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_9_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_9_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_9_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_9_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_9_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_9_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_10_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_11_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_12_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_13_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_14_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_15_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_16_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_17_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_18_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_19_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_20_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_21_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_22_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_23_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_24_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_25_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_26_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_27_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_clock; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_reset; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_io_reqTaskIn; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_io_reqTaskOut; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_io_connSS_serveStealReq_valid; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_io_connSS_stealReq_ready; // @[stealNetwork.scala 25:42]
  wire  ctrlunits_28_io_connSS_stealReq_valid; // @[stealNetwork.scala 25:42]
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
  stealNetworkDataUnit dataUnits_9 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_9_clock),
    .reset(dataUnits_9_reset),
    .io_taskIn(dataUnits_9_io_taskIn),
    .io_taskOut(dataUnits_9_io_taskOut),
    .io_validIn(dataUnits_9_io_validIn),
    .io_validOut(dataUnits_9_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_9_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_9_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_9_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_9_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_9_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_9_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_9_io_occupied)
  );
  stealNetworkDataUnit dataUnits_10 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_10_clock),
    .reset(dataUnits_10_reset),
    .io_taskIn(dataUnits_10_io_taskIn),
    .io_taskOut(dataUnits_10_io_taskOut),
    .io_validIn(dataUnits_10_io_validIn),
    .io_validOut(dataUnits_10_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_10_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_10_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_10_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_10_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_10_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_10_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_10_io_occupied)
  );
  stealNetworkDataUnit dataUnits_11 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_11_clock),
    .reset(dataUnits_11_reset),
    .io_taskIn(dataUnits_11_io_taskIn),
    .io_taskOut(dataUnits_11_io_taskOut),
    .io_validIn(dataUnits_11_io_validIn),
    .io_validOut(dataUnits_11_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_11_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_11_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_11_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_11_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_11_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_11_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_11_io_occupied)
  );
  stealNetworkDataUnit dataUnits_12 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_12_clock),
    .reset(dataUnits_12_reset),
    .io_taskIn(dataUnits_12_io_taskIn),
    .io_taskOut(dataUnits_12_io_taskOut),
    .io_validIn(dataUnits_12_io_validIn),
    .io_validOut(dataUnits_12_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_12_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_12_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_12_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_12_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_12_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_12_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_12_io_occupied)
  );
  stealNetworkDataUnit dataUnits_13 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_13_clock),
    .reset(dataUnits_13_reset),
    .io_taskIn(dataUnits_13_io_taskIn),
    .io_taskOut(dataUnits_13_io_taskOut),
    .io_validIn(dataUnits_13_io_validIn),
    .io_validOut(dataUnits_13_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_13_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_13_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_13_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_13_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_13_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_13_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_13_io_occupied)
  );
  stealNetworkDataUnit dataUnits_14 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_14_clock),
    .reset(dataUnits_14_reset),
    .io_taskIn(dataUnits_14_io_taskIn),
    .io_taskOut(dataUnits_14_io_taskOut),
    .io_validIn(dataUnits_14_io_validIn),
    .io_validOut(dataUnits_14_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_14_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_14_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_14_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_14_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_14_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_14_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_14_io_occupied)
  );
  stealNetworkDataUnit dataUnits_15 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_15_clock),
    .reset(dataUnits_15_reset),
    .io_taskIn(dataUnits_15_io_taskIn),
    .io_taskOut(dataUnits_15_io_taskOut),
    .io_validIn(dataUnits_15_io_validIn),
    .io_validOut(dataUnits_15_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_15_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_15_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_15_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_15_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_15_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_15_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_15_io_occupied)
  );
  stealNetworkDataUnit dataUnits_16 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_16_clock),
    .reset(dataUnits_16_reset),
    .io_taskIn(dataUnits_16_io_taskIn),
    .io_taskOut(dataUnits_16_io_taskOut),
    .io_validIn(dataUnits_16_io_validIn),
    .io_validOut(dataUnits_16_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_16_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_16_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_16_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_16_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_16_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_16_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_16_io_occupied)
  );
  stealNetworkDataUnit dataUnits_17 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_17_clock),
    .reset(dataUnits_17_reset),
    .io_taskIn(dataUnits_17_io_taskIn),
    .io_taskOut(dataUnits_17_io_taskOut),
    .io_validIn(dataUnits_17_io_validIn),
    .io_validOut(dataUnits_17_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_17_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_17_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_17_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_17_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_17_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_17_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_17_io_occupied)
  );
  stealNetworkDataUnit dataUnits_18 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_18_clock),
    .reset(dataUnits_18_reset),
    .io_taskIn(dataUnits_18_io_taskIn),
    .io_taskOut(dataUnits_18_io_taskOut),
    .io_validIn(dataUnits_18_io_validIn),
    .io_validOut(dataUnits_18_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_18_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_18_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_18_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_18_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_18_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_18_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_18_io_occupied)
  );
  stealNetworkDataUnit dataUnits_19 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_19_clock),
    .reset(dataUnits_19_reset),
    .io_taskIn(dataUnits_19_io_taskIn),
    .io_taskOut(dataUnits_19_io_taskOut),
    .io_validIn(dataUnits_19_io_validIn),
    .io_validOut(dataUnits_19_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_19_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_19_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_19_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_19_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_19_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_19_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_19_io_occupied)
  );
  stealNetworkDataUnit dataUnits_20 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_20_clock),
    .reset(dataUnits_20_reset),
    .io_taskIn(dataUnits_20_io_taskIn),
    .io_taskOut(dataUnits_20_io_taskOut),
    .io_validIn(dataUnits_20_io_validIn),
    .io_validOut(dataUnits_20_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_20_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_20_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_20_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_20_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_20_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_20_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_20_io_occupied)
  );
  stealNetworkDataUnit dataUnits_21 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_21_clock),
    .reset(dataUnits_21_reset),
    .io_taskIn(dataUnits_21_io_taskIn),
    .io_taskOut(dataUnits_21_io_taskOut),
    .io_validIn(dataUnits_21_io_validIn),
    .io_validOut(dataUnits_21_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_21_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_21_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_21_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_21_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_21_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_21_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_21_io_occupied)
  );
  stealNetworkDataUnit dataUnits_22 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_22_clock),
    .reset(dataUnits_22_reset),
    .io_taskIn(dataUnits_22_io_taskIn),
    .io_taskOut(dataUnits_22_io_taskOut),
    .io_validIn(dataUnits_22_io_validIn),
    .io_validOut(dataUnits_22_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_22_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_22_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_22_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_22_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_22_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_22_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_22_io_occupied)
  );
  stealNetworkDataUnit dataUnits_23 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_23_clock),
    .reset(dataUnits_23_reset),
    .io_taskIn(dataUnits_23_io_taskIn),
    .io_taskOut(dataUnits_23_io_taskOut),
    .io_validIn(dataUnits_23_io_validIn),
    .io_validOut(dataUnits_23_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_23_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_23_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_23_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_23_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_23_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_23_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_23_io_occupied)
  );
  stealNetworkDataUnit dataUnits_24 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_24_clock),
    .reset(dataUnits_24_reset),
    .io_taskIn(dataUnits_24_io_taskIn),
    .io_taskOut(dataUnits_24_io_taskOut),
    .io_validIn(dataUnits_24_io_validIn),
    .io_validOut(dataUnits_24_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_24_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_24_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_24_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_24_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_24_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_24_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_24_io_occupied)
  );
  stealNetworkDataUnit dataUnits_25 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_25_clock),
    .reset(dataUnits_25_reset),
    .io_taskIn(dataUnits_25_io_taskIn),
    .io_taskOut(dataUnits_25_io_taskOut),
    .io_validIn(dataUnits_25_io_validIn),
    .io_validOut(dataUnits_25_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_25_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_25_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_25_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_25_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_25_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_25_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_25_io_occupied)
  );
  stealNetworkDataUnit dataUnits_26 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_26_clock),
    .reset(dataUnits_26_reset),
    .io_taskIn(dataUnits_26_io_taskIn),
    .io_taskOut(dataUnits_26_io_taskOut),
    .io_validIn(dataUnits_26_io_validIn),
    .io_validOut(dataUnits_26_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_26_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_26_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_26_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_26_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_26_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_26_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_26_io_occupied)
  );
  stealNetworkDataUnit dataUnits_27 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_27_clock),
    .reset(dataUnits_27_reset),
    .io_taskIn(dataUnits_27_io_taskIn),
    .io_taskOut(dataUnits_27_io_taskOut),
    .io_validIn(dataUnits_27_io_validIn),
    .io_validOut(dataUnits_27_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_27_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_27_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_27_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_27_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_27_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_27_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_27_io_occupied)
  );
  stealNetworkDataUnit dataUnits_28 ( // @[stealNetwork.scala 23:42]
    .clock(dataUnits_28_clock),
    .reset(dataUnits_28_reset),
    .io_taskIn(dataUnits_28_io_taskIn),
    .io_taskOut(dataUnits_28_io_taskOut),
    .io_validIn(dataUnits_28_io_validIn),
    .io_validOut(dataUnits_28_io_validOut),
    .io_connSS_availableTask_ready(dataUnits_28_io_connSS_availableTask_ready),
    .io_connSS_availableTask_valid(dataUnits_28_io_connSS_availableTask_valid),
    .io_connSS_availableTask_bits(dataUnits_28_io_connSS_availableTask_bits),
    .io_connSS_qOutTask_ready(dataUnits_28_io_connSS_qOutTask_ready),
    .io_connSS_qOutTask_valid(dataUnits_28_io_connSS_qOutTask_valid),
    .io_connSS_qOutTask_bits(dataUnits_28_io_connSS_qOutTask_bits),
    .io_occupied(dataUnits_28_io_occupied)
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
  stealNetworkCtrlUnit ctrlunits_9 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_9_clock),
    .reset(ctrlunits_9_reset),
    .io_reqTaskIn(ctrlunits_9_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_9_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_9_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_9_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_9_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_9_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_10 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_10_clock),
    .reset(ctrlunits_10_reset),
    .io_reqTaskIn(ctrlunits_10_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_10_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_10_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_10_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_10_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_10_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_11 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_11_clock),
    .reset(ctrlunits_11_reset),
    .io_reqTaskIn(ctrlunits_11_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_11_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_11_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_11_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_11_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_11_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_12 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_12_clock),
    .reset(ctrlunits_12_reset),
    .io_reqTaskIn(ctrlunits_12_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_12_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_12_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_12_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_12_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_12_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_13 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_13_clock),
    .reset(ctrlunits_13_reset),
    .io_reqTaskIn(ctrlunits_13_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_13_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_13_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_13_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_13_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_13_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_14 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_14_clock),
    .reset(ctrlunits_14_reset),
    .io_reqTaskIn(ctrlunits_14_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_14_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_14_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_14_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_14_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_14_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_15 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_15_clock),
    .reset(ctrlunits_15_reset),
    .io_reqTaskIn(ctrlunits_15_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_15_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_15_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_15_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_15_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_15_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_16 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_16_clock),
    .reset(ctrlunits_16_reset),
    .io_reqTaskIn(ctrlunits_16_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_16_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_16_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_16_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_16_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_16_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_17 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_17_clock),
    .reset(ctrlunits_17_reset),
    .io_reqTaskIn(ctrlunits_17_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_17_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_17_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_17_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_17_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_17_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_18 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_18_clock),
    .reset(ctrlunits_18_reset),
    .io_reqTaskIn(ctrlunits_18_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_18_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_18_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_18_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_18_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_18_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_19 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_19_clock),
    .reset(ctrlunits_19_reset),
    .io_reqTaskIn(ctrlunits_19_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_19_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_19_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_19_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_19_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_19_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_20 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_20_clock),
    .reset(ctrlunits_20_reset),
    .io_reqTaskIn(ctrlunits_20_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_20_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_20_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_20_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_20_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_20_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_21 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_21_clock),
    .reset(ctrlunits_21_reset),
    .io_reqTaskIn(ctrlunits_21_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_21_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_21_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_21_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_21_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_21_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_22 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_22_clock),
    .reset(ctrlunits_22_reset),
    .io_reqTaskIn(ctrlunits_22_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_22_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_22_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_22_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_22_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_22_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_23 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_23_clock),
    .reset(ctrlunits_23_reset),
    .io_reqTaskIn(ctrlunits_23_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_23_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_23_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_23_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_23_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_23_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_24 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_24_clock),
    .reset(ctrlunits_24_reset),
    .io_reqTaskIn(ctrlunits_24_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_24_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_24_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_24_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_24_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_24_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_25 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_25_clock),
    .reset(ctrlunits_25_reset),
    .io_reqTaskIn(ctrlunits_25_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_25_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_25_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_25_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_25_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_25_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_26 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_26_clock),
    .reset(ctrlunits_26_reset),
    .io_reqTaskIn(ctrlunits_26_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_26_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_26_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_26_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_26_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_26_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_27 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_27_clock),
    .reset(ctrlunits_27_reset),
    .io_reqTaskIn(ctrlunits_27_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_27_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_27_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_27_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_27_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_27_io_connSS_stealReq_valid)
  );
  stealNetworkCtrlUnit ctrlunits_28 ( // @[stealNetwork.scala 25:42]
    .clock(ctrlunits_28_clock),
    .reset(ctrlunits_28_reset),
    .io_reqTaskIn(ctrlunits_28_io_reqTaskIn),
    .io_reqTaskOut(ctrlunits_28_io_reqTaskOut),
    .io_connSS_serveStealReq_ready(ctrlunits_28_io_connSS_serveStealReq_ready),
    .io_connSS_serveStealReq_valid(ctrlunits_28_io_connSS_serveStealReq_valid),
    .io_connSS_stealReq_ready(ctrlunits_28_io_connSS_stealReq_ready),
    .io_connSS_stealReq_valid(ctrlunits_28_io_connSS_stealReq_valid)
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
  assign io_connSS_2_ctrl_stealReq_ready = ctrlunits_2_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_2_data_availableTask_valid = dataUnits_2_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_data_availableTask_bits = dataUnits_2_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_2_data_qOutTask_ready = dataUnits_2_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_3_ctrl_serveStealReq_ready = ctrlunits_3_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_3_ctrl_stealReq_ready = ctrlunits_3_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_3_data_availableTask_valid = dataUnits_3_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_3_data_availableTask_bits = dataUnits_3_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_3_data_qOutTask_ready = dataUnits_3_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_ctrl_serveStealReq_ready = ctrlunits_4_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_4_ctrl_stealReq_ready = ctrlunits_4_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_4_data_availableTask_valid = dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_availableTask_bits = dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_qOutTask_ready = dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_5_ctrl_serveStealReq_ready = ctrlunits_5_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_5_data_availableTask_valid = dataUnits_5_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_5_data_availableTask_bits = dataUnits_5_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_5_data_qOutTask_ready = dataUnits_5_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_ctrl_serveStealReq_ready = ctrlunits_6_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_6_ctrl_stealReq_ready = ctrlunits_6_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_6_data_availableTask_valid = dataUnits_6_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_data_availableTask_bits = dataUnits_6_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_6_data_qOutTask_ready = dataUnits_6_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_7_ctrl_serveStealReq_ready = ctrlunits_7_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_7_ctrl_stealReq_ready = ctrlunits_7_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_7_data_availableTask_valid = dataUnits_7_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_7_data_availableTask_bits = dataUnits_7_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_7_data_qOutTask_ready = dataUnits_7_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_8_ctrl_serveStealReq_ready = ctrlunits_8_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_8_ctrl_stealReq_ready = ctrlunits_8_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_8_data_availableTask_valid = dataUnits_8_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_8_data_availableTask_bits = dataUnits_8_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_8_data_qOutTask_ready = dataUnits_8_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_9_ctrl_serveStealReq_ready = ctrlunits_9_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_9_ctrl_stealReq_ready = ctrlunits_9_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_9_data_availableTask_valid = dataUnits_9_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_9_data_availableTask_bits = dataUnits_9_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_9_data_qOutTask_ready = dataUnits_9_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_10_ctrl_serveStealReq_ready = ctrlunits_10_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_10_data_availableTask_valid = dataUnits_10_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_10_data_availableTask_bits = dataUnits_10_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_10_data_qOutTask_ready = dataUnits_10_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_11_ctrl_serveStealReq_ready = ctrlunits_11_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_11_ctrl_stealReq_ready = ctrlunits_11_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_11_data_availableTask_valid = dataUnits_11_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_11_data_availableTask_bits = dataUnits_11_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_11_data_qOutTask_ready = dataUnits_11_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_12_ctrl_serveStealReq_ready = ctrlunits_12_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_12_ctrl_stealReq_ready = ctrlunits_12_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_12_data_availableTask_valid = dataUnits_12_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_12_data_availableTask_bits = dataUnits_12_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_12_data_qOutTask_ready = dataUnits_12_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_13_ctrl_serveStealReq_ready = ctrlunits_13_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_13_ctrl_stealReq_ready = ctrlunits_13_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_13_data_availableTask_valid = dataUnits_13_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_13_data_availableTask_bits = dataUnits_13_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_13_data_qOutTask_ready = dataUnits_13_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_14_ctrl_serveStealReq_ready = ctrlunits_14_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_14_ctrl_stealReq_ready = ctrlunits_14_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_14_data_availableTask_valid = dataUnits_14_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_14_data_availableTask_bits = dataUnits_14_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_14_data_qOutTask_ready = dataUnits_14_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_15_ctrl_serveStealReq_ready = ctrlunits_15_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_15_data_availableTask_valid = dataUnits_15_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_15_data_availableTask_bits = dataUnits_15_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_15_data_qOutTask_ready = dataUnits_15_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_16_ctrl_serveStealReq_ready = ctrlunits_16_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_16_ctrl_stealReq_ready = ctrlunits_16_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_16_data_availableTask_valid = dataUnits_16_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_16_data_availableTask_bits = dataUnits_16_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_16_data_qOutTask_ready = dataUnits_16_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_17_ctrl_serveStealReq_ready = ctrlunits_17_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_17_ctrl_stealReq_ready = ctrlunits_17_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_17_data_availableTask_valid = dataUnits_17_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_17_data_availableTask_bits = dataUnits_17_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_17_data_qOutTask_ready = dataUnits_17_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_18_ctrl_serveStealReq_ready = ctrlunits_18_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_18_ctrl_stealReq_ready = ctrlunits_18_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_18_data_availableTask_valid = dataUnits_18_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_18_data_availableTask_bits = dataUnits_18_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_18_data_qOutTask_ready = dataUnits_18_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_19_ctrl_serveStealReq_ready = ctrlunits_19_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_19_ctrl_stealReq_ready = ctrlunits_19_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_19_data_availableTask_valid = dataUnits_19_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_19_data_availableTask_bits = dataUnits_19_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_19_data_qOutTask_ready = dataUnits_19_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_20_ctrl_serveStealReq_ready = ctrlunits_20_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_20_data_availableTask_valid = dataUnits_20_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_20_data_availableTask_bits = dataUnits_20_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_20_data_qOutTask_ready = dataUnits_20_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_21_ctrl_serveStealReq_ready = ctrlunits_21_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_21_ctrl_stealReq_ready = ctrlunits_21_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_21_data_availableTask_valid = dataUnits_21_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_21_data_availableTask_bits = dataUnits_21_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_21_data_qOutTask_ready = dataUnits_21_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_22_ctrl_serveStealReq_ready = ctrlunits_22_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_22_ctrl_stealReq_ready = ctrlunits_22_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_22_data_availableTask_valid = dataUnits_22_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_22_data_availableTask_bits = dataUnits_22_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_22_data_qOutTask_ready = dataUnits_22_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_23_ctrl_serveStealReq_ready = ctrlunits_23_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_23_ctrl_stealReq_ready = ctrlunits_23_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_23_data_availableTask_valid = dataUnits_23_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_23_data_availableTask_bits = dataUnits_23_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_23_data_qOutTask_ready = dataUnits_23_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_24_ctrl_serveStealReq_ready = ctrlunits_24_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_24_ctrl_stealReq_ready = ctrlunits_24_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_24_data_availableTask_valid = dataUnits_24_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_24_data_availableTask_bits = dataUnits_24_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_24_data_qOutTask_ready = dataUnits_24_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_25_ctrl_serveStealReq_ready = ctrlunits_25_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_25_ctrl_stealReq_ready = ctrlunits_25_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_25_data_availableTask_valid = dataUnits_25_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_25_data_availableTask_bits = dataUnits_25_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_25_data_qOutTask_ready = dataUnits_25_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_26_ctrl_serveStealReq_ready = ctrlunits_26_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_26_ctrl_stealReq_ready = ctrlunits_26_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_26_data_availableTask_valid = dataUnits_26_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_26_data_availableTask_bits = dataUnits_26_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_26_data_qOutTask_ready = dataUnits_26_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_27_ctrl_serveStealReq_ready = ctrlunits_27_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_27_ctrl_stealReq_ready = ctrlunits_27_io_connSS_stealReq_ready; // @[stealNetwork.scala 41:32]
  assign io_connSS_27_data_availableTask_valid = dataUnits_27_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_27_data_availableTask_bits = dataUnits_27_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_27_data_qOutTask_ready = dataUnits_27_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_connSS_28_ctrl_serveStealReq_ready = ctrlunits_28_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_28_ctrl_stealReq_ready = ctrlunits_28_io_connSS_stealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_28_data_availableTask_valid = dataUnits_28_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_28_data_availableTask_bits = dataUnits_28_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_28_data_qOutTask_ready = dataUnits_28_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_ntwDataUnitOccupancyVSS_0 = dataUnits_0_io_occupied; // @[stealNetwork.scala 49:54]
  assign io_ntwDataUnitOccupancyVSS_1 = dataUnits_5_io_occupied; // @[stealNetwork.scala 49:54]
  assign io_ntwDataUnitOccupancyVSS_2 = dataUnits_10_io_occupied; // @[stealNetwork.scala 49:54]
  assign io_ntwDataUnitOccupancyVSS_3 = dataUnits_15_io_occupied; // @[stealNetwork.scala 49:54]
  assign io_ntwDataUnitOccupancyVSS_4 = dataUnits_20_io_occupied; // @[stealNetwork.scala 49:54]
  assign dataUnits_0_clock = clock;
  assign dataUnits_0_reset = reset;
  assign dataUnits_0_io_taskIn = dataUnits_28_io_taskOut; // @[stealNetwork.scala 34:27]
  assign dataUnits_0_io_validIn = dataUnits_28_io_validOut; // @[stealNetwork.scala 35:27]
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
  assign dataUnits_8_clock = clock;
  assign dataUnits_8_reset = reset;
  assign dataUnits_8_io_taskIn = dataUnits_7_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_8_io_validIn = dataUnits_7_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_8_io_connSS_availableTask_ready = io_connSS_8_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_8_io_connSS_qOutTask_valid = io_connSS_8_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_8_io_connSS_qOutTask_bits = io_connSS_8_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_9_clock = clock;
  assign dataUnits_9_reset = reset;
  assign dataUnits_9_io_taskIn = dataUnits_8_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_9_io_validIn = dataUnits_8_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_9_io_connSS_availableTask_ready = io_connSS_9_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_9_io_connSS_qOutTask_valid = io_connSS_9_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_9_io_connSS_qOutTask_bits = io_connSS_9_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_10_clock = clock;
  assign dataUnits_10_reset = reset;
  assign dataUnits_10_io_taskIn = dataUnits_9_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_10_io_validIn = dataUnits_9_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_10_io_connSS_availableTask_ready = io_connSS_10_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_10_io_connSS_qOutTask_valid = io_connSS_10_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_10_io_connSS_qOutTask_bits = io_connSS_10_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_11_clock = clock;
  assign dataUnits_11_reset = reset;
  assign dataUnits_11_io_taskIn = dataUnits_10_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_11_io_validIn = dataUnits_10_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_11_io_connSS_availableTask_ready = io_connSS_11_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_11_io_connSS_qOutTask_valid = io_connSS_11_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_11_io_connSS_qOutTask_bits = io_connSS_11_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_12_clock = clock;
  assign dataUnits_12_reset = reset;
  assign dataUnits_12_io_taskIn = dataUnits_11_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_12_io_validIn = dataUnits_11_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_12_io_connSS_availableTask_ready = io_connSS_12_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_12_io_connSS_qOutTask_valid = io_connSS_12_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_12_io_connSS_qOutTask_bits = io_connSS_12_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_13_clock = clock;
  assign dataUnits_13_reset = reset;
  assign dataUnits_13_io_taskIn = dataUnits_12_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_13_io_validIn = dataUnits_12_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_13_io_connSS_availableTask_ready = io_connSS_13_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_13_io_connSS_qOutTask_valid = io_connSS_13_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_13_io_connSS_qOutTask_bits = io_connSS_13_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_14_clock = clock;
  assign dataUnits_14_reset = reset;
  assign dataUnits_14_io_taskIn = dataUnits_13_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_14_io_validIn = dataUnits_13_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_14_io_connSS_availableTask_ready = io_connSS_14_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_14_io_connSS_qOutTask_valid = io_connSS_14_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_14_io_connSS_qOutTask_bits = io_connSS_14_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_15_clock = clock;
  assign dataUnits_15_reset = reset;
  assign dataUnits_15_io_taskIn = dataUnits_14_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_15_io_validIn = dataUnits_14_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_15_io_connSS_availableTask_ready = io_connSS_15_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_15_io_connSS_qOutTask_valid = io_connSS_15_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_15_io_connSS_qOutTask_bits = io_connSS_15_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_16_clock = clock;
  assign dataUnits_16_reset = reset;
  assign dataUnits_16_io_taskIn = dataUnits_15_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_16_io_validIn = dataUnits_15_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_16_io_connSS_availableTask_ready = io_connSS_16_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_16_io_connSS_qOutTask_valid = io_connSS_16_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_16_io_connSS_qOutTask_bits = io_connSS_16_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_17_clock = clock;
  assign dataUnits_17_reset = reset;
  assign dataUnits_17_io_taskIn = dataUnits_16_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_17_io_validIn = dataUnits_16_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_17_io_connSS_availableTask_ready = io_connSS_17_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_17_io_connSS_qOutTask_valid = io_connSS_17_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_17_io_connSS_qOutTask_bits = io_connSS_17_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_18_clock = clock;
  assign dataUnits_18_reset = reset;
  assign dataUnits_18_io_taskIn = dataUnits_17_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_18_io_validIn = dataUnits_17_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_18_io_connSS_availableTask_ready = io_connSS_18_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_18_io_connSS_qOutTask_valid = io_connSS_18_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_18_io_connSS_qOutTask_bits = io_connSS_18_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_19_clock = clock;
  assign dataUnits_19_reset = reset;
  assign dataUnits_19_io_taskIn = dataUnits_18_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_19_io_validIn = dataUnits_18_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_19_io_connSS_availableTask_ready = io_connSS_19_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_19_io_connSS_qOutTask_valid = io_connSS_19_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_19_io_connSS_qOutTask_bits = io_connSS_19_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_20_clock = clock;
  assign dataUnits_20_reset = reset;
  assign dataUnits_20_io_taskIn = dataUnits_19_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_20_io_validIn = dataUnits_19_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_20_io_connSS_availableTask_ready = io_connSS_20_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_20_io_connSS_qOutTask_valid = io_connSS_20_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_20_io_connSS_qOutTask_bits = io_connSS_20_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_21_clock = clock;
  assign dataUnits_21_reset = reset;
  assign dataUnits_21_io_taskIn = dataUnits_20_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_21_io_validIn = dataUnits_20_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_21_io_connSS_availableTask_ready = io_connSS_21_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_21_io_connSS_qOutTask_valid = io_connSS_21_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_21_io_connSS_qOutTask_bits = io_connSS_21_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_22_clock = clock;
  assign dataUnits_22_reset = reset;
  assign dataUnits_22_io_taskIn = dataUnits_21_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_22_io_validIn = dataUnits_21_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_22_io_connSS_availableTask_ready = io_connSS_22_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_22_io_connSS_qOutTask_valid = io_connSS_22_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_22_io_connSS_qOutTask_bits = io_connSS_22_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_23_clock = clock;
  assign dataUnits_23_reset = reset;
  assign dataUnits_23_io_taskIn = dataUnits_22_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_23_io_validIn = dataUnits_22_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_23_io_connSS_availableTask_ready = io_connSS_23_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_23_io_connSS_qOutTask_valid = io_connSS_23_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_23_io_connSS_qOutTask_bits = io_connSS_23_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_24_clock = clock;
  assign dataUnits_24_reset = reset;
  assign dataUnits_24_io_taskIn = dataUnits_23_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_24_io_validIn = dataUnits_23_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_24_io_connSS_availableTask_ready = io_connSS_24_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_24_io_connSS_qOutTask_valid = io_connSS_24_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_24_io_connSS_qOutTask_bits = io_connSS_24_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_25_clock = clock;
  assign dataUnits_25_reset = reset;
  assign dataUnits_25_io_taskIn = dataUnits_24_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_25_io_validIn = dataUnits_24_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_25_io_connSS_availableTask_ready = io_connSS_25_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_25_io_connSS_qOutTask_valid = io_connSS_25_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_25_io_connSS_qOutTask_bits = io_connSS_25_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_26_clock = clock;
  assign dataUnits_26_reset = reset;
  assign dataUnits_26_io_taskIn = dataUnits_25_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_26_io_validIn = dataUnits_25_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_26_io_connSS_availableTask_ready = io_connSS_26_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_26_io_connSS_qOutTask_valid = io_connSS_26_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_26_io_connSS_qOutTask_bits = io_connSS_26_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_27_clock = clock;
  assign dataUnits_27_reset = reset;
  assign dataUnits_27_io_taskIn = dataUnits_26_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_27_io_validIn = dataUnits_26_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_27_io_connSS_availableTask_ready = io_connSS_27_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_27_io_connSS_qOutTask_valid = io_connSS_27_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_27_io_connSS_qOutTask_bits = io_connSS_27_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
  assign dataUnits_28_clock = clock;
  assign dataUnits_28_reset = reset;
  assign dataUnits_28_io_taskIn = dataUnits_27_io_taskOut; // @[stealNetwork.scala 29:32]
  assign dataUnits_28_io_validIn = dataUnits_27_io_validOut; // @[stealNetwork.scala 30:32]
  assign dataUnits_28_io_connSS_availableTask_ready = io_connSS_28_data_availableTask_ready; // @[stealNetwork.scala 31:32]
  assign dataUnits_28_io_connSS_qOutTask_valid = io_connSS_28_data_qOutTask_valid; // @[stealNetwork.scala 31:32]
  assign dataUnits_28_io_connSS_qOutTask_bits = io_connSS_28_data_qOutTask_bits; // @[stealNetwork.scala 31:32]
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
  assign ctrlunits_2_io_connSS_stealReq_valid = io_connSS_2_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_3_clock = clock;
  assign ctrlunits_3_reset = reset;
  assign ctrlunits_3_io_reqTaskIn = ctrlunits_4_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_3_io_connSS_serveStealReq_valid = io_connSS_3_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_3_io_connSS_stealReq_valid = io_connSS_3_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
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
  assign ctrlunits_7_io_connSS_stealReq_valid = io_connSS_7_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_8_clock = clock;
  assign ctrlunits_8_reset = reset;
  assign ctrlunits_8_io_reqTaskIn = ctrlunits_9_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_8_io_connSS_serveStealReq_valid = io_connSS_8_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_8_io_connSS_stealReq_valid = io_connSS_8_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_9_clock = clock;
  assign ctrlunits_9_reset = reset;
  assign ctrlunits_9_io_reqTaskIn = ctrlunits_10_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_9_io_connSS_serveStealReq_valid = io_connSS_9_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_9_io_connSS_stealReq_valid = io_connSS_9_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_10_clock = clock;
  assign ctrlunits_10_reset = reset;
  assign ctrlunits_10_io_reqTaskIn = ctrlunits_11_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_10_io_connSS_serveStealReq_valid = io_connSS_10_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_10_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_11_clock = clock;
  assign ctrlunits_11_reset = reset;
  assign ctrlunits_11_io_reqTaskIn = ctrlunits_12_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_11_io_connSS_serveStealReq_valid = io_connSS_11_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_11_io_connSS_stealReq_valid = io_connSS_11_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_12_clock = clock;
  assign ctrlunits_12_reset = reset;
  assign ctrlunits_12_io_reqTaskIn = ctrlunits_13_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_12_io_connSS_serveStealReq_valid = io_connSS_12_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_12_io_connSS_stealReq_valid = io_connSS_12_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_13_clock = clock;
  assign ctrlunits_13_reset = reset;
  assign ctrlunits_13_io_reqTaskIn = ctrlunits_14_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_13_io_connSS_serveStealReq_valid = io_connSS_13_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_13_io_connSS_stealReq_valid = io_connSS_13_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_14_clock = clock;
  assign ctrlunits_14_reset = reset;
  assign ctrlunits_14_io_reqTaskIn = ctrlunits_15_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_14_io_connSS_serveStealReq_valid = io_connSS_14_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_14_io_connSS_stealReq_valid = io_connSS_14_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_15_clock = clock;
  assign ctrlunits_15_reset = reset;
  assign ctrlunits_15_io_reqTaskIn = ctrlunits_16_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_15_io_connSS_serveStealReq_valid = io_connSS_15_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_15_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_16_clock = clock;
  assign ctrlunits_16_reset = reset;
  assign ctrlunits_16_io_reqTaskIn = ctrlunits_17_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_16_io_connSS_serveStealReq_valid = io_connSS_16_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_16_io_connSS_stealReq_valid = io_connSS_16_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_17_clock = clock;
  assign ctrlunits_17_reset = reset;
  assign ctrlunits_17_io_reqTaskIn = ctrlunits_18_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_17_io_connSS_serveStealReq_valid = io_connSS_17_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_17_io_connSS_stealReq_valid = io_connSS_17_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_18_clock = clock;
  assign ctrlunits_18_reset = reset;
  assign ctrlunits_18_io_reqTaskIn = ctrlunits_19_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_18_io_connSS_serveStealReq_valid = io_connSS_18_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_18_io_connSS_stealReq_valid = io_connSS_18_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_19_clock = clock;
  assign ctrlunits_19_reset = reset;
  assign ctrlunits_19_io_reqTaskIn = ctrlunits_20_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_19_io_connSS_serveStealReq_valid = io_connSS_19_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_19_io_connSS_stealReq_valid = io_connSS_19_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_20_clock = clock;
  assign ctrlunits_20_reset = reset;
  assign ctrlunits_20_io_reqTaskIn = ctrlunits_21_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_20_io_connSS_serveStealReq_valid = io_connSS_20_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_20_io_connSS_stealReq_valid = 1'h0; // @[stealNetwork.scala 41:32]
  assign ctrlunits_21_clock = clock;
  assign ctrlunits_21_reset = reset;
  assign ctrlunits_21_io_reqTaskIn = ctrlunits_22_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_21_io_connSS_serveStealReq_valid = io_connSS_21_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_21_io_connSS_stealReq_valid = io_connSS_21_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_22_clock = clock;
  assign ctrlunits_22_reset = reset;
  assign ctrlunits_22_io_reqTaskIn = ctrlunits_23_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_22_io_connSS_serveStealReq_valid = io_connSS_22_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_22_io_connSS_stealReq_valid = io_connSS_22_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_23_clock = clock;
  assign ctrlunits_23_reset = reset;
  assign ctrlunits_23_io_reqTaskIn = ctrlunits_24_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_23_io_connSS_serveStealReq_valid = io_connSS_23_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_23_io_connSS_stealReq_valid = io_connSS_23_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_24_clock = clock;
  assign ctrlunits_24_reset = reset;
  assign ctrlunits_24_io_reqTaskIn = ctrlunits_25_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_24_io_connSS_serveStealReq_valid = io_connSS_24_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_24_io_connSS_stealReq_valid = io_connSS_24_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_25_clock = clock;
  assign ctrlunits_25_reset = reset;
  assign ctrlunits_25_io_reqTaskIn = ctrlunits_26_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_25_io_connSS_serveStealReq_valid = io_connSS_25_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_25_io_connSS_stealReq_valid = io_connSS_25_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_26_clock = clock;
  assign ctrlunits_26_reset = reset;
  assign ctrlunits_26_io_reqTaskIn = ctrlunits_27_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_26_io_connSS_serveStealReq_valid = io_connSS_26_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_26_io_connSS_stealReq_valid = io_connSS_26_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_27_clock = clock;
  assign ctrlunits_27_reset = reset;
  assign ctrlunits_27_io_reqTaskIn = ctrlunits_28_io_reqTaskOut; // @[stealNetwork.scala 40:32]
  assign ctrlunits_27_io_connSS_serveStealReq_valid = io_connSS_27_ctrl_serveStealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_27_io_connSS_stealReq_valid = io_connSS_27_ctrl_stealReq_valid; // @[stealNetwork.scala 41:32]
  assign ctrlunits_28_clock = clock;
  assign ctrlunits_28_reset = reset;
  assign ctrlunits_28_io_reqTaskIn = ctrlunits_0_io_reqTaskOut; // @[stealNetwork.scala 44:36]
  assign ctrlunits_28_io_connSS_serveStealReq_valid = io_connSS_28_ctrl_serveStealReq_valid; // @[stealNetwork.scala 45:36]
  assign ctrlunits_28_io_connSS_stealReq_valid = io_connSS_28_ctrl_stealReq_valid; // @[stealNetwork.scala 45:36]
endmodule
module stealServer(
  input         clock,
  input         reset,
  input         io_connNetwork_ctrl_serveStealReq_ready,
  output        io_connNetwork_ctrl_serveStealReq_valid,
  input         io_connNetwork_ctrl_stealReq_ready,
  output        io_connNetwork_ctrl_stealReq_valid,
  output        io_connNetwork_data_availableTask_ready,
  input         io_connNetwork_data_availableTask_valid,
  input  [31:0] io_connNetwork_data_availableTask_bits,
  input         io_connNetwork_data_qOutTask_ready,
  output        io_connNetwork_data_qOutTask_valid,
  output [31:0] io_connNetwork_data_qOutTask_bits,
  input  [5:0]  io_connQ_currLength,
  input         io_connQ_push_ready,
  output        io_connQ_push_valid,
  output [31:0] io_connQ_push_bits,
  output        io_connQ_pop_ready,
  input         io_connQ_pop_valid,
  input  [31:0] io_connQ_pop_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
  reg [31:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] stateReg; // @[stealServer.scala 28:39]
  reg [31:0] stolenTaskReg; // @[stealServer.scala 29:39]
  reg [31:0] giveTaskReg; // @[stealServer.scala 30:39]
  reg [1:0] taskRequestCount; // @[stealServer.scala 33:39]
  reg [31:0] tasksGivenAwayCount; // @[stealServer.scala 35:38]
  reg [31:0] requestKilledCount; // @[stealServer.scala 37:37]
  reg [31:0] requestFullCount; // @[stealServer.scala 38:35]
  wire  _T_1 = io_connQ_currLength < 6'h6; // @[stealServer.scala 54:34]
  wire  _T_2 = io_connQ_currLength > 6'h16; // @[stealServer.scala 57:40]
  wire [2:0] _GEN_0 = io_connQ_currLength > 6'h6 ? 3'h6 : 3'h0; // @[stealServer.scala 59:60 60:50 62:50]
  wire [31:0] _GEN_2 = io_connQ_currLength < 6'h6 ? 32'h1d : requestFullCount; // @[stealServer.scala 38:35 54:54 55:50]
  wire  _T_4 = stateReg == 3'h1; // @[stealServer.scala 64:25]
  wire  _T_9 = io_connQ_currLength >= 6'h6; // @[stealServer.scala 73:40]
  wire  _T_10 = tasksGivenAwayCount > 32'h0; // @[stealServer.scala 75:40]
  wire [31:0] _tasksGivenAwayCount_T_1 = tasksGivenAwayCount - 32'h1; // @[stealServer.scala 78:56]
  wire [1:0] _GEN_4 = requestFullCount == 32'h0 ? 2'h2 : 2'h1; // @[stealServer.scala 80:45 81:50 83:50]
  wire [1:0] _GEN_5 = tasksGivenAwayCount > 32'h0 ? 2'h2 : _GEN_4; // @[stealServer.scala 75:46 76:50]
  wire [31:0] _GEN_6 = tasksGivenAwayCount > 32'h0 ? 32'h1d : requestKilledCount; // @[stealServer.scala 37:37 75:46 77:50]
  wire [31:0] _GEN_7 = tasksGivenAwayCount > 32'h0 ? _tasksGivenAwayCount_T_1 : tasksGivenAwayCount; // @[stealServer.scala 75:46 78:33 35:38]
  wire [2:0] _GEN_9 = io_connQ_currLength >= 6'h6 ? 3'h6 : {{1'd0}, _GEN_5}; // @[stealServer.scala 73:61 74:50]
  wire [31:0] _GEN_10 = io_connQ_currLength >= 6'h6 ? requestKilledCount : _GEN_6; // @[stealServer.scala 37:37 73:61]
  wire [31:0] _GEN_11 = io_connQ_currLength >= 6'h6 ? tasksGivenAwayCount : _GEN_7; // @[stealServer.scala 35:38 73:61]
  wire  _GEN_12 = io_connQ_currLength >= 6'h6 ? 1'h0 : _T_10; // @[stealServer.scala 50:47 73:61]
  wire [1:0] _GEN_13 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 2'h1 : taskRequestCount; // @[stealServer.scala 33:39 69:83 70:50]
  wire [2:0] _GEN_15 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 3'h1 : _GEN_9; // @[stealServer.scala 69:83 72:50]
  wire [31:0] _GEN_16 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? requestKilledCount : _GEN_10; // @[stealServer.scala 37:37 69:83]
  wire [31:0] _GEN_17 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? tasksGivenAwayCount : _GEN_11; // @[stealServer.scala 35:38 69:83]
  wire  _GEN_18 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 1'h0 : _GEN_12; // @[stealServer.scala 50:47 69:83]
  wire  _GEN_24 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1 ? 1'h0 : _GEN_18; // @[stealServer.scala 50:47 66:77]
  wire [31:0] _requestFullCount_T_1 = requestFullCount - 32'h1; // @[stealServer.scala 87:70]
  wire  _T_12 = stateReg == 3'h2; // @[stealServer.scala 91:25]
  wire [31:0] _GEN_26 = requestKilledCount == 32'h0 ? 32'h1d : requestFullCount; // @[stealServer.scala 38:35 98:47 99:50]
  wire [1:0] _GEN_27 = requestKilledCount == 32'h0 ? 2'h1 : 2'h2; // @[stealServer.scala 98:47 100:50 102:50]
  wire [1:0] _GEN_28 = _T_9 ? 2'h0 : _GEN_27; // @[stealServer.scala 96:61 97:50]
  wire [31:0] _GEN_29 = _T_9 ? requestFullCount : _GEN_26; // @[stealServer.scala 38:35 96:61]
  wire [1:0] _GEN_30 = io_connNetwork_data_availableTask_valid ? 2'h3 : _GEN_28; // @[stealServer.scala 93:54 94:50]
  wire [31:0] _GEN_31 = io_connNetwork_data_availableTask_valid ? io_connNetwork_data_availableTask_bits : stolenTaskReg
    ; // @[stealServer.scala 29:39 93:54 95:50]
  wire [31:0] _GEN_32 = io_connNetwork_data_availableTask_valid ? requestFullCount : _GEN_29; // @[stealServer.scala 38:35 93:54]
  wire [31:0] _requestKilledCount_T_1 = requestKilledCount - 32'h1; // @[stealServer.scala 106:72]
  wire [31:0] _GEN_33 = ~io_connNetwork_ctrl_serveStealReq_ready ? _requestKilledCount_T_1 : 32'h1d; // @[stealServer.scala 105:55 106:50 108:50]
  wire  _T_16 = stateReg == 3'h3; // @[stealServer.scala 113:25]
  wire [2:0] _GEN_34 = io_connQ_currLength >= 6'h16 ? 3'h5 : 3'h3; // @[stealServer.scala 116:61 117:50 120:50]
  wire [31:0] _GEN_35 = io_connQ_currLength >= 6'h16 ? stolenTaskReg : giveTaskReg; // @[stealServer.scala 116:61 118:50 30:39]
  wire [2:0] _GEN_36 = io_connQ_push_ready ? 3'h0 : _GEN_34; // @[stealServer.scala 114:34 115:50]
  wire [31:0] _GEN_37 = io_connQ_push_ready ? giveTaskReg : _GEN_35; // @[stealServer.scala 114:34 30:39]
  wire  _T_18 = stateReg == 3'h4; // @[stealServer.scala 126:25]
  wire [31:0] _GEN_38 = io_connQ_currLength == 6'h0 ? 32'h1d : requestFullCount; // @[stealServer.scala 130:48 131:50 38:35]
  wire [2:0] _GEN_39 = io_connQ_currLength == 6'h0 ? 3'h1 : 3'h4; // @[stealServer.scala 130:48 132:50 134:50]
  wire [2:0] _GEN_40 = io_connQ_pop_valid ? 3'h5 : _GEN_39; // @[stealServer.scala 127:33 128:50]
  wire [31:0] _GEN_41 = io_connQ_pop_valid ? io_connQ_pop_bits : giveTaskReg; // @[stealServer.scala 127:33 129:50 30:39]
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
  wire [31:0] _GEN_48 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 32'h1d : _GEN_2; // @[stealServer.scala 154:103 155:50]
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
  wire [31:0] _GEN_61 = stateReg == 3'h5 ? giveTaskReg : 32'h0; // @[stealServer.scala 139:48 148:51 47:47]
  wire [31:0] _GEN_62 = stateReg == 3'h5 ? requestFullCount : _GEN_55; // @[stealServer.scala 139:48 38:35]
  wire [1:0] _GEN_63 = stateReg == 3'h5 ? taskRequestCount : _GEN_56; // @[stealServer.scala 139:48 33:39]
  wire  _GEN_64 = stateReg == 3'h5 ? 1'h0 : _T_21; // @[stealServer.scala 139:48 50:47]
  wire [2:0] _GEN_65 = stateReg == 3'h4 ? _GEN_40 : _GEN_59; // @[stealServer.scala 126:43]
  wire [31:0] _GEN_66 = stateReg == 3'h4 ? _GEN_41 : giveTaskReg; // @[stealServer.scala 126:43 30:39]
  wire [31:0] _GEN_67 = stateReg == 3'h4 ? _GEN_42 : _GEN_62; // @[stealServer.scala 126:43]
  wire [31:0] _GEN_69 = stateReg == 3'h4 ? tasksGivenAwayCount : _GEN_58; // @[stealServer.scala 126:43 35:38]
  wire  _GEN_70 = stateReg == 3'h4 ? 1'h0 : _T_20; // @[stealServer.scala 126:43 46:47]
  wire [31:0] _GEN_71 = stateReg == 3'h4 ? 32'h0 : _GEN_61; // @[stealServer.scala 126:43 47:47]
  wire [1:0] _GEN_72 = stateReg == 3'h4 ? taskRequestCount : _GEN_63; // @[stealServer.scala 126:43 33:39]
  wire  _GEN_73 = stateReg == 3'h4 ? 1'h0 : _GEN_64; // @[stealServer.scala 126:43 50:47]
  wire [2:0] _GEN_74 = stateReg == 3'h3 ? _GEN_36 : _GEN_65; // @[stealServer.scala 113:44]
  wire [31:0] _GEN_75 = stateReg == 3'h3 ? _GEN_37 : _GEN_66; // @[stealServer.scala 113:44]
  wire [31:0] _GEN_76 = stateReg == 3'h3 ? stolenTaskReg : 32'h0; // @[stealServer.scala 113:44 123:51 42:47]
  wire [31:0] _GEN_78 = stateReg == 3'h3 ? requestFullCount : _GEN_67; // @[stealServer.scala 113:44 38:35]
  wire  _GEN_79 = stateReg == 3'h3 ? 1'h0 : _T_18; // @[stealServer.scala 113:44 41:47]
  wire [31:0] _GEN_80 = stateReg == 3'h3 ? tasksGivenAwayCount : _GEN_69; // @[stealServer.scala 113:44 35:38]
  wire  _GEN_81 = stateReg == 3'h3 ? 1'h0 : _GEN_70; // @[stealServer.scala 113:44 46:47]
  wire [31:0] _GEN_82 = stateReg == 3'h3 ? 32'h0 : _GEN_71; // @[stealServer.scala 113:44 47:47]
  wire [1:0] _GEN_83 = stateReg == 3'h3 ? taskRequestCount : _GEN_72; // @[stealServer.scala 113:44 33:39]
  wire  _GEN_84 = stateReg == 3'h3 ? 1'h0 : _GEN_73; // @[stealServer.scala 113:44 50:47]
  wire [31:0] _GEN_91 = stateReg == 3'h2 ? 32'h0 : _GEN_76; // @[stealServer.scala 91:46 42:47]
  wire  _GEN_92 = stateReg == 3'h2 ? 1'h0 : _T_16; // @[stealServer.scala 91:46 43:47]
  wire  _GEN_93 = stateReg == 3'h2 ? 1'h0 : _GEN_79; // @[stealServer.scala 91:46 41:47]
  wire  _GEN_95 = stateReg == 3'h2 ? 1'h0 : _GEN_81; // @[stealServer.scala 91:46 46:47]
  wire [31:0] _GEN_96 = stateReg == 3'h2 ? 32'h0 : _GEN_82; // @[stealServer.scala 91:46 47:47]
  wire  _GEN_98 = stateReg == 3'h2 ? 1'h0 : _GEN_84; // @[stealServer.scala 91:46 50:47]
  wire  _GEN_105 = stateReg == 3'h1 ? _GEN_24 : _GEN_98; // @[stealServer.scala 64:47]
  wire  _GEN_107 = stateReg == 3'h1 ? 1'h0 : _T_12; // @[stealServer.scala 45:47 64:47]
  wire [31:0] _GEN_109 = stateReg == 3'h1 ? 32'h0 : _GEN_91; // @[stealServer.scala 42:47 64:47]
  wire  _GEN_110 = stateReg == 3'h1 ? 1'h0 : _GEN_92; // @[stealServer.scala 43:47 64:47]
  wire  _GEN_111 = stateReg == 3'h1 ? 1'h0 : _GEN_93; // @[stealServer.scala 41:47 64:47]
  wire  _GEN_112 = stateReg == 3'h1 ? 1'h0 : _GEN_95; // @[stealServer.scala 46:47 64:47]
  wire [31:0] _GEN_113 = stateReg == 3'h1 ? 32'h0 : _GEN_96; // @[stealServer.scala 47:47 64:47]
  assign io_connNetwork_ctrl_serveStealReq_valid = stateReg == 3'h0 ? 1'h0 : _GEN_105; // @[stealServer.scala 53:34 50:47]
  assign io_connNetwork_ctrl_stealReq_valid = stateReg == 3'h0 ? 1'h0 : _T_4; // @[stealServer.scala 53:34 49:47]
  assign io_connNetwork_data_availableTask_ready = stateReg == 3'h0 ? 1'h0 : _GEN_107; // @[stealServer.scala 53:34 45:47]
  assign io_connNetwork_data_qOutTask_valid = stateReg == 3'h0 ? 1'h0 : _GEN_112; // @[stealServer.scala 53:34 46:47]
  assign io_connNetwork_data_qOutTask_bits = stateReg == 3'h0 ? 32'h0 : _GEN_113; // @[stealServer.scala 53:34 47:47]
  assign io_connQ_push_valid = stateReg == 3'h0 ? 1'h0 : _GEN_110; // @[stealServer.scala 53:34 43:47]
  assign io_connQ_push_bits = stateReg == 3'h0 ? 32'h0 : _GEN_109; // @[stealServer.scala 53:34 42:47]
  assign io_connQ_pop_ready = stateReg == 3'h0 ? 1'h0 : _GEN_111; // @[stealServer.scala 53:34 41:47]
  always @(posedge clock) begin
    if (reset) begin // @[stealServer.scala 28:39]
      stateReg <= 3'h0; // @[stealServer.scala 28:39]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 53:34]
      if (io_connQ_currLength < 6'h6) begin // @[stealServer.scala 54:54]
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
      stolenTaskReg <= 32'h0; // @[stealServer.scala 29:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (!(stateReg == 3'h1)) begin // @[stealServer.scala 64:47]
        if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
          stolenTaskReg <= _GEN_31;
        end
      end
    end
    if (reset) begin // @[stealServer.scala 30:39]
      giveTaskReg <= 32'h0; // @[stealServer.scala 30:39]
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
      requestKilledCount <= 32'h1d; // @[stealServer.scala 37:37]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 53:34]
      if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
        if (io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1) begin // @[stealServer.scala 66:77]
          requestKilledCount <= 32'h1d; // @[stealServer.scala 68:50]
        end else begin
          requestKilledCount <= _GEN_16;
        end
      end else if (stateReg == 3'h2) begin // @[stealServer.scala 91:46]
        requestKilledCount <= _GEN_33;
      end
    end
    if (reset) begin // @[stealServer.scala 38:35]
      requestFullCount <= 32'h1d; // @[stealServer.scala 38:35]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 53:34]
      if (io_connQ_currLength < 6'h6) begin // @[stealServer.scala 54:54]
        requestFullCount <= 32'h1d; // @[stealServer.scala 55:50]
      end
    end else if (stateReg == 3'h1) begin // @[stealServer.scala 64:47]
      if (io_connNetwork_ctrl_serveStealReq_ready) begin // @[stealServer.scala 86:54]
        requestFullCount <= _requestFullCount_T_1; // @[stealServer.scala 87:50]
      end else begin
        requestFullCount <= 32'h1d; // @[stealServer.scala 89:50]
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
  _RAND_1 = {1{`RANDOM}};
  stolenTaskReg = _RAND_1[31:0];
  _RAND_2 = {1{`RANDOM}};
  giveTaskReg = _RAND_2[31:0];
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
  input         clock,
  input         reset,
  output        io_connVec_0_push_ready,
  input         io_connVec_0_push_valid,
  input  [31:0] io_connVec_0_push_bits,
  input         io_connVec_0_pop_ready,
  output        io_connVec_0_pop_valid,
  output [31:0] io_connVec_0_pop_bits,
  output [6:0]  io_connVec_1_currLength,
  output        io_connVec_1_push_ready,
  input         io_connVec_1_push_valid,
  input  [31:0] io_connVec_1_push_bits,
  input         io_connVec_1_pop_ready,
  output        io_connVec_1_pop_valid,
  output [31:0] io_connVec_1_pop_bits
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
  wire [5:0] bramMem_a_addr; // @[deque.scala 34:30]
  wire [31:0] bramMem_a_din; // @[deque.scala 34:30]
  wire  bramMem_a_wr; // @[deque.scala 34:30]
  wire [31:0] bramMem_a_dout; // @[deque.scala 34:30]
  wire [5:0] bramMem_b_addr; // @[deque.scala 34:30]
  wire [31:0] bramMem_b_din; // @[deque.scala 34:30]
  wire  bramMem_b_wr; // @[deque.scala 34:30]
  wire [31:0] bramMem_b_dout; // @[deque.scala 34:30]
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
  wire [31:0] _GEN_17 = stateRegs_0 == 3'h4 ? bramMem_a_dout : 32'h0; // @[deque.scala 129:47 152:38 67:34]
  wire  _GEN_18 = stateRegs_0 == 3'h4 ? 1'h0 : _T_21; // @[deque.scala 129:47 65:34]
  wire [27:0] _GEN_21 = stateRegs_0 == 3'h2 ? {{21'd0}, _GEN_6} : _GEN_15; // @[deque.scala 105:51]
  wire  _GEN_23 = stateRegs_0 == 3'h2 ? 1'h0 : _T_17; // @[deque.scala 105:51 66:34]
  wire [31:0] _GEN_24 = stateRegs_0 == 3'h2 ? 32'h0 : _GEN_17; // @[deque.scala 105:51 67:34]
  wire  _GEN_25 = stateRegs_0 == 3'h2 ? 1'h0 : _GEN_18; // @[deque.scala 105:51 65:34]
  wire [27:0] _GEN_28 = stateRegs_0 == 3'h1 ? {{21'd0}, sideReg_0} : _GEN_21; // @[deque.scala 102:38 92:52]
  wire  _GEN_32 = stateRegs_0 == 3'h1 ? 1'h0 : _GEN_23; // @[deque.scala 66:34 92:52]
  wire [31:0] _GEN_33 = stateRegs_0 == 3'h1 ? 32'h0 : _GEN_24; // @[deque.scala 67:34 92:52]
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
  wire [31:0] _GEN_61 = stateRegs_1 == 3'h4 ? bramMem_b_dout : 32'h0; // @[deque.scala 129:47 152:38 67:34]
  wire  _GEN_62 = stateRegs_1 == 3'h4 ? 1'h0 : _T_44; // @[deque.scala 129:47 65:34]
  wire [27:0] _GEN_65 = stateRegs_1 == 3'h2 ? {{21'd0}, _GEN_50} : _GEN_59; // @[deque.scala 105:51]
  wire  _GEN_67 = stateRegs_1 == 3'h2 ? 1'h0 : _T_42; // @[deque.scala 105:51 66:34]
  wire [31:0] _GEN_68 = stateRegs_1 == 3'h2 ? 32'h0 : _GEN_61; // @[deque.scala 105:51 67:34]
  wire  _GEN_69 = stateRegs_1 == 3'h2 ? 1'h0 : _GEN_62; // @[deque.scala 105:51 65:34]
  wire [27:0] _GEN_72 = stateRegs_1 == 3'h1 ? {{21'd0}, sideReg_1} : _GEN_65; // @[deque.scala 102:38 92:52]
  wire  _GEN_76 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_67; // @[deque.scala 66:34 92:52]
  wire [31:0] _GEN_77 = stateRegs_1 == 3'h1 ? 32'h0 : _GEN_68; // @[deque.scala 67:34 92:52]
  wire  _GEN_78 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_69; // @[deque.scala 65:34 92:52]
  wire [27:0] _GEN_81 = _T_5 ? 28'hfffffff : _GEN_72; // @[deque.scala 59:34 71:42]
  DualPortBRAM #(.DATA(32), .ADDR(6)) bramMem ( // @[deque.scala 34:30]
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
  assign io_connVec_0_pop_bits = stateRegs_0 == 3'h0 ? 32'h0 : _GEN_33; // @[deque.scala 67:34 71:42]
  assign io_connVec_1_currLength = sideReg_0 > sideReg_1 ? _currLen_T_5 : _currLen_T_9; // @[deque.scala 175:34 176:17 178:17]
  assign io_connVec_1_push_ready = _T_5 ? 1'h0 : _GEN_78; // @[deque.scala 65:34 71:42]
  assign io_connVec_1_pop_valid = _T_5 ? 1'h0 : _GEN_76; // @[deque.scala 66:34 71:42]
  assign io_connVec_1_pop_bits = _T_5 ? 32'h0 : _GEN_77; // @[deque.scala 67:34 71:42]
  assign bramMem_clk = clock; // @[deque.scala 36:22]
  assign bramMem_rst = reset; // @[deque.scala 37:22]
  assign bramMem_a_addr = _GEN_37[5:0];
  assign bramMem_a_din = io_connVec_0_push_bits; // @[deque.scala 60:34]
  assign bramMem_a_wr = stateRegs_0 == 3'h0 ? 1'h0 : _T_10; // @[deque.scala 61:34 71:42]
  assign bramMem_b_addr = _GEN_81[5:0];
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
module stealNW_TQ(
  input         clock,
  input         reset,
  output        io_connPE_0_push_ready,
  input         io_connPE_0_push_valid,
  input  [31:0] io_connPE_0_push_bits,
  input         io_connPE_0_pop_ready,
  output        io_connPE_0_pop_valid,
  output [31:0] io_connPE_0_pop_bits,
  output        io_connPE_1_push_ready,
  input         io_connPE_1_push_valid,
  input  [31:0] io_connPE_1_push_bits,
  input         io_connPE_1_pop_ready,
  output        io_connPE_1_pop_valid,
  output [31:0] io_connPE_1_pop_bits,
  output        io_connPE_2_push_ready,
  input         io_connPE_2_push_valid,
  input  [31:0] io_connPE_2_push_bits,
  input         io_connPE_2_pop_ready,
  output        io_connPE_2_pop_valid,
  output [31:0] io_connPE_2_pop_bits,
  output        io_connPE_3_push_ready,
  input         io_connPE_3_push_valid,
  input  [31:0] io_connPE_3_push_bits,
  input         io_connPE_3_pop_ready,
  output        io_connPE_3_pop_valid,
  output [31:0] io_connPE_3_pop_bits,
  output        io_connPE_4_push_ready,
  input         io_connPE_4_push_valid,
  input  [31:0] io_connPE_4_push_bits,
  input         io_connPE_4_pop_ready,
  output        io_connPE_4_pop_valid,
  output [31:0] io_connPE_4_pop_bits,
  output        io_connPE_5_push_ready,
  input         io_connPE_5_push_valid,
  input  [31:0] io_connPE_5_push_bits,
  input         io_connPE_5_pop_ready,
  output        io_connPE_5_pop_valid,
  output [31:0] io_connPE_5_pop_bits,
  output        io_connPE_6_push_ready,
  input         io_connPE_6_push_valid,
  input  [31:0] io_connPE_6_push_bits,
  input         io_connPE_6_pop_ready,
  output        io_connPE_6_pop_valid,
  output [31:0] io_connPE_6_pop_bits,
  output        io_connPE_7_push_ready,
  input         io_connPE_7_push_valid,
  input  [31:0] io_connPE_7_push_bits,
  input         io_connPE_7_pop_ready,
  output        io_connPE_7_pop_valid,
  output [31:0] io_connPE_7_pop_bits,
  output        io_connPE_8_push_ready,
  input         io_connPE_8_push_valid,
  input  [31:0] io_connPE_8_push_bits,
  input         io_connPE_8_pop_ready,
  output        io_connPE_8_pop_valid,
  output [31:0] io_connPE_8_pop_bits,
  output        io_connPE_9_push_ready,
  input         io_connPE_9_push_valid,
  input  [31:0] io_connPE_9_push_bits,
  input         io_connPE_9_pop_ready,
  output        io_connPE_9_pop_valid,
  output [31:0] io_connPE_9_pop_bits,
  output        io_connPE_10_push_ready,
  input         io_connPE_10_push_valid,
  input  [31:0] io_connPE_10_push_bits,
  input         io_connPE_10_pop_ready,
  output        io_connPE_10_pop_valid,
  output [31:0] io_connPE_10_pop_bits,
  output        io_connPE_11_push_ready,
  input         io_connPE_11_push_valid,
  input  [31:0] io_connPE_11_push_bits,
  input         io_connPE_11_pop_ready,
  output        io_connPE_11_pop_valid,
  output [31:0] io_connPE_11_pop_bits,
  output        io_connPE_12_push_ready,
  input         io_connPE_12_push_valid,
  input  [31:0] io_connPE_12_push_bits,
  input         io_connPE_12_pop_ready,
  output        io_connPE_12_pop_valid,
  output [31:0] io_connPE_12_pop_bits,
  output        io_connPE_13_push_ready,
  input         io_connPE_13_push_valid,
  input  [31:0] io_connPE_13_push_bits,
  input         io_connPE_13_pop_ready,
  output        io_connPE_13_pop_valid,
  output [31:0] io_connPE_13_pop_bits,
  output        io_connPE_14_push_ready,
  input         io_connPE_14_push_valid,
  input  [31:0] io_connPE_14_push_bits,
  input         io_connPE_14_pop_ready,
  output        io_connPE_14_pop_valid,
  output [31:0] io_connPE_14_pop_bits,
  output        io_connPE_15_push_ready,
  input         io_connPE_15_push_valid,
  input  [31:0] io_connPE_15_push_bits,
  input         io_connPE_15_pop_ready,
  output        io_connPE_15_pop_valid,
  output [31:0] io_connPE_15_pop_bits,
  output        io_connPE_16_push_ready,
  input         io_connPE_16_push_valid,
  input  [31:0] io_connPE_16_push_bits,
  input         io_connPE_16_pop_ready,
  output        io_connPE_16_pop_valid,
  output [31:0] io_connPE_16_pop_bits,
  output        io_connPE_17_push_ready,
  input         io_connPE_17_push_valid,
  input  [31:0] io_connPE_17_push_bits,
  input         io_connPE_17_pop_ready,
  output        io_connPE_17_pop_valid,
  output [31:0] io_connPE_17_pop_bits,
  output        io_connPE_18_push_ready,
  input         io_connPE_18_push_valid,
  input  [31:0] io_connPE_18_push_bits,
  input         io_connPE_18_pop_ready,
  output        io_connPE_18_pop_valid,
  output [31:0] io_connPE_18_pop_bits,
  output        io_connPE_19_push_ready,
  input         io_connPE_19_push_valid,
  input  [31:0] io_connPE_19_push_bits,
  input         io_connPE_19_pop_ready,
  output        io_connPE_19_pop_valid,
  output [31:0] io_connPE_19_pop_bits,
  output        io_connPE_20_push_ready,
  input         io_connPE_20_push_valid,
  input  [31:0] io_connPE_20_push_bits,
  input         io_connPE_20_pop_ready,
  output        io_connPE_20_pop_valid,
  output [31:0] io_connPE_20_pop_bits,
  output        io_connPE_21_push_ready,
  input         io_connPE_21_push_valid,
  input  [31:0] io_connPE_21_push_bits,
  input         io_connPE_21_pop_ready,
  output        io_connPE_21_pop_valid,
  output [31:0] io_connPE_21_pop_bits,
  output        io_connPE_22_push_ready,
  input         io_connPE_22_push_valid,
  input  [31:0] io_connPE_22_push_bits,
  input         io_connPE_22_pop_ready,
  output        io_connPE_22_pop_valid,
  output [31:0] io_connPE_22_pop_bits,
  output        io_connPE_23_push_ready,
  input         io_connPE_23_push_valid,
  input  [31:0] io_connPE_23_push_bits,
  input         io_connPE_23_pop_ready,
  output        io_connPE_23_pop_valid,
  output [31:0] io_connPE_23_pop_bits,
  output        io_connVSS_0_ctrl_serveStealReq_ready,
  input         io_connVSS_0_ctrl_serveStealReq_valid,
  input         io_connVSS_0_data_availableTask_ready,
  output        io_connVSS_0_data_availableTask_valid,
  output [31:0] io_connVSS_0_data_availableTask_bits,
  output        io_connVSS_0_data_qOutTask_ready,
  input         io_connVSS_0_data_qOutTask_valid,
  input  [31:0] io_connVSS_0_data_qOutTask_bits,
  output        io_connVSS_1_ctrl_serveStealReq_ready,
  input         io_connVSS_1_ctrl_serveStealReq_valid,
  input         io_connVSS_1_data_availableTask_ready,
  output        io_connVSS_1_data_availableTask_valid,
  output [31:0] io_connVSS_1_data_availableTask_bits,
  output        io_connVSS_1_data_qOutTask_ready,
  input         io_connVSS_1_data_qOutTask_valid,
  input  [31:0] io_connVSS_1_data_qOutTask_bits,
  output        io_connVSS_2_ctrl_serveStealReq_ready,
  input         io_connVSS_2_ctrl_serveStealReq_valid,
  input         io_connVSS_2_data_availableTask_ready,
  output        io_connVSS_2_data_availableTask_valid,
  output [31:0] io_connVSS_2_data_availableTask_bits,
  output        io_connVSS_2_data_qOutTask_ready,
  input         io_connVSS_2_data_qOutTask_valid,
  input  [31:0] io_connVSS_2_data_qOutTask_bits,
  output        io_connVSS_3_ctrl_serveStealReq_ready,
  input         io_connVSS_3_ctrl_serveStealReq_valid,
  input         io_connVSS_3_data_availableTask_ready,
  output        io_connVSS_3_data_availableTask_valid,
  output [31:0] io_connVSS_3_data_availableTask_bits,
  output        io_connVSS_3_data_qOutTask_ready,
  input         io_connVSS_3_data_qOutTask_valid,
  input  [31:0] io_connVSS_3_data_qOutTask_bits,
  output        io_connVSS_4_ctrl_serveStealReq_ready,
  input         io_connVSS_4_ctrl_serveStealReq_valid,
  input         io_connVSS_4_data_availableTask_ready,
  output        io_connVSS_4_data_availableTask_valid,
  output [31:0] io_connVSS_4_data_availableTask_bits,
  output        io_connVSS_4_data_qOutTask_ready,
  input         io_connVSS_4_data_qOutTask_valid,
  input  [31:0] io_connVSS_4_data_qOutTask_bits,
  output        io_ntwDataUnitOccupancyVSS_0,
  output        io_ntwDataUnitOccupancyVSS_1,
  output        io_ntwDataUnitOccupancyVSS_2,
  output        io_ntwDataUnitOccupancyVSS_3,
  output        io_ntwDataUnitOccupancyVSS_4
);
  wire  stealNet_clock; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_reset; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_1_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_1_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_1_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_2_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_2_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_3_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_3_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_3_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_4_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_4_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_5_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_5_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_5_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_6_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_6_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_6_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_7_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_7_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_7_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_8_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_8_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_8_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_9_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_9_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_9_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_10_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_10_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_10_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_10_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_10_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_10_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_10_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_10_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_11_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_11_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_11_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_12_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_12_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_12_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_13_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_13_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_13_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_14_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_14_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_14_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_15_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_15_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_15_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_15_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_15_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_15_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_15_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_15_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_16_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_16_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_16_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_17_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_17_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_17_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_18_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_18_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_18_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_19_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_19_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_19_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_20_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_20_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_20_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_20_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_20_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_20_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_20_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_20_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_21_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_21_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_21_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_22_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_22_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_22_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_23_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_23_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_23_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_24_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_24_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_24_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_25_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_25_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_25_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_26_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_26_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_26_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_27_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_27_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_27_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_ctrl_stealReq_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_ctrl_stealReq_valid; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_data_availableTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_data_availableTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_28_data_availableTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_data_qOutTask_ready; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_connSS_28_data_qOutTask_valid; // @[stealNW_TQ.scala 31:30]
  wire [31:0] stealNet_io_connSS_28_data_qOutTask_bits; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_1; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_2; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_3; // @[stealNW_TQ.scala 31:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_4; // @[stealNW_TQ.scala 31:30]
  wire  stealServers_0_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_0_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_0_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_0_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_0_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_0_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_1_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_1_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_1_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_1_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_1_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_2_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_2_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_2_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_2_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_2_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_3_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_3_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_3_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_3_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_3_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_4_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_4_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_4_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_4_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_4_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_4_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_5_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_5_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_5_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_5_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_5_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_5_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_6_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_6_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_6_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_6_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_6_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_6_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_7_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_7_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_7_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_7_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_7_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_7_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_8_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_8_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_8_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_8_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_8_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_8_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_9_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_9_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_9_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_9_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_9_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_9_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_10_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_10_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_10_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_10_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_10_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_10_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_11_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_11_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_11_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_11_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_11_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_11_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_12_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_12_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_12_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_12_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_12_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_12_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_13_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_13_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_13_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_13_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_13_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_13_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_14_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_14_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_14_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_14_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_14_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_14_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_15_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_15_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_15_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_15_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_15_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_15_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_16_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_16_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_16_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_16_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_16_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_16_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_17_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_17_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_17_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_17_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_17_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_17_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_18_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_18_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_18_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_18_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_18_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_18_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_19_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_19_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_19_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_19_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_19_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_19_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_20_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_20_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_20_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_20_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_20_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_20_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_21_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_21_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_21_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_21_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_21_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_21_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_22_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_22_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_22_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_22_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_22_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_22_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_clock; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_reset; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_23_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_23_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 48:49]
  wire [5:0] stealServers_23_io_connQ_currLength; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connQ_push_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connQ_push_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_23_io_connQ_push_bits; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connQ_pop_ready; // @[stealNW_TQ.scala 48:49]
  wire  stealServers_23_io_connQ_pop_valid; // @[stealNW_TQ.scala 48:49]
  wire [31:0] stealServers_23_io_connQ_pop_bits; // @[stealNW_TQ.scala 48:49]
  wire  taskQueues_0_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_0_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_0_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_0_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_0_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_1_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_1_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_1_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_1_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_2_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_2_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_2_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_2_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_3_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_3_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_3_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_3_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_4_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_4_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_4_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_4_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_4_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_4_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_5_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_5_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_5_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_5_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_5_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_5_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_6_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_6_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_6_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_6_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_6_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_6_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_7_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_7_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_7_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_7_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_7_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_7_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_8_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_8_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_8_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_8_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_8_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_8_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_9_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_9_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_9_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_9_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_9_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_9_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_10_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_10_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_10_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_10_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_10_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_10_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_11_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_11_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_11_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_11_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_11_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_11_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_12_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_12_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_12_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_12_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_12_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_12_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_13_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_13_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_13_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_13_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_13_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_13_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_14_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_14_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_14_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_14_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_14_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_14_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_15_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_15_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_15_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_15_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_15_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_15_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_16_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_16_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_16_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_16_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_16_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_16_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_17_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_17_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_17_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_17_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_17_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_17_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_18_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_18_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_18_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_18_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_18_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_18_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_19_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_19_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_19_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_19_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_19_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_19_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_20_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_20_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_20_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_20_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_20_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_20_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_21_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_21_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_21_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_21_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_21_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_21_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_22_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_22_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_22_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_22_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_22_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_22_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_clock; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_reset; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_0_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_0_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_23_io_connVec_0_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_23_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 52:49]
  wire [6:0] taskQueues_23_io_connVec_1_currLength; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_1_push_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_1_push_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_23_io_connVec_1_push_bits; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 52:49]
  wire  taskQueues_23_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 52:49]
  wire [31:0] taskQueues_23_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 52:49]
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
    .io_connSS_5_data_availableTask_ready(stealNet_io_connSS_5_data_availableTask_ready),
    .io_connSS_5_data_availableTask_valid(stealNet_io_connSS_5_data_availableTask_valid),
    .io_connSS_5_data_availableTask_bits(stealNet_io_connSS_5_data_availableTask_bits),
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
    .io_connSS_7_ctrl_stealReq_ready(stealNet_io_connSS_7_ctrl_stealReq_ready),
    .io_connSS_7_ctrl_stealReq_valid(stealNet_io_connSS_7_ctrl_stealReq_valid),
    .io_connSS_7_data_availableTask_ready(stealNet_io_connSS_7_data_availableTask_ready),
    .io_connSS_7_data_availableTask_valid(stealNet_io_connSS_7_data_availableTask_valid),
    .io_connSS_7_data_availableTask_bits(stealNet_io_connSS_7_data_availableTask_bits),
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
    .io_connSS_9_ctrl_serveStealReq_ready(stealNet_io_connSS_9_ctrl_serveStealReq_ready),
    .io_connSS_9_ctrl_serveStealReq_valid(stealNet_io_connSS_9_ctrl_serveStealReq_valid),
    .io_connSS_9_ctrl_stealReq_ready(stealNet_io_connSS_9_ctrl_stealReq_ready),
    .io_connSS_9_ctrl_stealReq_valid(stealNet_io_connSS_9_ctrl_stealReq_valid),
    .io_connSS_9_data_availableTask_ready(stealNet_io_connSS_9_data_availableTask_ready),
    .io_connSS_9_data_availableTask_valid(stealNet_io_connSS_9_data_availableTask_valid),
    .io_connSS_9_data_availableTask_bits(stealNet_io_connSS_9_data_availableTask_bits),
    .io_connSS_9_data_qOutTask_ready(stealNet_io_connSS_9_data_qOutTask_ready),
    .io_connSS_9_data_qOutTask_valid(stealNet_io_connSS_9_data_qOutTask_valid),
    .io_connSS_9_data_qOutTask_bits(stealNet_io_connSS_9_data_qOutTask_bits),
    .io_connSS_10_ctrl_serveStealReq_ready(stealNet_io_connSS_10_ctrl_serveStealReq_ready),
    .io_connSS_10_ctrl_serveStealReq_valid(stealNet_io_connSS_10_ctrl_serveStealReq_valid),
    .io_connSS_10_data_availableTask_ready(stealNet_io_connSS_10_data_availableTask_ready),
    .io_connSS_10_data_availableTask_valid(stealNet_io_connSS_10_data_availableTask_valid),
    .io_connSS_10_data_availableTask_bits(stealNet_io_connSS_10_data_availableTask_bits),
    .io_connSS_10_data_qOutTask_ready(stealNet_io_connSS_10_data_qOutTask_ready),
    .io_connSS_10_data_qOutTask_valid(stealNet_io_connSS_10_data_qOutTask_valid),
    .io_connSS_10_data_qOutTask_bits(stealNet_io_connSS_10_data_qOutTask_bits),
    .io_connSS_11_ctrl_serveStealReq_ready(stealNet_io_connSS_11_ctrl_serveStealReq_ready),
    .io_connSS_11_ctrl_serveStealReq_valid(stealNet_io_connSS_11_ctrl_serveStealReq_valid),
    .io_connSS_11_ctrl_stealReq_ready(stealNet_io_connSS_11_ctrl_stealReq_ready),
    .io_connSS_11_ctrl_stealReq_valid(stealNet_io_connSS_11_ctrl_stealReq_valid),
    .io_connSS_11_data_availableTask_ready(stealNet_io_connSS_11_data_availableTask_ready),
    .io_connSS_11_data_availableTask_valid(stealNet_io_connSS_11_data_availableTask_valid),
    .io_connSS_11_data_availableTask_bits(stealNet_io_connSS_11_data_availableTask_bits),
    .io_connSS_11_data_qOutTask_ready(stealNet_io_connSS_11_data_qOutTask_ready),
    .io_connSS_11_data_qOutTask_valid(stealNet_io_connSS_11_data_qOutTask_valid),
    .io_connSS_11_data_qOutTask_bits(stealNet_io_connSS_11_data_qOutTask_bits),
    .io_connSS_12_ctrl_serveStealReq_ready(stealNet_io_connSS_12_ctrl_serveStealReq_ready),
    .io_connSS_12_ctrl_serveStealReq_valid(stealNet_io_connSS_12_ctrl_serveStealReq_valid),
    .io_connSS_12_ctrl_stealReq_ready(stealNet_io_connSS_12_ctrl_stealReq_ready),
    .io_connSS_12_ctrl_stealReq_valid(stealNet_io_connSS_12_ctrl_stealReq_valid),
    .io_connSS_12_data_availableTask_ready(stealNet_io_connSS_12_data_availableTask_ready),
    .io_connSS_12_data_availableTask_valid(stealNet_io_connSS_12_data_availableTask_valid),
    .io_connSS_12_data_availableTask_bits(stealNet_io_connSS_12_data_availableTask_bits),
    .io_connSS_12_data_qOutTask_ready(stealNet_io_connSS_12_data_qOutTask_ready),
    .io_connSS_12_data_qOutTask_valid(stealNet_io_connSS_12_data_qOutTask_valid),
    .io_connSS_12_data_qOutTask_bits(stealNet_io_connSS_12_data_qOutTask_bits),
    .io_connSS_13_ctrl_serveStealReq_ready(stealNet_io_connSS_13_ctrl_serveStealReq_ready),
    .io_connSS_13_ctrl_serveStealReq_valid(stealNet_io_connSS_13_ctrl_serveStealReq_valid),
    .io_connSS_13_ctrl_stealReq_ready(stealNet_io_connSS_13_ctrl_stealReq_ready),
    .io_connSS_13_ctrl_stealReq_valid(stealNet_io_connSS_13_ctrl_stealReq_valid),
    .io_connSS_13_data_availableTask_ready(stealNet_io_connSS_13_data_availableTask_ready),
    .io_connSS_13_data_availableTask_valid(stealNet_io_connSS_13_data_availableTask_valid),
    .io_connSS_13_data_availableTask_bits(stealNet_io_connSS_13_data_availableTask_bits),
    .io_connSS_13_data_qOutTask_ready(stealNet_io_connSS_13_data_qOutTask_ready),
    .io_connSS_13_data_qOutTask_valid(stealNet_io_connSS_13_data_qOutTask_valid),
    .io_connSS_13_data_qOutTask_bits(stealNet_io_connSS_13_data_qOutTask_bits),
    .io_connSS_14_ctrl_serveStealReq_ready(stealNet_io_connSS_14_ctrl_serveStealReq_ready),
    .io_connSS_14_ctrl_serveStealReq_valid(stealNet_io_connSS_14_ctrl_serveStealReq_valid),
    .io_connSS_14_ctrl_stealReq_ready(stealNet_io_connSS_14_ctrl_stealReq_ready),
    .io_connSS_14_ctrl_stealReq_valid(stealNet_io_connSS_14_ctrl_stealReq_valid),
    .io_connSS_14_data_availableTask_ready(stealNet_io_connSS_14_data_availableTask_ready),
    .io_connSS_14_data_availableTask_valid(stealNet_io_connSS_14_data_availableTask_valid),
    .io_connSS_14_data_availableTask_bits(stealNet_io_connSS_14_data_availableTask_bits),
    .io_connSS_14_data_qOutTask_ready(stealNet_io_connSS_14_data_qOutTask_ready),
    .io_connSS_14_data_qOutTask_valid(stealNet_io_connSS_14_data_qOutTask_valid),
    .io_connSS_14_data_qOutTask_bits(stealNet_io_connSS_14_data_qOutTask_bits),
    .io_connSS_15_ctrl_serveStealReq_ready(stealNet_io_connSS_15_ctrl_serveStealReq_ready),
    .io_connSS_15_ctrl_serveStealReq_valid(stealNet_io_connSS_15_ctrl_serveStealReq_valid),
    .io_connSS_15_data_availableTask_ready(stealNet_io_connSS_15_data_availableTask_ready),
    .io_connSS_15_data_availableTask_valid(stealNet_io_connSS_15_data_availableTask_valid),
    .io_connSS_15_data_availableTask_bits(stealNet_io_connSS_15_data_availableTask_bits),
    .io_connSS_15_data_qOutTask_ready(stealNet_io_connSS_15_data_qOutTask_ready),
    .io_connSS_15_data_qOutTask_valid(stealNet_io_connSS_15_data_qOutTask_valid),
    .io_connSS_15_data_qOutTask_bits(stealNet_io_connSS_15_data_qOutTask_bits),
    .io_connSS_16_ctrl_serveStealReq_ready(stealNet_io_connSS_16_ctrl_serveStealReq_ready),
    .io_connSS_16_ctrl_serveStealReq_valid(stealNet_io_connSS_16_ctrl_serveStealReq_valid),
    .io_connSS_16_ctrl_stealReq_ready(stealNet_io_connSS_16_ctrl_stealReq_ready),
    .io_connSS_16_ctrl_stealReq_valid(stealNet_io_connSS_16_ctrl_stealReq_valid),
    .io_connSS_16_data_availableTask_ready(stealNet_io_connSS_16_data_availableTask_ready),
    .io_connSS_16_data_availableTask_valid(stealNet_io_connSS_16_data_availableTask_valid),
    .io_connSS_16_data_availableTask_bits(stealNet_io_connSS_16_data_availableTask_bits),
    .io_connSS_16_data_qOutTask_ready(stealNet_io_connSS_16_data_qOutTask_ready),
    .io_connSS_16_data_qOutTask_valid(stealNet_io_connSS_16_data_qOutTask_valid),
    .io_connSS_16_data_qOutTask_bits(stealNet_io_connSS_16_data_qOutTask_bits),
    .io_connSS_17_ctrl_serveStealReq_ready(stealNet_io_connSS_17_ctrl_serveStealReq_ready),
    .io_connSS_17_ctrl_serveStealReq_valid(stealNet_io_connSS_17_ctrl_serveStealReq_valid),
    .io_connSS_17_ctrl_stealReq_ready(stealNet_io_connSS_17_ctrl_stealReq_ready),
    .io_connSS_17_ctrl_stealReq_valid(stealNet_io_connSS_17_ctrl_stealReq_valid),
    .io_connSS_17_data_availableTask_ready(stealNet_io_connSS_17_data_availableTask_ready),
    .io_connSS_17_data_availableTask_valid(stealNet_io_connSS_17_data_availableTask_valid),
    .io_connSS_17_data_availableTask_bits(stealNet_io_connSS_17_data_availableTask_bits),
    .io_connSS_17_data_qOutTask_ready(stealNet_io_connSS_17_data_qOutTask_ready),
    .io_connSS_17_data_qOutTask_valid(stealNet_io_connSS_17_data_qOutTask_valid),
    .io_connSS_17_data_qOutTask_bits(stealNet_io_connSS_17_data_qOutTask_bits),
    .io_connSS_18_ctrl_serveStealReq_ready(stealNet_io_connSS_18_ctrl_serveStealReq_ready),
    .io_connSS_18_ctrl_serveStealReq_valid(stealNet_io_connSS_18_ctrl_serveStealReq_valid),
    .io_connSS_18_ctrl_stealReq_ready(stealNet_io_connSS_18_ctrl_stealReq_ready),
    .io_connSS_18_ctrl_stealReq_valid(stealNet_io_connSS_18_ctrl_stealReq_valid),
    .io_connSS_18_data_availableTask_ready(stealNet_io_connSS_18_data_availableTask_ready),
    .io_connSS_18_data_availableTask_valid(stealNet_io_connSS_18_data_availableTask_valid),
    .io_connSS_18_data_availableTask_bits(stealNet_io_connSS_18_data_availableTask_bits),
    .io_connSS_18_data_qOutTask_ready(stealNet_io_connSS_18_data_qOutTask_ready),
    .io_connSS_18_data_qOutTask_valid(stealNet_io_connSS_18_data_qOutTask_valid),
    .io_connSS_18_data_qOutTask_bits(stealNet_io_connSS_18_data_qOutTask_bits),
    .io_connSS_19_ctrl_serveStealReq_ready(stealNet_io_connSS_19_ctrl_serveStealReq_ready),
    .io_connSS_19_ctrl_serveStealReq_valid(stealNet_io_connSS_19_ctrl_serveStealReq_valid),
    .io_connSS_19_ctrl_stealReq_ready(stealNet_io_connSS_19_ctrl_stealReq_ready),
    .io_connSS_19_ctrl_stealReq_valid(stealNet_io_connSS_19_ctrl_stealReq_valid),
    .io_connSS_19_data_availableTask_ready(stealNet_io_connSS_19_data_availableTask_ready),
    .io_connSS_19_data_availableTask_valid(stealNet_io_connSS_19_data_availableTask_valid),
    .io_connSS_19_data_availableTask_bits(stealNet_io_connSS_19_data_availableTask_bits),
    .io_connSS_19_data_qOutTask_ready(stealNet_io_connSS_19_data_qOutTask_ready),
    .io_connSS_19_data_qOutTask_valid(stealNet_io_connSS_19_data_qOutTask_valid),
    .io_connSS_19_data_qOutTask_bits(stealNet_io_connSS_19_data_qOutTask_bits),
    .io_connSS_20_ctrl_serveStealReq_ready(stealNet_io_connSS_20_ctrl_serveStealReq_ready),
    .io_connSS_20_ctrl_serveStealReq_valid(stealNet_io_connSS_20_ctrl_serveStealReq_valid),
    .io_connSS_20_data_availableTask_ready(stealNet_io_connSS_20_data_availableTask_ready),
    .io_connSS_20_data_availableTask_valid(stealNet_io_connSS_20_data_availableTask_valid),
    .io_connSS_20_data_availableTask_bits(stealNet_io_connSS_20_data_availableTask_bits),
    .io_connSS_20_data_qOutTask_ready(stealNet_io_connSS_20_data_qOutTask_ready),
    .io_connSS_20_data_qOutTask_valid(stealNet_io_connSS_20_data_qOutTask_valid),
    .io_connSS_20_data_qOutTask_bits(stealNet_io_connSS_20_data_qOutTask_bits),
    .io_connSS_21_ctrl_serveStealReq_ready(stealNet_io_connSS_21_ctrl_serveStealReq_ready),
    .io_connSS_21_ctrl_serveStealReq_valid(stealNet_io_connSS_21_ctrl_serveStealReq_valid),
    .io_connSS_21_ctrl_stealReq_ready(stealNet_io_connSS_21_ctrl_stealReq_ready),
    .io_connSS_21_ctrl_stealReq_valid(stealNet_io_connSS_21_ctrl_stealReq_valid),
    .io_connSS_21_data_availableTask_ready(stealNet_io_connSS_21_data_availableTask_ready),
    .io_connSS_21_data_availableTask_valid(stealNet_io_connSS_21_data_availableTask_valid),
    .io_connSS_21_data_availableTask_bits(stealNet_io_connSS_21_data_availableTask_bits),
    .io_connSS_21_data_qOutTask_ready(stealNet_io_connSS_21_data_qOutTask_ready),
    .io_connSS_21_data_qOutTask_valid(stealNet_io_connSS_21_data_qOutTask_valid),
    .io_connSS_21_data_qOutTask_bits(stealNet_io_connSS_21_data_qOutTask_bits),
    .io_connSS_22_ctrl_serveStealReq_ready(stealNet_io_connSS_22_ctrl_serveStealReq_ready),
    .io_connSS_22_ctrl_serveStealReq_valid(stealNet_io_connSS_22_ctrl_serveStealReq_valid),
    .io_connSS_22_ctrl_stealReq_ready(stealNet_io_connSS_22_ctrl_stealReq_ready),
    .io_connSS_22_ctrl_stealReq_valid(stealNet_io_connSS_22_ctrl_stealReq_valid),
    .io_connSS_22_data_availableTask_ready(stealNet_io_connSS_22_data_availableTask_ready),
    .io_connSS_22_data_availableTask_valid(stealNet_io_connSS_22_data_availableTask_valid),
    .io_connSS_22_data_availableTask_bits(stealNet_io_connSS_22_data_availableTask_bits),
    .io_connSS_22_data_qOutTask_ready(stealNet_io_connSS_22_data_qOutTask_ready),
    .io_connSS_22_data_qOutTask_valid(stealNet_io_connSS_22_data_qOutTask_valid),
    .io_connSS_22_data_qOutTask_bits(stealNet_io_connSS_22_data_qOutTask_bits),
    .io_connSS_23_ctrl_serveStealReq_ready(stealNet_io_connSS_23_ctrl_serveStealReq_ready),
    .io_connSS_23_ctrl_serveStealReq_valid(stealNet_io_connSS_23_ctrl_serveStealReq_valid),
    .io_connSS_23_ctrl_stealReq_ready(stealNet_io_connSS_23_ctrl_stealReq_ready),
    .io_connSS_23_ctrl_stealReq_valid(stealNet_io_connSS_23_ctrl_stealReq_valid),
    .io_connSS_23_data_availableTask_ready(stealNet_io_connSS_23_data_availableTask_ready),
    .io_connSS_23_data_availableTask_valid(stealNet_io_connSS_23_data_availableTask_valid),
    .io_connSS_23_data_availableTask_bits(stealNet_io_connSS_23_data_availableTask_bits),
    .io_connSS_23_data_qOutTask_ready(stealNet_io_connSS_23_data_qOutTask_ready),
    .io_connSS_23_data_qOutTask_valid(stealNet_io_connSS_23_data_qOutTask_valid),
    .io_connSS_23_data_qOutTask_bits(stealNet_io_connSS_23_data_qOutTask_bits),
    .io_connSS_24_ctrl_serveStealReq_ready(stealNet_io_connSS_24_ctrl_serveStealReq_ready),
    .io_connSS_24_ctrl_serveStealReq_valid(stealNet_io_connSS_24_ctrl_serveStealReq_valid),
    .io_connSS_24_ctrl_stealReq_ready(stealNet_io_connSS_24_ctrl_stealReq_ready),
    .io_connSS_24_ctrl_stealReq_valid(stealNet_io_connSS_24_ctrl_stealReq_valid),
    .io_connSS_24_data_availableTask_ready(stealNet_io_connSS_24_data_availableTask_ready),
    .io_connSS_24_data_availableTask_valid(stealNet_io_connSS_24_data_availableTask_valid),
    .io_connSS_24_data_availableTask_bits(stealNet_io_connSS_24_data_availableTask_bits),
    .io_connSS_24_data_qOutTask_ready(stealNet_io_connSS_24_data_qOutTask_ready),
    .io_connSS_24_data_qOutTask_valid(stealNet_io_connSS_24_data_qOutTask_valid),
    .io_connSS_24_data_qOutTask_bits(stealNet_io_connSS_24_data_qOutTask_bits),
    .io_connSS_25_ctrl_serveStealReq_ready(stealNet_io_connSS_25_ctrl_serveStealReq_ready),
    .io_connSS_25_ctrl_serveStealReq_valid(stealNet_io_connSS_25_ctrl_serveStealReq_valid),
    .io_connSS_25_ctrl_stealReq_ready(stealNet_io_connSS_25_ctrl_stealReq_ready),
    .io_connSS_25_ctrl_stealReq_valid(stealNet_io_connSS_25_ctrl_stealReq_valid),
    .io_connSS_25_data_availableTask_ready(stealNet_io_connSS_25_data_availableTask_ready),
    .io_connSS_25_data_availableTask_valid(stealNet_io_connSS_25_data_availableTask_valid),
    .io_connSS_25_data_availableTask_bits(stealNet_io_connSS_25_data_availableTask_bits),
    .io_connSS_25_data_qOutTask_ready(stealNet_io_connSS_25_data_qOutTask_ready),
    .io_connSS_25_data_qOutTask_valid(stealNet_io_connSS_25_data_qOutTask_valid),
    .io_connSS_25_data_qOutTask_bits(stealNet_io_connSS_25_data_qOutTask_bits),
    .io_connSS_26_ctrl_serveStealReq_ready(stealNet_io_connSS_26_ctrl_serveStealReq_ready),
    .io_connSS_26_ctrl_serveStealReq_valid(stealNet_io_connSS_26_ctrl_serveStealReq_valid),
    .io_connSS_26_ctrl_stealReq_ready(stealNet_io_connSS_26_ctrl_stealReq_ready),
    .io_connSS_26_ctrl_stealReq_valid(stealNet_io_connSS_26_ctrl_stealReq_valid),
    .io_connSS_26_data_availableTask_ready(stealNet_io_connSS_26_data_availableTask_ready),
    .io_connSS_26_data_availableTask_valid(stealNet_io_connSS_26_data_availableTask_valid),
    .io_connSS_26_data_availableTask_bits(stealNet_io_connSS_26_data_availableTask_bits),
    .io_connSS_26_data_qOutTask_ready(stealNet_io_connSS_26_data_qOutTask_ready),
    .io_connSS_26_data_qOutTask_valid(stealNet_io_connSS_26_data_qOutTask_valid),
    .io_connSS_26_data_qOutTask_bits(stealNet_io_connSS_26_data_qOutTask_bits),
    .io_connSS_27_ctrl_serveStealReq_ready(stealNet_io_connSS_27_ctrl_serveStealReq_ready),
    .io_connSS_27_ctrl_serveStealReq_valid(stealNet_io_connSS_27_ctrl_serveStealReq_valid),
    .io_connSS_27_ctrl_stealReq_ready(stealNet_io_connSS_27_ctrl_stealReq_ready),
    .io_connSS_27_ctrl_stealReq_valid(stealNet_io_connSS_27_ctrl_stealReq_valid),
    .io_connSS_27_data_availableTask_ready(stealNet_io_connSS_27_data_availableTask_ready),
    .io_connSS_27_data_availableTask_valid(stealNet_io_connSS_27_data_availableTask_valid),
    .io_connSS_27_data_availableTask_bits(stealNet_io_connSS_27_data_availableTask_bits),
    .io_connSS_27_data_qOutTask_ready(stealNet_io_connSS_27_data_qOutTask_ready),
    .io_connSS_27_data_qOutTask_valid(stealNet_io_connSS_27_data_qOutTask_valid),
    .io_connSS_27_data_qOutTask_bits(stealNet_io_connSS_27_data_qOutTask_bits),
    .io_connSS_28_ctrl_serveStealReq_ready(stealNet_io_connSS_28_ctrl_serveStealReq_ready),
    .io_connSS_28_ctrl_serveStealReq_valid(stealNet_io_connSS_28_ctrl_serveStealReq_valid),
    .io_connSS_28_ctrl_stealReq_ready(stealNet_io_connSS_28_ctrl_stealReq_ready),
    .io_connSS_28_ctrl_stealReq_valid(stealNet_io_connSS_28_ctrl_stealReq_valid),
    .io_connSS_28_data_availableTask_ready(stealNet_io_connSS_28_data_availableTask_ready),
    .io_connSS_28_data_availableTask_valid(stealNet_io_connSS_28_data_availableTask_valid),
    .io_connSS_28_data_availableTask_bits(stealNet_io_connSS_28_data_availableTask_bits),
    .io_connSS_28_data_qOutTask_ready(stealNet_io_connSS_28_data_qOutTask_ready),
    .io_connSS_28_data_qOutTask_valid(stealNet_io_connSS_28_data_qOutTask_valid),
    .io_connSS_28_data_qOutTask_bits(stealNet_io_connSS_28_data_qOutTask_bits),
    .io_ntwDataUnitOccupancyVSS_0(stealNet_io_ntwDataUnitOccupancyVSS_0),
    .io_ntwDataUnitOccupancyVSS_1(stealNet_io_ntwDataUnitOccupancyVSS_1),
    .io_ntwDataUnitOccupancyVSS_2(stealNet_io_ntwDataUnitOccupancyVSS_2),
    .io_ntwDataUnitOccupancyVSS_3(stealNet_io_ntwDataUnitOccupancyVSS_3),
    .io_ntwDataUnitOccupancyVSS_4(stealNet_io_ntwDataUnitOccupancyVSS_4)
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
  stealServer stealServers_4 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_4_clock),
    .reset(stealServers_4_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_4_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_4_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_4_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_4_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_4_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_4_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_4_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_4_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_4_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_4_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_4_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_4_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_4_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_4_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_4_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_4_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_4_io_connQ_pop_bits)
  );
  stealServer stealServers_5 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_5_clock),
    .reset(stealServers_5_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_5_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_5_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_5_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_5_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_5_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_5_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_5_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_5_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_5_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_5_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_5_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_5_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_5_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_5_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_5_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_5_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_5_io_connQ_pop_bits)
  );
  stealServer stealServers_6 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_6_clock),
    .reset(stealServers_6_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_6_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_6_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_6_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_6_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_6_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_6_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_6_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_6_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_6_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_6_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_6_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_6_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_6_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_6_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_6_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_6_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_6_io_connQ_pop_bits)
  );
  stealServer stealServers_7 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_7_clock),
    .reset(stealServers_7_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_7_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_7_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_7_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_7_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_7_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_7_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_7_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_7_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_7_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_7_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_7_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_7_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_7_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_7_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_7_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_7_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_7_io_connQ_pop_bits)
  );
  stealServer stealServers_8 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_8_clock),
    .reset(stealServers_8_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_8_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_8_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_8_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_8_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_8_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_8_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_8_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_8_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_8_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_8_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_8_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_8_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_8_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_8_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_8_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_8_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_8_io_connQ_pop_bits)
  );
  stealServer stealServers_9 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_9_clock),
    .reset(stealServers_9_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_9_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_9_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_9_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_9_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_9_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_9_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_9_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_9_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_9_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_9_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_9_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_9_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_9_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_9_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_9_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_9_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_9_io_connQ_pop_bits)
  );
  stealServer stealServers_10 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_10_clock),
    .reset(stealServers_10_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_10_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_10_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_10_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_10_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_10_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_10_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_10_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_10_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_10_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_10_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_10_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_10_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_10_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_10_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_10_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_10_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_10_io_connQ_pop_bits)
  );
  stealServer stealServers_11 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_11_clock),
    .reset(stealServers_11_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_11_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_11_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_11_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_11_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_11_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_11_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_11_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_11_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_11_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_11_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_11_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_11_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_11_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_11_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_11_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_11_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_11_io_connQ_pop_bits)
  );
  stealServer stealServers_12 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_12_clock),
    .reset(stealServers_12_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_12_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_12_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_12_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_12_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_12_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_12_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_12_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_12_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_12_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_12_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_12_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_12_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_12_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_12_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_12_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_12_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_12_io_connQ_pop_bits)
  );
  stealServer stealServers_13 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_13_clock),
    .reset(stealServers_13_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_13_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_13_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_13_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_13_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_13_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_13_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_13_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_13_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_13_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_13_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_13_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_13_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_13_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_13_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_13_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_13_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_13_io_connQ_pop_bits)
  );
  stealServer stealServers_14 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_14_clock),
    .reset(stealServers_14_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_14_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_14_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_14_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_14_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_14_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_14_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_14_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_14_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_14_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_14_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_14_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_14_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_14_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_14_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_14_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_14_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_14_io_connQ_pop_bits)
  );
  stealServer stealServers_15 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_15_clock),
    .reset(stealServers_15_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_15_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_15_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_15_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_15_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_15_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_15_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_15_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_15_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_15_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_15_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_15_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_15_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_15_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_15_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_15_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_15_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_15_io_connQ_pop_bits)
  );
  stealServer stealServers_16 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_16_clock),
    .reset(stealServers_16_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_16_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_16_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_16_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_16_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_16_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_16_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_16_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_16_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_16_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_16_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_16_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_16_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_16_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_16_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_16_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_16_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_16_io_connQ_pop_bits)
  );
  stealServer stealServers_17 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_17_clock),
    .reset(stealServers_17_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_17_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_17_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_17_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_17_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_17_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_17_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_17_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_17_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_17_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_17_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_17_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_17_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_17_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_17_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_17_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_17_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_17_io_connQ_pop_bits)
  );
  stealServer stealServers_18 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_18_clock),
    .reset(stealServers_18_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_18_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_18_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_18_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_18_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_18_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_18_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_18_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_18_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_18_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_18_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_18_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_18_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_18_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_18_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_18_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_18_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_18_io_connQ_pop_bits)
  );
  stealServer stealServers_19 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_19_clock),
    .reset(stealServers_19_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_19_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_19_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_19_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_19_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_19_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_19_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_19_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_19_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_19_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_19_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_19_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_19_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_19_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_19_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_19_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_19_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_19_io_connQ_pop_bits)
  );
  stealServer stealServers_20 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_20_clock),
    .reset(stealServers_20_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_20_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_20_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_20_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_20_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_20_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_20_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_20_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_20_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_20_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_20_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_20_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_20_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_20_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_20_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_20_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_20_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_20_io_connQ_pop_bits)
  );
  stealServer stealServers_21 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_21_clock),
    .reset(stealServers_21_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_21_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_21_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_21_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_21_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_21_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_21_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_21_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_21_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_21_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_21_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_21_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_21_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_21_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_21_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_21_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_21_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_21_io_connQ_pop_bits)
  );
  stealServer stealServers_22 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_22_clock),
    .reset(stealServers_22_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_22_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_22_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_22_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_22_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_22_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_22_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_22_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_22_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_22_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_22_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_22_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_22_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_22_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_22_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_22_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_22_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_22_io_connQ_pop_bits)
  );
  stealServer stealServers_23 ( // @[stealNW_TQ.scala 48:49]
    .clock(stealServers_23_clock),
    .reset(stealServers_23_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(stealServers_23_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(stealServers_23_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_ctrl_stealReq_ready(stealServers_23_io_connNetwork_ctrl_stealReq_ready),
    .io_connNetwork_ctrl_stealReq_valid(stealServers_23_io_connNetwork_ctrl_stealReq_valid),
    .io_connNetwork_data_availableTask_ready(stealServers_23_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(stealServers_23_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(stealServers_23_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(stealServers_23_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(stealServers_23_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(stealServers_23_io_connNetwork_data_qOutTask_bits),
    .io_connQ_currLength(stealServers_23_io_connQ_currLength),
    .io_connQ_push_ready(stealServers_23_io_connQ_push_ready),
    .io_connQ_push_valid(stealServers_23_io_connQ_push_valid),
    .io_connQ_push_bits(stealServers_23_io_connQ_push_bits),
    .io_connQ_pop_ready(stealServers_23_io_connQ_pop_ready),
    .io_connQ_pop_valid(stealServers_23_io_connQ_pop_valid),
    .io_connQ_pop_bits(stealServers_23_io_connQ_pop_bits)
  );
  hw_deque taskQueues_0 ( // @[stealNW_TQ.scala 52:49]
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
  hw_deque taskQueues_1 ( // @[stealNW_TQ.scala 52:49]
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
  hw_deque taskQueues_2 ( // @[stealNW_TQ.scala 52:49]
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
  hw_deque taskQueues_3 ( // @[stealNW_TQ.scala 52:49]
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
  hw_deque taskQueues_4 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_4_clock),
    .reset(taskQueues_4_reset),
    .io_connVec_0_push_ready(taskQueues_4_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_4_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_4_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_4_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_4_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_4_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_4_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_4_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_4_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_4_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_4_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_4_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_4_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_5 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_5_clock),
    .reset(taskQueues_5_reset),
    .io_connVec_0_push_ready(taskQueues_5_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_5_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_5_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_5_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_5_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_5_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_5_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_5_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_5_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_5_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_5_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_5_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_5_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_6 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_6_clock),
    .reset(taskQueues_6_reset),
    .io_connVec_0_push_ready(taskQueues_6_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_6_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_6_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_6_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_6_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_6_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_6_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_6_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_6_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_6_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_6_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_6_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_6_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_7 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_7_clock),
    .reset(taskQueues_7_reset),
    .io_connVec_0_push_ready(taskQueues_7_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_7_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_7_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_7_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_7_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_7_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_7_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_7_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_7_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_7_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_7_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_7_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_7_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_8 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_8_clock),
    .reset(taskQueues_8_reset),
    .io_connVec_0_push_ready(taskQueues_8_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_8_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_8_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_8_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_8_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_8_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_8_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_8_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_8_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_8_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_8_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_8_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_8_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_9 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_9_clock),
    .reset(taskQueues_9_reset),
    .io_connVec_0_push_ready(taskQueues_9_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_9_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_9_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_9_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_9_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_9_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_9_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_9_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_9_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_9_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_9_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_9_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_9_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_10 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_10_clock),
    .reset(taskQueues_10_reset),
    .io_connVec_0_push_ready(taskQueues_10_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_10_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_10_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_10_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_10_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_10_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_10_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_10_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_10_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_10_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_10_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_10_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_10_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_11 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_11_clock),
    .reset(taskQueues_11_reset),
    .io_connVec_0_push_ready(taskQueues_11_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_11_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_11_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_11_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_11_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_11_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_11_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_11_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_11_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_11_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_11_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_11_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_11_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_12 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_12_clock),
    .reset(taskQueues_12_reset),
    .io_connVec_0_push_ready(taskQueues_12_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_12_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_12_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_12_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_12_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_12_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_12_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_12_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_12_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_12_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_12_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_12_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_12_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_13 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_13_clock),
    .reset(taskQueues_13_reset),
    .io_connVec_0_push_ready(taskQueues_13_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_13_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_13_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_13_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_13_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_13_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_13_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_13_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_13_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_13_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_13_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_13_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_13_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_14 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_14_clock),
    .reset(taskQueues_14_reset),
    .io_connVec_0_push_ready(taskQueues_14_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_14_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_14_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_14_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_14_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_14_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_14_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_14_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_14_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_14_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_14_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_14_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_14_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_15 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_15_clock),
    .reset(taskQueues_15_reset),
    .io_connVec_0_push_ready(taskQueues_15_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_15_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_15_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_15_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_15_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_15_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_15_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_15_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_15_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_15_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_15_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_15_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_15_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_16 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_16_clock),
    .reset(taskQueues_16_reset),
    .io_connVec_0_push_ready(taskQueues_16_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_16_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_16_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_16_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_16_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_16_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_16_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_16_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_16_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_16_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_16_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_16_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_16_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_17 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_17_clock),
    .reset(taskQueues_17_reset),
    .io_connVec_0_push_ready(taskQueues_17_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_17_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_17_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_17_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_17_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_17_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_17_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_17_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_17_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_17_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_17_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_17_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_17_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_18 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_18_clock),
    .reset(taskQueues_18_reset),
    .io_connVec_0_push_ready(taskQueues_18_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_18_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_18_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_18_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_18_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_18_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_18_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_18_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_18_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_18_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_18_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_18_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_18_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_19 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_19_clock),
    .reset(taskQueues_19_reset),
    .io_connVec_0_push_ready(taskQueues_19_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_19_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_19_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_19_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_19_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_19_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_19_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_19_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_19_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_19_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_19_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_19_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_19_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_20 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_20_clock),
    .reset(taskQueues_20_reset),
    .io_connVec_0_push_ready(taskQueues_20_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_20_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_20_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_20_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_20_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_20_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_20_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_20_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_20_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_20_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_20_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_20_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_20_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_21 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_21_clock),
    .reset(taskQueues_21_reset),
    .io_connVec_0_push_ready(taskQueues_21_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_21_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_21_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_21_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_21_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_21_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_21_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_21_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_21_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_21_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_21_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_21_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_21_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_22 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_22_clock),
    .reset(taskQueues_22_reset),
    .io_connVec_0_push_ready(taskQueues_22_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_22_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_22_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_22_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_22_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_22_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_22_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_22_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_22_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_22_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_22_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_22_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_22_io_connVec_1_pop_bits)
  );
  hw_deque taskQueues_23 ( // @[stealNW_TQ.scala 52:49]
    .clock(taskQueues_23_clock),
    .reset(taskQueues_23_reset),
    .io_connVec_0_push_ready(taskQueues_23_io_connVec_0_push_ready),
    .io_connVec_0_push_valid(taskQueues_23_io_connVec_0_push_valid),
    .io_connVec_0_push_bits(taskQueues_23_io_connVec_0_push_bits),
    .io_connVec_0_pop_ready(taskQueues_23_io_connVec_0_pop_ready),
    .io_connVec_0_pop_valid(taskQueues_23_io_connVec_0_pop_valid),
    .io_connVec_0_pop_bits(taskQueues_23_io_connVec_0_pop_bits),
    .io_connVec_1_currLength(taskQueues_23_io_connVec_1_currLength),
    .io_connVec_1_push_ready(taskQueues_23_io_connVec_1_push_ready),
    .io_connVec_1_push_valid(taskQueues_23_io_connVec_1_push_valid),
    .io_connVec_1_push_bits(taskQueues_23_io_connVec_1_push_bits),
    .io_connVec_1_pop_ready(taskQueues_23_io_connVec_1_pop_ready),
    .io_connVec_1_pop_valid(taskQueues_23_io_connVec_1_pop_valid),
    .io_connVec_1_pop_bits(taskQueues_23_io_connVec_1_pop_bits)
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
  assign io_connPE_4_push_ready = taskQueues_4_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_4_pop_valid = taskQueues_4_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_4_pop_bits = taskQueues_4_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_5_push_ready = taskQueues_5_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_5_pop_valid = taskQueues_5_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_5_pop_bits = taskQueues_5_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_6_push_ready = taskQueues_6_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_6_pop_valid = taskQueues_6_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_6_pop_bits = taskQueues_6_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_7_push_ready = taskQueues_7_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_7_pop_valid = taskQueues_7_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_7_pop_bits = taskQueues_7_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_8_push_ready = taskQueues_8_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_8_pop_valid = taskQueues_8_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_8_pop_bits = taskQueues_8_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_9_push_ready = taskQueues_9_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_9_pop_valid = taskQueues_9_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_9_pop_bits = taskQueues_9_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_10_push_ready = taskQueues_10_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_10_pop_valid = taskQueues_10_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_10_pop_bits = taskQueues_10_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_11_push_ready = taskQueues_11_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_11_pop_valid = taskQueues_11_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_11_pop_bits = taskQueues_11_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_12_push_ready = taskQueues_12_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_12_pop_valid = taskQueues_12_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_12_pop_bits = taskQueues_12_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_13_push_ready = taskQueues_13_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_13_pop_valid = taskQueues_13_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_13_pop_bits = taskQueues_13_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_14_push_ready = taskQueues_14_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_14_pop_valid = taskQueues_14_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_14_pop_bits = taskQueues_14_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_15_push_ready = taskQueues_15_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_15_pop_valid = taskQueues_15_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_15_pop_bits = taskQueues_15_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_16_push_ready = taskQueues_16_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_16_pop_valid = taskQueues_16_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_16_pop_bits = taskQueues_16_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_17_push_ready = taskQueues_17_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_17_pop_valid = taskQueues_17_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_17_pop_bits = taskQueues_17_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_18_push_ready = taskQueues_18_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_18_pop_valid = taskQueues_18_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_18_pop_bits = taskQueues_18_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_19_push_ready = taskQueues_19_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_19_pop_valid = taskQueues_19_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_19_pop_bits = taskQueues_19_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_20_push_ready = taskQueues_20_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_20_pop_valid = taskQueues_20_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_20_pop_bits = taskQueues_20_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_21_push_ready = taskQueues_21_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_21_pop_valid = taskQueues_21_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_21_pop_bits = taskQueues_21_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_22_push_ready = taskQueues_22_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_22_pop_valid = taskQueues_22_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_22_pop_bits = taskQueues_22_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_23_push_ready = taskQueues_23_io_connVec_0_push_ready; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_23_pop_valid = taskQueues_23_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 56:37]
  assign io_connPE_23_pop_bits = taskQueues_23_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 56:37]
  assign io_connVSS_0_ctrl_serveStealReq_ready = stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_0_data_availableTask_valid = stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_0_data_availableTask_bits = stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_0_data_qOutTask_ready = stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_1_ctrl_serveStealReq_ready = stealNet_io_connSS_5_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_1_data_availableTask_valid = stealNet_io_connSS_5_data_availableTask_valid; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_1_data_availableTask_bits = stealNet_io_connSS_5_data_availableTask_bits; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_1_data_qOutTask_ready = stealNet_io_connSS_5_data_qOutTask_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_2_ctrl_serveStealReq_ready = stealNet_io_connSS_10_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_2_data_availableTask_valid = stealNet_io_connSS_10_data_availableTask_valid; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_2_data_availableTask_bits = stealNet_io_connSS_10_data_availableTask_bits; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_2_data_qOutTask_ready = stealNet_io_connSS_10_data_qOutTask_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_3_ctrl_serveStealReq_ready = stealNet_io_connSS_15_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_3_data_availableTask_valid = stealNet_io_connSS_15_data_availableTask_valid; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_3_data_availableTask_bits = stealNet_io_connSS_15_data_availableTask_bits; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_3_data_qOutTask_ready = stealNet_io_connSS_15_data_qOutTask_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_4_ctrl_serveStealReq_ready = stealNet_io_connSS_20_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_4_data_availableTask_valid = stealNet_io_connSS_20_data_availableTask_valid; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_4_data_availableTask_bits = stealNet_io_connSS_20_data_availableTask_bits; // @[stealNW_TQ.scala 78:35]
  assign io_connVSS_4_data_qOutTask_ready = stealNet_io_connSS_20_data_qOutTask_ready; // @[stealNW_TQ.scala 78:35]
  assign io_ntwDataUnitOccupancyVSS_0 = stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 92:48]
  assign io_ntwDataUnitOccupancyVSS_1 = stealNet_io_ntwDataUnitOccupancyVSS_1; // @[stealNW_TQ.scala 92:48]
  assign io_ntwDataUnitOccupancyVSS_2 = stealNet_io_ntwDataUnitOccupancyVSS_2; // @[stealNW_TQ.scala 92:48]
  assign io_ntwDataUnitOccupancyVSS_3 = stealNet_io_ntwDataUnitOccupancyVSS_3; // @[stealNW_TQ.scala 92:48]
  assign io_ntwDataUnitOccupancyVSS_4 = stealNet_io_ntwDataUnitOccupancyVSS_4; // @[stealNW_TQ.scala 92:48]
  assign stealNet_clock = clock;
  assign stealNet_reset = reset;
  assign stealNet_io_connSS_0_ctrl_serveStealReq_valid = io_connVSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_0_data_availableTask_ready = io_connVSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_0_data_qOutTask_valid = io_connVSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_0_data_qOutTask_bits = io_connVSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_1_ctrl_serveStealReq_valid = stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_1_ctrl_stealReq_valid = stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_1_data_availableTask_ready = stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_1_data_qOutTask_valid = stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_1_data_qOutTask_bits = stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_2_ctrl_serveStealReq_valid = stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_2_ctrl_stealReq_valid = stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_2_data_availableTask_ready = stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_2_data_qOutTask_valid = stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_2_data_qOutTask_bits = stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_3_ctrl_serveStealReq_valid = stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_3_ctrl_stealReq_valid = stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_3_data_availableTask_ready = stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_3_data_qOutTask_valid = stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_3_data_qOutTask_bits = stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_4_ctrl_serveStealReq_valid = stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_4_ctrl_stealReq_valid = stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_4_data_availableTask_ready = stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_4_data_qOutTask_valid = stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_4_data_qOutTask_bits = stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_5_ctrl_serveStealReq_valid = io_connVSS_1_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_5_data_availableTask_ready = io_connVSS_1_data_availableTask_ready; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_5_data_qOutTask_valid = io_connVSS_1_data_qOutTask_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_5_data_qOutTask_bits = io_connVSS_1_data_qOutTask_bits; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_6_ctrl_serveStealReq_valid = stealServers_4_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_6_ctrl_stealReq_valid = stealServers_4_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_6_data_availableTask_ready = stealServers_4_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_6_data_qOutTask_valid = stealServers_4_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_6_data_qOutTask_bits = stealServers_4_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_7_ctrl_serveStealReq_valid = stealServers_5_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_7_ctrl_stealReq_valid = stealServers_5_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_7_data_availableTask_ready = stealServers_5_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_7_data_qOutTask_valid = stealServers_5_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_7_data_qOutTask_bits = stealServers_5_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_8_ctrl_serveStealReq_valid = stealServers_6_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_8_ctrl_stealReq_valid = stealServers_6_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_8_data_availableTask_ready = stealServers_6_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_8_data_qOutTask_valid = stealServers_6_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_8_data_qOutTask_bits = stealServers_6_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_9_ctrl_serveStealReq_valid = stealServers_7_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_9_ctrl_stealReq_valid = stealServers_7_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_9_data_availableTask_ready = stealServers_7_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_9_data_qOutTask_valid = stealServers_7_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_9_data_qOutTask_bits = stealServers_7_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_10_ctrl_serveStealReq_valid = io_connVSS_2_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_10_data_availableTask_ready = io_connVSS_2_data_availableTask_ready; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_10_data_qOutTask_valid = io_connVSS_2_data_qOutTask_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_10_data_qOutTask_bits = io_connVSS_2_data_qOutTask_bits; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_11_ctrl_serveStealReq_valid = stealServers_8_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_11_ctrl_stealReq_valid = stealServers_8_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_11_data_availableTask_ready = stealServers_8_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_11_data_qOutTask_valid = stealServers_8_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_11_data_qOutTask_bits = stealServers_8_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_12_ctrl_serveStealReq_valid = stealServers_9_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_12_ctrl_stealReq_valid = stealServers_9_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_12_data_availableTask_ready = stealServers_9_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_12_data_qOutTask_valid = stealServers_9_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_12_data_qOutTask_bits = stealServers_9_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_13_ctrl_serveStealReq_valid = stealServers_10_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_13_ctrl_stealReq_valid = stealServers_10_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_13_data_availableTask_ready = stealServers_10_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_13_data_qOutTask_valid = stealServers_10_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_13_data_qOutTask_bits = stealServers_10_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_14_ctrl_serveStealReq_valid = stealServers_11_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_14_ctrl_stealReq_valid = stealServers_11_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_14_data_availableTask_ready = stealServers_11_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_14_data_qOutTask_valid = stealServers_11_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_14_data_qOutTask_bits = stealServers_11_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_15_ctrl_serveStealReq_valid = io_connVSS_3_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_15_data_availableTask_ready = io_connVSS_3_data_availableTask_ready; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_15_data_qOutTask_valid = io_connVSS_3_data_qOutTask_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_15_data_qOutTask_bits = io_connVSS_3_data_qOutTask_bits; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_16_ctrl_serveStealReq_valid = stealServers_12_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_16_ctrl_stealReq_valid = stealServers_12_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_16_data_availableTask_ready = stealServers_12_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_16_data_qOutTask_valid = stealServers_12_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_16_data_qOutTask_bits = stealServers_12_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_17_ctrl_serveStealReq_valid = stealServers_13_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_17_ctrl_stealReq_valid = stealServers_13_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_17_data_availableTask_ready = stealServers_13_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_17_data_qOutTask_valid = stealServers_13_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_17_data_qOutTask_bits = stealServers_13_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_18_ctrl_serveStealReq_valid = stealServers_14_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_18_ctrl_stealReq_valid = stealServers_14_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_18_data_availableTask_ready = stealServers_14_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_18_data_qOutTask_valid = stealServers_14_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_18_data_qOutTask_bits = stealServers_14_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_19_ctrl_serveStealReq_valid = stealServers_15_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_19_ctrl_stealReq_valid = stealServers_15_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_19_data_availableTask_ready = stealServers_15_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_19_data_qOutTask_valid = stealServers_15_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_19_data_qOutTask_bits = stealServers_15_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_20_ctrl_serveStealReq_valid = io_connVSS_4_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_20_data_availableTask_ready = io_connVSS_4_data_availableTask_ready; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_20_data_qOutTask_valid = io_connVSS_4_data_qOutTask_valid; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_20_data_qOutTask_bits = io_connVSS_4_data_qOutTask_bits; // @[stealNW_TQ.scala 78:35]
  assign stealNet_io_connSS_21_ctrl_serveStealReq_valid = stealServers_16_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_21_ctrl_stealReq_valid = stealServers_16_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_21_data_availableTask_ready = stealServers_16_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_21_data_qOutTask_valid = stealServers_16_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_21_data_qOutTask_bits = stealServers_16_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_22_ctrl_serveStealReq_valid = stealServers_17_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_22_ctrl_stealReq_valid = stealServers_17_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_22_data_availableTask_ready = stealServers_17_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_22_data_qOutTask_valid = stealServers_17_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_22_data_qOutTask_bits = stealServers_17_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_23_ctrl_serveStealReq_valid = stealServers_18_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_23_ctrl_stealReq_valid = stealServers_18_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_23_data_availableTask_ready = stealServers_18_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_23_data_qOutTask_valid = stealServers_18_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_23_data_qOutTask_bits = stealServers_18_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_24_ctrl_serveStealReq_valid = stealServers_19_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_24_ctrl_stealReq_valid = stealServers_19_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_24_data_availableTask_ready = stealServers_19_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_24_data_qOutTask_valid = stealServers_19_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_24_data_qOutTask_bits = stealServers_19_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_25_ctrl_serveStealReq_valid = stealServers_20_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_25_ctrl_stealReq_valid = stealServers_20_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_25_data_availableTask_ready = stealServers_20_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_25_data_qOutTask_valid = stealServers_20_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_25_data_qOutTask_bits = stealServers_20_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_26_ctrl_serveStealReq_valid = stealServers_21_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_26_ctrl_stealReq_valid = stealServers_21_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_26_data_availableTask_ready = stealServers_21_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_26_data_qOutTask_valid = stealServers_21_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_26_data_qOutTask_bits = stealServers_21_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_27_ctrl_serveStealReq_valid = stealServers_22_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_27_ctrl_stealReq_valid = stealServers_22_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_27_data_availableTask_ready = stealServers_22_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_27_data_qOutTask_valid = stealServers_22_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_27_data_qOutTask_bits = stealServers_22_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_28_ctrl_serveStealReq_valid = stealServers_23_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_28_ctrl_stealReq_valid = stealServers_23_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_28_data_availableTask_ready = stealServers_23_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_28_data_qOutTask_valid = stealServers_23_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealNet_io_connSS_28_data_qOutTask_bits = stealServers_23_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_0_clock = clock;
  assign stealServers_0_reset = reset;
  assign stealServers_0_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_0_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_1_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_0_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_1_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_0_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_1_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_0_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_0_io_connQ_currLength = taskQueues_0_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_push_ready = taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_pop_valid = taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_0_io_connQ_pop_bits = taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_clock = clock;
  assign stealServers_1_reset = reset;
  assign stealServers_1_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_1_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_2_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_1_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_1_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_1_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_1_io_connQ_currLength = taskQueues_1_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_push_ready = taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_pop_valid = taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_1_io_connQ_pop_bits = taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_clock = clock;
  assign stealServers_2_reset = reset;
  assign stealServers_2_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_2_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_3_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_2_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_3_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_2_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_3_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_2_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_2_io_connQ_currLength = taskQueues_2_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_push_ready = taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_pop_valid = taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_2_io_connQ_pop_bits = taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_clock = clock;
  assign stealServers_3_reset = reset;
  assign stealServers_3_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_3_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_4_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_3_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_3_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_3_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_3_io_connQ_currLength = taskQueues_3_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_push_ready = taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_pop_valid = taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_3_io_connQ_pop_bits = taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_4_clock = clock;
  assign stealServers_4_reset = reset;
  assign stealServers_4_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_6_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_4_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_6_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_4_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_6_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_4_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_6_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_4_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_6_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_4_io_connQ_currLength = taskQueues_4_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_4_io_connQ_push_ready = taskQueues_4_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_4_io_connQ_pop_valid = taskQueues_4_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_4_io_connQ_pop_bits = taskQueues_4_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_5_clock = clock;
  assign stealServers_5_reset = reset;
  assign stealServers_5_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_7_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_5_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_7_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_5_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_7_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_5_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_7_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_5_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_7_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_5_io_connQ_currLength = taskQueues_5_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_5_io_connQ_push_ready = taskQueues_5_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_5_io_connQ_pop_valid = taskQueues_5_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_5_io_connQ_pop_bits = taskQueues_5_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_6_clock = clock;
  assign stealServers_6_reset = reset;
  assign stealServers_6_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_8_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_6_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_8_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_6_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_8_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_6_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_8_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_6_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_8_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_6_io_connQ_currLength = taskQueues_6_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_6_io_connQ_push_ready = taskQueues_6_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_6_io_connQ_pop_valid = taskQueues_6_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_6_io_connQ_pop_bits = taskQueues_6_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_7_clock = clock;
  assign stealServers_7_reset = reset;
  assign stealServers_7_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_9_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_7_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_9_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_7_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_9_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_7_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_9_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_7_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_9_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_7_io_connQ_currLength = taskQueues_7_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_7_io_connQ_push_ready = taskQueues_7_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_7_io_connQ_pop_valid = taskQueues_7_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_7_io_connQ_pop_bits = taskQueues_7_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_8_clock = clock;
  assign stealServers_8_reset = reset;
  assign stealServers_8_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_11_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_8_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_11_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_8_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_11_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_8_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_11_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_8_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_11_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_8_io_connQ_currLength = taskQueues_8_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_8_io_connQ_push_ready = taskQueues_8_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_8_io_connQ_pop_valid = taskQueues_8_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_8_io_connQ_pop_bits = taskQueues_8_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_9_clock = clock;
  assign stealServers_9_reset = reset;
  assign stealServers_9_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_12_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_9_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_12_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_9_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_12_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_9_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_12_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_9_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_12_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_9_io_connQ_currLength = taskQueues_9_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_9_io_connQ_push_ready = taskQueues_9_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_9_io_connQ_pop_valid = taskQueues_9_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_9_io_connQ_pop_bits = taskQueues_9_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_10_clock = clock;
  assign stealServers_10_reset = reset;
  assign stealServers_10_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_13_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_10_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_13_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_10_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_13_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_10_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_13_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_10_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_13_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_10_io_connQ_currLength = taskQueues_10_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_10_io_connQ_push_ready = taskQueues_10_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_10_io_connQ_pop_valid = taskQueues_10_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_10_io_connQ_pop_bits = taskQueues_10_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_11_clock = clock;
  assign stealServers_11_reset = reset;
  assign stealServers_11_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_14_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_11_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_14_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_11_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_14_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_11_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_14_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_11_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_14_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_11_io_connQ_currLength = taskQueues_11_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_11_io_connQ_push_ready = taskQueues_11_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_11_io_connQ_pop_valid = taskQueues_11_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_11_io_connQ_pop_bits = taskQueues_11_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_12_clock = clock;
  assign stealServers_12_reset = reset;
  assign stealServers_12_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_16_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_12_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_16_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_12_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_16_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_12_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_16_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_12_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_16_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_12_io_connQ_currLength = taskQueues_12_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_12_io_connQ_push_ready = taskQueues_12_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_12_io_connQ_pop_valid = taskQueues_12_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_12_io_connQ_pop_bits = taskQueues_12_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_13_clock = clock;
  assign stealServers_13_reset = reset;
  assign stealServers_13_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_17_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_13_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_17_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_13_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_17_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_13_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_17_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_13_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_17_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_13_io_connQ_currLength = taskQueues_13_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_13_io_connQ_push_ready = taskQueues_13_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_13_io_connQ_pop_valid = taskQueues_13_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_13_io_connQ_pop_bits = taskQueues_13_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_14_clock = clock;
  assign stealServers_14_reset = reset;
  assign stealServers_14_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_18_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_14_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_18_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_14_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_18_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_14_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_18_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_14_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_18_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_14_io_connQ_currLength = taskQueues_14_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_14_io_connQ_push_ready = taskQueues_14_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_14_io_connQ_pop_valid = taskQueues_14_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_14_io_connQ_pop_bits = taskQueues_14_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_15_clock = clock;
  assign stealServers_15_reset = reset;
  assign stealServers_15_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_19_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_15_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_19_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_15_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_19_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_15_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_19_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_15_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_19_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_15_io_connQ_currLength = taskQueues_15_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_15_io_connQ_push_ready = taskQueues_15_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_15_io_connQ_pop_valid = taskQueues_15_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_15_io_connQ_pop_bits = taskQueues_15_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_16_clock = clock;
  assign stealServers_16_reset = reset;
  assign stealServers_16_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_21_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_16_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_21_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_16_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_21_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_16_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_21_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_16_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_21_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_16_io_connQ_currLength = taskQueues_16_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_16_io_connQ_push_ready = taskQueues_16_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_16_io_connQ_pop_valid = taskQueues_16_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_16_io_connQ_pop_bits = taskQueues_16_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_17_clock = clock;
  assign stealServers_17_reset = reset;
  assign stealServers_17_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_22_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_17_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_22_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_17_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_22_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_17_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_22_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_17_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_22_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_17_io_connQ_currLength = taskQueues_17_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_17_io_connQ_push_ready = taskQueues_17_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_17_io_connQ_pop_valid = taskQueues_17_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_17_io_connQ_pop_bits = taskQueues_17_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_18_clock = clock;
  assign stealServers_18_reset = reset;
  assign stealServers_18_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_23_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_18_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_23_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_18_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_23_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_18_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_23_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_18_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_23_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_18_io_connQ_currLength = taskQueues_18_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_18_io_connQ_push_ready = taskQueues_18_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_18_io_connQ_pop_valid = taskQueues_18_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_18_io_connQ_pop_bits = taskQueues_18_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_19_clock = clock;
  assign stealServers_19_reset = reset;
  assign stealServers_19_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_24_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_19_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_24_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_19_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_24_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_19_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_24_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_19_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_24_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_19_io_connQ_currLength = taskQueues_19_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_19_io_connQ_push_ready = taskQueues_19_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_19_io_connQ_pop_valid = taskQueues_19_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_19_io_connQ_pop_bits = taskQueues_19_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_20_clock = clock;
  assign stealServers_20_reset = reset;
  assign stealServers_20_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_25_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_20_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_25_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_20_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_25_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_20_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_25_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_20_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_25_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_20_io_connQ_currLength = taskQueues_20_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_20_io_connQ_push_ready = taskQueues_20_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_20_io_connQ_pop_valid = taskQueues_20_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_20_io_connQ_pop_bits = taskQueues_20_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_21_clock = clock;
  assign stealServers_21_reset = reset;
  assign stealServers_21_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_26_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_21_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_26_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_21_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_26_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_21_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_26_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_21_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_26_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_21_io_connQ_currLength = taskQueues_21_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_21_io_connQ_push_ready = taskQueues_21_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_21_io_connQ_pop_valid = taskQueues_21_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_21_io_connQ_pop_bits = taskQueues_21_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_22_clock = clock;
  assign stealServers_22_reset = reset;
  assign stealServers_22_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_27_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_22_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_27_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_22_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_27_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_22_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_27_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_22_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_27_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_22_io_connQ_currLength = taskQueues_22_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_22_io_connQ_push_ready = taskQueues_22_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_22_io_connQ_pop_valid = taskQueues_22_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_22_io_connQ_pop_bits = taskQueues_22_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
  assign stealServers_23_clock = clock;
  assign stealServers_23_reset = reset;
  assign stealServers_23_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_28_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_23_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_28_ctrl_stealReq_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_23_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_28_data_availableTask_valid; // @[stealNW_TQ.scala 81:35]
  assign stealServers_23_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_28_data_availableTask_bits; // @[stealNW_TQ.scala 81:35]
  assign stealServers_23_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_28_data_qOutTask_ready; // @[stealNW_TQ.scala 81:35]
  assign stealServers_23_io_connQ_currLength = taskQueues_23_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 63:37]
  assign stealServers_23_io_connQ_push_ready = taskQueues_23_io_connVec_1_push_ready; // @[stealNW_TQ.scala 63:37]
  assign stealServers_23_io_connQ_pop_valid = taskQueues_23_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 63:37]
  assign stealServers_23_io_connQ_pop_bits = taskQueues_23_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 63:37]
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
  assign taskQueues_4_clock = clock;
  assign taskQueues_4_reset = reset;
  assign taskQueues_4_io_connVec_0_push_valid = io_connPE_4_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_4_io_connVec_0_push_bits = io_connPE_4_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_4_io_connVec_0_pop_ready = io_connPE_4_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_4_io_connVec_1_push_valid = stealServers_4_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_4_io_connVec_1_push_bits = stealServers_4_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_4_io_connVec_1_pop_ready = stealServers_4_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_5_clock = clock;
  assign taskQueues_5_reset = reset;
  assign taskQueues_5_io_connVec_0_push_valid = io_connPE_5_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_5_io_connVec_0_push_bits = io_connPE_5_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_5_io_connVec_0_pop_ready = io_connPE_5_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_5_io_connVec_1_push_valid = stealServers_5_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_5_io_connVec_1_push_bits = stealServers_5_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_5_io_connVec_1_pop_ready = stealServers_5_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_6_clock = clock;
  assign taskQueues_6_reset = reset;
  assign taskQueues_6_io_connVec_0_push_valid = io_connPE_6_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_6_io_connVec_0_push_bits = io_connPE_6_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_6_io_connVec_0_pop_ready = io_connPE_6_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_6_io_connVec_1_push_valid = stealServers_6_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_6_io_connVec_1_push_bits = stealServers_6_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_6_io_connVec_1_pop_ready = stealServers_6_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_7_clock = clock;
  assign taskQueues_7_reset = reset;
  assign taskQueues_7_io_connVec_0_push_valid = io_connPE_7_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_7_io_connVec_0_push_bits = io_connPE_7_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_7_io_connVec_0_pop_ready = io_connPE_7_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_7_io_connVec_1_push_valid = stealServers_7_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_7_io_connVec_1_push_bits = stealServers_7_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_7_io_connVec_1_pop_ready = stealServers_7_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_8_clock = clock;
  assign taskQueues_8_reset = reset;
  assign taskQueues_8_io_connVec_0_push_valid = io_connPE_8_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_8_io_connVec_0_push_bits = io_connPE_8_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_8_io_connVec_0_pop_ready = io_connPE_8_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_8_io_connVec_1_push_valid = stealServers_8_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_8_io_connVec_1_push_bits = stealServers_8_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_8_io_connVec_1_pop_ready = stealServers_8_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_9_clock = clock;
  assign taskQueues_9_reset = reset;
  assign taskQueues_9_io_connVec_0_push_valid = io_connPE_9_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_9_io_connVec_0_push_bits = io_connPE_9_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_9_io_connVec_0_pop_ready = io_connPE_9_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_9_io_connVec_1_push_valid = stealServers_9_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_9_io_connVec_1_push_bits = stealServers_9_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_9_io_connVec_1_pop_ready = stealServers_9_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_10_clock = clock;
  assign taskQueues_10_reset = reset;
  assign taskQueues_10_io_connVec_0_push_valid = io_connPE_10_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_10_io_connVec_0_push_bits = io_connPE_10_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_10_io_connVec_0_pop_ready = io_connPE_10_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_10_io_connVec_1_push_valid = stealServers_10_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_10_io_connVec_1_push_bits = stealServers_10_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_10_io_connVec_1_pop_ready = stealServers_10_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_11_clock = clock;
  assign taskQueues_11_reset = reset;
  assign taskQueues_11_io_connVec_0_push_valid = io_connPE_11_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_11_io_connVec_0_push_bits = io_connPE_11_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_11_io_connVec_0_pop_ready = io_connPE_11_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_11_io_connVec_1_push_valid = stealServers_11_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_11_io_connVec_1_push_bits = stealServers_11_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_11_io_connVec_1_pop_ready = stealServers_11_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_12_clock = clock;
  assign taskQueues_12_reset = reset;
  assign taskQueues_12_io_connVec_0_push_valid = io_connPE_12_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_12_io_connVec_0_push_bits = io_connPE_12_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_12_io_connVec_0_pop_ready = io_connPE_12_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_12_io_connVec_1_push_valid = stealServers_12_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_12_io_connVec_1_push_bits = stealServers_12_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_12_io_connVec_1_pop_ready = stealServers_12_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_13_clock = clock;
  assign taskQueues_13_reset = reset;
  assign taskQueues_13_io_connVec_0_push_valid = io_connPE_13_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_13_io_connVec_0_push_bits = io_connPE_13_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_13_io_connVec_0_pop_ready = io_connPE_13_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_13_io_connVec_1_push_valid = stealServers_13_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_13_io_connVec_1_push_bits = stealServers_13_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_13_io_connVec_1_pop_ready = stealServers_13_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_14_clock = clock;
  assign taskQueues_14_reset = reset;
  assign taskQueues_14_io_connVec_0_push_valid = io_connPE_14_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_14_io_connVec_0_push_bits = io_connPE_14_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_14_io_connVec_0_pop_ready = io_connPE_14_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_14_io_connVec_1_push_valid = stealServers_14_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_14_io_connVec_1_push_bits = stealServers_14_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_14_io_connVec_1_pop_ready = stealServers_14_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_15_clock = clock;
  assign taskQueues_15_reset = reset;
  assign taskQueues_15_io_connVec_0_push_valid = io_connPE_15_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_15_io_connVec_0_push_bits = io_connPE_15_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_15_io_connVec_0_pop_ready = io_connPE_15_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_15_io_connVec_1_push_valid = stealServers_15_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_15_io_connVec_1_push_bits = stealServers_15_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_15_io_connVec_1_pop_ready = stealServers_15_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_16_clock = clock;
  assign taskQueues_16_reset = reset;
  assign taskQueues_16_io_connVec_0_push_valid = io_connPE_16_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_16_io_connVec_0_push_bits = io_connPE_16_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_16_io_connVec_0_pop_ready = io_connPE_16_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_16_io_connVec_1_push_valid = stealServers_16_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_16_io_connVec_1_push_bits = stealServers_16_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_16_io_connVec_1_pop_ready = stealServers_16_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_17_clock = clock;
  assign taskQueues_17_reset = reset;
  assign taskQueues_17_io_connVec_0_push_valid = io_connPE_17_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_17_io_connVec_0_push_bits = io_connPE_17_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_17_io_connVec_0_pop_ready = io_connPE_17_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_17_io_connVec_1_push_valid = stealServers_17_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_17_io_connVec_1_push_bits = stealServers_17_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_17_io_connVec_1_pop_ready = stealServers_17_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_18_clock = clock;
  assign taskQueues_18_reset = reset;
  assign taskQueues_18_io_connVec_0_push_valid = io_connPE_18_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_18_io_connVec_0_push_bits = io_connPE_18_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_18_io_connVec_0_pop_ready = io_connPE_18_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_18_io_connVec_1_push_valid = stealServers_18_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_18_io_connVec_1_push_bits = stealServers_18_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_18_io_connVec_1_pop_ready = stealServers_18_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_19_clock = clock;
  assign taskQueues_19_reset = reset;
  assign taskQueues_19_io_connVec_0_push_valid = io_connPE_19_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_19_io_connVec_0_push_bits = io_connPE_19_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_19_io_connVec_0_pop_ready = io_connPE_19_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_19_io_connVec_1_push_valid = stealServers_19_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_19_io_connVec_1_push_bits = stealServers_19_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_19_io_connVec_1_pop_ready = stealServers_19_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_20_clock = clock;
  assign taskQueues_20_reset = reset;
  assign taskQueues_20_io_connVec_0_push_valid = io_connPE_20_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_20_io_connVec_0_push_bits = io_connPE_20_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_20_io_connVec_0_pop_ready = io_connPE_20_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_20_io_connVec_1_push_valid = stealServers_20_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_20_io_connVec_1_push_bits = stealServers_20_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_20_io_connVec_1_pop_ready = stealServers_20_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_21_clock = clock;
  assign taskQueues_21_reset = reset;
  assign taskQueues_21_io_connVec_0_push_valid = io_connPE_21_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_21_io_connVec_0_push_bits = io_connPE_21_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_21_io_connVec_0_pop_ready = io_connPE_21_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_21_io_connVec_1_push_valid = stealServers_21_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_21_io_connVec_1_push_bits = stealServers_21_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_21_io_connVec_1_pop_ready = stealServers_21_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_22_clock = clock;
  assign taskQueues_22_reset = reset;
  assign taskQueues_22_io_connVec_0_push_valid = io_connPE_22_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_22_io_connVec_0_push_bits = io_connPE_22_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_22_io_connVec_0_pop_ready = io_connPE_22_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_22_io_connVec_1_push_valid = stealServers_22_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_22_io_connVec_1_push_bits = stealServers_22_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_22_io_connVec_1_pop_ready = stealServers_22_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_23_clock = clock;
  assign taskQueues_23_reset = reset;
  assign taskQueues_23_io_connVec_0_push_valid = io_connPE_23_push_valid; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_23_io_connVec_0_push_bits = io_connPE_23_push_bits; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_23_io_connVec_0_pop_ready = io_connPE_23_pop_ready; // @[stealNW_TQ.scala 56:37]
  assign taskQueues_23_io_connVec_1_push_valid = stealServers_23_io_connQ_push_valid; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_23_io_connVec_1_push_bits = stealServers_23_io_connQ_push_bits; // @[stealNW_TQ.scala 63:37]
  assign taskQueues_23_io_connVec_1_pop_ready = stealServers_23_io_connQ_pop_ready; // @[stealNW_TQ.scala 63:37]
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
module virtualStealServer(
  input         clock,
  input         reset,
  input         io_connNetwork_ctrl_serveStealReq_ready,
  output        io_connNetwork_ctrl_serveStealReq_valid,
  output        io_connNetwork_data_availableTask_ready,
  input         io_connNetwork_data_availableTask_valid,
  input  [31:0] io_connNetwork_data_availableTask_bits,
  input         io_connNetwork_data_qOutTask_ready,
  output        io_connNetwork_data_qOutTask_valid,
  output [31:0] io_connNetwork_data_qOutTask_bits,
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
  input  [31:0] io_read_data_bits,
  input         io_write_address_ready,
  output        io_write_address_valid,
  output [63:0] io_write_address_bits,
  input         io_write_data_ready,
  output        io_write_data_valid,
  output [31:0] io_write_data_bits,
  input         io_ntwDataUnitOccupancy
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [63:0] _RAND_5;
  reg [31:0] _RAND_6;
  reg [31:0] _RAND_7;
  reg [31:0] _RAND_8;
  reg [63:0] _RAND_9;
  reg [63:0] _RAND_10;
  reg [31:0] _RAND_11;
  reg [63:0] _RAND_12;
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
  reg [63:0] rAddr; // @[virtualStealServer.scala 61:44]
  reg [63:0] rPause; // @[virtualStealServer.scala 62:44]
  reg [63:0] procInterrupt; // @[virtualStealServer.scala 63:44]
  reg [63:0] maxLength; // @[virtualStealServer.scala 64:44]
  reg [3:0] stateReg; // @[virtualStealServer.scala 65:44]
  reg [63:0] contentionCounter; // @[virtualStealServer.scala 67:44]
  reg  networkCongested; // @[virtualStealServer.scala 69:44]
  reg [31:0] stolenTaskReg; // @[virtualStealServer.scala 70:44]
  reg [31:0] giveTaskReg; // @[virtualStealServer.scala 71:44]
  reg [63:0] fifoTailReg; // @[virtualStealServer.scala 73:44]
  reg [63:0] fifoHeadReg; // @[virtualStealServer.scala 74:44]
  reg  popOrPush; // @[virtualStealServer.scala 75:44]
  wire  _T_1 = ~io_connNetwork_ctrl_serveStealReq_ready & io_ntwDataUnitOccupancy; // @[virtualStealServer.scala 89:52]
  wire [63:0] _contentionCounter_T_1 = contentionCounter + 64'h1; // @[virtualStealServer.scala 92:48]
  wire  _T_4 = contentionCounter != 64'h0; // @[virtualStealServer.scala 94:36]
  wire  _T_5 = io_connNetwork_ctrl_serveStealReq_ready & _T_4; // @[virtualStealServer.scala 93:56]
  wire [63:0] _contentionCounter_T_3 = contentionCounter - 64'h1; // @[virtualStealServer.scala 96:48]
  wire [63:0] _T_12 = 64'h14 - 64'h0; // @[virtualStealServer.scala 104:54]
  wire  _GEN_2 = contentionCounter < _T_12 ? 1'h0 : networkCongested; // @[virtualStealServer.scala 104:63 105:26 107:26]
  wire  _GEN_3 = contentionCounter >= 64'h14 | _GEN_2; // @[virtualStealServer.scala 102:58 103:26]
  wire [63:0] _currLen_T_1 = fifoTailReg - fifoHeadReg; // @[virtualStealServer.scala 254:32]
  wire [63:0] _currLen_T_3 = maxLength - fifoHeadReg; // @[virtualStealServer.scala 257:30]
  wire [63:0] _currLen_T_5 = _currLen_T_3 + fifoTailReg; // @[virtualStealServer.scala 257:44]
  reg [63:0] lengthHistroy; // @[virtualStealServer.scala 251:32]
  wire [63:0] _currLen_T_7 = lengthHistroy + 64'h1; // @[virtualStealServer.scala 264:38]
  wire [63:0] _GEN_108 = popOrPush ? 64'h0 : _currLen_T_7; // @[virtualStealServer.scala 261:24 262:21 264:21]
  wire [63:0] _GEN_109 = fifoTailReg < fifoHeadReg ? _currLen_T_5 : _GEN_108; // @[virtualStealServer.scala 256:42 257:17]
  wire [63:0] currLen = fifoTailReg > fifoHeadReg ? _currLen_T_1 : _GEN_109; // @[virtualStealServer.scala 253:36 254:17]
  wire  _T_19 = ~networkCongested; // @[virtualStealServer.scala 118:20]
  wire [3:0] _GEN_4 = procInterrupt != 64'h0 ? 4'ha : 4'h0; // @[virtualStealServer.scala 120:42 121:22 124:22]
  wire [63:0] _GEN_5 = procInterrupt != 64'h0 ? 64'hffffffffffffffff : rPause; // @[virtualStealServer.scala 120:42 122:22 62:44]
  wire [3:0] _GEN_6 = ~networkCongested & currLen != 64'h0 ? 4'h6 : _GEN_4; // @[virtualStealServer.scala 118:57 119:22]
  wire [63:0] _GEN_7 = ~networkCongested & currLen != 64'h0 ? rPause : _GEN_5; // @[virtualStealServer.scala 118:57 62:44]
  wire [63:0] _GEN_9 = networkCongested ? rPause : _GEN_7; // @[virtualStealServer.scala 116:37 62:44]
  wire [63:0] _GEN_11 = currLen == maxLength & networkCongested | maxLength == 64'h0 ? 64'hffffffffffffffff : _GEN_9; // @[virtualStealServer.scala 113:79 115:22]
  wire  _T_23 = stateReg == 4'h2; // @[virtualStealServer.scala 126:25]
  wire [1:0] _GEN_12 = _T_19 ? 2'h0 : 2'h2; // @[virtualStealServer.scala 129:38 130:22 132:22]
  wire [2:0] _GEN_13 = io_connNetwork_data_availableTask_valid ? 3'h4 : {{1'd0}, _GEN_12}; // @[virtualStealServer.scala 127:54 128:22]
  wire  _T_25 = stateReg == 4'h4; // @[virtualStealServer.scala 134:25]
  wire [2:0] _GEN_14 = _T_19 ? 3'h0 : 3'h4; // @[virtualStealServer.scala 137:38 138:22 140:22]
  wire [2:0] _GEN_15 = io_write_address_ready ? 3'h3 : _GEN_14; // @[virtualStealServer.scala 135:37 136:22]
  wire  _T_27 = stateReg == 4'h3; // @[virtualStealServer.scala 142:25]
  wire [63:0] _T_29 = maxLength - 64'h1; // @[virtualStealServer.scala 146:42]
  wire [63:0] _fifoTailReg_T_1 = fifoTailReg + 64'h1; // @[virtualStealServer.scala 147:44]
  wire [63:0] _GEN_16 = fifoTailReg < _T_29 ? _fifoTailReg_T_1 : 64'h0; // @[virtualStealServer.scala 146:48 147:29 149:29]
  wire [1:0] _GEN_17 = io_write_data_ready ? 2'h0 : 2'h3; // @[virtualStealServer.scala 143:34 144:22 152:22]
  wire  _GEN_18 = io_write_data_ready ? 1'h0 : popOrPush; // @[virtualStealServer.scala 143:34 145:23 75:44]
  wire [63:0] _GEN_19 = io_write_data_ready ? _GEN_16 : fifoTailReg; // @[virtualStealServer.scala 143:34 73:44]
  wire  _T_31 = stateReg == 4'h6; // @[virtualStealServer.scala 154:25]
  wire [2:0] _GEN_20 = networkCongested ? 3'h0 : 3'h6; // @[virtualStealServer.scala 157:37 158:22 160:22]
  wire [2:0] _GEN_21 = io_read_address_ready ? 3'h5 : _GEN_20; // @[virtualStealServer.scala 155:36 156:22]
  wire  _T_32 = stateReg == 4'h5; // @[virtualStealServer.scala 162:25]
  wire [63:0] _fifoHeadReg_T_1 = fifoHeadReg + 64'h1; // @[virtualStealServer.scala 167:44]
  wire [63:0] _GEN_22 = fifoHeadReg < _T_29 ? _fifoHeadReg_T_1 : 64'h0; // @[virtualStealServer.scala 166:48 167:29 169:29]
  wire [3:0] _GEN_23 = io_read_data_valid ? 4'h8 : 4'h5; // @[virtualStealServer.scala 163:33 164:22 172:22]
  wire  _GEN_24 = io_read_data_valid | popOrPush; // @[virtualStealServer.scala 163:33 165:23 75:44]
  wire [63:0] _GEN_25 = io_read_data_valid ? _GEN_22 : fifoHeadReg; // @[virtualStealServer.scala 163:33 74:44]
  wire  _T_36 = stateReg == 4'h7; // @[virtualStealServer.scala 174:25]
  wire [2:0] _GEN_26 = io_connNetwork_data_qOutTask_ready ? 3'h0 : 3'h7; // @[virtualStealServer.scala 175:49 176:22 178:22]
  wire  _T_37 = stateReg == 4'h8; // @[virtualStealServer.scala 180:25]
  wire [31:0] _GEN_27 = networkCongested ? giveTaskReg : stolenTaskReg; // @[virtualStealServer.scala 186:39 187:27 70:44]
  wire [3:0] _GEN_28 = networkCongested ? 4'h4 : 4'h8; // @[virtualStealServer.scala 186:39 188:22 192:22]
  wire [3:0] _GEN_29 = io_connNetwork_ctrl_serveStealReq_ready ? 4'h7 : _GEN_28; // @[virtualStealServer.scala 181:54 182:22]
  wire [31:0] _GEN_30 = io_connNetwork_ctrl_serveStealReq_ready ? stolenTaskReg : _GEN_27; // @[virtualStealServer.scala 181:54 70:44]
  wire  _T_39 = rPause == 64'h0; // @[virtualStealServer.scala 195:21]
  wire [3:0] _GEN_31 = rPause == 64'h0 ? 4'h0 : 4'h9; // @[virtualStealServer.scala 195:33 196:22 198:22]
  wire [3:0] _GEN_32 = _T_39 ? 4'h0 : 4'ha; // @[virtualStealServer.scala 201:33 202:22 204:22]
  wire [3:0] _GEN_33 = stateReg == 4'ha ? _GEN_32 : 4'h0; // @[virtualStealServer.scala 200:53 207:18]
  wire [3:0] _GEN_34 = stateReg == 4'h9 ? _GEN_31 : _GEN_33; // @[virtualStealServer.scala 194:46]
  wire [3:0] _GEN_35 = stateReg == 4'h8 ? _GEN_29 : _GEN_34; // @[virtualStealServer.scala 180:54]
  wire [31:0] _GEN_36 = stateReg == 4'h8 ? _GEN_30 : stolenTaskReg; // @[virtualStealServer.scala 180:54 70:44]
  wire [3:0] _GEN_37 = stateReg == 4'h7 ? {{1'd0}, _GEN_26} : _GEN_35; // @[virtualStealServer.scala 174:48]
  wire [31:0] _GEN_38 = stateReg == 4'h7 ? stolenTaskReg : _GEN_36; // @[virtualStealServer.scala 174:48 70:44]
  wire [3:0] _GEN_39 = stateReg == 4'h5 ? _GEN_23 : _GEN_37; // @[virtualStealServer.scala 162:43]
  wire  _GEN_40 = stateReg == 4'h5 ? _GEN_24 : popOrPush; // @[virtualStealServer.scala 162:43 75:44]
  wire [63:0] _GEN_41 = stateReg == 4'h5 ? _GEN_25 : fifoHeadReg; // @[virtualStealServer.scala 162:43 74:44]
  wire [31:0] _GEN_42 = stateReg == 4'h5 ? stolenTaskReg : _GEN_38; // @[virtualStealServer.scala 162:43 70:44]
  wire [3:0] _GEN_43 = stateReg == 4'h6 ? {{1'd0}, _GEN_21} : _GEN_39; // @[virtualStealServer.scala 154:50]
  wire  _GEN_44 = stateReg == 4'h6 ? popOrPush : _GEN_40; // @[virtualStealServer.scala 154:50 75:44]
  wire [63:0] _GEN_45 = stateReg == 4'h6 ? fifoHeadReg : _GEN_41; // @[virtualStealServer.scala 154:50 74:44]
  wire [31:0] _GEN_46 = stateReg == 4'h6 ? stolenTaskReg : _GEN_42; // @[virtualStealServer.scala 154:50 70:44]
  wire [3:0] _GEN_47 = stateReg == 4'h3 ? {{2'd0}, _GEN_17} : _GEN_43; // @[virtualStealServer.scala 142:44]
  wire  _GEN_48 = stateReg == 4'h3 ? _GEN_18 : _GEN_44; // @[virtualStealServer.scala 142:44]
  wire [63:0] _GEN_49 = stateReg == 4'h3 ? _GEN_19 : fifoTailReg; // @[virtualStealServer.scala 142:44 73:44]
  wire [63:0] _GEN_50 = stateReg == 4'h3 ? fifoHeadReg : _GEN_45; // @[virtualStealServer.scala 142:44 74:44]
  wire [31:0] _GEN_51 = stateReg == 4'h3 ? stolenTaskReg : _GEN_46; // @[virtualStealServer.scala 142:44 70:44]
  wire  _GEN_53 = stateReg == 4'h4 ? popOrPush : _GEN_48; // @[virtualStealServer.scala 134:51 75:44]
  wire [63:0] _GEN_54 = stateReg == 4'h4 ? fifoTailReg : _GEN_49; // @[virtualStealServer.scala 134:51 73:44]
  wire [63:0] _GEN_55 = stateReg == 4'h4 ? fifoHeadReg : _GEN_50; // @[virtualStealServer.scala 134:51 74:44]
  wire [31:0] _GEN_56 = stateReg == 4'h4 ? stolenTaskReg : _GEN_51; // @[virtualStealServer.scala 134:51 70:44]
  wire  _GEN_58 = stateReg == 4'h2 ? popOrPush : _GEN_53; // @[virtualStealServer.scala 126:46 75:44]
  wire [63:0] _GEN_59 = stateReg == 4'h2 ? fifoTailReg : _GEN_54; // @[virtualStealServer.scala 126:46 73:44]
  wire [63:0] _GEN_60 = stateReg == 4'h2 ? fifoHeadReg : _GEN_55; // @[virtualStealServer.scala 126:46 74:44]
  wire [63:0] _GEN_63 = stateReg == 4'h0 ? _GEN_11 : rPause; // @[virtualStealServer.scala 112:34 62:44]
  wire  _GEN_64 = stateReg == 4'h0 ? popOrPush : _GEN_58; // @[virtualStealServer.scala 112:34 75:44]
  wire [63:0] _GEN_65 = stateReg == 4'h0 ? fifoTailReg : _GEN_59; // @[virtualStealServer.scala 112:34 73:44]
  wire [63:0] _GEN_66 = stateReg == 4'h0 ? fifoHeadReg : _GEN_60; // @[virtualStealServer.scala 112:34 74:44]
  wire [65:0] _GEN_136 = {fifoTailReg, 2'h0}; // @[virtualStealServer.scala 235:65]
  wire [66:0] _io_write_address_bits_T = {{1'd0}, _GEN_136}; // @[virtualStealServer.scala 235:65]
  wire [66:0] _GEN_137 = {{3'd0}, rAddr}; // @[virtualStealServer.scala 235:79]
  wire [66:0] _io_write_address_bits_T_2 = _io_write_address_bits_T + _GEN_137; // @[virtualStealServer.scala 235:79]
  wire [65:0] _GEN_138 = {fifoHeadReg, 2'h0}; // @[virtualStealServer.scala 240:65]
  wire [66:0] _io_read_address_bits_T = {{1'd0}, _GEN_138}; // @[virtualStealServer.scala 240:65]
  wire [66:0] _io_read_address_bits_T_2 = _io_read_address_bits_T + _GEN_137; // @[virtualStealServer.scala 240:79]
  wire  _GEN_70 = _T_36 ? 1'h0 : _T_37; // @[virtualStealServer.scala 226:45 244:48]
  wire [31:0] _GEN_72 = _T_32 ? io_read_data_bits : giveTaskReg; // @[virtualStealServer.scala 241:43 243:49 71:44]
  wire  _GEN_73 = _T_32 ? 1'h0 : _T_36; // @[virtualStealServer.scala 241:43 223:45]
  wire  _GEN_74 = _T_32 ? 1'h0 : _GEN_70; // @[virtualStealServer.scala 241:43 226:45]
  wire [66:0] _GEN_76 = _T_31 ? _io_read_address_bits_T_2 : 67'h0; // @[virtualStealServer.scala 216:45 238:50 240:49]
  wire  _GEN_77 = _T_31 ? 1'h0 : _T_32; // @[virtualStealServer.scala 217:45 238:50]
  wire [31:0] _GEN_78 = _T_31 ? giveTaskReg : _GEN_72; // @[virtualStealServer.scala 238:50 71:44]
  wire  _GEN_79 = _T_31 ? 1'h0 : _GEN_73; // @[virtualStealServer.scala 223:45 238:50]
  wire  _GEN_80 = _T_31 ? 1'h0 : _GEN_74; // @[virtualStealServer.scala 226:45 238:50]
  wire  _GEN_82 = _T_27 ? 1'h0 : _T_31; // @[virtualStealServer.scala 236:44 215:45]
  wire [66:0] _GEN_83 = _T_27 ? 67'h0 : _GEN_76; // @[virtualStealServer.scala 236:44 216:45]
  wire  _GEN_84 = _T_27 ? 1'h0 : _GEN_77; // @[virtualStealServer.scala 236:44 217:45]
  wire  _GEN_86 = _T_27 ? 1'h0 : _GEN_79; // @[virtualStealServer.scala 236:44 223:45]
  wire  _GEN_87 = _T_27 ? 1'h0 : _GEN_80; // @[virtualStealServer.scala 236:44 226:45]
  wire [66:0] _GEN_89 = _T_25 ? _io_write_address_bits_T_2 : 67'h0; // @[virtualStealServer.scala 219:45 233:51 235:49]
  wire  _GEN_90 = _T_25 ? 1'h0 : _T_27; // @[virtualStealServer.scala 220:45 233:51]
  wire  _GEN_91 = _T_25 ? 1'h0 : _GEN_82; // @[virtualStealServer.scala 215:45 233:51]
  wire [66:0] _GEN_92 = _T_25 ? 67'h0 : _GEN_83; // @[virtualStealServer.scala 216:45 233:51]
  wire  _GEN_93 = _T_25 ? 1'h0 : _GEN_84; // @[virtualStealServer.scala 217:45 233:51]
  wire  _GEN_95 = _T_25 ? 1'h0 : _GEN_86; // @[virtualStealServer.scala 223:45 233:51]
  wire  _GEN_96 = _T_25 ? 1'h0 : _GEN_87; // @[virtualStealServer.scala 226:45 233:51]
  wire [66:0] _GEN_100 = _T_23 ? 67'h0 : _GEN_89; // @[virtualStealServer.scala 230:40 219:45]
  wire [66:0] _GEN_103 = _T_23 ? 67'h0 : _GEN_92; // @[virtualStealServer.scala 230:40 216:45]
  wire [63:0] _GEN_113 = 6'h0 == rdAddr ? rPause : 64'hffffffffffffffff; // @[RegisterBlock.scala 220:10 224:38 225:16]
  wire [63:0] _GEN_114 = 6'h8 == rdAddr ? rAddr : _GEN_113; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_115 = 6'h10 == rdAddr ? maxLength : _GEN_114; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_116 = 6'h18 == rdAddr ? fifoTailReg : _GEN_115; // @[RegisterBlock.scala 224:38 225:16]
  wire [63:0] _GEN_117 = 6'h20 == rdAddr ? fifoHeadReg : _GEN_116; // @[RegisterBlock.scala 224:38 225:16]
  wire  _T_58 = ~reset; // @[RegisterBlock.scala 182:11]
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
  wire [7:0] _fifoTailReg_T_10 = wrReqData__bits_strb[0] ? rPause_byte_wdata : fifoTailReg_byte_original; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_1 = fifoTailReg[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_11 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : fifoTailReg_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_2 = fifoTailReg[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_12 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : fifoTailReg_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_3 = fifoTailReg[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_13 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : fifoTailReg_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_4 = fifoTailReg[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_14 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : fifoTailReg_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_5 = fifoTailReg[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_15 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : fifoTailReg_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_6 = fifoTailReg[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_16 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : fifoTailReg_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] fifoTailReg_byte_original_7 = fifoTailReg[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _fifoTailReg_T_17 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : fifoTailReg_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _fifoTailReg_T_18 = {_fifoTailReg_T_17,_fifoTailReg_T_16,_fifoTailReg_T_15,_fifoTailReg_T_14,
    _fifoTailReg_T_13,_fifoTailReg_T_12,_fifoTailReg_T_11,_fifoTailReg_T_10}; // @[Interface.scala 262:7]
  wire [7:0] fifoHeadReg_byte_original = fifoHeadReg[7:0]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_10 = wrReqData__bits_strb[0] ? rPause_byte_wdata : fifoHeadReg_byte_original; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_1 = fifoHeadReg[15:8]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_11 = wrReqData__bits_strb[1] ? rPause_byte_wdata_1 : fifoHeadReg_byte_original_1; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_2 = fifoHeadReg[23:16]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_12 = wrReqData__bits_strb[2] ? rPause_byte_wdata_2 : fifoHeadReg_byte_original_2; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_3 = fifoHeadReg[31:24]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_13 = wrReqData__bits_strb[3] ? rPause_byte_wdata_3 : fifoHeadReg_byte_original_3; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_4 = fifoHeadReg[39:32]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_14 = wrReqData__bits_strb[4] ? rPause_byte_wdata_4 : fifoHeadReg_byte_original_4; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_5 = fifoHeadReg[47:40]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_15 = wrReqData__bits_strb[5] ? rPause_byte_wdata_5 : fifoHeadReg_byte_original_5; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_6 = fifoHeadReg[55:48]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_16 = wrReqData__bits_strb[6] ? rPause_byte_wdata_6 : fifoHeadReg_byte_original_6; // @[Interface.scala 259:14]
  wire [7:0] fifoHeadReg_byte_original_7 = fifoHeadReg[63:56]; // @[Interface.scala 258:39]
  wire [7:0] _fifoHeadReg_T_17 = wrReqData__bits_strb[7] ? rPause_byte_wdata_7 : fifoHeadReg_byte_original_7; // @[Interface.scala 259:14]
  wire [63:0] _fifoHeadReg_T_18 = {_fifoHeadReg_T_17,_fifoHeadReg_T_16,_fifoHeadReg_T_15,_fifoHeadReg_T_14,
    _fifoHeadReg_T_13,_fifoHeadReg_T_12,_fifoHeadReg_T_11,_fifoHeadReg_T_10}; // @[Interface.scala 262:7]
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
  assign io_connNetwork_ctrl_serveStealReq_valid = _T_23 ? 1'h0 : _GEN_96; // @[virtualStealServer.scala 230:40 226:45]
  assign io_connNetwork_data_availableTask_ready = stateReg == 4'h2; // @[virtualStealServer.scala 230:19]
  assign io_connNetwork_data_qOutTask_valid = _T_23 ? 1'h0 : _GEN_95; // @[virtualStealServer.scala 230:40 223:45]
  assign io_connNetwork_data_qOutTask_bits = giveTaskReg; // @[virtualStealServer.scala 210:45]
  assign io_axi_mgmt_ARREADY = rdReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_RVALID = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign io_axi_mgmt_RDATA = 6'h28 == rdAddr ? procInterrupt : _GEN_117; // @[RegisterBlock.scala 224:38 225:16]
  assign io_axi_mgmt_AWREADY = wrReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_WREADY = wrReqData__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_BVALID = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign io_read_address_valid = _T_23 ? 1'h0 : _GEN_91; // @[virtualStealServer.scala 230:40 215:45]
  assign io_read_address_bits = _GEN_103[63:0];
  assign io_read_data_ready = _T_23 ? 1'h0 : _GEN_93; // @[virtualStealServer.scala 230:40 217:45]
  assign io_write_address_valid = _T_23 ? 1'h0 : _T_25; // @[virtualStealServer.scala 230:40 218:45]
  assign io_write_address_bits = _GEN_100[63:0];
  assign io_write_data_valid = _T_23 ? 1'h0 : _GEN_90; // @[virtualStealServer.scala 230:40 220:45]
  assign io_write_data_bits = stolenTaskReg; // @[virtualStealServer.scala 211:45]
  assign rdReq__deq_clock = clock;
  assign rdReq__deq_reset = reset;
  assign rdReq__deq_io_enq_valid = io_axi_mgmt_ARVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 58:20]
  assign rdReq__deq_io_enq_bits_addr = io_axi_mgmt_ARADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 58:20]
  assign rdReq__deq_io_deq_ready = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign wrReq__deq_clock = clock;
  assign wrReq__deq_reset = reset;
  assign wrReq__deq_io_enq_valid = io_axi_mgmt_AWVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 58:20]
  assign wrReq__deq_io_enq_bits_addr = io_axi_mgmt_AWADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 58:20]
  assign wrReq__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign wrReqData__deq_clock = clock;
  assign wrReqData__deq_reset = reset;
  assign wrReqData__deq_io_enq_valid = io_axi_mgmt_WVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 58:20]
  assign wrReqData__deq_io_enq_bits_data = io_axi_mgmt_WDATA; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 58:20]
  assign wrReqData__deq_io_enq_bits_strb = io_axi_mgmt_WSTRB; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 58:20]
  assign wrReqData__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  always @(posedge clock) begin
    if (reset) begin // @[virtualStealServer.scala 61:44]
      rAddr <= 64'h0; // @[virtualStealServer.scala 61:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 273:27]
      if (6'h8 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rAddr <= _rAddr_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 62:44]
      rPause <= 64'h0; // @[virtualStealServer.scala 62:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 273:27]
      if (6'h0 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rPause <= _rPause_T_16; // @[RegisterBlock.scala 118:11]
      end else begin
        rPause <= _GEN_63;
      end
    end else begin
      rPause <= _GEN_63;
    end
    if (reset) begin // @[virtualStealServer.scala 63:44]
      procInterrupt <= 64'h0; // @[virtualStealServer.scala 63:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 273:27]
      if (6'h28 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        procInterrupt <= _procInterrupt_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 64:44]
      maxLength <= 64'h0; // @[virtualStealServer.scala 64:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 273:27]
      if (6'h10 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        maxLength <= _maxLength_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 65:44]
      stateReg <= 4'h0; // @[virtualStealServer.scala 65:44]
    end else if (stateReg == 4'h0) begin // @[virtualStealServer.scala 112:34]
      if (currLen == maxLength & networkCongested | maxLength == 64'h0) begin // @[virtualStealServer.scala 113:79]
        stateReg <= 4'h9; // @[virtualStealServer.scala 114:22]
      end else if (networkCongested) begin // @[virtualStealServer.scala 116:37]
        stateReg <= 4'h2; // @[virtualStealServer.scala 117:22]
      end else begin
        stateReg <= _GEN_6;
      end
    end else if (stateReg == 4'h2) begin // @[virtualStealServer.scala 126:46]
      stateReg <= {{1'd0}, _GEN_13};
    end else if (stateReg == 4'h4) begin // @[virtualStealServer.scala 134:51]
      stateReg <= {{1'd0}, _GEN_15};
    end else begin
      stateReg <= _GEN_47;
    end
    if (reset) begin // @[virtualStealServer.scala 67:44]
      contentionCounter <= 64'h0; // @[virtualStealServer.scala 67:44]
    end else if (_T_1 & contentionCounter != 64'h18) begin // @[virtualStealServer.scala 91:57]
      contentionCounter <= _contentionCounter_T_1; // @[virtualStealServer.scala 92:27]
    end else if (_T_5 & ~io_ntwDataUnitOccupancy) begin // @[virtualStealServer.scala 95:46]
      contentionCounter <= _contentionCounter_T_3; // @[virtualStealServer.scala 96:27]
    end
    if (reset) begin // @[virtualStealServer.scala 69:44]
      networkCongested <= 1'h0; // @[virtualStealServer.scala 69:44]
    end else begin
      networkCongested <= _GEN_3;
    end
    if (reset) begin // @[virtualStealServer.scala 70:44]
      stolenTaskReg <= 32'h0; // @[virtualStealServer.scala 70:44]
    end else if (_T_23) begin // @[virtualStealServer.scala 230:40]
      stolenTaskReg <= io_connNetwork_data_availableTask_bits; // @[virtualStealServer.scala 231:49]
    end else if (!(stateReg == 4'h0)) begin // @[virtualStealServer.scala 112:34]
      if (!(stateReg == 4'h2)) begin // @[virtualStealServer.scala 126:46]
        stolenTaskReg <= _GEN_56;
      end
    end
    if (reset) begin // @[virtualStealServer.scala 71:44]
      giveTaskReg <= 32'h0; // @[virtualStealServer.scala 71:44]
    end else if (!(_T_23)) begin // @[virtualStealServer.scala 230:40]
      if (!(_T_25)) begin // @[virtualStealServer.scala 233:51]
        if (!(_T_27)) begin // @[virtualStealServer.scala 236:44]
          giveTaskReg <= _GEN_78;
        end
      end
    end
    if (reset) begin // @[virtualStealServer.scala 73:44]
      fifoTailReg <= 64'h0; // @[virtualStealServer.scala 73:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 273:27]
      if (6'h18 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoTailReg <= _fifoTailReg_T_18; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoTailReg <= _GEN_65;
      end
    end else begin
      fifoTailReg <= _GEN_65;
    end
    if (reset) begin // @[virtualStealServer.scala 74:44]
      fifoHeadReg <= 64'h0; // @[virtualStealServer.scala 74:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 273:27]
      if (6'h20 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoHeadReg <= _fifoHeadReg_T_18; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoHeadReg <= _GEN_66;
      end
    end else begin
      fifoHeadReg <= _GEN_66;
    end
    popOrPush <= reset | _GEN_64; // @[virtualStealServer.scala 75:{44,44}]
    if (reset) begin // @[virtualStealServer.scala 251:32]
      lengthHistroy <= 64'h0; // @[virtualStealServer.scala 251:32]
    end else if (fifoTailReg > fifoHeadReg) begin // @[virtualStealServer.scala 253:36]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 255:23]
    end else if (fifoTailReg < fifoHeadReg) begin // @[virtualStealServer.scala 256:42]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 258:23]
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
        if (wrReq & _T_58 & ~wrReq) begin
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
        if (~wrReq & (wrReq & _T_58)) begin
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
  _RAND_7 = {1{`RANDOM}};
  stolenTaskReg = _RAND_7[31:0];
  _RAND_8 = {1{`RANDOM}};
  giveTaskReg = _RAND_8[31:0];
  _RAND_9 = {2{`RANDOM}};
  fifoTailReg = _RAND_9[63:0];
  _RAND_10 = {2{`RANDOM}};
  fifoHeadReg = _RAND_10[63:0];
  _RAND_11 = {1{`RANDOM}};
  popOrPush = _RAND_11[0:0];
  _RAND_12 = {2{`RANDOM}};
  lengthHistroy = _RAND_12[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module readyValidMem(
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
  reg [1:0] writeDataDone; // @[readyValidMem.scala 35:30]
  reg  writeHandshakeDetector; // @[readyValidMem.scala 37:39]
  wire  _T_2 = writeDataDone == 2'h1; // @[readyValidMem.scala 56:28]
  wire  _GEN_2 = axi_BVALID ? 1'h0 : writeHandshakeDetector; // @[readyValidMem.scala 74:32 75:32 37:39]
  wire  _GEN_4 = io_write_data_valid & axi_WREADY & ~writeHandshakeDetector | _GEN_2; // @[readyValidMem.scala 71:80 73:32]
  assign io_read_address_ready = axi_ARREADY; // @[readyValidMem.scala 105:31]
  assign io_read_data_valid = axi_RVALID; // @[readyValidMem.scala 114:31]
  assign io_read_data_bits = axi_RDATA; // @[readyValidMem.scala 115:31]
  assign io_write_address_ready = axi_AWREADY; // @[readyValidMem.scala 93:32]
  assign io_write_data_ready = _T_2 & axi_BVALID; // @[readyValidMem.scala 92:60]
  assign axi_ARVALID = io_read_address_valid; // @[readyValidMem.scala 103:31]
  assign axi_ARADDR = io_read_address_bits; // @[readyValidMem.scala 104:31]
  assign axi_RREADY = io_read_data_ready; // @[readyValidMem.scala 112:31]
  assign axi_AWVALID = io_write_address_valid; // @[readyValidMem.scala 79:28]
  assign axi_AWADDR = io_write_address_bits; // @[readyValidMem.scala 80:28]
  assign axi_WVALID = io_write_data_valid & axi_WREADY & ~writeHandshakeDetector; // @[readyValidMem.scala 71:53]
  assign axi_WDATA = io_write_data_bits; // @[readyValidMem.scala 86:28]
  always @(posedge clock) begin
    if (reset) begin // @[readyValidMem.scala 35:30]
      writeDataDone <= 2'h0; // @[readyValidMem.scala 35:30]
    end else if (writeDataDone == 2'h0 & axi_WREADY) begin // @[readyValidMem.scala 54:49]
      writeDataDone <= 2'h1; // @[readyValidMem.scala 55:19]
    end else if (writeDataDone == 2'h1 & axi_BVALID) begin // @[readyValidMem.scala 56:55]
      writeDataDone <= 2'h0; // @[readyValidMem.scala 57:19]
    end
    if (reset) begin // @[readyValidMem.scala 37:39]
      writeHandshakeDetector <= 1'h0; // @[readyValidMem.scala 37:39]
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
module stealSide(
  input         clock,
  input         reset,
  output        io_axi_mgmt_vss_0_ARREADY,
  input         io_axi_mgmt_vss_0_ARVALID,
  input  [5:0]  io_axi_mgmt_vss_0_ARADDR,
  input         io_axi_mgmt_vss_0_RREADY,
  output        io_axi_mgmt_vss_0_RVALID,
  output [63:0] io_axi_mgmt_vss_0_RDATA,
  output        io_axi_mgmt_vss_0_AWREADY,
  input         io_axi_mgmt_vss_0_AWVALID,
  input  [5:0]  io_axi_mgmt_vss_0_AWADDR,
  output        io_axi_mgmt_vss_0_WREADY,
  input         io_axi_mgmt_vss_0_WVALID,
  input  [63:0] io_axi_mgmt_vss_0_WDATA,
  input  [7:0]  io_axi_mgmt_vss_0_WSTRB,
  input         io_axi_mgmt_vss_0_BREADY,
  output        io_axi_mgmt_vss_0_BVALID,
  output        io_axi_mgmt_vss_1_ARREADY,
  input         io_axi_mgmt_vss_1_ARVALID,
  input  [5:0]  io_axi_mgmt_vss_1_ARADDR,
  input         io_axi_mgmt_vss_1_RREADY,
  output        io_axi_mgmt_vss_1_RVALID,
  output [63:0] io_axi_mgmt_vss_1_RDATA,
  output        io_axi_mgmt_vss_1_AWREADY,
  input         io_axi_mgmt_vss_1_AWVALID,
  input  [5:0]  io_axi_mgmt_vss_1_AWADDR,
  output        io_axi_mgmt_vss_1_WREADY,
  input         io_axi_mgmt_vss_1_WVALID,
  input  [63:0] io_axi_mgmt_vss_1_WDATA,
  input  [7:0]  io_axi_mgmt_vss_1_WSTRB,
  input         io_axi_mgmt_vss_1_BREADY,
  output        io_axi_mgmt_vss_1_BVALID,
  output        io_axi_mgmt_vss_2_ARREADY,
  input         io_axi_mgmt_vss_2_ARVALID,
  input  [5:0]  io_axi_mgmt_vss_2_ARADDR,
  input         io_axi_mgmt_vss_2_RREADY,
  output        io_axi_mgmt_vss_2_RVALID,
  output [63:0] io_axi_mgmt_vss_2_RDATA,
  output        io_axi_mgmt_vss_2_AWREADY,
  input         io_axi_mgmt_vss_2_AWVALID,
  input  [5:0]  io_axi_mgmt_vss_2_AWADDR,
  output        io_axi_mgmt_vss_2_WREADY,
  input         io_axi_mgmt_vss_2_WVALID,
  input  [63:0] io_axi_mgmt_vss_2_WDATA,
  input  [7:0]  io_axi_mgmt_vss_2_WSTRB,
  input         io_axi_mgmt_vss_2_BREADY,
  output        io_axi_mgmt_vss_2_BVALID,
  output        io_axi_mgmt_vss_3_ARREADY,
  input         io_axi_mgmt_vss_3_ARVALID,
  input  [5:0]  io_axi_mgmt_vss_3_ARADDR,
  input         io_axi_mgmt_vss_3_RREADY,
  output        io_axi_mgmt_vss_3_RVALID,
  output [63:0] io_axi_mgmt_vss_3_RDATA,
  output        io_axi_mgmt_vss_3_AWREADY,
  input         io_axi_mgmt_vss_3_AWVALID,
  input  [5:0]  io_axi_mgmt_vss_3_AWADDR,
  output        io_axi_mgmt_vss_3_WREADY,
  input         io_axi_mgmt_vss_3_WVALID,
  input  [63:0] io_axi_mgmt_vss_3_WDATA,
  input  [7:0]  io_axi_mgmt_vss_3_WSTRB,
  input         io_axi_mgmt_vss_3_BREADY,
  output        io_axi_mgmt_vss_3_BVALID,
  output        io_axi_mgmt_vss_4_ARREADY,
  input         io_axi_mgmt_vss_4_ARVALID,
  input  [5:0]  io_axi_mgmt_vss_4_ARADDR,
  input         io_axi_mgmt_vss_4_RREADY,
  output        io_axi_mgmt_vss_4_RVALID,
  output [63:0] io_axi_mgmt_vss_4_RDATA,
  output        io_axi_mgmt_vss_4_AWREADY,
  input         io_axi_mgmt_vss_4_AWVALID,
  input  [5:0]  io_axi_mgmt_vss_4_AWADDR,
  output        io_axi_mgmt_vss_4_WREADY,
  input         io_axi_mgmt_vss_4_WVALID,
  input  [63:0] io_axi_mgmt_vss_4_WDATA,
  input  [7:0]  io_axi_mgmt_vss_4_WSTRB,
  input         io_axi_mgmt_vss_4_BREADY,
  output        io_axi_mgmt_vss_4_BVALID,
  input         io_vss_axi_full_0_ARREADY,
  output        io_vss_axi_full_0_ARVALID,
  output [63:0] io_vss_axi_full_0_ARADDR,
  output        io_vss_axi_full_0_RREADY,
  input         io_vss_axi_full_0_RVALID,
  input  [31:0] io_vss_axi_full_0_RDATA,
  input         io_vss_axi_full_0_AWREADY,
  output        io_vss_axi_full_0_AWVALID,
  output [63:0] io_vss_axi_full_0_AWADDR,
  input         io_vss_axi_full_0_WREADY,
  output        io_vss_axi_full_0_WVALID,
  output [31:0] io_vss_axi_full_0_WDATA,
  input         io_vss_axi_full_0_BVALID,
  input         io_vss_axi_full_1_ARREADY,
  output        io_vss_axi_full_1_ARVALID,
  output [63:0] io_vss_axi_full_1_ARADDR,
  output        io_vss_axi_full_1_RREADY,
  input         io_vss_axi_full_1_RVALID,
  input  [31:0] io_vss_axi_full_1_RDATA,
  input         io_vss_axi_full_1_AWREADY,
  output        io_vss_axi_full_1_AWVALID,
  output [63:0] io_vss_axi_full_1_AWADDR,
  input         io_vss_axi_full_1_WREADY,
  output        io_vss_axi_full_1_WVALID,
  output [31:0] io_vss_axi_full_1_WDATA,
  input         io_vss_axi_full_1_BVALID,
  input         io_vss_axi_full_2_ARREADY,
  output        io_vss_axi_full_2_ARVALID,
  output [63:0] io_vss_axi_full_2_ARADDR,
  output        io_vss_axi_full_2_RREADY,
  input         io_vss_axi_full_2_RVALID,
  input  [31:0] io_vss_axi_full_2_RDATA,
  input         io_vss_axi_full_2_AWREADY,
  output        io_vss_axi_full_2_AWVALID,
  output [63:0] io_vss_axi_full_2_AWADDR,
  input         io_vss_axi_full_2_WREADY,
  output        io_vss_axi_full_2_WVALID,
  output [31:0] io_vss_axi_full_2_WDATA,
  input         io_vss_axi_full_2_BVALID,
  input         io_vss_axi_full_3_ARREADY,
  output        io_vss_axi_full_3_ARVALID,
  output [63:0] io_vss_axi_full_3_ARADDR,
  output        io_vss_axi_full_3_RREADY,
  input         io_vss_axi_full_3_RVALID,
  input  [31:0] io_vss_axi_full_3_RDATA,
  input         io_vss_axi_full_3_AWREADY,
  output        io_vss_axi_full_3_AWVALID,
  output [63:0] io_vss_axi_full_3_AWADDR,
  input         io_vss_axi_full_3_WREADY,
  output        io_vss_axi_full_3_WVALID,
  output [31:0] io_vss_axi_full_3_WDATA,
  input         io_vss_axi_full_3_BVALID,
  input         io_vss_axi_full_4_ARREADY,
  output        io_vss_axi_full_4_ARVALID,
  output [63:0] io_vss_axi_full_4_ARADDR,
  output        io_vss_axi_full_4_RREADY,
  input         io_vss_axi_full_4_RVALID,
  input  [31:0] io_vss_axi_full_4_RDATA,
  input         io_vss_axi_full_4_AWREADY,
  output        io_vss_axi_full_4_AWVALID,
  output [63:0] io_vss_axi_full_4_AWADDR,
  input         io_vss_axi_full_4_WREADY,
  output        io_vss_axi_full_4_WVALID,
  output [31:0] io_vss_axi_full_4_WDATA,
  input         io_vss_axi_full_4_BVALID,
  input         io_taskOut_0_TREADY,
  output        io_taskOut_0_TVALID,
  output [31:0] io_taskOut_0_TDATA,
  input         io_taskOut_1_TREADY,
  output        io_taskOut_1_TVALID,
  output [31:0] io_taskOut_1_TDATA,
  input         io_taskOut_2_TREADY,
  output        io_taskOut_2_TVALID,
  output [31:0] io_taskOut_2_TDATA,
  input         io_taskOut_3_TREADY,
  output        io_taskOut_3_TVALID,
  output [31:0] io_taskOut_3_TDATA,
  input         io_taskOut_4_TREADY,
  output        io_taskOut_4_TVALID,
  output [31:0] io_taskOut_4_TDATA,
  input         io_taskOut_5_TREADY,
  output        io_taskOut_5_TVALID,
  output [31:0] io_taskOut_5_TDATA,
  input         io_taskOut_6_TREADY,
  output        io_taskOut_6_TVALID,
  output [31:0] io_taskOut_6_TDATA,
  input         io_taskOut_7_TREADY,
  output        io_taskOut_7_TVALID,
  output [31:0] io_taskOut_7_TDATA,
  input         io_taskOut_8_TREADY,
  output        io_taskOut_8_TVALID,
  output [31:0] io_taskOut_8_TDATA,
  input         io_taskOut_9_TREADY,
  output        io_taskOut_9_TVALID,
  output [31:0] io_taskOut_9_TDATA,
  input         io_taskOut_10_TREADY,
  output        io_taskOut_10_TVALID,
  output [31:0] io_taskOut_10_TDATA,
  input         io_taskOut_11_TREADY,
  output        io_taskOut_11_TVALID,
  output [31:0] io_taskOut_11_TDATA,
  input         io_taskOut_12_TREADY,
  output        io_taskOut_12_TVALID,
  output [31:0] io_taskOut_12_TDATA,
  input         io_taskOut_13_TREADY,
  output        io_taskOut_13_TVALID,
  output [31:0] io_taskOut_13_TDATA,
  input         io_taskOut_14_TREADY,
  output        io_taskOut_14_TVALID,
  output [31:0] io_taskOut_14_TDATA,
  input         io_taskOut_15_TREADY,
  output        io_taskOut_15_TVALID,
  output [31:0] io_taskOut_15_TDATA,
  input         io_taskOut_16_TREADY,
  output        io_taskOut_16_TVALID,
  output [31:0] io_taskOut_16_TDATA,
  input         io_taskOut_17_TREADY,
  output        io_taskOut_17_TVALID,
  output [31:0] io_taskOut_17_TDATA,
  input         io_taskOut_18_TREADY,
  output        io_taskOut_18_TVALID,
  output [31:0] io_taskOut_18_TDATA,
  input         io_taskOut_19_TREADY,
  output        io_taskOut_19_TVALID,
  output [31:0] io_taskOut_19_TDATA,
  input         io_taskOut_20_TREADY,
  output        io_taskOut_20_TVALID,
  output [31:0] io_taskOut_20_TDATA,
  input         io_taskOut_21_TREADY,
  output        io_taskOut_21_TVALID,
  output [31:0] io_taskOut_21_TDATA,
  input         io_taskOut_22_TREADY,
  output        io_taskOut_22_TVALID,
  output [31:0] io_taskOut_22_TDATA,
  input         io_taskOut_23_TREADY,
  output        io_taskOut_23_TVALID,
  output [31:0] io_taskOut_23_TDATA,
  output        io_taskIn_0_TREADY,
  input         io_taskIn_0_TVALID,
  input  [31:0] io_taskIn_0_TDATA,
  output        io_taskIn_1_TREADY,
  input         io_taskIn_1_TVALID,
  input  [31:0] io_taskIn_1_TDATA,
  output        io_taskIn_2_TREADY,
  input         io_taskIn_2_TVALID,
  input  [31:0] io_taskIn_2_TDATA,
  output        io_taskIn_3_TREADY,
  input         io_taskIn_3_TVALID,
  input  [31:0] io_taskIn_3_TDATA,
  output        io_taskIn_4_TREADY,
  input         io_taskIn_4_TVALID,
  input  [31:0] io_taskIn_4_TDATA,
  output        io_taskIn_5_TREADY,
  input         io_taskIn_5_TVALID,
  input  [31:0] io_taskIn_5_TDATA,
  output        io_taskIn_6_TREADY,
  input         io_taskIn_6_TVALID,
  input  [31:0] io_taskIn_6_TDATA,
  output        io_taskIn_7_TREADY,
  input         io_taskIn_7_TVALID,
  input  [31:0] io_taskIn_7_TDATA,
  output        io_taskIn_8_TREADY,
  input         io_taskIn_8_TVALID,
  input  [31:0] io_taskIn_8_TDATA,
  output        io_taskIn_9_TREADY,
  input         io_taskIn_9_TVALID,
  input  [31:0] io_taskIn_9_TDATA,
  output        io_taskIn_10_TREADY,
  input         io_taskIn_10_TVALID,
  input  [31:0] io_taskIn_10_TDATA,
  output        io_taskIn_11_TREADY,
  input         io_taskIn_11_TVALID,
  input  [31:0] io_taskIn_11_TDATA,
  output        io_taskIn_12_TREADY,
  input         io_taskIn_12_TVALID,
  input  [31:0] io_taskIn_12_TDATA,
  output        io_taskIn_13_TREADY,
  input         io_taskIn_13_TVALID,
  input  [31:0] io_taskIn_13_TDATA,
  output        io_taskIn_14_TREADY,
  input         io_taskIn_14_TVALID,
  input  [31:0] io_taskIn_14_TDATA,
  output        io_taskIn_15_TREADY,
  input         io_taskIn_15_TVALID,
  input  [31:0] io_taskIn_15_TDATA,
  output        io_taskIn_16_TREADY,
  input         io_taskIn_16_TVALID,
  input  [31:0] io_taskIn_16_TDATA,
  output        io_taskIn_17_TREADY,
  input         io_taskIn_17_TVALID,
  input  [31:0] io_taskIn_17_TDATA,
  output        io_taskIn_18_TREADY,
  input         io_taskIn_18_TVALID,
  input  [31:0] io_taskIn_18_TDATA,
  output        io_taskIn_19_TREADY,
  input         io_taskIn_19_TVALID,
  input  [31:0] io_taskIn_19_TDATA,
  output        io_taskIn_20_TREADY,
  input         io_taskIn_20_TVALID,
  input  [31:0] io_taskIn_20_TDATA,
  output        io_taskIn_21_TREADY,
  input         io_taskIn_21_TVALID,
  input  [31:0] io_taskIn_21_TDATA,
  output        io_taskIn_22_TREADY,
  input         io_taskIn_22_TVALID,
  input  [31:0] io_taskIn_22_TDATA,
  output        io_taskIn_23_TREADY,
  input         io_taskIn_23_TVALID,
  input  [31:0] io_taskIn_23_TDATA
);
  wire  stealNW_TQ_clock; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_reset; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_0_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_1_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_2_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_3_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_4_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_4_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_4_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_4_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_4_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_4_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_5_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_5_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_5_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_5_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_5_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_5_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_6_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_6_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_6_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_6_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_6_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_6_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_7_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_7_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_7_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_7_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_7_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_7_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_8_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_8_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_8_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_8_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_8_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_8_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_9_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_9_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_9_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_9_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_9_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_9_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_10_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_10_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_10_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_10_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_10_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_10_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_11_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_11_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_11_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_11_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_11_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_11_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_12_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_12_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_12_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_12_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_12_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_12_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_13_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_13_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_13_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_13_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_13_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_13_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_14_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_14_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_14_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_14_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_14_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_14_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_15_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_15_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_15_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_15_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_15_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_15_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_16_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_16_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_16_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_16_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_16_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_16_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_17_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_17_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_17_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_17_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_17_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_17_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_18_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_18_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_18_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_18_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_18_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_18_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_19_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_19_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_19_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_19_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_19_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_19_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_20_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_20_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_20_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_20_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_20_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_20_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_21_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_21_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_21_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_21_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_21_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_21_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_22_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_22_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_22_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_22_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_22_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_22_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_23_push_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_23_push_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_23_push_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_23_pop_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connPE_23_pop_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connPE_23_pop_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_0_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_1_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_1_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_1_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_2_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_2_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_2_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_3_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_3_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_3_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_4_ctrl_serveStealReq_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_4_ctrl_serveStealReq_valid; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_4_data_availableTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_4_data_availableTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_4_data_availableTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_4_data_qOutTask_ready; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_connVSS_4_data_qOutTask_valid; // @[stealSide.scala 53:28]
  wire [31:0] stealNW_TQ_io_connVSS_4_data_qOutTask_bits; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_0; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_1; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_2; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_3; // @[stealSide.scala 53:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_4; // @[stealSide.scala 53:28]
  wire  virtualStealServers_0_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_0_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
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
  wire [31:0] virtualStealServers_0_io_read_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_0_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_1_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
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
  wire [31:0] virtualStealServers_1_io_read_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_1_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_1_io_write_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_1_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_2_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
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
  wire [31:0] virtualStealServers_2_io_read_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_2_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_2_io_write_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_2_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_3_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
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
  wire [31:0] virtualStealServers_3_io_read_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_3_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_3_io_write_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_3_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_clock; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_reset; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_4_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_4_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_ARREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_ARVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_4_io_axi_mgmt_ARADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_RREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_RVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_4_io_axi_mgmt_RDATA; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_AWREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_AWVALID; // @[stealSide.scala 63:75]
  wire [5:0] virtualStealServers_4_io_axi_mgmt_AWADDR; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_WREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_WVALID; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_4_io_axi_mgmt_WDATA; // @[stealSide.scala 63:75]
  wire [7:0] virtualStealServers_4_io_axi_mgmt_WSTRB; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_BREADY; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_axi_mgmt_BVALID; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_read_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_read_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_4_io_read_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_read_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_read_data_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_4_io_read_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_write_address_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_write_address_valid; // @[stealSide.scala 63:75]
  wire [63:0] virtualStealServers_4_io_write_address_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_write_data_ready; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_write_data_valid; // @[stealSide.scala 63:75]
  wire [31:0] virtualStealServers_4_io_write_data_bits; // @[stealSide.scala 63:75]
  wire  virtualStealServers_4_io_ntwDataUnitOccupancy; // @[stealSide.scala 63:75]
  wire  vssRvm_0_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_0_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_0_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_0_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_0_io_write_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_axi_ARADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_RVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_0_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_0_axi_AWADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_WVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_0_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_0_axi_BVALID; // @[stealSide.scala 87:68]
  wire  vssRvm_1_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_1_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_1_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_1_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_1_io_write_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_axi_ARADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_RVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_1_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_1_axi_AWADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_WVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_1_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_1_axi_BVALID; // @[stealSide.scala 87:68]
  wire  vssRvm_2_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_2_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_2_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_2_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_2_io_write_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_axi_ARADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_RVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_2_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_2_axi_AWADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_WVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_2_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_2_axi_BVALID; // @[stealSide.scala 87:68]
  wire  vssRvm_3_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_3_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_3_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_3_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_3_io_write_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_axi_ARADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_RVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_3_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_3_axi_AWADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_WVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_3_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_3_axi_BVALID; // @[stealSide.scala 87:68]
  wire  vssRvm_4_clock; // @[stealSide.scala 87:68]
  wire  vssRvm_4_reset; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_read_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_read_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_4_io_read_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_read_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_read_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_4_io_read_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_write_address_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_write_address_valid; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_4_io_write_address_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_write_data_ready; // @[stealSide.scala 87:68]
  wire  vssRvm_4_io_write_data_valid; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_4_io_write_data_bits; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_ARREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_ARVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_4_axi_ARADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_RREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_RVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_4_axi_RDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_AWREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_AWVALID; // @[stealSide.scala 87:68]
  wire [63:0] vssRvm_4_axi_AWADDR; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_WREADY; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_WVALID; // @[stealSide.scala 87:68]
  wire [31:0] vssRvm_4_axi_WDATA; // @[stealSide.scala 87:68]
  wire  vssRvm_4_axi_BVALID; // @[stealSide.scala 87:68]
  stealNW_TQ stealNW_TQ ( // @[stealSide.scala 53:28]
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
    .io_connPE_4_push_ready(stealNW_TQ_io_connPE_4_push_ready),
    .io_connPE_4_push_valid(stealNW_TQ_io_connPE_4_push_valid),
    .io_connPE_4_push_bits(stealNW_TQ_io_connPE_4_push_bits),
    .io_connPE_4_pop_ready(stealNW_TQ_io_connPE_4_pop_ready),
    .io_connPE_4_pop_valid(stealNW_TQ_io_connPE_4_pop_valid),
    .io_connPE_4_pop_bits(stealNW_TQ_io_connPE_4_pop_bits),
    .io_connPE_5_push_ready(stealNW_TQ_io_connPE_5_push_ready),
    .io_connPE_5_push_valid(stealNW_TQ_io_connPE_5_push_valid),
    .io_connPE_5_push_bits(stealNW_TQ_io_connPE_5_push_bits),
    .io_connPE_5_pop_ready(stealNW_TQ_io_connPE_5_pop_ready),
    .io_connPE_5_pop_valid(stealNW_TQ_io_connPE_5_pop_valid),
    .io_connPE_5_pop_bits(stealNW_TQ_io_connPE_5_pop_bits),
    .io_connPE_6_push_ready(stealNW_TQ_io_connPE_6_push_ready),
    .io_connPE_6_push_valid(stealNW_TQ_io_connPE_6_push_valid),
    .io_connPE_6_push_bits(stealNW_TQ_io_connPE_6_push_bits),
    .io_connPE_6_pop_ready(stealNW_TQ_io_connPE_6_pop_ready),
    .io_connPE_6_pop_valid(stealNW_TQ_io_connPE_6_pop_valid),
    .io_connPE_6_pop_bits(stealNW_TQ_io_connPE_6_pop_bits),
    .io_connPE_7_push_ready(stealNW_TQ_io_connPE_7_push_ready),
    .io_connPE_7_push_valid(stealNW_TQ_io_connPE_7_push_valid),
    .io_connPE_7_push_bits(stealNW_TQ_io_connPE_7_push_bits),
    .io_connPE_7_pop_ready(stealNW_TQ_io_connPE_7_pop_ready),
    .io_connPE_7_pop_valid(stealNW_TQ_io_connPE_7_pop_valid),
    .io_connPE_7_pop_bits(stealNW_TQ_io_connPE_7_pop_bits),
    .io_connPE_8_push_ready(stealNW_TQ_io_connPE_8_push_ready),
    .io_connPE_8_push_valid(stealNW_TQ_io_connPE_8_push_valid),
    .io_connPE_8_push_bits(stealNW_TQ_io_connPE_8_push_bits),
    .io_connPE_8_pop_ready(stealNW_TQ_io_connPE_8_pop_ready),
    .io_connPE_8_pop_valid(stealNW_TQ_io_connPE_8_pop_valid),
    .io_connPE_8_pop_bits(stealNW_TQ_io_connPE_8_pop_bits),
    .io_connPE_9_push_ready(stealNW_TQ_io_connPE_9_push_ready),
    .io_connPE_9_push_valid(stealNW_TQ_io_connPE_9_push_valid),
    .io_connPE_9_push_bits(stealNW_TQ_io_connPE_9_push_bits),
    .io_connPE_9_pop_ready(stealNW_TQ_io_connPE_9_pop_ready),
    .io_connPE_9_pop_valid(stealNW_TQ_io_connPE_9_pop_valid),
    .io_connPE_9_pop_bits(stealNW_TQ_io_connPE_9_pop_bits),
    .io_connPE_10_push_ready(stealNW_TQ_io_connPE_10_push_ready),
    .io_connPE_10_push_valid(stealNW_TQ_io_connPE_10_push_valid),
    .io_connPE_10_push_bits(stealNW_TQ_io_connPE_10_push_bits),
    .io_connPE_10_pop_ready(stealNW_TQ_io_connPE_10_pop_ready),
    .io_connPE_10_pop_valid(stealNW_TQ_io_connPE_10_pop_valid),
    .io_connPE_10_pop_bits(stealNW_TQ_io_connPE_10_pop_bits),
    .io_connPE_11_push_ready(stealNW_TQ_io_connPE_11_push_ready),
    .io_connPE_11_push_valid(stealNW_TQ_io_connPE_11_push_valid),
    .io_connPE_11_push_bits(stealNW_TQ_io_connPE_11_push_bits),
    .io_connPE_11_pop_ready(stealNW_TQ_io_connPE_11_pop_ready),
    .io_connPE_11_pop_valid(stealNW_TQ_io_connPE_11_pop_valid),
    .io_connPE_11_pop_bits(stealNW_TQ_io_connPE_11_pop_bits),
    .io_connPE_12_push_ready(stealNW_TQ_io_connPE_12_push_ready),
    .io_connPE_12_push_valid(stealNW_TQ_io_connPE_12_push_valid),
    .io_connPE_12_push_bits(stealNW_TQ_io_connPE_12_push_bits),
    .io_connPE_12_pop_ready(stealNW_TQ_io_connPE_12_pop_ready),
    .io_connPE_12_pop_valid(stealNW_TQ_io_connPE_12_pop_valid),
    .io_connPE_12_pop_bits(stealNW_TQ_io_connPE_12_pop_bits),
    .io_connPE_13_push_ready(stealNW_TQ_io_connPE_13_push_ready),
    .io_connPE_13_push_valid(stealNW_TQ_io_connPE_13_push_valid),
    .io_connPE_13_push_bits(stealNW_TQ_io_connPE_13_push_bits),
    .io_connPE_13_pop_ready(stealNW_TQ_io_connPE_13_pop_ready),
    .io_connPE_13_pop_valid(stealNW_TQ_io_connPE_13_pop_valid),
    .io_connPE_13_pop_bits(stealNW_TQ_io_connPE_13_pop_bits),
    .io_connPE_14_push_ready(stealNW_TQ_io_connPE_14_push_ready),
    .io_connPE_14_push_valid(stealNW_TQ_io_connPE_14_push_valid),
    .io_connPE_14_push_bits(stealNW_TQ_io_connPE_14_push_bits),
    .io_connPE_14_pop_ready(stealNW_TQ_io_connPE_14_pop_ready),
    .io_connPE_14_pop_valid(stealNW_TQ_io_connPE_14_pop_valid),
    .io_connPE_14_pop_bits(stealNW_TQ_io_connPE_14_pop_bits),
    .io_connPE_15_push_ready(stealNW_TQ_io_connPE_15_push_ready),
    .io_connPE_15_push_valid(stealNW_TQ_io_connPE_15_push_valid),
    .io_connPE_15_push_bits(stealNW_TQ_io_connPE_15_push_bits),
    .io_connPE_15_pop_ready(stealNW_TQ_io_connPE_15_pop_ready),
    .io_connPE_15_pop_valid(stealNW_TQ_io_connPE_15_pop_valid),
    .io_connPE_15_pop_bits(stealNW_TQ_io_connPE_15_pop_bits),
    .io_connPE_16_push_ready(stealNW_TQ_io_connPE_16_push_ready),
    .io_connPE_16_push_valid(stealNW_TQ_io_connPE_16_push_valid),
    .io_connPE_16_push_bits(stealNW_TQ_io_connPE_16_push_bits),
    .io_connPE_16_pop_ready(stealNW_TQ_io_connPE_16_pop_ready),
    .io_connPE_16_pop_valid(stealNW_TQ_io_connPE_16_pop_valid),
    .io_connPE_16_pop_bits(stealNW_TQ_io_connPE_16_pop_bits),
    .io_connPE_17_push_ready(stealNW_TQ_io_connPE_17_push_ready),
    .io_connPE_17_push_valid(stealNW_TQ_io_connPE_17_push_valid),
    .io_connPE_17_push_bits(stealNW_TQ_io_connPE_17_push_bits),
    .io_connPE_17_pop_ready(stealNW_TQ_io_connPE_17_pop_ready),
    .io_connPE_17_pop_valid(stealNW_TQ_io_connPE_17_pop_valid),
    .io_connPE_17_pop_bits(stealNW_TQ_io_connPE_17_pop_bits),
    .io_connPE_18_push_ready(stealNW_TQ_io_connPE_18_push_ready),
    .io_connPE_18_push_valid(stealNW_TQ_io_connPE_18_push_valid),
    .io_connPE_18_push_bits(stealNW_TQ_io_connPE_18_push_bits),
    .io_connPE_18_pop_ready(stealNW_TQ_io_connPE_18_pop_ready),
    .io_connPE_18_pop_valid(stealNW_TQ_io_connPE_18_pop_valid),
    .io_connPE_18_pop_bits(stealNW_TQ_io_connPE_18_pop_bits),
    .io_connPE_19_push_ready(stealNW_TQ_io_connPE_19_push_ready),
    .io_connPE_19_push_valid(stealNW_TQ_io_connPE_19_push_valid),
    .io_connPE_19_push_bits(stealNW_TQ_io_connPE_19_push_bits),
    .io_connPE_19_pop_ready(stealNW_TQ_io_connPE_19_pop_ready),
    .io_connPE_19_pop_valid(stealNW_TQ_io_connPE_19_pop_valid),
    .io_connPE_19_pop_bits(stealNW_TQ_io_connPE_19_pop_bits),
    .io_connPE_20_push_ready(stealNW_TQ_io_connPE_20_push_ready),
    .io_connPE_20_push_valid(stealNW_TQ_io_connPE_20_push_valid),
    .io_connPE_20_push_bits(stealNW_TQ_io_connPE_20_push_bits),
    .io_connPE_20_pop_ready(stealNW_TQ_io_connPE_20_pop_ready),
    .io_connPE_20_pop_valid(stealNW_TQ_io_connPE_20_pop_valid),
    .io_connPE_20_pop_bits(stealNW_TQ_io_connPE_20_pop_bits),
    .io_connPE_21_push_ready(stealNW_TQ_io_connPE_21_push_ready),
    .io_connPE_21_push_valid(stealNW_TQ_io_connPE_21_push_valid),
    .io_connPE_21_push_bits(stealNW_TQ_io_connPE_21_push_bits),
    .io_connPE_21_pop_ready(stealNW_TQ_io_connPE_21_pop_ready),
    .io_connPE_21_pop_valid(stealNW_TQ_io_connPE_21_pop_valid),
    .io_connPE_21_pop_bits(stealNW_TQ_io_connPE_21_pop_bits),
    .io_connPE_22_push_ready(stealNW_TQ_io_connPE_22_push_ready),
    .io_connPE_22_push_valid(stealNW_TQ_io_connPE_22_push_valid),
    .io_connPE_22_push_bits(stealNW_TQ_io_connPE_22_push_bits),
    .io_connPE_22_pop_ready(stealNW_TQ_io_connPE_22_pop_ready),
    .io_connPE_22_pop_valid(stealNW_TQ_io_connPE_22_pop_valid),
    .io_connPE_22_pop_bits(stealNW_TQ_io_connPE_22_pop_bits),
    .io_connPE_23_push_ready(stealNW_TQ_io_connPE_23_push_ready),
    .io_connPE_23_push_valid(stealNW_TQ_io_connPE_23_push_valid),
    .io_connPE_23_push_bits(stealNW_TQ_io_connPE_23_push_bits),
    .io_connPE_23_pop_ready(stealNW_TQ_io_connPE_23_pop_ready),
    .io_connPE_23_pop_valid(stealNW_TQ_io_connPE_23_pop_valid),
    .io_connPE_23_pop_bits(stealNW_TQ_io_connPE_23_pop_bits),
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
    .io_connVSS_4_ctrl_serveStealReq_ready(stealNW_TQ_io_connVSS_4_ctrl_serveStealReq_ready),
    .io_connVSS_4_ctrl_serveStealReq_valid(stealNW_TQ_io_connVSS_4_ctrl_serveStealReq_valid),
    .io_connVSS_4_data_availableTask_ready(stealNW_TQ_io_connVSS_4_data_availableTask_ready),
    .io_connVSS_4_data_availableTask_valid(stealNW_TQ_io_connVSS_4_data_availableTask_valid),
    .io_connVSS_4_data_availableTask_bits(stealNW_TQ_io_connVSS_4_data_availableTask_bits),
    .io_connVSS_4_data_qOutTask_ready(stealNW_TQ_io_connVSS_4_data_qOutTask_ready),
    .io_connVSS_4_data_qOutTask_valid(stealNW_TQ_io_connVSS_4_data_qOutTask_valid),
    .io_connVSS_4_data_qOutTask_bits(stealNW_TQ_io_connVSS_4_data_qOutTask_bits),
    .io_ntwDataUnitOccupancyVSS_0(stealNW_TQ_io_ntwDataUnitOccupancyVSS_0),
    .io_ntwDataUnitOccupancyVSS_1(stealNW_TQ_io_ntwDataUnitOccupancyVSS_1),
    .io_ntwDataUnitOccupancyVSS_2(stealNW_TQ_io_ntwDataUnitOccupancyVSS_2),
    .io_ntwDataUnitOccupancyVSS_3(stealNW_TQ_io_ntwDataUnitOccupancyVSS_3),
    .io_ntwDataUnitOccupancyVSS_4(stealNW_TQ_io_ntwDataUnitOccupancyVSS_4)
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
    .io_write_address_ready(virtualStealServers_0_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_0_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_0_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_0_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_0_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_0_io_write_data_bits),
    .io_ntwDataUnitOccupancy(virtualStealServers_0_io_ntwDataUnitOccupancy)
  );
  virtualStealServer virtualStealServers_1 ( // @[stealSide.scala 63:75]
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
    .io_write_address_ready(virtualStealServers_1_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_1_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_1_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_1_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_1_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_1_io_write_data_bits),
    .io_ntwDataUnitOccupancy(virtualStealServers_1_io_ntwDataUnitOccupancy)
  );
  virtualStealServer virtualStealServers_2 ( // @[stealSide.scala 63:75]
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
    .io_write_address_ready(virtualStealServers_2_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_2_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_2_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_2_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_2_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_2_io_write_data_bits),
    .io_ntwDataUnitOccupancy(virtualStealServers_2_io_ntwDataUnitOccupancy)
  );
  virtualStealServer virtualStealServers_3 ( // @[stealSide.scala 63:75]
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
    .io_write_address_ready(virtualStealServers_3_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_3_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_3_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_3_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_3_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_3_io_write_data_bits),
    .io_ntwDataUnitOccupancy(virtualStealServers_3_io_ntwDataUnitOccupancy)
  );
  virtualStealServer virtualStealServers_4 ( // @[stealSide.scala 63:75]
    .clock(virtualStealServers_4_clock),
    .reset(virtualStealServers_4_reset),
    .io_connNetwork_ctrl_serveStealReq_ready(virtualStealServers_4_io_connNetwork_ctrl_serveStealReq_ready),
    .io_connNetwork_ctrl_serveStealReq_valid(virtualStealServers_4_io_connNetwork_ctrl_serveStealReq_valid),
    .io_connNetwork_data_availableTask_ready(virtualStealServers_4_io_connNetwork_data_availableTask_ready),
    .io_connNetwork_data_availableTask_valid(virtualStealServers_4_io_connNetwork_data_availableTask_valid),
    .io_connNetwork_data_availableTask_bits(virtualStealServers_4_io_connNetwork_data_availableTask_bits),
    .io_connNetwork_data_qOutTask_ready(virtualStealServers_4_io_connNetwork_data_qOutTask_ready),
    .io_connNetwork_data_qOutTask_valid(virtualStealServers_4_io_connNetwork_data_qOutTask_valid),
    .io_connNetwork_data_qOutTask_bits(virtualStealServers_4_io_connNetwork_data_qOutTask_bits),
    .io_axi_mgmt_ARREADY(virtualStealServers_4_io_axi_mgmt_ARREADY),
    .io_axi_mgmt_ARVALID(virtualStealServers_4_io_axi_mgmt_ARVALID),
    .io_axi_mgmt_ARADDR(virtualStealServers_4_io_axi_mgmt_ARADDR),
    .io_axi_mgmt_RREADY(virtualStealServers_4_io_axi_mgmt_RREADY),
    .io_axi_mgmt_RVALID(virtualStealServers_4_io_axi_mgmt_RVALID),
    .io_axi_mgmt_RDATA(virtualStealServers_4_io_axi_mgmt_RDATA),
    .io_axi_mgmt_AWREADY(virtualStealServers_4_io_axi_mgmt_AWREADY),
    .io_axi_mgmt_AWVALID(virtualStealServers_4_io_axi_mgmt_AWVALID),
    .io_axi_mgmt_AWADDR(virtualStealServers_4_io_axi_mgmt_AWADDR),
    .io_axi_mgmt_WREADY(virtualStealServers_4_io_axi_mgmt_WREADY),
    .io_axi_mgmt_WVALID(virtualStealServers_4_io_axi_mgmt_WVALID),
    .io_axi_mgmt_WDATA(virtualStealServers_4_io_axi_mgmt_WDATA),
    .io_axi_mgmt_WSTRB(virtualStealServers_4_io_axi_mgmt_WSTRB),
    .io_axi_mgmt_BREADY(virtualStealServers_4_io_axi_mgmt_BREADY),
    .io_axi_mgmt_BVALID(virtualStealServers_4_io_axi_mgmt_BVALID),
    .io_read_address_ready(virtualStealServers_4_io_read_address_ready),
    .io_read_address_valid(virtualStealServers_4_io_read_address_valid),
    .io_read_address_bits(virtualStealServers_4_io_read_address_bits),
    .io_read_data_ready(virtualStealServers_4_io_read_data_ready),
    .io_read_data_valid(virtualStealServers_4_io_read_data_valid),
    .io_read_data_bits(virtualStealServers_4_io_read_data_bits),
    .io_write_address_ready(virtualStealServers_4_io_write_address_ready),
    .io_write_address_valid(virtualStealServers_4_io_write_address_valid),
    .io_write_address_bits(virtualStealServers_4_io_write_address_bits),
    .io_write_data_ready(virtualStealServers_4_io_write_data_ready),
    .io_write_data_valid(virtualStealServers_4_io_write_data_valid),
    .io_write_data_bits(virtualStealServers_4_io_write_data_bits),
    .io_ntwDataUnitOccupancy(virtualStealServers_4_io_ntwDataUnitOccupancy)
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
    .axi_ARREADY(vssRvm_0_axi_ARREADY),
    .axi_ARVALID(vssRvm_0_axi_ARVALID),
    .axi_ARADDR(vssRvm_0_axi_ARADDR),
    .axi_RREADY(vssRvm_0_axi_RREADY),
    .axi_RVALID(vssRvm_0_axi_RVALID),
    .axi_RDATA(vssRvm_0_axi_RDATA),
    .axi_AWREADY(vssRvm_0_axi_AWREADY),
    .axi_AWVALID(vssRvm_0_axi_AWVALID),
    .axi_AWADDR(vssRvm_0_axi_AWADDR),
    .axi_WREADY(vssRvm_0_axi_WREADY),
    .axi_WVALID(vssRvm_0_axi_WVALID),
    .axi_WDATA(vssRvm_0_axi_WDATA),
    .axi_BVALID(vssRvm_0_axi_BVALID)
  );
  readyValidMem vssRvm_1 ( // @[stealSide.scala 87:68]
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
    .axi_ARREADY(vssRvm_1_axi_ARREADY),
    .axi_ARVALID(vssRvm_1_axi_ARVALID),
    .axi_ARADDR(vssRvm_1_axi_ARADDR),
    .axi_RREADY(vssRvm_1_axi_RREADY),
    .axi_RVALID(vssRvm_1_axi_RVALID),
    .axi_RDATA(vssRvm_1_axi_RDATA),
    .axi_AWREADY(vssRvm_1_axi_AWREADY),
    .axi_AWVALID(vssRvm_1_axi_AWVALID),
    .axi_AWADDR(vssRvm_1_axi_AWADDR),
    .axi_WREADY(vssRvm_1_axi_WREADY),
    .axi_WVALID(vssRvm_1_axi_WVALID),
    .axi_WDATA(vssRvm_1_axi_WDATA),
    .axi_BVALID(vssRvm_1_axi_BVALID)
  );
  readyValidMem vssRvm_2 ( // @[stealSide.scala 87:68]
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
    .axi_ARREADY(vssRvm_2_axi_ARREADY),
    .axi_ARVALID(vssRvm_2_axi_ARVALID),
    .axi_ARADDR(vssRvm_2_axi_ARADDR),
    .axi_RREADY(vssRvm_2_axi_RREADY),
    .axi_RVALID(vssRvm_2_axi_RVALID),
    .axi_RDATA(vssRvm_2_axi_RDATA),
    .axi_AWREADY(vssRvm_2_axi_AWREADY),
    .axi_AWVALID(vssRvm_2_axi_AWVALID),
    .axi_AWADDR(vssRvm_2_axi_AWADDR),
    .axi_WREADY(vssRvm_2_axi_WREADY),
    .axi_WVALID(vssRvm_2_axi_WVALID),
    .axi_WDATA(vssRvm_2_axi_WDATA),
    .axi_BVALID(vssRvm_2_axi_BVALID)
  );
  readyValidMem vssRvm_3 ( // @[stealSide.scala 87:68]
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
    .axi_ARREADY(vssRvm_3_axi_ARREADY),
    .axi_ARVALID(vssRvm_3_axi_ARVALID),
    .axi_ARADDR(vssRvm_3_axi_ARADDR),
    .axi_RREADY(vssRvm_3_axi_RREADY),
    .axi_RVALID(vssRvm_3_axi_RVALID),
    .axi_RDATA(vssRvm_3_axi_RDATA),
    .axi_AWREADY(vssRvm_3_axi_AWREADY),
    .axi_AWVALID(vssRvm_3_axi_AWVALID),
    .axi_AWADDR(vssRvm_3_axi_AWADDR),
    .axi_WREADY(vssRvm_3_axi_WREADY),
    .axi_WVALID(vssRvm_3_axi_WVALID),
    .axi_WDATA(vssRvm_3_axi_WDATA),
    .axi_BVALID(vssRvm_3_axi_BVALID)
  );
  readyValidMem vssRvm_4 ( // @[stealSide.scala 87:68]
    .clock(vssRvm_4_clock),
    .reset(vssRvm_4_reset),
    .io_read_address_ready(vssRvm_4_io_read_address_ready),
    .io_read_address_valid(vssRvm_4_io_read_address_valid),
    .io_read_address_bits(vssRvm_4_io_read_address_bits),
    .io_read_data_ready(vssRvm_4_io_read_data_ready),
    .io_read_data_valid(vssRvm_4_io_read_data_valid),
    .io_read_data_bits(vssRvm_4_io_read_data_bits),
    .io_write_address_ready(vssRvm_4_io_write_address_ready),
    .io_write_address_valid(vssRvm_4_io_write_address_valid),
    .io_write_address_bits(vssRvm_4_io_write_address_bits),
    .io_write_data_ready(vssRvm_4_io_write_data_ready),
    .io_write_data_valid(vssRvm_4_io_write_data_valid),
    .io_write_data_bits(vssRvm_4_io_write_data_bits),
    .axi_ARREADY(vssRvm_4_axi_ARREADY),
    .axi_ARVALID(vssRvm_4_axi_ARVALID),
    .axi_ARADDR(vssRvm_4_axi_ARADDR),
    .axi_RREADY(vssRvm_4_axi_RREADY),
    .axi_RVALID(vssRvm_4_axi_RVALID),
    .axi_RDATA(vssRvm_4_axi_RDATA),
    .axi_AWREADY(vssRvm_4_axi_AWREADY),
    .axi_AWVALID(vssRvm_4_axi_AWVALID),
    .axi_AWADDR(vssRvm_4_axi_AWADDR),
    .axi_WREADY(vssRvm_4_axi_WREADY),
    .axi_WVALID(vssRvm_4_axi_WVALID),
    .axi_WDATA(vssRvm_4_axi_WDATA),
    .axi_BVALID(vssRvm_4_axi_BVALID)
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
  assign io_axi_mgmt_vss_4_ARREADY = virtualStealServers_4_io_axi_mgmt_ARREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_4_RVALID = virtualStealServers_4_io_axi_mgmt_RVALID; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_4_RDATA = virtualStealServers_4_io_axi_mgmt_RDATA; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_4_AWREADY = virtualStealServers_4_io_axi_mgmt_AWREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_4_WREADY = virtualStealServers_4_io_axi_mgmt_WREADY; // @[stealSide.scala 83:28]
  assign io_axi_mgmt_vss_4_BVALID = virtualStealServers_4_io_axi_mgmt_BVALID; // @[stealSide.scala 83:28]
  assign io_vss_axi_full_0_ARVALID = vssRvm_0_axi_ARVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_0_ARADDR = vssRvm_0_axi_ARADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_0_RREADY = vssRvm_0_axi_RREADY; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_0_AWVALID = vssRvm_0_axi_AWVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_0_AWADDR = vssRvm_0_axi_AWADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_0_WVALID = vssRvm_0_axi_WVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_0_WDATA = vssRvm_0_axi_WDATA; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_1_ARVALID = vssRvm_1_axi_ARVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_1_ARADDR = vssRvm_1_axi_ARADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_1_RREADY = vssRvm_1_axi_RREADY; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_1_AWVALID = vssRvm_1_axi_AWVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_1_AWADDR = vssRvm_1_axi_AWADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_1_WVALID = vssRvm_1_axi_WVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_1_WDATA = vssRvm_1_axi_WDATA; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_2_ARVALID = vssRvm_2_axi_ARVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_2_ARADDR = vssRvm_2_axi_ARADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_2_RREADY = vssRvm_2_axi_RREADY; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_2_AWVALID = vssRvm_2_axi_AWVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_2_AWADDR = vssRvm_2_axi_AWADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_2_WVALID = vssRvm_2_axi_WVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_2_WDATA = vssRvm_2_axi_WDATA; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_3_ARVALID = vssRvm_3_axi_ARVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_3_ARADDR = vssRvm_3_axi_ARADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_3_RREADY = vssRvm_3_axi_RREADY; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_3_AWVALID = vssRvm_3_axi_AWVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_3_AWADDR = vssRvm_3_axi_AWADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_3_WVALID = vssRvm_3_axi_WVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_3_WDATA = vssRvm_3_axi_WDATA; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_4_ARVALID = vssRvm_4_axi_ARVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_4_ARADDR = vssRvm_4_axi_ARADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_4_RREADY = vssRvm_4_axi_RREADY; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_4_AWVALID = vssRvm_4_axi_AWVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_4_AWADDR = vssRvm_4_axi_AWADDR; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_4_WVALID = vssRvm_4_axi_WVALID; // @[stealSide.scala 95:47]
  assign io_vss_axi_full_4_WDATA = vssRvm_4_axi_WDATA; // @[stealSide.scala 95:47]
  assign io_taskOut_0_TVALID = stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_0_TDATA = stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_1_TVALID = stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_1_TDATA = stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_2_TVALID = stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_2_TDATA = stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_3_TVALID = stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_3_TDATA = stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_4_TVALID = stealNW_TQ_io_connPE_4_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_4_TDATA = stealNW_TQ_io_connPE_4_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_5_TVALID = stealNW_TQ_io_connPE_5_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_5_TDATA = stealNW_TQ_io_connPE_5_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_6_TVALID = stealNW_TQ_io_connPE_6_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_6_TDATA = stealNW_TQ_io_connPE_6_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_7_TVALID = stealNW_TQ_io_connPE_7_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_7_TDATA = stealNW_TQ_io_connPE_7_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_8_TVALID = stealNW_TQ_io_connPE_8_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_8_TDATA = stealNW_TQ_io_connPE_8_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_9_TVALID = stealNW_TQ_io_connPE_9_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_9_TDATA = stealNW_TQ_io_connPE_9_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_10_TVALID = stealNW_TQ_io_connPE_10_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_10_TDATA = stealNW_TQ_io_connPE_10_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_11_TVALID = stealNW_TQ_io_connPE_11_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_11_TDATA = stealNW_TQ_io_connPE_11_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_12_TVALID = stealNW_TQ_io_connPE_12_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_12_TDATA = stealNW_TQ_io_connPE_12_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_13_TVALID = stealNW_TQ_io_connPE_13_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_13_TDATA = stealNW_TQ_io_connPE_13_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_14_TVALID = stealNW_TQ_io_connPE_14_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_14_TDATA = stealNW_TQ_io_connPE_14_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_15_TVALID = stealNW_TQ_io_connPE_15_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_15_TDATA = stealNW_TQ_io_connPE_15_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_16_TVALID = stealNW_TQ_io_connPE_16_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_16_TDATA = stealNW_TQ_io_connPE_16_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_17_TVALID = stealNW_TQ_io_connPE_17_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_17_TDATA = stealNW_TQ_io_connPE_17_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_18_TVALID = stealNW_TQ_io_connPE_18_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_18_TDATA = stealNW_TQ_io_connPE_18_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_19_TVALID = stealNW_TQ_io_connPE_19_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_19_TDATA = stealNW_TQ_io_connPE_19_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_20_TVALID = stealNW_TQ_io_connPE_20_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_20_TDATA = stealNW_TQ_io_connPE_20_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_21_TVALID = stealNW_TQ_io_connPE_21_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_21_TDATA = stealNW_TQ_io_connPE_21_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_22_TVALID = stealNW_TQ_io_connPE_22_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_22_TDATA = stealNW_TQ_io_connPE_22_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskOut_23_TVALID = stealNW_TQ_io_connPE_23_pop_valid; // @[stealSide.scala 100:39]
  assign io_taskOut_23_TDATA = stealNW_TQ_io_connPE_23_pop_bits; // @[stealSide.scala 100:39]
  assign io_taskIn_0_TREADY = stealNW_TQ_io_connPE_0_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_1_TREADY = stealNW_TQ_io_connPE_1_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_2_TREADY = stealNW_TQ_io_connPE_2_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_3_TREADY = stealNW_TQ_io_connPE_3_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_4_TREADY = stealNW_TQ_io_connPE_4_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_5_TREADY = stealNW_TQ_io_connPE_5_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_6_TREADY = stealNW_TQ_io_connPE_6_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_7_TREADY = stealNW_TQ_io_connPE_7_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_8_TREADY = stealNW_TQ_io_connPE_8_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_9_TREADY = stealNW_TQ_io_connPE_9_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_10_TREADY = stealNW_TQ_io_connPE_10_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_11_TREADY = stealNW_TQ_io_connPE_11_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_12_TREADY = stealNW_TQ_io_connPE_12_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_13_TREADY = stealNW_TQ_io_connPE_13_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_14_TREADY = stealNW_TQ_io_connPE_14_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_15_TREADY = stealNW_TQ_io_connPE_15_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_16_TREADY = stealNW_TQ_io_connPE_16_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_17_TREADY = stealNW_TQ_io_connPE_17_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_18_TREADY = stealNW_TQ_io_connPE_18_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_19_TREADY = stealNW_TQ_io_connPE_19_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_20_TREADY = stealNW_TQ_io_connPE_20_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_21_TREADY = stealNW_TQ_io_connPE_21_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_22_TREADY = stealNW_TQ_io_connPE_22_push_ready; // @[stealSide.scala 102:43]
  assign io_taskIn_23_TREADY = stealNW_TQ_io_connPE_23_push_ready; // @[stealSide.scala 102:43]
  assign stealNW_TQ_clock = clock;
  assign stealNW_TQ_reset = reset;
  assign stealNW_TQ_io_connPE_0_push_valid = io_taskIn_0_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_0_push_bits = io_taskIn_0_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_0_pop_ready = io_taskOut_0_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_1_push_valid = io_taskIn_1_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_1_push_bits = io_taskIn_1_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_1_pop_ready = io_taskOut_1_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_2_push_valid = io_taskIn_2_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_2_push_bits = io_taskIn_2_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_2_pop_ready = io_taskOut_2_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_3_push_valid = io_taskIn_3_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_3_push_bits = io_taskIn_3_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_3_pop_ready = io_taskOut_3_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_4_push_valid = io_taskIn_4_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_4_push_bits = io_taskIn_4_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_4_pop_ready = io_taskOut_4_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_5_push_valid = io_taskIn_5_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_5_push_bits = io_taskIn_5_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_5_pop_ready = io_taskOut_5_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_6_push_valid = io_taskIn_6_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_6_push_bits = io_taskIn_6_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_6_pop_ready = io_taskOut_6_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_7_push_valid = io_taskIn_7_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_7_push_bits = io_taskIn_7_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_7_pop_ready = io_taskOut_7_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_8_push_valid = io_taskIn_8_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_8_push_bits = io_taskIn_8_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_8_pop_ready = io_taskOut_8_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_9_push_valid = io_taskIn_9_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_9_push_bits = io_taskIn_9_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_9_pop_ready = io_taskOut_9_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_10_push_valid = io_taskIn_10_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_10_push_bits = io_taskIn_10_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_10_pop_ready = io_taskOut_10_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_11_push_valid = io_taskIn_11_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_11_push_bits = io_taskIn_11_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_11_pop_ready = io_taskOut_11_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_12_push_valid = io_taskIn_12_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_12_push_bits = io_taskIn_12_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_12_pop_ready = io_taskOut_12_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_13_push_valid = io_taskIn_13_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_13_push_bits = io_taskIn_13_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_13_pop_ready = io_taskOut_13_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_14_push_valid = io_taskIn_14_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_14_push_bits = io_taskIn_14_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_14_pop_ready = io_taskOut_14_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_15_push_valid = io_taskIn_15_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_15_push_bits = io_taskIn_15_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_15_pop_ready = io_taskOut_15_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_16_push_valid = io_taskIn_16_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_16_push_bits = io_taskIn_16_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_16_pop_ready = io_taskOut_16_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_17_push_valid = io_taskIn_17_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_17_push_bits = io_taskIn_17_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_17_pop_ready = io_taskOut_17_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_18_push_valid = io_taskIn_18_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_18_push_bits = io_taskIn_18_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_18_pop_ready = io_taskOut_18_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_19_push_valid = io_taskIn_19_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_19_push_bits = io_taskIn_19_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_19_pop_ready = io_taskOut_19_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_20_push_valid = io_taskIn_20_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_20_push_bits = io_taskIn_20_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_20_pop_ready = io_taskOut_20_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_21_push_valid = io_taskIn_21_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_21_push_bits = io_taskIn_21_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_21_pop_ready = io_taskOut_21_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_22_push_valid = io_taskIn_22_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_22_push_bits = io_taskIn_22_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_22_pop_ready = io_taskOut_22_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connPE_23_push_valid = io_taskIn_23_TVALID; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_23_push_bits = io_taskIn_23_TDATA; // @[stealSide.scala 102:43]
  assign stealNW_TQ_io_connPE_23_pop_ready = io_taskOut_23_TREADY; // @[stealSide.scala 100:39]
  assign stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid =
    virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_0_data_availableTask_ready =
    virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_valid = virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_bits = virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_valid =
    virtualStealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_1_data_availableTask_ready =
    virtualStealServers_1_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_1_data_qOutTask_valid = virtualStealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_1_data_qOutTask_bits = virtualStealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_valid =
    virtualStealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_2_data_availableTask_ready =
    virtualStealServers_2_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_2_data_qOutTask_valid = virtualStealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_2_data_qOutTask_bits = virtualStealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_valid =
    virtualStealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_3_data_availableTask_ready =
    virtualStealServers_3_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_3_data_qOutTask_valid = virtualStealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_3_data_qOutTask_bits = virtualStealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_4_ctrl_serveStealReq_valid =
    virtualStealServers_4_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_4_data_availableTask_ready =
    virtualStealServers_4_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_4_data_qOutTask_valid = virtualStealServers_4_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 96:47]
  assign stealNW_TQ_io_connVSS_4_data_qOutTask_bits = virtualStealServers_4_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 96:47]
  assign virtualStealServers_0_clock = clock;
  assign virtualStealServers_0_reset = reset;
  assign virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 96:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 96:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 96:47]
  assign virtualStealServers_0_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 96:47]
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
    stealNW_TQ_io_connVSS_1_ctrl_serveStealReq_ready; // @[stealSide.scala 96:47]
  assign virtualStealServers_1_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_1_data_availableTask_valid; // @[stealSide.scala 96:47]
  assign virtualStealServers_1_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_1_data_availableTask_bits; // @[stealSide.scala 96:47]
  assign virtualStealServers_1_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_1_data_qOutTask_ready; // @[stealSide.scala 96:47]
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
    stealNW_TQ_io_connVSS_2_ctrl_serveStealReq_ready; // @[stealSide.scala 96:47]
  assign virtualStealServers_2_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_2_data_availableTask_valid; // @[stealSide.scala 96:47]
  assign virtualStealServers_2_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_2_data_availableTask_bits; // @[stealSide.scala 96:47]
  assign virtualStealServers_2_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_2_data_qOutTask_ready; // @[stealSide.scala 96:47]
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
    stealNW_TQ_io_connVSS_3_ctrl_serveStealReq_ready; // @[stealSide.scala 96:47]
  assign virtualStealServers_3_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_3_data_availableTask_valid; // @[stealSide.scala 96:47]
  assign virtualStealServers_3_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_3_data_availableTask_bits; // @[stealSide.scala 96:47]
  assign virtualStealServers_3_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_3_data_qOutTask_ready; // @[stealSide.scala 96:47]
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
  assign virtualStealServers_4_clock = clock;
  assign virtualStealServers_4_reset = reset;
  assign virtualStealServers_4_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_4_ctrl_serveStealReq_ready; // @[stealSide.scala 96:47]
  assign virtualStealServers_4_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_4_data_availableTask_valid; // @[stealSide.scala 96:47]
  assign virtualStealServers_4_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_4_data_availableTask_bits; // @[stealSide.scala 96:47]
  assign virtualStealServers_4_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_4_data_qOutTask_ready; // @[stealSide.scala 96:47]
  assign virtualStealServers_4_io_axi_mgmt_ARVALID = io_axi_mgmt_vss_4_ARVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_ARADDR = io_axi_mgmt_vss_4_ARADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_RREADY = io_axi_mgmt_vss_4_RREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_AWVALID = io_axi_mgmt_vss_4_AWVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_AWADDR = io_axi_mgmt_vss_4_AWADDR; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_WVALID = io_axi_mgmt_vss_4_WVALID; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_WDATA = io_axi_mgmt_vss_4_WDATA; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_WSTRB = io_axi_mgmt_vss_4_WSTRB; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_axi_mgmt_BREADY = io_axi_mgmt_vss_4_BREADY; // @[stealSide.scala 83:28]
  assign virtualStealServers_4_io_read_address_ready = vssRvm_4_io_read_address_ready; // @[stealSide.scala 91:47]
  assign virtualStealServers_4_io_read_data_valid = vssRvm_4_io_read_data_valid; // @[stealSide.scala 92:47]
  assign virtualStealServers_4_io_read_data_bits = vssRvm_4_io_read_data_bits; // @[stealSide.scala 92:47]
  assign virtualStealServers_4_io_write_address_ready = vssRvm_4_io_write_address_ready; // @[stealSide.scala 93:47]
  assign virtualStealServers_4_io_write_data_ready = vssRvm_4_io_write_data_ready; // @[stealSide.scala 94:47]
  assign virtualStealServers_4_io_ntwDataUnitOccupancy = stealNW_TQ_io_ntwDataUnitOccupancyVSS_4; // @[stealSide.scala 84:56]
  assign vssRvm_0_clock = clock;
  assign vssRvm_0_reset = reset;
  assign vssRvm_0_io_read_address_valid = virtualStealServers_0_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_0_io_read_address_bits = virtualStealServers_0_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_0_io_read_data_ready = virtualStealServers_0_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_0_io_write_address_valid = virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_0_io_write_address_bits = virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_0_io_write_data_valid = virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_0_io_write_data_bits = virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_0_axi_ARREADY = io_vss_axi_full_0_ARREADY; // @[stealSide.scala 95:47]
  assign vssRvm_0_axi_RVALID = io_vss_axi_full_0_RVALID; // @[stealSide.scala 95:47]
  assign vssRvm_0_axi_RDATA = io_vss_axi_full_0_RDATA; // @[stealSide.scala 95:47]
  assign vssRvm_0_axi_AWREADY = io_vss_axi_full_0_AWREADY; // @[stealSide.scala 95:47]
  assign vssRvm_0_axi_WREADY = io_vss_axi_full_0_WREADY; // @[stealSide.scala 95:47]
  assign vssRvm_0_axi_BVALID = io_vss_axi_full_0_BVALID; // @[stealSide.scala 95:47]
  assign vssRvm_1_clock = clock;
  assign vssRvm_1_reset = reset;
  assign vssRvm_1_io_read_address_valid = virtualStealServers_1_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_1_io_read_address_bits = virtualStealServers_1_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_1_io_read_data_ready = virtualStealServers_1_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_1_io_write_address_valid = virtualStealServers_1_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_1_io_write_address_bits = virtualStealServers_1_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_1_io_write_data_valid = virtualStealServers_1_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_1_io_write_data_bits = virtualStealServers_1_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_1_axi_ARREADY = io_vss_axi_full_1_ARREADY; // @[stealSide.scala 95:47]
  assign vssRvm_1_axi_RVALID = io_vss_axi_full_1_RVALID; // @[stealSide.scala 95:47]
  assign vssRvm_1_axi_RDATA = io_vss_axi_full_1_RDATA; // @[stealSide.scala 95:47]
  assign vssRvm_1_axi_AWREADY = io_vss_axi_full_1_AWREADY; // @[stealSide.scala 95:47]
  assign vssRvm_1_axi_WREADY = io_vss_axi_full_1_WREADY; // @[stealSide.scala 95:47]
  assign vssRvm_1_axi_BVALID = io_vss_axi_full_1_BVALID; // @[stealSide.scala 95:47]
  assign vssRvm_2_clock = clock;
  assign vssRvm_2_reset = reset;
  assign vssRvm_2_io_read_address_valid = virtualStealServers_2_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_2_io_read_address_bits = virtualStealServers_2_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_2_io_read_data_ready = virtualStealServers_2_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_2_io_write_address_valid = virtualStealServers_2_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_2_io_write_address_bits = virtualStealServers_2_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_2_io_write_data_valid = virtualStealServers_2_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_2_io_write_data_bits = virtualStealServers_2_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_2_axi_ARREADY = io_vss_axi_full_2_ARREADY; // @[stealSide.scala 95:47]
  assign vssRvm_2_axi_RVALID = io_vss_axi_full_2_RVALID; // @[stealSide.scala 95:47]
  assign vssRvm_2_axi_RDATA = io_vss_axi_full_2_RDATA; // @[stealSide.scala 95:47]
  assign vssRvm_2_axi_AWREADY = io_vss_axi_full_2_AWREADY; // @[stealSide.scala 95:47]
  assign vssRvm_2_axi_WREADY = io_vss_axi_full_2_WREADY; // @[stealSide.scala 95:47]
  assign vssRvm_2_axi_BVALID = io_vss_axi_full_2_BVALID; // @[stealSide.scala 95:47]
  assign vssRvm_3_clock = clock;
  assign vssRvm_3_reset = reset;
  assign vssRvm_3_io_read_address_valid = virtualStealServers_3_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_3_io_read_address_bits = virtualStealServers_3_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_3_io_read_data_ready = virtualStealServers_3_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_3_io_write_address_valid = virtualStealServers_3_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_3_io_write_address_bits = virtualStealServers_3_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_3_io_write_data_valid = virtualStealServers_3_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_3_io_write_data_bits = virtualStealServers_3_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_3_axi_ARREADY = io_vss_axi_full_3_ARREADY; // @[stealSide.scala 95:47]
  assign vssRvm_3_axi_RVALID = io_vss_axi_full_3_RVALID; // @[stealSide.scala 95:47]
  assign vssRvm_3_axi_RDATA = io_vss_axi_full_3_RDATA; // @[stealSide.scala 95:47]
  assign vssRvm_3_axi_AWREADY = io_vss_axi_full_3_AWREADY; // @[stealSide.scala 95:47]
  assign vssRvm_3_axi_WREADY = io_vss_axi_full_3_WREADY; // @[stealSide.scala 95:47]
  assign vssRvm_3_axi_BVALID = io_vss_axi_full_3_BVALID; // @[stealSide.scala 95:47]
  assign vssRvm_4_clock = clock;
  assign vssRvm_4_reset = reset;
  assign vssRvm_4_io_read_address_valid = virtualStealServers_4_io_read_address_valid; // @[stealSide.scala 91:47]
  assign vssRvm_4_io_read_address_bits = virtualStealServers_4_io_read_address_bits; // @[stealSide.scala 91:47]
  assign vssRvm_4_io_read_data_ready = virtualStealServers_4_io_read_data_ready; // @[stealSide.scala 92:47]
  assign vssRvm_4_io_write_address_valid = virtualStealServers_4_io_write_address_valid; // @[stealSide.scala 93:47]
  assign vssRvm_4_io_write_address_bits = virtualStealServers_4_io_write_address_bits; // @[stealSide.scala 93:47]
  assign vssRvm_4_io_write_data_valid = virtualStealServers_4_io_write_data_valid; // @[stealSide.scala 94:47]
  assign vssRvm_4_io_write_data_bits = virtualStealServers_4_io_write_data_bits; // @[stealSide.scala 94:47]
  assign vssRvm_4_axi_ARREADY = io_vss_axi_full_4_ARREADY; // @[stealSide.scala 95:47]
  assign vssRvm_4_axi_RVALID = io_vss_axi_full_4_RVALID; // @[stealSide.scala 95:47]
  assign vssRvm_4_axi_RDATA = io_vss_axi_full_4_RDATA; // @[stealSide.scala 95:47]
  assign vssRvm_4_axi_AWREADY = io_vss_axi_full_4_AWREADY; // @[stealSide.scala 95:47]
  assign vssRvm_4_axi_WREADY = io_vss_axi_full_4_WREADY; // @[stealSide.scala 95:47]
  assign vssRvm_4_axi_BVALID = io_vss_axi_full_4_BVALID; // @[stealSide.scala 95:47]
endmodule
module paper_exp1(
  input         clock,
  input         reset,
  output        task_stealSide_axi_mgmt_vss_0_ARREADY,
  input         task_stealSide_axi_mgmt_vss_0_ARVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_0_ARADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_0_ARPROT,
  input         task_stealSide_axi_mgmt_vss_0_RREADY,
  output        task_stealSide_axi_mgmt_vss_0_RVALID,
  output [63:0] task_stealSide_axi_mgmt_vss_0_RDATA,
  output [1:0]  task_stealSide_axi_mgmt_vss_0_RRESP,
  output        task_stealSide_axi_mgmt_vss_0_AWREADY,
  input         task_stealSide_axi_mgmt_vss_0_AWVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_0_AWADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_0_AWPROT,
  output        task_stealSide_axi_mgmt_vss_0_WREADY,
  input         task_stealSide_axi_mgmt_vss_0_WVALID,
  input  [63:0] task_stealSide_axi_mgmt_vss_0_WDATA,
  input  [7:0]  task_stealSide_axi_mgmt_vss_0_WSTRB,
  input         task_stealSide_axi_mgmt_vss_0_BREADY,
  output        task_stealSide_axi_mgmt_vss_0_BVALID,
  output [1:0]  task_stealSide_axi_mgmt_vss_0_BRESP,
  output        task_stealSide_axi_mgmt_vss_1_ARREADY,
  input         task_stealSide_axi_mgmt_vss_1_ARVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_1_ARADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_1_ARPROT,
  input         task_stealSide_axi_mgmt_vss_1_RREADY,
  output        task_stealSide_axi_mgmt_vss_1_RVALID,
  output [63:0] task_stealSide_axi_mgmt_vss_1_RDATA,
  output [1:0]  task_stealSide_axi_mgmt_vss_1_RRESP,
  output        task_stealSide_axi_mgmt_vss_1_AWREADY,
  input         task_stealSide_axi_mgmt_vss_1_AWVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_1_AWADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_1_AWPROT,
  output        task_stealSide_axi_mgmt_vss_1_WREADY,
  input         task_stealSide_axi_mgmt_vss_1_WVALID,
  input  [63:0] task_stealSide_axi_mgmt_vss_1_WDATA,
  input  [7:0]  task_stealSide_axi_mgmt_vss_1_WSTRB,
  input         task_stealSide_axi_mgmt_vss_1_BREADY,
  output        task_stealSide_axi_mgmt_vss_1_BVALID,
  output [1:0]  task_stealSide_axi_mgmt_vss_1_BRESP,
  output        task_stealSide_axi_mgmt_vss_2_ARREADY,
  input         task_stealSide_axi_mgmt_vss_2_ARVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_2_ARADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_2_ARPROT,
  input         task_stealSide_axi_mgmt_vss_2_RREADY,
  output        task_stealSide_axi_mgmt_vss_2_RVALID,
  output [63:0] task_stealSide_axi_mgmt_vss_2_RDATA,
  output [1:0]  task_stealSide_axi_mgmt_vss_2_RRESP,
  output        task_stealSide_axi_mgmt_vss_2_AWREADY,
  input         task_stealSide_axi_mgmt_vss_2_AWVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_2_AWADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_2_AWPROT,
  output        task_stealSide_axi_mgmt_vss_2_WREADY,
  input         task_stealSide_axi_mgmt_vss_2_WVALID,
  input  [63:0] task_stealSide_axi_mgmt_vss_2_WDATA,
  input  [7:0]  task_stealSide_axi_mgmt_vss_2_WSTRB,
  input         task_stealSide_axi_mgmt_vss_2_BREADY,
  output        task_stealSide_axi_mgmt_vss_2_BVALID,
  output [1:0]  task_stealSide_axi_mgmt_vss_2_BRESP,
  output        task_stealSide_axi_mgmt_vss_3_ARREADY,
  input         task_stealSide_axi_mgmt_vss_3_ARVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_3_ARADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_3_ARPROT,
  input         task_stealSide_axi_mgmt_vss_3_RREADY,
  output        task_stealSide_axi_mgmt_vss_3_RVALID,
  output [63:0] task_stealSide_axi_mgmt_vss_3_RDATA,
  output [1:0]  task_stealSide_axi_mgmt_vss_3_RRESP,
  output        task_stealSide_axi_mgmt_vss_3_AWREADY,
  input         task_stealSide_axi_mgmt_vss_3_AWVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_3_AWADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_3_AWPROT,
  output        task_stealSide_axi_mgmt_vss_3_WREADY,
  input         task_stealSide_axi_mgmt_vss_3_WVALID,
  input  [63:0] task_stealSide_axi_mgmt_vss_3_WDATA,
  input  [7:0]  task_stealSide_axi_mgmt_vss_3_WSTRB,
  input         task_stealSide_axi_mgmt_vss_3_BREADY,
  output        task_stealSide_axi_mgmt_vss_3_BVALID,
  output [1:0]  task_stealSide_axi_mgmt_vss_3_BRESP,
  output        task_stealSide_axi_mgmt_vss_4_ARREADY,
  input         task_stealSide_axi_mgmt_vss_4_ARVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_4_ARADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_4_ARPROT,
  input         task_stealSide_axi_mgmt_vss_4_RREADY,
  output        task_stealSide_axi_mgmt_vss_4_RVALID,
  output [63:0] task_stealSide_axi_mgmt_vss_4_RDATA,
  output [1:0]  task_stealSide_axi_mgmt_vss_4_RRESP,
  output        task_stealSide_axi_mgmt_vss_4_AWREADY,
  input         task_stealSide_axi_mgmt_vss_4_AWVALID,
  input  [5:0]  task_stealSide_axi_mgmt_vss_4_AWADDR,
  input  [2:0]  task_stealSide_axi_mgmt_vss_4_AWPROT,
  output        task_stealSide_axi_mgmt_vss_4_WREADY,
  input         task_stealSide_axi_mgmt_vss_4_WVALID,
  input  [63:0] task_stealSide_axi_mgmt_vss_4_WDATA,
  input  [7:0]  task_stealSide_axi_mgmt_vss_4_WSTRB,
  input         task_stealSide_axi_mgmt_vss_4_BREADY,
  output        task_stealSide_axi_mgmt_vss_4_BVALID,
  output [1:0]  task_stealSide_axi_mgmt_vss_4_BRESP,
  input         task_stealSide_vss_axi_full_0_ARREADY,
  output        task_stealSide_vss_axi_full_0_ARVALID,
  output [3:0]  task_stealSide_vss_axi_full_0_ARID,
  output [63:0] task_stealSide_vss_axi_full_0_ARADDR,
  output [7:0]  task_stealSide_vss_axi_full_0_ARLEN,
  output [2:0]  task_stealSide_vss_axi_full_0_ARSIZE,
  output [1:0]  task_stealSide_vss_axi_full_0_ARBURST,
  output        task_stealSide_vss_axi_full_0_ARLOCK,
  output [3:0]  task_stealSide_vss_axi_full_0_ARCACHE,
  output [2:0]  task_stealSide_vss_axi_full_0_ARPROT,
  output [3:0]  task_stealSide_vss_axi_full_0_ARQOS,
  output [3:0]  task_stealSide_vss_axi_full_0_ARREGION,
  output        task_stealSide_vss_axi_full_0_RREADY,
  input         task_stealSide_vss_axi_full_0_RVALID,
  input  [3:0]  task_stealSide_vss_axi_full_0_RID,
  input  [31:0] task_stealSide_vss_axi_full_0_RDATA,
  input  [1:0]  task_stealSide_vss_axi_full_0_RRESP,
  input         task_stealSide_vss_axi_full_0_RLAST,
  input         task_stealSide_vss_axi_full_0_AWREADY,
  output        task_stealSide_vss_axi_full_0_AWVALID,
  output [3:0]  task_stealSide_vss_axi_full_0_AWID,
  output [63:0] task_stealSide_vss_axi_full_0_AWADDR,
  output [7:0]  task_stealSide_vss_axi_full_0_AWLEN,
  output [2:0]  task_stealSide_vss_axi_full_0_AWSIZE,
  output [1:0]  task_stealSide_vss_axi_full_0_AWBURST,
  output        task_stealSide_vss_axi_full_0_AWLOCK,
  output [3:0]  task_stealSide_vss_axi_full_0_AWCACHE,
  output [2:0]  task_stealSide_vss_axi_full_0_AWPROT,
  output [3:0]  task_stealSide_vss_axi_full_0_AWQOS,
  output [3:0]  task_stealSide_vss_axi_full_0_AWREGION,
  input         task_stealSide_vss_axi_full_0_WREADY,
  output        task_stealSide_vss_axi_full_0_WVALID,
  output [3:0]  task_stealSide_vss_axi_full_0_WID,
  output [31:0] task_stealSide_vss_axi_full_0_WDATA,
  output [3:0]  task_stealSide_vss_axi_full_0_WSTRB,
  output        task_stealSide_vss_axi_full_0_WLAST,
  output        task_stealSide_vss_axi_full_0_BREADY,
  input         task_stealSide_vss_axi_full_0_BVALID,
  input  [3:0]  task_stealSide_vss_axi_full_0_BID,
  input  [1:0]  task_stealSide_vss_axi_full_0_BRESP,
  input         task_stealSide_vss_axi_full_1_ARREADY,
  output        task_stealSide_vss_axi_full_1_ARVALID,
  output [3:0]  task_stealSide_vss_axi_full_1_ARID,
  output [63:0] task_stealSide_vss_axi_full_1_ARADDR,
  output [7:0]  task_stealSide_vss_axi_full_1_ARLEN,
  output [2:0]  task_stealSide_vss_axi_full_1_ARSIZE,
  output [1:0]  task_stealSide_vss_axi_full_1_ARBURST,
  output        task_stealSide_vss_axi_full_1_ARLOCK,
  output [3:0]  task_stealSide_vss_axi_full_1_ARCACHE,
  output [2:0]  task_stealSide_vss_axi_full_1_ARPROT,
  output [3:0]  task_stealSide_vss_axi_full_1_ARQOS,
  output [3:0]  task_stealSide_vss_axi_full_1_ARREGION,
  output        task_stealSide_vss_axi_full_1_RREADY,
  input         task_stealSide_vss_axi_full_1_RVALID,
  input  [3:0]  task_stealSide_vss_axi_full_1_RID,
  input  [31:0] task_stealSide_vss_axi_full_1_RDATA,
  input  [1:0]  task_stealSide_vss_axi_full_1_RRESP,
  input         task_stealSide_vss_axi_full_1_RLAST,
  input         task_stealSide_vss_axi_full_1_AWREADY,
  output        task_stealSide_vss_axi_full_1_AWVALID,
  output [3:0]  task_stealSide_vss_axi_full_1_AWID,
  output [63:0] task_stealSide_vss_axi_full_1_AWADDR,
  output [7:0]  task_stealSide_vss_axi_full_1_AWLEN,
  output [2:0]  task_stealSide_vss_axi_full_1_AWSIZE,
  output [1:0]  task_stealSide_vss_axi_full_1_AWBURST,
  output        task_stealSide_vss_axi_full_1_AWLOCK,
  output [3:0]  task_stealSide_vss_axi_full_1_AWCACHE,
  output [2:0]  task_stealSide_vss_axi_full_1_AWPROT,
  output [3:0]  task_stealSide_vss_axi_full_1_AWQOS,
  output [3:0]  task_stealSide_vss_axi_full_1_AWREGION,
  input         task_stealSide_vss_axi_full_1_WREADY,
  output        task_stealSide_vss_axi_full_1_WVALID,
  output [3:0]  task_stealSide_vss_axi_full_1_WID,
  output [31:0] task_stealSide_vss_axi_full_1_WDATA,
  output [3:0]  task_stealSide_vss_axi_full_1_WSTRB,
  output        task_stealSide_vss_axi_full_1_WLAST,
  output        task_stealSide_vss_axi_full_1_BREADY,
  input         task_stealSide_vss_axi_full_1_BVALID,
  input  [3:0]  task_stealSide_vss_axi_full_1_BID,
  input  [1:0]  task_stealSide_vss_axi_full_1_BRESP,
  input         task_stealSide_vss_axi_full_2_ARREADY,
  output        task_stealSide_vss_axi_full_2_ARVALID,
  output [3:0]  task_stealSide_vss_axi_full_2_ARID,
  output [63:0] task_stealSide_vss_axi_full_2_ARADDR,
  output [7:0]  task_stealSide_vss_axi_full_2_ARLEN,
  output [2:0]  task_stealSide_vss_axi_full_2_ARSIZE,
  output [1:0]  task_stealSide_vss_axi_full_2_ARBURST,
  output        task_stealSide_vss_axi_full_2_ARLOCK,
  output [3:0]  task_stealSide_vss_axi_full_2_ARCACHE,
  output [2:0]  task_stealSide_vss_axi_full_2_ARPROT,
  output [3:0]  task_stealSide_vss_axi_full_2_ARQOS,
  output [3:0]  task_stealSide_vss_axi_full_2_ARREGION,
  output        task_stealSide_vss_axi_full_2_RREADY,
  input         task_stealSide_vss_axi_full_2_RVALID,
  input  [3:0]  task_stealSide_vss_axi_full_2_RID,
  input  [31:0] task_stealSide_vss_axi_full_2_RDATA,
  input  [1:0]  task_stealSide_vss_axi_full_2_RRESP,
  input         task_stealSide_vss_axi_full_2_RLAST,
  input         task_stealSide_vss_axi_full_2_AWREADY,
  output        task_stealSide_vss_axi_full_2_AWVALID,
  output [3:0]  task_stealSide_vss_axi_full_2_AWID,
  output [63:0] task_stealSide_vss_axi_full_2_AWADDR,
  output [7:0]  task_stealSide_vss_axi_full_2_AWLEN,
  output [2:0]  task_stealSide_vss_axi_full_2_AWSIZE,
  output [1:0]  task_stealSide_vss_axi_full_2_AWBURST,
  output        task_stealSide_vss_axi_full_2_AWLOCK,
  output [3:0]  task_stealSide_vss_axi_full_2_AWCACHE,
  output [2:0]  task_stealSide_vss_axi_full_2_AWPROT,
  output [3:0]  task_stealSide_vss_axi_full_2_AWQOS,
  output [3:0]  task_stealSide_vss_axi_full_2_AWREGION,
  input         task_stealSide_vss_axi_full_2_WREADY,
  output        task_stealSide_vss_axi_full_2_WVALID,
  output [3:0]  task_stealSide_vss_axi_full_2_WID,
  output [31:0] task_stealSide_vss_axi_full_2_WDATA,
  output [3:0]  task_stealSide_vss_axi_full_2_WSTRB,
  output        task_stealSide_vss_axi_full_2_WLAST,
  output        task_stealSide_vss_axi_full_2_BREADY,
  input         task_stealSide_vss_axi_full_2_BVALID,
  input  [3:0]  task_stealSide_vss_axi_full_2_BID,
  input  [1:0]  task_stealSide_vss_axi_full_2_BRESP,
  input         task_stealSide_vss_axi_full_3_ARREADY,
  output        task_stealSide_vss_axi_full_3_ARVALID,
  output [3:0]  task_stealSide_vss_axi_full_3_ARID,
  output [63:0] task_stealSide_vss_axi_full_3_ARADDR,
  output [7:0]  task_stealSide_vss_axi_full_3_ARLEN,
  output [2:0]  task_stealSide_vss_axi_full_3_ARSIZE,
  output [1:0]  task_stealSide_vss_axi_full_3_ARBURST,
  output        task_stealSide_vss_axi_full_3_ARLOCK,
  output [3:0]  task_stealSide_vss_axi_full_3_ARCACHE,
  output [2:0]  task_stealSide_vss_axi_full_3_ARPROT,
  output [3:0]  task_stealSide_vss_axi_full_3_ARQOS,
  output [3:0]  task_stealSide_vss_axi_full_3_ARREGION,
  output        task_stealSide_vss_axi_full_3_RREADY,
  input         task_stealSide_vss_axi_full_3_RVALID,
  input  [3:0]  task_stealSide_vss_axi_full_3_RID,
  input  [31:0] task_stealSide_vss_axi_full_3_RDATA,
  input  [1:0]  task_stealSide_vss_axi_full_3_RRESP,
  input         task_stealSide_vss_axi_full_3_RLAST,
  input         task_stealSide_vss_axi_full_3_AWREADY,
  output        task_stealSide_vss_axi_full_3_AWVALID,
  output [3:0]  task_stealSide_vss_axi_full_3_AWID,
  output [63:0] task_stealSide_vss_axi_full_3_AWADDR,
  output [7:0]  task_stealSide_vss_axi_full_3_AWLEN,
  output [2:0]  task_stealSide_vss_axi_full_3_AWSIZE,
  output [1:0]  task_stealSide_vss_axi_full_3_AWBURST,
  output        task_stealSide_vss_axi_full_3_AWLOCK,
  output [3:0]  task_stealSide_vss_axi_full_3_AWCACHE,
  output [2:0]  task_stealSide_vss_axi_full_3_AWPROT,
  output [3:0]  task_stealSide_vss_axi_full_3_AWQOS,
  output [3:0]  task_stealSide_vss_axi_full_3_AWREGION,
  input         task_stealSide_vss_axi_full_3_WREADY,
  output        task_stealSide_vss_axi_full_3_WVALID,
  output [3:0]  task_stealSide_vss_axi_full_3_WID,
  output [31:0] task_stealSide_vss_axi_full_3_WDATA,
  output [3:0]  task_stealSide_vss_axi_full_3_WSTRB,
  output        task_stealSide_vss_axi_full_3_WLAST,
  output        task_stealSide_vss_axi_full_3_BREADY,
  input         task_stealSide_vss_axi_full_3_BVALID,
  input  [3:0]  task_stealSide_vss_axi_full_3_BID,
  input  [1:0]  task_stealSide_vss_axi_full_3_BRESP,
  input         task_stealSide_vss_axi_full_4_ARREADY,
  output        task_stealSide_vss_axi_full_4_ARVALID,
  output [3:0]  task_stealSide_vss_axi_full_4_ARID,
  output [63:0] task_stealSide_vss_axi_full_4_ARADDR,
  output [7:0]  task_stealSide_vss_axi_full_4_ARLEN,
  output [2:0]  task_stealSide_vss_axi_full_4_ARSIZE,
  output [1:0]  task_stealSide_vss_axi_full_4_ARBURST,
  output        task_stealSide_vss_axi_full_4_ARLOCK,
  output [3:0]  task_stealSide_vss_axi_full_4_ARCACHE,
  output [2:0]  task_stealSide_vss_axi_full_4_ARPROT,
  output [3:0]  task_stealSide_vss_axi_full_4_ARQOS,
  output [3:0]  task_stealSide_vss_axi_full_4_ARREGION,
  output        task_stealSide_vss_axi_full_4_RREADY,
  input         task_stealSide_vss_axi_full_4_RVALID,
  input  [3:0]  task_stealSide_vss_axi_full_4_RID,
  input  [31:0] task_stealSide_vss_axi_full_4_RDATA,
  input  [1:0]  task_stealSide_vss_axi_full_4_RRESP,
  input         task_stealSide_vss_axi_full_4_RLAST,
  input         task_stealSide_vss_axi_full_4_AWREADY,
  output        task_stealSide_vss_axi_full_4_AWVALID,
  output [3:0]  task_stealSide_vss_axi_full_4_AWID,
  output [63:0] task_stealSide_vss_axi_full_4_AWADDR,
  output [7:0]  task_stealSide_vss_axi_full_4_AWLEN,
  output [2:0]  task_stealSide_vss_axi_full_4_AWSIZE,
  output [1:0]  task_stealSide_vss_axi_full_4_AWBURST,
  output        task_stealSide_vss_axi_full_4_AWLOCK,
  output [3:0]  task_stealSide_vss_axi_full_4_AWCACHE,
  output [2:0]  task_stealSide_vss_axi_full_4_AWPROT,
  output [3:0]  task_stealSide_vss_axi_full_4_AWQOS,
  output [3:0]  task_stealSide_vss_axi_full_4_AWREGION,
  input         task_stealSide_vss_axi_full_4_WREADY,
  output        task_stealSide_vss_axi_full_4_WVALID,
  output [3:0]  task_stealSide_vss_axi_full_4_WID,
  output [31:0] task_stealSide_vss_axi_full_4_WDATA,
  output [3:0]  task_stealSide_vss_axi_full_4_WSTRB,
  output        task_stealSide_vss_axi_full_4_WLAST,
  output        task_stealSide_vss_axi_full_4_BREADY,
  input         task_stealSide_vss_axi_full_4_BVALID,
  input  [3:0]  task_stealSide_vss_axi_full_4_BID,
  input  [1:0]  task_stealSide_vss_axi_full_4_BRESP,
  input         task_stealSide_taskOut_0_TREADY,
  output        task_stealSide_taskOut_0_TVALID,
  output [31:0] task_stealSide_taskOut_0_TDATA,
  input         task_stealSide_taskOut_1_TREADY,
  output        task_stealSide_taskOut_1_TVALID,
  output [31:0] task_stealSide_taskOut_1_TDATA,
  input         task_stealSide_taskOut_2_TREADY,
  output        task_stealSide_taskOut_2_TVALID,
  output [31:0] task_stealSide_taskOut_2_TDATA,
  input         task_stealSide_taskOut_3_TREADY,
  output        task_stealSide_taskOut_3_TVALID,
  output [31:0] task_stealSide_taskOut_3_TDATA,
  input         task_stealSide_taskOut_4_TREADY,
  output        task_stealSide_taskOut_4_TVALID,
  output [31:0] task_stealSide_taskOut_4_TDATA,
  input         task_stealSide_taskOut_5_TREADY,
  output        task_stealSide_taskOut_5_TVALID,
  output [31:0] task_stealSide_taskOut_5_TDATA,
  input         task_stealSide_taskOut_6_TREADY,
  output        task_stealSide_taskOut_6_TVALID,
  output [31:0] task_stealSide_taskOut_6_TDATA,
  input         task_stealSide_taskOut_7_TREADY,
  output        task_stealSide_taskOut_7_TVALID,
  output [31:0] task_stealSide_taskOut_7_TDATA,
  input         task_stealSide_taskOut_8_TREADY,
  output        task_stealSide_taskOut_8_TVALID,
  output [31:0] task_stealSide_taskOut_8_TDATA,
  input         task_stealSide_taskOut_9_TREADY,
  output        task_stealSide_taskOut_9_TVALID,
  output [31:0] task_stealSide_taskOut_9_TDATA,
  input         task_stealSide_taskOut_10_TREADY,
  output        task_stealSide_taskOut_10_TVALID,
  output [31:0] task_stealSide_taskOut_10_TDATA,
  input         task_stealSide_taskOut_11_TREADY,
  output        task_stealSide_taskOut_11_TVALID,
  output [31:0] task_stealSide_taskOut_11_TDATA,
  input         task_stealSide_taskOut_12_TREADY,
  output        task_stealSide_taskOut_12_TVALID,
  output [31:0] task_stealSide_taskOut_12_TDATA,
  input         task_stealSide_taskOut_13_TREADY,
  output        task_stealSide_taskOut_13_TVALID,
  output [31:0] task_stealSide_taskOut_13_TDATA,
  input         task_stealSide_taskOut_14_TREADY,
  output        task_stealSide_taskOut_14_TVALID,
  output [31:0] task_stealSide_taskOut_14_TDATA,
  input         task_stealSide_taskOut_15_TREADY,
  output        task_stealSide_taskOut_15_TVALID,
  output [31:0] task_stealSide_taskOut_15_TDATA,
  input         task_stealSide_taskOut_16_TREADY,
  output        task_stealSide_taskOut_16_TVALID,
  output [31:0] task_stealSide_taskOut_16_TDATA,
  input         task_stealSide_taskOut_17_TREADY,
  output        task_stealSide_taskOut_17_TVALID,
  output [31:0] task_stealSide_taskOut_17_TDATA,
  input         task_stealSide_taskOut_18_TREADY,
  output        task_stealSide_taskOut_18_TVALID,
  output [31:0] task_stealSide_taskOut_18_TDATA,
  input         task_stealSide_taskOut_19_TREADY,
  output        task_stealSide_taskOut_19_TVALID,
  output [31:0] task_stealSide_taskOut_19_TDATA,
  input         task_stealSide_taskOut_20_TREADY,
  output        task_stealSide_taskOut_20_TVALID,
  output [31:0] task_stealSide_taskOut_20_TDATA,
  input         task_stealSide_taskOut_21_TREADY,
  output        task_stealSide_taskOut_21_TVALID,
  output [31:0] task_stealSide_taskOut_21_TDATA,
  input         task_stealSide_taskOut_22_TREADY,
  output        task_stealSide_taskOut_22_TVALID,
  output [31:0] task_stealSide_taskOut_22_TDATA,
  input         task_stealSide_taskOut_23_TREADY,
  output        task_stealSide_taskOut_23_TVALID,
  output [31:0] task_stealSide_taskOut_23_TDATA,
  output        task_stealSide_taskIn_0_TREADY,
  input         task_stealSide_taskIn_0_TVALID,
  input  [31:0] task_stealSide_taskIn_0_TDATA,
  output        task_stealSide_taskIn_1_TREADY,
  input         task_stealSide_taskIn_1_TVALID,
  input  [31:0] task_stealSide_taskIn_1_TDATA,
  output        task_stealSide_taskIn_2_TREADY,
  input         task_stealSide_taskIn_2_TVALID,
  input  [31:0] task_stealSide_taskIn_2_TDATA,
  output        task_stealSide_taskIn_3_TREADY,
  input         task_stealSide_taskIn_3_TVALID,
  input  [31:0] task_stealSide_taskIn_3_TDATA,
  output        task_stealSide_taskIn_4_TREADY,
  input         task_stealSide_taskIn_4_TVALID,
  input  [31:0] task_stealSide_taskIn_4_TDATA,
  output        task_stealSide_taskIn_5_TREADY,
  input         task_stealSide_taskIn_5_TVALID,
  input  [31:0] task_stealSide_taskIn_5_TDATA,
  output        task_stealSide_taskIn_6_TREADY,
  input         task_stealSide_taskIn_6_TVALID,
  input  [31:0] task_stealSide_taskIn_6_TDATA,
  output        task_stealSide_taskIn_7_TREADY,
  input         task_stealSide_taskIn_7_TVALID,
  input  [31:0] task_stealSide_taskIn_7_TDATA,
  output        task_stealSide_taskIn_8_TREADY,
  input         task_stealSide_taskIn_8_TVALID,
  input  [31:0] task_stealSide_taskIn_8_TDATA,
  output        task_stealSide_taskIn_9_TREADY,
  input         task_stealSide_taskIn_9_TVALID,
  input  [31:0] task_stealSide_taskIn_9_TDATA,
  output        task_stealSide_taskIn_10_TREADY,
  input         task_stealSide_taskIn_10_TVALID,
  input  [31:0] task_stealSide_taskIn_10_TDATA,
  output        task_stealSide_taskIn_11_TREADY,
  input         task_stealSide_taskIn_11_TVALID,
  input  [31:0] task_stealSide_taskIn_11_TDATA,
  output        task_stealSide_taskIn_12_TREADY,
  input         task_stealSide_taskIn_12_TVALID,
  input  [31:0] task_stealSide_taskIn_12_TDATA,
  output        task_stealSide_taskIn_13_TREADY,
  input         task_stealSide_taskIn_13_TVALID,
  input  [31:0] task_stealSide_taskIn_13_TDATA,
  output        task_stealSide_taskIn_14_TREADY,
  input         task_stealSide_taskIn_14_TVALID,
  input  [31:0] task_stealSide_taskIn_14_TDATA,
  output        task_stealSide_taskIn_15_TREADY,
  input         task_stealSide_taskIn_15_TVALID,
  input  [31:0] task_stealSide_taskIn_15_TDATA,
  output        task_stealSide_taskIn_16_TREADY,
  input         task_stealSide_taskIn_16_TVALID,
  input  [31:0] task_stealSide_taskIn_16_TDATA,
  output        task_stealSide_taskIn_17_TREADY,
  input         task_stealSide_taskIn_17_TVALID,
  input  [31:0] task_stealSide_taskIn_17_TDATA,
  output        task_stealSide_taskIn_18_TREADY,
  input         task_stealSide_taskIn_18_TVALID,
  input  [31:0] task_stealSide_taskIn_18_TDATA,
  output        task_stealSide_taskIn_19_TREADY,
  input         task_stealSide_taskIn_19_TVALID,
  input  [31:0] task_stealSide_taskIn_19_TDATA,
  output        task_stealSide_taskIn_20_TREADY,
  input         task_stealSide_taskIn_20_TVALID,
  input  [31:0] task_stealSide_taskIn_20_TDATA,
  output        task_stealSide_taskIn_21_TREADY,
  input         task_stealSide_taskIn_21_TVALID,
  input  [31:0] task_stealSide_taskIn_21_TDATA,
  output        task_stealSide_taskIn_22_TREADY,
  input         task_stealSide_taskIn_22_TVALID,
  input  [31:0] task_stealSide_taskIn_22_TDATA,
  output        task_stealSide_taskIn_23_TREADY,
  input         task_stealSide_taskIn_23_TVALID,
  input  [31:0] task_stealSide_taskIn_23_TDATA
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
  wire  stealSide_io_axi_mgmt_vss_1_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_1_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_1_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_1_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_1_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_axi_mgmt_vss_1_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_1_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_2_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_2_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_2_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_2_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_axi_mgmt_vss_2_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_2_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_3_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_3_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_3_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_3_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_axi_mgmt_vss_3_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_3_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_ARVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_4_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_RVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_4_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_AWVALID; // @[fullSysGen.scala 228:29]
  wire [5:0] stealSide_io_axi_mgmt_vss_4_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_axi_mgmt_vss_4_WDATA; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_axi_mgmt_vss_4_WSTRB; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_BREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_axi_mgmt_vss_4_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_0_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_RVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_0_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_1_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_RVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_1_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_1_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_WVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_1_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_1_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_2_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_RVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_2_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_2_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_WVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_2_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_2_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_3_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_RVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_3_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_3_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_WVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_3_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_3_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_ARREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_ARVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_4_ARADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_RREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_RVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_4_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_4_AWADDR; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_WVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_vss_axi_full_4_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_4_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_0_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_0_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_0_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_1_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_1_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_1_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_2_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_2_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_2_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_3_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_3_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_3_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_4_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_4_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_4_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_5_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_5_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_5_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_6_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_6_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_6_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_7_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_7_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_7_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_8_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_8_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_8_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_9_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_9_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_9_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_10_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_10_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_10_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_11_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_11_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_11_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_12_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_12_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_12_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_13_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_13_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_13_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_14_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_14_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_14_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_15_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_15_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_15_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_16_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_16_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_16_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_17_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_17_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_17_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_18_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_18_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_18_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_19_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_19_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_19_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_20_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_20_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_20_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_21_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_21_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_21_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_22_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_22_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_22_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_23_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_23_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskOut_23_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_0_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_0_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_0_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_1_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_1_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_1_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_2_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_2_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_2_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_3_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_3_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_3_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_4_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_4_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_4_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_5_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_5_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_5_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_6_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_6_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_6_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_7_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_7_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_7_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_8_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_8_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_8_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_9_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_9_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_9_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_10_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_10_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_10_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_11_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_11_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_11_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_12_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_12_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_12_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_13_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_13_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_13_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_14_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_14_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_14_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_15_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_15_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_15_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_16_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_16_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_16_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_17_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_17_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_17_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_18_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_18_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_18_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_19_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_19_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_19_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_20_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_20_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_20_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_21_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_21_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_21_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_22_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_22_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_22_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_23_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_23_TVALID; // @[fullSysGen.scala 228:29]
  wire [31:0] stealSide_io_taskIn_23_TDATA; // @[fullSysGen.scala 228:29]
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
    .io_axi_mgmt_vss_1_ARREADY(stealSide_io_axi_mgmt_vss_1_ARREADY),
    .io_axi_mgmt_vss_1_ARVALID(stealSide_io_axi_mgmt_vss_1_ARVALID),
    .io_axi_mgmt_vss_1_ARADDR(stealSide_io_axi_mgmt_vss_1_ARADDR),
    .io_axi_mgmt_vss_1_RREADY(stealSide_io_axi_mgmt_vss_1_RREADY),
    .io_axi_mgmt_vss_1_RVALID(stealSide_io_axi_mgmt_vss_1_RVALID),
    .io_axi_mgmt_vss_1_RDATA(stealSide_io_axi_mgmt_vss_1_RDATA),
    .io_axi_mgmt_vss_1_AWREADY(stealSide_io_axi_mgmt_vss_1_AWREADY),
    .io_axi_mgmt_vss_1_AWVALID(stealSide_io_axi_mgmt_vss_1_AWVALID),
    .io_axi_mgmt_vss_1_AWADDR(stealSide_io_axi_mgmt_vss_1_AWADDR),
    .io_axi_mgmt_vss_1_WREADY(stealSide_io_axi_mgmt_vss_1_WREADY),
    .io_axi_mgmt_vss_1_WVALID(stealSide_io_axi_mgmt_vss_1_WVALID),
    .io_axi_mgmt_vss_1_WDATA(stealSide_io_axi_mgmt_vss_1_WDATA),
    .io_axi_mgmt_vss_1_WSTRB(stealSide_io_axi_mgmt_vss_1_WSTRB),
    .io_axi_mgmt_vss_1_BREADY(stealSide_io_axi_mgmt_vss_1_BREADY),
    .io_axi_mgmt_vss_1_BVALID(stealSide_io_axi_mgmt_vss_1_BVALID),
    .io_axi_mgmt_vss_2_ARREADY(stealSide_io_axi_mgmt_vss_2_ARREADY),
    .io_axi_mgmt_vss_2_ARVALID(stealSide_io_axi_mgmt_vss_2_ARVALID),
    .io_axi_mgmt_vss_2_ARADDR(stealSide_io_axi_mgmt_vss_2_ARADDR),
    .io_axi_mgmt_vss_2_RREADY(stealSide_io_axi_mgmt_vss_2_RREADY),
    .io_axi_mgmt_vss_2_RVALID(stealSide_io_axi_mgmt_vss_2_RVALID),
    .io_axi_mgmt_vss_2_RDATA(stealSide_io_axi_mgmt_vss_2_RDATA),
    .io_axi_mgmt_vss_2_AWREADY(stealSide_io_axi_mgmt_vss_2_AWREADY),
    .io_axi_mgmt_vss_2_AWVALID(stealSide_io_axi_mgmt_vss_2_AWVALID),
    .io_axi_mgmt_vss_2_AWADDR(stealSide_io_axi_mgmt_vss_2_AWADDR),
    .io_axi_mgmt_vss_2_WREADY(stealSide_io_axi_mgmt_vss_2_WREADY),
    .io_axi_mgmt_vss_2_WVALID(stealSide_io_axi_mgmt_vss_2_WVALID),
    .io_axi_mgmt_vss_2_WDATA(stealSide_io_axi_mgmt_vss_2_WDATA),
    .io_axi_mgmt_vss_2_WSTRB(stealSide_io_axi_mgmt_vss_2_WSTRB),
    .io_axi_mgmt_vss_2_BREADY(stealSide_io_axi_mgmt_vss_2_BREADY),
    .io_axi_mgmt_vss_2_BVALID(stealSide_io_axi_mgmt_vss_2_BVALID),
    .io_axi_mgmt_vss_3_ARREADY(stealSide_io_axi_mgmt_vss_3_ARREADY),
    .io_axi_mgmt_vss_3_ARVALID(stealSide_io_axi_mgmt_vss_3_ARVALID),
    .io_axi_mgmt_vss_3_ARADDR(stealSide_io_axi_mgmt_vss_3_ARADDR),
    .io_axi_mgmt_vss_3_RREADY(stealSide_io_axi_mgmt_vss_3_RREADY),
    .io_axi_mgmt_vss_3_RVALID(stealSide_io_axi_mgmt_vss_3_RVALID),
    .io_axi_mgmt_vss_3_RDATA(stealSide_io_axi_mgmt_vss_3_RDATA),
    .io_axi_mgmt_vss_3_AWREADY(stealSide_io_axi_mgmt_vss_3_AWREADY),
    .io_axi_mgmt_vss_3_AWVALID(stealSide_io_axi_mgmt_vss_3_AWVALID),
    .io_axi_mgmt_vss_3_AWADDR(stealSide_io_axi_mgmt_vss_3_AWADDR),
    .io_axi_mgmt_vss_3_WREADY(stealSide_io_axi_mgmt_vss_3_WREADY),
    .io_axi_mgmt_vss_3_WVALID(stealSide_io_axi_mgmt_vss_3_WVALID),
    .io_axi_mgmt_vss_3_WDATA(stealSide_io_axi_mgmt_vss_3_WDATA),
    .io_axi_mgmt_vss_3_WSTRB(stealSide_io_axi_mgmt_vss_3_WSTRB),
    .io_axi_mgmt_vss_3_BREADY(stealSide_io_axi_mgmt_vss_3_BREADY),
    .io_axi_mgmt_vss_3_BVALID(stealSide_io_axi_mgmt_vss_3_BVALID),
    .io_axi_mgmt_vss_4_ARREADY(stealSide_io_axi_mgmt_vss_4_ARREADY),
    .io_axi_mgmt_vss_4_ARVALID(stealSide_io_axi_mgmt_vss_4_ARVALID),
    .io_axi_mgmt_vss_4_ARADDR(stealSide_io_axi_mgmt_vss_4_ARADDR),
    .io_axi_mgmt_vss_4_RREADY(stealSide_io_axi_mgmt_vss_4_RREADY),
    .io_axi_mgmt_vss_4_RVALID(stealSide_io_axi_mgmt_vss_4_RVALID),
    .io_axi_mgmt_vss_4_RDATA(stealSide_io_axi_mgmt_vss_4_RDATA),
    .io_axi_mgmt_vss_4_AWREADY(stealSide_io_axi_mgmt_vss_4_AWREADY),
    .io_axi_mgmt_vss_4_AWVALID(stealSide_io_axi_mgmt_vss_4_AWVALID),
    .io_axi_mgmt_vss_4_AWADDR(stealSide_io_axi_mgmt_vss_4_AWADDR),
    .io_axi_mgmt_vss_4_WREADY(stealSide_io_axi_mgmt_vss_4_WREADY),
    .io_axi_mgmt_vss_4_WVALID(stealSide_io_axi_mgmt_vss_4_WVALID),
    .io_axi_mgmt_vss_4_WDATA(stealSide_io_axi_mgmt_vss_4_WDATA),
    .io_axi_mgmt_vss_4_WSTRB(stealSide_io_axi_mgmt_vss_4_WSTRB),
    .io_axi_mgmt_vss_4_BREADY(stealSide_io_axi_mgmt_vss_4_BREADY),
    .io_axi_mgmt_vss_4_BVALID(stealSide_io_axi_mgmt_vss_4_BVALID),
    .io_vss_axi_full_0_ARREADY(stealSide_io_vss_axi_full_0_ARREADY),
    .io_vss_axi_full_0_ARVALID(stealSide_io_vss_axi_full_0_ARVALID),
    .io_vss_axi_full_0_ARADDR(stealSide_io_vss_axi_full_0_ARADDR),
    .io_vss_axi_full_0_RREADY(stealSide_io_vss_axi_full_0_RREADY),
    .io_vss_axi_full_0_RVALID(stealSide_io_vss_axi_full_0_RVALID),
    .io_vss_axi_full_0_RDATA(stealSide_io_vss_axi_full_0_RDATA),
    .io_vss_axi_full_0_AWREADY(stealSide_io_vss_axi_full_0_AWREADY),
    .io_vss_axi_full_0_AWVALID(stealSide_io_vss_axi_full_0_AWVALID),
    .io_vss_axi_full_0_AWADDR(stealSide_io_vss_axi_full_0_AWADDR),
    .io_vss_axi_full_0_WREADY(stealSide_io_vss_axi_full_0_WREADY),
    .io_vss_axi_full_0_WVALID(stealSide_io_vss_axi_full_0_WVALID),
    .io_vss_axi_full_0_WDATA(stealSide_io_vss_axi_full_0_WDATA),
    .io_vss_axi_full_0_BVALID(stealSide_io_vss_axi_full_0_BVALID),
    .io_vss_axi_full_1_ARREADY(stealSide_io_vss_axi_full_1_ARREADY),
    .io_vss_axi_full_1_ARVALID(stealSide_io_vss_axi_full_1_ARVALID),
    .io_vss_axi_full_1_ARADDR(stealSide_io_vss_axi_full_1_ARADDR),
    .io_vss_axi_full_1_RREADY(stealSide_io_vss_axi_full_1_RREADY),
    .io_vss_axi_full_1_RVALID(stealSide_io_vss_axi_full_1_RVALID),
    .io_vss_axi_full_1_RDATA(stealSide_io_vss_axi_full_1_RDATA),
    .io_vss_axi_full_1_AWREADY(stealSide_io_vss_axi_full_1_AWREADY),
    .io_vss_axi_full_1_AWVALID(stealSide_io_vss_axi_full_1_AWVALID),
    .io_vss_axi_full_1_AWADDR(stealSide_io_vss_axi_full_1_AWADDR),
    .io_vss_axi_full_1_WREADY(stealSide_io_vss_axi_full_1_WREADY),
    .io_vss_axi_full_1_WVALID(stealSide_io_vss_axi_full_1_WVALID),
    .io_vss_axi_full_1_WDATA(stealSide_io_vss_axi_full_1_WDATA),
    .io_vss_axi_full_1_BVALID(stealSide_io_vss_axi_full_1_BVALID),
    .io_vss_axi_full_2_ARREADY(stealSide_io_vss_axi_full_2_ARREADY),
    .io_vss_axi_full_2_ARVALID(stealSide_io_vss_axi_full_2_ARVALID),
    .io_vss_axi_full_2_ARADDR(stealSide_io_vss_axi_full_2_ARADDR),
    .io_vss_axi_full_2_RREADY(stealSide_io_vss_axi_full_2_RREADY),
    .io_vss_axi_full_2_RVALID(stealSide_io_vss_axi_full_2_RVALID),
    .io_vss_axi_full_2_RDATA(stealSide_io_vss_axi_full_2_RDATA),
    .io_vss_axi_full_2_AWREADY(stealSide_io_vss_axi_full_2_AWREADY),
    .io_vss_axi_full_2_AWVALID(stealSide_io_vss_axi_full_2_AWVALID),
    .io_vss_axi_full_2_AWADDR(stealSide_io_vss_axi_full_2_AWADDR),
    .io_vss_axi_full_2_WREADY(stealSide_io_vss_axi_full_2_WREADY),
    .io_vss_axi_full_2_WVALID(stealSide_io_vss_axi_full_2_WVALID),
    .io_vss_axi_full_2_WDATA(stealSide_io_vss_axi_full_2_WDATA),
    .io_vss_axi_full_2_BVALID(stealSide_io_vss_axi_full_2_BVALID),
    .io_vss_axi_full_3_ARREADY(stealSide_io_vss_axi_full_3_ARREADY),
    .io_vss_axi_full_3_ARVALID(stealSide_io_vss_axi_full_3_ARVALID),
    .io_vss_axi_full_3_ARADDR(stealSide_io_vss_axi_full_3_ARADDR),
    .io_vss_axi_full_3_RREADY(stealSide_io_vss_axi_full_3_RREADY),
    .io_vss_axi_full_3_RVALID(stealSide_io_vss_axi_full_3_RVALID),
    .io_vss_axi_full_3_RDATA(stealSide_io_vss_axi_full_3_RDATA),
    .io_vss_axi_full_3_AWREADY(stealSide_io_vss_axi_full_3_AWREADY),
    .io_vss_axi_full_3_AWVALID(stealSide_io_vss_axi_full_3_AWVALID),
    .io_vss_axi_full_3_AWADDR(stealSide_io_vss_axi_full_3_AWADDR),
    .io_vss_axi_full_3_WREADY(stealSide_io_vss_axi_full_3_WREADY),
    .io_vss_axi_full_3_WVALID(stealSide_io_vss_axi_full_3_WVALID),
    .io_vss_axi_full_3_WDATA(stealSide_io_vss_axi_full_3_WDATA),
    .io_vss_axi_full_3_BVALID(stealSide_io_vss_axi_full_3_BVALID),
    .io_vss_axi_full_4_ARREADY(stealSide_io_vss_axi_full_4_ARREADY),
    .io_vss_axi_full_4_ARVALID(stealSide_io_vss_axi_full_4_ARVALID),
    .io_vss_axi_full_4_ARADDR(stealSide_io_vss_axi_full_4_ARADDR),
    .io_vss_axi_full_4_RREADY(stealSide_io_vss_axi_full_4_RREADY),
    .io_vss_axi_full_4_RVALID(stealSide_io_vss_axi_full_4_RVALID),
    .io_vss_axi_full_4_RDATA(stealSide_io_vss_axi_full_4_RDATA),
    .io_vss_axi_full_4_AWREADY(stealSide_io_vss_axi_full_4_AWREADY),
    .io_vss_axi_full_4_AWVALID(stealSide_io_vss_axi_full_4_AWVALID),
    .io_vss_axi_full_4_AWADDR(stealSide_io_vss_axi_full_4_AWADDR),
    .io_vss_axi_full_4_WREADY(stealSide_io_vss_axi_full_4_WREADY),
    .io_vss_axi_full_4_WVALID(stealSide_io_vss_axi_full_4_WVALID),
    .io_vss_axi_full_4_WDATA(stealSide_io_vss_axi_full_4_WDATA),
    .io_vss_axi_full_4_BVALID(stealSide_io_vss_axi_full_4_BVALID),
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
    .io_taskOut_4_TREADY(stealSide_io_taskOut_4_TREADY),
    .io_taskOut_4_TVALID(stealSide_io_taskOut_4_TVALID),
    .io_taskOut_4_TDATA(stealSide_io_taskOut_4_TDATA),
    .io_taskOut_5_TREADY(stealSide_io_taskOut_5_TREADY),
    .io_taskOut_5_TVALID(stealSide_io_taskOut_5_TVALID),
    .io_taskOut_5_TDATA(stealSide_io_taskOut_5_TDATA),
    .io_taskOut_6_TREADY(stealSide_io_taskOut_6_TREADY),
    .io_taskOut_6_TVALID(stealSide_io_taskOut_6_TVALID),
    .io_taskOut_6_TDATA(stealSide_io_taskOut_6_TDATA),
    .io_taskOut_7_TREADY(stealSide_io_taskOut_7_TREADY),
    .io_taskOut_7_TVALID(stealSide_io_taskOut_7_TVALID),
    .io_taskOut_7_TDATA(stealSide_io_taskOut_7_TDATA),
    .io_taskOut_8_TREADY(stealSide_io_taskOut_8_TREADY),
    .io_taskOut_8_TVALID(stealSide_io_taskOut_8_TVALID),
    .io_taskOut_8_TDATA(stealSide_io_taskOut_8_TDATA),
    .io_taskOut_9_TREADY(stealSide_io_taskOut_9_TREADY),
    .io_taskOut_9_TVALID(stealSide_io_taskOut_9_TVALID),
    .io_taskOut_9_TDATA(stealSide_io_taskOut_9_TDATA),
    .io_taskOut_10_TREADY(stealSide_io_taskOut_10_TREADY),
    .io_taskOut_10_TVALID(stealSide_io_taskOut_10_TVALID),
    .io_taskOut_10_TDATA(stealSide_io_taskOut_10_TDATA),
    .io_taskOut_11_TREADY(stealSide_io_taskOut_11_TREADY),
    .io_taskOut_11_TVALID(stealSide_io_taskOut_11_TVALID),
    .io_taskOut_11_TDATA(stealSide_io_taskOut_11_TDATA),
    .io_taskOut_12_TREADY(stealSide_io_taskOut_12_TREADY),
    .io_taskOut_12_TVALID(stealSide_io_taskOut_12_TVALID),
    .io_taskOut_12_TDATA(stealSide_io_taskOut_12_TDATA),
    .io_taskOut_13_TREADY(stealSide_io_taskOut_13_TREADY),
    .io_taskOut_13_TVALID(stealSide_io_taskOut_13_TVALID),
    .io_taskOut_13_TDATA(stealSide_io_taskOut_13_TDATA),
    .io_taskOut_14_TREADY(stealSide_io_taskOut_14_TREADY),
    .io_taskOut_14_TVALID(stealSide_io_taskOut_14_TVALID),
    .io_taskOut_14_TDATA(stealSide_io_taskOut_14_TDATA),
    .io_taskOut_15_TREADY(stealSide_io_taskOut_15_TREADY),
    .io_taskOut_15_TVALID(stealSide_io_taskOut_15_TVALID),
    .io_taskOut_15_TDATA(stealSide_io_taskOut_15_TDATA),
    .io_taskOut_16_TREADY(stealSide_io_taskOut_16_TREADY),
    .io_taskOut_16_TVALID(stealSide_io_taskOut_16_TVALID),
    .io_taskOut_16_TDATA(stealSide_io_taskOut_16_TDATA),
    .io_taskOut_17_TREADY(stealSide_io_taskOut_17_TREADY),
    .io_taskOut_17_TVALID(stealSide_io_taskOut_17_TVALID),
    .io_taskOut_17_TDATA(stealSide_io_taskOut_17_TDATA),
    .io_taskOut_18_TREADY(stealSide_io_taskOut_18_TREADY),
    .io_taskOut_18_TVALID(stealSide_io_taskOut_18_TVALID),
    .io_taskOut_18_TDATA(stealSide_io_taskOut_18_TDATA),
    .io_taskOut_19_TREADY(stealSide_io_taskOut_19_TREADY),
    .io_taskOut_19_TVALID(stealSide_io_taskOut_19_TVALID),
    .io_taskOut_19_TDATA(stealSide_io_taskOut_19_TDATA),
    .io_taskOut_20_TREADY(stealSide_io_taskOut_20_TREADY),
    .io_taskOut_20_TVALID(stealSide_io_taskOut_20_TVALID),
    .io_taskOut_20_TDATA(stealSide_io_taskOut_20_TDATA),
    .io_taskOut_21_TREADY(stealSide_io_taskOut_21_TREADY),
    .io_taskOut_21_TVALID(stealSide_io_taskOut_21_TVALID),
    .io_taskOut_21_TDATA(stealSide_io_taskOut_21_TDATA),
    .io_taskOut_22_TREADY(stealSide_io_taskOut_22_TREADY),
    .io_taskOut_22_TVALID(stealSide_io_taskOut_22_TVALID),
    .io_taskOut_22_TDATA(stealSide_io_taskOut_22_TDATA),
    .io_taskOut_23_TREADY(stealSide_io_taskOut_23_TREADY),
    .io_taskOut_23_TVALID(stealSide_io_taskOut_23_TVALID),
    .io_taskOut_23_TDATA(stealSide_io_taskOut_23_TDATA),
    .io_taskIn_0_TREADY(stealSide_io_taskIn_0_TREADY),
    .io_taskIn_0_TVALID(stealSide_io_taskIn_0_TVALID),
    .io_taskIn_0_TDATA(stealSide_io_taskIn_0_TDATA),
    .io_taskIn_1_TREADY(stealSide_io_taskIn_1_TREADY),
    .io_taskIn_1_TVALID(stealSide_io_taskIn_1_TVALID),
    .io_taskIn_1_TDATA(stealSide_io_taskIn_1_TDATA),
    .io_taskIn_2_TREADY(stealSide_io_taskIn_2_TREADY),
    .io_taskIn_2_TVALID(stealSide_io_taskIn_2_TVALID),
    .io_taskIn_2_TDATA(stealSide_io_taskIn_2_TDATA),
    .io_taskIn_3_TREADY(stealSide_io_taskIn_3_TREADY),
    .io_taskIn_3_TVALID(stealSide_io_taskIn_3_TVALID),
    .io_taskIn_3_TDATA(stealSide_io_taskIn_3_TDATA),
    .io_taskIn_4_TREADY(stealSide_io_taskIn_4_TREADY),
    .io_taskIn_4_TVALID(stealSide_io_taskIn_4_TVALID),
    .io_taskIn_4_TDATA(stealSide_io_taskIn_4_TDATA),
    .io_taskIn_5_TREADY(stealSide_io_taskIn_5_TREADY),
    .io_taskIn_5_TVALID(stealSide_io_taskIn_5_TVALID),
    .io_taskIn_5_TDATA(stealSide_io_taskIn_5_TDATA),
    .io_taskIn_6_TREADY(stealSide_io_taskIn_6_TREADY),
    .io_taskIn_6_TVALID(stealSide_io_taskIn_6_TVALID),
    .io_taskIn_6_TDATA(stealSide_io_taskIn_6_TDATA),
    .io_taskIn_7_TREADY(stealSide_io_taskIn_7_TREADY),
    .io_taskIn_7_TVALID(stealSide_io_taskIn_7_TVALID),
    .io_taskIn_7_TDATA(stealSide_io_taskIn_7_TDATA),
    .io_taskIn_8_TREADY(stealSide_io_taskIn_8_TREADY),
    .io_taskIn_8_TVALID(stealSide_io_taskIn_8_TVALID),
    .io_taskIn_8_TDATA(stealSide_io_taskIn_8_TDATA),
    .io_taskIn_9_TREADY(stealSide_io_taskIn_9_TREADY),
    .io_taskIn_9_TVALID(stealSide_io_taskIn_9_TVALID),
    .io_taskIn_9_TDATA(stealSide_io_taskIn_9_TDATA),
    .io_taskIn_10_TREADY(stealSide_io_taskIn_10_TREADY),
    .io_taskIn_10_TVALID(stealSide_io_taskIn_10_TVALID),
    .io_taskIn_10_TDATA(stealSide_io_taskIn_10_TDATA),
    .io_taskIn_11_TREADY(stealSide_io_taskIn_11_TREADY),
    .io_taskIn_11_TVALID(stealSide_io_taskIn_11_TVALID),
    .io_taskIn_11_TDATA(stealSide_io_taskIn_11_TDATA),
    .io_taskIn_12_TREADY(stealSide_io_taskIn_12_TREADY),
    .io_taskIn_12_TVALID(stealSide_io_taskIn_12_TVALID),
    .io_taskIn_12_TDATA(stealSide_io_taskIn_12_TDATA),
    .io_taskIn_13_TREADY(stealSide_io_taskIn_13_TREADY),
    .io_taskIn_13_TVALID(stealSide_io_taskIn_13_TVALID),
    .io_taskIn_13_TDATA(stealSide_io_taskIn_13_TDATA),
    .io_taskIn_14_TREADY(stealSide_io_taskIn_14_TREADY),
    .io_taskIn_14_TVALID(stealSide_io_taskIn_14_TVALID),
    .io_taskIn_14_TDATA(stealSide_io_taskIn_14_TDATA),
    .io_taskIn_15_TREADY(stealSide_io_taskIn_15_TREADY),
    .io_taskIn_15_TVALID(stealSide_io_taskIn_15_TVALID),
    .io_taskIn_15_TDATA(stealSide_io_taskIn_15_TDATA),
    .io_taskIn_16_TREADY(stealSide_io_taskIn_16_TREADY),
    .io_taskIn_16_TVALID(stealSide_io_taskIn_16_TVALID),
    .io_taskIn_16_TDATA(stealSide_io_taskIn_16_TDATA),
    .io_taskIn_17_TREADY(stealSide_io_taskIn_17_TREADY),
    .io_taskIn_17_TVALID(stealSide_io_taskIn_17_TVALID),
    .io_taskIn_17_TDATA(stealSide_io_taskIn_17_TDATA),
    .io_taskIn_18_TREADY(stealSide_io_taskIn_18_TREADY),
    .io_taskIn_18_TVALID(stealSide_io_taskIn_18_TVALID),
    .io_taskIn_18_TDATA(stealSide_io_taskIn_18_TDATA),
    .io_taskIn_19_TREADY(stealSide_io_taskIn_19_TREADY),
    .io_taskIn_19_TVALID(stealSide_io_taskIn_19_TVALID),
    .io_taskIn_19_TDATA(stealSide_io_taskIn_19_TDATA),
    .io_taskIn_20_TREADY(stealSide_io_taskIn_20_TREADY),
    .io_taskIn_20_TVALID(stealSide_io_taskIn_20_TVALID),
    .io_taskIn_20_TDATA(stealSide_io_taskIn_20_TDATA),
    .io_taskIn_21_TREADY(stealSide_io_taskIn_21_TREADY),
    .io_taskIn_21_TVALID(stealSide_io_taskIn_21_TVALID),
    .io_taskIn_21_TDATA(stealSide_io_taskIn_21_TDATA),
    .io_taskIn_22_TREADY(stealSide_io_taskIn_22_TREADY),
    .io_taskIn_22_TVALID(stealSide_io_taskIn_22_TVALID),
    .io_taskIn_22_TDATA(stealSide_io_taskIn_22_TDATA),
    .io_taskIn_23_TREADY(stealSide_io_taskIn_23_TREADY),
    .io_taskIn_23_TVALID(stealSide_io_taskIn_23_TVALID),
    .io_taskIn_23_TDATA(stealSide_io_taskIn_23_TDATA)
  );
  assign task_stealSide_axi_mgmt_vss_0_ARREADY = stealSide_io_axi_mgmt_vss_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_0_RVALID = stealSide_io_axi_mgmt_vss_0_RVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_0_RDATA = stealSide_io_axi_mgmt_vss_0_RDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_0_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_0_AWREADY = stealSide_io_axi_mgmt_vss_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_0_WREADY = stealSide_io_axi_mgmt_vss_0_WREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_0_BVALID = stealSide_io_axi_mgmt_vss_0_BVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_0_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_ARREADY = stealSide_io_axi_mgmt_vss_1_ARREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_RVALID = stealSide_io_axi_mgmt_vss_1_RVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_RDATA = stealSide_io_axi_mgmt_vss_1_RDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_AWREADY = stealSide_io_axi_mgmt_vss_1_AWREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_WREADY = stealSide_io_axi_mgmt_vss_1_WREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_BVALID = stealSide_io_axi_mgmt_vss_1_BVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_1_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_ARREADY = stealSide_io_axi_mgmt_vss_2_ARREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_RVALID = stealSide_io_axi_mgmt_vss_2_RVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_RDATA = stealSide_io_axi_mgmt_vss_2_RDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_AWREADY = stealSide_io_axi_mgmt_vss_2_AWREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_WREADY = stealSide_io_axi_mgmt_vss_2_WREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_BVALID = stealSide_io_axi_mgmt_vss_2_BVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_2_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_ARREADY = stealSide_io_axi_mgmt_vss_3_ARREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_RVALID = stealSide_io_axi_mgmt_vss_3_RVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_RDATA = stealSide_io_axi_mgmt_vss_3_RDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_AWREADY = stealSide_io_axi_mgmt_vss_3_AWREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_WREADY = stealSide_io_axi_mgmt_vss_3_WREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_BVALID = stealSide_io_axi_mgmt_vss_3_BVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_3_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_ARREADY = stealSide_io_axi_mgmt_vss_4_ARREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_RVALID = stealSide_io_axi_mgmt_vss_4_RVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_RDATA = stealSide_io_axi_mgmt_vss_4_RDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_AWREADY = stealSide_io_axi_mgmt_vss_4_AWREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_WREADY = stealSide_io_axi_mgmt_vss_4_WREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_BVALID = stealSide_io_axi_mgmt_vss_4_BVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_axi_mgmt_vss_4_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARVALID = stealSide_io_vss_axi_full_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARADDR = stealSide_io_vss_axi_full_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_RREADY = stealSide_io_vss_axi_full_0_RREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWVALID = stealSide_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWADDR = stealSide_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_WVALID = stealSide_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_WDATA = stealSide_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_WSTRB = 4'hf; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_WLAST = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_0_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARVALID = stealSide_io_vss_axi_full_1_ARVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARADDR = stealSide_io_vss_axi_full_1_ARADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_RREADY = stealSide_io_vss_axi_full_1_RREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWVALID = stealSide_io_vss_axi_full_1_AWVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWADDR = stealSide_io_vss_axi_full_1_AWADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_WVALID = stealSide_io_vss_axi_full_1_WVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_WDATA = stealSide_io_vss_axi_full_1_WDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_WSTRB = 4'hf; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_WLAST = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_1_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARVALID = stealSide_io_vss_axi_full_2_ARVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARADDR = stealSide_io_vss_axi_full_2_ARADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_RREADY = stealSide_io_vss_axi_full_2_RREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWVALID = stealSide_io_vss_axi_full_2_AWVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWADDR = stealSide_io_vss_axi_full_2_AWADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_WVALID = stealSide_io_vss_axi_full_2_WVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_WDATA = stealSide_io_vss_axi_full_2_WDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_WSTRB = 4'hf; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_WLAST = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_2_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARVALID = stealSide_io_vss_axi_full_3_ARVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARADDR = stealSide_io_vss_axi_full_3_ARADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_RREADY = stealSide_io_vss_axi_full_3_RREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWVALID = stealSide_io_vss_axi_full_3_AWVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWADDR = stealSide_io_vss_axi_full_3_AWADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_WVALID = stealSide_io_vss_axi_full_3_WVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_WDATA = stealSide_io_vss_axi_full_3_WDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_WSTRB = 4'hf; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_WLAST = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_3_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARVALID = stealSide_io_vss_axi_full_4_ARVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARADDR = stealSide_io_vss_axi_full_4_ARADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_RREADY = stealSide_io_vss_axi_full_4_RREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWVALID = stealSide_io_vss_axi_full_4_AWVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWADDR = stealSide_io_vss_axi_full_4_AWADDR; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWLEN = 8'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWSIZE = 3'h2; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_WVALID = stealSide_io_vss_axi_full_4_WVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_WDATA = stealSide_io_vss_axi_full_4_WDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_WSTRB = 4'hf; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_WLAST = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_vss_axi_full_4_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_0_TVALID = stealSide_io_taskOut_0_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_0_TDATA = stealSide_io_taskOut_0_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_1_TVALID = stealSide_io_taskOut_1_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_1_TDATA = stealSide_io_taskOut_1_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_2_TVALID = stealSide_io_taskOut_2_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_2_TDATA = stealSide_io_taskOut_2_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_3_TVALID = stealSide_io_taskOut_3_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_3_TDATA = stealSide_io_taskOut_3_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_4_TVALID = stealSide_io_taskOut_4_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_4_TDATA = stealSide_io_taskOut_4_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_5_TVALID = stealSide_io_taskOut_5_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_5_TDATA = stealSide_io_taskOut_5_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_6_TVALID = stealSide_io_taskOut_6_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_6_TDATA = stealSide_io_taskOut_6_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_7_TVALID = stealSide_io_taskOut_7_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_7_TDATA = stealSide_io_taskOut_7_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_8_TVALID = stealSide_io_taskOut_8_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_8_TDATA = stealSide_io_taskOut_8_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_9_TVALID = stealSide_io_taskOut_9_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_9_TDATA = stealSide_io_taskOut_9_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_10_TVALID = stealSide_io_taskOut_10_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_10_TDATA = stealSide_io_taskOut_10_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_11_TVALID = stealSide_io_taskOut_11_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_11_TDATA = stealSide_io_taskOut_11_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_12_TVALID = stealSide_io_taskOut_12_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_12_TDATA = stealSide_io_taskOut_12_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_13_TVALID = stealSide_io_taskOut_13_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_13_TDATA = stealSide_io_taskOut_13_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_14_TVALID = stealSide_io_taskOut_14_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_14_TDATA = stealSide_io_taskOut_14_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_15_TVALID = stealSide_io_taskOut_15_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_15_TDATA = stealSide_io_taskOut_15_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_16_TVALID = stealSide_io_taskOut_16_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_16_TDATA = stealSide_io_taskOut_16_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_17_TVALID = stealSide_io_taskOut_17_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_17_TDATA = stealSide_io_taskOut_17_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_18_TVALID = stealSide_io_taskOut_18_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_18_TDATA = stealSide_io_taskOut_18_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_19_TVALID = stealSide_io_taskOut_19_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_19_TDATA = stealSide_io_taskOut_19_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_20_TVALID = stealSide_io_taskOut_20_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_20_TDATA = stealSide_io_taskOut_20_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_21_TVALID = stealSide_io_taskOut_21_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_21_TDATA = stealSide_io_taskOut_21_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_22_TVALID = stealSide_io_taskOut_22_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_22_TDATA = stealSide_io_taskOut_22_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_23_TVALID = stealSide_io_taskOut_23_TVALID; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskOut_23_TDATA = stealSide_io_taskOut_23_TDATA; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_0_TREADY = stealSide_io_taskIn_0_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_1_TREADY = stealSide_io_taskIn_1_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_2_TREADY = stealSide_io_taskIn_2_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_3_TREADY = stealSide_io_taskIn_3_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_4_TREADY = stealSide_io_taskIn_4_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_5_TREADY = stealSide_io_taskIn_5_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_6_TREADY = stealSide_io_taskIn_6_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_7_TREADY = stealSide_io_taskIn_7_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_8_TREADY = stealSide_io_taskIn_8_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_9_TREADY = stealSide_io_taskIn_9_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_10_TREADY = stealSide_io_taskIn_10_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_11_TREADY = stealSide_io_taskIn_11_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_12_TREADY = stealSide_io_taskIn_12_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_13_TREADY = stealSide_io_taskIn_13_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_14_TREADY = stealSide_io_taskIn_14_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_15_TREADY = stealSide_io_taskIn_15_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_16_TREADY = stealSide_io_taskIn_16_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_17_TREADY = stealSide_io_taskIn_17_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_18_TREADY = stealSide_io_taskIn_18_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_19_TREADY = stealSide_io_taskIn_19_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_20_TREADY = stealSide_io_taskIn_20_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_21_TREADY = stealSide_io_taskIn_21_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_22_TREADY = stealSide_io_taskIn_22_TREADY; // @[fullSysGen.scala 246:23]
  assign task_stealSide_taskIn_23_TREADY = stealSide_io_taskIn_23_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_clock = clock;
  assign stealSide_reset = reset;
  assign stealSide_io_axi_mgmt_vss_0_ARVALID = task_stealSide_axi_mgmt_vss_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_ARADDR = task_stealSide_axi_mgmt_vss_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_RREADY = task_stealSide_axi_mgmt_vss_0_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_AWVALID = task_stealSide_axi_mgmt_vss_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_AWADDR = task_stealSide_axi_mgmt_vss_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WVALID = task_stealSide_axi_mgmt_vss_0_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WDATA = task_stealSide_axi_mgmt_vss_0_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WSTRB = task_stealSide_axi_mgmt_vss_0_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_BREADY = task_stealSide_axi_mgmt_vss_0_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_ARVALID = task_stealSide_axi_mgmt_vss_1_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_ARADDR = task_stealSide_axi_mgmt_vss_1_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_RREADY = task_stealSide_axi_mgmt_vss_1_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_AWVALID = task_stealSide_axi_mgmt_vss_1_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_AWADDR = task_stealSide_axi_mgmt_vss_1_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_WVALID = task_stealSide_axi_mgmt_vss_1_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_WDATA = task_stealSide_axi_mgmt_vss_1_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_WSTRB = task_stealSide_axi_mgmt_vss_1_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_1_BREADY = task_stealSide_axi_mgmt_vss_1_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_ARVALID = task_stealSide_axi_mgmt_vss_2_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_ARADDR = task_stealSide_axi_mgmt_vss_2_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_RREADY = task_stealSide_axi_mgmt_vss_2_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_AWVALID = task_stealSide_axi_mgmt_vss_2_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_AWADDR = task_stealSide_axi_mgmt_vss_2_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_WVALID = task_stealSide_axi_mgmt_vss_2_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_WDATA = task_stealSide_axi_mgmt_vss_2_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_WSTRB = task_stealSide_axi_mgmt_vss_2_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_2_BREADY = task_stealSide_axi_mgmt_vss_2_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_ARVALID = task_stealSide_axi_mgmt_vss_3_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_ARADDR = task_stealSide_axi_mgmt_vss_3_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_RREADY = task_stealSide_axi_mgmt_vss_3_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_AWVALID = task_stealSide_axi_mgmt_vss_3_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_AWADDR = task_stealSide_axi_mgmt_vss_3_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_WVALID = task_stealSide_axi_mgmt_vss_3_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_WDATA = task_stealSide_axi_mgmt_vss_3_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_WSTRB = task_stealSide_axi_mgmt_vss_3_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_3_BREADY = task_stealSide_axi_mgmt_vss_3_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_ARVALID = task_stealSide_axi_mgmt_vss_4_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_ARADDR = task_stealSide_axi_mgmt_vss_4_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_RREADY = task_stealSide_axi_mgmt_vss_4_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_AWVALID = task_stealSide_axi_mgmt_vss_4_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_AWADDR = task_stealSide_axi_mgmt_vss_4_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_WVALID = task_stealSide_axi_mgmt_vss_4_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_WDATA = task_stealSide_axi_mgmt_vss_4_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_WSTRB = task_stealSide_axi_mgmt_vss_4_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_4_BREADY = task_stealSide_axi_mgmt_vss_4_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_ARREADY = task_stealSide_vss_axi_full_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_RVALID = task_stealSide_vss_axi_full_0_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_RDATA = task_stealSide_vss_axi_full_0_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_AWREADY = task_stealSide_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_WREADY = task_stealSide_vss_axi_full_0_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_BVALID = task_stealSide_vss_axi_full_0_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_1_ARREADY = task_stealSide_vss_axi_full_1_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_1_RVALID = task_stealSide_vss_axi_full_1_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_1_RDATA = task_stealSide_vss_axi_full_1_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_1_AWREADY = task_stealSide_vss_axi_full_1_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_1_WREADY = task_stealSide_vss_axi_full_1_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_1_BVALID = task_stealSide_vss_axi_full_1_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_2_ARREADY = task_stealSide_vss_axi_full_2_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_2_RVALID = task_stealSide_vss_axi_full_2_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_2_RDATA = task_stealSide_vss_axi_full_2_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_2_AWREADY = task_stealSide_vss_axi_full_2_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_2_WREADY = task_stealSide_vss_axi_full_2_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_2_BVALID = task_stealSide_vss_axi_full_2_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_3_ARREADY = task_stealSide_vss_axi_full_3_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_3_RVALID = task_stealSide_vss_axi_full_3_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_3_RDATA = task_stealSide_vss_axi_full_3_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_3_AWREADY = task_stealSide_vss_axi_full_3_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_3_WREADY = task_stealSide_vss_axi_full_3_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_3_BVALID = task_stealSide_vss_axi_full_3_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_4_ARREADY = task_stealSide_vss_axi_full_4_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_4_RVALID = task_stealSide_vss_axi_full_4_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_4_RDATA = task_stealSide_vss_axi_full_4_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_4_AWREADY = task_stealSide_vss_axi_full_4_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_4_WREADY = task_stealSide_vss_axi_full_4_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_4_BVALID = task_stealSide_vss_axi_full_4_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_0_TREADY = task_stealSide_taskOut_0_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_1_TREADY = task_stealSide_taskOut_1_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_2_TREADY = task_stealSide_taskOut_2_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_3_TREADY = task_stealSide_taskOut_3_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_4_TREADY = task_stealSide_taskOut_4_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_5_TREADY = task_stealSide_taskOut_5_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_6_TREADY = task_stealSide_taskOut_6_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_7_TREADY = task_stealSide_taskOut_7_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_8_TREADY = task_stealSide_taskOut_8_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_9_TREADY = task_stealSide_taskOut_9_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_10_TREADY = task_stealSide_taskOut_10_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_11_TREADY = task_stealSide_taskOut_11_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_12_TREADY = task_stealSide_taskOut_12_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_13_TREADY = task_stealSide_taskOut_13_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_14_TREADY = task_stealSide_taskOut_14_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_15_TREADY = task_stealSide_taskOut_15_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_16_TREADY = task_stealSide_taskOut_16_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_17_TREADY = task_stealSide_taskOut_17_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_18_TREADY = task_stealSide_taskOut_18_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_19_TREADY = task_stealSide_taskOut_19_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_20_TREADY = task_stealSide_taskOut_20_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_21_TREADY = task_stealSide_taskOut_21_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_22_TREADY = task_stealSide_taskOut_22_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_23_TREADY = task_stealSide_taskOut_23_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_0_TVALID = task_stealSide_taskIn_0_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_0_TDATA = task_stealSide_taskIn_0_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_1_TVALID = task_stealSide_taskIn_1_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_1_TDATA = task_stealSide_taskIn_1_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_2_TVALID = task_stealSide_taskIn_2_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_2_TDATA = task_stealSide_taskIn_2_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_3_TVALID = task_stealSide_taskIn_3_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_3_TDATA = task_stealSide_taskIn_3_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_4_TVALID = task_stealSide_taskIn_4_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_4_TDATA = task_stealSide_taskIn_4_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_5_TVALID = task_stealSide_taskIn_5_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_5_TDATA = task_stealSide_taskIn_5_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_6_TVALID = task_stealSide_taskIn_6_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_6_TDATA = task_stealSide_taskIn_6_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_7_TVALID = task_stealSide_taskIn_7_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_7_TDATA = task_stealSide_taskIn_7_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_8_TVALID = task_stealSide_taskIn_8_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_8_TDATA = task_stealSide_taskIn_8_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_9_TVALID = task_stealSide_taskIn_9_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_9_TDATA = task_stealSide_taskIn_9_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_10_TVALID = task_stealSide_taskIn_10_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_10_TDATA = task_stealSide_taskIn_10_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_11_TVALID = task_stealSide_taskIn_11_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_11_TDATA = task_stealSide_taskIn_11_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_12_TVALID = task_stealSide_taskIn_12_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_12_TDATA = task_stealSide_taskIn_12_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_13_TVALID = task_stealSide_taskIn_13_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_13_TDATA = task_stealSide_taskIn_13_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_14_TVALID = task_stealSide_taskIn_14_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_14_TDATA = task_stealSide_taskIn_14_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_15_TVALID = task_stealSide_taskIn_15_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_15_TDATA = task_stealSide_taskIn_15_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_16_TVALID = task_stealSide_taskIn_16_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_16_TDATA = task_stealSide_taskIn_16_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_17_TVALID = task_stealSide_taskIn_17_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_17_TDATA = task_stealSide_taskIn_17_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_18_TVALID = task_stealSide_taskIn_18_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_18_TDATA = task_stealSide_taskIn_18_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_19_TVALID = task_stealSide_taskIn_19_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_19_TDATA = task_stealSide_taskIn_19_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_20_TVALID = task_stealSide_taskIn_20_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_20_TDATA = task_stealSide_taskIn_20_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_21_TVALID = task_stealSide_taskIn_21_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_21_TDATA = task_stealSide_taskIn_21_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_22_TVALID = task_stealSide_taskIn_22_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_22_TDATA = task_stealSide_taskIn_22_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_23_TVALID = task_stealSide_taskIn_23_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_23_TDATA = task_stealSide_taskIn_23_TDATA; // @[fullSysGen.scala 246:23]
endmodule
