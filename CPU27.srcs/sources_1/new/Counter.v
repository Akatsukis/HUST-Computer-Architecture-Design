`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 09:17:28
// Design Name: 
// Module Name: Counter
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


module Counter#(parameter N = 32)(clk, rst, ld, cnt, Din, Dout);
    input clk, rst, ld, cnt;
    input[N-1:0] Din;
	output reg[N-1:0] Dout;
    initial begin
        Dout <= 0;
    end
    always@(posedge clk) begin
        if(!rst) begin
            Dout <= 0;
        end
        else begin
            if(ld == 1)begin
				if(cnt == 1)Dout <= Dout-1;
				else Dout <= Din;
            end
            else begin
                if(cnt == 1)Dout <= Dout+1;
            end
        end
    end
endmodule
