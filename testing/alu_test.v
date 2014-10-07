`include "../alu/alu.v"

`include "../alu/adder.v"
`include "../alu/and.v"
`include "../alu/not.v"
`include "../alu/xor.v"
`include "../alu/left_shift.v"
`include "../alu/right_shift_arithmetic.v"
`include "../alu/right_shift_logical.v"
`include "../misc/mux.v"
`include "../misc/demux.v"

module alu_test();

	wire [15:0] out;
	reg  [15:0] in1, in2;
	reg  [2:0] op;
	reg  [3:0] shift;
	wire zero, positive, negative;

	alu alu1(in1, in2, op, shift, out, zero, positive, negative);

	initial begin
		in1 =   16'd15;
		in2 =   16'd37;
		op  =   3'b0;
		shift = 4'd13;
	end
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(1, in1, in2, out, op,	 zero, positive, negative);
		#10 $finish;
	end
	
endmodule
