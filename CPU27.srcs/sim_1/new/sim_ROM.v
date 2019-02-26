`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 17:41:13
// Design Name: 
// Module Name: sim_ROM
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


module sim_ROM();
	reg sel;
	reg[9:0] addr;
	wire[31:0] data;
	initial begin
		sel = 1;
		addr = 0;
	end
	always#1 addr = addr+1;
	ROM sim_ROM(sel, addr, data);
endmodule
