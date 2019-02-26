`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 09:08:57
// Design Name: 
// Module Name: Register
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


module Register(clk, rst, en, Din, Dout);
    input en, clk, rst;
    input[31:0] Din;
    output reg [31:0] Dout;
    initial begin
        Dout <= 0;
    end
    always@(posedge clk) begin
        if(!rst)Dout <= 0;
        else begin
            if(en == 1'b1)Dout <= Din;
            else Dout <= Dout;
        end
    end
endmodule
