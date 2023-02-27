module module_relu_1x8
(
	input			clk,
	input	[3:0]	zero_point,
	input	[3:0]	data_in_0,
	input	[3:0]	data_in_1,
	input	[3:0]	data_in_2,
	input	[3:0]	data_in_3,
	input	[3:0]	data_in_4,
	input	[3:0]	data_in_5,
	input	[3:0]	data_in_6,
	input	[3:0]	data_in_7,
	output	[32:0]	bundle_out
);
	wire	[7:0]	dout_0;
	wire	[7:0]	dout_1;
	wire	[7:0]	dout_2;
	wire	[7:0]	dout_3;
	wire	[7:0]	dout_4;
	wire	[7:0]	dout_5;
	wire	[7:0]	dout_6;
	wire	[7:0]	dout_7;

	assign bundle_out[3:0]   =dout_0;
	assign bundle_out[7:4]  =dout_1;
	assign bundle_out[11:8] =dout_2;
	assign bundle_out[15:12] =dout_3;
	assign bundle_out[19:16] =dout_4;
	assign bundle_out[23:20] =dout_5;
	assign bundle_out[27:24] =dout_6;
	assign bundle_out[31:28] =dout_7;

	cal_relu u_cal_relu_0
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_0),
		.data_out(dout_0)
	);
	cal_relu u_cal_relu_1
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_1),
		.data_out(dout_1)
	);
	cal_relu u_cal_relu_2
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_2),
		.data_out(dout_2)
	);
	cal_relu u_cal_relu_3
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_3),
		.data_out(dout_3)
	);
	cal_relu u_cal_relu_4
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_4),
		.data_out(dout_4)
	);
	cal_relu u_cal_relu_5
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_5),
		.data_out(dout_5)
	);
	cal_relu u_cal_relu_6
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_6),
		.data_out(dout_6)
	);
	cal_relu u_cal_relu_7
	(
		.clk(clk),
		.zero_point(zero_point),
		.data_in(data_in_7),
		.data_out(dout_7)
	);
endmodule