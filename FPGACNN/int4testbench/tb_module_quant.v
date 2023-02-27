`timescale 1ns/1ns
module tb_module_quant();
    reg clk;
    reg [14:0] acc_result;
    reg [15:0] scale;
    reg [3:0] shift;
    reg [3:0] zero_point;
	wire [3:0] quant_result;

    initial begin
        clk<=1;
        #20
        acc_result<=14'b0101111111111;
        scale<=2;
        shift<=0;
        zero_point<=1;
        
    end
    always #10 clk=~clk;
    module_quant u_module_quant(
        .clk(clk),
        .acc_result(acc_result),
        .scale(scale),
        .shift(shift),
        .zero_point(zero_point),
        .quant_result(quant_result)

    );
endmodule