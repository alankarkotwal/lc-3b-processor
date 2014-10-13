`include "../../controller.v"

module controller_test();

	reg  [15:0] IR;
	reg  clk, N, Z, P;
	wire [4:0] StateID;
	wire Mux1;
	wire [1:0] Mux2;
	wire [2:0] Mux3;
	wire [1:0] Mux4;
	wire [1:0] Mux5;
	wire [1:0] Mux6;
	wire [1:0] Mux7;
	wire Mux11;
	wire Mux12;
	wire wrf;
	wire wpc;
	wire wir;
	wire lccr;
	wire [1:0] aluop;
	wire [1:0] alushop;
	wire wmem;

	controller c1(clk, IR, N, Z, P, StateID, Mux1, Mux2, Mux3, Mux4, Mux5, Mux6, Mux7, Mux11, Mux12, wrf, wpc, wir, lccr, aluop, alushop, wmem);
	
	initial begin
		$dumpfile("test.vcd");
		$dumpvars(0);
		clk = 0;
		IR = 16'b0110000000000000;
		N = 0;
		P = 0;
		Z = 0;
		#500 $finish;
	end
	
	always begin
		#5 clk=~clk;
	end

endmodule
