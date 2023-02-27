module cal_scale
(
	input clk,
	input signed [14:0] val,
	input signed [15:0] scale,
	input [3:0] shift,
	output signed [15:0] dout
);
/*
    如何乘一个浮点数scale
    scale = scale0*2^n 浮点数乘法拆分成整数乘法和位移
*/
	wire [31:0] dtmp;
	cal_scale_mul u_cal_scale_mul
	(
		.clk(clk),
		.val(val),
		.scale(scale),
		.dout(dtmp)
	);
	cal_scale_shift u_cal_scale_shift
	(
		.clk(clk),
		.din(dtmp),
		.shift(shift),
		.dout(dout)
	);
endmodule