

`timescale 1ns / 1ps


module bin_files_read_write();

reg [31:0] mem[0:15];
reg [31:0] temp;
integer i;
integer ret;
integer bin_file;

initial begin
	/* Read the values from prog.bin into memory mem */
//	$readmemb("prog.bin", mem); //does not work as prog.bin is not properly formated.


	bin_file = $fopen("prog.bin","rb");
	ret = $fread(mem, bin_file);

	for (i =0; i < 15; i=i+1)
		$display("mem[%d] : = %h", i , mem[i]);

end

endmodule

