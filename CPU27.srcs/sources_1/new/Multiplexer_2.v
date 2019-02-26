`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 08:34:51
// Design Name: 
// Module Name: Multiplexer_2
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


module Multiplexer_2#(parameter N = 32)(Din_0, Din_1, choice, Dout);
    input[N-1:0] Din_0;
    input[N-1:0] Din_1;
    input choice;
    output reg[N-1:0] Dout;
    initial begin
        Dout <= 0;
    end
    always@(*)begin
        case(choice)
            1'b0:Dout = Din_0;
            1'b1:Dout = Din_1;
        endcase
    end
endmodule
