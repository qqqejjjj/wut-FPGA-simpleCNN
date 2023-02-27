(*use_dsp="yes"*)//vivado���ۺ�ָ���ǿ��ʹ��dspģ��
module cal_mult_int8_x2_dsp
(
	input clk,
	input signed [7:0]a,//������a��8λ
	input signed [7:0]b,//������b��8λ
	input signed [7:0]c,//������c��8λ
	
	output signed [15:0]ac,//���ac�˻���16λ
	output signed [15:0]bc //���bc�˻���16λ
);
	wire signed [26:0]A_PORT;//DSP��A�˿�
	wire signed [26:0]D_PORT;//DSP��D�˿�
	wire signed [17:0]B_PORT;//DSP��B�˿�
	
	reg signed [26:0]A_PORT_REG;
	reg signed [26:0]D_PORT_REG;
	reg signed [17:0]B_PORT_REG_1;
	reg signed [17:0]B_PORT_REG_2;
	reg signed [26:0]A_Plus_D;//AD֮������dspԤ����
	reg signed [44:0]MULT_RES;//�˷��������
	reg signed [44:0]DOUT;//������
	/*
		��ģ�鶼������������ˮ����
		1������������ֵa��b��c���з���λ��չ������Ԥ����AD��λ��Ҫ��
		2��Ȼ�������ˮ��ֵ���㣬Bregͨ�������Ĵ���������ʱ��Լ��
		3�����мӷ���˷����㲢��������������������������ͼbc��0-15λ��ac��18-33λ
	*/
	assign A_PORT={a[7],a[7:0],{18{1'b0}}};
	assign D_PORT={{19{b[7]}},b[7:0]};
	assign B_PORT={{10{c[7]}},c[7:0]};
	//verilog�з���������
    /*
    ��verilog���з����������Բ�����ʽ����
    ����ļ�����ڸ��� ������λ�ⷴ���1 
    ��������
    -2��1 010 1 110
     3��0 011 
    �����з������ļӷ���Ҫλ������չ��ֹ���
    ����λ��չ��������ֵ������������չλ
    ������������
    +7 0 0111 ��չ��8λ 0 0000 0111
    -7 1 1001 ��չ��8λ 1 1111 1001 ԭ��Ϊ�����һȡ��=�� 1   0000  0111
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
