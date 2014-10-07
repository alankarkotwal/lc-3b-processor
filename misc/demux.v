`ifndef _DEMUX
`define _DEMUX

module demux8(selectInput, out);  // 8-output demux

	output reg [7:0] out;
	input  [2:0] selectInput;
	
	always@(selectInput) begin
		case(selectInput)
			0: out = 16'b00000001;
			1: out = 16'b00000010;
			2: out = 16'b00000100;
			3: out = 16'b00001000;
			4: out = 16'b00010000;
			5: out = 16'b00100000;
			6: out = 16'b01000000;
			7: out = 16'b10000000;
		endcase
	end
	
endmodule

`endif
