`timescale 1ns/1ns
module tb_buffer_weight_1x8x8
#(
	parameter DEPTH=512,
	parameter ADDR_BIT=9,
	parameter RAM_STYLE_VAL="block"
)();
    reg clk;
    reg rst;
    reg clear;
    reg bram_en_write;
	reg [3:0] in_0;
	reg [3:0] in_1;
	reg [3:0] in_2;
	reg [3:0] in_3;
	reg [3:0] in_4;
	reg [3:0] in_5;
	reg [3:0] in_6;
	reg [3:0] in_7;
	
	reg [ADDR_BIT-1:0] read_addr;
	wire [35:0] weight_win3x3_00;
	wire [35:0] weight_win3x3_01;
	wire [35:0] weight_win3x3_02;
	wire [35:0] weight_win3x3_03;
	wire [35:0] weight_win3x3_04;
	wire [35:0] weight_win3x3_05;
	wire [35:0] weight_win3x3_06;
	wire [35:0] weight_win3x3_07;
	
	wire [35:0] weight_win3x3_10;
	wire [35:0] weight_win3x3_11;
	wire [35:0] weight_win3x3_12;
	wire [35:0] weight_win3x3_13;
	wire [35:0] weight_win3x3_14;
	wire [35:0] weight_win3x3_15;
	wire [35:0] weight_win3x3_16;
	wire [35:0] weight_win3x3_17;
	
	wire [35:0] weight_win3x3_20;
	wire [35:0] weight_win3x3_21;
	wire [35:0] weight_win3x3_22;
	wire [35:0] weight_win3x3_23;
	wire [35:0] weight_win3x3_24;
	wire [35:0] weight_win3x3_25;
	wire [35:0] weight_win3x3_26;
	wire [35:0] weight_win3x3_27;
	
	wire [35:0] weight_win3x3_30;
	wire [35:0] weight_win3x3_31;
	wire [35:0] weight_win3x3_32;
	wire [35:0] weight_win3x3_33;
	wire [35:0] weight_win3x3_34;
	wire [35:0] weight_win3x3_35;
	wire [35:0] weight_win3x3_36;
	wire [35:0] weight_win3x3_37;
	
	wire [35:0] weight_win3x3_40;
	wire [35:0] weight_win3x3_41;
	wire [35:0] weight_win3x3_42;
	wire [35:0] weight_win3x3_43;
	wire [35:0] weight_win3x3_44;
	wire [35:0] weight_win3x3_45;
	wire [35:0] weight_win3x3_46;
	wire [35:0] weight_win3x3_47;
	
	wire [35:0] weight_win3x3_50;
	wire [35:0] weight_win3x3_51;
	wire [35:0] weight_win3x3_52;
	wire [35:0] weight_win3x3_53;
	wire [35:0] weight_win3x3_54;
	wire [35:0] weight_win3x3_55;
	wire [35:0] weight_win3x3_56;
	wire [35:0] weight_win3x3_57;
	
	wire [35:0] weight_win3x3_60;
	wire [35:0] weight_win3x3_61;
	wire [35:0] weight_win3x3_62;
	wire [35:0] weight_win3x3_63;
	wire [35:0] weight_win3x3_64;
	wire [35:0] weight_win3x3_65;
	wire [35:0] weight_win3x3_66;
	wire [35:0] weight_win3x3_67;
	
	wire [35:0] weight_win3x3_70;
	wire [35:0] weight_win3x3_71;
	wire [35:0] weight_win3x3_72;
	wire [35:0] weight_win3x3_73;
	wire [35:0] weight_win3x3_74;
	wire [35:0] weight_win3x3_75;
	wire [35:0] weight_win3x3_76;
	wire [35:0] weight_win3x3_77;


    initial begin
        read_addr<=0;
        clk<=0;
        rst<=1;
        clear<=1;
        in_0<=0;
        in_1<=0;
        in_2<=0;
        in_3<=0;
        in_4<=0;
        in_5<=0;
        in_6<=0;
        in_7<=0;
        bram_en_write<=1;
        #100
        rst<=0;
        clear<=0;
        in_0<=1;
        in_1<=1;
        in_2<=1;
        in_3<=1;
        in_4<=1;
        in_5<=1;
        in_6<=1;
        in_7<=1;
        #100
        in_0<=2;
        in_1<=2;
        in_2<=2;
        in_3<=2;
        in_4<=2;
        in_5<=2;
        in_6<=2;
        in_7<=2;
        #100
        in_0<=3;
        in_1<=3;
        in_2<=3;
        in_3<=3;
        in_4<=3;
        in_5<=3;
        in_6<=3;
        in_7<=3;
        #100
        in_0<=1;
        in_1<=1;
        in_2<=1;
        in_3<=1;
        in_4<=1;
        in_5<=1;
        in_6<=1;
        in_7<=1;
        #100
        in_0<=2;
        in_1<=2;
        in_2<=2;
        in_3<=2;
        in_4<=2;
        in_5<=2;
        in_6<=2;
        in_7<=2;
        #100
        in_0<=3;
        in_1<=3;
        in_2<=3;
        in_3<=3;
        in_4<=3;
        in_5<=3;
        in_6<=3;
        in_7<=3;
        #100
        in_0<=1;
        in_1<=1;
        in_2<=1;
        in_3<=1;
        in_4<=1;
        in_5<=1;
        in_6<=1;
        in_7<=1;
        #100
        in_0<=2;
        in_1<=2;
        in_2<=2;
        in_3<=2;
        in_4<=2;
        in_5<=2;
        in_6<=2;
        in_7<=2;
        #100
        in_0<=3;
        in_1<=3;
        in_2<=3;
        in_3<=3;
        in_4<=3;
        in_5<=3;
        in_6<=3;
        in_7<=3;
        #100
        in_0<=1;
        in_1<=1;
        in_2<=1;
        in_3<=1;
        in_4<=1;
        in_5<=1;
        in_6<=1;
        in_7<=1;
        #100
        in_0<=2;
        in_1<=2;
        in_2<=2;
        in_3<=2;
        in_4<=2;
        in_5<=2;
        in_6<=2;
        in_7<=2;
        #100
        in_0<=3;
        in_1<=3;
        in_2<=3;
        in_3<=3;
        in_4<=3;
        in_5<=3;
        in_6<=3;
        in_7<=3;
        #100
        in_0<=1;
        in_1<=1;
        in_2<=1;
        in_3<=1;
        in_4<=1;
        in_5<=1;
        in_6<=1;
        in_7<=1;
        #100
        in_0<=2;
        in_1<=2;
        in_2<=2;
        in_3<=2;
        in_4<=2;
        in_5<=2;
        in_6<=2;
        in_7<=2;
        #100
        in_0<=3;
        in_1<=3;
        in_2<=3;
        in_3<=3;
        in_4<=3;
        in_5<=3;
        in_6<=3;
        in_7<=3;
        #100
        in_0<=1;
        in_1<=1;
        in_2<=1;
        in_3<=1;
        in_4<=1;
        in_5<=1;
        in_6<=1;
        in_7<=1;
        #100
        in_0<=2;
        in_1<=2;
        in_2<=2;
        in_3<=2;
        in_4<=2;
        in_5<=2;
        in_6<=2;
        in_7<=2;
        #100
        in_0<=3;
        in_1<=3;
        in_2<=3;
        in_3<=3;
        in_4<=3;
        in_5<=3;
        in_6<=3;
        in_7<=3;
        #100
        in_0<=1;
        in_1<=1;
        in_2<=1;
        in_3<=1;
        in_4<=1;
        in_5<=1;
        in_6<=1;
        in_7<=1;
        #100
        in_0<=2;
        in_1<=2;
        in_2<=2;
        in_3<=2;
        in_4<=2;
        in_5<=2;
        in_6<=2;
        in_7<=2;
        #100
        in_0<=3;
        in_1<=3;
        in_2<=3;
        in_3<=3;
        in_4<=3;
        in_5<=3;
        in_6<=3;
        in_7<=3;

        

        #1000 read_addr<=0;bram_en_write<=0;
        #1000 read_addr<=0;
        #1000 read_addr<=0;
        #1000 read_addr<=0;
        #1000 read_addr<=0;
        #1000 read_addr<=0;
        
    end
    always #80 clk=~clk;
    buffer_weight_1x8x8 u_buffer_weight_1x8x8(
        .clk             (clk             ),
        .rst             (rst             ),
        .clear           (clear           ),
        .bram_en_write   (bram_en_write   ),
        .in_0            (in_0            ),
        .in_1            (in_1            ),
        .in_2            (in_2            ),
        .in_3            (in_3            ),
        .in_4            (in_4            ),
        .in_5            (in_5            ),
        .in_6            (in_6            ),
        .in_7            (in_7            ),
        .read_addr       (read_addr       ),
        .weight_win3x3_00(weight_win3x3_00),
        .weight_win3x3_01(weight_win3x3_01),
        .weight_win3x3_02(weight_win3x3_02),
        .weight_win3x3_03(weight_win3x3_03),
        .weight_win3x3_04(weight_win3x3_04),
        .weight_win3x3_05(weight_win3x3_05),
        .weight_win3x3_06(weight_win3x3_06),
        .weight_win3x3_07(weight_win3x3_07),
        .weight_win3x3_10(weight_win3x3_10),
        .weight_win3x3_11(weight_win3x3_11),
        .weight_win3x3_12(weight_win3x3_12),
        .weight_win3x3_13(weight_win3x3_13),
        .weight_win3x3_14(weight_win3x3_14),
        .weight_win3x3_15(weight_win3x3_15),
        .weight_win3x3_16(weight_win3x3_16),
        .weight_win3x3_17(weight_win3x3_17),
        .weight_win3x3_20(weight_win3x3_20),
        .weight_win3x3_21(weight_win3x3_21),
        .weight_win3x3_22(weight_win3x3_22),
        .weight_win3x3_23(weight_win3x3_23),
        .weight_win3x3_24(weight_win3x3_24),
        .weight_win3x3_25(weight_win3x3_25),
        .weight_win3x3_26(weight_win3x3_26),
        .weight_win3x3_27(weight_win3x3_27),
        .weight_win3x3_30(weight_win3x3_30),
        .weight_win3x3_31(weight_win3x3_31),
        .weight_win3x3_32(weight_win3x3_32),
        .weight_win3x3_33(weight_win3x3_33),
        .weight_win3x3_34(weight_win3x3_34),
        .weight_win3x3_35(weight_win3x3_35),
        .weight_win3x3_36(weight_win3x3_36),
        .weight_win3x3_37(weight_win3x3_37),
        .weight_win3x3_40(weight_win3x3_40),
        .weight_win3x3_41(weight_win3x3_41),
        .weight_win3x3_42(weight_win3x3_42),
        .weight_win3x3_43(weight_win3x3_43),
        .weight_win3x3_44(weight_win3x3_44),
        .weight_win3x3_45(weight_win3x3_45),
        .weight_win3x3_46(weight_win3x3_46),
        .weight_win3x3_47(weight_win3x3_47),
        .weight_win3x3_50(weight_win3x3_50),
        .weight_win3x3_51(weight_win3x3_51),
        .weight_win3x3_52(weight_win3x3_52),
        .weight_win3x3_53(weight_win3x3_53),
        .weight_win3x3_54(weight_win3x3_54),
        .weight_win3x3_55(weight_win3x3_55),
        .weight_win3x3_56(weight_win3x3_56),
        .weight_win3x3_57(weight_win3x3_57),
        .weight_win3x3_60(weight_win3x3_60),
        .weight_win3x3_61(weight_win3x3_61),
        .weight_win3x3_62(weight_win3x3_62),
        .weight_win3x3_63(weight_win3x3_63),
        .weight_win3x3_64(weight_win3x3_64),
        .weight_win3x3_65(weight_win3x3_65),
        .weight_win3x3_66(weight_win3x3_66),
        .weight_win3x3_67(weight_win3x3_67),
        .weight_win3x3_70(weight_win3x3_70),
        .weight_win3x3_71(weight_win3x3_71),
        .weight_win3x3_72(weight_win3x3_72),
        .weight_win3x3_73(weight_win3x3_73),
        .weight_win3x3_74(weight_win3x3_74),
        .weight_win3x3_75(weight_win3x3_75),
        .weight_win3x3_76(weight_win3x3_76),
        .weight_win3x3_77(weight_win3x3_77)
    );

endmodule