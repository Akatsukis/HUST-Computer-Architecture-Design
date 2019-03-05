`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 14:29:06
// Design Name: 
// Module Name: sim_MIPS
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


module sim_MIPS();
    reg clk, rst, go;
    wire[7:0] seg, an;
    initial begin
        clk = 0;
        rst = 1;
        go = 0;
    end
    always#1 clk <= ~clk;
    MIPS sim_MIPS(clk, rst, go, seg, an, 15'b0);
endmodule
