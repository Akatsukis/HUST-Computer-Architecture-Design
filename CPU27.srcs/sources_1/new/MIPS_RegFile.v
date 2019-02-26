`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 17:01:42
// Design Name: 
// Module Name: RegFile
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


module RegFile(clk, rst, rA, rB, rW, Din, WE, R1, R2);
    input[4:0] rA, rB, rW;
    input[31:0] Din;
    input clk, rst, WE;
    output[31:0] R1, R2;
    reg[31:0] data[31:0];
	integer i;
	
	initial begin
		for(i = 0; i < 32; i = i+1)
			data[i] <= 0;
	end
	
	assign R1 = data[rA];
	assign R2 = data[rB];
    always@(posedge clk)begin
        if(!rst)begin
            for(i = 0; i < 32; i = i+1)
                data[i] <= 0;
        end
        else begin
            if(WE)data[rW] <= Din;
        end
    end
endmodule
