module right_shift_arithmetic(in, out, shift);
	output [15:0] out;
	input  [15:0] in;
	input  [3:0]  shift;
	
	assign out = (in << shift) | (in >> ~shift);
endmodule