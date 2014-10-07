`ifndef _NOT
`define _NOT

module not16(in, out);		// Implements 16-bit bitwise NOT

	input  [15:0] in;
	output [15:0] out;
	
	assign out = ~ in;
	
endmodule

`endif
