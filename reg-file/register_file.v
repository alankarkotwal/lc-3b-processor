`include "register.v"
`include "../misc/mux.v"

module register_file(clk, out1, out2, readAdd1, readAdd2, write, writeAdd, in, reset); // clk, out, in, write, reset
	output [15:0] out1, out2;
	input  [15:0] in;
	input  [2:0]  readAdd1, readAdd2, writeAdd;
	input         write, clk, reset;
	
	wire   [15:0] data0, data1, data2, data3, data4, data5, data6, data7;
	
	register16 r0(clk, data0, in, reset);
	register16 r1();
	register16 r2();
	register16 r3();
	register16 r4();
	register16 r5();
	register16 r6();
	register16 r7();
endmodule
