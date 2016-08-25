`timescale 1ns / 1ps

module divide(
	input clk,
	output reg second
    );
	
	initial begin
		second = 0;
	end
	
	reg [31:0]clk_cnt = 0;
//	reg second_temp = 0;
	always @(posedge clk)begin
		
				
						if(clk_cnt==32'd3)begin 
							clk_cnt <= 1'b0;
							second <= ~second;
						end
						else
							clk_cnt <= clk_cnt + 1'b1;
					
				
			
	end
	
//	assign second = second_temp;

endmodule
