

`timescale 1ns / 1ps


module d_ff(input d, input clk, input reset, output q);

reg q;

always@(posedge clk or posedge reset)
	begin
	if(reset == 1)
		q <= 0;
	else
		q <= d;
	end
endmodule

