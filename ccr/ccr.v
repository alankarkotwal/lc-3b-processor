`ifndef _CCR
`define _CCR

module register1b(clk, out, in, write, reset); // Negedge-triggered 1 bit flipflop register for  with active-low write signal and reset

	output reg  out;
	input in;
	input clk, write, reset;
	
	always@(negedge clk) begin
		if(reset==0) begin
			out = 1'b0;
		else if(write == 1'b0) begin
			out = in;
		end
	end
	
endmodule

module Negative_CCR(clk,out,in,write,reset);

	output reg  out;
	input in;
	input clk, write, reset;

	register1b neg(.clk(clk), .out(out),.in(in),.write(write),.reset(reset));
	
endmodule

module Positive_CCR(clk,out,in,write,reset);

	output reg  out;
	input in;
	input clk, write, reset;

	register1b neg(.clk(clk), .out(out),.in(in),.write(write),.reset(reset));
	
endmodule

module Zero_CCR(clk,out,in,write,reset);

	output reg  out;
	input in;
	input clk, write, reset;
	
	register1b neg(.clk(clk), .out(out),.in(in),.write(write),.reset(reset));
	
endmodule

`endif
