module module_outcome_collect 
#(
	parameter DEPTH=12, //深度要提前算出 就是本次卷积的ofm的总像素数 (length-2)*column
	parameter WIDTH= 18,
	parameter SRL_STYLE_VAL="reg_srl_reg",
    parameter length=8,//行长度
	parameter column=3//列长度
)
(
    input clk,
	input [WIDTH-1:0] si,
	output [WIDTH-1:0] so
);
reg [WIDTH-1:0] sreg [0:DEPTH];

	integer t;
	initial begin
		for(t=0;t<=DEPTH;t=t+1)
			sreg[t]=0;
	end
    reg signed[10:0] cnt=0;
	reg 	enable_sign=0;
	assign so=sreg[DEPTH];
	//触发信号为输入
	//使能信号生成模块
	always@(si) begin
        cnt=cnt+1;
        t=(cnt)%(length);
        sreg[0]=si;
        if((t==1||t==2)||((cnt)<=(length*2+2)))
        begin
            enable_sign=0;
        end
        else 
        begin
            enable_sign=1;
        end
	end
	//移位寄存器模块
	genvar  i;
    reg[5:0] end_sign=0;
	generate 
		for(i=1;i<=DEPTH;i=i+1)
		begin
			always@(si)
			begin
                if(enable_sign&&(end_sign<(DEPTH)))
                begin
                    sreg[i]<=sreg[i-1];
                    end_sign<=end_sign+1;
                end
			end
		end
	endgenerate
endmodule

