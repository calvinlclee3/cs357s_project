// Generated by CIRCT firtool-1.75.0
module rockettile_dcache_data_arrays_0(	// @[generators/rocket-chip/src/main/scala/util/DescribedSRAM.scala:17:26]
  input  [8:0]   RW0_addr,
  input          RW0_en,
  input          RW0_clk,
  input          RW0_wmode,
  input  [511:0] RW0_wdata,
  output [511:0] RW0_rdata,
  input  [63:0]  RW0_wmask
);

  rockettile_dcache_data_arrays_0_ext rockettile_dcache_data_arrays_0_ext (	// @[generators/rocket-chip/src/main/scala/util/DescribedSRAM.scala:17:26]
    .RW0_addr  (RW0_addr),
    .RW0_en    (RW0_en),
    .RW0_clk   (RW0_clk),
    .RW0_wmode (RW0_wmode),
    .RW0_wdata (RW0_wdata),
    .RW0_rdata (RW0_rdata),
    .RW0_wmask (RW0_wmask)
  );	// @[generators/rocket-chip/src/main/scala/util/DescribedSRAM.scala:17:26]
endmodule

