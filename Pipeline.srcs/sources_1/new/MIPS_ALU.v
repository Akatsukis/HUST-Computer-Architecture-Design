`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/19 11:13:08
// Design Name: 
// Module Name: ALU
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


module ALU(X, Y, S, shamt, Result, Result2, equal);
    input[31:0] X, Y;
    input[3:0] S;
    input[4:0] shamt;
    output reg[31:0] Result, Result2;
    output reg equal;
	initial begin
		Result = 32'b0;
		Result2 = 32'b0;
		equal = 1'b0;
	end
    always@(*)begin
		equal = (X==Y)?1:0;
        case(S)
            4'd0:begin
                Result = Y<<shamt;
                Result2 = 0;
            end
			4'd1:begin
                Result = $signed(Y)>>>shamt;
                Result2 = 0;
            end
			4'd2:begin
                Result = Y>>shamt;
                Result2 = 0;
            end
			4'd3:{Result2, Result} = X*Y;
			4'd4:begin
				Result = X/Y;
				Result2 = X%Y;
			end
			4'd5:begin
                Result = X+Y;
                Result2 = 0;
            end
			4'd6:begin
                Result = X-Y;
                Result2 = 0;
            end
			4'd7:begin
                Result = X&Y;
                Result2 = 0;
            end
			4'd8:begin
                Result = X|Y;
                Result2 = 0;
            end
			4'd9:begin
                Result = X^Y;
                Result2 = 0;
            end
			4'd10:begin
                Result = ~(X|Y);
                Result2 = 0;
            end
			4'd11:begin
                Result = ($signed(X)<$signed(Y))?1:0;
                Result2 = 0;
            end
			4'd12:begin
                Result = (X<Y)?1:0;
                Result2 = 0;
            end
            default begin
                Result = 0;
                Result2 = 0;
            end
        endcase
    end
endmodule
