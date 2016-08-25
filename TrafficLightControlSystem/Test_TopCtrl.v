`timescale 1ns / 1ps



module Test_TopCtrl;

	// Inputs
	reg clk;
	reg Cm;
	reg Cc;
	reg PQm;
	reg PQc;
	reg peak;
	reg set;
	reg rst;
	reg online;

	// Outputs
	wire online_led;
	wire set_led;
	wire [2:0] m_led;
	wire [2:0] c_led;
	wire [3:0] sm_wei;
	wire [7:0] sm_duan;

	// Instantiate the Unit Under Test (UUT)
	TopCtrl uut (
		.clk(clk), 
		.Cm(Cm), 
		.Cc(Cc), 
		.PQm(PQm), 
		.PQc(PQc), 
		.peak(peak), 
		.set(set), 
		.rst(rst), 
		.online(online), 
		.online_led(online_led), 
		.set_led(set_led), 
		.m_led(m_led), 
		.c_led(c_led), 
		.sm_wei(sm_wei), 
		.sm_duan(sm_duan)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		Cm = 0;
		Cc = 0;
		PQm = 0;
		PQc = 0;
		peak = 0;
		set = 0;
		rst = 0;
		online = 0;

		// Wait 100 ns for global reset to finish
		#5;
      set = 1'b1;
		// Add stimulus here
		#100;
		Cm = 1'b1;
		Cc = 1'b1;
		#100 peak = 1'b1;
		#100 peak = 1'b0;
		#100;
		Cm = 1'b0;
		Cc = 1'b0;
		#100 PQm = 1'b1;
		#100 PQm = 1'b0;
		#100;
		Cm = 1'b1;
		Cc = 1'b0;
		#100 PQm = 1'b1;
		#100 PQm = 1'b0;
		#100;
		Cm = 1'b0;
		Cc = 1'b1;
		#100 PQc = 1'b1;
		#100 PQc = 1'b0;
		
		
		
	end
   
	always #1 clk = ~clk;
	
endmodule

