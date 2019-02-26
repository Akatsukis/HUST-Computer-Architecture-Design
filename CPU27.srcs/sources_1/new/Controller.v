`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/22 11:30:04
// Design Name: 
// Module Name: Controller
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


module Controller(OP_CODE, FUNC, REGIMM, ALU_OP, MemToReg, MemWrite, ALU_SRC, RegWrite, SysCall, SignedExt, RegDst, Beq, Bne, JR, JMP, JAL, SLLV, SRLV, LBU, BLTZ);
    input[5:0] OP_CODE, FUNC;
    input[4:0] REGIMM;
    output[3:0] ALU_OP;
    output MemToReg, MemWrite, ALU_SRC, RegWrite, SysCall, SignedExt, RegDst, Beq, Bne, JR, JMP, JAL, SLLV, SRLV, LBU, BLTZ;
    ALU_Controller uALU_Controller(OP_CODE, FUNC, ALU_OP);
    Signal_Controller uSignal_Controller(OP_CODE, FUNC, MemToReg, MemWrite, ALU_SRC, RegWrite, SysCall, SignedExt, RegDst, Beq, Bne, JR, JMP, JAL);
    assign SLLV = (OP_CODE==0)&&(FUNC==4);
    assign SRLV = (OP_CODE==0)&&(FUNC==6);
    assign LBU = (OP_CODE==36);
    assign BLTZ = (OP_CODE==1)&&(REGIMM==0);
endmodule
