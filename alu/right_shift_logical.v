`ifndef _RSHFL
`define _RSHFL

module right_shift_logical(in, out, shift);

	output [15:0] out;
	input  [15:0] in;
	input  [3:0]  shift;
	
	assign out = in >> shift;
	
endmodule

`endif
