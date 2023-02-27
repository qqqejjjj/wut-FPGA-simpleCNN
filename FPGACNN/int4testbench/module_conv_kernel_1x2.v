module module_conv_kernel_1x2
(
    input        clk,
    input [35:0] ifm_win3x3,//3x3的输入特征图窗口
    input [35:0] weight_win3x3_ch1,//3x3的输入权重1
    input [35:0] weight_win3x3_ch2,//3x3的输入权重2
    output[11:0] ofm_stream_ch1,//多出2个进位
    output[11:0] ofm_stream_ch2
);
    wire [3:0] win1_1;
	wire [3:0] win1_2;
	wire [3:0] win1_3;
	wire [3:0] win2_1;
	wire [3:0] win2_2;
	wire [3:0] win2_3;
	wire [3:0] win3_1;
	wire [3:0] win3_2;
	wire [3:0] win3_3;
	
	assign win1_1=ifm_win3x3[3:0];
	assign win1_2=ifm_win3x3[7:4];
	assign win1_3=ifm_win3x3[11:8];
	assign win2_1=ifm_win3x3[15:12];
	assign win2_2=ifm_win3x3[19:16];
	assign win2_3=ifm_win3x3[23:20];
	assign win3_1=ifm_win3x3[27:24];
	assign win3_2=ifm_win3x3[31:28];
	assign win3_3=ifm_win3x3[35:32];
	
	wire [3:0] weight_ch1_1_1;
	wire [3:0] weight_ch1_1_2;
	wire [3:0] weight_ch1_1_3;
	wire [3:0] weight_ch1_2_1;
	wire [3:0] weight_ch1_2_2;
	wire [3:0] weight_ch1_2_3;
	wire [3:0] weight_ch1_3_1;
	wire [3:0] weight_ch1_3_2;
	wire [3:0] weight_ch1_3_3;
	
	assign weight_ch1_1_1=weight_win3x3_ch1[3:0];
	assign weight_ch1_1_2=weight_win3x3_ch1[7:4];
	assign weight_ch1_1_3=weight_win3x3_ch1[11:8];
	assign weight_ch1_2_1=weight_win3x3_ch1[15:12];
	assign weight_ch1_2_2=weight_win3x3_ch1[19:16];
	assign weight_ch1_2_3=weight_win3x3_ch1[23:20];
	assign weight_ch1_3_1=weight_win3x3_ch1[27:24];
	assign weight_ch1_3_2=weight_win3x3_ch1[31:28];
	assign weight_ch1_3_3=weight_win3x3_ch1[35:32];
	
	wire [3:0] weight_ch2_1_1;
	wire [3:0] weight_ch2_1_2;
	wire [3:0] weight_ch2_1_3;
	wire [3:0] weight_ch2_2_1;
	wire [3:0] weight_ch2_2_2;
	wire [3:0] weight_ch2_2_3;
	wire [3:0] weight_ch2_3_1;
	wire [3:0] weight_ch2_3_2;
	wire [3:0] weight_ch2_3_3;
	
	assign weight_ch2_1_1=weight_win3x3_ch2[3:0];
	assign weight_ch2_1_2=weight_win3x3_ch2[7:4];
	assign weight_ch2_1_3=weight_win3x3_ch2[11:8];
	assign weight_ch2_2_1=weight_win3x3_ch2[15:12];
	assign weight_ch2_2_2=weight_win3x3_ch2[19:16];
	assign weight_ch2_2_3=weight_win3x3_ch2[23:20];
	assign weight_ch2_3_1=weight_win3x3_ch2[27:24];
	assign weight_ch2_3_2=weight_win3x3_ch2[31:28];
	assign weight_ch2_3_3=weight_win3x3_ch2[35:32];
    //乘法器输出的是8位
	wire [7:0] ch1_out1_1;
	wire [7:0] ch1_out1_2;
	wire [7:0] ch1_out1_3;
	wire [7:0] ch1_out2_1;
	wire [7:0] ch1_out2_2;
	wire [7:0] ch1_out2_3;
	wire [7:0] ch1_out3_1;
	wire [7:0] ch1_out3_2;
	wire [7:0] ch1_out3_3;
	
	wire [7:0] ch2_out1_1;
	wire [7:0] ch2_out1_2;
	wire [7:0] ch2_out1_3;
	wire [7:0] ch2_out2_1;
	wire [7:0] ch2_out2_2;
	wire [7:0] ch2_out2_3;
	wire [7:0] ch2_out3_1;
	wire [7:0] ch2_out3_2;
	wire [7:0] ch2_out3_3;

    /*
        最底层卷积模块的描述
        1X2卷积计算了的两个单一卷积核与一个feature map的计算结果
        计算示例
        卷积核权重window：
        1 1 2                                 1 3 5
        3 4 5    =》 [1 1 2 3 4 5 6 7 8]      7 9 5   =》 [1 3 5 7 9 5 3 2 1]
        6 7 8                                 3 2 1
        特征图linebuffer缓存的一个window：
        1 2 3                                       
        4 5 6    =》 [1 2 3 4 5 6 7 8 9]      
        1 2 3 
        首先通过乘法器计算出对应乘积（公用乘积因子是缓存的特征图window）
        [1 2 6 12 20 30 42 56 89] [1 6 15 28 45 30 21 16 9]
        然后通过加法器一个通道计算出一个值   
        [258] [171]                             
    */
	/* multiplier */
	cal_mult_int4_x2 u_cal_mult_int4_x2_1_1
	(
		.clk(clk),
		.a(weight_ch1_1_1),
		.b(weight_ch2_1_1),
		.c(win1_1),
		.ac(ch1_out1_1),
		.bc(ch2_out1_1)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_1_2
	(
		.clk(clk),
		.a(weight_ch1_1_2),
		.b(weight_ch2_1_2),
		.c(win1_2),
		.ac(ch1_out1_2),
		.bc(ch2_out1_2)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_1_3
	(
		.clk(clk),
		.a(weight_ch1_1_3),
		.b(weight_ch2_1_3),
		.c(win1_3),
		.ac(ch1_out1_3),
		.bc(ch2_out1_3)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_2_1
	(
		.clk(clk),
		.a(weight_ch1_2_1),
		.b(weight_ch2_2_1),
		.c(win2_1),
		.ac(ch1_out2_1),
		.bc(ch2_out2_1)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_2_2
	(
		.clk(clk),
		.a(weight_ch1_2_2),
		.b(weight_ch2_2_2),
		.c(win2_2),
		.ac(ch1_out2_2),
		.bc(ch2_out2_2)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_2_3
	(
		.clk(clk),
		.a(weight_ch1_2_3),
		.b(weight_ch2_2_3),
		.c(win2_3),
		.ac(ch1_out2_3),
		.bc(ch2_out2_3)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_3_1
	(
		.clk(clk),
		.a(weight_ch1_3_1),
		.b(weight_ch2_3_1),
		.c(win3_1),
		.ac(ch1_out3_1),
		.bc(ch2_out3_1)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_3_2
	(
		.clk(clk),
		.a(weight_ch1_3_2),
		.b(weight_ch2_3_2),
		.c(win3_2),
		.ac(ch1_out3_2),
		.bc(ch2_out3_2)
	);
	cal_mult_int4_x2 u_cal_mult_int4_x2_3_3
	(
		.clk(clk),
		.a(weight_ch1_3_3),
		.b(weight_ch2_3_3),
		.c(win3_3),
		.ac(ch1_out3_3),
		.bc(ch2_out3_3)
	);
	/* adder tree */
	cal_addtree_int8_x9 u_cal_addtree_int8_x9_1
	(
		.clk(clk),
		.a1(ch1_out1_1),
		.a2(ch1_out1_2),
		.a3(ch1_out1_3),
		.a4(ch1_out2_1),
		.a5(ch1_out2_2),
		.a6(ch1_out2_3),
		.a7(ch1_out3_1),
		.a8(ch1_out3_2),
		.a9(ch1_out3_3),
		.dout(ofm_stream_ch1)
	);
	cal_addtree_int8_x9 u_cal_addtree_int8_x9_2
	(
		.clk(clk),
		.a1(ch2_out1_1),
		.a2(ch2_out1_2),
		.a3(ch2_out1_3),
		.a4(ch2_out2_1),
		.a5(ch2_out2_2),
		.a6(ch2_out2_3),
		.a7(ch2_out3_1),
		.a8(ch2_out3_2),
		.a9(ch2_out3_3),
		.dout(ofm_stream_ch2)
	);
endmodule