`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/22 08:52:27
// Design Name: 
// Module Name: Signal_Controller
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


module Signal_Controller(OP, F, MemtoReg, MemWrite, ALU_SRC, RegWrite, SYSCALL, SignedExt, RegDst, BEQ, BNE, JR, JMP, JAL);
    input[5:0] OP, F;
    output MemtoReg, MemWrite, ALU_SRC, RegWrite, SYSCALL, SignedExt, RegDst, BEQ, BNE, JR, JMP, JAL;
    assign MemtoReg=(OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0])|
        (&OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0]);
    assign MemWrite=(OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&OP[0]);
    assign ALU_SRC=(~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&OP[3]&OP[2]&~OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&OP[3]&OP[2]&~OP[1]&OP[0])|
        (OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0])|
        (OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&OP[0])|
        (OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0]);
    assign RegWrite=(~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&~F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&~F[2]&~F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&~F[2]&F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&F[2]&~F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&F[2]&F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&F[3]&~F[2]&F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&F[3]&~F[2]&F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&OP[3]&OP[2]&~OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&OP[3]&OP[2]&~OP[1]&OP[0])|
        (OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&F[1]&~F[0])|
        (OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0]);
    assign SYSCALL=(~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&F[3]&F[2]&~F[1]&~F[0]);
    assign SignedExt=(~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&OP[0])|
        (~OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&~OP[0])|
        (OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0])|
        (OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&OP[0])|
        (OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&OP[0]);
    assign RegDst=(~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&~F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&~F[2]&~F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&~F[2]&F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&F[2]&~F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&~F[3]&F[2]&F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&F[3]&~F[2]&F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&F[5]&~F[4]&F[3]&~F[2]&F[1]&F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&F[1]&~F[0]);
    assign BEQ=(~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0]);
    assign BNE=(~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&OP[0]);
    assign JR=(~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&F[3]&~F[2]&~F[1]&~F[0]);
    assign JMP=(~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&F[3]&~F[2]&~F[1]&~F[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&~OP[0])|
        (~OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0]);
    assign JAL=(~OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0]);

endmodule
