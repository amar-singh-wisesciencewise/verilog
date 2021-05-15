// Counter behaviour modelling.


`timescale 1ns / 1ps


module counter(out, clk, reset);

  parameter WIDTH = 8;

  // declaring variables
  output [WIDTH-1 : 0] out;
  input clk, reset;

  // declare output as register
  reg [WIDTH-1 : 0]   out;
  wire clk, reset;

  // behaviour modelling of counter
  always @(posedge clk or posedge reset)
    if (reset)
      out <= 0;
    else
      out <= out + 1;

endmodule
