module cal_addtree_int8_x9
(
    input clk,
    input signed [7:0]a1,
	input signed [7:0]a2,
	input signed [7:0]a3,
	input signed [7:0]a4,
	input signed [7:0]a5,
	input signed [7:0]a6,
	input signed [7:0]a7,
	input signed [7:0]a8,
	input signed [7:0]a9,
	output reg signed [11:0] dout //�����λ
);
    wire signed [11:0]a1_d1;
	wire signed [11:0]a2_d1;
	wire signed [11:0]a3_d1;
	wire signed [11:0]a4_d1;
	wire signed [11:0]a5_d1;
	wire signed [11:0]a6_d1;
	wire signed [11:0]a7_d1;
	wire signed [11:0]a8_d1;
	wire signed [11:0]a9_d1;
	
	reg signed [11:0]b1_d2;
	reg signed [11:0]b2_d2;
	reg signed [11:0]b3_d2;
    //verilog�з���������
    /*
    ��verilog���з����������Բ�����ʽ����
    ����ļ�����ڸ��� ������λ�ⷴ���1 
    ��������
    -2��1 010 1 110
     3��0 011 
    �����з������ļӷ���Ҫλ������չ��ֹ������Ÿ�������int8
    ����Ӽ�������ǵ� int10 2^7*(2^3+1) 
    
    ����λ��չ��������ֵ������������չλ
    ������������
    +7 0 0111 ��չ��8λ 0 0000 0111
    -7 1 1001 ��չ��8λ 1 1111 1001 ԭ��Ϊ�����һȡ��=�� 1   0000  0111
    */
    assign a1_d1={a1[7],a1[7],a1[7],a1[7],a1[7:0]};
	assign a2_d1={a2[7],a2[7],a2[7],a2[7],a2[7:0]};
	assign a3_d1={a3[7],a3[7],a3[7],a3[7],a3[7:0]};
	assign a4_d1={a4[7],a4[7],a4[7],a4[7],a4[7:0]};
	assign a5_d1={a5[7],a5[7],a5[7],a5[7],a5[7:0]};
	assign a6_d1={a6[7],a6[7],a6[7],a6[7],a6[7:0]};
	assign a7_d1={a7[7],a7[7],a7[7],a7[7],a7[7:0]};
	assign a8_d1={a8[7],a8[7],a8[7],a8[7],a8[7:0]};
	assign a9_d1={a9[7],a9[7],a9[7],a9[7],a9[7:0]};


    always@(posedge clk) begin
	    b1_d2<=a1_d1+a2_d1+a3_d1;
		b2_d2<=a4_d1+a5_d1+a6_d1;
		b3_d2<=a7_d1+a8_d1+a9_d1;
		
		dout<=b1_d2+b2_d2+b3_d2;
	end
endmodule