`timescale 1ns/1ns
module tb_com_dual_port_ram
#(
	parameter WIDTH=4,
	parameter ADDR_BIT=10,
	parameter DEPTH=1024,
	parameter RAM_STYLE_VAL="block"
)();
    reg                   clk;
	reg                   we_a;
	reg                   en_a;
	reg  [ADDR_BIT-1:0]  addr_a;
	reg  [WIDTH-1:0]     di_a;
	wire  [WIDTH-1:0]     dout_a;
	
	reg                    we_b;
	reg                    en_b;
	reg  [ADDR_BIT-1:0]   addr_b;
	reg  [WIDTH-1:0]      di_b;
	wire  [WIDTH-1:0]      dout_b;

    wire  [ADDR_BIT-1:0]   addr_b_list [3:0];
	wire  [ADDR_BIT-1:0]   addr_a_list [3:0];
	wire  [WIDTH-1:0]      di_b_list   [3:0];
	wire  [WIDTH-1:0]      di_a_list   [3:0];
    
    assign addr_a_list[0] =10'b00;
	assign addr_a_list[1] =10'b01;
	assign addr_a_list[2] =10'b10;
	assign addr_a_list[3] =10'b11;

	assign addr_b_list[0] =10'b00;
	assign addr_b_list[1] =10'b01;
	assign addr_b_list[2] =10'b10;
	assign addr_b_list[3] =10'b11;

	assign di_a_list[0] = 4'b1011;
	assign di_a_list[1] = 4'b1000;
	assign di_a_list[2] = 4'b1010;
	assign di_a_list[3] = 4'b0111;

	assign di_b_list[0] = 4'b0000;
	assign di_b_list[1] = 4'b0001;
	assign di_b_list[2] = 4'b0010;
	assign di_b_list[3] = 4'b0011;

	initial begin
		clk<=0;
		en_a<=1;
		en_b<=1;
		we_a<=1; 
		we_b<=0;//Ò»¶ÁÒ»Ð´
		#10
		addr_a<=addr_a_list[0];
		di_a  <=di_a_list[0];
		addr_b<=addr_b_list[0];
	end

	always #10 clk=~clk;
	com_dual_port_ram u_com_dual_port_ram
	(	
		.clk   (clk   ) ,
		.we_a  (we_a  ) ,
		.en_a  (en_a  ) ,
		.addr_a(addr_a) ,
		.di_a  (di_a  ) ,
		.dout_a(dout_a) ,
		.we_b  (we_b  ) ,
		.en_b  (en_b  ) ,
		.addr_b(addr_b) ,
	    .di_b  (di_b  ) ,
		.dout_b(dout_b)

	);

endmodule