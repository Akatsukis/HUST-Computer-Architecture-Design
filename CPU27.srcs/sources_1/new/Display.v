`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/25 08:59:23
// Design Name: 
// Module Name: Display
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


module Display(clk, rst, data, seg, an);
    input clk, rst;
    input[31:0] data;
    output[7:0] seg;
    output reg[7:0] an;
    reg[3:0] num;
    reg[2:0] sel;
    Decoder uDecoder(clk, rst, num, seg);
    initial begin
        an <= 8'b11111111;
        sel <= 0;
        num <= 0;
    end
    
    
    always@(posedge clk)begin
        if(!rst)begin
            an <= 8'b11111111;
            sel <= 0;
            num <= 0;
        end
        else begin
            case(sel)
                3'd0:begin
                    an <= 8'b01111111;
                    num <= data[3:0];
                end
                3'd1:begin
                    an <= 8'b11111110;
                    num <= data[7:4];
                end
                3'd2:begin
                    an <= 8'b11111101;
                    num <= data[11:8];
                end
                3'd3:begin
                    an <= 8'b11111011;
                    num <= data[15:12];
                end
                3'd4:begin
                    an <= 8'b11110111;
                    num <= data[19:16];
                end
                3'd5:begin
                    an <= 8'b11101111;
                    num <= data[23:20];
                end
                3'd6:begin
                    an <= 8'b11011111;
                    num <= data[27:24];
                end
                3'd7:begin
                    an <= 8'b10111111;
                    num <= data[31:28];
                end
                default:begin
                    an <= 8'b11111111;
                    num <= 0;
                end
            endcase
            sel <= sel+1;
        end
    end
endmodule
