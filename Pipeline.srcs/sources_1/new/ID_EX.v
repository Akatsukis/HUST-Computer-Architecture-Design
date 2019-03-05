`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/28 16:22:50
// Design Name: 
// Module Name: ID_EX
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


module ID_EX(clk, clr, en, state_in, ID_PC, ID_IR, ID_Beq, ID_Bne, ID_MemToReg, 
    ID_MemWrite, ID_ALUSrcB, ID_RegWrite, ID_JAL, ID_Wst, ID_Jmp, ID_JR, ID_Shift, ID_LBU, ID_BLTZ, ID_Syscall,
    ID_AluOP, ID_R1st, ID_R2st, ID_R1, ID_R2, ID_immed, ID_shamt, ID_Jaddr, state_out, EX_PC, EX_IR, 
    EX_Beq, EX_Bne, EX_MemToReg, EX_MemWrite, EX_ALUSrcB, EX_RegWrite, EX_JAL, EX_Wst, EX_Jmp, EX_JR, EX_Shift, EX_LBU, EX_BLTZ, EX_Syscall,
    EX_AluOP, EX_R1st, EX_R2st, EX_R1, EX_R2, EX_immed, EX_shamt, EX_Jaddr);
    input clk, clr, en;
    
    input state_in;
    input[31:0] ID_PC, ID_IR;
    input ID_Beq, ID_Bne, ID_MemToReg, ID_MemWrite, ID_ALUSrcB, ID_RegWrite, ID_JAL, ID_Jmp, ID_JR, ID_Shift, ID_LBU, ID_BLTZ, ID_Syscall;
    
    input[3:0] ID_AluOP;
    input[4:0] ID_Wst, ID_R1st, ID_R2st;
    input[31:0] ID_R1, ID_R2, ID_immed;
    input[4:0] ID_shamt;
    input[31:0] ID_Jaddr;
    
    output state_out;
    output[31:0] EX_PC, EX_IR;
    output EX_Beq, EX_Bne, EX_MemToReg, EX_MemWrite, EX_ALUSrcB, EX_RegWrite, EX_JAL, EX_Jmp, EX_JR, EX_Shift, EX_LBU, EX_BLTZ, EX_Syscall;
    output[3:0] EX_AluOP;
    output[4:0] EX_R1st, EX_R2st, EX_Wst;
    output[31:0] EX_R1, EX_R2, EX_immed;
    output[4:0] EX_shamt;
    output[31:0] EX_Jaddr;
    
    Register #(1)state(clk, 1'b1, ~en, clr?1'b0:state_in, state_out);
    Register #(32)PC(clk, 1'b1, ~en, clr?32'b0:ID_PC, EX_PC);
    Register #(32)IR(clk, 1'b1, ~en, clr?32'b0:ID_IR, EX_IR);
    Register #(1)Beq(clk, 1'b1, ~en, clr?1'b0:ID_Beq, EX_Beq);
    Register #(1)Bne(clk, 1'b1, ~en, clr?1'b0:ID_Bne, EX_Bne);
    Register #(1)MemToReg(clk, 1'b1, ~en, clr?1'b0:ID_MemToReg, EX_MemToReg);
    Register #(1)MemWrite(clk, 1'b1, ~en, clr?1'b0:ID_MemWrite, EX_MemWrite);
    Register #(1)ALUSrcB(clk, 1'b1, ~en, clr?1'b0:ID_ALUSrcB, EX_ALUSrcB);
    Register #(1)RegWrite(clk, 1'b1, ~en, clr?1'b0:ID_RegWrite, EX_RegWrite);
    Register #(1)JAL(clk, 1'b1, ~en, clr?1'b0:ID_JAL, EX_JAL);
    Register #(5)Wst(clk, 1'b1, ~en, clr?5'b0:ID_Wst, EX_Wst);
    Register #(1)Jmp(clk, 1'b1, ~en, clr?1'b0:ID_Jmp, EX_Jmp);
    Register #(1)JR(clk, 1'b1, ~en, clr?1'b0:ID_JR, EX_JR);
    Register #(1)Shift(clk, 1'b1, ~en, clr?1'b0:ID_Shift, EX_Shift);
    Register #(1)LBU(clk, 1'b1, ~en, clr?1'b0:ID_LBU, EX_LBU);
    Register #(1)BLTZ(clk, 1'b1, ~en, clr?1'b0:ID_BLTZ, EX_BLTZ);
    Register #(1)Syscall(clk, 1'b1, ~en, clr?1'b0:ID_Syscall, EX_Syscall);
    Register #(4)AluOP(clk, 1'b1, ~en, clr?4'b0:ID_AluOP, EX_AluOP);
    Register #(5)R1st(clk, 1'b1, ~en, clr?5'b0:ID_R1st, EX_R1st);
    Register #(5)R2st(clk, 1'b1, ~en, clr?5'b0:ID_R2st, EX_R2st);
    Register #(32)R1(clk, 1'b1, ~en, clr?32'b0:ID_R1, EX_R1);
    Register #(32)R2(clk, 1'b1, ~en, clr?32'b0:ID_R2, EX_R2);
    Register #(32)immed(clk, 1'b1, ~en, clr?32'b0:ID_immed, EX_immed);
    Register #(5)shamt(clk, 1'b1, ~en, clr?5'b0:ID_shamt, EX_shamt);
    Register #(32)Jaddr(clk, 1'b1, ~en, clr?32'b0:ID_Jaddr, EX_Jaddr);
    
endmodule
