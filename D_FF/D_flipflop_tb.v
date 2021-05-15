`timescale 1ns / 1ps

module test;

reg reset = 0;

initial begin
#17 reset = 1;
#11 reset = 0;
#29 reset = 1;
#29 reset = 0;
#100 $finish;
end

reg clk = 0;
always #5 clk = !clk;

reg d = 0;
always #20 d = !d;


wire q;
d_ff d1(.d(d),.q(q), .reset(reset), .clk(clk));


initial begin
$dumpfile("d_ff_tb.vcd");
$dumpvars(0, test);
end


endmodule
