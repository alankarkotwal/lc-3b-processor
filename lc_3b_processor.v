
//----------------------------------------------------------------------------------------
module lc_3b_processor(clk,reset,clk_1);//r8
input clk,reset,clk_1;//use 128 as depth not 128
wire [15:0] IR;
wire N, Z, P;
wire   [4:0] StateID;
wire   Mux1;
wire   [1:0] Mux2;
wire   [2:0] Mux3;
wire   [1:0] Mux4;
wire   [1:0] Mux5;
wire   [1:0] Mux6;
wire   [1:0] Mux7;
wire   Mux11;
wire   wrf;
wire   wpc;
wire   wir;
wire   lccr;
wire   [1:0] aluop;
wire   [1:0] alushop;
wire   wmem;
 wire wa,wb, lalu;
wire [15:0]ALUreg_wire,ALU_out_wire;
wire [15:0]A_out_wire,B_out_wire,PC_out_wire;
wire[15:0]outir;
datapath d1(.reset(reset),.clk(clk),.IR(IR),.N(N), .P(P), .Z(Z), .Mux1(Mux1), .Mux2(Mux2), .Mux3(Mux3), .Mux4(Mux4),
 .Mux5(Mux5), .Mux6(Mux6), .Mux7(Mux7), .Mux11(Mux11), .wrf(wrf), .wpc(wpc), .wir(wir), .lccr(lccr), .aluop(aluop),
 .alushop(alushop), .wmem(wmem), .ALUreg_wire(ALUreg_wire), .A_out_wire(A_out_wire), .B_out_wire(B_out_wire), 
 .PC_out_wire(PC_out_wire), .ALU_out_wire(ALU_out_wire),.wa(wa),.wb(wb), .lalu(lalu),.outir(outir));
 
controller c1(.reset(reset),.clk(clk), .IR(IR), .N(N), .Z(Z), .P(P), .StateID(StateID), .Mux1(Mux1), .Mux2(Mux2), .Mux3(Mux3),
 .Mux4(Mux4), .Mux5(Mux5), .Mux6(Mux6), .Mux7(Mux7), .Mux11(Mux11), .wrf(wrf), .wpc(wpc), .wir(wir), 
 .lccr(lccr), .aluop(aluop), .alushop(alushop), .wmem(wmem),.wa(wa),.wb(wb), .lalu(lalu));

 endmodule
 
 
 
 
 
 
 
 
module controller(reset,clk, IR, N, Z, P, StateID, Mux1, Mux2, Mux3, Mux4, Mux5, Mux6, Mux7, Mux11, wrf, wpc, wir,wa,wb, lccr, aluop, alushop, wmem, nextStateID, lalu);	// Implements the designed controller for LC-3b.
input [15:0] IR;
input clk, N, Z, P,reset;
output reg [4:0] StateID;
output reg Mux1;
output reg [1:0] Mux2;
output reg [2:0] Mux3;
output reg [1:0] Mux4;
output reg [1:0] Mux5;
output reg [1:0] Mux6;
output reg [1:0] Mux7;
output reg Mux11;
output reg wrf;
output reg wpc;
output reg wir;
output reg wa;
output reg wb;
output reg lalu;
output reg lccr;
output reg [1:0] aluop;
output reg [1:0] alushop;
output reg wmem;
output reg [4:0] nextStateID;
always@(*) begin


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

wrf = 1'b1;
wpc = ~|IR;
wir = 1'b0;
lccr = 1'b1;
aluop = 2'b00;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
2: begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b111;
Mux4 = 2'b11;
Mux5 = 2'b11;
Mux6 = 2'b11;
Mux7 = 2'b11;
Mux11 = 1'b1;

wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b0;
wb = 1'b0;
lalu = 1'b1;
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
 
wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b0;
aluop = {IR[15], IR[14]};
alushop = {IR[5], IR[4]};
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b0;
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
 
wrf = 1'b0;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
5: begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b010;
Mux4 = 2'b01;
Mux5 = 2'b11;
Mux6 = 2'b00;
Mux7 = 2'b11;
Mux11 = 1'b1;
 
