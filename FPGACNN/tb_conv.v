`timescale 1ns/1ns
module tb_conv();
    reg       clk=0;
    reg [2:0] sel=0;
    reg [7:0] ifmstream_0;
    reg [7:0] ifmstream_1;
    reg [7:0] ifmstream_2;
    reg [7:0] ifmstream_3;
    reg [7:0] ifmstream_4;
    reg [7:0] ifmstream_5;
    reg [7:0] ifmstream_6;
    reg [7:0] ifmstream_7;
    
    wire [71:0] ifm_win3x3_0;
    wire [71:0] ifm_win3x3_1;
    wire [71:0] ifm_win3x3_2;
    wire [71:0] ifm_win3x3_3;
    wire [71:0] ifm_win3x3_4;
    wire [71:0] ifm_win3x3_5;
    wire [71:0] ifm_win3x3_6;
    wire [71:0] ifm_win3x3_7;

    reg [71:0] weight_win3x3_00;
    reg [71:0] weight_win3x3_01;
    reg [71:0] weight_win3x3_02;
    reg [71:0] weight_win3x3_03;
    reg [71:0] weight_win3x3_04;
    reg [71:0] weight_win3x3_05;
    reg [71:0] weight_win3x3_06;
    reg [71:0] weight_win3x3_07;
    
    reg [71:0] weight_win3x3_10;
    reg [71:0] weight_win3x3_11;
    reg [71:0] weight_win3x3_12;
    reg [71:0] weight_win3x3_13;
    reg [71:0] weight_win3x3_14;
    reg [71:0] weight_win3x3_15;
    reg [71:0] weight_win3x3_16;
    reg [71:0] weight_win3x3_17;
    
    reg [71:0] weight_win3x3_20;
    reg [71:0] weight_win3x3_21;
    reg [71:0] weight_win3x3_22;
    reg [71:0] weight_win3x3_23;
    reg [71:0] weight_win3x3_24;
    reg [71:0] weight_win3x3_25;
    reg [71:0] weight_win3x3_26;
    reg [71:0] weight_win3x3_27;
    
    reg [71:0] weight_win3x3_30;
    reg [71:0] weight_win3x3_31;
    reg [71:0] weight_win3x3_32;
    reg [71:0] weight_win3x3_33;
    reg [71:0] weight_win3x3_34;
    reg [71:0] weight_win3x3_35;
    reg [71:0] weight_win3x3_36;
    reg [71:0] weight_win3x3_37;
    
    reg [71:0] weight_win3x3_40;
    reg [71:0] weight_win3x3_41;
    reg [71:0] weight_win3x3_42;
    reg [71:0] weight_win3x3_43;
    reg [71:0] weight_win3x3_44;
    reg [71:0] weight_win3x3_45;
    reg [71:0] weight_win3x3_46;
    reg [71:0] weight_win3x3_47;
    
    reg [71:0] weight_win3x3_50;
    reg [71:0] weight_win3x3_51;
    reg [71:0] weight_win3x3_52;
    reg [71:0] weight_win3x3_53;
    reg [71:0] weight_win3x3_54;
    reg [71:0] weight_win3x3_55;
    reg [71:0] weight_win3x3_56;
    reg [71:0] weight_win3x3_57;
    
    reg [71:0] weight_win3x3_60;
    reg [71:0] weight_win3x3_61;
    reg [71:0] weight_win3x3_62;
    reg [71:0] weight_win3x3_63;
    reg [71:0] weight_win3x3_64;
    reg [71:0] weight_win3x3_65;
    reg [71:0] weight_win3x3_66;
    reg [71:0] weight_win3x3_67;
    
    reg [71:0] weight_win3x3_70;
    reg [71:0] weight_win3x3_71;
    reg [71:0] weight_win3x3_72;
    reg [71:0] weight_win3x3_73;
    reg [71:0] weight_win3x3_74;
    reg [71:0] weight_win3x3_75;
    reg [71:0] weight_win3x3_76;
    reg [71:0] weight_win3x3_77;

    reg [17:0] bias_0=0;
    reg [17:0] bias_1=0;
    reg [17:0] bias_2=0;
    reg [17:0] bias_3=0;
    reg [17:0] bias_4=0;
    reg [17:0] bias_5=0;
    reg [17:0] bias_6=0;
    reg [17:0] bias_7=0;
    reg        bias_valid=1;

    wire [17:0] ofm_stream_ch0;
    wire [17:0] ofm_stream_ch1;
    wire [17:0] ofm_stream_ch2;
    wire [17:0] ofm_stream_ch3;
    wire [17:0] ofm_stream_ch4;
    wire [17:0] ofm_stream_ch5;
    wire [17:0] ofm_stream_ch6;
    wire [17:0] ofm_stream_ch7;

    
	wire[17:0] so;
    reg end_1=0;
    	



    initial begin
        /*
        weight_win3x3_00<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_01<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_02<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_03<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_04<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_05<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_06<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_07<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_10<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_11<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_12<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_13<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_14<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_15<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_16<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_17<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_20<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_21<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_22<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_23<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_24<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_25<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_26<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_27<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_30<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_31<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_32<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_33<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_34<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_35<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_36<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_37<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_40<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_41<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_42<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_43<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_44<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_45<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_46<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_47<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_50<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_51<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_52<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_53<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_54<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_55<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_56<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_57<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_60<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_61<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_62<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_63<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_64<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_65<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_66<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_67<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_70<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_71<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_72<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_73<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_74<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_75<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_76<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        weight_win3x3_77<={8'd0,8'd1,8'd2,8'd3,8'd4,8'd5,8'd6,8'd7,8'd8};
        */
        weight_win3x3_00<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_01<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_02<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_03<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_04<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_05<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_06<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_07<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_10<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_11<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_12<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_13<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_14<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_15<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_16<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_17<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_20<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_21<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_22<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_23<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_24<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_25<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_26<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_27<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_30<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_31<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_32<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_33<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_34<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_35<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_36<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_37<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_40<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_41<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_42<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_43<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_44<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_45<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_46<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_47<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_50<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_51<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_52<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_53<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_54<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_55<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_56<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_57<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_60<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_61<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_62<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_63<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_64<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_65<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_66<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_67<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_70<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_71<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_72<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_73<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_74<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_75<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_76<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        weight_win3x3_77<={8'd2,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1,8'd1};
        ifmstream_0<=0;
        ifmstream_1<=0;
        ifmstream_2<=0;
        ifmstream_3<=0;
        ifmstream_4<=0;
        ifmstream_5<=0;
        ifmstream_6<=0;
        ifmstream_7<=0;
        //#20
        ////ifmstream_0<=1;
        //ifmstream_1<=1;
        //ifmstream_2<=1;
        //ifmstream_3<=1;
        //ifmstream_4<=1;
        //ifmstream_5<=1;
        //ifmstream_6<=1;
        //ifmstream_7<=1;
        //#20
        ////ifmstream_0<=2;
        //ifmstream_1<=2;
        //ifmstream_2<=2;
        //ifmstream_3<=2;
        //ifmstream_4<=2;
        //ifmstream_5<=2;
        //ifmstream_6<=2;
        //ifmstream_7<=2;
        //#20
        ////ifmstream_0<=3;
        //ifmstream_1<=3;
        //ifmstream_2<=3;
        //ifmstream_3<=3;
        //ifmstream_4<=3;
        //ifmstream_5<=3;
        //ifmstream_6<=3;
        //ifmstream_7<=3;
        //#20
        ////ifmstream_0<=4;
        //ifmstream_1<=4;
        //ifmstream_2<=4;
        //ifmstream_3<=4;
        //ifmstream_4<=4;
        //ifmstream_5<=4;
        //ifmstream_6<=4;
        //ifmstream_7<=4;
        //#20
        ////ifmstream_0<=5;
        //ifmstream_1<=5;
        //ifmstream_2<=5;
        //ifmstream_3<=5;
        //ifmstream_4<=5;
        //ifmstream_5<=5;
        //ifmstream_6<=5;
        //ifmstream_7<=5;
        //#20
        ////ifmstream_0<=6;
        //ifmstream_1<=6;
        //ifmstream_2<=6;
        //ifmstream_3<=6;
        //ifmstream_4<=6;
        //ifmstream_5<=6;
        //ifmstream_6<=6;
        //ifmstream_7<=6;
        //#20
        ////ifmstream_0<=7;
        //ifmstream_1<=7;
        //ifmstream_2<=7;
        //ifmstream_3<=7;
        //ifmstream_4<=7;
        //ifmstream_5<=7;
        //ifmstream_6<=7;
        //ifmstream_7<=7;
        //#20
        ////ifmstream_0<=8;
        //ifmstream_1<=8;
        //ifmstream_2<=8;
        //ifmstream_3<=8;
        //ifmstream_4<=8;
        //ifmstream_5<=8;
        //ifmstream_6<=8;
        //ifmstream_7<=8;
        //#20
       //// ifmstream_0<=9;
        //ifmstream_1<=9;
        //ifmstream_2<=9;
        //ifmstream_3<=9;
        //ifmstream_4<=9;
        //ifmstream_5<=9;
        //ifmstream_6<=9;
        //ifmstream_7<=9;
        //#20
        ////ifmstream_0<=10;
        //ifmstream_1<=10;
        //ifmstream_2<=10;
        //ifmstream_3<=10;
        //ifmstream_4<=10;
        //ifmstream_5<=10;
        //ifmstream_6<=10;
        //ifmstream_7<=10;
        //#20
        ////ifmstream_0<=11;
        //ifmstream_1<=11;
        //ifmstream_2<=11;
        //ifmstream_3<=11;
        //ifmstream_4<=11;
        //ifmstream_5<=11;
        //ifmstream_6<=11;
        //ifmstream_7<=11;
        //#20
        ////ifmstream_0<=12;
        //ifmstream_1<=12;
        //ifmstream_2<=12;
        //ifmstream_3<=12;
        //ifmstream_4<=12;
        //ifmstream_5<=12;
        //ifmstream_6<=12;
        //ifmstream_7<=12;
        //#20
        ////ifmstream_0<=13;
        //ifmstream_1<=13;
        //ifmstream_2<=13;
        //ifmstream_3<=13;
        //ifmstream_4<=13;
        //ifmstream_5<=13;
        //ifmstream_6<=13;
        //ifmstream_7<=13;
        //#20
        ////ifmstream_0<=14;
        //ifmstream_1<=14;
        //ifmstream_2<=14;
        //ifmstream_3<=14;
        //ifmstream_4<=14;
        //ifmstream_5<=14;
        //ifmstream_6<=14;
        //ifmstream_7<=14;
        //#20
        ////ifmstream_0<=15;
        //ifmstream_1<=15;
        //ifmstream_2<=15;
        //ifmstream_3<=15;
        //ifmstream_4<=15;
        //ifmstream_5<=15;
        //ifmstream_6<=15;
        //ifmstream_7<=15;
        
      
    end
    
    always #10 clk=~clk;
    always #20 
    begin
        ifmstream_0=ifmstream_0+1;
        ifmstream_1=ifmstream_1+1;
        ifmstream_2=ifmstream_2+1;
        ifmstream_3=ifmstream_3+1;
        ifmstream_4=ifmstream_4+1;
        ifmstream_5=ifmstream_5+1;
        ifmstream_6=ifmstream_6+1;
        ifmstream_7=ifmstream_7+1;
    end

    linebuffer_3x3_collect u_linebuffer_3x3_collect
    (
        .clk         (clk         ),
        .sel         (sel         ),
        .ifmstream_0 (ifmstream_0 ),
        .ifmstream_1 (ifmstream_1 ),
        .ifmstream_2 (ifmstream_2 ),
        .ifmstream_3 (ifmstream_3 ),
        .ifmstream_4 (ifmstream_4 ),
        .ifmstream_5 (ifmstream_5 ),
        .ifmstream_6 (ifmstream_6 ),
        .ifmstream_7 (ifmstream_7 ),

        .ifm_win3x3_0(ifm_win3x3_0),
        .ifm_win3x3_1(ifm_win3x3_1),
        .ifm_win3x3_2(ifm_win3x3_2),
        .ifm_win3x3_3(ifm_win3x3_3),
        .ifm_win3x3_4(ifm_win3x3_4),
        .ifm_win3x3_5(ifm_win3x3_5),
        .ifm_win3x3_6(ifm_win3x3_6),
        .ifm_win3x3_7(ifm_win3x3_7)
    );

    module_conv_kernel_1x2x8x4 u_module_conv_kernel_1x2x8x4(
    .clk               (clk             )  ,
    .ifm_win3x3_0      (ifm_win3x3_0    )  ,
    .ifm_win3x3_1      (ifm_win3x3_1    )  ,
    .ifm_win3x3_2      (ifm_win3x3_2    )  ,
    .ifm_win3x3_3      (ifm_win3x3_3    )  ,
    .ifm_win3x3_4      (ifm_win3x3_4    )  ,
    .ifm_win3x3_5      (ifm_win3x3_5    )  ,
    .ifm_win3x3_6      (ifm_win3x3_6    )  ,
    .ifm_win3x3_7      (ifm_win3x3_7    )  ,
    .weight_win3x3_00  (weight_win3x3_00)  ,
    .weight_win3x3_01  (weight_win3x3_01)  ,
    .weight_win3x3_02  (weight_win3x3_02)  ,
    .weight_win3x3_03  (weight_win3x3_03)  ,
    .weight_win3x3_04  (weight_win3x3_04)  ,
    .weight_win3x3_05  (weight_win3x3_05)  ,
    .weight_win3x3_06  (weight_win3x3_06)  ,
    .weight_win3x3_07  (weight_win3x3_07)  ,
    .weight_win3x3_10  (weight_win3x3_10)  ,
    .weight_win3x3_11  (weight_win3x3_11)  ,
    .weight_win3x3_12  (weight_win3x3_12)  ,
    .weight_win3x3_13  (weight_win3x3_13)  ,
    .weight_win3x3_14  (weight_win3x3_14)  ,
    .weight_win3x3_15  (weight_win3x3_15)  ,
    .weight_win3x3_16  (weight_win3x3_16)  ,
    .weight_win3x3_17  (weight_win3x3_17)  ,
    .weight_win3x3_20  (weight_win3x3_20)  ,
    .weight_win3x3_21  (weight_win3x3_21)  ,
    .weight_win3x3_22  (weight_win3x3_22)  ,
    .weight_win3x3_23  (weight_win3x3_23)  ,
    .weight_win3x3_24  (weight_win3x3_24)  ,
    .weight_win3x3_25  (weight_win3x3_25)  ,
    .weight_win3x3_26  (weight_win3x3_26)  ,
    .weight_win3x3_27  (weight_win3x3_27)  ,
    .weight_win3x3_30  (weight_win3x3_30)  ,
    .weight_win3x3_31  (weight_win3x3_31)  ,
    .weight_win3x3_32  (weight_win3x3_32)  ,
    .weight_win3x3_33  (weight_win3x3_33)  ,
    .weight_win3x3_34  (weight_win3x3_34)  ,
    .weight_win3x3_35  (weight_win3x3_35)  ,
    .weight_win3x3_36  (weight_win3x3_36)  ,
    .weight_win3x3_37  (weight_win3x3_37)  ,
    .weight_win3x3_40  (weight_win3x3_40)  ,
    .weight_win3x3_41  (weight_win3x3_41)  ,
    .weight_win3x3_42  (weight_win3x3_42)  ,
    .weight_win3x3_43  (weight_win3x3_43)  ,
    .weight_win3x3_44  (weight_win3x3_44)  ,
    .weight_win3x3_45  (weight_win3x3_45)  ,
    .weight_win3x3_46  (weight_win3x3_46)  ,
    .weight_win3x3_47  (weight_win3x3_47)  ,
    .weight_win3x3_50  (weight_win3x3_50)  ,
    .weight_win3x3_51  (weight_win3x3_51)  ,
    .weight_win3x3_52  (weight_win3x3_52)  ,
    .weight_win3x3_53  (weight_win3x3_53)  ,
    .weight_win3x3_54  (weight_win3x3_54)  ,
    .weight_win3x3_55  (weight_win3x3_55)  ,
    .weight_win3x3_56  (weight_win3x3_56)  ,
    .weight_win3x3_57  (weight_win3x3_57)  ,
    .weight_win3x3_60  (weight_win3x3_60)  ,
    .weight_win3x3_61  (weight_win3x3_61)  ,
    .weight_win3x3_62  (weight_win3x3_62)  ,
    .weight_win3x3_63  (weight_win3x3_63)  ,
    .weight_win3x3_64  (weight_win3x3_64)  ,
    .weight_win3x3_65  (weight_win3x3_65)  ,
    .weight_win3x3_66  (weight_win3x3_66)  ,
    .weight_win3x3_67  (weight_win3x3_67)  ,
    .weight_win3x3_70  (weight_win3x3_70)  ,
    .weight_win3x3_71  (weight_win3x3_71)  ,
    .weight_win3x3_72  (weight_win3x3_72)  ,
    .weight_win3x3_73  (weight_win3x3_73)  ,
    .weight_win3x3_74  (weight_win3x3_74)  ,
    .weight_win3x3_75  (weight_win3x3_75)  ,
    .weight_win3x3_76  (weight_win3x3_76)  ,
    .weight_win3x3_77  (weight_win3x3_77)  ,
    .bias_0            (bias_0          )  ,
    .bias_1            (bias_1          )  ,
    .bias_2            (bias_2          )  ,
    .bias_3            (bias_3          )  ,
    .bias_4            (bias_4          )  ,
    .bias_5            (bias_5          )  ,
    .bias_6            (bias_6          )  ,
    .bias_7            (bias_7          )  ,
    .bias_valid        (bias_valid      )  ,
    .ofm_stream_ch0    (ofm_stream_ch0  )  ,
    .ofm_stream_ch1    (ofm_stream_ch1  )  ,
    .ofm_stream_ch2    (ofm_stream_ch2  )  ,
    .ofm_stream_ch3    (ofm_stream_ch3  )  ,
    .ofm_stream_ch4    (ofm_stream_ch4  )  ,
    .ofm_stream_ch5    (ofm_stream_ch5  )  ,
    .ofm_stream_ch6    (ofm_stream_ch6  )  ,
    .ofm_stream_ch7    (ofm_stream_ch7  )  
);
module_outcome_collect u_module_outcome_collect
(
    .clk(clk),
    .si(ofm_stream_ch0),
    .so(so)
);
endmodule