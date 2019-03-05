`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/22 18:17:50
// Design Name: 
// Module Name: MIPS
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


module MIPS(clk, rst, go, seg, an, sw);
    input clk, rst, go;
    input[14:0] sw;
    output[7:0] seg, an;
    
    wire run, LoadUse, WB_stop, IF_en, equal;
    wire clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, clk_10000Hz, clk_run;
    Multiplexer_4 #(1)sel_frequncy(clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, sw[11:10], clk_run);
    Divider uDivider(clk, clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, clk_10000Hz);
    assign run = go|~WB_stop;
    assign IF_en = ~(run&~LoadUse);
    
    
    
    wire Uncond, Cond, ID_state;
    wire[31:0] IF_PC, IF_IR, ID_PC, ID_IR, EX_PC, EX_IR, MEM_PC, MEM_IR, WB_PC, WB_IR;
    wire ID_Beq, ID_Bne, ID_MemToReg, ID_MemWrite, ID_ALUSrcB, ID_RegWrite, ID_JAL, ID_JMP, ID_JR, ID_Shift, ID_LBU, ID_BLTZ, ID_Syscall;
    wire[3:0] ID_AluOP;
    wire[4:0] ID_Wst, ID_R1st, ID_R2st;
    wire[31:0] ID_R1, ID_R2, ID_immed;
    wire[4:0] ID_shamt;
    wire[31:0] ID_Jaddr;
    wire EX_en, EX_Beq, EX_Bne, EX_MemToReg, EX_MemWrite, EX_ALUSrcB, EX_RegWrite, EX_JAL, EX_Jmp, EX_JR, EX_Shift, EX_LBU, EX_BLTZ, EX_Syscall;
    wire[4:0] EX_Wst, EX_R1st, EX_R2st;
    wire[3:0] EX_AluOP;
    wire[31:0] EX_R1, EX_R2, EX_R2more, EX_immed, EX_Jaddr;
    wire[4:0] EX_shamt;
    wire EX_display, EX_stop;
    wire[31:0] EX_Result;
    wire MEM_en, MEM_MemToReg, MEM_MemWrite, MEM_RegWrite, MEM_JAL, MEM_LBU, MEM_display, MEM_stop;
    wire[4:0] MEM_Wst;
    wire[31:0] MEM_Din, MEM_R2, MEM_Result;
    wire WB_en, WB_RegWrite, WB_JAL, WB_display;
    wire[4:0] WB_Wst;
    wire[31:0] WB_Din, WB_R2;
    
    
    IF_ID uIF_ID(clk_run, Uncond|Cond, 1'b1, IF_en, ID_state, IF_PC, IF_IR, ID_PC, ID_IR);
    ID_EX uID_EX(clk_run, Uncond|Cond|LoadUse, ~run, IF_en, ID_PC, ID_IR, ID_Beq, ID_Bne, ID_MemToReg, 
    ID_MemWrite, ID_ALUSrcB, ID_RegWrite, ID_JAL, ID_Wst, ID_JMP, ID_JR, ID_Shift, ID_LBU, ID_BLTZ, ID_Syscall,
    ID_AluOP, ID_R1st, ID_R2st, ID_R1, ID_R2, ID_immed, ID_shamt, ID_Jaddr, EX_en, EX_PC, EX_IR, 
    EX_Beq, EX_Bne, EX_MemToReg, EX_MemWrite, EX_ALUSrcB, EX_RegWrite, EX_JAL, EX_Wst, EX_Jmp, EX_JR, EX_Shift, EX_LBU, EX_BLTZ, EX_Syscall,
    EX_AluOP, EX_R1st, EX_R2st, EX_R1, EX_R2, EX_immed, EX_shamt, EX_Jaddr);
    EX_MEM uEX_MEM(clk_run, 1'b0, ~run, EX_en, EX_PC, EX_IR, EX_MemToReg, EX_MemWrite, EX_RegWrite, EX_JAL, EX_Wst, EX_LBU, EX_display, EX_stop, EX_Result, EX_R2more,
    MEM_en, MEM_PC, MEM_IR, MEM_MemToReg, MEM_MemWrite, MEM_RegWrite, MEM_JAL, MEM_Wst, MEM_LBU, MEM_display, MEM_stop, MEM_Result, MEM_R2);
    MEM_WB uMEM_WB(clk_run, 1'b0, ~run, MEM_en, MEM_PC, MEM_IR, MEM_RegWrite, MEM_JAL, MEM_Wst, MEM_display, MEM_stop, MEM_Din, MEM_R2,
    WB_en, WB_PC, WB_IR, WB_RegWrite, WB_JAL, WB_Wst, WB_display, WB_stop, WB_Din, WB_R2);
    
    
    
/**********************************************
IF
**********************************************/
    wire[31:0] EX_Uncond_addr, EX_Cond_addr;
    wire[31:0] PC_in;
    Register PC(clk_run, rst, run&~LoadUse, PC_in, IF_PC);
    Multiplexer_4 #(32)sel_PC(IF_PC+4, EX_Uncond_addr, EX_Cond_addr, 32'b0, {Cond, Uncond}, PC_in); 
    assign Uncond = EX_Jmp;
    assign Cond = (EX_BLTZ&EX_Result[0])|(EX_Bne&~equal)|(EX_Beq&equal);
    ROM uROM(1'b1, IF_PC[11:2], IF_IR);
    
/**********************************************
ID
**********************************************/
    wire[5:0] ID_OP, ID_func;
    wire[4:0] ID_W1;
    wire ID_SignedExt, ID_RegDst;
    wire ID_SLLV, ID_SRLV;
    wire[31:0] ID_PCplus, WB_Dinmore;
    assign ID_Shift = ID_SLLV|ID_SRLV;
    assign ID_shamt = ID_IR[10:6];
    assign ID_PCplus = ID_PC+4;
    assign ID_Jaddr = {ID_PCplus[31:28], ID_IR[25:0], 2'b0};
    Controller uController(ID_IR[31:26], ID_IR[5:0], ID_IR[20:16], ID_AluOP, ID_MemToReg, ID_MemWrite, ID_ALUSrcB, ID_RegWrite, ID_Syscall, ID_SignedExt, ID_RegDst, ID_Beq, ID_Bne, ID_JR, ID_JMP, ID_JAL, ID_SLLV, ID_SRLV, ID_LBU, ID_BLTZ);
    Multiplexer_2 #(5)sel_rs(ID_IR[25:21], 5'd2, ID_Syscall, ID_R1st);
    Multiplexer_2 #(5)sel_rt(ID_IR[20:16], 5'd4, ID_Syscall, ID_R2st);
    Multiplexer_2 #(5)sel_rd(ID_IR[20:16], ID_IR[15:11], ID_RegDst, ID_W1);
    Multiplexer_2 #(5)sel_rw(ID_W1, 5'h1f, ID_JAL, ID_Wst);
    Extender uExtender(ID_SignedExt, ID_IR[15:0], ID_immed);
    RegFile uRegFil(clk_run, rst, ID_R1st, ID_R2st, WB_Wst, WB_Dinmore, WB_RegWrite, ID_R1, ID_R2); 


/**********************************************
EX
**********************************************/
    wire[31:0] EX_ALU_A, EX_ALU_B;
    wire[4:0] EX_ALU_shamt;
    wire[31:0] EX_Result2;
    
    
    ALU uALU(EX_ALU_A, EX_ALU_B, EX_AluOP, EX_ALU_shamt, EX_Result, EX_Result2, equal);
    Multiplexer_2 #(32)sel_R2(EX_R2more, EX_immed, EX_ALUSrcB, EX_ALU_B);
    Multiplexer_2 #(5)sel_shamt(EX_shamt, EX_ALU_A[4:0], EX_Shift, EX_ALU_shamt);
    Multiplexer_2 #(32)sel_Uncond_addr(EX_Jaddr, EX_ALU_A, EX_JR, EX_Uncond_addr);
    assign EX_Cond_addr = (EX_immed<<2)+EX_PC+4;



/**********************************************
MEM
**********************************************/

    wire[9:0] RAM_in;
    wire[31:0] RAM_out, DataToReg, MEM_Resultmore;
    wire[7:0] LBU_data;
    RAM uRAM(clk_run, rst, RAM_in, MEM_MemWrite, MEM_R2, RAM_out); 
    Multiplexer_4 #(8)sel_addr(DataToReg[7:0], DataToReg[15:8], DataToReg[23:16], DataToReg[31:24], MEM_Result[1:0], LBU_data);
    Multiplexer_2 #(32)sel_ToReg(MEM_Result, RAM_out, MEM_MemToReg, DataToReg);
    Multiplexer_2 #(32)sel_LBU(DataToReg, {24'b0, LBU_data}, MEM_LBU, MEM_Din);
    Multiplexer_2 #(32)sel_Memres(MEM_Result, MEM_PC+4, MEM_JAL, MEM_Resultmore);
    
    
/**********************************************
WB
**********************************************/

    Multiplexer_2 #(32)sel_WB_Din(WB_Din, WB_PC+4, WB_JAL, WB_Dinmore);
    
/**********************************************
Other
**********************************************/
    wire[31:0] Count_data, cnt_clock, cnt_Cond, cnt_Uncond, LedData, Display_data;
    wire R1_Used_EX, R2_Used_EX, R1_Used_ID, R2_Used_ID;
    Counter #(32)Count_Run(clk_run, rst, 1'b0, run, 32'b0, cnt_clock);
    Counter #(32)Count_Cond(clk_run, rst, 1'b0, Cond, 32'b0, cnt_Cond);
    Counter #(32)Count_Uncond(clk_run, rst, 1'b0, Uncond, 32'b0, cnt_Uncond);
    Register LED(clk_run, rst, WB_display, WB_R2, LedData); 
    Multiplexer_4 #(32)sel_Count(LedData, cnt_clock, cnt_Uncond, cnt_Cond, sw[13:12], Count_data);
    Multiplexer_2 #(32)sel_Display(Count_data, RAM_out, sw[14], Display_data);
    Display uDisplay(clk_10000Hz, rst, Display_data, seg, an);
    Condition EX(EX_IR[31:26], EX_IR[5:0], R1_Used_EX, R2_Used_EX);
    Condition ID(ID_IR[31:26], ID_IR[5:0], R1_Used_ID, R2_Used_ID);
    
    wire bypass_WB1, bypass_WB2, bypass_MEM1, bypass_MEM2;
    wire[31:0] bypass_WBdata1, bypass_WBdata2;
    
    assign bypass_WB1 = R1_Used_EX&(EX_R1st!=0)&(EX_R1st==WB_Wst)&WB_RegWrite;
    assign bypass_WB2 = R2_Used_EX&(EX_R2st!=0)&(EX_R2st==WB_Wst)&WB_RegWrite;
    assign bypass_MEM1 = R1_Used_EX&(EX_R1st!=0)&(EX_R1st==MEM_Wst)&MEM_RegWrite;
    assign bypass_MEM2 = R2_Used_EX&(EX_R2st!=0)&(EX_R2st==MEM_Wst)&MEM_RegWrite;
    Multiplexer_2 #(32)sel_WB1(EX_R1, WB_Dinmore, bypass_WB1, bypass_WBdata1);
    Multiplexer_2 #(32)sel_WB2(EX_R2, WB_Dinmore, bypass_WB2, bypass_WBdata2);
    Multiplexer_2 #(32)sel_ALU_A(bypass_WBdata1, MEM_Resultmore, bypass_MEM1, EX_ALU_A);
    Multiplexer_2 #(32)sel_R2more(bypass_WBdata2, MEM_Resultmore, bypass_MEM2, EX_R2more);
    
    
    assign RAM_in = run?MEM_Result[11:2]:sw[9:0];
    assign EX_display = (EX_ALU_A==34)&EX_Syscall;
    assign EX_stop = (EX_ALU_A!=34)&EX_Syscall;
    assign LoadUse = (((ID_R1st==EX_Wst)&(ID_R1st!=0)&R1_Used_ID)|((ID_R2st==EX_Wst)&(ID_R2st!=0)&R2_Used_ID))&EX_MemToReg;
    
    
    
    

    
    
    
     
endmodule
