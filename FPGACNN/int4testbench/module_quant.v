module module_quant
(
	input clk,
	input signed [14:0] acc_result,
	input signed [15:0] scale,
    input [3:0] shift,
	input [3:0] zero_point,
	output [3:0] quant_result
);
	
	wire [15:0] after_scale;
	wire signed [3:0] after_4bit_sat;
	
	cal_scale u_cal_scale
	(
		.clk(clk),
		.val(acc_result),
		.scale(scale),
		.shift(shift),
		.dout(after_scale)
	);
	
	cal_sat_int16_int4 u_cal_sat_int16_int4
	(
		.clk(clk),
		.data_in(after_scale),
		.data_out(after_4bit_sat)
	);
	assign quant_result=after_4bit_sat+zero_point;

endmodule