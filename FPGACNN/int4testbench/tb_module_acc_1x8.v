`timescale 1ns/1ns
module tb_module_acc_1x8
#(
	parameter DEPTH=114*114,
	parameter ADDR_BIT=14
)();
    reg clk;                   
    reg prev_data_zero=0;
    reg curr_data_zero=0;
    reg read_en;
    reg write_en;
    reg [ADDR_BIT-1:0] read_addr;
    reg [ADDR_BIT-1:0] write_addr;
    reg [14:0] curr_data_0;
    reg [14:0] curr_data_1;
    reg [14:0] curr_data_2;
    reg [14:0] curr_data_3;
    reg [14:0] curr_data_4;
    reg [14:0] curr_data_5;
    reg [14:0] curr_data_6;
    reg [14:0] curr_data_7;
    wire [14:0] acc_result_0;
    wire [14:0] acc_result_1;
    wire [14:0] acc_result_2;
    wire [14:0] acc_result_3;
    wire [14:0] acc_result_4;
    wire [14:0] acc_result_5;
    wire [14:0] acc_result_6;
    wire [14:0] acc_result_7;

    wire [ADDR_BIT-1:0] read_addr_list [3:0];
    wire [ADDR_BIT-1:0] write_addr_list[3:0];
    wire [14:0]         curr_data_list [3:0];


    assign read_addr_list[0] =10'b00;
    assign read_addr_list[1] =10'b01;
    assign read_addr_list[2] =10'b10;
    assign read_addr_list[3] =10'b11;
    assign write_addr_list[0] =10'b00;
    assign write_addr_list[1] =10'b01;
    assign write_addr_list[2] =10'b10;
    assign write_addr_list[3] =10'b11;
    assign curr_data_list[0] = 4'b1011;
    assign curr_data_list[1] = 4'b1000;
    assign curr_data_list[2] = 4'b1010;
    assign curr_data_list[3] = 4'b0111;


    initial begin
        clk<=0;
        read_en<=1;
        write_en<=1;
        #300
        write_en<=1;
        read_addr  <=read_addr_list[0];
        write_addr <=write_addr_list[0];
        curr_data_0<=curr_data_list[0];
        curr_data_1<=curr_data_list[0];
        curr_data_2<=curr_data_list[0];
        curr_data_3<=curr_data_list[0];
        curr_data_4<=curr_data_list[0];
        curr_data_5<=curr_data_list[0];
        curr_data_6<=curr_data_list[0];
        curr_data_7<=curr_data_list[0];
        #300
        write_en<=1;
        read_addr  <=read_addr_list[1];
        write_addr <=write_addr_list[1];
        curr_data_0<=curr_data_list[1];
        curr_data_1<=curr_data_list[1];
        curr_data_2<=curr_data_list[1];
        curr_data_3<=curr_data_list[1];
        curr_data_4<=curr_data_list[1];
        curr_data_5<=curr_data_list[1];
        curr_data_6<=curr_data_list[1];
        curr_data_7<=curr_data_list[1];
        #300
        write_en<=1;
        read_addr  <=read_addr_list[2];
        write_addr <=write_addr_list[2];
        curr_data_0<=curr_data_list[2];
        curr_data_1<=curr_data_list[2];
        curr_data_2<=curr_data_list[2];
        curr_data_3<=curr_data_list[2];
        curr_data_4<=curr_data_list[2];
        curr_data_5<=curr_data_list[2];
        curr_data_6<=curr_data_list[2];
        curr_data_7<=curr_data_list[2];
        #300
       
        read_en<=1;
        read_addr  <=read_addr_list[3];
        write_addr <=write_addr_list[3];
        curr_data_0<=curr_data_list[3];
        curr_data_1<=curr_data_list[3];
        curr_data_2<=curr_data_list[3];
        curr_data_3<=curr_data_list[3];
        curr_data_4<=curr_data_list[3];
        curr_data_5<=curr_data_list[3];
        curr_data_6<=curr_data_list[3];
        curr_data_7<=curr_data_list[3];
    end
    module_acc_1x8 u_module_acc_1x8
    (
        .clk           (clk           ),
        .prev_data_zero(prev_data_zero),
        .curr_data_zero(curr_data_zero),
        .read_en       (read_en       ),
        .write_en      (write_en      ),
        .read_addr     (read_addr     ),
        .write_addr     (write_addr     ),
        .curr_data_0   (curr_data_0   ),
        .curr_data_1   (curr_data_1   ),
        .curr_data_2   (curr_data_2   ),
        .curr_data_3   (curr_data_3   ),
        .curr_data_4   (curr_data_4   ),
        .curr_data_5   (curr_data_5   ),
        .curr_data_6   (curr_data_6   ),
        .curr_data_7   (curr_data_7   ),
        .acc_result_0  (acc_result_0  ),
        .acc_result_1  (acc_result_1  ),
        .acc_result_2  (acc_result_2  ),
        .acc_result_3  (acc_result_3  ),
        .acc_result_4  (acc_result_4  ),
        .acc_result_5  (acc_result_5  ),
        .acc_result_6  (acc_result_6  ),
        .acc_result_7  (acc_result_7  )
    );
    
    always #10 clk=~clk;

endmodule