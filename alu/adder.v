`ifndef _ADDER
`define _ADDER

module adder16(in1, in2 , out);		// Implements a full 16-bit adder
	
	input  [15:0] in1, in2;
	output [15:0] out;

	assign out = in1 + in2;
	
endmodule

`endif
