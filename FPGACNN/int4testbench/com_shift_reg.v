module com_shift_reg
#(
	parameter DEPTH=30,
	parameter WIDTH=4,
	parameter SRL_STYLE_VAL="reg_srl_reg"
)
(
    input clk,
	input [WIDTH-1:0] si,
	output [WIDTH-1:0] so
);
    (* srl_style=SRL_STYLE_VAL*)
    reg [WIDTH-1:0] sreg [0:DEPTH];

    integer t;
    initial begin//生成起始空数组
        for(t=0;t<DEPTH;t=t+1)
            sreg[t]=0;
    end
    // 最后一位是输出
    assign so=sreg[DEPTH];
    // 头部输入初始值
    always@(*) begin
        sreg[0]=si;
    end
    //生成位移
   generate 
        genvar i;//相当于循环位移
		for(i=1;i<=DEPTH;i=i+1)
		begin
			always@(posedge clk)
			begin
					sreg[i]<=sreg[i-1];
			end
		end
    endgenerate 

endmodule