module module_acc
#(
    parameter DEPTH=114*114,             //深度都是可配置的
	parameter ADDR_BIT=14
)
(
    input                 clk,
    input                 prev_data_zero,//之前值是否为0
    input                 curr_data_zero,//当前值是否为0

    input                 read_en,
    input                 write_en,
    input  [ADDR_BIT-1:0] read_addr,
	input  [ADDR_BIT-1:0] write_addr,
	
	input  [14:0]         curr_data,    
	output [14:0]         acc_result
);
    wire   [14:0]         prev_data;    //之前值
    wire   [14:0]         post_data;    //之后值

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
		.we_a(1'b0),        //读模式
		.en_a(read_en),
		.addr_a(read_addr), //读地址
		.di_a(),
		.dout_a(prev_data), //读取prev_data
		
		.we_b(1'b1),        //写模式
		.en_b(write_en),    //写使能
		.addr_b(write_addr),//写地址
		.di_b(post_data),   //写入累加的值
		.dout_b()
	);
	
	cal_acc u_cal_acc
	(
		.clk(clk),
		.a(prev_data),//之前
		.b(curr_data),//现在
		.a_zero(prev_data_zero),
		.b_zero(curr_data_zero),
		.c(post_data)//之后
	);
	
	assign acc_result=post_data;


endmodule