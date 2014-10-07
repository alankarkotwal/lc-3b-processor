`ifndef _XOR
`define _XOR

module xor16(in1, in2, out);		// Implements bitwise XOR for two 16-bit numbers

	input  [15:0] in1, in2;
	output [15:0] out;
	
	assign out = in1 ^ in2;
	
endmodule

`endif
