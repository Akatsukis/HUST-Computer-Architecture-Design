`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 19:15:01
// Design Name: 
// Module Name: sim_RAM
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


module sim_RAM();
    reg[9:0] addr;
    reg str, sel, clk, ld, clr;
    reg[31:0] Din;
    wire[31:0] Dout;
    initial begin
        addr = 0;
        str = 0;
        sel = 1;
        clk = 0;
        ld = 1;
        clr = 0;
        Din = 0;
    end
    always#1 clk = ~clk;
    always#10 str = ~str;
    always#2 addr = (addr+1)%20;
    always#2 Din = Din+1;
    RAM sim_RAM(addr, str, sel, clk, ld, clr, Din, Dout);
endmodule
