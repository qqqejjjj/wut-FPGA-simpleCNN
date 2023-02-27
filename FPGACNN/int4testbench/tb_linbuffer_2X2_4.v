`timescale 1ns/1ns
module tb_linbuffer_2X2_4();
    reg clk;
    reg [2:0] sel;
    reg [3:0]   ifmstream_in_array  [0:300];
    wire [3:0]   ifmstream_in;
    wire    [15:0]  ifm_win2X2_batch ;
    wire [3:0] win1_1;
    wire [3:0] win1_2;
    wire [3:0] win2_1;
    wire [3:0] win2_2;
    integer i;
    reg [15:0] t;

    
    assign ifmstream_in=ifmstream_in_array[t];  
    assign win1_1=ifm_win2X2_batch[3:0];
	assign win1_2=ifm_win2X2_batch[7:4];
	assign win2_1=ifm_win2X2_batch[11:8];
	assign win2_2=ifm_win2X2_batch[15:12];     
    
    initial begin
        for(i=0;i<300;i=i+1)
        begin
            ifmstream_in_array[i]=i%16;
        end      
        clk<=1'b0;
        sel<=2'b1;
        t<=0;
        #5000
        sel<= 3;
        #5000
        sel<= 5;
    end


always  #10 clk<=~clk; 
always  #200 t<=(t+1)%300;



linebuffer_2x2_type_x4 linebuffer_2x2_type_x4_u
(
    .clk (clk)         ,
    .sel  (sel)       ,			  
    .ifmstream_in (ifmstream_in)     ,	
    .ifm_win2X2_batch(ifm_win2X2_batch)

);

endmodule