`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 01:30:25 PM
// Design Name: 
// Module Name: CT
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
//Compression Tree
//module CT2
module CT(d0, d1, d2, d3, o0, o1);

    input [31:0] d0, d1, d2, d3;
    output [31:0] o0, o1;
    
    wire [32:0] sum, carry, sum1, carry1;
    
    
    genvar i;
    generate
    for(i = 0; i < 32; i = i+1)
    begin
        FA F0(d0[i], d1[i], d2[i], sum[i], carry[i+1]); 
    end 
    endgenerate
    assign carry[0] = 1'b0;
    genvar j;
    generate
    for(j = 0; j < 32; j = j+1)
    begin
        FA F1(d3[j], sum[j], carry[j], sum1[j], carry1[j+1]); 
    end 
    endgenerate
    assign o0[31:0] = sum1[31:0];
    assign o1[31:0] = {carry1[31:1], 1'b0};
endmodule
