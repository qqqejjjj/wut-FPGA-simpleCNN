(*use_dsp="yes"*)//vivado的综合指令，会强制使用dsp模块
module cal_mult_int8_x2_dsp
(
	input clk,
	input signed [7:0]a,//输入数a，8位
	input signed [7:0]b,//输入数b，8位
	input signed [7:0]c,//输入数c，8位
	
	output signed [15:0]ac,//输出ac乘积，16位
	output signed [15:0]bc //输出bc乘积，16位
);
	wire signed [26:0]A_PORT;//DSP的A端口
	wire signed [26:0]D_PORT;//DSP的D端口
	wire signed [17:0]B_PORT;//DSP的B端口
	
	reg signed [26:0]A_PORT_REG;
	reg signed [26:0]D_PORT_REG;
	reg signed [17:0]B_PORT_REG_1;
	reg signed [17:0]B_PORT_REG_2;
	reg signed [26:0]A_Plus_D;//AD之和利用dsp预加器
	reg signed [44:0]MULT_RES;//乘法结果缓存
	reg signed [44:0]DOUT;//结果输出
	/*
		本模块都是无阻塞的流水运算
		1，对输入运算值a，b，c进行符号位扩展以满足预加器AD的位数要求
		2，然后进行流水赋值运算，Breg通过两个寄存器以满足时钟约束
		3，进行加法与乘法运算并且无阻塞输出结果，如上述运算图bc在0-15位，ac在18-33位
	*/
	assign A_PORT={a[7],a[7:0],{18{1'b0}}};
	assign D_PORT={{19{b[7]}},b[7:0]};
	assign B_PORT={{10{c[7]}},c[7:0]};
	//verilog有符号数概述
    /*
    在verilog中有符号数都是以补码形式存在
    补码的计算对于负数 除符号位外反码加1 
    正数不变
    -2：1 010 1 110
     3：0 011 
    对于有符号数的加法需要位数的扩展防止溢出
    符号位扩展：可以在值不变的情况下扩展位
    下有两个例子
    +7 0 0111 扩展到8位 0 0000 0111
    -7 1 1001 扩展到8位 1 1111 1001 原码为补码加一取反=》 1   0000  0111
    */
	always@(posedge clk) begin
		A_PORT_REG<=A_PORT;
		D_PORT_REG<=D_PORT;
		B_PORT_REG_1<=B_PORT;
		B_PORT_REG_2<=B_PORT_REG_1;
		A_Plus_D<=A_PORT_REG+D_PORT_REG;
		MULT_RES<=A_Plus_D*B_PORT_REG_2;
		DOUT<=MULT_RES;
	end
	assign ac=DOUT[33:18];
	assign bc=DOUT[15:0];
endmodule
