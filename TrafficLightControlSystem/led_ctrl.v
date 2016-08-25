`timescale 1ns / 1ps

module led_ctrl(
	input clk,
	input set,
	input online,
	output online_led,
	output set_led
    );
	
	reg online_led_temp = 0;
	reg set_led_temp = 0;
	
	always @(posedge clk)begin
		if(online == 1'b1)begin//¿ØÖÆonlineµÆ
			online_led_temp = 1'b1;
		end
		else if(online == 1'b0)begin
			online_led_temp = 1'b0;
		end
		if(set == 1'b1)begin//¿ØÖÆsetµÆ
			set_led_temp = 1'b1;
		end
		else if(set == 1'b0)begin
			set_led_temp = 1'b0;
		end
	end
	
	assign online_led = online_led_temp;
	assign set_led = set_led_temp;
	
endmodule
