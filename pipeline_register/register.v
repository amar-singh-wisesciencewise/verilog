`timescale 1ns / 1ps

// Register  for pipe line
// updates the data when wr and sel is 1
module register(clk, reset, wr, sel, wdata, rdata);

input clk, reset, wr, sel;

parameter WIDTH = 32;

input [WIDTH-1 : 0] wdata;
output [WIDTH-1 : 0] rdata;

reg [WIDTH-1 : 0] register;

//writting and reset
always@(posedge clk) begin
	if(reset)
		register <= 0;
	else begin
	if (sel & wr)
		register <= wdata;
	//else
	//	register <= register;
	end //if end
end //always

// reading
assign rdata = (sel & !wr)?register:0;

endmodule

