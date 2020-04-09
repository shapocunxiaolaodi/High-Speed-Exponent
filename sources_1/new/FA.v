`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/29/2020 01:23:18 PM
// Design Name: 
// Module Name: FA
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


module FA(In1, In2, Cin, Sum, Cout);

    input  In1, In2, Cin;

    output  Sum, Cout;
    
    assign Sum  = (In1 ^ In2) ^ Cin;
    assign Cout = (In1 & In2) | (In2 & Cin) | (Cin & In1);
endmodule
