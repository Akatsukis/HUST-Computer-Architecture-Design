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
    
    wire clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, clk_10000Hz, clk_run;
    wire[31:0] LedData;
    wire[31:0] cnt_Cond, cnt_Uncond, cnt_clock;
    wire run;
    wire[31:0] PC_in, PC_out, PC_plus4;
    wire[9:0] ROM_in, RAM_in;
    wire[31:0] ROM_out, RAM_out;
    wire[31:0] Jaddr;
    wire[5:0] OP, Func;
    wire[4:0] rs, rt, rd, shamt, ALU_shamt;
    wire[15:0] immed;
    wire[31:0] immed_ext;
    wire[3:0] ALU_OP;
    wire MemToReg, MemWrite, ALU_SRC, RegWrite, SysCall, SignedExt, RegDst, Beq, Bne, JR, JMP, JAL, SLLV, SRLV, LBU, BLTZ;
    wire Shift;
    wire[4:0] RegFile_R1, RegFile_R2, RegFile_W1, RegFile_W2;
    wire[31:0] Din, RegFile_Din, R1, R2, Result, Result2, ALU_B;
    wire equal;
    wire[31:0] DataToReg;
    wire[7:0] LBU_data;
    wire Cond, Uncond, Display;
    wire[31:0] JMP_addr;
    wire[31:0] Uncond_addr;
    wire[31:0] Count_data, Display_data;
    
    assign PC_plus4 = PC_out+4;
    assign OP = ROM_out[31:26];
    assign Func = ROM_out[5:0];
    assign rs = ROM_out[25:21];
    assign rt = ROM_out[20:16];
    assign rd = ROM_out[15:11];
    assign shamt = ROM_out[10:6];
    assign immed = ROM_out[15:0];
    assign ROM_in = PC_out[11:2];
    assign Jaddr = {PC_out[31:28], ROM_out[25:0], 2'b0};
    assign Shift = SLLV|SRLV;
    assign Uncond_addr = ((immed_ext)<<2)+PC_plus4;
    assign RAM_in = run?Result[11:2]:sw[9:0];
    assign Cond = (BLTZ&Result[0])|(Bne&~equal)|(Beq&equal);
    assign Uncond = JMP;
    assign run = Display|go|~SysCall;
    assign Display = (R1==34)&&SysCall;
    
    
    ROM uROM(1'b1, ROM_in, ROM_out);
    Extender uExtender(SignedExt, immed, immed_ext);
    RegFile uRegFil(clk_run, rst, RegFile_R1, RegFile_R2, RegFile_W2, RegFile_Din, RegWrite, R1, R2);   
    ALU uALU(R1, ALU_B, ALU_OP, ALU_shamt, Result, Result2, equal);
    RAM uRAM(clk_run, rst, RAM_in, MemWrite, R2, RAM_out); 
    Display uDisplay(clk_10000Hz, rst, Display_data, seg, an);
    Divider uDivider(clk, clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, clk_10000Hz);
    Controller uController(OP, Func, rt, ALU_OP, MemToReg, MemWrite, ALU_SRC, RegWrite, SysCall, SignedExt, RegDst, Beq, Bne, JR, JMP, JAL, SLLV, SRLV, LBU, BLTZ);
    Multiplexer_2 #(5)sel_rs(rs, 5'd2, SysCall, RegFile_R1);
    Multiplexer_2 #(5)sel_rt(rt, 5'd4, SysCall, RegFile_R2);
    Multiplexer_2 #(5)sel_rd(rt, rd, RegDst, RegFile_W1);
    Multiplexer_2 #(5)sel_rw(RegFile_W1, 5'h1f, JAL, RegFile_W2);
    Multiplexer_2 #(5)sel_shamt(shamt, R1[4:0], Shift, ALU_shamt);
    Multiplexer_2 #(32)sel_R2(R2, immed_ext, ALU_SRC, ALU_B);
    Multiplexer_2 #(32)sel_ToReg(Result, RAM_out, MemToReg, DataToReg);
    Multiplexer_2 #(32)sel_LBU(DataToReg, {24'b0, LBU_data}, LBU, Din);
    Multiplexer_2 #(32)sel_JMP_addr(Jaddr, R1, JR, JMP_addr);
    Multiplexer_2 #(32)sel_Display(Count_data, RAM_out, sw[14], Display_data);
    Multiplexer_2 #(32)sel_Din(Din, PC_plus4, JAL, RegFile_Din);
    Multiplexer_4 #(1)sel_frequncy(clk_10Hz, clk_20Hz, clk_50Hz, clk_100Hz, sw[11:10], clk_run);
    Multiplexer_4 #(8)sel_addr(DataToReg[7:0], DataToReg[15:8], DataToReg[23:16], DataToReg[31:24], Result[1:0], LBU_data);
    Multiplexer_4 #(32)sel_PC(PC_plus4, Uncond_addr, JMP_addr, 32'b0, {Uncond, Cond}, PC_in); 
    Multiplexer_4 #(32)sel_Count(LedData, cnt_clock, cnt_Uncond, cnt_Cond, sw[13:12], Count_data);
    Counter #(32)Count_Run(clk_run, rst, 1'b0, run, 32'b0, cnt_clock);
    Counter #(32)Count_Cond(clk_run, rst, 1'b0, Cond, 32'b0, cnt_Cond);
    Counter #(32)Count_Uncond(clk_run, rst, 1'b0, Uncond, 32'b0, cnt_Uncond);
    Register PC(clk_run, rst, run, PC_in, PC_out);
    Register LED(clk_run, rst, Display, R2, LedData);  
endmodule
