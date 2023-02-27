module cal_mult_int4_x2
(
	input clk,
	input signed [3:0]a,
	input signed [3:0]b,
	input signed [3:0]c,
	
	output signed [7:0]ac,
	output signed [7:0]bc
);
	wire signed [7:0] ac_tmp;
	wire signed [7:0] bc_tmp;
	wire signed [7:0] ac_comp;
	cal_mult_int4_x2_dsp u_cal_mult_int4_x2_dsp
	(
		.clk(clk),
		.a(a),
		.b(b),
		.c(c),
		.ac(ac_tmp),
		.bc(bc_tmp)
	);
	//最高位溢出判断
	assign ac_comp=(bc_tmp[7]==1'b1)?(ac_tmp+1'b1):ac_tmp;
	assign ac=ac_comp;
	assign bc=bc_tmp;
endmodule