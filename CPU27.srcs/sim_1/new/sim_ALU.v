`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 11:41:41
// Design Name: 
// Module Name: sim_ALU
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


module sim_ALU();
    reg[31:0] X, Y;
    reg[3:0] S;
    reg[4:0] shamt;
    wire[31:0] Result, Result2;
    wire equal;
	
	initial begin
		X = 0;
		Y = 0;
		S = 0;
		shamt = 0;
	end
	always #5 X = X+1;
	always #5 Y = Y+2;
	always #5 shamt = shamt+1;
	always #5 S = S+1;
	ALU sim_ALU(X, Y, S, shamt, Result, Result2, equal);
endmodule
