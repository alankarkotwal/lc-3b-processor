module controller(clk, IR, N, Z, P, StateID, Mux1, Mux2, Mux3, Mux4, Mux5, Mux6, Mux7, Mux8, Mux9, Mux10, Mux11, Mux12, wrf, wpc, wir, lccr, aluop, alushop, rmwmb, lalu, ltempdr);		// Implements the designed controller for LC-3b.

	input  [15:0] IR;
	input  clk, N, Z, P;
	output [4:0] StateID;
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

	assign Mux8 =  IR[5];
	assign Mux9 =  (IR[11] && N) || (IR[10] && Z) || (IR[9] && P);
	assign Mux10 = IR[11];

	always@(posedge clk) begin
		case(StateID) begin
			1: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b01
				Mux5 = 2'b01
				Mux6 = 2'b10
				Mux7 = 2'b10
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b0
				wir = 2'b10
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			2: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b01
				Mux5 = 2'b01
				Mux6 = 2'b10
				Mux7 = 2'b10
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b0
				wir = 2'b01
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			3: begin
				Mux1 = 1'b1
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			4: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b0
				aluop = 2'bIR[15]IR[14]
				alushop = 2'bIR[5]IR[4]
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			5: begin
				Mux1 = 1'b0
				Mux2 = 2'b11
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b0
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			6: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b011
				Mux4 = 2'b01
				Mux5 = 2'b00
				Mux6 = 2'b10
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b0
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			7: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b01
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b0
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			8: begin
				Mux1 = 1'b0
				Mux2 = 2'b10
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b1
				Mux12 = 1'b0
				wrf = 1'b0
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			9: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b001
				Mux4 = 2'b01
				Mux5 = 2'b00
				Mux6 = 2'b01
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b0
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			10: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			11: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b01
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			12: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b10
				Mux5 = 2'b10
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b0
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b0
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			13: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b010
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			14: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b01
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			15: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1110
				state = 0
			end
			16: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b11
				Mux5 = 2'b01
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			17: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b01
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			18: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1101
				state = 0
			end
			19: begin
				Mux1 = 1'b0
				Mux2 = 2'b01
				Mux3 = 3'b000
				Mux4 = 2'b10
				Mux5 = 2'b10
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b0
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b0
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			20: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b011
				Mux4 = 2'b01
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b0
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			21: begin
				Mux1 = 1'b0
				Mux2 = 2'b11
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b0
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			22: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			23: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b101
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			24: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1011
				state = 0
			end
			25: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b01
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b0
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			26: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b010
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			27: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b0011
				state = 0
			end
			28: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b01
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b0
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
			29: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b11
				Mux5 = 2'b01
				Mux6 = 2'b00
				Mux7 = 2'b00
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b0
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b0
				ltempdr = 4'b1111
				state = 0
			end
			30: begin
				Mux1 = 1'b0
				Mux2 = 2'b00
				Mux3 = 3'b000
				Mux4 = 2'b00
				Mux5 = 2'b00
				Mux6 = 2'b00
				Mux7 = 2'b01
				Mux8 = 1'bIR[5]
				Mux9 = 1'b(IR[11] && N) || (IR[10] && Z) || (IR[9] && P)
				Mux10 = 1'bIR[11]
				Mux11 = 1'b0
				Mux12 = 1'b1
				wrf = 1'b1
				wpc = 1'b1
				wir = 2'b11
				lccr = 1'b1
				aluop = 2'b00
				alushop = 2'b00
				rmwmb = 1'b1
				lalu = 1'b1
				ltempdr = 4'b1111
				state = 0
			end
		endcase
	end

endmodule