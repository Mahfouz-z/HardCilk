module Queue(
  input         clock,
  input         reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [31:0] io_enq_bits_addr,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_addr
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_addr [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_addr_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_addr_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_addr_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_addr_MPORT_data; // @[Decoupled.scala 275:95]
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
    ram_addr[initvar] = _RAND_0[31:0];
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
  input  [31:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_data,
  output [1:0]  io_deq_bits_resp
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_data [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_data_MPORT_data; // @[Decoupled.scala 275:95]
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[31:0];
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
  input  [31:0] io_enq_bits_data,
  input  [3:0]  io_enq_bits_strb,
  input         io_deq_ready,
  output        io_deq_valid,
  output [31:0] io_deq_bits_data,
  output [3:0]  io_deq_bits_strb
);
`ifdef RANDOMIZE_MEM_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_MEM_INIT
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_2;
`endif // RANDOMIZE_REG_INIT
  reg [31:0] ram_data [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_data_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [31:0] ram_data_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [31:0] ram_data_MPORT_data; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_addr; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_mask; // @[Decoupled.scala 275:95]
  wire  ram_data_MPORT_en; // @[Decoupled.scala 275:95]
  reg [3:0] ram_strb [0:0]; // @[Decoupled.scala 275:95]
  wire  ram_strb_io_deq_bits_MPORT_en; // @[Decoupled.scala 275:95]
  wire  ram_strb_io_deq_bits_MPORT_addr; // @[Decoupled.scala 275:95]
  wire [3:0] ram_strb_io_deq_bits_MPORT_data; // @[Decoupled.scala 275:95]
  wire [3:0] ram_strb_MPORT_data; // @[Decoupled.scala 275:95]
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
  _RAND_0 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_data[initvar] = _RAND_0[31:0];
  _RAND_1 = {1{`RANDOM}};
  for (initvar = 0; initvar < 1; initvar = initvar+1)
    ram_strb[initvar] = _RAND_1[3:0];
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
module SimpleMemoryMappedDevice(
  input         clock,
  input         reset,
  output        SAXIL_ARREADY,
  input         SAXIL_ARVALID,
  input  [31:0] SAXIL_ARADDR,
  input  [2:0]  SAXIL_ARPROT,
  input         SAXIL_RREADY,
  output        SAXIL_RVALID,
  output [31:0] SAXIL_RDATA,
  output [1:0]  SAXIL_RRESP,
  output        SAXIL_AWREADY,
  input         SAXIL_AWVALID,
  input  [31:0] SAXIL_AWADDR,
  input  [2:0]  SAXIL_AWPROT,
  output        SAXIL_WREADY,
  input         SAXIL_WVALID,
  input  [31:0] SAXIL_WDATA,
  input  [3:0]  SAXIL_WSTRB,
  input         SAXIL_BREADY,
  output        SAXIL_BVALID,
  output [1:0]  SAXIL_BRESP
);
`ifdef RANDOMIZE_REG_INIT
  reg [31:0] _RAND_0;
  reg [31:0] _RAND_1;
`endif // RANDOMIZE_REG_INIT
  wire  regBlock_rdReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] regBlock_rdReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_rdReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] regBlock_rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_rdRespQueue__clock; // @[RegisterBlock.scala 171:36]
  wire  regBlock_rdRespQueue__reset; // @[RegisterBlock.scala 171:36]
  wire  regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 171:36]
  wire  regBlock_rdRespQueue__io_enq_valid; // @[RegisterBlock.scala 171:36]
  wire [31:0] regBlock_rdRespQueue__io_enq_bits_data; // @[RegisterBlock.scala 171:36]
  wire  regBlock_rdRespQueue__io_deq_ready; // @[RegisterBlock.scala 171:36]
  wire  regBlock_rdRespQueue__io_deq_valid; // @[RegisterBlock.scala 171:36]
  wire [31:0] regBlock_rdRespQueue__io_deq_bits_data; // @[RegisterBlock.scala 171:36]
  wire [1:0] regBlock_rdRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 171:36]
  wire  regBlock_wrReq__deq_clock; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_reset; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] regBlock_wrReq__deq_io_enq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReq__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] regBlock_wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_clock; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_reset; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_enq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_enq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] regBlock_wrReqData__deq_io_enq_bits_data; // @[Decoupled.scala 377:21]
  wire [3:0] regBlock_wrReqData__deq_io_enq_bits_strb; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_deq_ready; // @[Decoupled.scala 377:21]
  wire  regBlock_wrReqData__deq_io_deq_valid; // @[Decoupled.scala 377:21]
  wire [31:0] regBlock_wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 377:21]
  wire [3:0] regBlock_wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 377:21]
  wire  regBlock_wrRespQueue__clock; // @[RegisterBlock.scala 179:36]
  wire  regBlock_wrRespQueue__reset; // @[RegisterBlock.scala 179:36]
  wire  regBlock_wrRespQueue__io_enq_ready; // @[RegisterBlock.scala 179:36]
  wire  regBlock_wrRespQueue__io_enq_valid; // @[RegisterBlock.scala 179:36]
  wire  regBlock_wrRespQueue__io_deq_ready; // @[RegisterBlock.scala 179:36]
  wire  regBlock_wrRespQueue__io_deq_valid; // @[RegisterBlock.scala 179:36]
  wire [1:0] regBlock_wrRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 179:36]
  wire  regBlock_rdReq__valid = regBlock_rdReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  regBlock_rdReq = regBlock_rdReq__valid & regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 225:44]
  wire [31:0] regBlock_rdReq__bits_addr = regBlock_rdReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [31:0] regBlock_rdAddr = regBlock_rdReq__bits_addr & 32'hfc; // @[RegisterBlock.scala 227:48]
  wire  regBlock_wrReq__valid = regBlock_wrReq__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  regBlock_wrReqData__valid = regBlock_wrReqData__deq_io_deq_valid; // @[Decoupled.scala 417:19 419:15]
  wire  regBlock_wrReq = regBlock_wrReq__valid & regBlock_wrReqData__valid & regBlock_wrRespQueue__io_enq_ready; // @[RegisterBlock.scala 254:63]
  wire [31:0] regBlock_wrReq__bits_addr = regBlock_wrReq__deq_io_deq_bits_addr; // @[Decoupled.scala 417:19 418:14]
  wire [31:0] regBlock_wrAddr = regBlock_wrReq__bits_addr & 32'hfc; // @[RegisterBlock.scala 256:48]
  reg [7:0] reg1; // @[SimpleMemoryMapped.scala 16:29]
  reg [31:0] reg2; // @[SimpleMemoryMapped.scala 17:29]
  wire  _T = regBlock_rdAddr >= 32'hc; // @[SimpleMemoryMapped.scala 29:26]
  wire [31:0] resp_data = regBlock_rdAddr - 32'hc; // @[SimpleMemoryMapped.scala 31:37]
  wire  _T_4 = ~reset; // @[RegisterBlock.scala 197:11]
  wire [31:0] _GEN_0 = 32'h0 == regBlock_rdAddr ? {{24'd0}, reg1} : 32'hffffffff; // @[RegisterBlock.scala 233:10 237:38 238:16]
  wire [31:0] _GEN_1 = 32'h4 == regBlock_rdAddr ? reg2 : _GEN_0; // @[RegisterBlock.scala 237:38 238:16]
  wire [31:0] _GEN_2 = 32'h8 == regBlock_rdAddr ? 32'h30 : _GEN_1; // @[RegisterBlock.scala 237:38 238:16]
  wire [31:0] data = 32'hc == regBlock_rdAddr ? 32'h0 : _GEN_2; // @[RegisterBlock.scala 237:38 238:16]
  wire [3:0] regBlock_wrReqData__bits_strb = regBlock_wrReqData__deq_io_deq_bits_strb; // @[Decoupled.scala 417:19 418:14]
  wire [31:0] regBlock_wrReqData__bits_data = regBlock_wrReqData__deq_io_deq_bits_data; // @[Decoupled.scala 417:19 418:14]
  wire [7:0] reg1_byte_wdata = regBlock_wrReqData__bits_data[7:0]; // @[RawInterface.scala 232:33]
  wire [31:0] _reg1_WIRE = {{24'd0}, reg1}; // @[RegisterBlock.scala 122:{39,39}]
  wire [7:0] reg1_byte_original = _reg1_WIRE[7:0]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg1_T_4 = regBlock_wrReqData__bits_strb[0] ? reg1_byte_wdata : reg1_byte_original; // @[RawInterface.scala 234:14]
  wire [7:0] reg1_byte_wdata_1 = regBlock_wrReqData__bits_data[15:8]; // @[RawInterface.scala 232:33]
  wire [7:0] reg1_byte_original_1 = _reg1_WIRE[15:8]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg1_T_5 = regBlock_wrReqData__bits_strb[1] ? reg1_byte_wdata_1 : reg1_byte_original_1; // @[RawInterface.scala 234:14]
  wire [7:0] reg1_byte_wdata_2 = regBlock_wrReqData__bits_data[23:16]; // @[RawInterface.scala 232:33]
  wire [7:0] reg1_byte_original_2 = _reg1_WIRE[23:16]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg1_T_6 = regBlock_wrReqData__bits_strb[2] ? reg1_byte_wdata_2 : reg1_byte_original_2; // @[RawInterface.scala 234:14]
  wire [7:0] reg1_byte_wdata_3 = regBlock_wrReqData__bits_data[31:24]; // @[RawInterface.scala 232:33]
  wire [7:0] reg1_byte_original_3 = _reg1_WIRE[31:24]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg1_T_7 = regBlock_wrReqData__bits_strb[3] ? reg1_byte_wdata_3 : reg1_byte_original_3; // @[RawInterface.scala 234:14]
  wire [31:0] _reg1_T_8 = {_reg1_T_7,_reg1_T_6,_reg1_T_5,_reg1_T_4}; // @[RawInterface.scala 237:7]
  wire [7:0] reg2_byte_original = reg2[7:0]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg2_T_4 = regBlock_wrReqData__bits_strb[0] ? reg1_byte_wdata : reg2_byte_original; // @[RawInterface.scala 234:14]
  wire [7:0] reg2_byte_original_1 = reg2[15:8]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg2_T_5 = regBlock_wrReqData__bits_strb[1] ? reg1_byte_wdata_1 : reg2_byte_original_1; // @[RawInterface.scala 234:14]
  wire [7:0] reg2_byte_original_2 = reg2[23:16]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg2_T_6 = regBlock_wrReqData__bits_strb[2] ? reg1_byte_wdata_2 : reg2_byte_original_2; // @[RawInterface.scala 234:14]
  wire [7:0] reg2_byte_original_3 = reg2[31:24]; // @[RawInterface.scala 233:39]
  wire [7:0] _reg2_T_7 = regBlock_wrReqData__bits_strb[3] ? reg1_byte_wdata_3 : reg2_byte_original_3; // @[RawInterface.scala 234:14]
  wire [31:0] _reg2_T_8 = {_reg2_T_7,_reg2_T_6,_reg2_T_5,_reg2_T_4}; // @[RawInterface.scala 237:7]
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
  Queue_1 regBlock_rdRespQueue_ ( // @[RegisterBlock.scala 171:36]
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
  Queue_4 regBlock_wrRespQueue_ ( // @[RegisterBlock.scala 179:36]
    .clock(regBlock_wrRespQueue__clock),
    .reset(regBlock_wrRespQueue__reset),
    .io_enq_ready(regBlock_wrRespQueue__io_enq_ready),
    .io_enq_valid(regBlock_wrRespQueue__io_enq_valid),
    .io_deq_ready(regBlock_wrRespQueue__io_deq_ready),
    .io_deq_valid(regBlock_wrRespQueue__io_deq_valid),
    .io_deq_bits_resp(regBlock_wrRespQueue__io_deq_bits_resp)
  );
  assign SAXIL_ARREADY = regBlock_rdReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 62:20]
  assign SAXIL_RVALID = regBlock_rdRespQueue__io_deq_valid; // @[RegisterBlock.scala 173:12 62:20]
  assign SAXIL_RDATA = regBlock_rdRespQueue__io_deq_bits_data; // @[RegisterBlock.scala 173:12 62:20]
  assign SAXIL_RRESP = regBlock_rdRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 173:12 62:20]
  assign SAXIL_AWREADY = regBlock_wrReq__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 62:20]
  assign SAXIL_WREADY = regBlock_wrReqData__deq_io_enq_ready; // @[Decoupled.scala 381:17 RegisterBlock.scala 62:20]
  assign SAXIL_BVALID = regBlock_wrRespQueue__io_deq_valid; // @[RegisterBlock.scala 181:12 62:20]
  assign SAXIL_BRESP = regBlock_wrRespQueue__io_deq_bits_resp; // @[RegisterBlock.scala 181:12 62:20]
  assign regBlock_rdReq__deq_clock = clock;
  assign regBlock_rdReq__deq_reset = reset;
  assign regBlock_rdReq__deq_io_enq_valid = SAXIL_ARVALID; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_rdReq__deq_io_enq_bits_addr = SAXIL_ARADDR; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_rdReq__deq_io_deq_ready = regBlock_rdReq__valid & regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 225:44]
  assign regBlock_rdRespQueue__clock = clock;
  assign regBlock_rdRespQueue__reset = reset;
  assign regBlock_rdRespQueue__io_enq_valid = regBlock_rdReq__valid & regBlock_rdRespQueue__io_enq_ready; // @[RegisterBlock.scala 225:44]
  assign regBlock_rdRespQueue__io_enq_bits_data = regBlock_rdAddr >= 32'hc ? resp_data : data; // @[SimpleMemoryMapped.scala 29:40 Decoupled.scala 66:{19,19}]
  assign regBlock_rdRespQueue__io_deq_ready = SAXIL_RREADY; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_wrReq__deq_clock = clock;
  assign regBlock_wrReq__deq_reset = reset;
  assign regBlock_wrReq__deq_io_enq_valid = SAXIL_AWVALID; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_wrReq__deq_io_enq_bits_addr = SAXIL_AWADDR; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_wrReq__deq_io_deq_ready = regBlock_wrReq__valid & regBlock_wrReqData__valid &
    regBlock_wrRespQueue__io_enq_ready; // @[RegisterBlock.scala 254:63]
  assign regBlock_wrReqData__deq_clock = clock;
  assign regBlock_wrReqData__deq_reset = reset;
  assign regBlock_wrReqData__deq_io_enq_valid = SAXIL_WVALID; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_wrReqData__deq_io_enq_bits_data = SAXIL_WDATA; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_wrReqData__deq_io_enq_bits_strb = SAXIL_WSTRB; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  assign regBlock_wrReqData__deq_io_deq_ready = regBlock_wrReq__valid & regBlock_wrReqData__valid &
    regBlock_wrRespQueue__io_enq_ready; // @[RegisterBlock.scala 254:63]
  assign regBlock_wrRespQueue__clock = clock;
  assign regBlock_wrRespQueue__reset = reset;
  assign regBlock_wrRespQueue__io_enq_valid = regBlock_wrReq__valid & regBlock_wrReqData__valid &
    regBlock_wrRespQueue__io_enq_ready; // @[RegisterBlock.scala 254:63]
  assign regBlock_wrRespQueue__io_deq_ready = SAXIL_BREADY; // @[RegisterBlock.scala 62:20 SimpleMemoryMapped.scala 14:16]
  always @(posedge clock) begin
    if (reset) begin // @[SimpleMemoryMapped.scala 16:29]
      reg1 <= 8'h0; // @[SimpleMemoryMapped.scala 16:29]
    end else if (regBlock_wrReq) begin // @[SimpleMemoryMapped.scala 38:24]
      if (32'h0 == regBlock_wrAddr) begin // @[RegisterBlock.scala 265:38]
        reg1 <= _reg1_T_8[7:0]; // @[RegisterBlock.scala 121:11]
      end
    end
    if (reset) begin // @[SimpleMemoryMapped.scala 17:29]
      reg2 <= 32'h0; // @[SimpleMemoryMapped.scala 17:29]
    end else if (regBlock_wrReq) begin // @[SimpleMemoryMapped.scala 38:24]
      if (32'h4 == regBlock_wrAddr) begin // @[RegisterBlock.scala 265:38]
        reg2 <= _reg2_T_8; // @[RegisterBlock.scala 121:11]
      end
    end
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (regBlock_rdReq & _T & ~reset & ~regBlock_rdReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:197 assert(rdReq)\n"); // @[RegisterBlock.scala 197:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (regBlock_rdReq & _T & ~reset & ~regBlock_rdReq) begin
          $fatal; // @[RegisterBlock.scala 197:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (regBlock_rdReq & ~_T & ~reset & ~regBlock_rdReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:197 assert(rdReq)\n"); // @[RegisterBlock.scala 197:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (regBlock_rdReq & ~_T & ~reset & ~regBlock_rdReq) begin
          $fatal; // @[RegisterBlock.scala 197:11]
        end
    `ifdef STOP_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (regBlock_wrReq & _T_4 & ~regBlock_wrReq) begin
          $fwrite(32'h80000002,"Assertion failed\n    at RegisterBlock.scala:213 assert(wrReq)\n"); // @[RegisterBlock.scala 213:11]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
    `ifndef SYNTHESIS
    `ifdef STOP_COND
      if (`STOP_COND) begin
    `endif
        if (regBlock_wrReq & _T_4 & ~regBlock_wrReq) begin
          $fatal; // @[RegisterBlock.scala 213:11]
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
  reg1 = _RAND_0[7:0];
  _RAND_1 = {1{`RANDOM}};
  reg2 = _RAND_1[31:0];
`endif // RANDOMIZE_REG_INIT
  `endif // RANDOMIZE
end // initial
`ifdef FIRRTL_AFTER_INITIAL
`FIRRTL_AFTER_INITIAL
`endif
`endif // SYNTHESIS
endmodule