wrf = 1'b1;
wpc = 1'b0;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b00;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
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
 
wrf = 1'b1;
wpc = 1'b0;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
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
 
wrf = 1'b0;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
8: begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b000;
Mux4 = 2'b01;
Mux5 = 2'b11;
Mux6 = 2'b01;
Mux7 = 2'b11;
Mux11 = 1'b1;
 
wrf = 1'b1;
wpc = 1'b0;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b00;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
9: begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b100;
Mux4 = 2'b00;
Mux5 = 2'b11;
Mux6 = 2'b11;
Mux7 = 2'b11;
Mux11 = 1'b1;
 
wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b00;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b0;
end
10: begin
Mux1 = 1'b0;
Mux2 = 2'b11;
Mux3 = 3'b111;
Mux4 = 2'b11;
Mux5 = 2'b11;
Mux6 = 2'b11;
Mux7 = 2'b11;
Mux11 = 1'b1;

wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b0;
wb = 1'b1;
lalu = 1'b1;
end
11: begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b111;
Mux4 = 2'b11;
Mux5 = 2'b11;
Mux6 = 2'b11;
Mux7 = 2'b01;	
Mux11 = 1'b1;
 
wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b0;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
12:begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b001;
Mux4 = 2'b00;
Mux5 = 2'b11;
Mux6 = 2'b11;
Mux7 = 2'b11;
Mux11 = 1'b1;
 
wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b00;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b0;
end

13:begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b111;
Mux4 = 2'b11;
Mux5 = 2'b11;
Mux6 = 2'b11;
Mux7 = 2'b01;
Mux11 = 1'b1;
 
wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
14:begin
Mux1 = 1'b1;
Mux2 = 2'b00;
Mux3 = 3'b111;
Mux4 = 2'b10;
Mux5 = 2'b10;
Mux6 = 2'b11;
Mux7 = 2'b01;
Mux11 = 1'b0;
 
wrf = 1'b0;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b0;
aluop = 2'b00;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
15:begin
Mux1 = 1'b1;
Mux2 = 2'b11;
Mux3 = 3'b010;
Mux4 = 2'b01;
Mux5 = 2'b11;//three not dc
Mux6 = 2'b11;
Mux7 = 2'b11;
Mux11 = 1'b1;
 
wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b0;
aluop = 2'b00;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b0;
end
16:begin
Mux1 = 1'b1;
Mux2 = 2'b01;
Mux3 = 3'b111;
Mux4 = 2'b11;
Mux5 = 2'b11;
Mux6 = 2'b11;
Mux7 = 2'b11;
Mux11 = 1'b0;
 
wrf = 1'b0;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b11;
alushop = 2'b11;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
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
 
wrf = 1'b1;
wpc = 1'b1;
wir = 1'b1;
lccr = 1'b1;
aluop = 2'b00;
alushop = 2'b00;
wmem = 1'b1;
wa = 1'b1;
wb = 1'b1;
lalu = 1'b1;
end
endcase
end

always@(posedge clk) begin
	if(reset ==0)
		StateID = 0;
	else
	StateID = nextStateID;
end

always@(*) begin

	if(reset == 1) begin

	case(StateID)
		0: nextStateID=1;
		1: begin
			if(IR ==0)
				nextStateID=1;
			else
			case(IR[15:12])
				0: nextStateID=5;//
				4: nextStateID=7;//
				14: nextStateID=15;//
				default: nextStateID=2;
			endcase
			
		end
		2: begin
			case(IR[15:12])
				7: nextStateID=12;
				6: nextStateID=12;
				3: nextStateID=9;
				2: nextStateID=9;
				12: nextStateID=6;
				4: nextStateID=8;
				default: nextStateID=3;
			endcase
		end
		3: nextStateID=4;
		4: nextStateID=1;
		5: nextStateID=1;
		6: nextStateID=1;
		7: nextStateID=2;
		8: nextStateID=1;
		9: begin
			case(IR[15:12])
				
				3: nextStateID=10;
				2: nextStateID=13;
				
				default: nextStateID=10;
			endcase
		end
		
		10: nextStateID=11;
		11: nextStateID=1;
		12: begin
				case(IR[15:12])
				7: nextStateID=10;
				6: nextStateID=13;
				default: nextStateID=10;
			endcase
		end
		13: nextStateID=14;
		14: nextStateID=1;
		15: nextStateID=16;
		
		16: nextStateID=1;
		default: nextStateID=1;
	endcase
