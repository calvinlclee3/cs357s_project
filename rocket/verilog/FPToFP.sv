// Generated by CIRCT firtool-1.75.0

// Include register initializers in init blocks unless synthesis is set
`ifndef RANDOMIZE
  `ifdef RANDOMIZE_REG_INIT
    `define RANDOMIZE
  `endif // RANDOMIZE_REG_INIT
`endif // not def RANDOMIZE
`ifndef SYNTHESIS
  `ifndef ENABLE_INITIAL_REG_
    `define ENABLE_INITIAL_REG_
  `endif // not def ENABLE_INITIAL_REG_
`endif // not def SYNTHESIS

// Standard header to adapt well known macros for register randomization.

// RANDOM may be set to an expression that produces a 32-bit random unsigned value.
`ifndef RANDOM
  `define RANDOM $random
`endif // not def RANDOM

// Users can define INIT_RANDOM as general code that gets injected into the
// initializer block for modules with registers.
`ifndef INIT_RANDOM
  `define INIT_RANDOM
`endif // not def INIT_RANDOM

// If using random initialization, you can also define RANDOMIZE_DELAY to
// customize the delay used, otherwise 0.002 is used.
`ifndef RANDOMIZE_DELAY
  `define RANDOMIZE_DELAY 0.002
`endif // not def RANDOMIZE_DELAY

// Define INIT_RANDOM_PROLOG_ for use in our modules below.
`ifndef INIT_RANDOM_PROLOG_
  `ifdef RANDOMIZE
    `ifdef VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM
    `else  // VERILATOR
      `define INIT_RANDOM_PROLOG_ `INIT_RANDOM #`RANDOMIZE_DELAY begin end
    `endif // VERILATOR
  `else  // RANDOMIZE
    `define INIT_RANDOM_PROLOG_
  `endif // RANDOMIZE
