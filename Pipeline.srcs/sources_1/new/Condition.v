`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2019/02/28 19:22:23
// Design Name: 
// Module Name: Condition
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


module Condition(OP, F, R1_Used, R2_Used);
    input[5:0] OP, F;
    output R1_Used, R2_Used;
    assign R1_Used = (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&~F[1]&~F[0])|
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
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&F[3]&~F[2]&~F[1]&~F[0])|
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&F[3]&F[2]&~F[1]&~F[0])|
    (~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0])|
    (~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&OP[0])|
    (~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&~OP[0])|
    (~OP[5]&~OP[4]&OP[3]&OP[2]&~OP[1]&~OP[0])|
    (~OP[5]&~OP[4]&OP[3]&~OP[2]&~OP[1]&OP[0])|
    (~OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&~OP[0])|
    (~OP[5]&~OP[4]&OP[3]&OP[2]&~OP[1]&OP[0])|
    (OP[5]&~OP[4]&~OP[3]&~OP[2]&OP[1]&OP[0])|
    (OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&OP[0])|
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&~F[1]&~F[0])|
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&F[1]&~F[0])|
    (OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0])|
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&OP[0]);

    assign R2_Used = (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&~F[2]&~F[1]&~F[0])|
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
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&F[3]&F[2]&~F[1]&~F[0])|
    (~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&~OP[0])|
    (~OP[5]&~OP[4]&~OP[3]&OP[2]&~OP[1]&OP[0])|
    (OP[5]&~OP[4]&OP[3]&~OP[2]&OP[1]&OP[0])|
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&~F[1]&~F[0])|
    (~OP[5]&~OP[4]&~OP[3]&~OP[2]&~OP[1]&~OP[0]&~F[5]&~F[4]&~F[3]&F[2]&F[1]&~F[0]);

endmodule
