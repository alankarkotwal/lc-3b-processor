`ifndef _RSHFA
`define _RSHFA

module right_shift_arithmetic(in, out, shift);
	output reg [15:0] out;
	input  [15:0] in;
	input  [3:0]  shift;
	always @(*)
	begin
	
	
	case(shift)
	4'd0:
	begin
	out=in;
	end
	4'd1:
	begin
	out={in[15],in[15:1]};
	end
	4'd2:
	begin
	out={{2{in[15]}},in[15:2]};
	end
	4'd3:
	begin
	out={{3{in[15]}},in[15:3]};
	end
	4'd4:
	begin
	out={{4{in[15]}},in[15:4]};
	end
	4'd5:
	begin
	out={{5{in[15]}},in[15:5]};
	end
	4'd6:
	begin
	out={{6{in[15]}},in[15:6]};
	end
	4'd7:
	begin
	out={{7{in[15]}},in[15:7]};
	end
	4'd8:
	begin
	out={{8{in[15]}},in[15:8]};
	end
	4'd9:
	begin
	out={{9{in[15]}},in[15:9]};
	end
	4'd10:
	begin
	out={{10{in[15]}},in[15:10]};
	end
	4'd11:
	begin
	out={{11{in[15]}},in[15:11]};
	end
	4'd12:
	begin
	out={{12{in[15]}},in[15:12]};
	end
	4'd13:
	begin
	out={{13{in[15]}},in[15:13]};
	end
	4'd14:
	begin
	out={{14{in[15]}},in[15:14]};
	end
	4'd15:
	begin
	out={16{in[15]}};
	end
	endcase
	
	end
endmodule

`endif
