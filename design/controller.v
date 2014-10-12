module controller(clk, IR, N, Z, P, StateID, Mux1, Mux2, Mux3, Mux4, Mux5, Mux6, Mux7, Mux8, Mux9, Mux10, Mux11, Mux12, wrf, wpc, wir, lccr, aluop, alushop, rmwmb, lalu, ltempdr);		// Implements the designed controller for LC-3b.

	input  [15:0] IR;
	input  clk, N, Z, P;
	output StateID;
	output Mux1;
	output [1:0] Mux2;
	output [2:0] Mux3;
	output [1:0] Mux4;
	output [1:0] Mux5;
	output [1:0] Mux6;
	output [1:0] Mux7;
	output Mux8;
	output Mux9;
	output Mux10;
	output Mux11;
	output Mux12;
	output wrf;
	output wpc;
	output [1:0] wir;
	output lccr;
	output [1:0] aluop;
	output [1:0] alushop;
	output rmwmb;
	output lalu;
	output [3:0] ltempdr;

endmodule
