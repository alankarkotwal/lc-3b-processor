`ifndef _ALU
`define _ALU

module alu(in1, in2, op, shift, out, zero, positive, negative); 
	
	output [15:0] out;
	input  [15:0] in1, in2;
	input  [2:0] op;
	input  [3:0] shift;
	output zero, positive,negative;
	
	nor n1(zero,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15]);
	assign positive = ~out[15];
	assign negative = out[15];
	wire [15:0] outAdd, outAnd, outNot, outXor, outLshf, outRshfl, outRshfa;
	mux16x8 m1(outAdd, outAnd, outNot, outXor, outLshf, outRshfl, outRshfa, 16'b0, op, out);
	adder16 add1(in1, in2, outAdd);
	and16 and1(in1, in2, outAnd);
	not16 not1(in1, outNot);
	xor16 xor1(in1, in2, outXor);
	left_shift lshf1(in1, outLshf, shift);
	right_shift_logical rshfl1(in1, outRshfl, shift);
	right_shift_arithmetic rshfa1(in1, outRshfa, shift);
	
endmodule

`endif
