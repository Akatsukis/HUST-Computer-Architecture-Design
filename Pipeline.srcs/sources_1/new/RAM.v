`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 18:04:19
// Design Name: 
// Module Name: RAM
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


module RAM(clk, rst, addr, str, Din, Dout);
	input[9:0] addr;
	input str, clk, rst;
	input[31:0] Din;
	output[31:0] Dout;
	reg[31:0] mem[1023:0];
	integer i;
	
	initial begin
        for(i = 0; i < 1024; i = i+1)
            mem[i] <= 0;
	end

    assign Dout = mem[addr];
	always@(posedge clk)begin
		if(!rst)begin
			for(i = 0; i < 1024; i = i+1)
				mem[i] <= 0;
		end
        else begin
            if(str)mem[addr] <= Din;   
        end
	end
endmodule
