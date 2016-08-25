`timescale 1ns / 1ps


module Test_divide;

	// Inputs
	reg clk;

	// Outputs
	wire second;

	// Instantiate the Unit Under Test (UUT)
	divide uut (
		.clk(clk), 
		.second(second)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
   always #1 clk = ~clk;
endmodule