end
else 
nextStateID = 1;
end
	
endmodule




module datapath(reset,clk,IR,N,P,Z,Mux1,Mux2,Mux3,Mux4,Mux5,Mux6,Mux7,Mux11,wrf, wpc, wir, wa,wb,lccr, aluop, alushop, wmem
,ALUreg_wire,A_out_wire,B_out_wire,PC_out_wire,ALU_out_wire, mem_out_wire, mdr_wire, lalu,outir);
input clk,reset;
output [15:0]IR;
input Mux1,Mux11;
input [1:0] Mux2,Mux4,Mux5,Mux6,Mux7;
input [2:0]Mux3;
output N,P,Z;
input wrf, wpc, wir, lccr, wmem,wa,wb, lalu;
input[1:0] aluop, alushop;
output [15:0]ALUreg_wire,A_out_wire,B_out_wire,PC_out_wire,ALU_out_wire;//
wire [15:0] A_out_wire,ALUreg_wire,PC_out_wire,mem_address_wire;
wire[15:0] mux6_in_1_wire,mux6_in_0_wire;
output wire[15:0] mem_out_wire, mdr_wire,outir;
mux16x2 m7(.data0(A_out_wire),.data1(ALUreg_wire),.data2(PC_out_wire),.data3(PC_out_wire),.selectinput(Mux7),.out(mem_address_wire));//data3 is never slelcted(just done this to prevent latch formation

mem16 memory(.outir(outir),.address(mem_address_wire), .write(wmem),.clk(clk), .in(A_out_wire),.out(mem_out_wire),.ir14(IR[14]), .reset(reset));

