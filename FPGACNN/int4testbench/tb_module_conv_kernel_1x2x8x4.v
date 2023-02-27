`timescale 1ns/1ns
module tb_module_conv_kernel_1x2x8x4();

    wire[35:0] ifm_win3x3_0=36'hfffffffff;
	wire[35:0] ifm_win3x3_1=36'hfffffffff;
	wire[35:0] ifm_win3x3_2=36'hfffffffff;
	wire[35:0] ifm_win3x3_3=36'hfffffffff;
	wire[35:0] ifm_win3x3_4=36'hfffffffff;
	wire[35:0] ifm_win3x3_5=36'hfffffffff;
	wire[35:0] ifm_win3x3_6=36'hfffffffff;
	wire[35:0] ifm_win3x3_7=36'hfffffffff;

	wire[35:0] weight_win3x3_00=36'hfffffffff;
	wire[35:0] weight_win3x3_01=36'hfffffffff;
	wire[35:0] weight_win3x3_02=36'hfffffffff;
	wire[35:0] weight_win3x3_03=36'hfffffffff;
	wire[35:0] weight_win3x3_04=36'hfffffffff;
	wire[35:0] weight_win3x3_05=36'hfffffffff;
	wire[35:0] weight_win3x3_06=36'hfffffffff;
	wire[35:0] weight_win3x3_07=36'hfffffffff;
	
	wire[35:0] weight_win3x3_10=36'hfffffffff;
	wire[35:0] weight_win3x3_11=36'hfffffffff;
	wire[35:0] weight_win3x3_12=36'hfffffffff;
	wire[35:0] weight_win3x3_13=36'hfffffffff;
	wire[35:0] weight_win3x3_14=36'hfffffffff;
	wire[35:0] weight_win3x3_15=36'hfffffffff;
	wire[35:0] weight_win3x3_16=36'hfffffffff;
	wire[35:0] weight_win3x3_17=36'hfffffffff;
	
	wire[35:0] weight_win3x3_20=36'hfffffffff;
	wire[35:0] weight_win3x3_21=36'hfffffffff;
	wire[35:0] weight_win3x3_22=36'hfffffffff;
	wire[35:0] weight_win3x3_23=36'hfffffffff;
	wire[35:0] weight_win3x3_24=36'hfffffffff;
	wire[35:0] weight_win3x3_25=36'hfffffffff;
	wire[35:0] weight_win3x3_26=36'hfffffffff;
	wire[35:0] weight_win3x3_27=36'hfffffffff;
	
	wire[35:0] weight_win3x3_30=36'hfffffffff;
	wire[35:0] weight_win3x3_31=36'hfffffffff;
	wire[35:0] weight_win3x3_32=36'hfffffffff;
	wire[35:0] weight_win3x3_33=36'hfffffffff;
	wire[35:0] weight_win3x3_34=36'hfffffffff;
	wire[35:0] weight_win3x3_35=36'hfffffffff;
	wire[35:0] weight_win3x3_36=36'hfffffffff;
	wire[35:0] weight_win3x3_37=36'hfffffffff;
	
	wire[35:0] weight_win3x3_40=36'hfffffffff;
	wire[35:0] weight_win3x3_41=36'hfffffffff;
	wire[35:0] weight_win3x3_42=36'hfffffffff;
	wire[35:0] weight_win3x3_43=36'hfffffffff;
	wire[35:0] weight_win3x3_44=36'hfffffffff;
	wire[35:0] weight_win3x3_45=36'hfffffffff;
	wire[35:0] weight_win3x3_46=36'hfffffffff;
	wire[35:0] weight_win3x3_47=36'hfffffffff;
	
	wire[35:0] weight_win3x3_50=36'hfffffffff;
	wire[35:0] weight_win3x3_51=36'hfffffffff;
	wire[35:0] weight_win3x3_52=36'hfffffffff;
	wire[35:0] weight_win3x3_53=36'hfffffffff;
	wire[35:0] weight_win3x3_54=36'hfffffffff;
	wire[35:0] weight_win3x3_55=36'hfffffffff;
	wire[35:0] weight_win3x3_56=36'hfffffffff;
	wire[35:0] weight_win3x3_57=36'hfffffffff;
	
	wire[35:0] weight_win3x3_60=36'hfffffffff;
	wire[35:0] weight_win3x3_61=36'hfffffffff;
	wire[35:0] weight_win3x3_62=36'hfffffffff;
	wire[35:0] weight_win3x3_63=36'hfffffffff;
	wire[35:0] weight_win3x3_64=36'hfffffffff;
	wire[35:0] weight_win3x3_65=36'hfffffffff;
	wire[35:0] weight_win3x3_66=36'hfffffffff;
	wire[35:0] weight_win3x3_67=36'hfffffffff;
	
	wire[35:0] weight_win3x3_70=36'hfffffffff;
	wire[35:0] weight_win3x3_71=36'hfffffffff;
	wire[35:0] weight_win3x3_72=36'hfffffffff;
	wire[35:0] weight_win3x3_73=36'hfffffffff;
	wire[35:0] weight_win3x3_74=36'hfffffffff;
	wire[35:0] weight_win3x3_75=36'hfffffffff;
	wire[35:0] weight_win3x3_76=36'hfffffffff;
	wire[35:0] weight_win3x3_77=36'hfffffffff;
	
	wire[11:0] bias_0=1;
	wire[11:0] bias_1=1;
	wire[11:0] bias_2=1;
	wire[11:0] bias_3=1;
	wire[11:0] bias_4=1;
	wire[11:0] bias_5=1;
	wire[11:0] bias_6=1;
	wire[11:0] bias_7=1;
	wire bias_valid=1;
	
	wire [14:0] ofm_stream_ch0;
	wire [14:0] ofm_stream_ch1;
	wire [14:0] ofm_stream_ch2;
	wire [14:0] ofm_stream_ch3;
	wire [14:0] ofm_stream_ch4;
	wire [14:0] ofm_stream_ch5;
	wire [14:0] ofm_stream_ch6;
	wire [14:0] ofm_stream_ch7;

    reg clk=0;
    always #10 clk=~clk;

module_conv_kernel_1x2x8x4 u_module_conv_kernel_1x2x8x4
(
	.clk(clk),
	.ifm_win3x3_0(ifm_win3x3_0),
	.ifm_win3x3_1(ifm_win3x3_1),
	.ifm_win3x3_2(ifm_win3x3_2),
	.ifm_win3x3_3(ifm_win3x3_3),
	.ifm_win3x3_4(ifm_win3x3_4),
	.ifm_win3x3_5(ifm_win3x3_5),
	.ifm_win3x3_6(ifm_win3x3_6),
	.ifm_win3x3_7(ifm_win3x3_7),

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
	.weight_win3x3_77(weight_win3x3_77),

	.bias_0(bias_0),
	.bias_1(bias_1),
	.bias_2(bias_2),
	.bias_3(bias_3),
	.bias_4(bias_4),
	.bias_5(bias_5),
	.bias_6(bias_6),
	.bias_7(bias_7),
	.bias_valid(bias_valid),

	.ofm_stream_ch0(ofm_stream_ch0),
	.ofm_stream_ch1(ofm_stream_ch1),
	.ofm_stream_ch2(ofm_stream_ch2),
	.ofm_stream_ch3(ofm_stream_ch3),
	.ofm_stream_ch4(ofm_stream_ch4),
	.ofm_stream_ch5(ofm_stream_ch5),
	.ofm_stream_ch6(ofm_stream_ch6),
	.ofm_stream_ch7(ofm_stream_ch7)
);
endmodule