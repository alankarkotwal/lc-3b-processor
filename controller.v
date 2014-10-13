module controller(clk, IR, N, Z, P, StateID, Mux1, Mux2, Mux3, Mux4, Mux5, Mux6, Mux7, Mux11, Mux12, wrf, wpc, wir, lccr, aluop, alushop, wmem);		// Implements the designed controller for LC-3b.

	input  [15:0] IR;
	input  clk, N, Z, P;
	output reg [4:0] StateID;
	output reg Mux1;
	output reg [1:0] Mux2;
	output reg [2:0] Mux3;
	output reg [1:0] Mux4;
	output reg [1:0] Mux5;
	output reg [1:0] Mux6;
	output reg [1:0] Mux7;
	output reg Mux11;
	output reg Mux12;
	output reg wrf;
	output reg wpc;
	output reg wir;
	output reg lccr;
	output reg [1:0] aluop;
	output reg [1:0] alushop;
	output reg wmem;

	assign Mux8 =  IR[5];
	assign Mux9 =  (IR[11] && N) || (IR[10] && Z) || (IR[9] && P);
	assign Mux10 = IR[11];

	always@(posedge clk) begin
		case(StateID)
			1: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b111;
				Mux4 = 2'b01;
				Mux5 = 2'b01;
				Mux6 = 2'b10;
				Mux7 = 2'b10;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b0;
				wir = 1'b0;
				lccr = 1'b1;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
			end
			2: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b000;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b1;
			end
			3: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b111;
				Mux4 = 2'b00;
				Mux5 = 2'b00;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b0;
				aluop = {IR[15], IR[14]};
				alushop = {IR[5], IR[4]};
				wmem = 1'b1;
				
				StateID = 4;
			end
			4: begin
				Mux1 = 1'b1;
				Mux2 = 2'b01;
				Mux3 = 3'b111;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b0;
				Mux12 = 1'b0;
				wrf = 1'b0;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 1;
			end
			5: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b011;
				Mux4 = 2'b01;
				Mux5 = 2'b00;
				Mux6 = 2'b00;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b0;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 1;
			end
			6: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b111;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b0;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 1;
			end
			7: begin
				Mux1 = 1'b1;
				Mux2 = 2'b10;
				Mux3 = 3'b111;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b0;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 2;
			end
			8: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b001;
				Mux4 = 2'b01;
				Mux5 = 2'b00;
				Mux6 = 2'b01;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b0;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 1;
			end
			9: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b101;
				Mux4 = 2'b00;
				Mux5 = 2'b00;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 10;
			end
			10: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b111;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b01;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 11;
			end
			11: begin
				Mux1 = 1'b1;
				Mux2 = 2'b00;
				Mux3 = 3'b111;
				Mux4 = 2'b10;
				Mux5 = 2'b10;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b0;
				Mux12 = 1'b0;
				wrf = 1'b0;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b0;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 1;
			end
			12: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b010;
				Mux4 = 2'b00;
				Mux5 = 2'b00;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 10;
			end
			13: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b011;
				Mux4 = 2'b01;
				Mux5 = 2'b00;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b0;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 14;
			end
			14: begin
				Mux1 = 1'b1;
				Mux2 = 2'b01;
				Mux3 = 3'b111;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b0;
				Mux12 = 1'b0;
				wrf = 1'b0;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 1;
			end
			15: begin
				Mux1 = 1'b0;
				Mux2 = 2'b11;
				Mux3 = 3'b111;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b1;
			end
			16: begin
				Mux1 = 1'b0;
				Mux2 = 2'b11;
				Mux3 = 3'b101;
				Mux4 = 2'b00;
				Mux5 = 2'b00;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 17;
			end
			17: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b111;
				Mux4 = 2'b11;
				Mux5 = 2'b11;
				Mux6 = 2'b11;
				Mux7 = 2'b01;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b11;
				alushop = 2'b11;
				wmem = 1'b0;
				
				StateID = 1;
			end
			18: begin
				Mux1 = 1'b1;
				Mux2 = 2'b11;
				Mux3 = 3'b010;
				Mux4 = 2'b00;
				Mux5 = 2'b00;
				Mux6 = 2'b11;
				Mux7 = 2'b11;
				Mux11 = 1'b1;
				Mux12 = 1'b0;
				wrf = 1'b1;
				wpc = 1'b1;
				wir = 1'b1;
				lccr = 1'b1;
				aluop = 2'b00;
				alushop = 2'b11;
				wmem = 1'b1;
				
				StateID = 17;
			end
			default: begin
				Mux1 = 1'b0;
				Mux2 = 2'b00;
				Mux3 = 3'b000;
				Mux4 = 2'b00;
				Mux5 = 2'b00;
				Mux6 = 2'b00;
				Mux7 = 2'b00;
				Mux11 = 1'b0;
				Mux12 = 1'b0;
				wrf = 1'b0;
				wpc = 1'b0;
				wir = 1'b0;
				lccr = 1'b0;
				aluop = 2'b00;
				alushop = 2'b00;
				wmem = 1'b0;
				
				StateID = 1;
			end
		endcase
	end
	
	always@(*) begin
		case(StateID)
			1: begin
				case(IR[15:12])
					1:  StateID=2;
					5:  StateID=2;
					9:  StateID=2;
					13: StateID=2;
					0:  StateID=5;
					4:  StateID=7;
					3:  StateID=15;
					default: StateID=1;
				endcase
			end
			2: begin
				case(IR[15:12])
					1:  StateID=2;
					5:  StateID=2;
					9:  StateID=2;
					13: StateID=2;
					12: StateID=6;
					2:  StateID=9;
					6:  StateID=12;
					4:  StateID=8;
					default: StateID=1;
				endcase
			end
			15: begin
				case(IR[15:12])
					3:  StateID = 16;
					7:  StateID = 18;
					default: StateID=1;
				endcase
			end
			default: StateID=1;
		endcase
	end

endmodule
