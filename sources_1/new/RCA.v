`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/06/2020 09:27:55 PM
// Design Name: 
// Module Name: RCA
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


module RCA(A_8, B_8, Sum32);
input  [31:0] A_8, B_8;
//input  Cin;
//output Cout;
output [31:0] Sum32;
//assign Sum32 = A_8+B_8;
//assign Cout = 1'b0;
wire   [32:0] c;

assign c[0] = 1'b0;

genvar i;
generate
    for (i = 0; i < 32; i=i+1) 
    begin : make_fadders
        FA fa1(.In1( A_8[i] ),
                .In2( B_8[i] ),
                .Cin(  c[i]   ),
                .Sum( Sum32[i] ),
                .Cout( c[i+1] )
                );
    end
endgenerate

//assign Cout = c[8];

endmodule