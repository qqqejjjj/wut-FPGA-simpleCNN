module cal_sub_zero_point//substraction of zero point
(
    input clk,
    input signed [3:0] zero_point,
    input signed [3:0] data_in,
    output reg signed [3:0] data_out
);
/*
    ��㣬��������������
    r:������ֵ q������ֵ
    scale=(r_max-r_min��/(q_max-q_min)
    zero_point=round(q_max-r_max/s)
    q=round(r/scale)+zero_point
    �ڽ��г˷�����ʱ��
    r3=r1*r2
    q3-z3=(scale1*scale2/scale3)*(q1-z1)(q2-z2)
    �ɴ˸��������Ϊ�˻����ӣ���Ϊ�����˷�
*/
/*
    ������ʵ����(q1-z1)��scale��zero point��ͳһ��
*/
    always @(posedge clk) begin
        data_out<=data_in-zero_point;
    end
endmodule