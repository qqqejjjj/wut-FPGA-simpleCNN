module cal_relu
(
	input clk,
	input signed [3:0] zero_point,
	input signed [3:0] data_in,
	output reg signed [3:0] data_out
);
//relu是否大于零点
	always@(posedge clk) begin
		if(data_in>=zero_point) begin
			data_out<=data_in;
		end else begin
			data_out<=zero_point;
		end
	end
endmodule
