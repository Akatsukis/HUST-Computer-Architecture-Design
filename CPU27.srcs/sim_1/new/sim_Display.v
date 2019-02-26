`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/26 16:41:13
// Design Name: 
// Module Name: sim_Display
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


module sim_Display();
    reg clk, rst;
    reg[15:0] data;
    wire[7:0] seg, an;
    initial begin
        data <= 0;
        clk <= 0;
        rst <= 0;
    end
    always#1 clk <= ~clk;
    always#2 data <= data+1;
    Display sim_Display(clk, rst, {16'b0, data}, seg, an);
endmodule
