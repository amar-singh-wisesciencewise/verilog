`timescale 1ns / 1ps

module test;

  reg reset = 0;
  reg wr = 0;
  reg [31 : 0] wdata; 
  initial begin
     # 10 reset = 1;
     # 5 reset = 0;
     # 10 wr = 1; wdata = 32'habcd;
     # 10 reset = 1;
     # 15 reset = 0;
     # 10 wr = 1; wdata = 32'h1234;
     # 5 wr = 0;
     # 10 wr = 1; wdata = 32'hcdef;
     # 5 wr = 0;
     # 10 wr = 1; wdata = 32'hbeef;
     # 5 wr = 0;
     # 10 wr  = 1; wdata = 32'h2424;
     # 5 wr = 0;
     # 5 reset = 1;
     # 10
     # 50 $finish;
  end

  reg clk = 0;
  always #5 clk = !clk;

  // intantiate
  wire [31:0] rdata;
  register r1 (.reset(reset), .clk(clk), .wr(wr), .wdata(wdata), .rdata(rdata));

  initial begin
  $dumpfile("register_tb.vcd");
  $dumpvars(0, test);
  end
endmodule // test
