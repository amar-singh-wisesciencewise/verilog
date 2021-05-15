`timescale 1ns / 1ps

module test;

  reg reset = 0;
  reg sel = 0;
  reg wr = 0;
  reg [31 : 0] wdata; 
  initial begin
     # 12 reset = 1;
     # 5 reset = 0;
     # 10 wdata = 32'habcd;
     # 10 reset = 1;
     # 15 reset = 0;
     # 5  sel = 1;
     # 10 wdata = 32'h1234;
     # 5  wr = 1;
     # 10 wr = 0;
     # 50 wr = 1;	
     # 10 wdata = 32'hcdef;
     # 20 wr = 0;
     # 50 wr = 1;	
     # 10 wdata = 32'hbeef;
     # 20 wr = 0;
     # 5  sel = 0;
     # 50 wr = 1;	
     # 10 wdata = 32'h2424;
     # 20 wr = 0;
     # 50 $finish;
  end

  reg clk = 0;
  always #5 clk = !clk;

  // intantiate
  wire [31:0] rdata;
  register r1 (.reset(reset), .sel(sel), .clk(clk), .wr(wr), .wdata(wdata), .rdata(rdata));

  initial begin
  $dumpfile("register_tb.vcd");
  $dumpvars(0, test);
  end
endmodule // test
