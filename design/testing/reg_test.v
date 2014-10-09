`include "../reg-file/register.v"
`include "../reg-file/register_file.v"
`include "../misc/mux.v"
`include "../misc/demux.v"

module alu_test();

	wire [15:0] out1, out2;
	reg  [15:0] in;
	reg  [2:0]  readAdd1, readAdd2, writeAdd;
	reg         write, clk, reset;

	register_file rfile(clk, out1, out2, readAdd1, readAdd2, write, writeAdd, in, reset);
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0);
		reset = 1;
		clk = 0;
		write = 1;
		writeAdd = 6;
		in = 16'd455;
		#500 $finish;
	end
	
	always begin
		#1 clk = ~clk;
	end
	
	initial begin
		#5  write = 0;
		#2  write = 1;
		#1  writeAdd = 2; in = 16'd4817;
		#5  write = 0;
		#2  write = 1;
		#1  writeAdd = 0; in = 16'd18431;
		#5  write = 0;
		#2  write = 1;
		#1  writeAdd = 3; in = 16'd848;
		#5  write = 0;
		#2  write = 1; 
		#1  writeAdd = 5; in = 16'd4;
		#5  write = 0;
		#2  write = 1;
		#1  writeAdd = 7; in = 16'd8463;
		#5  write = 0;
		#2  write = 1;
		#1  writeAdd = 1; in = 16'd23584;
		#5  write = 0;
		#2  write = 1;
		#1  writeAdd = 4; in = 16'd42;
		#5  write = 0;
		#2  write = 1;
		#1  writeAdd = 0; in = 16'd0;
		#10 readAdd1 = 5; readAdd2 = 7;
		#5  readAdd1 = 2; readAdd2 = 0;
	end
	
endmodule
