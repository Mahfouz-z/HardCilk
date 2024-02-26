module stealNetworkDataUnit(
  input         clock,
  input         reset,
  input  [63:0] io_taskIn,
  output [63:0] io_taskOut,
  input         io_validIn,
  output        io_validOut,
  input         io_connSS_availableTask_ready,
  output        io_connSS_availableTask_valid,
  output [63:0] io_connSS_availableTask_bits,
  output        io_connSS_qOutTask_ready,
  input         io_connSS_qOutTask_valid,
  input  [63:0] io_connSS_qOutTask_bits,
  output        io_occupied
);
`ifdef RANDOMIZE_REG_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] taskReg; // @[stealNetworkDataUnit.scala 32:33]
  reg  validReg; // @[stealNetworkDataUnit.scala 33:33]
  wire  _T_2 = io_connSS_qOutTask_valid & ~io_validIn; // @[stealNetworkDataUnit.scala 50:41]
  wire  _GEN_2 = io_connSS_qOutTask_valid & ~io_validIn | io_validIn; // @[stealNetworkDataUnit.scala 50:56 51:32]
  assign io_taskOut = taskReg; // @[stealNetworkDataUnit.scala 63:25]
  assign io_validOut = validReg; // @[stealNetworkDataUnit.scala 64:25]
  assign io_connSS_availableTask_valid = io_connSS_availableTask_ready & io_validIn; // @[stealNetworkDataUnit.scala 45:40]
  assign io_connSS_availableTask_bits = io_connSS_availableTask_ready & io_validIn ? io_taskIn : 64'h0; // @[stealNetworkDataUnit.scala 42:35 45:54 49:37]
  assign io_connSS_qOutTask_ready = io_connSS_availableTask_ready & io_validIn ? 1'h0 : _T_2; // @[stealNetworkDataUnit.scala 41:30 45:54]
  assign io_occupied = validReg; // @[stealNetworkDataUnit.scala 65:25]
  always @(posedge clock) begin
    if (reset) begin // @[stealNetworkDataUnit.scala 32:33]
      taskReg <= 64'h0; // @[stealNetworkDataUnit.scala 32:33]
    end else if (io_connSS_availableTask_ready & io_validIn) begin // @[stealNetworkDataUnit.scala 45:54]
      taskReg <= 64'h0; // @[stealNetworkDataUnit.scala 47:37]
    end else if (io_connSS_qOutTask_valid & ~io_validIn) begin // @[stealNetworkDataUnit.scala 50:56]
      taskReg <= io_connSS_qOutTask_bits; // @[stealNetworkDataUnit.scala 52:32]
    end else if (io_validIn) begin // @[stealNetworkDataUnit.scala 54:27]
      taskReg <= io_taskIn; // @[stealNetworkDataUnit.scala 56:19]
    end else begin
      taskReg <= 64'h0; // @[stealNetworkDataUnit.scala 59:22]
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
  _RAND_0 = {2{`RANDOM}};
  taskReg = _RAND_0[63:0];
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
  output [63:0] io_connSS_0_data_availableTask_bits,
  output        io_connSS_0_data_qOutTask_ready,
  input         io_connSS_0_data_qOutTask_valid,
  input  [63:0] io_connSS_0_data_qOutTask_bits,
  output        io_connSS_1_ctrl_serveStealReq_ready,
  input         io_connSS_1_ctrl_serveStealReq_valid,
  output        io_connSS_1_ctrl_stealReq_ready,
  input         io_connSS_1_ctrl_stealReq_valid,
  input         io_connSS_1_data_availableTask_ready,
  output        io_connSS_1_data_availableTask_valid,
  output [63:0] io_connSS_1_data_availableTask_bits,
  output        io_connSS_1_data_qOutTask_ready,
  input         io_connSS_1_data_qOutTask_valid,
  input  [63:0] io_connSS_1_data_qOutTask_bits,
  output        io_connSS_2_ctrl_serveStealReq_ready,
  input         io_connSS_2_ctrl_serveStealReq_valid,
  output        io_connSS_2_ctrl_stealReq_ready,
  input         io_connSS_2_ctrl_stealReq_valid,
  input         io_connSS_2_data_availableTask_ready,
  output        io_connSS_2_data_availableTask_valid,
  output [63:0] io_connSS_2_data_availableTask_bits,
  output        io_connSS_2_data_qOutTask_ready,
  input         io_connSS_2_data_qOutTask_valid,
  input  [63:0] io_connSS_2_data_qOutTask_bits,
  output        io_connSS_3_ctrl_serveStealReq_ready,
  input         io_connSS_3_ctrl_serveStealReq_valid,
  output        io_connSS_3_ctrl_stealReq_ready,
  input         io_connSS_3_ctrl_stealReq_valid,
  input         io_connSS_3_data_availableTask_ready,
  output        io_connSS_3_data_availableTask_valid,
  output [63:0] io_connSS_3_data_availableTask_bits,
  output        io_connSS_3_data_qOutTask_ready,
  input         io_connSS_3_data_qOutTask_valid,
  input  [63:0] io_connSS_3_data_qOutTask_bits,
  output        io_connSS_4_ctrl_serveStealReq_ready,
  input         io_connSS_4_ctrl_serveStealReq_valid,
  output        io_connSS_4_ctrl_stealReq_ready,
  input         io_connSS_4_ctrl_stealReq_valid,
  input         io_connSS_4_data_availableTask_ready,
  output        io_connSS_4_data_availableTask_valid,
  output [63:0] io_connSS_4_data_availableTask_bits,
  output        io_connSS_4_data_qOutTask_ready,
  input         io_connSS_4_data_qOutTask_valid,
  input  [63:0] io_connSS_4_data_qOutTask_bits,
  output        io_ntwDataUnitOccupancyVSS_0
);
  wire  dataUnits_0_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_reset; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_0_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_0_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_0_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_0_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_0_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_reset; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_1_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_1_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_1_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_1_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_1_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_reset; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_2_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_2_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_2_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_2_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_2_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_reset; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_3_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_3_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_3_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_3_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_3_io_occupied; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_clock; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_reset; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_4_io_taskIn; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_4_io_taskOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validIn; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_validOut; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_connSS_qOutTask_valid; // @[stealNetwork.scala 23:42]
  wire [63:0] dataUnits_4_io_connSS_qOutTask_bits; // @[stealNetwork.scala 23:42]
  wire  dataUnits_4_io_occupied; // @[stealNetwork.scala 23:42]
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
  assign io_connSS_4_ctrl_serveStealReq_ready = ctrlunits_4_io_connSS_serveStealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_4_ctrl_stealReq_ready = ctrlunits_4_io_connSS_stealReq_ready; // @[stealNetwork.scala 45:36]
  assign io_connSS_4_data_availableTask_valid = dataUnits_4_io_connSS_availableTask_valid; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_availableTask_bits = dataUnits_4_io_connSS_availableTask_bits; // @[stealNetwork.scala 31:32]
  assign io_connSS_4_data_qOutTask_ready = dataUnits_4_io_connSS_qOutTask_ready; // @[stealNetwork.scala 31:32]
  assign io_ntwDataUnitOccupancyVSS_0 = dataUnits_0_io_occupied; // @[stealNetwork.scala 49:54]
  assign dataUnits_0_clock = clock;
  assign dataUnits_0_reset = reset;
  assign dataUnits_0_io_taskIn = dataUnits_4_io_taskOut; // @[stealNetwork.scala 34:27]
  assign dataUnits_0_io_validIn = dataUnits_4_io_validOut; // @[stealNetwork.scala 35:27]
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
  assign ctrlunits_4_io_reqTaskIn = ctrlunits_0_io_reqTaskOut; // @[stealNetwork.scala 44:36]
  assign ctrlunits_4_io_connSS_serveStealReq_valid = io_connSS_4_ctrl_serveStealReq_valid; // @[stealNetwork.scala 45:36]
  assign ctrlunits_4_io_connSS_stealReq_valid = io_connSS_4_ctrl_stealReq_valid; // @[stealNetwork.scala 45:36]
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
  input  [63:0] io_connNetwork_data_availableTask_bits,
  input         io_connNetwork_data_qOutTask_ready,
  output        io_connNetwork_data_qOutTask_valid,
  output [63:0] io_connNetwork_data_qOutTask_bits,
  input  [5:0]  io_connQ_currLength,
  input         io_connQ_push_ready,
  output        io_connQ_push_valid,
  output [63:0] io_connQ_push_bits,
  output        io_connQ_pop_ready,
  input         io_connQ_pop_valid,
  input  [63:0] io_connQ_pop_bits
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [31:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [31:0] _RAND_6;
`endif // RANDOMIZE_REG_INIT
  reg [2:0] stateReg; // @[stealServer.scala 28:39]
  reg [63:0] stolenTaskReg; // @[stealServer.scala 29:39]
  reg [63:0] giveTaskReg; // @[stealServer.scala 30:39]
  reg [1:0] taskRequestCount; // @[stealServer.scala 33:39]
  reg [31:0] tasksGivenAwayCount; // @[stealServer.scala 35:38]
  reg [31:0] requestKilledCount; // @[stealServer.scala 37:37]
  reg [31:0] requestFullCount; // @[stealServer.scala 38:35]
  wire  _T_1 = io_connQ_currLength < 6'h6; // @[stealServer.scala 163:38]
  wire  _T_2 = io_connQ_currLength > 6'h16; // @[stealServer.scala 166:44]
  wire [2:0] _GEN_0 = io_connQ_currLength > 6'h6 ? 3'h6 : 3'h0; // @[stealServer.scala 168:64 169:51 171:51]
  wire [31:0] _GEN_2 = io_connQ_currLength < 6'h6 ? 32'h5 : requestFullCount; // @[stealServer.scala 163:58 164:51 38:35]
  wire  _T_4 = stateReg == 3'h1; // @[stealServer.scala 173:29]
  wire  _T_9 = io_connQ_currLength >= 6'h6; // @[stealServer.scala 182:44]
  wire  _T_10 = tasksGivenAwayCount > 32'h0; // @[stealServer.scala 184:44]
  wire [31:0] _tasksGivenAwayCount_T_1 = tasksGivenAwayCount - 32'h1; // @[stealServer.scala 187:60]
  wire [1:0] _GEN_4 = requestFullCount == 32'h0 ? 2'h2 : 2'h1; // @[stealServer.scala 189:49 190:54 192:54]
  wire [1:0] _GEN_5 = tasksGivenAwayCount > 32'h0 ? 2'h2 : _GEN_4; // @[stealServer.scala 184:50 185:54]
  wire [31:0] _GEN_6 = tasksGivenAwayCount > 32'h0 ? 32'h5 : requestKilledCount; // @[stealServer.scala 184:50 186:54 37:37]
  wire [31:0] _GEN_7 = tasksGivenAwayCount > 32'h0 ? _tasksGivenAwayCount_T_1 : tasksGivenAwayCount; // @[stealServer.scala 184:50 187:37 35:38]
  wire [2:0] _GEN_9 = io_connQ_currLength >= 6'h6 ? 3'h6 : {{1'd0}, _GEN_5}; // @[stealServer.scala 182:65 183:54]
  wire [31:0] _GEN_10 = io_connQ_currLength >= 6'h6 ? requestKilledCount : _GEN_6; // @[stealServer.scala 182:65 37:37]
  wire [31:0] _GEN_11 = io_connQ_currLength >= 6'h6 ? tasksGivenAwayCount : _GEN_7; // @[stealServer.scala 182:65 35:38]
  wire  _GEN_12 = io_connQ_currLength >= 6'h6 ? 1'h0 : _T_10; // @[stealServer.scala 182:65 50:47]
  wire [1:0] _GEN_13 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 2'h1 : taskRequestCount; // @[stealServer.scala 178:87 179:54 33:39]
  wire [2:0] _GEN_15 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 3'h1 : _GEN_9; // @[stealServer.scala 178:87 181:54]
  wire [31:0] _GEN_16 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? requestKilledCount : _GEN_10; // @[stealServer.scala 178:87 37:37]
  wire [31:0] _GEN_17 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? tasksGivenAwayCount : _GEN_11; // @[stealServer.scala 178:87 35:38]
  wire  _GEN_18 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h2 ? 1'h0 : _GEN_12; // @[stealServer.scala 178:87 50:47]
  wire  _GEN_24 = io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1 ? 1'h0 : _GEN_18; // @[stealServer.scala 175:81 50:47]
  wire [31:0] _requestFullCount_T_1 = requestFullCount - 32'h1; // @[stealServer.scala 196:74]
  wire  _T_12 = stateReg == 3'h2; // @[stealServer.scala 200:29]
  wire [31:0] _GEN_26 = requestKilledCount == 32'h0 ? 32'h5 : requestFullCount; // @[stealServer.scala 207:51 208:54 38:35]
  wire [1:0] _GEN_27 = requestKilledCount == 32'h0 ? 2'h1 : 2'h2; // @[stealServer.scala 207:51 209:54 211:54]
  wire [1:0] _GEN_28 = _T_9 ? 2'h0 : _GEN_27; // @[stealServer.scala 205:65 206:51]
  wire [31:0] _GEN_29 = _T_9 ? requestFullCount : _GEN_26; // @[stealServer.scala 205:65 38:35]
  wire [1:0] _GEN_30 = io_connNetwork_data_availableTask_valid ? 2'h3 : _GEN_28; // @[stealServer.scala 202:58 203:54]
  wire [63:0] _GEN_31 = io_connNetwork_data_availableTask_valid ? io_connNetwork_data_availableTask_bits : stolenTaskReg
    ; // @[stealServer.scala 202:58 204:54 29:39]
  wire [31:0] _GEN_32 = io_connNetwork_data_availableTask_valid ? requestFullCount : _GEN_29; // @[stealServer.scala 202:58 38:35]
  wire [31:0] _requestKilledCount_T_1 = requestKilledCount - 32'h1; // @[stealServer.scala 215:76]
  wire [31:0] _GEN_33 = ~io_connNetwork_ctrl_serveStealReq_ready ? _requestKilledCount_T_1 : 32'h5; // @[stealServer.scala 214:59 215:54 217:54]
  wire  _T_16 = stateReg == 3'h3; // @[stealServer.scala 222:29]
  wire [2:0] _GEN_34 = io_connQ_currLength >= 6'h16 ? 3'h5 : 3'h3; // @[stealServer.scala 225:65 226:54 229:54]
  wire [63:0] _GEN_35 = io_connQ_currLength >= 6'h16 ? stolenTaskReg : giveTaskReg; // @[stealServer.scala 225:65 227:54 30:39]
  wire [2:0] _GEN_36 = io_connQ_push_ready ? 3'h0 : _GEN_34; // @[stealServer.scala 223:38 224:54]
  wire [63:0] _GEN_37 = io_connQ_push_ready ? giveTaskReg : _GEN_35; // @[stealServer.scala 223:38 30:39]
  wire  _T_18 = stateReg == 3'h4; // @[stealServer.scala 235:29]
  wire [31:0] _GEN_38 = io_connQ_currLength == 6'h0 ? 32'h5 : requestFullCount; // @[stealServer.scala 239:52 240:54 38:35]
  wire [2:0] _GEN_39 = io_connQ_currLength == 6'h0 ? 3'h1 : 3'h4; // @[stealServer.scala 239:52 241:54 243:54]
  wire [2:0] _GEN_40 = io_connQ_pop_valid ? 3'h5 : _GEN_39; // @[stealServer.scala 236:37 237:54]
  wire [63:0] _GEN_41 = io_connQ_pop_valid ? io_connQ_pop_bits : giveTaskReg; // @[stealServer.scala 236:37 238:54 30:39]
  wire [31:0] _GEN_42 = io_connQ_pop_valid ? requestFullCount : _GEN_38; // @[stealServer.scala 236:37 38:35]
  wire  _T_20 = stateReg == 3'h5; // @[stealServer.scala 248:29]
  wire [31:0] _tasksGivenAwayCount_T_3 = tasksGivenAwayCount + 32'h1; // @[stealServer.scala 250:77]
  wire [31:0] _GEN_43 = io_connNetwork_data_qOutTask_ready ? _tasksGivenAwayCount_T_3 : tasksGivenAwayCount; // @[stealServer.scala 249:53 250:54 35:38]
  wire [2:0] _GEN_44 = io_connNetwork_data_qOutTask_ready ? 3'h0 : 3'h5; // @[stealServer.scala 249:53 251:54 253:54]
  wire  _T_21 = stateReg == 3'h6; // @[stealServer.scala 259:29]
  wire  _T_24 = io_connNetwork_ctrl_serveStealReq_ready & _T_9; // @[stealServer.scala 261:54]
  wire  _T_25 = _T_2 | _T_24; // @[stealServer.scala 260:57]
  wire [2:0] _GEN_46 = _T_1 ? 3'h1 : 3'h6; // @[stealServer.scala 267:64 269:51 272:54]
  wire [1:0] _GEN_47 = _T_1 ? 2'h1 : taskRequestCount; // @[stealServer.scala 267:64 270:51 33:39]
  wire [31:0] _GEN_48 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 32'h5 : _GEN_2; // @[stealServer.scala 263:107 264:51]
  wire [2:0] _GEN_49 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 3'h1 : _GEN_46; // @[stealServer.scala 263:107 265:51]
  wire [1:0] _GEN_50 = _T_1 & io_connNetwork_ctrl_serveStealReq_ready ? 2'h2 : _GEN_47; // @[stealServer.scala 263:107 266:51]
  wire [2:0] _GEN_51 = _T_25 ? 3'h4 : _GEN_49; // @[stealServer.scala 261:99 262:51]
  wire [31:0] _GEN_52 = _T_25 ? requestFullCount : _GEN_48; // @[stealServer.scala 261:99 38:35]
  wire [1:0] _GEN_53 = _T_25 ? taskRequestCount : _GEN_50; // @[stealServer.scala 261:99 33:39]
  wire [2:0] _GEN_54 = stateReg == 3'h6 ? _GEN_51 : stateReg; // @[stealServer.scala 259:58 28:39]
  wire [31:0] _GEN_55 = stateReg == 3'h6 ? _GEN_52 : requestFullCount; // @[stealServer.scala 259:58 38:35]
  wire [1:0] _GEN_56 = stateReg == 3'h6 ? _GEN_53 : taskRequestCount; // @[stealServer.scala 259:58 33:39]
  wire [31:0] _GEN_58 = stateReg == 3'h5 ? _GEN_43 : tasksGivenAwayCount; // @[stealServer.scala 248:52 35:38]
  wire [2:0] _GEN_59 = stateReg == 3'h5 ? _GEN_44 : _GEN_54; // @[stealServer.scala 248:52]
  wire [63:0] _GEN_61 = stateReg == 3'h5 ? giveTaskReg : 64'h0; // @[stealServer.scala 248:52 257:55 47:47]
  wire [31:0] _GEN_62 = stateReg == 3'h5 ? requestFullCount : _GEN_55; // @[stealServer.scala 248:52 38:35]
  wire [1:0] _GEN_63 = stateReg == 3'h5 ? taskRequestCount : _GEN_56; // @[stealServer.scala 248:52 33:39]
  wire  _GEN_64 = stateReg == 3'h5 ? 1'h0 : _T_21; // @[stealServer.scala 248:52 50:47]
  wire [2:0] _GEN_65 = stateReg == 3'h4 ? _GEN_40 : _GEN_59; // @[stealServer.scala 235:47]
  wire [63:0] _GEN_66 = stateReg == 3'h4 ? _GEN_41 : giveTaskReg; // @[stealServer.scala 235:47 30:39]
  wire [31:0] _GEN_67 = stateReg == 3'h4 ? _GEN_42 : _GEN_62; // @[stealServer.scala 235:47]
  wire [31:0] _GEN_69 = stateReg == 3'h4 ? tasksGivenAwayCount : _GEN_58; // @[stealServer.scala 235:47 35:38]
  wire  _GEN_70 = stateReg == 3'h4 ? 1'h0 : _T_20; // @[stealServer.scala 235:47 46:47]
  wire [63:0] _GEN_71 = stateReg == 3'h4 ? 64'h0 : _GEN_61; // @[stealServer.scala 235:47 47:47]
  wire [1:0] _GEN_72 = stateReg == 3'h4 ? taskRequestCount : _GEN_63; // @[stealServer.scala 235:47 33:39]
  wire  _GEN_73 = stateReg == 3'h4 ? 1'h0 : _GEN_64; // @[stealServer.scala 235:47 50:47]
  wire [2:0] _GEN_74 = stateReg == 3'h3 ? _GEN_36 : _GEN_65; // @[stealServer.scala 222:48]
  wire [63:0] _GEN_75 = stateReg == 3'h3 ? _GEN_37 : _GEN_66; // @[stealServer.scala 222:48]
  wire [63:0] _GEN_76 = stateReg == 3'h3 ? stolenTaskReg : 64'h0; // @[stealServer.scala 222:48 232:55 42:47]
  wire [31:0] _GEN_78 = stateReg == 3'h3 ? requestFullCount : _GEN_67; // @[stealServer.scala 222:48 38:35]
  wire  _GEN_79 = stateReg == 3'h3 ? 1'h0 : _T_18; // @[stealServer.scala 222:48 41:47]
  wire [31:0] _GEN_80 = stateReg == 3'h3 ? tasksGivenAwayCount : _GEN_69; // @[stealServer.scala 222:48 35:38]
  wire  _GEN_81 = stateReg == 3'h3 ? 1'h0 : _GEN_70; // @[stealServer.scala 222:48 46:47]
  wire [63:0] _GEN_82 = stateReg == 3'h3 ? 64'h0 : _GEN_71; // @[stealServer.scala 222:48 47:47]
  wire [1:0] _GEN_83 = stateReg == 3'h3 ? taskRequestCount : _GEN_72; // @[stealServer.scala 222:48 33:39]
  wire  _GEN_84 = stateReg == 3'h3 ? 1'h0 : _GEN_73; // @[stealServer.scala 222:48 50:47]
  wire [63:0] _GEN_91 = stateReg == 3'h2 ? 64'h0 : _GEN_76; // @[stealServer.scala 200:50 42:47]
  wire  _GEN_92 = stateReg == 3'h2 ? 1'h0 : _T_16; // @[stealServer.scala 200:50 43:47]
  wire  _GEN_93 = stateReg == 3'h2 ? 1'h0 : _GEN_79; // @[stealServer.scala 200:50 41:47]
  wire  _GEN_95 = stateReg == 3'h2 ? 1'h0 : _GEN_81; // @[stealServer.scala 200:50 46:47]
  wire [63:0] _GEN_96 = stateReg == 3'h2 ? 64'h0 : _GEN_82; // @[stealServer.scala 200:50 47:47]
  wire  _GEN_98 = stateReg == 3'h2 ? 1'h0 : _GEN_84; // @[stealServer.scala 200:50 50:47]
  wire  _GEN_105 = stateReg == 3'h1 ? _GEN_24 : _GEN_98; // @[stealServer.scala 173:51]
  wire  _GEN_107 = stateReg == 3'h1 ? 1'h0 : _T_12; // @[stealServer.scala 173:51 45:47]
  wire [63:0] _GEN_109 = stateReg == 3'h1 ? 64'h0 : _GEN_91; // @[stealServer.scala 173:51 42:47]
  wire  _GEN_110 = stateReg == 3'h1 ? 1'h0 : _GEN_92; // @[stealServer.scala 173:51 43:47]
  wire  _GEN_111 = stateReg == 3'h1 ? 1'h0 : _GEN_93; // @[stealServer.scala 173:51 41:47]
  wire  _GEN_112 = stateReg == 3'h1 ? 1'h0 : _GEN_95; // @[stealServer.scala 173:51 46:47]
  wire [63:0] _GEN_113 = stateReg == 3'h1 ? 64'h0 : _GEN_96; // @[stealServer.scala 173:51 47:47]
  assign io_connNetwork_ctrl_serveStealReq_valid = stateReg == 3'h0 ? 1'h0 : _GEN_105; // @[stealServer.scala 162:38 50:47]
  assign io_connNetwork_ctrl_stealReq_valid = stateReg == 3'h0 ? 1'h0 : _T_4; // @[stealServer.scala 162:38 49:47]
  assign io_connNetwork_data_availableTask_ready = stateReg == 3'h0 ? 1'h0 : _GEN_107; // @[stealServer.scala 162:38 45:47]
  assign io_connNetwork_data_qOutTask_valid = stateReg == 3'h0 ? 1'h0 : _GEN_112; // @[stealServer.scala 162:38 46:47]
  assign io_connNetwork_data_qOutTask_bits = stateReg == 3'h0 ? 64'h0 : _GEN_113; // @[stealServer.scala 162:38 47:47]
  assign io_connQ_push_valid = stateReg == 3'h0 ? 1'h0 : _GEN_110; // @[stealServer.scala 162:38 43:47]
  assign io_connQ_push_bits = stateReg == 3'h0 ? 64'h0 : _GEN_109; // @[stealServer.scala 162:38 42:47]
  assign io_connQ_pop_ready = stateReg == 3'h0 ? 1'h0 : _GEN_111; // @[stealServer.scala 162:38 41:47]
  always @(posedge clock) begin
    if (reset) begin // @[stealServer.scala 28:39]
      stateReg <= 3'h0; // @[stealServer.scala 28:39]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 162:38]
      if (io_connQ_currLength < 6'h6) begin // @[stealServer.scala 163:58]
        stateReg <= 3'h1; // @[stealServer.scala 165:51]
      end else if (io_connQ_currLength > 6'h16) begin // @[stealServer.scala 166:64]
        stateReg <= 3'h4; // @[stealServer.scala 167:51]
      end else begin
        stateReg <= _GEN_0;
      end
    end else if (stateReg == 3'h1) begin // @[stealServer.scala 173:51]
      if (io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1) begin // @[stealServer.scala 175:81]
        stateReg <= 3'h2; // @[stealServer.scala 176:54]
      end else begin
        stateReg <= _GEN_15;
      end
    end else if (stateReg == 3'h2) begin // @[stealServer.scala 200:50]
      stateReg <= {{1'd0}, _GEN_30};
    end else begin
      stateReg <= _GEN_74;
    end
    if (reset) begin // @[stealServer.scala 29:39]
      stolenTaskReg <= 64'h0; // @[stealServer.scala 29:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 162:38]
      if (!(stateReg == 3'h1)) begin // @[stealServer.scala 173:51]
        if (stateReg == 3'h2) begin // @[stealServer.scala 200:50]
          stolenTaskReg <= _GEN_31;
        end
      end
    end
    if (reset) begin // @[stealServer.scala 30:39]
      giveTaskReg <= 64'h0; // @[stealServer.scala 30:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 162:38]
      if (!(stateReg == 3'h1)) begin // @[stealServer.scala 173:51]
        if (!(stateReg == 3'h2)) begin // @[stealServer.scala 200:50]
          giveTaskReg <= _GEN_75;
        end
      end
    end
    if (reset) begin // @[stealServer.scala 33:39]
      taskRequestCount <= 2'h1; // @[stealServer.scala 33:39]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 162:38]
      if (stateReg == 3'h1) begin // @[stealServer.scala 173:51]
        if (!(io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1)) begin // @[stealServer.scala 175:81]
          taskRequestCount <= _GEN_13;
        end
      end else if (!(stateReg == 3'h2)) begin // @[stealServer.scala 200:50]
        taskRequestCount <= _GEN_83;
      end
    end
    if (reset) begin // @[stealServer.scala 35:38]
      tasksGivenAwayCount <= 32'h0; // @[stealServer.scala 35:38]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 162:38]
      if (stateReg == 3'h1) begin // @[stealServer.scala 173:51]
        if (!(io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1)) begin // @[stealServer.scala 175:81]
          tasksGivenAwayCount <= _GEN_17;
        end
      end else if (!(stateReg == 3'h2)) begin // @[stealServer.scala 200:50]
        tasksGivenAwayCount <= _GEN_80;
      end
    end
    if (reset) begin // @[stealServer.scala 37:37]
      requestKilledCount <= 32'h5; // @[stealServer.scala 37:37]
    end else if (!(stateReg == 3'h0)) begin // @[stealServer.scala 162:38]
      if (stateReg == 3'h1) begin // @[stealServer.scala 173:51]
        if (io_connNetwork_ctrl_stealReq_ready & taskRequestCount == 2'h1) begin // @[stealServer.scala 175:81]
          requestKilledCount <= 32'h5; // @[stealServer.scala 177:54]
        end else begin
          requestKilledCount <= _GEN_16;
        end
      end else if (stateReg == 3'h2) begin // @[stealServer.scala 200:50]
        requestKilledCount <= _GEN_33;
      end
    end
    if (reset) begin // @[stealServer.scala 38:35]
      requestFullCount <= 32'h5; // @[stealServer.scala 38:35]
    end else if (stateReg == 3'h0) begin // @[stealServer.scala 162:38]
      if (io_connQ_currLength < 6'h6) begin // @[stealServer.scala 163:58]
        requestFullCount <= 32'h5; // @[stealServer.scala 164:51]
      end
    end else if (stateReg == 3'h1) begin // @[stealServer.scala 173:51]
      if (io_connNetwork_ctrl_serveStealReq_ready) begin // @[stealServer.scala 195:58]
        requestFullCount <= _requestFullCount_T_1; // @[stealServer.scala 196:54]
      end else begin
        requestFullCount <= 32'h5; // @[stealServer.scala 198:54]
      end
    end else if (stateReg == 3'h2) begin // @[stealServer.scala 200:50]
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
  _RAND_1 = {2{`RANDOM}};
  stolenTaskReg = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  giveTaskReg = _RAND_2[63:0];
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
  input  [63:0] io_connVec_0_push_bits,
  input         io_connVec_0_pop_ready,
  output        io_connVec_0_pop_valid,
  output [63:0] io_connVec_0_pop_bits,
  output [6:0]  io_connVec_1_currLength,
  output        io_connVec_1_push_ready,
  input         io_connVec_1_push_valid,
  input  [63:0] io_connVec_1_push_bits,
  input         io_connVec_1_pop_ready,
  output        io_connVec_1_pop_valid,
  output [63:0] io_connVec_1_pop_bits
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
  wire [6:0] bramMem_a_addr; // @[deque.scala 34:30]
  wire [63:0] bramMem_a_din; // @[deque.scala 34:30]
  wire  bramMem_a_wr; // @[deque.scala 34:30]
  wire [63:0] bramMem_a_dout; // @[deque.scala 34:30]
  wire [6:0] bramMem_b_addr; // @[deque.scala 34:30]
  wire [63:0] bramMem_b_din; // @[deque.scala 34:30]
  wire  bramMem_b_wr; // @[deque.scala 34:30]
  wire [63:0] bramMem_b_dout; // @[deque.scala 34:30]
  reg [6:0] sideReg_0; // @[deque.scala 23:35]
  reg [6:0] sideReg_1; // @[deque.scala 23:81]
  reg  readLatency_0; // @[deque.scala 29:43]
  reg  readLatency_1; // @[deque.scala 29:43]
  reg [1:0] writeLatency_0; // @[deque.scala 30:43]
  reg [1:0] writeLatency_1; // @[deque.scala 30:43]
  reg [2:0] stateRegs_0; // @[deque.scala 54:40]
  reg [2:0] stateRegs_1; // @[deque.scala 54:40]
  wire [6:0] _currLen_T_1 = 7'h22 + sideReg_1; // @[deque.scala 177:31]
  wire [6:0] _currLen_T_3 = _currLen_T_1 - sideReg_0; // @[deque.scala 177:44]
  wire [6:0] _currLen_T_5 = _currLen_T_3 - 7'h1; // @[deque.scala 177:58]
  wire [6:0] _currLen_T_7 = sideReg_1 - sideReg_0; // @[deque.scala 179:31]
  wire [6:0] _currLen_T_9 = _currLen_T_7 - 7'h1; // @[deque.scala 179:44]
  wire [6:0] currLen = sideReg_0 > sideReg_1 ? _currLen_T_5 : _currLen_T_9; // @[deque.scala 176:34 177:17 179:17]
  wire  _T_1 = currLen > 7'h1; // @[deque.scala 74:58]
  wire  _T_3 = stateRegs_1 == 3'h0; // @[deque.scala 74:109]
  wire  _T_5 = currLen > 7'h0; // @[deque.scala 74:135]
  wire  _T_9 = io_connVec_0_push_valid & currLen < 7'h22; // @[deque.scala 76:53]
  wire [1:0] _GEN_1 = io_connVec_0_pop_ready & currLen > 7'h1 | io_connVec_0_pop_ready & stateRegs_1 == 3'h0 & currLen
     > 7'h0 ? 2'h2 : {{1'd0}, _T_9}; // @[deque.scala 74:142 75:34]
  wire  _T_10 = stateRegs_0 == 3'h1; // @[deque.scala 93:33]
  wire [1:0] _writeLatency_0_T_1 = writeLatency_0 - 2'h1; // @[deque.scala 99:52]
  wire [1:0] _GEN_3 = writeLatency_0 == 2'h0 ? 2'h3 : 2'h1; // @[deque.scala 100:33 95:42 97:33]
  wire  _GEN_4 = ~readLatency_0 ? 1'h0 : readLatency_0 - 1'h1; // @[deque.scala 108:41 109:33 112:33]
  wire [2:0] _GEN_5 = ~readLatency_0 ? 3'h4 : 3'h2; // @[deque.scala 108:41 110:33 113:33]
  wire [6:0] _T_15 = 7'h22 - 7'h1; // @[deque.scala 118:48]
  wire [6:0] _bramMem_io_a_addr_T_1 = sideReg_0 + 7'h1; // @[deque.scala 121:54]
  wire [6:0] _GEN_6 = sideReg_0 == _T_15 ? 7'h0 : _bramMem_io_a_addr_T_1; // @[deque.scala 118:54 119:39 121:39]
  wire  _T_17 = stateRegs_0 == 3'h4; // @[deque.scala 130:33]
  wire  _T_21 = stateRegs_0 == 3'h3; // @[deque.scala 154:33]
  wire [6:0] _sideReg_0_T_5 = sideReg_0 - 7'h1; // @[deque.scala 163:46]
  wire [6:0] _GEN_9 = sideReg_0 == 7'h0 ? _T_15 : _sideReg_0_T_5; // @[deque.scala 160:41 161:32 163:32]
  wire [2:0] _GEN_10 = stateRegs_0 == 3'h3 ? 3'h0 : stateRegs_0; // @[deque.scala 154:48 156:38 54:40]
  wire [6:0] _GEN_11 = stateRegs_0 == 3'h3 ? _GEN_9 : sideReg_0; // @[deque.scala 154:48 23:35]
  wire [2:0] _GEN_13 = stateRegs_0 == 3'h4 ? 3'h0 : _GEN_10; // @[deque.scala 130:47 132:38]
  wire [6:0] _GEN_14 = stateRegs_0 == 3'h4 ? _GEN_6 : _GEN_11; // @[deque.scala 130:47]
  wire [27:0] _GEN_15 = stateRegs_0 == 3'h4 ? {{21'd0}, _GEN_6} : 28'hfffffff; // @[deque.scala 130:47 59:34]
  wire [63:0] _GEN_17 = stateRegs_0 == 3'h4 ? bramMem_a_dout : 64'h0; // @[deque.scala 130:47 153:38 67:34]
  wire  _GEN_18 = stateRegs_0 == 3'h4 ? 1'h0 : _T_21; // @[deque.scala 130:47 65:34]
  wire [27:0] _GEN_21 = stateRegs_0 == 3'h2 ? {{21'd0}, _GEN_6} : _GEN_15; // @[deque.scala 106:51]
  wire  _GEN_23 = stateRegs_0 == 3'h2 ? 1'h0 : _T_17; // @[deque.scala 106:51 66:34]
  wire [63:0] _GEN_24 = stateRegs_0 == 3'h2 ? 64'h0 : _GEN_17; // @[deque.scala 106:51 67:34]
  wire  _GEN_25 = stateRegs_0 == 3'h2 ? 1'h0 : _GEN_18; // @[deque.scala 106:51 65:34]
  wire [27:0] _GEN_28 = stateRegs_0 == 3'h1 ? {{21'd0}, sideReg_0} : _GEN_21; // @[deque.scala 103:38 93:52]
  wire  _GEN_32 = stateRegs_0 == 3'h1 ? 1'h0 : _GEN_23; // @[deque.scala 66:34 93:52]
  wire [63:0] _GEN_33 = stateRegs_0 == 3'h1 ? 64'h0 : _GEN_24; // @[deque.scala 67:34 93:52]
  wire  _GEN_34 = stateRegs_0 == 3'h1 ? 1'h0 : _GEN_25; // @[deque.scala 65:34 93:52]
  wire [27:0] _GEN_37 = stateRegs_0 == 3'h0 ? 28'hfffffff : _GEN_28; // @[deque.scala 59:34 71:42]
  wire [1:0] _GEN_44 = io_connVec_1_pop_ready & _T_1 | io_connVec_1_pop_ready & ~io_connVec_0_pop_ready & _T_5 &
    stateRegs_0 != 3'h4 ? 2'h2 : 2'h0; // @[deque.scala 84:175 88:34 90:34]
  wire [1:0] _GEN_45 = io_connVec_1_push_valid & currLen < _T_15 ? 2'h1 : _GEN_44; // @[deque.scala 82:79 83:34]
  wire  _T_37 = stateRegs_1 == 3'h1; // @[deque.scala 93:33]
  wire [1:0] _writeLatency_1_T_1 = writeLatency_1 - 2'h1; // @[deque.scala 99:52]
  wire [1:0] _GEN_47 = writeLatency_1 == 2'h0 ? 2'h3 : 2'h1; // @[deque.scala 100:33 95:42 97:33]
  wire  _GEN_48 = ~readLatency_1 ? 1'h0 : readLatency_1 - 1'h1; // @[deque.scala 108:41 109:33 112:33]
  wire [2:0] _GEN_49 = ~readLatency_1 ? 3'h4 : 3'h2; // @[deque.scala 108:41 110:33 113:33]
  wire [6:0] _bramMem_io_b_addr_T_3 = sideReg_1 - 7'h1; // @[deque.scala 127:54]
  wire [6:0] _GEN_50 = sideReg_1 == 7'h0 ? _T_15 : _bramMem_io_b_addr_T_3; // @[deque.scala 124:41 125:39 127:39]
  wire  _T_42 = stateRegs_1 == 3'h4; // @[deque.scala 130:33]
  wire  _T_44 = stateRegs_1 == 3'h3; // @[deque.scala 154:33]
  wire [6:0] _sideReg_1_T_5 = sideReg_1 + 7'h1; // @[deque.scala 169:46]
  wire [6:0] _GEN_53 = sideReg_1 == _T_15 ? 7'h0 : _sideReg_1_T_5; // @[deque.scala 166:56 167:32 169:32]
  wire [2:0] _GEN_54 = stateRegs_1 == 3'h3 ? 3'h0 : stateRegs_1; // @[deque.scala 154:48 156:38 54:40]
  wire [6:0] _GEN_55 = stateRegs_1 == 3'h3 ? _GEN_53 : sideReg_1; // @[deque.scala 154:48 23:81]
  wire [2:0] _GEN_57 = stateRegs_1 == 3'h4 ? 3'h0 : _GEN_54; // @[deque.scala 130:47 132:38]
  wire [6:0] _GEN_58 = stateRegs_1 == 3'h4 ? _GEN_50 : _GEN_55; // @[deque.scala 130:47]
  wire [27:0] _GEN_59 = stateRegs_1 == 3'h4 ? {{21'd0}, _GEN_50} : 28'hfffffff; // @[deque.scala 130:47 59:34]
  wire [63:0] _GEN_61 = stateRegs_1 == 3'h4 ? bramMem_b_dout : 64'h0; // @[deque.scala 130:47 153:38 67:34]
  wire  _GEN_62 = stateRegs_1 == 3'h4 ? 1'h0 : _T_44; // @[deque.scala 130:47 65:34]
  wire [27:0] _GEN_65 = stateRegs_1 == 3'h2 ? {{21'd0}, _GEN_50} : _GEN_59; // @[deque.scala 106:51]
  wire  _GEN_67 = stateRegs_1 == 3'h2 ? 1'h0 : _T_42; // @[deque.scala 106:51 66:34]
  wire [63:0] _GEN_68 = stateRegs_1 == 3'h2 ? 64'h0 : _GEN_61; // @[deque.scala 106:51 67:34]
  wire  _GEN_69 = stateRegs_1 == 3'h2 ? 1'h0 : _GEN_62; // @[deque.scala 106:51 65:34]
  wire [27:0] _GEN_72 = stateRegs_1 == 3'h1 ? {{21'd0}, sideReg_1} : _GEN_65; // @[deque.scala 103:38 93:52]
  wire  _GEN_76 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_67; // @[deque.scala 66:34 93:52]
  wire [63:0] _GEN_77 = stateRegs_1 == 3'h1 ? 64'h0 : _GEN_68; // @[deque.scala 67:34 93:52]
  wire  _GEN_78 = stateRegs_1 == 3'h1 ? 1'h0 : _GEN_69; // @[deque.scala 65:34 93:52]
  wire [27:0] _GEN_81 = _T_3 ? 28'hfffffff : _GEN_72; // @[deque.scala 59:34 71:42]
  DualPortBRAM #(.DATA(64), .ADDR(7)) bramMem ( // @[deque.scala 34:30]
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
  assign io_connVec_0_pop_bits = stateRegs_0 == 3'h0 ? 64'h0 : _GEN_33; // @[deque.scala 67:34 71:42]
  assign io_connVec_1_currLength = sideReg_0 > sideReg_1 ? _currLen_T_5 : _currLen_T_9; // @[deque.scala 176:34 177:17 179:17]
  assign io_connVec_1_push_ready = _T_3 ? 1'h0 : _GEN_78; // @[deque.scala 65:34 71:42]
  assign io_connVec_1_pop_valid = _T_3 ? 1'h0 : _GEN_76; // @[deque.scala 66:34 71:42]
  assign io_connVec_1_pop_bits = _T_3 ? 64'h0 : _GEN_77; // @[deque.scala 67:34 71:42]
  assign bramMem_clk = clock; // @[deque.scala 36:22]
  assign bramMem_rst = reset; // @[deque.scala 37:22]
  assign bramMem_a_addr = _GEN_37[6:0];
  assign bramMem_a_din = io_connVec_0_push_bits; // @[deque.scala 60:34]
  assign bramMem_a_wr = stateRegs_0 == 3'h0 ? 1'h0 : _T_10; // @[deque.scala 61:34 71:42]
  assign bramMem_b_addr = _GEN_81[6:0];
  assign bramMem_b_din = io_connVec_1_push_bits; // @[deque.scala 60:34]
  assign bramMem_b_wr = _T_3 ? 1'h0 : _T_37; // @[deque.scala 61:34 71:42]
  always @(posedge clock) begin
    if (reset) begin // @[deque.scala 23:35]
      sideReg_0 <= 7'h0; // @[deque.scala 23:35]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (!(stateRegs_0 == 3'h1)) begin // @[deque.scala 93:52]
        if (!(stateRegs_0 == 3'h2)) begin // @[deque.scala 106:51]
          sideReg_0 <= _GEN_14;
        end
      end
    end
    if (reset) begin // @[deque.scala 23:81]
      sideReg_1 <= 7'h1; // @[deque.scala 23:81]
    end else if (!(_T_3)) begin // @[deque.scala 71:42]
      if (!(stateRegs_1 == 3'h1)) begin // @[deque.scala 93:52]
        if (!(stateRegs_1 == 3'h2)) begin // @[deque.scala 106:51]
          sideReg_1 <= _GEN_58;
        end
      end
    end
    if (reset) begin // @[deque.scala 29:43]
      readLatency_0 <= 1'h0; // @[deque.scala 29:43]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (!(stateRegs_0 == 3'h1)) begin // @[deque.scala 93:52]
        if (stateRegs_0 == 3'h2) begin // @[deque.scala 106:51]
          readLatency_0 <= _GEN_4;
        end
      end
    end
    if (reset) begin // @[deque.scala 29:43]
      readLatency_1 <= 1'h0; // @[deque.scala 29:43]
    end else if (!(_T_3)) begin // @[deque.scala 71:42]
      if (!(stateRegs_1 == 3'h1)) begin // @[deque.scala 93:52]
        if (stateRegs_1 == 3'h2) begin // @[deque.scala 106:51]
          readLatency_1 <= _GEN_48;
        end
      end
    end
    if (reset) begin // @[deque.scala 30:43]
      writeLatency_0 <= 2'h1; // @[deque.scala 30:43]
    end else if (!(stateRegs_0 == 3'h0)) begin // @[deque.scala 71:42]
      if (stateRegs_0 == 3'h1) begin // @[deque.scala 93:52]
        if (writeLatency_0 == 2'h0) begin // @[deque.scala 95:42]
          writeLatency_0 <= 2'h1; // @[deque.scala 96:33]
        end else begin
          writeLatency_0 <= _writeLatency_0_T_1; // @[deque.scala 99:33]
        end
      end
    end
    if (reset) begin // @[deque.scala 30:43]
      writeLatency_1 <= 2'h1; // @[deque.scala 30:43]
    end else if (!(_T_3)) begin // @[deque.scala 71:42]
      if (stateRegs_1 == 3'h1) begin // @[deque.scala 93:52]
        if (writeLatency_1 == 2'h0) begin // @[deque.scala 95:42]
          writeLatency_1 <= 2'h1; // @[deque.scala 96:33]
        end else begin
          writeLatency_1 <= _writeLatency_1_T_1; // @[deque.scala 99:33]
        end
      end
    end
    if (reset) begin // @[deque.scala 54:40]
      stateRegs_0 <= 3'h0; // @[deque.scala 54:40]
    end else if (stateRegs_0 == 3'h0) begin // @[deque.scala 71:42]
      stateRegs_0 <= {{1'd0}, _GEN_1};
    end else if (stateRegs_0 == 3'h1) begin // @[deque.scala 93:52]
      stateRegs_0 <= {{1'd0}, _GEN_3};
    end else if (stateRegs_0 == 3'h2) begin // @[deque.scala 106:51]
      stateRegs_0 <= _GEN_5;
    end else begin
      stateRegs_0 <= _GEN_13;
    end
    if (reset) begin // @[deque.scala 54:40]
      stateRegs_1 <= 3'h0; // @[deque.scala 54:40]
    end else if (_T_3) begin // @[deque.scala 71:42]
      stateRegs_1 <= {{1'd0}, _GEN_45};
    end else if (stateRegs_1 == 3'h1) begin // @[deque.scala 93:52]
      stateRegs_1 <= {{1'd0}, _GEN_47};
    end else if (stateRegs_1 == 3'h2) begin // @[deque.scala 106:51]
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
  input  [63:0] io_connPE_0_push_bits,
  input         io_connPE_0_pop_ready,
  output        io_connPE_0_pop_valid,
  output [63:0] io_connPE_0_pop_bits,
  output        io_connPE_1_push_ready,
  input         io_connPE_1_push_valid,
  input  [63:0] io_connPE_1_push_bits,
  input         io_connPE_1_pop_ready,
  output        io_connPE_1_pop_valid,
  output [63:0] io_connPE_1_pop_bits,
  output        io_connPE_2_push_ready,
  input         io_connPE_2_push_valid,
  input  [63:0] io_connPE_2_push_bits,
  input         io_connPE_2_pop_ready,
  output        io_connPE_2_pop_valid,
  output [63:0] io_connPE_2_pop_bits,
  output        io_connPE_3_push_ready,
  input         io_connPE_3_push_valid,
  input  [63:0] io_connPE_3_push_bits,
  input         io_connPE_3_pop_ready,
  output        io_connPE_3_pop_valid,
  output [63:0] io_connPE_3_pop_bits,
  output        io_connVSS_0_ctrl_serveStealReq_ready,
  input         io_connVSS_0_ctrl_serveStealReq_valid,
  input         io_connVSS_0_data_availableTask_ready,
  output        io_connVSS_0_data_availableTask_valid,
  output [63:0] io_connVSS_0_data_availableTask_bits,
  output        io_connVSS_0_data_qOutTask_ready,
  input         io_connVSS_0_data_qOutTask_valid,
  input  [63:0] io_connVSS_0_data_qOutTask_bits,
  output        io_ntwDataUnitOccupancyVSS_0
);
  wire  stealNet_clock; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_reset; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_ctrl_stealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_ctrl_stealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_data_availableTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_data_availableTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_1_data_availableTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_1_data_qOutTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_1_data_qOutTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_ctrl_stealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_ctrl_stealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_data_availableTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_2_data_qOutTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_2_data_qOutTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_ctrl_stealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_ctrl_stealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_data_availableTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_data_availableTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_3_data_availableTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_3_data_qOutTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_3_data_qOutTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_ctrl_stealReq_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_ctrl_stealReq_valid; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_data_availableTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_connSS_4_data_qOutTask_valid; // @[stealNW_TQ.scala 36:30]
  wire [63:0] stealNet_io_connSS_4_data_qOutTask_bits; // @[stealNW_TQ.scala 36:30]
  wire  stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 36:30]
  wire  stealServers_0_clock; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_reset; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_0_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 54:49]
  wire [5:0] stealServers_0_io_connQ_currLength; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connQ_push_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connQ_push_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_0_io_connQ_push_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connQ_pop_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_0_io_connQ_pop_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_0_io_connQ_pop_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_clock; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_reset; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_1_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 54:49]
  wire [5:0] stealServers_1_io_connQ_currLength; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connQ_push_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connQ_push_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_1_io_connQ_push_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connQ_pop_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_1_io_connQ_pop_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_1_io_connQ_pop_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_clock; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_reset; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_2_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 54:49]
  wire [5:0] stealServers_2_io_connQ_currLength; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connQ_push_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connQ_push_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_2_io_connQ_push_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connQ_pop_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_2_io_connQ_pop_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_2_io_connQ_pop_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_clock; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_reset; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_data_availableTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_3_io_connNetwork_data_availableTask_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 54:49]
  wire [5:0] stealServers_3_io_connQ_currLength; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connQ_push_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connQ_push_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_3_io_connQ_push_bits; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connQ_pop_ready; // @[stealNW_TQ.scala 54:49]
  wire  stealServers_3_io_connQ_pop_valid; // @[stealNW_TQ.scala 54:49]
  wire [63:0] stealServers_3_io_connQ_pop_bits; // @[stealNW_TQ.scala 54:49]
  wire  taskQueues_0_clock; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_reset; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_0_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_0_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_0_io_connVec_0_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_0_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 58:49]
  wire [6:0] taskQueues_0_io_connVec_1_currLength; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_1_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_0_io_connVec_1_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_clock; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_reset; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_0_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_0_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_1_io_connVec_0_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_1_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 58:49]
  wire [6:0] taskQueues_1_io_connVec_1_currLength; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_1_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_1_io_connVec_1_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_clock; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_reset; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_0_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_0_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_2_io_connVec_0_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_2_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 58:49]
  wire [6:0] taskQueues_2_io_connVec_1_currLength; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_1_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_2_io_connVec_1_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_clock; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_reset; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_0_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_0_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_3_io_connVec_0_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_0_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_3_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 58:49]
  wire [6:0] taskQueues_3_io_connVec_1_currLength; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_1_push_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_3_io_connVec_1_push_bits; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_1_pop_ready; // @[stealNW_TQ.scala 58:49]
  wire  taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 58:49]
  wire [63:0] taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 58:49]
  stealNetwork stealNet ( // @[stealNW_TQ.scala 36:30]
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
    .io_ntwDataUnitOccupancyVSS_0(stealNet_io_ntwDataUnitOccupancyVSS_0)
  );
  stealServer stealServers_0 ( // @[stealNW_TQ.scala 54:49]
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
  stealServer stealServers_1 ( // @[stealNW_TQ.scala 54:49]
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
  stealServer stealServers_2 ( // @[stealNW_TQ.scala 54:49]
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
  stealServer stealServers_3 ( // @[stealNW_TQ.scala 54:49]
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
  hw_deque taskQueues_0 ( // @[stealNW_TQ.scala 58:49]
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
  hw_deque taskQueues_1 ( // @[stealNW_TQ.scala 58:49]
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
  hw_deque taskQueues_2 ( // @[stealNW_TQ.scala 58:49]
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
  hw_deque taskQueues_3 ( // @[stealNW_TQ.scala 58:49]
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
  assign io_connPE_0_push_ready = taskQueues_0_io_connVec_0_push_ready; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_0_pop_valid = taskQueues_0_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_0_pop_bits = taskQueues_0_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_1_push_ready = taskQueues_1_io_connVec_0_push_ready; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_1_pop_valid = taskQueues_1_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_1_pop_bits = taskQueues_1_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_2_push_ready = taskQueues_2_io_connVec_0_push_ready; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_2_pop_valid = taskQueues_2_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_2_pop_bits = taskQueues_2_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_3_push_ready = taskQueues_3_io_connVec_0_push_ready; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_3_pop_valid = taskQueues_3_io_connVec_0_pop_valid; // @[stealNW_TQ.scala 62:37]
  assign io_connPE_3_pop_bits = taskQueues_3_io_connVec_0_pop_bits; // @[stealNW_TQ.scala 62:37]
  assign io_connVSS_0_ctrl_serveStealReq_ready = stealNet_io_connSS_0_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 123:39]
  assign io_connVSS_0_data_availableTask_valid = stealNet_io_connSS_0_data_availableTask_valid; // @[stealNW_TQ.scala 123:39]
  assign io_connVSS_0_data_availableTask_bits = stealNet_io_connSS_0_data_availableTask_bits; // @[stealNW_TQ.scala 123:39]
  assign io_connVSS_0_data_qOutTask_ready = stealNet_io_connSS_0_data_qOutTask_ready; // @[stealNW_TQ.scala 123:39]
  assign io_ntwDataUnitOccupancyVSS_0 = stealNet_io_ntwDataUnitOccupancyVSS_0; // @[stealNW_TQ.scala 145:48]
  assign stealNet_clock = clock;
  assign stealNet_reset = reset;
  assign stealNet_io_connSS_0_ctrl_serveStealReq_valid = io_connVSS_0_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 123:39]
  assign stealNet_io_connSS_0_data_availableTask_ready = io_connVSS_0_data_availableTask_ready; // @[stealNW_TQ.scala 123:39]
  assign stealNet_io_connSS_0_data_qOutTask_valid = io_connVSS_0_data_qOutTask_valid; // @[stealNW_TQ.scala 123:39]
  assign stealNet_io_connSS_0_data_qOutTask_bits = io_connVSS_0_data_qOutTask_bits; // @[stealNW_TQ.scala 123:39]
  assign stealNet_io_connSS_1_ctrl_serveStealReq_valid = stealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_1_ctrl_stealReq_valid = stealServers_0_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_1_data_availableTask_ready = stealServers_0_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_1_data_qOutTask_valid = stealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_1_data_qOutTask_bits = stealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_2_ctrl_serveStealReq_valid = stealServers_1_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_2_ctrl_stealReq_valid = stealServers_1_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_2_data_availableTask_ready = stealServers_1_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_2_data_qOutTask_valid = stealServers_1_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_2_data_qOutTask_bits = stealServers_1_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_3_ctrl_serveStealReq_valid = stealServers_2_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_3_ctrl_stealReq_valid = stealServers_2_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_3_data_availableTask_ready = stealServers_2_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_3_data_qOutTask_valid = stealServers_2_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_3_data_qOutTask_bits = stealServers_2_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_4_ctrl_serveStealReq_valid = stealServers_3_io_connNetwork_ctrl_serveStealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_4_ctrl_stealReq_valid = stealServers_3_io_connNetwork_ctrl_stealReq_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_4_data_availableTask_ready = stealServers_3_io_connNetwork_data_availableTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_4_data_qOutTask_valid = stealServers_3_io_connNetwork_data_qOutTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealNet_io_connSS_4_data_qOutTask_bits = stealServers_3_io_connNetwork_data_qOutTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealServers_0_clock = clock;
  assign stealServers_0_reset = reset;
  assign stealServers_0_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_1_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_0_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_1_ctrl_stealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_0_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_1_data_availableTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealServers_0_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_1_data_availableTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealServers_0_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_1_data_qOutTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_0_io_connQ_currLength = taskQueues_0_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 69:37]
  assign stealServers_0_io_connQ_push_ready = taskQueues_0_io_connVec_1_push_ready; // @[stealNW_TQ.scala 69:37]
  assign stealServers_0_io_connQ_pop_valid = taskQueues_0_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 69:37]
  assign stealServers_0_io_connQ_pop_bits = taskQueues_0_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 69:37]
  assign stealServers_1_clock = clock;
  assign stealServers_1_reset = reset;
  assign stealServers_1_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_2_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_1_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_2_ctrl_stealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_1_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_2_data_availableTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealServers_1_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_2_data_availableTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealServers_1_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_2_data_qOutTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_1_io_connQ_currLength = taskQueues_1_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 69:37]
  assign stealServers_1_io_connQ_push_ready = taskQueues_1_io_connVec_1_push_ready; // @[stealNW_TQ.scala 69:37]
  assign stealServers_1_io_connQ_pop_valid = taskQueues_1_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 69:37]
  assign stealServers_1_io_connQ_pop_bits = taskQueues_1_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 69:37]
  assign stealServers_2_clock = clock;
  assign stealServers_2_reset = reset;
  assign stealServers_2_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_3_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_2_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_3_ctrl_stealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_2_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_3_data_availableTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealServers_2_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_3_data_availableTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealServers_2_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_3_data_qOutTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_2_io_connQ_currLength = taskQueues_2_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 69:37]
  assign stealServers_2_io_connQ_push_ready = taskQueues_2_io_connVec_1_push_ready; // @[stealNW_TQ.scala 69:37]
  assign stealServers_2_io_connQ_pop_valid = taskQueues_2_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 69:37]
  assign stealServers_2_io_connQ_pop_bits = taskQueues_2_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 69:37]
  assign stealServers_3_clock = clock;
  assign stealServers_3_reset = reset;
  assign stealServers_3_io_connNetwork_ctrl_serveStealReq_ready = stealNet_io_connSS_4_ctrl_serveStealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_3_io_connNetwork_ctrl_stealReq_ready = stealNet_io_connSS_4_ctrl_stealReq_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_3_io_connNetwork_data_availableTask_valid = stealNet_io_connSS_4_data_availableTask_valid; // @[stealNW_TQ.scala 133:39]
  assign stealServers_3_io_connNetwork_data_availableTask_bits = stealNet_io_connSS_4_data_availableTask_bits; // @[stealNW_TQ.scala 133:39]
  assign stealServers_3_io_connNetwork_data_qOutTask_ready = stealNet_io_connSS_4_data_qOutTask_ready; // @[stealNW_TQ.scala 133:39]
  assign stealServers_3_io_connQ_currLength = taskQueues_3_io_connVec_1_currLength[5:0]; // @[stealNW_TQ.scala 69:37]
  assign stealServers_3_io_connQ_push_ready = taskQueues_3_io_connVec_1_push_ready; // @[stealNW_TQ.scala 69:37]
  assign stealServers_3_io_connQ_pop_valid = taskQueues_3_io_connVec_1_pop_valid; // @[stealNW_TQ.scala 69:37]
  assign stealServers_3_io_connQ_pop_bits = taskQueues_3_io_connVec_1_pop_bits; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_0_clock = clock;
  assign taskQueues_0_reset = reset;
  assign taskQueues_0_io_connVec_0_push_valid = io_connPE_0_push_valid; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_0_io_connVec_0_push_bits = io_connPE_0_push_bits; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_0_io_connVec_0_pop_ready = io_connPE_0_pop_ready; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_0_io_connVec_1_push_valid = stealServers_0_io_connQ_push_valid; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_0_io_connVec_1_push_bits = stealServers_0_io_connQ_push_bits; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_0_io_connVec_1_pop_ready = stealServers_0_io_connQ_pop_ready; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_1_clock = clock;
  assign taskQueues_1_reset = reset;
  assign taskQueues_1_io_connVec_0_push_valid = io_connPE_1_push_valid; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_1_io_connVec_0_push_bits = io_connPE_1_push_bits; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_1_io_connVec_0_pop_ready = io_connPE_1_pop_ready; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_1_io_connVec_1_push_valid = stealServers_1_io_connQ_push_valid; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_1_io_connVec_1_push_bits = stealServers_1_io_connQ_push_bits; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_1_io_connVec_1_pop_ready = stealServers_1_io_connQ_pop_ready; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_2_clock = clock;
  assign taskQueues_2_reset = reset;
  assign taskQueues_2_io_connVec_0_push_valid = io_connPE_2_push_valid; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_2_io_connVec_0_push_bits = io_connPE_2_push_bits; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_2_io_connVec_0_pop_ready = io_connPE_2_pop_ready; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_2_io_connVec_1_push_valid = stealServers_2_io_connQ_push_valid; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_2_io_connVec_1_push_bits = stealServers_2_io_connQ_push_bits; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_2_io_connVec_1_pop_ready = stealServers_2_io_connQ_pop_ready; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_3_clock = clock;
  assign taskQueues_3_reset = reset;
  assign taskQueues_3_io_connVec_0_push_valid = io_connPE_3_push_valid; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_3_io_connVec_0_push_bits = io_connPE_3_push_bits; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_3_io_connVec_0_pop_ready = io_connPE_3_pop_ready; // @[stealNW_TQ.scala 62:37]
  assign taskQueues_3_io_connVec_1_push_valid = stealServers_3_io_connQ_push_valid; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_3_io_connVec_1_push_bits = stealServers_3_io_connQ_push_bits; // @[stealNW_TQ.scala 69:37]
  assign taskQueues_3_io_connVec_1_pop_ready = stealServers_3_io_connQ_pop_ready; // @[stealNW_TQ.scala 69:37]
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
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits,
  output [4:0]  io_count
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
module virtualStealServer(
  input         clock,
  input         reset,
  input         io_connNetwork_ctrl_serveStealReq_ready,
  output        io_connNetwork_ctrl_serveStealReq_valid,
  output        io_connNetwork_data_availableTask_ready,
  input         io_connNetwork_data_availableTask_valid,
  input  [63:0] io_connNetwork_data_availableTask_bits,
  input         io_connNetwork_data_qOutTask_ready,
  output        io_connNetwork_data_qOutTask_valid,
  output [63:0] io_connNetwork_data_qOutTask_bits,
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
  input  [63:0] io_read_data_bits,
  output [3:0]  io_read_burst_len,
  input         io_write_address_ready,
  output        io_write_address_valid,
  output [63:0] io_write_address_bits,
  input         io_write_data_ready,
  output        io_write_data_valid,
  output [63:0] io_write_data_bits,
  output [3:0]  io_write_burst_len,
  output        io_write_last,
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
  wire  taskQueueBuffer_clock; // @[virtualStealServer.scala 81:43]
  wire  taskQueueBuffer_reset; // @[virtualStealServer.scala 81:43]
  wire  taskQueueBuffer_io_enq_ready; // @[virtualStealServer.scala 81:43]
  wire  taskQueueBuffer_io_enq_valid; // @[virtualStealServer.scala 81:43]
  wire [63:0] taskQueueBuffer_io_enq_bits; // @[virtualStealServer.scala 81:43]
  wire  taskQueueBuffer_io_deq_ready; // @[virtualStealServer.scala 81:43]
  wire  taskQueueBuffer_io_deq_valid; // @[virtualStealServer.scala 81:43]
  wire [63:0] taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 81:43]
  wire [4:0] taskQueueBuffer_io_count; // @[virtualStealServer.scala 81:43]
  wire  rdReq__valid = rdReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  rdReq = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  wire [5:0] rdReq__bits_addr = rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] rdAddr = rdReq__bits_addr & 6'h38; // @[RegisterBlock.scala 214:48]
  wire  wrReq__valid = wrReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReqData__valid = wrReqData__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  wrReq = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  wire [5:0] wrReq__bits_addr = wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [5:0] wrAddr = wrReq__bits_addr & 6'h38; // @[RegisterBlock.scala 243:48]
  reg [63:0] rAddr; // @[virtualStealServer.scala 65:44]
  reg [63:0] rPause; // @[virtualStealServer.scala 66:44]
  reg [63:0] procInterrupt; // @[virtualStealServer.scala 67:44]
  reg [63:0] maxLength; // @[virtualStealServer.scala 68:44]
  reg [3:0] stateReg; // @[virtualStealServer.scala 69:44]
  reg [63:0] contentionCounter; // @[virtualStealServer.scala 71:44]
  reg  networkCongested; // @[virtualStealServer.scala 73:44]
  reg [63:0] fifoTailReg; // @[virtualStealServer.scala 77:44]
  reg [63:0] fifoHeadReg; // @[virtualStealServer.scala 78:44]
  reg  popOrPush; // @[virtualStealServer.scala 79:44]
  reg [4:0] memDataCounter; // @[virtualStealServer.scala 82:44]
  wire  _T_1 = ~io_connNetwork_ctrl_serveStealReq_ready & io_ntwDataUnitOccupancy; // @[virtualStealServer.scala 106:56]
  wire [63:0] _contentionCounter_T_1 = contentionCounter + 64'h1; // @[virtualStealServer.scala 109:52]
  wire  _T_4 = contentionCounter != 64'h0; // @[virtualStealServer.scala 111:39]
  wire  _T_5 = io_connNetwork_ctrl_serveStealReq_ready & _T_4; // @[virtualStealServer.scala 110:60]
  wire [63:0] _contentionCounter_T_3 = contentionCounter - 64'h1; // @[virtualStealServer.scala 113:52]
  wire [63:0] _T_12 = 64'h3 - 64'h0; // @[virtualStealServer.scala 122:54]
  wire  _GEN_2 = contentionCounter < _T_12 ? 1'h0 : networkCongested; // @[virtualStealServer.scala 122:63 123:26 125:26]
  wire  _GEN_3 = contentionCounter >= 64'h3 | _GEN_2; // @[virtualStealServer.scala 120:58 121:26]
  wire [63:0] _currLen_T_1 = fifoTailReg - fifoHeadReg; // @[virtualStealServer.scala 359:32]
  wire [63:0] _currLen_T_3 = maxLength - fifoHeadReg; // @[virtualStealServer.scala 364:30]
  wire [63:0] _currLen_T_5 = _currLen_T_3 + fifoTailReg; // @[virtualStealServer.scala 364:44]
  reg [63:0] lengthHistroy; // @[virtualStealServer.scala 355:32]
  wire [63:0] _currLen_T_7 = lengthHistroy + 64'h1; // @[virtualStealServer.scala 377:38]
  wire [63:0] _GEN_138 = popOrPush ? 64'h0 : _currLen_T_7; // @[virtualStealServer.scala 371:24 373:21 377:21]
  wire [63:0] _GEN_139 = fifoTailReg < fifoHeadReg ? _currLen_T_5 : _GEN_138; // @[virtualStealServer.scala 362:42 364:17]
  wire [63:0] currLen = fifoTailReg > fifoHeadReg ? _currLen_T_1 : _GEN_139; // @[virtualStealServer.scala 357:36 359:17]
  wire [63:0] _T_18 = 64'h10 + currLen; // @[virtualStealServer.scala 132:79]
  wire  _T_23 = ~networkCongested; // @[virtualStealServer.scala 145:20]
  wire [3:0] _GEN_4 = procInterrupt != 64'h0 ? 4'ha : stateReg; // @[virtualStealServer.scala 153:42 155:22 69:44]
  wire [63:0] _GEN_5 = procInterrupt != 64'h0 ? 64'hffffffffffffffff : rPause; // @[virtualStealServer.scala 153:42 156:22 66:44]
  wire [3:0] _GEN_6 = _T_23 & taskQueueBuffer_io_count != 5'h0 ? 4'h7 : _GEN_4; // @[virtualStealServer.scala 149:74 151:22]
  wire [63:0] _GEN_7 = _T_23 & taskQueueBuffer_io_count != 5'h0 ? rPause : _GEN_5; // @[virtualStealServer.scala 149:74 66:44]
  wire [3:0] _GEN_8 = ~networkCongested & currLen != 64'h0 & taskQueueBuffer_io_count == 5'h0 ? 4'h6 : _GEN_6; // @[virtualStealServer.scala 145:93 147:22]
  wire [63:0] _GEN_9 = ~networkCongested & currLen != 64'h0 & taskQueueBuffer_io_count == 5'h0 ? rPause : _GEN_7; // @[virtualStealServer.scala 145:93 66:44]
  wire [3:0] _GEN_10 = networkCongested ? 4'h2 : _GEN_8; // @[virtualStealServer.scala 141:37 143:22]
  wire [63:0] _GEN_11 = networkCongested ? rPause : _GEN_9; // @[virtualStealServer.scala 141:37 66:44]
  wire [63:0] _GEN_13 = networkCongested & taskQueueBuffer_io_count == 5'h10 ? rPause : _GEN_11; // @[virtualStealServer.scala 137:74 66:44]
  wire [63:0] _GEN_15 = currLen == maxLength & networkCongested | maxLength < _T_18 ? 64'hffffffffffffffff : _GEN_13; // @[virtualStealServer.scala 132:90 135:22]
  wire  _T_32 = stateReg == 4'h2; // @[virtualStealServer.scala 160:25]
  wire [3:0] _GEN_16 = _T_23 ? 4'h0 : stateReg; // @[virtualStealServer.scala 170:38 172:22 69:44]
  wire [3:0] _GEN_17 = io_connNetwork_data_availableTask_valid & networkCongested ? 4'h2 : _GEN_16; // @[virtualStealServer.scala 166:80 168:22]
  wire  _T_37 = stateReg == 4'h4; // @[virtualStealServer.scala 176:25]
  wire [3:0] _GEN_19 = io_write_address_ready ? 4'h3 : stateReg; // @[virtualStealServer.scala 178:37 179:22 69:44]
  wire [4:0] _GEN_20 = io_write_address_ready ? 5'h10 : memDataCounter; // @[virtualStealServer.scala 178:37 180:28 82:44]
  wire  _T_38 = stateReg == 4'h3; // @[virtualStealServer.scala 183:25]
  wire  _T_39 = memDataCounter == 5'h1; // @[virtualStealServer.scala 185:52]
  wire [63:0] _T_42 = maxLength - 64'h1; // @[virtualStealServer.scala 189:42]
  wire [63:0] _fifoTailReg_T_1 = fifoTailReg + 64'h1; // @[virtualStealServer.scala 190:44]
  wire [63:0] _GEN_21 = fifoTailReg < _T_42 ? _fifoTailReg_T_1 : 64'h0; // @[virtualStealServer.scala 189:48 190:29 192:29]
  wire [4:0] _memDataCounter_T_1 = memDataCounter - 5'h1; // @[virtualStealServer.scala 196:46]
  wire [4:0] _GEN_23 = io_write_data_ready ? _memDataCounter_T_1 : memDataCounter; // @[virtualStealServer.scala 195:40 196:28 82:44]
  wire [63:0] _GEN_24 = io_write_data_ready ? _GEN_21 : fifoTailReg; // @[virtualStealServer.scala 195:40 77:44]
  wire [3:0] _GEN_25 = io_write_data_ready & memDataCounter == 5'h1 ? 4'h0 : stateReg; // @[virtualStealServer.scala 185:60 186:22 69:44]
  wire  _GEN_26 = io_write_data_ready & memDataCounter == 5'h1 ? 1'h0 : popOrPush; // @[virtualStealServer.scala 185:60 187:23 79:44]
  wire [63:0] _GEN_27 = io_write_data_ready & memDataCounter == 5'h1 ? _GEN_21 : _GEN_24; // @[virtualStealServer.scala 185:60]
  wire [4:0] _GEN_28 = io_write_data_ready & memDataCounter == 5'h1 ? memDataCounter : _GEN_23; // @[virtualStealServer.scala 185:60 82:44]
  wire  _T_47 = stateReg == 4'h6; // @[virtualStealServer.scala 204:25]
  wire  _memDataCounter_T_2 = currLen < 64'h10; // @[virtualStealServer.scala 208:43]
  wire [63:0] _memDataCounter_T_3 = currLen < 64'h10 ? currLen : 64'h10; // @[virtualStealServer.scala 208:34]
  wire [3:0] _GEN_29 = io_read_address_ready ? 4'h5 : stateReg; // @[virtualStealServer.scala 206:36 207:22 69:44]
  wire [63:0] _GEN_30 = io_read_address_ready ? _memDataCounter_T_3 : {{59'd0}, memDataCounter}; // @[virtualStealServer.scala 206:36 208:28 82:44]
  wire  _T_48 = stateReg == 4'h5; // @[virtualStealServer.scala 211:25]
  wire [63:0] _fifoHeadReg_T_1 = fifoHeadReg + 64'h1; // @[virtualStealServer.scala 218:44]
  wire [63:0] _GEN_31 = fifoHeadReg < _T_42 ? _fifoHeadReg_T_1 : 64'h0; // @[virtualStealServer.scala 217:48 218:29 220:29]
  wire [4:0] _GEN_33 = io_read_data_valid ? _memDataCounter_T_1 : memDataCounter; // @[virtualStealServer.scala 222:39 223:28 82:44]
  wire [63:0] _GEN_34 = io_read_data_valid ? _GEN_31 : fifoHeadReg; // @[virtualStealServer.scala 222:39 78:44]
  wire [3:0] _GEN_35 = io_read_data_valid & _T_39 ? 4'h8 : stateReg; // @[virtualStealServer.scala 213:59 214:22 69:44]
  wire  _GEN_36 = io_read_data_valid & _T_39 | popOrPush; // @[virtualStealServer.scala 213:59 215:23 79:44]
  wire [63:0] _GEN_37 = io_read_data_valid & _T_39 ? _GEN_31 : _GEN_34; // @[virtualStealServer.scala 213:59]
  wire [4:0] _GEN_38 = io_read_data_valid & _T_39 ? memDataCounter : _GEN_33; // @[virtualStealServer.scala 213:59 82:44]
  wire  _T_57 = stateReg == 4'h7; // @[virtualStealServer.scala 231:25]
  wire [2:0] _GEN_39 = networkCongested ? 3'h0 : 3'h7; // @[virtualStealServer.scala 235:37 236:22 238:22]
  wire [2:0] _GEN_40 = io_connNetwork_data_qOutTask_ready ? 3'h0 : _GEN_39; // @[virtualStealServer.scala 233:49 234:22]
  wire  _T_58 = stateReg == 4'h8; // @[virtualStealServer.scala 241:25]
  wire [3:0] _GEN_41 = networkCongested ? 4'h0 : stateReg; // @[virtualStealServer.scala 247:37 249:22 69:44]
  wire [3:0] _GEN_42 = io_connNetwork_ctrl_serveStealReq_ready ? 4'h7 : _GEN_41; // @[virtualStealServer.scala 243:54 245:22]
  wire  _T_60 = rPause == 64'h0; // @[virtualStealServer.scala 255:21]
  wire [3:0] _GEN_43 = rPause == 64'h0 ? 4'h0 : 4'h9; // @[virtualStealServer.scala 255:33 257:22 261:22]
  wire [3:0] _GEN_44 = _T_60 ? 4'h0 : 4'ha; // @[virtualStealServer.scala 267:33 268:22 270:22]
  wire [3:0] _GEN_45 = stateReg == 4'ha ? _GEN_44 : stateReg; // @[virtualStealServer.scala 265:57 69:44]
  wire [3:0] _GEN_46 = stateReg == 4'h9 ? _GEN_43 : _GEN_45; // @[virtualStealServer.scala 253:46]
  wire [3:0] _GEN_47 = stateReg == 4'h8 ? _GEN_42 : _GEN_46; // @[virtualStealServer.scala 241:54]
  wire [3:0] _GEN_48 = stateReg == 4'h7 ? {{1'd0}, _GEN_40} : _GEN_47; // @[virtualStealServer.scala 231:48]
  wire [3:0] _GEN_49 = stateReg == 4'h5 ? _GEN_35 : _GEN_48; // @[virtualStealServer.scala 211:46]
  wire  _GEN_50 = stateReg == 4'h5 ? _GEN_36 : popOrPush; // @[virtualStealServer.scala 211:46 79:44]
  wire [63:0] _GEN_51 = stateReg == 4'h5 ? _GEN_37 : fifoHeadReg; // @[virtualStealServer.scala 211:46 78:44]
  wire [4:0] _GEN_52 = stateReg == 4'h5 ? _GEN_38 : memDataCounter; // @[virtualStealServer.scala 211:46 82:44]
  wire [3:0] _GEN_53 = stateReg == 4'h6 ? _GEN_29 : _GEN_49; // @[virtualStealServer.scala 204:53]
  wire [63:0] _GEN_54 = stateReg == 4'h6 ? _GEN_30 : {{59'd0}, _GEN_52}; // @[virtualStealServer.scala 204:53]
  wire  _GEN_55 = stateReg == 4'h6 ? popOrPush : _GEN_50; // @[virtualStealServer.scala 204:53 79:44]
  wire [63:0] _GEN_56 = stateReg == 4'h6 ? fifoHeadReg : _GEN_51; // @[virtualStealServer.scala 204:53 78:44]
  wire [3:0] _GEN_57 = stateReg == 4'h3 ? _GEN_25 : _GEN_53; // @[virtualStealServer.scala 183:47]
  wire  _GEN_58 = stateReg == 4'h3 ? _GEN_26 : _GEN_55; // @[virtualStealServer.scala 183:47]
  wire [63:0] _GEN_59 = stateReg == 4'h3 ? _GEN_27 : fifoTailReg; // @[virtualStealServer.scala 183:47 77:44]
  wire [63:0] _GEN_60 = stateReg == 4'h3 ? {{59'd0}, _GEN_28} : _GEN_54; // @[virtualStealServer.scala 183:47]
  wire [63:0] _GEN_61 = stateReg == 4'h3 ? fifoHeadReg : _GEN_56; // @[virtualStealServer.scala 183:47 78:44]
  wire [63:0] _GEN_63 = stateReg == 4'h4 ? {{59'd0}, _GEN_20} : _GEN_60; // @[virtualStealServer.scala 176:54]
  wire  _GEN_64 = stateReg == 4'h4 ? popOrPush : _GEN_58; // @[virtualStealServer.scala 176:54 79:44]
  wire [63:0] _GEN_65 = stateReg == 4'h4 ? fifoTailReg : _GEN_59; // @[virtualStealServer.scala 176:54 77:44]
  wire [63:0] _GEN_66 = stateReg == 4'h4 ? fifoHeadReg : _GEN_61; // @[virtualStealServer.scala 176:54 78:44]
  wire [63:0] _GEN_68 = stateReg == 4'h2 ? {{59'd0}, memDataCounter} : _GEN_63; // @[virtualStealServer.scala 160:46 82:44]
  wire  _GEN_69 = stateReg == 4'h2 ? popOrPush : _GEN_64; // @[virtualStealServer.scala 160:46 79:44]
  wire [63:0] _GEN_70 = stateReg == 4'h2 ? fifoTailReg : _GEN_65; // @[virtualStealServer.scala 160:46 77:44]
  wire [63:0] _GEN_71 = stateReg == 4'h2 ? fifoHeadReg : _GEN_66; // @[virtualStealServer.scala 160:46 78:44]
  wire [63:0] _GEN_73 = stateReg == 4'h0 ? _GEN_15 : rPause; // @[virtualStealServer.scala 130:34 66:44]
  wire [63:0] _GEN_74 = stateReg == 4'h0 ? {{59'd0}, memDataCounter} : _GEN_68; // @[virtualStealServer.scala 130:34 82:44]
  wire  _GEN_75 = stateReg == 4'h0 ? popOrPush : _GEN_69; // @[virtualStealServer.scala 130:34 79:44]
  wire [63:0] _GEN_76 = stateReg == 4'h0 ? fifoTailReg : _GEN_70; // @[virtualStealServer.scala 130:34 77:44]
  wire [63:0] _GEN_77 = stateReg == 4'h0 ? fifoHeadReg : _GEN_71; // @[virtualStealServer.scala 130:34 78:44]
  wire [66:0] _io_write_address_bits_T = {fifoTailReg, 3'h0}; // @[virtualStealServer.scala 318:65]
  wire [66:0] _GEN_166 = {{3'd0}, rAddr}; // @[virtualStealServer.scala 318:79]
  wire [66:0] _io_write_address_bits_T_2 = _io_write_address_bits_T + _GEN_166; // @[virtualStealServer.scala 318:79]
  wire [66:0] _io_read_address_bits_T = {fifoHeadReg, 3'h0}; // @[virtualStealServer.scala 333:65]
  wire [66:0] _io_read_address_bits_T_2 = _io_read_address_bits_T + _GEN_166; // @[virtualStealServer.scala 333:79]
  wire [63:0] _io_read_burst_len_T_2 = currLen - 64'h1; // @[virtualStealServer.scala 334:79]
  wire [63:0] _io_read_burst_len_T_3 = _memDataCounter_T_2 ? _io_read_burst_len_T_2 : 64'hf; // @[virtualStealServer.scala 334:55]
  wire  _GEN_81 = _T_57 & io_connNetwork_data_qOutTask_ready; // @[virtualStealServer.scala 299:45 342:48 345:49]
  wire  _GEN_82 = _T_57 ? 1'h0 : _T_58; // @[virtualStealServer.scala 293:45 342:48]
  wire [63:0] _GEN_84 = _T_48 ? io_read_data_bits : 64'h0; // @[virtualStealServer.scala 297:45 336:46 339:49]
  wire  _GEN_85 = _T_48 & io_read_data_valid; // @[virtualStealServer.scala 296:45 336:46 340:49]
  wire  _GEN_86 = _T_48 ? 1'h0 : _T_57; // @[virtualStealServer.scala 289:45 336:46]
  wire  _GEN_87 = _T_48 ? 1'h0 : _GEN_81; // @[virtualStealServer.scala 299:45 336:46]
  wire  _GEN_88 = _T_48 ? 1'h0 : _GEN_82; // @[virtualStealServer.scala 293:45 336:46]
  wire [66:0] _GEN_90 = _T_47 ? _io_read_address_bits_T_2 : 67'h0; // @[virtualStealServer.scala 281:45 330:53 333:49]
  wire [63:0] _GEN_91 = _T_47 ? _io_read_burst_len_T_3 : 64'h0; // @[virtualStealServer.scala 304:45 330:53 334:49]
  wire  _GEN_92 = _T_47 ? 1'h0 : _T_48; // @[virtualStealServer.scala 282:45 330:53]
  wire [63:0] _GEN_93 = _T_47 ? 64'h0 : _GEN_84; // @[virtualStealServer.scala 297:45 330:53]
  wire  _GEN_94 = _T_47 ? 1'h0 : _GEN_85; // @[virtualStealServer.scala 296:45 330:53]
  wire  _GEN_95 = _T_47 ? 1'h0 : _GEN_86; // @[virtualStealServer.scala 289:45 330:53]
  wire  _GEN_96 = _T_47 ? 1'h0 : _GEN_87; // @[virtualStealServer.scala 299:45 330:53]
  wire  _GEN_97 = _T_47 ? 1'h0 : _GEN_88; // @[virtualStealServer.scala 293:45 330:53]
  wire  _GEN_99 = _T_38 ? io_write_data_ready : _GEN_96; // @[virtualStealServer.scala 321:47 324:49]
  wire  _GEN_100 = _T_38 & _T_39; // @[virtualStealServer.scala 303:45 321:47]
  wire  _GEN_101 = _T_38 ? 1'h0 : _T_47; // @[virtualStealServer.scala 280:45 321:47]
  wire [66:0] _GEN_102 = _T_38 ? 67'h0 : _GEN_90; // @[virtualStealServer.scala 281:45 321:47]
  wire [63:0] _GEN_103 = _T_38 ? 64'h0 : _GEN_91; // @[virtualStealServer.scala 304:45 321:47]
  wire  _GEN_104 = _T_38 ? 1'h0 : _GEN_92; // @[virtualStealServer.scala 282:45 321:47]
  wire [63:0] _GEN_105 = _T_38 ? 64'h0 : _GEN_93; // @[virtualStealServer.scala 297:45 321:47]
  wire  _GEN_106 = _T_38 ? 1'h0 : _GEN_94; // @[virtualStealServer.scala 296:45 321:47]
  wire  _GEN_107 = _T_38 ? 1'h0 : _GEN_95; // @[virtualStealServer.scala 289:45 321:47]
  wire  _GEN_108 = _T_38 ? 1'h0 : _GEN_97; // @[virtualStealServer.scala 293:45 321:47]
  wire [66:0] _GEN_110 = _T_37 ? _io_write_address_bits_T_2 : 67'h0; // @[virtualStealServer.scala 284:45 315:54 318:49]
  wire [3:0] _GEN_111 = _T_37 ? 4'hf : 4'h0; // @[virtualStealServer.scala 302:45 315:54 319:49]
  wire  _GEN_112 = _T_37 ? 1'h0 : _T_38; // @[virtualStealServer.scala 285:45 315:54]
  wire  _GEN_113 = _T_37 ? 1'h0 : _GEN_99; // @[virtualStealServer.scala 299:45 315:54]
  wire  _GEN_114 = _T_37 ? 1'h0 : _GEN_100; // @[virtualStealServer.scala 303:45 315:54]
  wire  _GEN_115 = _T_37 ? 1'h0 : _GEN_101; // @[virtualStealServer.scala 280:45 315:54]
  wire [66:0] _GEN_116 = _T_37 ? 67'h0 : _GEN_102; // @[virtualStealServer.scala 281:45 315:54]
  wire [63:0] _GEN_117 = _T_37 ? 64'h0 : _GEN_103; // @[virtualStealServer.scala 304:45 315:54]
  wire  _GEN_118 = _T_37 ? 1'h0 : _GEN_104; // @[virtualStealServer.scala 282:45 315:54]
  wire [63:0] _GEN_119 = _T_37 ? 64'h0 : _GEN_105; // @[virtualStealServer.scala 297:45 315:54]
  wire  _GEN_120 = _T_37 ? 1'h0 : _GEN_106; // @[virtualStealServer.scala 296:45 315:54]
  wire  _GEN_121 = _T_37 ? 1'h0 : _GEN_107; // @[virtualStealServer.scala 289:45 315:54]
  wire  _GEN_122 = _T_37 ? 1'h0 : _GEN_108; // @[virtualStealServer.scala 293:45 315:54]
  wire [66:0] _GEN_127 = _T_32 ? 67'h0 : _GEN_110; // @[virtualStealServer.scala 309:40 284:45]
  wire [66:0] _GEN_133 = _T_32 ? 67'h0 : _GEN_116; // @[virtualStealServer.scala 309:40 281:45]
  wire [63:0] _GEN_134 = _T_32 ? 64'h0 : _GEN_117; // @[virtualStealServer.scala 309:40 304:45]
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
  wire [63:0] _GEN_168 = reset ? 64'h0 : _GEN_74; // @[virtualStealServer.scala 82:{44,44}]
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
  Queue_3 taskQueueBuffer ( // @[virtualStealServer.scala 81:43]
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
  assign io_connNetwork_ctrl_serveStealReq_valid = _T_32 ? 1'h0 : _GEN_122; // @[virtualStealServer.scala 309:40 293:45]
  assign io_connNetwork_data_availableTask_ready = stateReg == 4'h2; // @[virtualStealServer.scala 309:19]
  assign io_connNetwork_data_qOutTask_valid = _T_32 ? 1'h0 : _GEN_121; // @[virtualStealServer.scala 309:40 289:45]
  assign io_connNetwork_data_qOutTask_bits = taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 275:45]
  assign io_axi_mgmt_ARREADY = rdReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_RVALID = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign io_axi_mgmt_RDATA = 6'h28 == rdAddr ? procInterrupt : _GEN_147; // @[RegisterBlock.scala 224:38 225:16]
  assign io_axi_mgmt_AWREADY = wrReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_WREADY = wrReqData__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 60:19]
  assign io_axi_mgmt_BVALID = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign io_read_address_valid = _T_32 ? 1'h0 : _GEN_115; // @[virtualStealServer.scala 309:40 280:45]
  assign io_read_address_bits = _GEN_133[63:0];
  assign io_read_data_ready = _T_32 ? 1'h0 : _GEN_118; // @[virtualStealServer.scala 309:40 282:45]
  assign io_read_burst_len = _GEN_134[3:0];
  assign io_write_address_valid = _T_32 ? 1'h0 : _T_37; // @[virtualStealServer.scala 309:40 283:45]
  assign io_write_address_bits = _GEN_127[63:0];
  assign io_write_data_valid = _T_32 ? 1'h0 : _GEN_112; // @[virtualStealServer.scala 309:40 285:45]
  assign io_write_data_bits = taskQueueBuffer_io_deq_bits; // @[virtualStealServer.scala 276:45]
  assign io_write_burst_len = _T_32 ? 4'h0 : _GEN_111; // @[virtualStealServer.scala 309:40 302:45]
  assign io_write_last = _T_32 ? 1'h0 : _GEN_114; // @[virtualStealServer.scala 309:40 303:45]
  assign rdReq__deq_clock = clock;
  assign rdReq__deq_reset = reset;
  assign rdReq__deq_io_enq_valid = io_axi_mgmt_ARVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 62:20]
  assign rdReq__deq_io_enq_bits_addr = io_axi_mgmt_ARADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 62:20]
  assign rdReq__deq_io_deq_ready = rdReq__valid & io_axi_mgmt_RREADY; // @[RegisterBlock.scala 210:44]
  assign wrReq__deq_clock = clock;
  assign wrReq__deq_reset = reset;
  assign wrReq__deq_io_enq_valid = io_axi_mgmt_AWVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 62:20]
  assign wrReq__deq_io_enq_bits_addr = io_axi_mgmt_AWADDR; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 62:20]
  assign wrReq__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign wrReqData__deq_clock = clock;
  assign wrReqData__deq_reset = reset;
  assign wrReqData__deq_io_enq_valid = io_axi_mgmt_WVALID; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 62:20]
  assign wrReqData__deq_io_enq_bits_data = io_axi_mgmt_WDATA; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 62:20]
  assign wrReqData__deq_io_enq_bits_strb = io_axi_mgmt_WSTRB; // @[RegisterBlock.scala 60:19 virtualStealServer.scala 62:20]
  assign wrReqData__deq_io_deq_ready = wrReq__valid & wrReqData__valid & io_axi_mgmt_BREADY; // @[RegisterBlock.scala 241:63]
  assign taskQueueBuffer_clock = clock;
  assign taskQueueBuffer_reset = reset;
  assign taskQueueBuffer_io_enq_valid = _T_32 ? io_connNetwork_data_availableTask_valid : _GEN_120; // @[virtualStealServer.scala 309:40 313:49]
  assign taskQueueBuffer_io_enq_bits = _T_32 ? io_connNetwork_data_availableTask_bits : _GEN_119; // @[virtualStealServer.scala 309:40 311:49]
  assign taskQueueBuffer_io_deq_ready = _T_32 ? 1'h0 : _GEN_113; // @[virtualStealServer.scala 309:40 299:45]
  always @(posedge clock) begin
    if (reset) begin // @[virtualStealServer.scala 65:44]
      rAddr <= 64'h0; // @[virtualStealServer.scala 65:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 388:27]
      if (6'h8 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rAddr <= _rAddr_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 66:44]
      rPause <= 64'h0; // @[virtualStealServer.scala 66:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 388:27]
      if (6'h0 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        rPause <= _rPause_T_16; // @[RegisterBlock.scala 118:11]
      end else begin
        rPause <= _GEN_73;
      end
    end else begin
      rPause <= _GEN_73;
    end
    if (reset) begin // @[virtualStealServer.scala 67:44]
      procInterrupt <= 64'h0; // @[virtualStealServer.scala 67:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 388:27]
      if (6'h28 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        procInterrupt <= _procInterrupt_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 68:44]
      maxLength <= 64'h0; // @[virtualStealServer.scala 68:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 388:27]
      if (6'h10 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        maxLength <= _maxLength_T_16; // @[RegisterBlock.scala 118:11]
      end
    end
    if (reset) begin // @[virtualStealServer.scala 69:44]
      stateReg <= 4'h0; // @[virtualStealServer.scala 69:44]
    end else if (stateReg == 4'h0) begin // @[virtualStealServer.scala 130:34]
      if (currLen == maxLength & networkCongested | maxLength < _T_18) begin // @[virtualStealServer.scala 132:90]
        stateReg <= 4'h9; // @[virtualStealServer.scala 134:22]
      end else if (networkCongested & taskQueueBuffer_io_count == 5'h10) begin // @[virtualStealServer.scala 137:74]
        stateReg <= 4'h4; // @[virtualStealServer.scala 139:22]
      end else begin
        stateReg <= _GEN_10;
      end
    end else if (stateReg == 4'h2) begin // @[virtualStealServer.scala 160:46]
      if (taskQueueBuffer_io_count == 5'hf & io_connNetwork_data_availableTask_valid) begin // @[virtualStealServer.scala 162:91]
        stateReg <= 4'h4; // @[virtualStealServer.scala 164:22]
      end else begin
        stateReg <= _GEN_17;
      end
    end else if (stateReg == 4'h4) begin // @[virtualStealServer.scala 176:54]
      stateReg <= _GEN_19;
    end else begin
      stateReg <= _GEN_57;
    end
    if (reset) begin // @[virtualStealServer.scala 71:44]
      contentionCounter <= 64'h0; // @[virtualStealServer.scala 71:44]
    end else if (_T_1 & contentionCounter != 64'h4) begin // @[virtualStealServer.scala 108:60]
      contentionCounter <= _contentionCounter_T_1; // @[virtualStealServer.scala 109:31]
    end else if (_T_5 & ~io_ntwDataUnitOccupancy) begin // @[virtualStealServer.scala 112:50]
      contentionCounter <= _contentionCounter_T_3; // @[virtualStealServer.scala 113:31]
    end
    if (reset) begin // @[virtualStealServer.scala 73:44]
      networkCongested <= 1'h0; // @[virtualStealServer.scala 73:44]
    end else begin
      networkCongested <= _GEN_3;
    end
    if (reset) begin // @[virtualStealServer.scala 77:44]
      fifoTailReg <= 64'h0; // @[virtualStealServer.scala 77:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 388:27]
      if (6'h18 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoTailReg <= _fifoTailReg_T_20; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoTailReg <= _GEN_76;
      end
    end else begin
      fifoTailReg <= _GEN_76;
    end
    if (reset) begin // @[virtualStealServer.scala 78:44]
      fifoHeadReg <= 64'h0; // @[virtualStealServer.scala 78:44]
    end else if (wrReq) begin // @[virtualStealServer.scala 388:27]
      if (6'h20 == wrAddr) begin // @[RegisterBlock.scala 252:38]
        fifoHeadReg <= _fifoHeadReg_T_20; // @[RegisterBlock.scala 118:11]
      end else begin
        fifoHeadReg <= _GEN_77;
      end
    end else begin
      fifoHeadReg <= _GEN_77;
    end
    popOrPush <= reset | _GEN_75; // @[virtualStealServer.scala 79:{44,44}]
    memDataCounter <= _GEN_168[4:0]; // @[virtualStealServer.scala 82:{44,44}]
    if (reset) begin // @[virtualStealServer.scala 355:32]
      lengthHistroy <= 64'h0; // @[virtualStealServer.scala 355:32]
    end else if (fifoTailReg > fifoHeadReg) begin // @[virtualStealServer.scala 357:36]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 360:23]
    end else if (fifoTailReg < fifoHeadReg) begin // @[virtualStealServer.scala 362:42]
      lengthHistroy <= currLen; // @[virtualStealServer.scala 365:23]
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
  input         clock,
  input         reset,
  output        io_read_address_ready,
  input         io_read_address_valid,
  input  [63:0] io_read_address_bits,
  input         io_read_data_ready,
  output        io_read_data_valid,
  output [63:0] io_read_data_bits,
  output        io_write_address_ready,
  input         io_write_address_valid,
  input  [63:0] io_write_address_bits,
  output        io_write_data_ready,
  input         io_write_data_valid,
  input  [63:0] io_write_data_bits,
  input  [3:0]  io_writeBurst_len,
  input         io_writeBurst_last,
  input  [3:0]  io_readBurst_len,
  input         axi_ARREADY,
  output        axi_ARVALID,
  output [63:0] axi_ARADDR,
  output [7:0]  axi_ARLEN,
  output        axi_RREADY,
  input         axi_RVALID,
  input  [63:0] axi_RDATA,
  input         axi_AWREADY,
  output        axi_AWVALID,
  output [63:0] axi_AWADDR,
  output [7:0]  axi_AWLEN,
  input         axi_WREADY,
  output        axi_WVALID,
  output [63:0] axi_WDATA,
  output        axi_WLAST,
  input         axi_BVALID
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
  input         io_vss_axi_full_0_ARREADY,
  output        io_vss_axi_full_0_ARVALID,
  output [63:0] io_vss_axi_full_0_ARADDR,
  output [7:0]  io_vss_axi_full_0_ARLEN,
  output        io_vss_axi_full_0_RREADY,
  input         io_vss_axi_full_0_RVALID,
  input  [63:0] io_vss_axi_full_0_RDATA,
  input         io_vss_axi_full_0_AWREADY,
  output        io_vss_axi_full_0_AWVALID,
  output [63:0] io_vss_axi_full_0_AWADDR,
  output [7:0]  io_vss_axi_full_0_AWLEN,
  input         io_vss_axi_full_0_WREADY,
  output        io_vss_axi_full_0_WVALID,
  output [63:0] io_vss_axi_full_0_WDATA,
  output        io_vss_axi_full_0_WLAST,
  input         io_vss_axi_full_0_BVALID,
  input         io_taskOut_0_TREADY,
  output        io_taskOut_0_TVALID,
  output [63:0] io_taskOut_0_TDATA,
  input         io_taskOut_1_TREADY,
  output        io_taskOut_1_TVALID,
  output [63:0] io_taskOut_1_TDATA,
  input         io_taskOut_2_TREADY,
  output        io_taskOut_2_TVALID,
  output [63:0] io_taskOut_2_TDATA,
  input         io_taskOut_3_TREADY,
  output        io_taskOut_3_TVALID,
  output [63:0] io_taskOut_3_TDATA,
  output        io_taskIn_0_TREADY,
  input         io_taskIn_0_TVALID,
  input  [63:0] io_taskIn_0_TDATA,
  output        io_taskIn_1_TREADY,
  input         io_taskIn_1_TVALID,
  input  [63:0] io_taskIn_1_TDATA,
  output        io_taskIn_2_TREADY,
  input         io_taskIn_2_TVALID,
  input  [63:0] io_taskIn_2_TDATA,
  output        io_taskIn_3_TREADY,
  input         io_taskIn_3_TVALID,
  input  [63:0] io_taskIn_3_TDATA
);
  wire  stealNW_TQ_clock; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_reset; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_0_push_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_0_push_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_0_push_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_0_pop_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_1_push_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_1_push_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_1_push_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_1_pop_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_2_push_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_2_push_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_2_push_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_2_pop_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_3_push_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_3_push_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_3_push_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_3_pop_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_connVSS_0_data_qOutTask_valid; // @[stealSide.scala 55:28]
  wire [63:0] stealNW_TQ_io_connVSS_0_data_qOutTask_bits; // @[stealSide.scala 55:28]
  wire  stealNW_TQ_io_ntwDataUnitOccupancyVSS_0; // @[stealSide.scala 55:28]
  wire  virtualStealServers_0_clock; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_reset; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_connNetwork_data_availableTask_valid; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_connNetwork_data_availableTask_bits; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_ready; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_ARREADY; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_ARVALID; // @[stealSide.scala 66:75]
  wire [5:0] virtualStealServers_0_io_axi_mgmt_ARADDR; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_RREADY; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_RVALID; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_axi_mgmt_RDATA; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_AWREADY; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_AWVALID; // @[stealSide.scala 66:75]
  wire [5:0] virtualStealServers_0_io_axi_mgmt_AWADDR; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_WREADY; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_WVALID; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_axi_mgmt_WDATA; // @[stealSide.scala 66:75]
  wire [7:0] virtualStealServers_0_io_axi_mgmt_WSTRB; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_BREADY; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_axi_mgmt_BVALID; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_read_address_ready; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_read_address_valid; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_read_address_bits; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_read_data_ready; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_read_data_valid; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_read_data_bits; // @[stealSide.scala 66:75]
  wire [3:0] virtualStealServers_0_io_read_burst_len; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_write_address_ready; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_write_data_ready; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 66:75]
  wire [63:0] virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 66:75]
  wire [3:0] virtualStealServers_0_io_write_burst_len; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_write_last; // @[stealSide.scala 66:75]
  wire  virtualStealServers_0_io_ntwDataUnitOccupancy; // @[stealSide.scala 66:75]
  wire  vssRvm_0_clock; // @[stealSide.scala 91:68]
  wire  vssRvm_0_reset; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_read_address_ready; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_read_address_valid; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_io_read_address_bits; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_read_data_ready; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_read_data_valid; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_io_read_data_bits; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_write_address_ready; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_write_address_valid; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_io_write_address_bits; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_write_data_ready; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_write_data_valid; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_io_write_data_bits; // @[stealSide.scala 91:68]
  wire [3:0] vssRvm_0_io_writeBurst_len; // @[stealSide.scala 91:68]
  wire  vssRvm_0_io_writeBurst_last; // @[stealSide.scala 91:68]
  wire [3:0] vssRvm_0_io_readBurst_len; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_ARREADY; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_ARVALID; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_axi_ARADDR; // @[stealSide.scala 91:68]
  wire [7:0] vssRvm_0_axi_ARLEN; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_RREADY; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_RVALID; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_axi_RDATA; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_AWREADY; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_AWVALID; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_axi_AWADDR; // @[stealSide.scala 91:68]
  wire [7:0] vssRvm_0_axi_AWLEN; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_WREADY; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_WVALID; // @[stealSide.scala 91:68]
  wire [63:0] vssRvm_0_axi_WDATA; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_WLAST; // @[stealSide.scala 91:68]
  wire  vssRvm_0_axi_BVALID; // @[stealSide.scala 91:68]
  stealNW_TQ stealNW_TQ ( // @[stealSide.scala 55:28]
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
    .io_ntwDataUnitOccupancyVSS_0(stealNW_TQ_io_ntwDataUnitOccupancyVSS_0)
  );
  virtualStealServer virtualStealServers_0 ( // @[stealSide.scala 66:75]
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
  readyValidMem vssRvm_0 ( // @[stealSide.scala 91:68]
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
  assign io_axi_mgmt_vss_0_ARREADY = virtualStealServers_0_io_axi_mgmt_ARREADY; // @[stealSide.scala 87:28]
  assign io_axi_mgmt_vss_0_RVALID = virtualStealServers_0_io_axi_mgmt_RVALID; // @[stealSide.scala 87:28]
  assign io_axi_mgmt_vss_0_RDATA = virtualStealServers_0_io_axi_mgmt_RDATA; // @[stealSide.scala 87:28]
  assign io_axi_mgmt_vss_0_AWREADY = virtualStealServers_0_io_axi_mgmt_AWREADY; // @[stealSide.scala 87:28]
  assign io_axi_mgmt_vss_0_WREADY = virtualStealServers_0_io_axi_mgmt_WREADY; // @[stealSide.scala 87:28]
  assign io_axi_mgmt_vss_0_BVALID = virtualStealServers_0_io_axi_mgmt_BVALID; // @[stealSide.scala 87:28]
  assign io_vss_axi_full_0_ARVALID = vssRvm_0_axi_ARVALID; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_ARADDR = vssRvm_0_axi_ARADDR; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_ARLEN = vssRvm_0_axi_ARLEN; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_RREADY = vssRvm_0_axi_RREADY; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_AWVALID = vssRvm_0_axi_AWVALID; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_AWADDR = vssRvm_0_axi_AWADDR; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_AWLEN = vssRvm_0_axi_AWLEN; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_WVALID = vssRvm_0_axi_WVALID; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_WDATA = vssRvm_0_axi_WDATA; // @[stealSide.scala 102:47]
  assign io_vss_axi_full_0_WLAST = vssRvm_0_axi_WLAST; // @[stealSide.scala 102:47]
  assign io_taskOut_0_TVALID = stealNW_TQ_io_connPE_0_pop_valid; // @[stealSide.scala 107:39]
  assign io_taskOut_0_TDATA = stealNW_TQ_io_connPE_0_pop_bits; // @[stealSide.scala 107:39]
  assign io_taskOut_1_TVALID = stealNW_TQ_io_connPE_1_pop_valid; // @[stealSide.scala 107:39]
  assign io_taskOut_1_TDATA = stealNW_TQ_io_connPE_1_pop_bits; // @[stealSide.scala 107:39]
  assign io_taskOut_2_TVALID = stealNW_TQ_io_connPE_2_pop_valid; // @[stealSide.scala 107:39]
  assign io_taskOut_2_TDATA = stealNW_TQ_io_connPE_2_pop_bits; // @[stealSide.scala 107:39]
  assign io_taskOut_3_TVALID = stealNW_TQ_io_connPE_3_pop_valid; // @[stealSide.scala 107:39]
  assign io_taskOut_3_TDATA = stealNW_TQ_io_connPE_3_pop_bits; // @[stealSide.scala 107:39]
  assign io_taskIn_0_TREADY = stealNW_TQ_io_connPE_0_push_ready; // @[stealSide.scala 109:43]
  assign io_taskIn_1_TREADY = stealNW_TQ_io_connPE_1_push_ready; // @[stealSide.scala 109:43]
  assign io_taskIn_2_TREADY = stealNW_TQ_io_connPE_2_push_ready; // @[stealSide.scala 109:43]
  assign io_taskIn_3_TREADY = stealNW_TQ_io_connPE_3_push_ready; // @[stealSide.scala 109:43]
  assign stealNW_TQ_clock = clock;
  assign stealNW_TQ_reset = reset;
  assign stealNW_TQ_io_connPE_0_push_valid = io_taskIn_0_TVALID; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_0_push_bits = io_taskIn_0_TDATA; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_0_pop_ready = io_taskOut_0_TREADY; // @[stealSide.scala 107:39]
  assign stealNW_TQ_io_connPE_1_push_valid = io_taskIn_1_TVALID; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_1_push_bits = io_taskIn_1_TDATA; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_1_pop_ready = io_taskOut_1_TREADY; // @[stealSide.scala 107:39]
  assign stealNW_TQ_io_connPE_2_push_valid = io_taskIn_2_TVALID; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_2_push_bits = io_taskIn_2_TDATA; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_2_pop_ready = io_taskOut_2_TREADY; // @[stealSide.scala 107:39]
  assign stealNW_TQ_io_connPE_3_push_valid = io_taskIn_3_TVALID; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_3_push_bits = io_taskIn_3_TDATA; // @[stealSide.scala 109:43]
  assign stealNW_TQ_io_connPE_3_pop_ready = io_taskOut_3_TREADY; // @[stealSide.scala 107:39]
  assign stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_valid =
    virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_valid; // @[stealSide.scala 103:47]
  assign stealNW_TQ_io_connVSS_0_data_availableTask_ready =
    virtualStealServers_0_io_connNetwork_data_availableTask_ready; // @[stealSide.scala 103:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_valid = virtualStealServers_0_io_connNetwork_data_qOutTask_valid; // @[stealSide.scala 103:47]
  assign stealNW_TQ_io_connVSS_0_data_qOutTask_bits = virtualStealServers_0_io_connNetwork_data_qOutTask_bits; // @[stealSide.scala 103:47]
  assign virtualStealServers_0_clock = clock;
  assign virtualStealServers_0_reset = reset;
  assign virtualStealServers_0_io_connNetwork_ctrl_serveStealReq_ready =
    stealNW_TQ_io_connVSS_0_ctrl_serveStealReq_ready; // @[stealSide.scala 103:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_valid =
    stealNW_TQ_io_connVSS_0_data_availableTask_valid; // @[stealSide.scala 103:47]
  assign virtualStealServers_0_io_connNetwork_data_availableTask_bits = stealNW_TQ_io_connVSS_0_data_availableTask_bits; // @[stealSide.scala 103:47]
  assign virtualStealServers_0_io_connNetwork_data_qOutTask_ready = stealNW_TQ_io_connVSS_0_data_qOutTask_ready; // @[stealSide.scala 103:47]
  assign virtualStealServers_0_io_axi_mgmt_ARVALID = io_axi_mgmt_vss_0_ARVALID; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_ARADDR = io_axi_mgmt_vss_0_ARADDR; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_RREADY = io_axi_mgmt_vss_0_RREADY; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_AWVALID = io_axi_mgmt_vss_0_AWVALID; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_AWADDR = io_axi_mgmt_vss_0_AWADDR; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_WVALID = io_axi_mgmt_vss_0_WVALID; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_WDATA = io_axi_mgmt_vss_0_WDATA; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_WSTRB = io_axi_mgmt_vss_0_WSTRB; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_axi_mgmt_BREADY = io_axi_mgmt_vss_0_BREADY; // @[stealSide.scala 87:28]
  assign virtualStealServers_0_io_read_address_ready = vssRvm_0_io_read_address_ready; // @[stealSide.scala 95:47]
  assign virtualStealServers_0_io_read_data_valid = vssRvm_0_io_read_data_valid; // @[stealSide.scala 96:47]
  assign virtualStealServers_0_io_read_data_bits = vssRvm_0_io_read_data_bits; // @[stealSide.scala 96:47]
  assign virtualStealServers_0_io_write_address_ready = vssRvm_0_io_write_address_ready; // @[stealSide.scala 97:47]
  assign virtualStealServers_0_io_write_data_ready = vssRvm_0_io_write_data_ready; // @[stealSide.scala 98:47]
  assign virtualStealServers_0_io_ntwDataUnitOccupancy = stealNW_TQ_io_ntwDataUnitOccupancyVSS_0; // @[stealSide.scala 88:56]
  assign vssRvm_0_clock = clock;
  assign vssRvm_0_reset = reset;
  assign vssRvm_0_io_read_address_valid = virtualStealServers_0_io_read_address_valid; // @[stealSide.scala 95:47]
  assign vssRvm_0_io_read_address_bits = virtualStealServers_0_io_read_address_bits; // @[stealSide.scala 95:47]
  assign vssRvm_0_io_read_data_ready = virtualStealServers_0_io_read_data_ready; // @[stealSide.scala 96:47]
  assign vssRvm_0_io_write_address_valid = virtualStealServers_0_io_write_address_valid; // @[stealSide.scala 97:47]
  assign vssRvm_0_io_write_address_bits = virtualStealServers_0_io_write_address_bits; // @[stealSide.scala 97:47]
  assign vssRvm_0_io_write_data_valid = virtualStealServers_0_io_write_data_valid; // @[stealSide.scala 98:47]
  assign vssRvm_0_io_write_data_bits = virtualStealServers_0_io_write_data_bits; // @[stealSide.scala 98:47]
  assign vssRvm_0_io_writeBurst_len = virtualStealServers_0_io_write_burst_len; // @[stealSide.scala 100:47]
  assign vssRvm_0_io_writeBurst_last = virtualStealServers_0_io_write_last; // @[stealSide.scala 101:47]
  assign vssRvm_0_io_readBurst_len = virtualStealServers_0_io_read_burst_len; // @[stealSide.scala 99:47]
  assign vssRvm_0_axi_ARREADY = io_vss_axi_full_0_ARREADY; // @[stealSide.scala 102:47]
  assign vssRvm_0_axi_RVALID = io_vss_axi_full_0_RVALID; // @[stealSide.scala 102:47]
  assign vssRvm_0_axi_RDATA = io_vss_axi_full_0_RDATA; // @[stealSide.scala 102:47]
  assign vssRvm_0_axi_AWREADY = io_vss_axi_full_0_AWREADY; // @[stealSide.scala 102:47]
  assign vssRvm_0_axi_WREADY = io_vss_axi_full_0_WREADY; // @[stealSide.scala 102:47]
  assign vssRvm_0_axi_BVALID = io_vss_axi_full_0_BVALID; // @[stealSide.scala 102:47]
endmodule
module paper_exp_dae_0__peCountExecute_4__vssNumberExecute_1(
  input         clock,
  input         reset,
  output        execute_stealSide_axi_mgmt_vss_0_ARREADY,
  input         execute_stealSide_axi_mgmt_vss_0_ARVALID,
  input  [5:0]  execute_stealSide_axi_mgmt_vss_0_ARADDR,
  input  [2:0]  execute_stealSide_axi_mgmt_vss_0_ARPROT,
  input         execute_stealSide_axi_mgmt_vss_0_RREADY,
  output        execute_stealSide_axi_mgmt_vss_0_RVALID,
  output [63:0] execute_stealSide_axi_mgmt_vss_0_RDATA,
  output [1:0]  execute_stealSide_axi_mgmt_vss_0_RRESP,
  output        execute_stealSide_axi_mgmt_vss_0_AWREADY,
  input         execute_stealSide_axi_mgmt_vss_0_AWVALID,
  input  [5:0]  execute_stealSide_axi_mgmt_vss_0_AWADDR,
  input  [2:0]  execute_stealSide_axi_mgmt_vss_0_AWPROT,
  output        execute_stealSide_axi_mgmt_vss_0_WREADY,
  input         execute_stealSide_axi_mgmt_vss_0_WVALID,
  input  [63:0] execute_stealSide_axi_mgmt_vss_0_WDATA,
  input  [7:0]  execute_stealSide_axi_mgmt_vss_0_WSTRB,
  input         execute_stealSide_axi_mgmt_vss_0_BREADY,
  output        execute_stealSide_axi_mgmt_vss_0_BVALID,
  output [1:0]  execute_stealSide_axi_mgmt_vss_0_BRESP,
  input         execute_stealSide_vss_axi_full_0_ARREADY,
  output        execute_stealSide_vss_axi_full_0_ARVALID,
  output [3:0]  execute_stealSide_vss_axi_full_0_ARID,
  output [63:0] execute_stealSide_vss_axi_full_0_ARADDR,
  output [7:0]  execute_stealSide_vss_axi_full_0_ARLEN,
  output [2:0]  execute_stealSide_vss_axi_full_0_ARSIZE,
  output [1:0]  execute_stealSide_vss_axi_full_0_ARBURST,
  output        execute_stealSide_vss_axi_full_0_ARLOCK,
  output [3:0]  execute_stealSide_vss_axi_full_0_ARCACHE,
  output [2:0]  execute_stealSide_vss_axi_full_0_ARPROT,
  output [3:0]  execute_stealSide_vss_axi_full_0_ARQOS,
  output [3:0]  execute_stealSide_vss_axi_full_0_ARREGION,
  output        execute_stealSide_vss_axi_full_0_RREADY,
  input         execute_stealSide_vss_axi_full_0_RVALID,
  input  [3:0]  execute_stealSide_vss_axi_full_0_RID,
  input  [63:0] execute_stealSide_vss_axi_full_0_RDATA,
  input  [1:0]  execute_stealSide_vss_axi_full_0_RRESP,
  input         execute_stealSide_vss_axi_full_0_RLAST,
  input         execute_stealSide_vss_axi_full_0_AWREADY,
  output        execute_stealSide_vss_axi_full_0_AWVALID,
  output [3:0]  execute_stealSide_vss_axi_full_0_AWID,
  output [63:0] execute_stealSide_vss_axi_full_0_AWADDR,
  output [7:0]  execute_stealSide_vss_axi_full_0_AWLEN,
  output [2:0]  execute_stealSide_vss_axi_full_0_AWSIZE,
  output [1:0]  execute_stealSide_vss_axi_full_0_AWBURST,
  output        execute_stealSide_vss_axi_full_0_AWLOCK,
  output [3:0]  execute_stealSide_vss_axi_full_0_AWCACHE,
  output [2:0]  execute_stealSide_vss_axi_full_0_AWPROT,
  output [3:0]  execute_stealSide_vss_axi_full_0_AWQOS,
  output [3:0]  execute_stealSide_vss_axi_full_0_AWREGION,
  input         execute_stealSide_vss_axi_full_0_WREADY,
  output        execute_stealSide_vss_axi_full_0_WVALID,
  output [3:0]  execute_stealSide_vss_axi_full_0_WID,
  output [63:0] execute_stealSide_vss_axi_full_0_WDATA,
  output [7:0]  execute_stealSide_vss_axi_full_0_WSTRB,
  output        execute_stealSide_vss_axi_full_0_WLAST,
  output        execute_stealSide_vss_axi_full_0_BREADY,
  input         execute_stealSide_vss_axi_full_0_BVALID,
  input  [3:0]  execute_stealSide_vss_axi_full_0_BID,
  input  [1:0]  execute_stealSide_vss_axi_full_0_BRESP,
  input         execute_stealSide_taskOut_0_TREADY,
  output        execute_stealSide_taskOut_0_TVALID,
  output [63:0] execute_stealSide_taskOut_0_TDATA,
  input         execute_stealSide_taskOut_1_TREADY,
  output        execute_stealSide_taskOut_1_TVALID,
  output [63:0] execute_stealSide_taskOut_1_TDATA,
  input         execute_stealSide_taskOut_2_TREADY,
  output        execute_stealSide_taskOut_2_TVALID,
  output [63:0] execute_stealSide_taskOut_2_TDATA,
  input         execute_stealSide_taskOut_3_TREADY,
  output        execute_stealSide_taskOut_3_TVALID,
  output [63:0] execute_stealSide_taskOut_3_TDATA,
  output        execute_stealSide_taskIn_0_TREADY,
  input         execute_stealSide_taskIn_0_TVALID,
  input  [63:0] execute_stealSide_taskIn_0_TDATA,
  output        execute_stealSide_taskIn_1_TREADY,
  input         execute_stealSide_taskIn_1_TVALID,
  input  [63:0] execute_stealSide_taskIn_1_TDATA,
  output        execute_stealSide_taskIn_2_TREADY,
  input         execute_stealSide_taskIn_2_TVALID,
  input  [63:0] execute_stealSide_taskIn_2_TDATA,
  output        execute_stealSide_taskIn_3_TREADY,
  input         execute_stealSide_taskIn_3_TVALID,
  input  [63:0] execute_stealSide_taskIn_3_TDATA
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
  wire [63:0] stealSide_io_vss_axi_full_0_RDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 228:29]
  wire [7:0] stealSide_io_vss_axi_full_0_AWLEN; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_WLAST; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_vss_axi_full_0_BVALID; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_0_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_0_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskOut_0_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_1_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_1_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskOut_1_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_2_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_2_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskOut_2_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_3_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskOut_3_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskOut_3_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_0_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_0_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskIn_0_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_1_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_1_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskIn_1_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_2_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_2_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskIn_2_TDATA; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_3_TREADY; // @[fullSysGen.scala 228:29]
  wire  stealSide_io_taskIn_3_TVALID; // @[fullSysGen.scala 228:29]
  wire [63:0] stealSide_io_taskIn_3_TDATA; // @[fullSysGen.scala 228:29]
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
    .io_taskIn_3_TDATA(stealSide_io_taskIn_3_TDATA)
  );
  assign execute_stealSide_axi_mgmt_vss_0_ARREADY = stealSide_io_axi_mgmt_vss_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_axi_mgmt_vss_0_RVALID = stealSide_io_axi_mgmt_vss_0_RVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_axi_mgmt_vss_0_RDATA = stealSide_io_axi_mgmt_vss_0_RDATA; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_axi_mgmt_vss_0_RRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_axi_mgmt_vss_0_AWREADY = stealSide_io_axi_mgmt_vss_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_axi_mgmt_vss_0_WREADY = stealSide_io_axi_mgmt_vss_0_WREADY; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_axi_mgmt_vss_0_BVALID = stealSide_io_axi_mgmt_vss_0_BVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_axi_mgmt_vss_0_BRESP = 2'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARVALID = stealSide_io_vss_axi_full_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARID = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARADDR = stealSide_io_vss_axi_full_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARLEN = stealSide_io_vss_axi_full_0_ARLEN; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARSIZE = 3'h3; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_ARREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_RREADY = stealSide_io_vss_axi_full_0_RREADY; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWVALID = stealSide_io_vss_axi_full_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWID = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWADDR = stealSide_io_vss_axi_full_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWLEN = stealSide_io_vss_axi_full_0_AWLEN; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWSIZE = 3'h3; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWBURST = 2'h1; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWLOCK = 1'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWCACHE = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWPROT = 3'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWQOS = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_AWREGION = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_WVALID = stealSide_io_vss_axi_full_0_WVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_WID = 4'h0; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_WDATA = stealSide_io_vss_axi_full_0_WDATA; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_WSTRB = 8'hff; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_WLAST = stealSide_io_vss_axi_full_0_WLAST; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_vss_axi_full_0_BREADY = 1'h1; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_0_TVALID = stealSide_io_taskOut_0_TVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_0_TDATA = stealSide_io_taskOut_0_TDATA; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_1_TVALID = stealSide_io_taskOut_1_TVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_1_TDATA = stealSide_io_taskOut_1_TDATA; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_2_TVALID = stealSide_io_taskOut_2_TVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_2_TDATA = stealSide_io_taskOut_2_TDATA; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_3_TVALID = stealSide_io_taskOut_3_TVALID; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskOut_3_TDATA = stealSide_io_taskOut_3_TDATA; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskIn_0_TREADY = stealSide_io_taskIn_0_TREADY; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskIn_1_TREADY = stealSide_io_taskIn_1_TREADY; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskIn_2_TREADY = stealSide_io_taskIn_2_TREADY; // @[fullSysGen.scala 246:23]
  assign execute_stealSide_taskIn_3_TREADY = stealSide_io_taskIn_3_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_clock = clock;
  assign stealSide_reset = reset;
  assign stealSide_io_axi_mgmt_vss_0_ARVALID = execute_stealSide_axi_mgmt_vss_0_ARVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_ARADDR = execute_stealSide_axi_mgmt_vss_0_ARADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_RREADY = execute_stealSide_axi_mgmt_vss_0_RREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_AWVALID = execute_stealSide_axi_mgmt_vss_0_AWVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_AWADDR = execute_stealSide_axi_mgmt_vss_0_AWADDR; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WVALID = execute_stealSide_axi_mgmt_vss_0_WVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WDATA = execute_stealSide_axi_mgmt_vss_0_WDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_WSTRB = execute_stealSide_axi_mgmt_vss_0_WSTRB; // @[fullSysGen.scala 246:23]
  assign stealSide_io_axi_mgmt_vss_0_BREADY = execute_stealSide_axi_mgmt_vss_0_BREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_ARREADY = execute_stealSide_vss_axi_full_0_ARREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_RVALID = execute_stealSide_vss_axi_full_0_RVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_RDATA = execute_stealSide_vss_axi_full_0_RDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_AWREADY = execute_stealSide_vss_axi_full_0_AWREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_WREADY = execute_stealSide_vss_axi_full_0_WREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_vss_axi_full_0_BVALID = execute_stealSide_vss_axi_full_0_BVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_0_TREADY = execute_stealSide_taskOut_0_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_1_TREADY = execute_stealSide_taskOut_1_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_2_TREADY = execute_stealSide_taskOut_2_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskOut_3_TREADY = execute_stealSide_taskOut_3_TREADY; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_0_TVALID = execute_stealSide_taskIn_0_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_0_TDATA = execute_stealSide_taskIn_0_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_1_TVALID = execute_stealSide_taskIn_1_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_1_TDATA = execute_stealSide_taskIn_1_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_2_TVALID = execute_stealSide_taskIn_2_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_2_TDATA = execute_stealSide_taskIn_2_TDATA; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_3_TVALID = execute_stealSide_taskIn_3_TVALID; // @[fullSysGen.scala 246:23]
  assign stealSide_io_taskIn_3_TDATA = execute_stealSide_taskIn_3_TDATA; // @[fullSysGen.scala 246:23]
endmodule
