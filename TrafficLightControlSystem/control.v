`timescale 1ns / 1ps

module control(
	input clk,
	input Cm,
	input Cc,
	input PQm,
	input PQc,
	input peak,
	input set,
	input rst,
	input online,
	output [4:0]countdown_time,
	output [5:0]led_light
    );
	
	parameter [1:0]Green = 2'b00;
	parameter [1:0]Yellow = 2'b01;
	parameter [1:0]Red = 2'b10;
	
	
	
	reg [1:0]status_temp = 2'b00;
	reg [4:0]countdown_time_temp = 5'd16;
	reg [5:0]led_light_temp = 6'b001100;
	
	initial begin
		status_temp = 2'b00;
		countdown_time_temp = 5'd16;
		led_light_temp = 6'b001100;
	end
	
	
	wire second;
	
	divide Divide(clk,second);//降频为单位时间
	
	always @(posedge second)begin
		if(set == 1'b0)begin
			countdown_time_temp = countdown_time_temp;
		end
		else if(set == 1'b1)begin
			
			if(countdown_time_temp > 0)begin
				countdown_time_temp = countdown_time_temp - 1;
			end
			else begin
				
					case(status_temp)
						Green:
							begin
								if(online == 1'b1)begin
									status_temp = Green;
									countdown_time_temp = 5'd16;
									led_light_temp = 6'b001100;
								end
								else if(online == 1'b0)begin
									if(rst == 1'b1)begin//reset
											status_temp = Yellow;
											countdown_time_temp = 5'd3;
											led_light_temp = 6'b010010;
									end
									else if(rst == 1'b0)begin
										if((Cm == 1'b1)&&(Cc == 1'b1))begin//Mode1
												status_temp = Yellow;
												countdown_time_temp = 5'd5;
												led_light_temp = 6'b010010;
										end
										else if((Cm == 1'b0)&&(Cc == 1'b0))begin//Mode2
											if(PQm == 1'b0)begin
												status_temp = Green;
												countdown_time_temp = 5'd16;
												led_light_temp = 6'b001100;
											end
											else if(PQm == 1'b1)begin
												status_temp = Yellow;
												countdown_time_temp = 5'd5;
												led_light_temp = 6'b010010;
											end
										end
										else if((Cm == 1'b1)&&(Cc == 1'b0))begin//Mode3
											if(PQm == 1'b0)begin
												status_temp = Green;
												countdown_time_temp = 5'd15;
												led_light_temp = 6'b001100;
											end
											else if(PQm == 1'b1)begin
												status_temp = Yellow;
												countdown_time_temp = 5'd5;
												led_light_temp = 6'b010010;
											end
										end
										else if((Cm == 1'b0)&&(Cc == 1'b1))begin//Mode4
												status_temp = Yellow;
												countdown_time_temp = 5'd5;
												led_light_temp = 6'b010010;
										end
									end
								end
							end
						Yellow:
							begin
								if(online == 1'b1)begin
									status_temp = Red;
									countdown_time_temp = 5'd16;
									led_light_temp = 6'b100001;
								end
								else if(online == 1'b0)begin
									if(rst == 1'b1)begin
											status_temp = Red;
											countdown_time_temp = 5'd16;
											led_light_temp = 6'b100001;
									end
									else if(rst == 1'b0)begin
										if((Cm == 1'b1)&&(Cc == 1'b1))begin//Mode1
											if(peak == 1'b0)begin
												status_temp = Red;
												countdown_time_temp = 5'd16;
												led_light_temp = 6'b100001;
											end
											else if(peak == 1'b1)begin
												status_temp = Red;
												countdown_time_temp = 5'd8;
												led_light_temp = 6'b100001;
											end
										end
										else if((Cm == 1'b0)&&(Cc == 1'b0))begin//Mode2
												status_temp = Red;
												countdown_time_temp = 5'd16;
												led_light_temp = 6'b100001;
										end
										else if((Cm == 1'b1)&&(Cc == 1'b0))begin//Mode3
												status_temp = Red;
												countdown_time_temp = 5'd15;
												led_light_temp = 6'b100001;
										end
										else if((Cm == 1'b0)&&(Cc == 1'b1))begin//Mode4
												status_temp = Red;
												countdown_time_temp = 5'd15;
												led_light_temp = 6'b100001;
										end
									end
								end
							end
						Red:
							begin
								if(online == 1'b1)begin
									status_temp = Green;
									countdown_time_temp = 5'd16;
									led_light_temp = 6'b001100;
								end
								else if(online == 1'b0)begin
									if(rst == 1'b1)begin
											status_temp = Green;
											countdown_time_temp = 5'd16;
											led_light_temp = 6'b001100;
									end
									else if(rst == 1'b0)begin
										if((Cm == 1'b1)&&(Cc == 1'b1))begin//Mode1
												status_temp = Green;
												countdown_time_temp = 5'd16;
												led_light_temp = 6'b001100;
										end
										else if((Cm == 1'b0)&&(Cc == 1'b0))begin//Mode2
											if(PQm == 1'b0)begin
												status_temp = Green;
												countdown_time_temp = 5'd16;
												led_light_temp = 6'b001100;
											end
											else if(PQm == 1'b1)begin
												status_temp = Red;
												countdown_time_temp = 5'd16;
												led_light_temp = 6'b100001;
											end
										end
										else if((Cm == 1'b1)&&(Cc == 1'b0))begin//Mode3
											if(PQm == 1'b0)begin
												status_temp = Green;
												countdown_time_temp = 5'd15;
												led_light_temp = 6'b001100;
											end
											else if(PQm == 1'b1)begin
												status_temp = Red;
												countdown_time_temp = 5'd15;
												led_light_temp = 6'b100001;
											end
										end
										else if((Cm == 1'b0)&&(Cc == 1'b1))begin//Mode4
											if(PQc == 1'b0)begin
												status_temp = Red;
												countdown_time_temp = 5'd15;
												led_light_temp = 6'b100001;
											end
											else if(PQc == 1'b1)begin
												status_temp = Green;
												countdown_time_temp = 5'd15;
												led_light_temp = 6'b001100;
											end
										end
									end
								end
							end
					endcase
				
			end
		end
	end
	
	
	
	 
	assign countdown_time = countdown_time_temp;
	assign led_light = led_light_temp;
	

endmodule
