module cal_scale_shift
(
	input clk,
	input signed [31:0] din,
	input [3:0] shift,
	output signed [15:0] dout
);
    /*
        shift操作位移，分解的浮点数乘法 
        右移运算不同于左移运算，除不尽2时会有精度损失、
        0110 =》 0011 =》0001小数部分被直接舍弃了
        6        3      1
        本运算使用的是像最近整数舍入的右移
        0110 =》 0011 =》0001+1=0010 =》0001 =》0000+1=0001 舍入模式不会让值直接归零
        6        3       2              1       1  
    */
	wire trunc;
	reg trunc_reg;
	wire [15:0] din_up;
	reg signed [15:0] dout_tmp;
	assign din_up=din[29:14];
	assign trunc=din_up[shift];
	
	always@(posedge clk) begin
		dout_tmp<=(din>>>(15+shift));
		trunc_reg<=trunc;
	end
	assign dout=(trunc_reg==1'b1)?(dout_tmp+1):(dout_tmp);
endmodule