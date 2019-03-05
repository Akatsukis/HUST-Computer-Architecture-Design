`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/20 08:47:13
// Design Name: 
// Module Name: Decoder
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


module Decoder(clk, rst, num, seg);
    input clk, rst;
    input[3:0] num;
    output reg[7:0] seg;
    initial begin
        seg <= 8'b11111111;
    end
    always@(posedge clk) begin
        if(!rst)begin
            seg <= 8'b11111111;
        end
        else begin
            case(num)
                4'd0:  seg <= 8'b11000000;
                4'd1:  seg <= 8'b11111001;
                4'd2:  seg <= 8'b10100100;
                4'd3:  seg <= 8'b10110000;
                4'd4:  seg <= 8'b10011001;
                4'd5:  seg <= 8'b10010010;
                4'd6:  seg <= 8'b10000010;
                4'd7:  seg <= 8'b11111000;
                4'd8:  seg <= 8'b10000000;
                4'd9:  seg <= 8'b10011000;
                4'd10: seg <= 8'b10001000;
                4'd11: seg <= 8'b10000011;
                4'd12: seg <= 8'b11000110;
                4'd13: seg <= 8'b10100001;
                4'd14: seg <= 8'b10000110;
                4'd15: seg <= 8'b10001110;
                default: seg <= 8'b11111111;
            endcase
        end
    end
endmodule
