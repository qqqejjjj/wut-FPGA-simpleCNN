module cal_addtree_int16_x9
(
	input clk,
	input signed [15:0]a1,
	input signed [15:0]a2,
	input signed [15:0]a3,
	input signed [15:0]a4,
	input signed [15:0]a5,
	input signed [15:0]a6,
	input signed [15:0]a7,
	input signed [15:0]a8,
	input signed [15:0]a9,
	output reg signed [17:0] dout
);
	wire signed [17:0]a1_d1;
	wire signed [17:0]a2_d1;
	wire signed [17:0]a3_d1;
	wire signed [17:0]a4_d1;
	wire signed [17:0]a5_d1;
	wire signed [17:0]a6_d1;
	wire signed [17:0]a7_d1;
	wire signed [17:0]a8_d1;
	wire signed [17:0]a9_d1;
	
	reg signed [17:0]b1_d2;
	reg signed [17:0]b2_d2;
	reg signed [17:0]b3_d2;
	 //verilog有符号数概述
    /*
    在verilog中有符号数都是以补码形式存在
    补码的计算对于负数 除符号位外反码加1 
    正数不变
    -2：1 010 1 110
     3：0 011 
    对于有符号数的加法需要位数的扩展防止溢出，九个这样的int8
    数相加极限情况是到 int10 2^7*(2^3+1) 
    
    符号位扩展：可以在值不变的情况下扩展位
    下有两个例子
    +7 0 0111 扩展到8位 0 0000 0111
    -7 1 1001 扩展到8位 1 1111 1001 原码为补码加一取反=》 1   0000  0111
    */
	
	assign a1_d1={a1[15],a1[15],a1[15:0]};
	assign a2_d1={a2[15],a2[15],a2[15:0]};
	assign a3_d1={a3[15],a3[15],a3[15:0]};
	assign a4_d1={a4[15],a4[15],a4[15:0]};
	assign a5_d1={a5[15],a5[15],a5[15:0]};
	assign a6_d1={a6[15],a6[15],a6[15:0]};
	assign a7_d1={a7[15],a7[15],a7[15:0]};
	assign a8_d1={a8[15],a8[15],a8[15:0]};
	assign a9_d1={a9[15],a9[15],a9[15:0]};
	
	always@(posedge clk) begin
		//无阻塞加法
		b1_d2<=a1_d1+a2_d1+a3_d1;
		b2_d2<=a4_d1+a5_d1+a6_d1;
		b3_d2<=a7_d1+a8_d1+a9_d1;
		
		dout<=b1_d2+b2_d2+b3_d2;
	end
endmodule
