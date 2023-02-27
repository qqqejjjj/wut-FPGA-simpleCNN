module cal_addtree_int12_x9
(
	input clk,
	input signed [11:0] a1,
	input signed [11:0] a2,
	input signed [11:0] a3,
	input signed [11:0] a4,
	input signed [11:0] a5,
	input signed [11:0] a6,
	input signed [11:0] a7,
	input signed [11:0] a8,
	input signed [11:0] bias,
	output reg signed [14:0] dout
);
	wire signed [14:0]a1_d1;
	wire signed [14:0]a2_d1;
	wire signed [14:0]a3_d1;
	wire signed [14:0]a4_d1;
	wire signed [14:0]a5_d1;
	wire signed [14:0]a6_d1;
	wire signed [14:0]a7_d1;
	wire signed [14:0]a8_d1;
	wire signed [14:0]bias_d1;
	
	reg signed [14:0]b1_d2;
	reg signed [14:0]b2_d2;
	reg signed [14:0]b3_d2;
	
    assign a1_d1={a1[11],a1[11],a1[11],a1[11:0]};
	assign a2_d1={a2[11],a2[11],a2[11],a2[11:0]};
	assign a3_d1={a3[11],a3[11],a3[11],a3[11:0]};
	assign a4_d1={a4[11],a4[11],a4[11],a4[11:0]};
	assign a5_d1={a5[11],a5[11],a5[11],a5[11:0]};
	assign a6_d1={a6[11],a6[11],a6[11],a6[11:0]};
	assign a7_d1={a7[11],a7[11],a7[11],a7[11:0]};
	assign a8_d1={a8[11],a8[11],a8[11],a8[11:0]};
	assign bias_d1={bias[11],bias[11],bias[11],bias[11:0]};
	
	always@(posedge clk) begin
		b1_d2<=a1_d1+a2_d1+a3_d1;
		b2_d2<=a4_d1+a5_d1+a6_d1;
		b3_d2<=a7_d1+a8_d1+bias_d1;
		
		dout<=b1_d2+b2_d2+b3_d2;
	end
endmodule