`endif // not def INIT_RANDOM_PROLOG_
module FPToFP(	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
  input         clock,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
  input         reset,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
  input         io_in_valid,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input         io_in_bits_ren2,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input  [1:0]  io_in_bits_typeTagIn,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input  [1:0]  io_in_bits_typeTagOut,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input         io_in_bits_wflags,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input  [2:0]  io_in_bits_rm,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input  [64:0] io_in_bits_in1,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input  [64:0] io_in_bits_in2,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  output [64:0] io_out_bits_data,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  output [4:0]  io_out_bits_exc,	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
  input         io_lt	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
);

  wire [32:0] _narrower_1_io_out;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
  wire [4:0]  _narrower_1_io_exceptionFlags;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
  wire [16:0] _narrower_io_out;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
  wire [4:0]  _narrower_io_exceptionFlags;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
  reg         in_pipe_v;	// @[src/main/scala/chisel3/util/Valid.scala:141:24]
  reg         in_pipe_b_ren2;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  reg  [1:0]  in_pipe_b_typeTagIn;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  reg  [1:0]  in_pipe_b_typeTagOut;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  reg         in_pipe_b_wflags;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  reg  [2:0]  in_pipe_b_rm;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  reg  [64:0] in_pipe_b_in1;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  reg  [64:0] in_pipe_b_in2;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  wire        _GEN = in_pipe_b_wflags & ~in_pipe_b_ren2;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:608:{24,27}, src/main/scala/chisel3/util/Valid.scala:142:26]
  wire [64:0] fsgnjMux_data = _GEN ? ((&(in_pipe_b_in1[63:61])) ? 65'hE008000000000000 : in_pipe_b_in1) : in_pipe_b_wflags ? ((&(in_pipe_b_in1[63:61])) & (&(in_pipe_b_in2[63:61])) ? 65'hE008000000000000 : (&(in_pipe_b_in2[63:61])) | in_pipe_b_rm[0] != io_lt & ~(&(in_pipe_b_in1[63:61])) ? in_pipe_b_in1 : in_pipe_b_in2) : {in_pipe_b_rm[1] ? in_pipe_b_in1[64] ^ in_pipe_b_in2[64] : in_pipe_b_rm[0] ^ in_pipe_b_in2[64], in_pipe_b_in1[63:0]};	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:249:{25,56}, :582:{20,31,48,66,77}, :583:{18,45}, :587:17, :589:25, :593:27, :594:{24,41,51,54}, :596:{19,25,53}, :608:{24,42}, :611:24, :612:21, src/main/scala/chisel3/util/Valid.scala:142:26]
  reg  [64:0] io_out_pipe_b_data;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  reg  [4:0]  io_out_pipe_b_exc;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
  wire [4:0]  _GEN_0 = in_pipe_b_wflags ? {(&(in_pipe_b_in1[63:61])) & ~(in_pipe_b_in1[51]) | (&(in_pipe_b_in2[63:61])) & ~(in_pipe_b_in2[51]), 4'h0} : 5'h0;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:249:{25,56}, :250:{34,37,39}, :573:7, :586:16, :589:25, :592:49, :595:{18,31}, src/main/scala/chisel3/util/Valid.scala:142:26]
  wire        _GEN_1 = in_pipe_b_typeTagOut == 2'h0;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:603:18, src/main/scala/chisel3/util/Valid.scala:142:26]
  wire [5:0]  _mux_data_expOut_commonCase_T = fsgnjMux_data[57:52] - 6'h20;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:276:18, :280:31, :589:25, :608:42, :612:21]
  wire        _GEN_2 = in_pipe_b_typeTagOut == 2'h1;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:603:18, src/main/scala/chisel3/util/Valid.scala:142:26]
  wire [8:0]  _mux_data_expOut_commonCase_T_3 = fsgnjMux_data[60:52] - 9'h100;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:276:18, :280:31, :589:25, :608:42, :612:21]
  wire [64:0] _mux_data_T_5 = {fsgnjMux_data[64:33], fsgnjMux_data[64], fsgnjMux_data[63:61] == 3'h0 | fsgnjMux_data[63:61] > 3'h5 ? {fsgnjMux_data[63:61], _mux_data_expOut_commonCase_T_3[5:0]} : _mux_data_expOut_commonCase_T_3, fsgnjMux_data[51:29]};	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:274:17, :276:18, :277:38, :279:26, :280:{31,50}, :281:{10,19,27,38,49,69}, :589:25, :604:{22,37}, :608:42, :612:21]
  wire        _GEN_3 = _GEN_2 & in_pipe_b_typeTagOut < in_pipe_b_typeTagIn;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:603:18, :618:{76,116}, src/main/scala/chisel3/util/Valid.scala:142:26]
  always @(posedge clock) begin	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
    if (reset)	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
      in_pipe_v <= 1'h0;	// @[src/main/scala/chisel3/util/Valid.scala:141:24]
    else	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
      in_pipe_v <= io_in_valid;	// @[src/main/scala/chisel3/util/Valid.scala:141:24]
    if (io_in_valid) begin	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:574:14]
      in_pipe_b_ren2 <= io_in_bits_ren2;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
      in_pipe_b_typeTagIn <= io_in_bits_typeTagIn;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
      in_pipe_b_typeTagOut <= io_in_bits_typeTagOut;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
      in_pipe_b_wflags <= io_in_bits_wflags;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
      in_pipe_b_rm <= io_in_bits_rm;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
      in_pipe_b_in1 <= io_in_bits_in1;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
      in_pipe_b_in2 <= io_in_bits_in2;	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
    end
    if (in_pipe_v) begin	// @[src/main/scala/chisel3/util/Valid.scala:141:24]
      io_out_pipe_b_data <= _GEN ? (_GEN_3 ? {fsgnjMux_data[64:33], ({33{_narrower_1_io_out[31:29] != 3'h7}} | 33'h1EF7FFFFF) & _narrower_1_io_out} : _GEN_1 ? {fsgnjMux_data[64:17], _narrower_io_out} : _GEN_2 ? _mux_data_T_5 : fsgnjMux_data) : _GEN_2 ? _mux_data_T_5 : _GEN_1 ? {fsgnjMux_data[64:17], fsgnjMux_data[64], fsgnjMux_data[63:61] == 3'h0 | fsgnjMux_data[63:61] > 3'h5 ? {fsgnjMux_data[63:61], _mux_data_expOut_commonCase_T[2:0]} : _mux_data_expOut_commonCase_T, fsgnjMux_data[51:42]} : fsgnjMux_data;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:249:{25,56}, :274:17, :276:18, :277:38, :279:26, :280:{31,50}, :281:{10,19,27,38,49,69}, :414:10, :589:25, :601:24, :603:{18,36}, :604:{16,22,37}, :608:{24,42}, :612:21, :618:{76,126}, :619:30, :624:{18,24,39}, src/main/scala/chisel3/util/Valid.scala:142:26]
      io_out_pipe_b_exc <= _GEN ? (_GEN_3 ? _narrower_1_io_exceptionFlags : _GEN_1 ? _narrower_io_exceptionFlags : _GEN ? {(&(in_pipe_b_in1[63:61])) & ~(in_pipe_b_in1[51]), 4'h0} : _GEN_0) : _GEN_0;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:249:{25,56}, :250:{34,37,39}, :573:7, :586:16, :589:25, :595:18, :601:24, :603:18, :608:{24,42}, :613:{20,51}, :618:{76,126}, :619:30, :625:17, src/main/scala/chisel3/util/Valid.scala:142:26]
    end
  end // always @(posedge)
  `ifdef ENABLE_INITIAL_REG_	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
    `ifdef FIRRTL_BEFORE_INITIAL	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
      `FIRRTL_BEFORE_INITIAL	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
    `endif // FIRRTL_BEFORE_INITIAL
    logic [31:0] _RANDOM[0:9];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
    initial begin	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
      `ifdef INIT_RANDOM_PROLOG_	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
        `INIT_RANDOM_PROLOG_	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
      `endif // INIT_RANDOM_PROLOG_
      `ifdef RANDOMIZE_REG_INIT	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
        for (logic [3:0] i = 4'h0; i < 4'hA; i += 4'h1) begin
          _RANDOM[i] = `RANDOM;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
        end	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
        in_pipe_v = _RANDOM[4'h0][0];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:141:24]
        in_pipe_b_ren2 = _RANDOM[4'h0][4];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:141:24, :142:26]
        in_pipe_b_typeTagIn = _RANDOM[4'h0][9:8];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:141:24, :142:26]
        in_pipe_b_typeTagOut = _RANDOM[4'h0][11:10];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:141:24, :142:26]
        in_pipe_b_wflags = _RANDOM[4'h0][18];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:141:24, :142:26]
        in_pipe_b_rm = _RANDOM[4'h0][22:20];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:141:24, :142:26]
        in_pipe_b_in1 = {_RANDOM[4'h0][31:29], _RANDOM[4'h1], _RANDOM[4'h2][29:0]};	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:141:24, :142:26]
        in_pipe_b_in2 = {_RANDOM[4'h2][31:30], _RANDOM[4'h3], _RANDOM[4'h4][30:0]};	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:142:26]
        io_out_pipe_b_data = {_RANDOM[4'h7][31:1], _RANDOM[4'h8], _RANDOM[4'h9][1:0]};	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:142:26]
        io_out_pipe_b_exc = _RANDOM[4'h9][6:2];	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:142:26]
      `endif // RANDOMIZE_REG_INIT
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
      `FIRRTL_AFTER_INITIAL	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7]
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  RecFNToRecFN narrower (	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
    .io_in             (in_pipe_b_in1),	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
    .io_roundingMode   (in_pipe_b_rm),	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
    .io_out            (_narrower_io_out),
    .io_exceptionFlags (_narrower_io_exceptionFlags)
  );	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
  RecFNToRecFN_1 narrower_1 (	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
    .io_in             (in_pipe_b_in1),	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
    .io_roundingMode   (in_pipe_b_rm),	// @[src/main/scala/chisel3/util/Valid.scala:142:26]
    .io_out            (_narrower_1_io_out),
    .io_exceptionFlags (_narrower_1_io_exceptionFlags)
  );	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:619:30]
  assign io_out_bits_data = io_out_pipe_b_data;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:142:26]
  assign io_out_bits_exc = io_out_pipe_b_exc;	// @[generators/rocket-chip/src/main/scala/tile/FPU.scala:573:7, src/main/scala/chisel3/util/Valid.scala:142:26]
endmodule

