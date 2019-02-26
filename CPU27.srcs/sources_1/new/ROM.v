`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 17:32:29
// Design Name: 
// Module Name: ROM
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


module ROM(sel, addr, data);
	input[9:0] addr;
	input sel;
	output reg[31:0] data;
	reg[31:0] mem[1023:0];
	initial begin
		$readmemh("C:/Users/dongxiaojun/CPU27/CPU27.srcs/sources_1/new/instr.hex", mem);
		data = 0;
	end
	always@(addr or sel)begin
	   if(sel == 1'b1)data = mem[addr];
       else data = 0;
	end
endmodule
