`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/24 10:26:58
// Design Name: 
// Module Name: Extender
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


module Extender(SignedExt, Din, Dout);
    input SignedExt;
    input[15:0] Din;
    output reg[31:0] Dout;
    initial begin
        Dout <= 0;
    end
    always@(*)begin
        if(SignedExt == 1'b1)Dout = {{16{Din[15]}}, Din};
        else Dout = {16'b0, Din};
    end
endmodule
