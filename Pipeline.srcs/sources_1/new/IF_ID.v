`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/28 16:13:19
// Design Name: 
// Module Name: IF_ID
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


module IF_ID(clk, clr, state_in, en, state_out, IF_PC, IF_IR, ID_PC, ID_IR);
    input clk, clr, state_in, en;
    output state_out;
    input[31:0] IF_PC, IF_IR;
    output[31:0] ID_PC, ID_IR;
    Register #(1)state(clk, 1'b1, ~en, clr?1'b0:state_in, state_out);
    Register #(32)PC(clk, 1'b1, ~en, clr?32'b0:IF_PC, ID_PC);
    Register #(32)IR(clk, 1'b1, ~en, clr?32'b0:IF_IR, ID_IR);
endmodule
