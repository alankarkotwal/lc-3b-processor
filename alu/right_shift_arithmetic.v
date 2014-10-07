`ifndef _RSHFA
`define _RSHFA

module right_shift_arithmetic(in, out, shift);

	output reg [15:0] out;
	input  [15:0] in;
	input  [3:0]  shift;
	
	always @(*) begin
		case(shift)
			4'd0:  out=in;
			4'd1:  out={in[15],in[15:1]};
			4'd2:  out={{2{in[15]}},in[15:2]};
			4'd3:  out={{3{in[15]}},in[15:3]};
			4'd4:  out={{4{in[15]}},in[15:4]};
			4'd5:  out={{5{in[15]}},in[15:5]};
			4'd6:  out={{6{in[15]}},in[15:6]};
			4'd7:  out={{7{in[15]}},in[15:7]};
			4'd8:  out={{8{in[15]}},in[15:8]};
			4'd9:  out={{9{in[15]}},in[15:9]};
			4'd10: out={{10{in[15]}},in[15:10]};
			4'd11: out={{11{in[15]}},in[15:11]};
			4'd12: out={{12{in[15]}},in[15:12]};
			4'd13: out={{13{in[15]}},in[15:13]};
			4'd14: out={{14{in[15]}},in[15:14]};
			4'd15: out={16{in[15]}};
		endcase
	end
	
endmodule

`endif
