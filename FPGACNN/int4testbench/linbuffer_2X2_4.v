//vgg16 参数量非常大 但很适合fpga并行加速 在参数量巨大的情况下，开源工程的推理时间也仅有200ms，需要重新剪枝量化，效果会更好
module linebuffer_2x2_type_x4
#(//设置不同深度（宽度）的图片（需要量化剪裁后重新设置）
	parameter LEN1=16,
	parameter LEN2=14,
	parameter LEN3=28,
	parameter LEN4=56,
	parameter LEN5=112,
	parameter LEN6=224
)//选用int4量化的模式    
(   
    input          clk,
    input  [2:0]   sel,			  //sel选择信号三位选择不同宽度的信号
    input  [3:0]   ifmstream_in,			   //输入特征图 input feature map
    output [15:0]  ifm_win2X2_batch//输出到一个4个int4 ifm 组成的batch当中
);
	//4个窗口元素组成2X2窗口
	/*
	|win1_1 win1_2|
	|win1_3 win1_4|
	转为一行
	win2X2：|win1_1 win1_2 win1_3 win1_4|
	*/
    reg [3:0] win1_1;
	reg [3:0] win1_2;
	reg [3:0] win2_1;
	reg [3:0] win2_2;
	//定义队尾输出元素
	wire [3:0] linetap1_1;
	wire [3:0] linetap1_2;
	wire [3:0] linetap1_3;
	wire [3:0] linetap1_4;
	wire [3:0] linetap1_5;
	wire [3:0] linetap1_6;

	wire [3:0] line1_in;
	wire [3:0] line1_out;
	//分配队列
	assign ifm_win2X2_batch[3:0]=win1_1;
	assign ifm_win2X2_batch[7:4]=win1_2;
	assign ifm_win2X2_batch[11:8]=win2_1;
	assign ifm_win2X2_batch[15:12]=win2_2;	
	assign line1_in=ifmstream_in;
	//行队列移动，不同情形下移动不同位输出
	com_shift_reg #(.DEPTH(LEN1),.WIDTH(4),.SRL_STYLE_VAL("reg_srl_reg"))
	u_com_shift_reg_line_1_segment_1
	(.clk(clk),.si(line1_in),.so(linetap1_1));
	
	com_shift_reg #(.DEPTH(LEN2),.WIDTH(4),.SRL_STYLE_VAL("reg_srl_reg"))
	u_com_shift_reg_line_1_segment_2
	(.clk(clk),.si(linetap1_1),.so(linetap1_2));
	
	com_shift_reg #(.DEPTH(LEN3),.WIDTH(4),.SRL_STYLE_VAL("reg_srl_reg"))
	u_com_shift_reg_line_1_segment_3
	(.clk(clk),.si(linetap1_2),.so(linetap1_3));
	
	com_shift_reg #(.DEPTH(LEN4),.WIDTH(4),.SRL_STYLE_VAL("reg_srl_reg"))
	u_com_shift_reg_line_1_segment_4
	(.clk(clk),.si(linetap1_3),.so(linetap1_4));
	
	com_shift_reg #(.DEPTH(LEN5),.WIDTH(4),.SRL_STYLE_VAL("reg_srl_reg"))
	u_com_shift_reg_line_1_segment_5
	(.clk(clk),.si(linetap1_4),.so(linetap1_5));
	
	com_shift_reg #(.DEPTH(LEN6),.WIDTH(4),.SRL_STYLE_VAL("reg_srl_reg"))
	u_com_shift_reg_line_1_segment_6
	(.clk(clk),.si(linetap1_5),.so(linetap1_6));
	
	//选择input feature map的类型6选一
	com_mux_int_6sel1 u_com_mux_int_6sel1_1
	(
		.in_1(linetap1_1),
		.in_2(linetap1_2),
		.in_3(linetap1_3),
		.in_4(linetap1_4),
		.in_5(linetap1_5),
		.in_6(linetap1_6),
		.sel(sel),
		.out(line1_out)
	);
	//移动行为解释
	/*
		深度为8										  					   					2X2 2X1 1X2 1X1
		1  2  3  4  5  6  7  8    ==》串行 1 2 3 4 5 6==》输出： 					初始：    0   0   0   0   
		9  10 11 12 13 14 15 16                           深度3寄存器输出情况：				  0   0   0   0  0  0  0  0
		

     
		//移动到没有0时正式开始
		第一次：  10  9   2   1
		寄存器：  10  9   8   7   6   5   4   3

		第二次：  11  10  3   2
		寄存器：  11  10  9   8   7   6   5   4  
		.......
		第七次：  16  15  8   7
		寄存器：  16  15  14  13  12  11  10  9 
		结合2X2pooling ifm的前两行已经经过了pooling分组，可以比较最大值  
	*/
	always@(posedge clk) begin
		win1_1<=win1_2;//行移动
		win1_2<=line1_out;
		
		win2_1<=win2_2;//行移动
		win2_2<=ifmstream_in;
	end
	

endmodule