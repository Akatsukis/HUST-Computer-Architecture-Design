`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 08:40:49
// Design Name: 
// Module Name: Multiplexer_4
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


module Multiplexer_4#(parameter N = 32)(Din_0, Din_1, Din_2, Din_3, choice, Dout);
    //parameter N = 32;
    input[N-1:0] Din_0;
    input[N-1:0] Din_1;
    input[N-1:0] Din_2;
    input[N-1:0] Din_3;
    input[1:0] choice;
    output reg[N-1:0] Dout;
    initial begin
        Dout <= 0;
    end
    always@(*)begin
        case(choice)
            2'd0:Dout = Din_0;
            2'd1:Dout = Din_1;
            2'd2:Dout = Din_2;
            2'd3:Dout = Din_3;
        endcase
    end
endmodule
