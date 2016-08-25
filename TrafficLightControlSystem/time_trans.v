`timescale 1ns / 1ps

module time_trans(
	input clk,
	input [4:0]countdown_time,
	output [3:0] sm_wei,
	output [7:0] sm_duan
    );
	
	reg [7:0]data = 8'b00010110;
	//±àÂë
	always @(posedge clk)begin
		case(countdown_time)
			5'd0:data = 8'b00000000;
			5'd1:data = 8'b00000001;
			5'd2:data = 8'b00000010;
			5'd3:data = 8'b00000011;
			5'd4:data = 8'b00000100;
			5'd5:data = 8'b00000101;
			5'd6:data = 8'b00000110;
			5'd7:data = 8'b00000111;
			5'd8:data = 8'b00001000;
			5'd9:data = 8'b00001001;
			5'd10:data = 8'b00010000;
			5'd11:data = 8'b00010001;
			5'd12:data = 8'b00010010;
			5'd13:data = 8'b00010011;
			5'd14:data = 8'b00010100;
			5'd15:data = 8'b00010101;
			5'd16:data = 8'b00010110;
		endcase
	end
	
	//½µÆµ
	reg [31:0]clk_cnt;
	reg clk_4kHz;
	always @(posedge clk)
		if(clk_cnt==32'd3)begin 
			clk_cnt <= 1'b0;
			clk_4kHz <= ~clk_4kHz;
		end
		else
			clk_cnt <= clk_cnt + 1'b1;

	//Î»¿ØÖÆ
	reg [3:0]wei_ctrl=4'b1011;
	always @(posedge clk_4kHz)
		wei_ctrl <= {wei_ctrl[2],wei_ctrl[3],wei_ctrl[1:0]};
	//¶Î¿ØÖÆ
	reg [3:0]duan_ctrl;
	always @(wei_ctrl)
		case(wei_ctrl)
			4'b1011:duan_ctrl=data[3:0];
			4'b0111:duan_ctrl=data[7:4];
			default:duan_ctrl=4'hf;
		endcase

	//½âÂëÄ£¿é
	reg [7:0]duan;
	always @(duan_ctrl)
		case(duan_ctrl)
			4'h0:duan=8'b1100_0000;//0
			4'h1:duan=8'b1111_1001;//1
			4'h2:duan=8'b1010_0100;//2
			4'h3:duan=8'b1011_0000;//3
			4'h4:duan=8'b1001_1001;//4
			4'h5:duan=8'b1001_0010;//5
			4'h6:duan=8'b1000_0010;//6
			4'h7:duan=8'b1111_1000;//7
			4'h8:duan=8'b1000_0000;//8
			4'h9:duan=8'b1001_0000;//9
			default:duan = 8'b1100_0000;//0
		endcase

	assign sm_wei = wei_ctrl;
	assign sm_duan = duan;
	
endmodule
