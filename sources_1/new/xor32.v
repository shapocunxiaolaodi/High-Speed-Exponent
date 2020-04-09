`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 06:58:18 PM
// Design Name: 
// Module Name: xor32
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


module xor32(A, B, Y);
    input signed [31:0]A;
    input B;
    output signed [31:0]Y;
    reg [31:0]Y;
    always @(*)
    begin
        case(B)
            1'b1: Y = (A^32'b11111111111111111111111111111111)+1'b1;
            default: Y = A;
        endcase
    end
endmodule
