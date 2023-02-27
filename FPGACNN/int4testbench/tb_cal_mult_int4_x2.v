`timescale 1ns/1ns
module tb_cal_mult_int4_x2();
    wire signed [3:0] a;
    wire signed [3:0] b;
    wire signed [7:0] c;
    wire signed [7:0] ac;
	wire signed [7:0] bc;
	
    assign a = 15;//6
    assign b = 7;
    assign c = -7;
    reg clk;
    initial begin
        clk<=0;
    end
always #10 clk<=~clk;
cal_mult_int4_x2 u_cal_mult_int4_x2
(
    .clk(clk),
	.a(a),
	.b(b),
	.c(c),
	.ac(ac),
	.bc(bc)
);
endmodule