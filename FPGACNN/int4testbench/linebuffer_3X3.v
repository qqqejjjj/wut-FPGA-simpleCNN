module linebuffer_3x3_collect
#(
	parameter LEN1=16,
	parameter LEN2=14,
	parameter LEN3=28,
	parameter LEN4=56,
	parameter LEN5=112,
	parameter LEN6=224
)
(
	input clk,
	input [2:0] sel,
	input [3:0] ifmstream_0,
	input [3:0] ifmstream_1,
	input [3:0] ifmstream_2,
	input [3:0] ifmstream_3,
	input [3:0] ifmstream_4,
	input [3:0] ifmstream_5,
	input [3:0] ifmstream_6,
	input [3:0] ifmstream_7,
	
	output [35:0] ifm_win3x3_0,
	output [35:0] ifm_win3x3_1,
	output [35:0] ifm_win3x3_2,
	output [35:0] ifm_win3x3_3,
	output [35:0] ifm_win3x3_4,
	output [35:0] ifm_win3x3_5,
	output [35:0] ifm_win3x3_6,
	output [35:0] ifm_win3x3_7
);

	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_0
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_0),
		.ifm_win3x3_batch(ifm_win3x3_0)
	);
	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_1
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_1),
		.ifm_win3x3_batch(ifm_win3x3_1)
	);
	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_2
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_2),
		.ifm_win3x3_batch(ifm_win3x3_2)
	);
	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_3
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_3),
		.ifm_win3x3_batch(ifm_win3x3_3)
	);
	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_4
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_4),
		.ifm_win3x3_batch(ifm_win3x3_4)
	);
	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_5
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_5),
		.ifm_win3x3_batch(ifm_win3x3_5)
	);
	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_6
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_6),
		.ifm_win3x3_batch(ifm_win3x3_6)
	);
	linebuffer_3x3_type_x6
	#(
		.LEN1(LEN1),
		.LEN2(LEN2),
		.LEN3(LEN3),
		.LEN4(LEN4),
		.LEN5(LEN5),
		.LEN6(LEN6)
	)
	u_linebuffer_3x3_type_x6_7
	(
		.clk(clk),
		.sel(sel),
		.ifmstream_in(ifmstream_7),
		.ifm_win3x3_batch(ifm_win3x3_7)
	);
endmodule