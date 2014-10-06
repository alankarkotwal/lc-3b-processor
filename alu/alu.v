`include "adder.v"
`include "not.v"
`include "xor.v"
`include "and.v"
`include "left_shift.v"
`include "right_shift_logical.v"
`include "right_shift_arithmetic.v"
`include "../reg-file/register.v"
`include "../misc/mux.v"

module alu(in1, in2, op, shift, out, zero, positive, negative); // Add more CCR flags, add logic for selecting ovf according to operation. Change shift
	output [15:0] out;
	input  [15:0] in1, in2;
	input  [2:0]  op;
	input  [3:0]  shift;
	output        zero, positive,negative;
	
	wire   [15:0] outAdd, outAnd, outNot, outXor, outLshf, outRshfl, outRshfa;
	
	
	mux16x8 m1(outAdd, outAnd, outNot, outXor, outLshf, outRshfl, outRshfa, 16'b0, op, out);
	
	adder16 add1(in1, in2, outAdd, zero,positive,negative);
	and16   and1(in1, in2, outAnd);
	not16   not1(in1,  outNot);
	xor16   xor1(in1, in2, outXor);
	left_shift lshf1(in1,  outLshf, shift);
	right_shift_logical rshfl1(in1, outRshfl, shift);
	right_shift_arithmetic rshfa1(in1, outRshfa, shift);
endmodule
