`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/09/2020 10:52:04 AM
// Design Name: 
// Module Name: top_rca
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


module top_rca(

    );
    reg [31:0] x0;
    reg [31:0] y0;
//    reg [31:0] di0, di1, di2, di3;
//    wire [31:0] o0, o1, o2;
    wire [31:0] xvo, yvo, zvo;
//    wire [31:0] XY;
    wire [31:0] man;
    reg clk;
    wire co;
    wire [31:0] sum;
    assign man = 32'b00000001110101001011001010111110;
    
    initial begin      
        clk = 1'b0;
        y0 <= 32'b01000000010011011001011001111100;
        x0 <= 32'b01000000111010100100100101011111;
//        di0 <= 32'b00000000011011011001001001111100;
//        di1 <= 32'b00000000101110100100110101011111;
//        di3 <= 32'b00000000111000100110100101011111;
//        di2 <= 32'b00000000110010000101100101011111;
//        D2 <= 32'b00000000_001110011110011001111110;
//                           0011100111100110100101
        forever #5 clk = ~clk;
    end
    HHV2 H2(clk, man, xvo, yvo, zvo);
endmodule