`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   16:29:18 09/18/2015
// Design Name:   time_trans
// Module Name:   C:/Users/WYK/Desktop/DC keshe/TrafficLightControlSystem2.0/Test_timetrans.v
// Project Name:  TrafficLightControlSystem2.0
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: time_trans
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module Test_timetrans;

	// Inputs
	reg clk;
	reg [4:0] countdown_time;

	// Outputs
	wire [3:0] sm_wei;
	wire [7:0] sm_duan;

	// Instantiate the Unit Under Test (UUT)
	time_trans uut (
		.clk(clk), 
		.countdown_time(countdown_time), 
		.sm_wei(sm_wei), 
		.sm_duan(sm_duan)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		countdown_time = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

