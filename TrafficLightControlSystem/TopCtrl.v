`timescale 1ns / 1ps

module TopCtrl(
	input clk,
	input Cm,
	input Cc,
	input PQm,
	input PQc,
	input peak,
	input set,
	input rst,
	input online,
	output online_led,
	output set_led,
	output [2:0]m_led,
	output [2:0]c_led,
	output [3:0] sm_wei,
	output [7:0] sm_duan
    );
	
	wire [4:0]countdown_time;
	
	control Control(clk, Cm, Cc, PQm, PQc, peak, set, rst, online,countdown_time,{m_led,c_led});
	led_ctrl Led_Ctrl(clk,set,online,online_led,set_led);
	time_trans Trans(clk, countdown_time, sm_wei, sm_duan);
	

endmodule
