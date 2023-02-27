(*use_dsp="yes"*)
//dsp原理，这里还可以优化为3个int4并行优化
module cal_mult_int4_x2_dsp
(
	input clk,
	input signed [3:0]a,
	input signed [3:0]b,
	input signed [3:0]c,
	
	output signed [7:0]ac,
	output signed [7:0]bc
);
	wire signed [26:0]A_PORT;
	wire signed [26:0]D_PORT;
	wire signed [17:0]B_PORT;
	
	reg signed [26:0]A_PORT_REG;
	reg signed [26:0]D_PORT_REG;
	reg signed [17:0]B_PORT_REG_1;
	reg signed [17:0]B_PORT_REG_2;
	reg signed [26:0]A_Plus_D;
	reg signed [44:0]MULT_RES;
	reg signed [44:0]DOUT;
	//详见加法数位的扩展
	assign A_PORT={a[3],a[3:0],{22{1'b0}}};
	assign D_PORT={{23{b[3]}},b[3:0]};
	assign B_PORT={{14{c[3]}},c[3:0]};
	
	always@(posedge clk) begin
		A_PORT_REG<=A_PORT;
		D_PORT_REG<=D_PORT;
		//两个breg保持同步
		B_PORT_REG_1<=B_PORT;
		B_PORT_REG_2<=B_PORT_REG_1;
		A_Plus_D<=A_PORT_REG+D_PORT_REG;
		MULT_RES<=A_Plus_D*B_PORT_REG_2;
		DOUT<=MULT_RES;
	end
	assign ac=DOUT[29:22];
	assign bc=DOUT[7:0];
endmodule
