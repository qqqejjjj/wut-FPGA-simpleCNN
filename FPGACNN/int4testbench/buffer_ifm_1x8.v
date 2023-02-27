module buffer_ifm_1x8
#(
    parameter DEPTH=114*114*2,
	parameter ADDR_BIT=15,
	parameter RAM_STYLE_VAL="block"
)
(
    input clk,
    input [ADDR_BIT-2:0] bram_addr_write,//д��ַ
    input [ADDR_BIT-2:0] bram_addr_read,//����ַ

    input bram_en_write,
	input buf_sel,//ifm����ѡ���ź�
    input [3:0] in_0,//����д������
	input [3:0] in_1,//����д������
	input [3:0] in_2,//����д������
	input [3:0] in_3,//����д������
	input [3:0] in_4,//����д������
	input [3:0] in_5,//����д������
	input [3:0] in_6,//����д������
	input [3:0] in_7,//����д������
	
	output [3:0] ifmstream_0,//�������1x8feature map
	output [3:0] ifmstream_1,//�������1x8feature map
	output [3:0] ifmstream_2,//�������1x8feature map
	output [3:0] ifmstream_3,//�������1x8feature map
	output [3:0] ifmstream_4,//�������1x8feature map
	output [3:0] ifmstream_5,//�������1x8feature map
	output [3:0] ifmstream_6,//�������1x8feature map
	output [3:0] ifmstream_7//�������1x8feature map

);
/*
    ԭ�������ͬʱ��д��ַ����λһ���Ƿ��ģ���֤����ͬʱ������һ����ַӰ��ͬ����
*/
    wire buf_sel_n;
	assign buf_sel_n=~buf_sel;
	wire [ADDR_BIT-1:0] bram_addr_write_extend;
	wire [ADDR_BIT-1:0] bram_addr_read_extend;
	assign bram_addr_write_extend={buf_sel,bram_addr_write};
	assign bram_addr_read_extend={buf_sel_n,bram_addr_read};
    	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_0
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_0),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_0),
		.dout_b()
	);
	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_1
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_1),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_1),
		.dout_b()
	);
	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_2
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_2),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_2),
		.dout_b()
	);
	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_3
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_3),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_3),
		.dout_b()
	);
	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_4
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_4),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_4),
		.dout_b()
	);
	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_5
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_5),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_5),
		.dout_b()
	);
	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_6
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_6),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_6),
		.dout_b()
	);
	com_dual_port_ram
	#(
		.WIDTH(8),
		.ADDR_BIT(ADDR_BIT),
		.DEPTH(DEPTH),
		.RAM_STYLE_VAL(RAM_STYLE_VAL)
	)
	u_com_dual_port_ram_7
	(
		.clk(clk),
		.we_a(1'b0),
		.en_a(1'b1),
		.addr_a(bram_addr_read_extend),
		.di_a(),
		.dout_a(ifmstream_7),
		
		.we_b(1'b1),
		.en_b(bram_en_write),
		.addr_b(bram_addr_write_extend),
		.di_b(in_7),
		.dout_b()
	);

endmodule