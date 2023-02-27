module cal_sub_zero_point//substraction of zero point
(
    input clk,
    input signed [3:0] zero_point,
    input signed [3:0] data_in,
    output reg signed [3:0] data_out
);
/*
    零点，伸缩因子与量化
    r:被量化值 q：量化值
    scale=(r_max-r_min）/(q_max-q_min)
    zero_point=round(q_max-r_max/s)
    q=round(r/scale)+zero_point
    在进行乘法运算时：
    r3=r1*r2
    q3-z3=(scale1*scale2/scale3)*(q1-z1)(q2-z2)
    由此浮点运算仅为乘积因子，后部为整数乘法
*/
/*
    本计算实现了(q1-z1)，scale与zero point是统一的
*/
    always @(posedge clk) begin
        data_out<=data_in-zero_point;
    end
endmodule