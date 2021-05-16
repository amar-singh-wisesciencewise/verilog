`timescale 1ns / 1ps

module test;

  reg reset = 0;
  reg wr = 0;
  reg re1 = 0;
  reg re2 = 0;
  reg [31 : 0] wdata; 
  reg [4 : 0] waddr;
  reg [4 : 0] raddr1;
  reg [4 : 0] raddr2;
  initial begin
     # 12 reset = 1;
     # 5 reset = 0;
     # 25 re1 = 1; re2 = 1; raddr1 = 2; raddr2 = 3; //reading just after reaset 
     # 25 raddr2 = 0;
     # 25 wr = 1; wdata = 32'habcd; waddr = 2; //writting same address which is being read
     # 25 wr = 0;
     # 25 re1 = 1; re2 = 1; raddr1 = 2; raddr2 = 2; //reading on both  port same address
     # 25 
     # 25 wr = 1; wdata = 32'habcd; waddr = 2; //now writting same address which is being read
     # 25 wr = 0; 
     # 25 
     # 25 re1 = 1; re2 = 1; raddr1 = 5; raddr2 = 20;
     # 25 
     # 25 wr = 1; wdata = 32'h1234; waddr = 15;
     # 25 wr = 0;
     # 25 re1 = 1; re2 = 1; raddr1 = 0; raddr2 = 15;
     # 25 re1 = 0; re2 = 0; 
     # 25 wr = 1; wdata = 32'h12346; waddr = 6; 
     # 25 wr = 1; wdata = 32'h12347; waddr = 7; 
     # 25 wr = 1; wdata = 32'h12348; waddr = 8; 
     # 25 wr = 1; wdata = 32'h12349; waddr = 9;
     # 25 wr = 0;
     # 25 re1 = 1; re2 = 1; raddr1 = 6; raddr2 = 7;
     # 25 re1 = 1; re2 = 1; raddr1 = 8; raddr2 = 9;
     # 25 re1 = 1; re2 = 1; raddr1 = 0; raddr2 = 2;
     # 25 re1 = 1; re2 = 1; raddr1 = 6; raddr2 = 15;
     # 25 re1 = 0; re2 = 0; 
     # 50 reset = 1;
     # 10 reset = 0;
     # 25 re1 = 1; re2 = 1; raddr1 = 6; raddr2 = 7;
     # 25 re1 = 1; re2 = 1; raddr1 = 2; raddr2 = 9;
     # 50 $finish;
  end

  reg clk = 0;
  always #5 clk = !clk;

  // intantiate
  wire [31:0] rdata1;
  wire [31:0] rdata2;
  risc_v_rf r1 (.reset(reset), .clk(clk), .wr(wr), .waddr(waddr), .wdata(wdata), .re1(re1), .raddr1(raddr1), .rdata1(rdata1), .re2(re2), .raddr2(raddr2), .rdata2(rdata2));

  initial begin
  $dumpfile("risc_v_rf_tb.vcd");
  $dumpvars(0, test);
  end
endmodule // test
