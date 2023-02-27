module module_acc
#(
    parameter DEPTH=114*114,             //��ȶ��ǿ����õ�
	parameter ADDR_BIT=14
)
(
    input                 clk,
    input                 prev_data_zero,//֮ǰֵ�Ƿ�Ϊ0
    input                 curr_data_zero,//��ǰֵ�Ƿ�Ϊ0

    input                 read_en,
    input                 write_en,
    input  [ADDR_BIT-1:0] read_addr,
	input  [ADDR_BIT-1:0] write_addr,
	
	input  [14:0]         curr_data,    
	output [14:0]         acc_result
);
    wire   [14:0]         prev_data;    //֮ǰֵ
    wire   [14:0]         post_data;    //֮��ֵ

    com_dual_port_ram
	#(
		.WIDTH(15),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL("block")
	)
	u_com_dual_port_ram_ofm
	(
		.clk(clk),
		.we_a(1'b0),        //��ģʽ
		.en_a(read_en),
		.addr_a(read_addr), //����ַ
		.di_a(),
		.dout_a(prev_data), //��ȡprev_data
		
		.we_b(1'b1),        //дģʽ
		.en_b(write_en),    //дʹ��
		.addr_b(write_addr),//д��ַ
		.di_b(post_data),   //д���ۼӵ�ֵ
		.dout_b()
	);
	
	cal_acc u_cal_acc
	(
		.clk(clk),
		.a(prev_data),//֮ǰ
		.b(curr_data),//����
		.a_zero(prev_data_zero),
		.b_zero(curr_data_zero),
		.c(post_data)//֮��
	);
	
	assign acc_result=post_data;


endmodule