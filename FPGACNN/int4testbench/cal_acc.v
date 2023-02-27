module cal_acc//累加计算存储的值与新来的值的和
(
    input                 clk,
    input signed [14:0]   a,
    input signed [14:0]   b,
    input a_zero,
	input b_zero,
	output reg signed [14:0] c
);
    wire signed [14:0] a_z;
	wire signed [14:0] b_z;
	assign a_z=(a_zero)?0:a;//值是0就赋值0，此时冗余不相加
	assign b_z=(b_zero)?0:b;
	always@(posedge clk) begin
		c<=a_z+b_z;
    end
endmodule