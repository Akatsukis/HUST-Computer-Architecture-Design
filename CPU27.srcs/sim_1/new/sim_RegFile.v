`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 17:16:42
// Design Name: 
// Module Name: sim_RegFile
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


module sim_RegFile();
    reg clk, WE;
    reg[4:0] rA, rB, rW;
    reg[31:0] Din;
    wire[31:0] R1, R2;
    initial begin
        clk = 0;
        WE = 1;
        rA = 0;
		rB = 0;
		rW = 0;
		Din = 0;
    end
	always#1 clk = ~clk;
	always#2 rA = rA+1;
	always#2 rB = rB+1;
	always#2 rW = rW+1;
	always#2 Din = Din+1;
	always#64 WE = ~WE;
	 
	RegFile sim_RegFile(clk, rA, rB, rW, Din, WE, R1, R2);
endmodule
