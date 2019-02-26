`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 08:45:43
// Design Name: 
// Module Name: Divider
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Divider(clk, clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, clk_10000Hz);
	input clk;
	output reg clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, clk_10000Hz;
	reg [31:0] counter;
    parameter N1 = 5_000_000, N2 = 2_500_000, N3 = 1_000_000, N4 = 500_000, N5 = 5_000;
    //parameter N1 = 2, N2 = 2;
	initial begin 
		clk_10Hz = 0;
        clk_20Hz = 0;
        clk_50Hz = 0;
        clk_100Hz = 0;
		clk_10000Hz = 0;
		counter = 0;
	end
	always@(posedge clk)begin
        counter = counter+1;
        if(counter%N5 == 0)begin
            clk_10000Hz = ~clk_10000Hz;
        end
        if(counter%N4 == 0)begin
            clk_100Hz = ~clk_100Hz;
        end
        if(counter%N3 == 0)begin
            clk_50Hz = ~clk_50Hz;
        end
        if(counter%N2 == 0)begin
            clk_20Hz = ~clk_20Hz;
        end
        if(counter%N1 == 0)begin
            clk_10Hz = ~clk_10Hz;
            counter = 0;
        end
	end
	
endmodule
