`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/28 16:22:50
// Design Name: 
// Module Name: EX_MEM
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


module MEM_WB(clk, clr, en, state_in, MEM_PC, MEM_IR, MEM_RegWrite, MEM_JAL, MEM_Wst, MEM_display, MEM_stop, MEM_Din, MEM_R2,
    state_out, WB_PC, WB_IR, WB_RegWrite, WB_JAL, WB_Wst, WB_display, WB_stop, WB_Din, WB_R2);
    
    input clk, clr, en;
    
    input state_in;
    input[31:0] MEM_PC, MEM_IR;
    input MEM_RegWrite, MEM_JAL, MEM_display, MEM_stop;
    input[4:0] MEM_Wst;
    input[31:0] MEM_Din, MEM_R2;
    
    output state_out;
    output[31:0] WB_PC, WB_IR;
    output WB_RegWrite, WB_JAL, WB_display, WB_stop;
    output[4:0] WB_Wst;
    output[31:0] WB_Din, WB_R2;
    
    
    Register #(1)state(clk, 1'b1, ~en, clr?1'b0:state_in, state_out);
    Register #(32)PC(clk, 1'b1, ~en, clr?32'b0:MEM_PC, WB_PC);
    Register #(32)IR(clk, 1'b1, ~en, clr?32'b0:MEM_IR, WB_IR);
    Register #(1)RegWrite(clk, 1'b1, ~en, clr?1'b0:MEM_RegWrite, WB_RegWrite);
    Register #(1)JAL(clk, 1'b1, ~en, clr?1'b0:MEM_JAL, WB_JAL);
    Register #(5)Wst(clk, 1'b1, ~en, clr?5'b0:MEM_Wst, WB_Wst);
    Register #(1)display(clk, 1'b1, ~en, clr?1'b0:MEM_display, WB_display);
    Register #(1)stop(clk, 1'b1, ~en, clr?1'b0:MEM_stop, WB_stop);
    Register #(32)R1(clk, 1'b1, ~en, clr?32'b0:MEM_Din, WB_Din);
    Register #(32)R2(clk, 1'b1, ~en, clr?32'b0:MEM_R2, WB_R2);
    
endmodule