latch16 inst_reg(.in(outir),.out(IR),.write(wir));
latch16 mdr(.in(mem_out_wire),.out(mdr_wire),.write(1'b0));

wire [2:0] IA1_wire,WA_wire;

mux3x1 m1(.data0(IR[11:9]),.data1(IR[8:6]),.selectinput(Mux1),.out(IA1_wire));
mux3x1 m11(.data0(IR[11:9]),.data1(3'd7),.selectinput(Mux11),.out(WA_wire)); // Is this right ?
wire [15:0]reg_file_data_in_wire;
mux16x2 m2(.data0(mdr_wire),.data1(ALUreg_wire),.data2(PC_out_wire),.data3(PC_out_wire),.selectinput(Mux2),.out(reg_file_data_in_wire));
wire [15:0]data0,data1,data2,data3,data4,data5,data6,data7;
wire[15:0] A_in_wire,B_in_wire,regfile_out2_wire;
register_file rf1(.clk(clk), .out1(A_in_wire), .out2(regfile_out2_wire),
 .readAdd1(IA1_wire),.readAdd2(IR[2:0]),.write(wrf),.writeAdd(WA_wire),.in(reg_file_data_in_wire), .reset(reset),.data0(data0),.data1(data1),.data2(data2),.data3(data3),.data4(data4), .data5(data5), .data6(data6), .data7(data7));

wire[15:0] sext11_0_wire, sext8_0_wire,sext5_0_wire;

 
sext12 s11_0(.in(IR[10:0]),.out(sext11_0_wire));
sext9 s8_0(.in(IR[8:0]),.out(sext8_0_wire));
sext6 s5_0(.in(IR[5:0]),.out(sext5_0_wire));

wire[15:0] lshf11_0_wire, lshf8_0_wire,lshf5_0_wire;

lshift1 lshf11_0(.in(sext11_0_wire),.out(lshf11_0_wire));
lshift1 lshf8_0(.in(sext8_0_wire),.out(lshf8_0_wire));
lshift1 lshf5_0(.in(sext5_0_wire),.out(lshf5_0_wire));

wire [15:0] mux5_in_3_wire;
mux16x1 m8(.data0(regfile_out2_wire),.data1(sext5_0_wire),.selectinput(IR[5]),.out(B_in_wire));
mux16x3 m3(.data0(lshf11_0_wire),.data1(lshf5_0_wire),.data2(lshf8_0_wire),.data3(sext11_0_wire),.data4(sext5_0_wire),.selectinput(Mux3),.out(mux5_in_3_wire));

wire[15:0] B_out_wire;

register16 A (.clk(clk), .out(A_out_wire),.in(A_in_wire),.write(wa),.reset(reset));

register16 B (.clk(clk), .out(B_out_wire),.in(B_in_wire),.write(wb),.reset(reset));

wire[15:0] ALU_in_1_wire,ALU_in_2_wire;

mux16x2 m4(.data0(A_out_wire),.data1(PC_out_wire),.data2(mdr_wire),.data3(mdr_wire),.selectinput(Mux4),.out(ALU_in_1_wire));
mux16x2 m5 (.data0(B_out_wire),.data1(16'd2),.data2(16'd0),.data3(mux5_in_3_wire),.selectinput(Mux5),.out(ALU_in_2_wire));

wire[15:0]ALU_out_wire;
wire zero,negative,positive;
alu ALU(.in1(ALU_in_1_wire), .in2(ALU_in_2_wire),.op(aluop), .shop(alushop),.shift(IR[3:0]), .out(ALU_out_wire), .zero(zero),.positive(positive),.negative(negative));
register1b neg_reg(.clk(clk),.out(N),.in(negative),.write(lccr),.reset(reset));
register1b pos_reg(.clk(clk),.out(P),.in(positive),.write(lccr),.reset(reset));
register1b zero_reg(.clk(clk),.out(Z),.in(zero),.write(lccr),.reset(reset));

wire[15:0] PC_in_wire;

register16 PC (.clk(clk), .out(PC_out_wire),.in(PC_in_wire),.write(wpc),.reset(reset));
wire hc;
assign hc =( (IR[11]&&N)|| (IR[10]&&Z)||(IR[9]&&P));

mux16x1 m9(.data0(PC_out_wire),.data1(ALU_out_wire),.selectinput(hc),.out(mux6_in_0_wire));

register16 ALUreg(.clk(clk),.out(ALUreg_wire),.in(ALU_out_wire),.write(lalu),.reset(reset));




mux16x1 m10(.data0(A_out_wire),.data1(ALU_out_wire),.selectinput(IR[11]),.out(mux6_in_1_wire));

mux16x2 m6(.data0(mux6_in_0_wire),.data1(mux6_in_1_wire),.data2(ALU_out_wire),.data3(A_out_wire),.selectinput(Mux6),.out(PC_in_wire));
endmodule




module sext9(in,out);
input [8:0] in;
output[15:0] out;

assign out= {{7{in[8]}},in[8:0]};

endmodule

module sext12(in,out);

input [10:0] in;
output[15:0] out;

assign out= {{4{in[10]}},in[10:0]};

endmodule

module sext6(in,out);

input [5:0] in;
output[15:0] out;

assign out= {{10{in[5]}},in[5:0]};

endmodule


module register16(clk, out, in, write, reset); // Negedge-triggered flipflop register with active-low write signal and reset
output reg [15:0] out;
input [15:0] in;
input clk, write, reset;
always@(posedge clk) begin
if(reset==0) begin
out = 16'b0;
end
else if(write == 1'b0) begin
out = in;
end
end
endmodule

module register1b(clk, out, in, write, reset); // Negedge-triggered 1 bit flipflop register for with active-low write signal and reset
output reg out;
input in;
input clk, write, reset;
always@(posedge clk) begin
if(reset==0) begin
out = 1'b0;
end
else if(write == 1'b0) begin
out = in;
end
end
endmodule


module register_file(clk, out1, out2, readAdd1, readAdd2, write, writeAdd, in, reset,data0,data1,data2,data3,data4, data5, data6, data7);
output [15:0] out1, out2;
input [15:0] in;
input [2:0] readAdd1, readAdd2, writeAdd;
input write, clk, reset;
output wire [15:0] data0, data1, data2, data3, data4, data5, data6, data7;
wire [7:0] writeLinesInit, writeLines;
demux8 dem(writeAdd, writeLinesInit);
mux16x8 mux1(data0, data1, data2, data3, data4, data5, data6, data7, readAdd1, out1);
mux16x8 mux2(data0, data1, data2, data3, data4, data5, data6, data7, readAdd2, out2);
or a0(writeLines[0], write, ~writeLinesInit[0]);
or a1(writeLines[1], write, ~writeLinesInit[1]);
or a2(writeLines[2], write, ~writeLinesInit[2]);
or a3(writeLines[3], write, ~writeLinesInit[3]);
or a4(writeLines[4], write, ~writeLinesInit[4]);
or a5(writeLines[5], write, ~writeLinesInit[5]);
or a6(writeLines[6], write, ~writeLinesInit[6]);
or a7(writeLines[7], write, ~writeLinesInit[7]);
register16 r0(clk, data0, in, writeLines[0], reset);
register16 r1(clk, data1, in, writeLines[1], reset);
register16 r2(clk, data2, in, writeLines[2], reset);
register16 r3(clk, data3, in, writeLines[3], reset);
register16 r4(clk, data4, in, writeLines[4], reset);
register16 r5(clk, data5, in, writeLines[5], reset);
register16 r6(clk, data6, in, writeLines[6], reset);
register16 r7(clk, data7, in, writeLines[7], reset);
endmodule





module mux16x1(data0,data1,selectinput,out);//used in mux 1,8,9,10,11
input [15:0] data0,data1;
input selectinput;
output reg [15:0] out;



always @(*)
begin

case (selectinput)
0:
	out = data0;
1:
	out = data1;
default:
	out = data0;
endcase

end
	
endmodule


module mux3x1(data0,data1,selectinput,out);//used in mux 1,8,9,10,11
input [2:0] data0,data1;
input selectinput;
output reg [2:0] out;



always @(*)
begin

case (selectinput)
0:
	out = data0;
1:
	out = data1;
default:
	out = data0;
endcase

end
	
endmodule


module mux16x2(data0,data1,data2,data3,selectinput,out);//used in mux 2,4,5,6,7
input [15:0] data0,data1,data2,data3;
input [1:0]selectinput;
output reg [15:0] out;



always @(*)
begin

case (selectinput)
0:
	out = data0;
1:
	out = data1;
2:
	out = data2;
3:
	out = data3;
default:
	out = data0;
endcase

end
	
endmodule

module mux16x3(data0,data1,data2,data3,data4,data5,selectinput,out);//used in mux 2,4,5,6,7
input [15:0] data0,data1,data2,data3,data4,data5;
input [2:0]selectinput;
output reg [15:0] out;



always @(*)
begin

case (selectinput)
0:
	out = data0;
1:
	out = data1;
2:
	out = data2;
3:
	out = data3;
4:
	out = data4;
5:
	out = data5;
default:
	out = data0;
endcase

end
	
endmodule

module muxalu(data0, data1, data2, data3, data4, data5, op, shop, out); // 8-16bit-input mux
output reg [15:0] out;
input [15:0] data0, data1, data2, data3, data4, data5;
input [1:0] op;
input [1:0]shop;


always@(*) begin
	case(op)
		0: out = data0;
		1: out = data1;
		2: out = data2;
		default:
			case(shop)
				0: out = data3;
				1: out = data4;
				3: out = data5;
				default: out = data5;
			endcase
	endcase
end

endmodule

module mux16x8(data0, data1, data2, data3, data4, data5, data6, data7, selectInput, out); // 8-16bit-input mux
output reg [15:0] out;
input [15:0] data0, data1, data2, data3, data4, data5, data6, data7;
input [2:0] selectInput;
always@(data0 or data1 or data2 or data3 or data4 or data5 or data6 or data7 or selectInput) begin
case(selectInput)
0: out = data0;
1: out = data1;
2: out = data2;
3: out = data3;
4: out = data4;
5: out = data5;
6: out = data6;
7: out = data7;
endcase
end
endmodule


module memory1(reset,address,in,out,write,clk, testWire); // LSB
input [7:0] in;
input clk,write,reset;
input [14:0] address;
output  reg [7:0] out;
output wire [7:0] testWire;
reg [7:0] mem [0:255];
integer i;
assign testWire = mem[7];

always @(negedge clk)
begin

out = mem[address];	
if(reset== 1'b0)
begin
for(i=0;i<256;i=i+1)
mem [i] = 0;
mem[0] = 8'b00111111;
mem[1] = 8'b00000000;
mem[2] = 8'b10000001;
mem[3] = 8'b00000111;
mem[4] = 8'b00001110;
mem[5] = 8'b00010100;
mem[26]= 8'b11000000;
mem[31]= 8'b00000001;
mem[33]= 8'b00000010;
end
else
if(write ==1'b0)
begin
	mem[address] <= in;
end

end

endmodule

module memory2(reset,address,in,out,write,clk, testWire); // MSB
input [7:0] in;
input clk,write,reset;
input [14:0] address;
output  reg [7:0] out;
output wire [7:0] testWire;
reg [7:0] mem [0:255];
integer i;
assign testWire = mem[7];

always @(negedge clk)
begin

out = mem[address];	
if(reset== 1'b0)
begin
for(i=0;i<256;i=i+1)
mem [i] = 0;
mem[0] = 8'b10010010;//IR = 0x 923f -> NOT of R0, into R1 (R0 was 0)
mem[1] = 8'b01100100; //IR = 0x 6400 -> R2 = mem(0) (mem0 was 923f)
mem[2] = 8'b00010110; //IR = 0x 1681 -> R3 = R1 + R2 (ffff+923f = 923e)
mem[3] = 8'b01110111; //IR = 0x7707 ->
mem[4] = 8'b00101111; //load mem(14) into R7
mem[5] = 8'b00000010;// branch conditional on p set, to 52..
mem[26] =8'b11000001;//jump to value stored in R7 (0x3E or 62)(JMP)
mem[31] = 8'b01001000;//JSR, add 2 to incremented PC, resulting in next PC = 66 instead of 64...( 64 is stored in R7)
mem[33] = 8'b11100001;//lea = incremented pc + (-1) = 66
end
if(write ==1'b0)
begin
	mem[address] <= in;
end

end

endmodule

module mem16(reset,address, write,clk, in, out,ir14,outir);
input [15:0] in;
input [15:0] address;
input write,clk,ir14,reset;
output reg [15:0] out;
output [15:0]outir;
reg wreven,wrodd;



wire [7:0] outeven,outodd;
reg [7:0] ineven,inodd;
memory1 even(.reset(reset),.address(address[15:1]),.in(ineven),.out(outeven),.clk(clk),.write(wreven));
memory2 odd (.reset(reset),.address(address[15:1]),.in(inodd),.out(outodd),.clk(clk),.write(wrodd));



//for in signals of individual memories
always @(*)
begin
if(ir14==0)
begin
ineven<=in[7:0];
inodd<=in[7:0];
end
else 
begin
ineven<= in[7:0];
inodd<=in[15:8];
end
end
//-----------------------------------------------
assign outir[15:8]  = outodd;
assign outir[7:0] = outeven;
//for out signals of individual memories
always @(*)
begin
if(ir14 ==1'b1)
begin
out[15:8]<=outodd;
out[7:0]<=outeven;
end
else 
if(address[0]==0)
begin
out<= {{8{outeven[7]}},outeven[7:0]};
end
else 
begin
out<= {{8{outodd[7]}},outodd[7:0]};
end
end

//-------------------------------------------------

//for write signal

always @(*)
begin

if(ir14==0&&address[0]==1'b1)
begin
wreven<=1'b1;
end
	else
	begin
	wreven<=write;
	end

end

always @(*)
begin

if(ir14==0&&address[0]==1'b0)
begin
wrodd<=1'b1;
end
	else
	begin
	wrodd<=write;
	end

end

endmodule


module lshift1(in,out);
input [15:0] in;
output [15:0] out;


assign out = {in[14:0],1'b0};

endmodule


module latch16(in,out,write);
input [15:0]in;
input write;//active low wrie

output reg [15:0] out;
always @(*)
begin

if(write == 1'b0)
 out = in;
 else 
 out = out;
 
 end
 
 endmodule
 

 
 module demux8(selectInput, out); // 8-output demux
output reg [7:0] out;
input [2:0] selectInput;
always@(selectInput) begin
case(selectInput)
0: out = 8'b00000001;
1: out = 8'b00000010;
2: out = 8'b00000100;
3: out = 8'b00001000;
4: out = 8'b00010000;
5: out = 8'b00100000;
6: out = 8'b01000000;
7: out = 8'b10000000;
endcase
end
endmodule

module alu(in1, in2, op,shop,shift, out, zero, positive, negative);
output [15:0] out;
input [15:0] in1, in2;
input [1:0] op,shop;
input [3:0] shift;
output zero, positive,negative;
nor n1(zero,out[0],out[1],out[2],out[3],out[4],out[5],out[6],out[7],out[8],out[9],out[10],out[11],out[12],out[13],out[14],out[15]);
assign positive = (~out[15])&(~zero);
assign negative = out[15];
wire [15:0] outAdd, outAnd, outXor, outLshf, outRshfl, outRshfa;
muxalu m1(outAdd, outAnd, outXor, outLshf, outRshfl, outRshfa, op, shop, out);
adder16 add1(in1, in2, outAdd);
and16 and1(in1, in2, outAnd);
xor16 xor1(in1, in2, outXor);
left_shift lshf1(in1, outLshf, shift);
right_shift_logical rshfl1(in1, outRshfl, shift);
right_shift_arithmetic rshfa1(in1, outRshfa, shift);
endmodule

module adder16(in1, in2 , out);	// Implements a full 16-bit adder
input [15:0] in1, in2;
output [15:0] out;
assign out = in1 + in2;
endmodule

module and16(in1, in2, out);	// Implements bitwise AND for two 16-bit numbers
input [15:0] in1, in2;
output [15:0] out;
assign out = in1 & in2;
endmodule

module left_shift(in, out, shift);
output [15:0] out;
input [15:0] in;
input [3:0] shift;
assign out = in << shift;
endmodule


module right_shift_arithmetic(in, out, shift);
output reg [15:0] out;
input [15:0] in;
input [3:0] shift;
always @(*) begin
case(shift)
4'd0: out=in;
4'd1: out={in[15],in[15:1]};
4'd2: out={{2{in[15]}},in[15:2]};
4'd3: out={{3{in[15]}},in[15:3]};
4'd4: out={{4{in[15]}},in[15:4]};
4'd5: out={{5{in[15]}},in[15:5]};
4'd6: out={{6{in[15]}},in[15:6]};
4'd7: out={{7{in[15]}},in[15:7]};
4'd8: out={{8{in[15]}},in[15:8]};
4'd9: out={{9{in[15]}},in[15:9]};
4'd10: out={{10{in[15]}},in[15:10]};
4'd11: out={{11{in[15]}},in[15:11]};
4'd12: out={{12{in[15]}},in[15:12]};
4'd13: out={{13{in[15]}},in[15:13]};
4'd14: out={{14{in[15]}},in[15:14]};
4'd15: out={16{in[15]}};
endcase
end
endmodule

module right_shift_logical(in, out, shift);
output [15:0] out;
input [15:0] in;
input [3:0] shift;
assign out = in >> shift;
endmodule

module xor16(in1, in2, out);	// Implements bitwise XOR for two 16-bit numbers
input [15:0] in1, in2;
output [15:0] out;
assign out = in1 ^ in2;

endmodule
