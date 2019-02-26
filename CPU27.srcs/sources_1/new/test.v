`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/26 17:12:16
// Design Name: 
// Module Name: test
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


module test(clk, rst, sw, seg, an);
    input clk, rst;
    input[15:0] sw;
    wire[31:0] data, Result2;
    wire equal;
    output[7:0] seg, an;
    wire clk_1Hz, clk_10000Hz;
    Divider uDivider(clk, clk_1Hz, clk_10000Hz);
    Display uDisplay(clk_10000Hz, !rst, data, seg, an);
    //Multiplexer_2#(32)(32'b0, 32'b1, choice, data);
    //Multiplexer_4#(32)(32'd0, 32'd1, 32'd2, 32'd3, choice, data);
    //ROM(1'b1, addr, data);
    //Register(en, clk_1Hz, rst, {24'b0, sw}, data);
    //Extender(SignedExt, sw, data);
    //Counter#(32)(clk_1Hz, !rst, ld, cnt, {16'b0, sw}, data);
    //RAM(sw[9:0], str, clk_1Hz, !rst, {26'b0, sw[15:10]}, data);
    //RegFile(clk_1Hz, 5'd0, 5'd1, 5'd0, {16'b0, sw}, WE, data, R2);
    ALU({26'b0, sw[9:4]}, {26'b0, sw[15:10]}, sw[3:0], 5'd2, data, Result2, equal);
endmodule
