module cal_scale_shift
(
	input clk,
	input signed [31:0] din,
	input [3:0] shift,
	output signed [15:0] dout
);
    /*
        shift����λ�ƣ��ֽ�ĸ������˷� 
        �������㲻ͬ���������㣬������2ʱ���о�����ʧ��
        0110 =�� 0011 =��0001С�����ֱ�ֱ��������
        6        3      1
        ������ʹ�õ���������������������
        0110 =�� 0011 =��0001+1=0010 =��0001 =��0000+1=0001 ����ģʽ������ֱֵ�ӹ���
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