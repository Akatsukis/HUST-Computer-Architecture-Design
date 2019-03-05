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


module EX_MEM(clk, clr, en, state_in, EX_PC, EX_IR, EX_MemToReg, EX_MemWrite, EX_RegWrite, EX_JAL, EX_Wst, EX_LBU, EX_display, EX_stop, EX_Result, EX_R2,
    state_out, MEM_PC, MEM_IR, MEM_MemToReg, MEM_MemWrite, MEM_RegWrite, MEM_JAL, MEM_Wst, MEM_LBU, MEM_display, MEM_stop, MEM_Result, MEM_R2);
    
    input clk, clr, en;
    
    input state_in;
    input[31:0] EX_PC, EX_IR;
    input EX_MemToReg, EX_MemWrite, EX_RegWrite, EX_JAL, EX_LBU, EX_display, EX_stop;
    input[4:0] EX_Wst;
    input[31:0] EX_Result, EX_R2;
    
    output state_out;
    output[31:0] MEM_PC, MEM_IR;
    output MEM_MemToReg, MEM_MemWrite, MEM_RegWrite, MEM_JAL, MEM_LBU, MEM_display, MEM_stop;
    output[4:0] MEM_Wst;
    output[31:0] MEM_Result, MEM_R2;
    
    Register #(1)state(clk, 1'b1, ~en, clr?1'b0:state_in, state_out);
    Register #(32)PC(clk, 1'b1, ~en, clr?32'b0:EX_PC, MEM_PC);
    Register #(32)IR(clk, 1'b1, ~en, clr?32'b0:EX_IR, MEM_IR);
    Register #(1)MemToReg(clk, 1'b1, ~en, clr?1'b0:EX_MemToReg, MEM_MemToReg);
    Register #(1)MemWrite(clk, 1'b1, ~en, clr?1'b0:EX_MemWrite, MEM_MemWrite);
    Register #(1)RegWrite(clk, 1'b1, ~en, clr?1'b0:EX_RegWrite, MEM_RegWrite);
    Register #(1)JAL(clk, 1'b1, ~en, clr?1'b0:EX_JAL, MEM_JAL);
    Register #(5)Wst(clk, 1'b1, ~en, clr?5'b0:EX_Wst, MEM_Wst);
    Register #(1)LBU(clk, 1'b1, ~en, clr?1'b0:EX_LBU, MEM_LBU);
    Register #(1)display(clk, 1'b1, ~en, clr?1'b0:EX_display, MEM_display);
    Register #(1)stop(clk, 1'b1, ~en, clr?1'b0:EX_stop, MEM_stop);
    Register #(32)R1(clk, 1'b1, ~en, clr?32'b0:EX_Result, MEM_Result);
    Register #(32)R2(clk, 1'b1, ~en, clr?32'b0:EX_R2, MEM_R2);
    
endmodule
