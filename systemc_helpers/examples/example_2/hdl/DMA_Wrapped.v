module Queue(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [6:0] io_enq_bits_addr,
  input        io_deq_ready,
  output       io_deq_valid,
  output [6:0] io_deq_bits_addr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [6:0] ram_addr [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [6:0] ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [6:0] ram_addr_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_addr_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_addr_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_addr_MPORT_en; // @[Decoupled.scala 275:95]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 280:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  assign ram_addr_io_deq_bits_MPORT_en = 1'h1;
  assign ram_addr_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_addr_io_deq_bits_MPORT_data = ram_addr[ram_addr_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_addr_MPORT_data = io_enq_bits_addr;
  assign ram_addr_MPORT_addr = 1'h0;
  assign ram_addr_MPORT_mask = 1'h1;
  assign ram_addr_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_addr = ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_addr_MPORT_en & ram_addr_MPORT_mask) begin
      ram_addr[ram_addr_MPORT_addr] <= ram_addr_MPORT_data; // @[Decoupled.scala 275:95]
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_addr[initvar] = _RAND_0[6:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_1(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [63:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [63:0] io_deq_bits_data,
  output [1:0]  io_deq_bits_resp
);
`ifdef RANDOMIZE_MEM_INIT
  reg [63:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram_data [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_data_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 275:95]
  reg [1:0] ram_resp [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_resp_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_resp_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [1:0] ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_resp_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_resp_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_resp_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_resp_MPORT_en; // @[Decoupled.scala 275:95]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 280:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = 1'h0;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_resp_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_resp_io_deq_bits_MPORT_data = ram_resp[ram_resp_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_resp_MPORT_data = 2'h0;
  assign ram_resp_MPORT_addr = 1'h0;
  assign ram_resp_MPORT_mask = 1'h1;
  assign ram_resp_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_data = ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  assign io_deq_bits_resp = ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_data_MPORT_en & ram_data_MPORT_mask) begin
      ram_data[ram_data_MPORT_addr] <= ram_data_MPORT_data; // @[Decoupled.scala 275:95]
    end
    if (ram_resp_MPORT_en & ram_resp_MPORT_mask) begin
      ram_resp[ram_resp_MPORT_addr] <= ram_resp_MPORT_data; // @[Decoupled.scala 275:95]
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_resp[initvar] = _RAND_1[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  maybe_full = _RAND_2[0:0];
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
`endif // RANDOMIZE_REG_INIT
  reg [63:0] ram_data [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [63:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [63:0] ram_data_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 275:95]
  reg [7:0] ram_strb [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_strb_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_strb_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [7:0] ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [7:0] ram_strb_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_strb_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_strb_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_strb_MPORT_en; // @[Decoupled.scala 275:95]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 280:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  assign ram_data_io_deq_bits_MPORT_en = 1'h1;
  assign ram_data_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_data_io_deq_bits_MPORT_data = ram_data[ram_data_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_data_MPORT_data = io_enq_bits_data;
  assign ram_data_MPORT_addr = 1'h0;
  assign ram_data_MPORT_mask = 1'h1;
  assign ram_data_MPORT_en = io_enq_ready & io_enq_valid;
  assign ram_strb_io_deq_bits_MPORT_en = 1'h1;
  assign ram_strb_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_strb_io_deq_bits_MPORT_data = ram_strb[ram_strb_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_strb_MPORT_data = io_enq_bits_strb;
  assign ram_strb_MPORT_addr = 1'h0;
  assign ram_strb_MPORT_mask = 1'h1;
  assign ram_strb_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 305:19]
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[63:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_strb[initvar] = _RAND_1[7:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  maybe_full = _RAND_2[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module Queue_4(
  input        clock,
  input        reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input        io_deq_ready,
  output       io_deq_valid,
  output [1:0] io_deq_bits_resp
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [1:0] ram_resp [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_resp_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_resp_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [1:0] ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [1:0] ram_resp_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_resp_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_resp_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_resp_MPORT_en; // @[Decoupled.scala 275:95]
  reg  maybe_full; // @[Decoupled.scala 278:27]
  wire  empty = ~maybe_full; // @[Decoupled.scala 280:28]
  wire  do_enq = io_enq_ready & io_enq_valid; // @[Decoupled.scala 52:35]
  wire  do_deq = io_deq_ready & io_deq_valid; // @[Decoupled.scala 52:35]
  assign ram_resp_io_deq_bits_MPORT_en = 1'h1;
  assign ram_resp_io_deq_bits_MPORT_addr = 1'h0;
  assign ram_resp_io_deq_bits_MPORT_data = ram_resp[ram_resp_io_deq_bits_MPORT_addr]; // @[Decoupled.scala 275:95]
  assign ram_resp_MPORT_data = 2'h0;
  assign ram_resp_MPORT_addr = 1'h0;
  assign ram_resp_MPORT_mask = 1'h1;
  assign ram_resp_MPORT_en = io_enq_ready & io_enq_valid;
  assign io_enq_ready = ~maybe_full; // @[Decoupled.scala 305:19]
  assign io_deq_valid = ~empty; // @[Decoupled.scala 304:19]
  assign io_deq_bits_resp = ram_resp_io_deq_bits_MPORT_data; // @[Decoupled.scala 312:17]
  always @(posedge clock) begin
    if (ram_resp_MPORT_en & ram_resp_MPORT_mask) begin
      ram_resp[ram_resp_MPORT_addr] <= ram_resp_MPORT_data; // @[Decoupled.scala 275:95]
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
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_resp[initvar] = _RAND_0[1:0];
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  maybe_full = _RAND_1[0:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DMA(
  input         clock,
  input         reset,
  output        s_axi_ar_ready,
  input         s_axi_ar_valid,
  input  [6:0]  s_axi_ar_bits_addr,
  input         s_axi_r_ready,
  output        s_axi_r_valid,
  output [63:0] s_axi_r_bits_data,
  output [1:0]  s_axi_r_bits_resp,
  output        s_axi_aw_ready,
  input         s_axi_aw_valid,
  input  [6:0]  s_axi_aw_bits_addr,
  output        s_axi_w_ready,
  input         s_axi_w_valid,
  input  [63:0] s_axi_w_bits_data,
  input  [7:0]  s_axi_w_bits_strb,
  input         s_axi_b_ready,
  output        s_axi_b_valid,
  output [1:0]  s_axi_b_bits_resp,
  input         m_axi_ar_ready,
  output        m_axi_ar_valid,
  output [31:0] m_axi_ar_bits_addr,
  output        m_axi_r_ready,
  input         m_axi_r_valid,
  input  [63:0] m_axi_r_bits_data,
  input         m_axi_aw_ready,
  output        m_axi_aw_valid,
  output [31:0] m_axi_aw_bits_addr,
  input         m_axi_w_ready,
  output        m_axi_w_valid,
  output [63:0] m_axi_w_bits_data
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [63:0] _RAND_1;
  reg [63:0] _RAND_2;
  reg [63:0] _RAND_3;
  reg [31:0] _RAND_4;
  reg [31:0] _RAND_5;
  reg [63:0] _RAND_6;
  reg [63:0] _RAND_7;
`endif // RANDOMIZE_REG_INIT
  wire  regBlock_rdReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [6:0] regBlock_rdReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [6:0] regBlock_rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_rdRespQueue__clock; // @[RegisterBlock.scala 166:36]
  wire  regBlock_rdRespQueue__reset; // @[RegisterBlock.scala 166:36]
  wire  regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 166:36]
  wire  regBlock_rdRespQueue__io_enq_valid; // @[RegisterBlock.scala 166:36]
  wire [63:0] regBlock_rdRespQueue__io_enq_bits_data; // @[RegisterBlock.scala 166:36]
  wire  regBlock_rdRespQueue__io_deq_ready; // @[RegisterBlock.scala 166:36]
  wire  regBlock_rdRespQueue__io_deq_valid; // @[RegisterBlock.scala 166:36]
  wire [63:0] regBlock_rdRespQueue__io_deq_bits_data; // @[RegisterBlock.scala 166:36]
  wire [1:0] regBlock_rdRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 166:36]
  wire  regBlock_wrReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [6:0] regBlock_wrReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [6:0] regBlock_wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_clock; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_reset; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] regBlock_wrReqData__deq_io_enq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] regBlock_wrReqData__deq_io_enq_bits_strb; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [63:0] regBlock_wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 377:21]
  wire [7:0] regBlock_wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 377:21]
  wire  regBlock_wrRespQueue__clock; // @[RegisterBlock.scala 174:36]
  wire  regBlock_wrRespQueue__reset; // @[RegisterBlock.scala 174:36]
  wire  regBlock_wrRespQueue__io_enq_ready; // @[RegisterBlock.scala 174:36]
  wire  regBlock_wrRespQueue__io_enq_valid; // @[RegisterBlock.scala 174:36]
  wire  regBlock_wrRespQueue__io_deq_ready; // @[RegisterBlock.scala 174:36]
  wire  regBlock_wrRespQueue__io_deq_valid; // @[RegisterBlock.scala 174:36]
  wire [1:0] regBlock_wrRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 174:36]
  wire  regBlock_rdReq__valid = regBlock_rdReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  regBlock_rdReq = regBlock_rdReq__valid & regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 220:44]
  wire [6:0] regBlock_rdReq__bits_addr = regBlock_rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [6:0] regBlock_rdAddr = regBlock_rdReq__bits_addr & 7'h78; // @[RegisterBlock.scala 222:48]
  wire  regBlock_wrReq__valid = regBlock_wrReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  regBlock_wrReqData__valid = regBlock_wrReqData__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  regBlock_wrReq = regBlock_wrReq__valid & regBlock_wrReqData__valid & regBlock_wrRespQueue__io_enq_ready; // @[RegisterBlock.scala 249:63]
  wire [6:0] regBlock_wrReq__bits_addr = regBlock_wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [6:0] regBlock_wrAddr = regBlock_wrReq__bits_addr & 7'h78; // @[RegisterBlock.scala 251:48]
  reg  status_; // @[DMA.scala 40:32]
  reg [63:0] source_; // @[DMA.scala 43:32]
  reg [63:0] destination_; // @[DMA.scala 46:37]
  reg [63:0] length_; // @[DMA.scala 49:32]
  reg [31:0] currentSource_; // @[DMA.scala 52:35]
  reg [31:0] currentDestination_; // @[DMA.scala 53:40]
  reg [63:0] currentRLength_; // @[DMA.scala 54:40]
  reg [63:0] currentWLength_; // @[DMA.scala 55:40]
  wire  paused = ~status_; // @[DMA.scala 63:24]
  wire [63:0] _GEN_0 = regBlock_wrAddr == 7'h0 ? source_ : {{32'd0}, currentSource_}; // @[DMA.scala 67:45 68:24 52:35]
  wire [63:0] _GEN_1 = regBlock_wrAddr == 7'h0 ? destination_ : {{32'd0}, currentDestination_}; // @[DMA.scala 67:45 69:29 53:40]
  wire [63:0] _GEN_2 = regBlock_wrAddr == 7'h0 ? length_ : currentRLength_; // @[DMA.scala 67:45 70:25 54:40]
  wire [63:0] _GEN_3 = regBlock_wrAddr == 7'h0 ? length_ : currentWLength_; // @[DMA.scala 67:45 71:25 55:40]
  wire  _GEN_4 = regBlock_wrAddr == 7'h0 | status_; // @[DMA.scala 67:45 72:17 40:32]
  wire [7:0] regBlock_wrReqData__bits_strb = regBlock_wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 417:19 418:14]
  wire [63:0] regBlock_wrReqData__bits_data = regBlock_wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 417:19 418:14]
  wire [7:0] command__byte_wdata = regBlock_wrReqData__bits_data[7:0]; // @[Interface.scala 263:33]
  wire [7:0] command__byte_wdata_1 = regBlock_wrReqData__bits_data[15:8]; // @[Interface.scala 263:33]
  wire [7:0] command__byte_wdata_2 = regBlock_wrReqData__bits_data[23:16]; // @[Interface.scala 263:33]
  wire [7:0] command__byte_wdata_3 = regBlock_wrReqData__bits_data[31:24]; // @[Interface.scala 263:33]
  wire [7:0] command__byte_wdata_4 = regBlock_wrReqData__bits_data[39:32]; // @[Interface.scala 263:33]
  wire [7:0] command__byte_wdata_5 = regBlock_wrReqData__bits_data[47:40]; // @[Interface.scala 263:33]
  wire [7:0] command__byte_wdata_6 = regBlock_wrReqData__bits_data[55:48]; // @[Interface.scala 263:33]
  wire [7:0] command__byte_wdata_7 = regBlock_wrReqData__bits_data[63:56]; // @[Interface.scala 263:33]
  wire [7:0] source__byte_original = source_[7:0]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_8 = regBlock_wrReqData__bits_strb[0] ? command__byte_wdata : source__byte_original; // @[Interface.scala 265:14]
  wire [7:0] source__byte_original_1 = source_[15:8]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_9 = regBlock_wrReqData__bits_strb[1] ? command__byte_wdata_1 : source__byte_original_1; // @[Interface.scala 265:14]
  wire [7:0] source__byte_original_2 = source_[23:16]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_10 = regBlock_wrReqData__bits_strb[2] ? command__byte_wdata_2 : source__byte_original_2; // @[Interface.scala 265:14]
  wire [7:0] source__byte_original_3 = source_[31:24]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_11 = regBlock_wrReqData__bits_strb[3] ? command__byte_wdata_3 : source__byte_original_3; // @[Interface.scala 265:14]
  wire [7:0] source__byte_original_4 = source_[39:32]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_12 = regBlock_wrReqData__bits_strb[4] ? command__byte_wdata_4 : source__byte_original_4; // @[Interface.scala 265:14]
  wire [7:0] source__byte_original_5 = source_[47:40]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_13 = regBlock_wrReqData__bits_strb[5] ? command__byte_wdata_5 : source__byte_original_5; // @[Interface.scala 265:14]
  wire [7:0] source__byte_original_6 = source_[55:48]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_14 = regBlock_wrReqData__bits_strb[6] ? command__byte_wdata_6 : source__byte_original_6; // @[Interface.scala 265:14]
  wire [7:0] source__byte_original_7 = source_[63:56]; // @[Interface.scala 264:39]
  wire [7:0] _source__T_15 = regBlock_wrReqData__bits_strb[7] ? command__byte_wdata_7 : source__byte_original_7; // @[Interface.scala 265:14]
  wire [63:0] _source__T_16 = {_source__T_15,_source__T_14,_source__T_13,_source__T_12,_source__T_11,_source__T_10,
    _source__T_9,_source__T_8}; // @[Interface.scala 268:7]
  wire [7:0] destination__byte_original = destination_[7:0]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_8 = regBlock_wrReqData__bits_strb[0] ? command__byte_wdata : destination__byte_original; // @[Interface.scala 265:14]
  wire [7:0] destination__byte_original_1 = destination_[15:8]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_9 = regBlock_wrReqData__bits_strb[1] ? command__byte_wdata_1 : destination__byte_original_1
    ; // @[Interface.scala 265:14]
  wire [7:0] destination__byte_original_2 = destination_[23:16]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_10 = regBlock_wrReqData__bits_strb[2] ? command__byte_wdata_2 :
    destination__byte_original_2; // @[Interface.scala 265:14]
  wire [7:0] destination__byte_original_3 = destination_[31:24]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_11 = regBlock_wrReqData__bits_strb[3] ? command__byte_wdata_3 :
    destination__byte_original_3; // @[Interface.scala 265:14]
  wire [7:0] destination__byte_original_4 = destination_[39:32]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_12 = regBlock_wrReqData__bits_strb[4] ? command__byte_wdata_4 :
    destination__byte_original_4; // @[Interface.scala 265:14]
  wire [7:0] destination__byte_original_5 = destination_[47:40]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_13 = regBlock_wrReqData__bits_strb[5] ? command__byte_wdata_5 :
    destination__byte_original_5; // @[Interface.scala 265:14]
  wire [7:0] destination__byte_original_6 = destination_[55:48]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_14 = regBlock_wrReqData__bits_strb[6] ? command__byte_wdata_6 :
    destination__byte_original_6; // @[Interface.scala 265:14]
  wire [7:0] destination__byte_original_7 = destination_[63:56]; // @[Interface.scala 264:39]
  wire [7:0] _destination__T_15 = regBlock_wrReqData__bits_strb[7] ? command__byte_wdata_7 :
    destination__byte_original_7; // @[Interface.scala 265:14]
  wire [63:0] _destination__T_16 = {_destination__T_15,_destination__T_14,_destination__T_13,_destination__T_12,
    _destination__T_11,_destination__T_10,_destination__T_9,_destination__T_8}; // @[Interface.scala 268:7]
  wire [7:0] length__byte_original = length_[7:0]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_8 = regBlock_wrReqData__bits_strb[0] ? command__byte_wdata : length__byte_original; // @[Interface.scala 265:14]
  wire [7:0] length__byte_original_1 = length_[15:8]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_9 = regBlock_wrReqData__bits_strb[1] ? command__byte_wdata_1 : length__byte_original_1; // @[Interface.scala 265:14]
  wire [7:0] length__byte_original_2 = length_[23:16]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_10 = regBlock_wrReqData__bits_strb[2] ? command__byte_wdata_2 : length__byte_original_2; // @[Interface.scala 265:14]
  wire [7:0] length__byte_original_3 = length_[31:24]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_11 = regBlock_wrReqData__bits_strb[3] ? command__byte_wdata_3 : length__byte_original_3; // @[Interface.scala 265:14]
  wire [7:0] length__byte_original_4 = length_[39:32]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_12 = regBlock_wrReqData__bits_strb[4] ? command__byte_wdata_4 : length__byte_original_4; // @[Interface.scala 265:14]
  wire [7:0] length__byte_original_5 = length_[47:40]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_13 = regBlock_wrReqData__bits_strb[5] ? command__byte_wdata_5 : length__byte_original_5; // @[Interface.scala 265:14]
  wire [7:0] length__byte_original_6 = length_[55:48]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_14 = regBlock_wrReqData__bits_strb[6] ? command__byte_wdata_6 : length__byte_original_6; // @[Interface.scala 265:14]
  wire [7:0] length__byte_original_7 = length_[63:56]; // @[Interface.scala 264:39]
  wire [7:0] _length__T_15 = regBlock_wrReqData__bits_strb[7] ? command__byte_wdata_7 : length__byte_original_7; // @[Interface.scala 265:14]
  wire [63:0] _length__T_16 = {_length__T_15,_length__T_14,_length__T_13,_length__T_12,_length__T_11,_length__T_10,
    _length__T_9,_length__T_8}; // @[Interface.scala 268:7]
  wire  _T_7 = ~reset; // @[RegisterBlock.scala 208:11]
  wire [63:0] _GEN_9 = paused ? _GEN_0 : {{32'd0}, currentSource_}; // @[DMA.scala 66:18 52:35]
  wire [63:0] _GEN_10 = paused ? _GEN_1 : {{32'd0}, currentDestination_}; // @[DMA.scala 66:18 53:40]
  wire [63:0] _GEN_11 = paused ? _GEN_2 : currentRLength_; // @[DMA.scala 66:18 54:40]
  wire [63:0] _GEN_12 = paused ? _GEN_3 : currentWLength_; // @[DMA.scala 66:18 55:40]
  wire  _GEN_13 = paused ? _GEN_4 : status_; // @[DMA.scala 66:18 40:32]
  wire [63:0] _GEN_20 = regBlock_wrReq ? _GEN_9 : {{32'd0}, currentSource_}; // @[DMA.scala 65:25 52:35]
  wire [63:0] _GEN_21 = regBlock_wrReq ? _GEN_10 : {{32'd0}, currentDestination_}; // @[DMA.scala 65:25 53:40]
  wire [63:0] _GEN_22 = regBlock_wrReq ? _GEN_11 : currentRLength_; // @[DMA.scala 65:25 54:40]
  wire [63:0] _GEN_23 = regBlock_wrReq ? _GEN_12 : currentWLength_; // @[DMA.scala 65:25 55:40]
  wire  _GEN_24 = regBlock_wrReq ? _GEN_13 : status_; // @[DMA.scala 65:25 40:32]
  wire  regBlock_wrReq__ready = regBlock_wrReq & paused; // @[DMA.scala 65:25 Decoupled.scala 90:20]
  wire [63:0] _GEN_32 = 7'h8 == regBlock_rdAddr ? {{63'd0}, status_} : 64'hffffffffffffffff; // @[RegisterBlock.scala 232:38 233:16]
  wire [63:0] _GEN_33 = 7'h10 == regBlock_rdAddr ? source_ : _GEN_32; // @[RegisterBlock.scala 232:38 233:16]
  wire [63:0] _GEN_34 = 7'h18 == regBlock_rdAddr ? destination_ : _GEN_33; // @[RegisterBlock.scala 232:38 233:16]
  wire [31:0] _currentSource__T_1 = currentSource_ + 32'h4; // @[DMA.scala 98:40]
  wire [63:0] _currentRLength__T_1 = currentRLength_ - 64'h1; // @[DMA.scala 99:42]
  wire [63:0] _GEN_39 = m_axi_ar_ready & currentRLength_ != 64'h0 ? {{32'd0}, _currentSource__T_1} : _GEN_20; // @[DMA.scala 97:52 98:22]
  wire [31:0] _currentDestination__T_1 = currentDestination_ + 32'h4; // @[DMA.scala 109:50]
  wire [63:0] _currentWLength__T_1 = currentWLength_ - 64'h1; // @[DMA.scala 110:42]
  wire [63:0] _GEN_41 = m_axi_aw_ready & currentWLength_ != 64'h0 ? {{32'd0}, _currentDestination__T_1} : _GEN_21; // @[DMA.scala 108:52 109:27]
  wire  _T_22 = m_axi_r_valid & m_axi_w_ready; // @[DMA.scala 113:24]
  wire [63:0] _GEN_51 = ~paused ? _GEN_39 : _GEN_20; // @[DMA.scala 90:17]
  wire [63:0] _GEN_55 = ~paused ? _GEN_41 : _GEN_21; // @[DMA.scala 90:17]
  Queue regBlock_rdReq__deq ( // @[Decoupled.scala 377:21]
    .clock(regBlock_rdReq__deq_clock),
    .reset(regBlock_rdReq__deq_reset),
    .io_enq_ready(regBlock_rdReq__deq_io_enq_ready),
    .io_enq_valid(regBlock_rdReq__deq_io_enq_valid),
    .io_enq_bits_addr(regBlock_rdReq__deq_io_enq_bits_addr),
    .io_deq_ready(regBlock_rdReq__deq_io_deq_ready),
    .io_deq_valid(regBlock_rdReq__deq_io_deq_valid),
    .io_deq_bits_addr(regBlock_rdReq__deq_io_deq_bits_addr)
  );
  Queue_1 regBlock_rdRespQueue_ ( // @[RegisterBlock.scala 166:36]
    .clock(regBlock_rdRespQueue__clock),
    .reset(regBlock_rdRespQueue__reset),
    .io_enq_ready(regBlock_rdRespQueue__io_enq_ready),
    .io_enq_valid(regBlock_rdRespQueue__io_enq_valid),
    .io_enq_bits_data(regBlock_rdRespQueue__io_enq_bits_data),
    .io_deq_ready(regBlock_rdRespQueue__io_deq_ready),
    .io_deq_valid(regBlock_rdRespQueue__io_deq_valid),
    .io_deq_bits_data(regBlock_rdRespQueue__io_deq_bits_data),
    .io_deq_bits_resp(regBlock_rdRespQueue__io_deq_bits_resp)
  );
  Queue regBlock_wrReq__deq ( // @[Decoupled.scala 377:21]
    .clock(regBlock_wrReq__deq_clock),
    .reset(regBlock_wrReq__deq_reset),
    .io_enq_ready(regBlock_wrReq__deq_io_enq_ready),
    .io_enq_valid(regBlock_wrReq__deq_io_enq_valid),
    .io_enq_bits_addr(regBlock_wrReq__deq_io_enq_bits_addr),
    .io_deq_ready(regBlock_wrReq__deq_io_deq_ready),
    .io_deq_valid(regBlock_wrReq__deq_io_deq_valid),
    .io_deq_bits_addr(regBlock_wrReq__deq_io_deq_bits_addr)
  );
  Queue_3 regBlock_wrReqData__deq ( // @[Decoupled.scala 377:21]
    .clock(regBlock_wrReqData__deq_clock),
    .reset(regBlock_wrReqData__deq_reset),
    .io_enq_ready(regBlock_wrReqData__deq_io_enq_ready),
    .io_enq_valid(regBlock_wrReqData__deq_io_enq_valid),
    .io_enq_bits_data(regBlock_wrReqData__deq_io_enq_bits_data),
    .io_enq_bits_strb(regBlock_wrReqData__deq_io_enq_bits_strb),
    .io_deq_ready(regBlock_wrReqData__deq_io_deq_ready),
    .io_deq_valid(regBlock_wrReqData__deq_io_deq_valid),
    .io_deq_bits_data(regBlock_wrReqData__deq_io_deq_bits_data),
    .io_deq_bits_strb(regBlock_wrReqData__deq_io_deq_bits_strb)
  );
  Queue_4 regBlock_wrRespQueue_ ( // @[RegisterBlock.scala 174:36]
    .clock(regBlock_wrRespQueue__clock),
    .reset(regBlock_wrRespQueue__reset),
    .io_enq_ready(regBlock_wrRespQueue__io_enq_ready),
    .io_enq_valid(regBlock_wrRespQueue__io_enq_valid),
    .io_deq_ready(regBlock_wrRespQueue__io_deq_ready),
    .io_deq_valid(regBlock_wrRespQueue__io_deq_valid),
    .io_deq_bits_resp(regBlock_wrRespQueue__io_deq_bits_resp)
  );
  assign s_axi_ar_ready = regBlock_rdReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 59:20]
  assign s_axi_r_valid = regBlock_rdRespQueue__io_deq_valid; // @[RegisterBlock.scala 168:12 59:20]
  assign s_axi_r_bits_data = regBlock_rdRespQueue__io_deq_bits_data; // @[RegisterBlock.scala 168:12 59:20]
  assign s_axi_r_bits_resp = regBlock_rdRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 168:12 59:20]
  assign s_axi_aw_ready = regBlock_wrReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 59:20]
  assign s_axi_w_ready = regBlock_wrReqData__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 59:20]
  assign s_axi_b_valid = regBlock_wrRespQueue__io_deq_valid; // @[RegisterBlock.scala 176:12 59:20]
  assign s_axi_b_bits_resp = regBlock_wrRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 176:12 59:20]
  assign m_axi_ar_valid = ~paused; // @[DMA.scala 90:8]
  assign m_axi_ar_bits_addr = currentSource_; // @[DMA.scala 92:20 93:15]
  assign m_axi_r_ready = ~paused & _T_22; // @[DMA.scala 90:17 Decoupled.scala 90:20]
  assign m_axi_aw_valid = ~paused; // @[DMA.scala 90:8]
  assign m_axi_aw_bits_addr = currentDestination_; // @[DMA.scala 103:20 104:15]
  assign m_axi_w_valid = ~paused & _T_22; // @[DMA.scala 90:17 Decoupled.scala 90:20]
  assign m_axi_w_bits_data = m_axi_r_bits_data; // @[DMA.scala 115:22 116:17]
  assign regBlock_rdReq__deq_clock = clock;
  assign regBlock_rdReq__deq_reset = reset;
  assign regBlock_rdReq__deq_io_enq_valid = s_axi_ar_valid; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_rdReq__deq_io_enq_bits_addr = s_axi_ar_bits_addr; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_rdReq__deq_io_deq_ready = regBlock_rdReq__valid & regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 220:44]
  assign regBlock_rdRespQueue__clock = clock;
  assign regBlock_rdRespQueue__reset = reset;
  assign regBlock_rdRespQueue__io_enq_valid = regBlock_rdReq__valid & regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 220:44]
  assign regBlock_rdRespQueue__io_enq_bits_data = 7'h20 == regBlock_rdAddr ? length_ : _GEN_34; // @[RegisterBlock.scala 232:38 233:16]
  assign regBlock_rdRespQueue__io_deq_ready = s_axi_r_ready; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_wrReq__deq_clock = clock;
  assign regBlock_wrReq__deq_reset = reset;
  assign regBlock_wrReq__deq_io_enq_valid = s_axi_aw_valid; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_wrReq__deq_io_enq_bits_addr = s_axi_aw_bits_addr; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_wrReq__deq_io_deq_ready = regBlock_wrReq & paused; // @[DMA.scala 65:25 Decoupled.scala 90:20]
  assign regBlock_wrReqData__deq_clock = clock;
  assign regBlock_wrReqData__deq_reset = reset;
  assign regBlock_wrReqData__deq_io_enq_valid = s_axi_w_valid; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_wrReqData__deq_io_enq_bits_data = s_axi_w_bits_data; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_wrReqData__deq_io_enq_bits_strb = s_axi_w_bits_strb; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  assign regBlock_wrReqData__deq_io_deq_ready = regBlock_wrReq & paused; // @[DMA.scala 65:25 Decoupled.scala 90:20]
  assign regBlock_wrRespQueue__clock = clock;
  assign regBlock_wrRespQueue__reset = reset;
  assign regBlock_wrRespQueue__io_enq_valid = regBlock_wrReq & paused; // @[DMA.scala 65:25 Decoupled.scala 90:20]
  assign regBlock_wrRespQueue__io_deq_ready = s_axi_b_ready; // @[RegisterBlock.scala 59:20 DMA.scala 31:9]
  always @(posedge clock) begin
    if (reset) begin // @[DMA.scala 40:32]
      status_ <= 1'h0; // @[DMA.scala 40:32]
    end else if (~paused) begin // @[DMA.scala 90:17]
      if (m_axi_r_valid & m_axi_w_ready) begin // @[DMA.scala 113:41]
        if (currentRLength_ == 64'h0 & currentWLength_ == 64'h0) begin // @[DMA.scala 121:63]
          status_ <= 1'h0; // @[DMA.scala 122:17]
        end else begin
          status_ <= _GEN_24;
        end
      end else begin
        status_ <= _GEN_24;
      end
    end else begin
      status_ <= _GEN_24;
    end
    if (reset) begin // @[DMA.scala 43:32]
      source_ <= 64'h0; // @[DMA.scala 43:32]
    end else if (regBlock_wrReq) begin // @[DMA.scala 65:25]
      if (paused) begin // @[DMA.scala 66:18]
        if (7'h10 == regBlock_wrAddr) begin // @[RegisterBlock.scala 260:38]
          source_ <= _source__T_16; // @[RegisterBlock.scala 118:11]
        end
      end
    end
    if (reset) begin // @[DMA.scala 46:37]
      destination_ <= 64'h0; // @[DMA.scala 46:37]
    end else if (regBlock_wrReq) begin // @[DMA.scala 65:25]
      if (paused) begin // @[DMA.scala 66:18]
        if (7'h18 == regBlock_wrAddr) begin // @[RegisterBlock.scala 260:38]
          destination_ <= _destination__T_16; // @[RegisterBlock.scala 118:11]
        end
      end
    end
    if (reset) begin // @[DMA.scala 49:32]
      length_ <= 64'h0; // @[DMA.scala 49:32]
    end else if (regBlock_wrReq) begin // @[DMA.scala 65:25]
      if (paused) begin // @[DMA.scala 66:18]
        if (7'h20 == regBlock_wrAddr) begin // @[RegisterBlock.scala 260:38]
          length_ <= _length__T_16; // @[RegisterBlock.scala 118:11]
        end
      end
    end
    currentSource_ <= _GEN_51[31:0];
    currentDestination_ <= _GEN_55[31:0];
    if (reset) begin // @[DMA.scala 54:40]
      currentRLength_ <= 64'h0; // @[DMA.scala 54:40]
    end else if (~paused) begin // @[DMA.scala 90:17]
      if (m_axi_ar_ready & currentRLength_ != 64'h0) begin // @[DMA.scala 97:52]
        currentRLength_ <= _currentRLength__T_1; // @[DMA.scala 99:23]
      end else begin
        currentRLength_ <= _GEN_22;
      end
    end else begin
      currentRLength_ <= _GEN_22;
    end
    if (reset) begin // @[DMA.scala 55:40]
      currentWLength_ <= 64'h0; // @[DMA.scala 55:40]
    end else if (~paused) begin // @[DMA.scala 90:17]
      if (m_axi_aw_ready & currentWLength_ != 64'h0) begin // @[DMA.scala 108:52]
        currentWLength_ <= _currentWLength__T_1; // @[DMA.scala 110:23]
      end else begin
        currentWLength_ <= _GEN_23;
      end
    end else begin
      currentWLength_ <= _GEN_23;
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (regBlock_wrReq__ready & ~reset & ~regBlock_wrReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:208 assert(wrReq)\n"); // @[RegisterBlock.scala 208:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (regBlock_wrReq__ready & ~reset & ~regBlock_wrReq) begin
          $fatal; // @[RegisterBlock.scala 208:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (regBlock_rdReq & _T_7 & ~regBlock_rdReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:192 assert(rdReq)\n"); // @[RegisterBlock.scala 192:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (regBlock_rdReq & _T_7 & ~regBlock_rdReq) begin
          $fatal; // @[RegisterBlock.scala 192:11]
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
  _RAND_0 = {1{`RANDOM}};
  status_ = _RAND_0[0:0];
  _RAND_1 = {2{`RANDOM}};
  source_ = _RAND_1[63:0];
  _RAND_2 = {2{`RANDOM}};
  destination_ = _RAND_2[63:0];
  _RAND_3 = {2{`RANDOM}};
  length_ = _RAND_3[63:0];
  _RAND_4 = {1{`RANDOM}};
  currentSource_ = _RAND_4[31:0];
  _RAND_5 = {1{`RANDOM}};
  currentDestination_ = _RAND_5[31:0];
  _RAND_6 = {2{`RANDOM}};
  currentRLength_ = _RAND_6[63:0];
  _RAND_7 = {2{`RANDOM}};
  currentWLength_ = _RAND_7[63:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
module DMA_Wrapped(
  input         clock,
  input         reset,
  output        S_AXI_ARREADY,
  input         S_AXI_ARVALID,
  input  [6:0]  S_AXI_ARADDR,
  input  [2:0]  S_AXI_ARPROT,
  input         S_AXI_RREADY,
  output        S_AXI_RVALID,
  output [63:0] S_AXI_RDATA,
  output [1:0]  S_AXI_RRESP,
  output        S_AXI_AWREADY,
  input         S_AXI_AWVALID,
  input  [6:0]  S_AXI_AWADDR,
  input  [2:0]  S_AXI_AWPROT,
  output        S_AXI_WREADY,
  input         S_AXI_WVALID,
  input  [63:0] S_AXI_WDATA,
  input  [7:0]  S_AXI_WSTRB,
  input         S_AXI_BREADY,
  output        S_AXI_BVALID,
  output [1:0]  S_AXI_BRESP,
  input         M_AXI_ARREADY,
  output        M_AXI_ARVALID,
  output [31:0] M_AXI_ARADDR,
  output [2:0]  M_AXI_ARPROT,
  output        M_AXI_RREADY,
  input         M_AXI_RVALID,
  input  [63:0] M_AXI_RDATA,
  input  [1:0]  M_AXI_RRESP,
  input         M_AXI_AWREADY,
  output        M_AXI_AWVALID,
  output [31:0] M_AXI_AWADDR,
  output [2:0]  M_AXI_AWPROT,
  input         M_AXI_WREADY,
  output        M_AXI_WVALID,
  output [63:0] M_AXI_WDATA,
  output [7:0]  M_AXI_WSTRB,
  output        M_AXI_BREADY,
  input         M_AXI_BVALID,
  input  [1:0]  M_AXI_BRESP
);
  wire  device_clock; // @[DMA.scala 134:30]
  wire  device_reset; // @[DMA.scala 134:30]
  wire  device_s_axi_ar_ready; // @[DMA.scala 134:30]
  wire  device_s_axi_ar_valid; // @[DMA.scala 134:30]
  wire [6:0] device_s_axi_ar_bits_addr; // @[DMA.scala 134:30]
  wire  device_s_axi_r_ready; // @[DMA.scala 134:30]
  wire  device_s_axi_r_valid; // @[DMA.scala 134:30]
  wire [63:0] device_s_axi_r_bits_data; // @[DMA.scala 134:30]
  wire [1:0] device_s_axi_r_bits_resp; // @[DMA.scala 134:30]
  wire  device_s_axi_aw_ready; // @[DMA.scala 134:30]
  wire  device_s_axi_aw_valid; // @[DMA.scala 134:30]
  wire [6:0] device_s_axi_aw_bits_addr; // @[DMA.scala 134:30]
  wire  device_s_axi_w_ready; // @[DMA.scala 134:30]
  wire  device_s_axi_w_valid; // @[DMA.scala 134:30]
  wire [63:0] device_s_axi_w_bits_data; // @[DMA.scala 134:30]
  wire [7:0] device_s_axi_w_bits_strb; // @[DMA.scala 134:30]
  wire  device_s_axi_b_ready; // @[DMA.scala 134:30]
  wire  device_s_axi_b_valid; // @[DMA.scala 134:30]
  wire [1:0] device_s_axi_b_bits_resp; // @[DMA.scala 134:30]
  wire  device_m_axi_ar_ready; // @[DMA.scala 134:30]
  wire  device_m_axi_ar_valid; // @[DMA.scala 134:30]
  wire [31:0] device_m_axi_ar_bits_addr; // @[DMA.scala 134:30]
  wire  device_m_axi_r_ready; // @[DMA.scala 134:30]
  wire  device_m_axi_r_valid; // @[DMA.scala 134:30]
  wire [63:0] device_m_axi_r_bits_data; // @[DMA.scala 134:30]
  wire  device_m_axi_aw_ready; // @[DMA.scala 134:30]
  wire  device_m_axi_aw_valid; // @[DMA.scala 134:30]
  wire [31:0] device_m_axi_aw_bits_addr; // @[DMA.scala 134:30]
  wire  device_m_axi_w_ready; // @[DMA.scala 134:30]
  wire  device_m_axi_w_valid; // @[DMA.scala 134:30]
  wire [63:0] device_m_axi_w_bits_data; // @[DMA.scala 134:30]
  DMA device ( // @[DMA.scala 134:30]
    .clock(device_clock),
    .reset(device_reset),
    .s_axi_ar_ready(device_s_axi_ar_ready),
    .s_axi_ar_valid(device_s_axi_ar_valid),
    .s_axi_ar_bits_addr(device_s_axi_ar_bits_addr),
    .s_axi_r_ready(device_s_axi_r_ready),
    .s_axi_r_valid(device_s_axi_r_valid),
    .s_axi_r_bits_data(device_s_axi_r_bits_data),
    .s_axi_r_bits_resp(device_s_axi_r_bits_resp),
    .s_axi_aw_ready(device_s_axi_aw_ready),
    .s_axi_aw_valid(device_s_axi_aw_valid),
    .s_axi_aw_bits_addr(device_s_axi_aw_bits_addr),
    .s_axi_w_ready(device_s_axi_w_ready),
    .s_axi_w_valid(device_s_axi_w_valid),
    .s_axi_w_bits_data(device_s_axi_w_bits_data),
    .s_axi_w_bits_strb(device_s_axi_w_bits_strb),
    .s_axi_b_ready(device_s_axi_b_ready),
    .s_axi_b_valid(device_s_axi_b_valid),
    .s_axi_b_bits_resp(device_s_axi_b_bits_resp),
    .m_axi_ar_ready(device_m_axi_ar_ready),
    .m_axi_ar_valid(device_m_axi_ar_valid),
    .m_axi_ar_bits_addr(device_m_axi_ar_bits_addr),
    .m_axi_r_ready(device_m_axi_r_ready),
    .m_axi_r_valid(device_m_axi_r_valid),
    .m_axi_r_bits_data(device_m_axi_r_bits_data),
    .m_axi_aw_ready(device_m_axi_aw_ready),
    .m_axi_aw_valid(device_m_axi_aw_valid),
    .m_axi_aw_bits_addr(device_m_axi_aw_bits_addr),
    .m_axi_w_ready(device_m_axi_w_ready),
    .m_axi_w_valid(device_m_axi_w_valid),
    .m_axi_w_bits_data(device_m_axi_w_bits_data)
  );
  assign S_AXI_ARREADY = device_s_axi_ar_ready; // @[DMA.scala 139:16]
  assign S_AXI_RVALID = device_s_axi_r_valid; // @[DMA.scala 139:16]
  assign S_AXI_RDATA = device_s_axi_r_bits_data; // @[DMA.scala 139:16]
  assign S_AXI_RRESP = device_s_axi_r_bits_resp; // @[DMA.scala 139:16]
  assign S_AXI_AWREADY = device_s_axi_aw_ready; // @[DMA.scala 139:16]
  assign S_AXI_WREADY = device_s_axi_w_ready; // @[DMA.scala 139:16]
  assign S_AXI_BVALID = device_s_axi_b_valid; // @[DMA.scala 139:16]
  assign S_AXI_BRESP = device_s_axi_b_bits_resp; // @[DMA.scala 139:16]
  assign M_AXI_ARVALID = device_m_axi_ar_valid; // @[DMA.scala 140:16]
  assign M_AXI_ARADDR = device_m_axi_ar_bits_addr; // @[DMA.scala 140:16]
  assign M_AXI_ARPROT = 3'h0; // @[DMA.scala 140:16]
  assign M_AXI_RREADY = device_m_axi_r_ready; // @[DMA.scala 140:16]
  assign M_AXI_AWVALID = device_m_axi_aw_valid; // @[DMA.scala 140:16]
  assign M_AXI_AWADDR = device_m_axi_aw_bits_addr; // @[DMA.scala 140:16]
  assign M_AXI_AWPROT = 3'h0; // @[DMA.scala 140:16]
  assign M_AXI_WVALID = device_m_axi_w_valid; // @[DMA.scala 140:16]
  assign M_AXI_WDATA = device_m_axi_w_bits_data; // @[DMA.scala 140:16]
  assign M_AXI_WSTRB = 8'hff; // @[DMA.scala 140:16]
  assign M_AXI_BREADY = 1'h1; // @[DMA.scala 140:16]
  assign device_clock = clock;
  assign device_reset = reset;
  assign device_s_axi_ar_valid = S_AXI_ARVALID; // @[DMA.scala 139:16]
  assign device_s_axi_ar_bits_addr = S_AXI_ARADDR; // @[DMA.scala 139:16]
  assign device_s_axi_r_ready = S_AXI_RREADY; // @[DMA.scala 139:16]
  assign device_s_axi_aw_valid = S_AXI_AWVALID; // @[DMA.scala 139:16]
  assign device_s_axi_aw_bits_addr = S_AXI_AWADDR; // @[DMA.scala 139:16]
  assign device_s_axi_w_valid = S_AXI_WVALID; // @[DMA.scala 139:16]
  assign device_s_axi_w_bits_data = S_AXI_WDATA; // @[DMA.scala 139:16]
  assign device_s_axi_w_bits_strb = S_AXI_WSTRB; // @[DMA.scala 139:16]
  assign device_s_axi_b_ready = S_AXI_BREADY; // @[DMA.scala 139:16]
  assign device_m_axi_ar_ready = M_AXI_ARREADY; // @[DMA.scala 140:16]
  assign device_m_axi_r_valid = M_AXI_RVALID; // @[DMA.scala 140:16]
  assign device_m_axi_r_bits_data = M_AXI_RDATA; // @[DMA.scala 140:16]
  assign device_m_axi_aw_ready = M_AXI_AWREADY; // @[DMA.scala 140:16]
  assign device_m_axi_w_ready = M_AXI_WREADY; // @[DMA.scala 140:16]
endmodule
