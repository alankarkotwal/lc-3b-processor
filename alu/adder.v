module adder16(in1, in2 , out);		// Implements a full 16-bit adder
	input  [15:0] in1, in2;
	output [15:0] out;

	
	wire carry0, carry1,  carry2,  carry3,  carry4,  carry5,  carry6,  carry7,
	     carry8, carry9, carry10, carry11, carry12, carry13, carry14;
	
	adder1  a0(in1[0],   in2[0], 1'b0, out[0], carry0);
	adder1  a1(in1[1],   in2[1], carry0,   out[1], carry1);
	adder1  a2(in1[2],   in2[2], carry1,   out[2], carry2);
	adder1  a3(in1[3],   in2[3], carry2,   out[3], carry3);
	adder1  a4(in1[4],   in2[4], carry3,   out[4], carry4);
	adder1  a5(in1[5],   in2[5], carry4,   out[5], carry5);
	adder1  a6(in1[6],   in2[6], carry5,   out[6], carry6);
	adder1  a7(in1[7],   in2[7], carry6,   out[7], carry7);
	adder1  a8(in1[8],   in2[8], carry7,   out[8], carry8);
	adder1  a9(in1[9],   in2[9], carry8,   out[9], carry9);
	adder1 a10(in1[10], in2[10], carry9,  out[10], carry10);
	adder1 a11(in1[11], in2[11], carry10, out[11], carry11);
	adder1 a12(in1[12], in2[12], carry11, out[12], carry12);
	adder1 a13(in1[13], in2[13], carry12, out[13], carry13);
	adder1 a14(in1[14], in2[14], carry13, out[14], carry14);
	adder1 a15(.in1(in1[15]), .in2(in2[15]), .carry_in(carry14), .out(out[15]));
	
endmodule


module adder1(in1, in2, carry_in, out, carry_out);
	input in1, in2, carry_in;
	
	output out;
	output carry_out;
	
	wire andInputs, xorInputs, andCin;
	
	xor x1(out, in1, in2);
	and a1(andInputs, in1, in2);
	xor x2(xorInputs, in1, in2);
	and a2(andCin, xorInputs, carry_in);
	or o1(carry_out, andInputs, andCin);
endmodule
