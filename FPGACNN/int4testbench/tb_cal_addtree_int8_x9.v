`timescale 1ns/1ns
module tb_cal_addtree_int8_x9();
    reg clk;
    reg signed [7:0]a1;
	reg signed [7:0]a2;
	reg signed [7:0]a3;
	reg signed [7:0]a4;
	reg signed [7:0]a5;
	reg signed [7:0]a6;
	reg signed [7:0]a7;
	reg signed [7:0]a8;
	reg signed [7:0]a9;
    wire signed [9:0] dout;

    initial begin
        clk<=0;
        a1<=-1;
        a2<=-1;
        a3<=-2;
        a4<=-5;
        a5<=-8;
        a6<= 8;
        a7<= 6;
        a8<= 3;
        a9<=-1;
    end
    always #10 clk=~clk;

cal_addtree_int8_x9 u_cal_addtree_int8_x9
(
    .clk(clk),
    .a1(a1),
	.a2(a2),
	.a3(a3),
	.a4(a4),
	.a5(a5),
	.a6(a6),
	.a7(a7),
	.a8(a8),
	.a9(a9),
	.dout(dout) //多出符号位和进位
);

endmodule