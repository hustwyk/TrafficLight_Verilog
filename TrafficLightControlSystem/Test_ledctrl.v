`timescale 1ns / 1ps


module Test_ledctrl;

	// Inputs
	reg clk;
	reg set;
	reg online;

	// Outputs
	wire online_led;
	wire set_led;

	// Instantiate the Unit Under Test (UUT)
	led_ctrl uut (
		.clk(clk), 
		.set(set), 
		.online(online), 
		.online_led(online_led), 
		.set_led(set_led)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		set = 0;
		online = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

