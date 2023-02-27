module com_dual_port_ram//双端口可输入可输出ram
#(
    parameter WIDTH=4,              //常数数据位宽
	parameter ADDR_BIT=10,          //常数地址位宽 上限 2^10存1024个数据
	parameter DEPTH=1024,           //数据深度1024与地址匹配
	parameter RAM_STYLE_VAL="block" //ram类型，blockram
)
(
    input clk,
    input en_a,
    input we_a,                     //a端口写使能
    input [ADDR_BIT-1:0] addr_a,    //a端口地址输入
	input [WIDTH-1:0] di_a,         //a端口位宽
	output reg [WIDTH-1:0] dout_a,  //a端口输出
	
	input we_b,
	input en_b,
	input [ADDR_BIT-1:0] addr_b,
	input [WIDTH-1:0] di_b,
	output reg [WIDTH-1:0] dout_b
);
    (*ram_style=RAM_STYLE_VAL*)
    //声明一个ram，数据类型为数组位宽深度一定
    reg [WIDTH-1:0] RAM [0:DEPTH-1];
    integer t;
    //初始化赋值为0
	initial begin
		for(t=0;t<DEPTH;t=t+1)
			RAM[t]=0;
	end

    always@(posedge clk) begin
        if(en_a)
        begin
            if(we_a)
                RAM[addr_a]<=di_a;
            else
                dout_a<=RAM[addr_a];
        end
    end
    
    always@(posedge clk) begin
		if(en_b)
		begin
			if(we_b)
				RAM[addr_b]<=di_b;
			else
				dout_b<=RAM[addr_b];
		end
	end

endmodule