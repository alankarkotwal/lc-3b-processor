`include "../alu/alu.v"

module alu_test(in1, in2, op, shift, out, zero, positive, negative);

	output [15:0] out;
	input  [15:0] in1, in2;
	input  [2:0] op;
	input  [3:0] shift;
	output zero, positive,negative;

	alu alu1(in1, in2, op, shift, out, zero, positive, negative);

	initial begin
		in1 =   16'd15;
		in1 =   16'd37;
		op  =   3'b0;
		shift = 4'd13;
	end
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(1, out, zero, positive, negative);
	end
	
endmodule
