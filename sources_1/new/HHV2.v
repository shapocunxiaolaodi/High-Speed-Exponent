`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/28/2020 08:37:18 AM
// Design Name: 
// Module Name: HHV2
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

//High-speed Hyper-2 Vector Cordic
module HHV2(clk, D1, outx, outy, outz);

    input clk;
    input [31:0]D1;
    output [31:0] outx, outy, outz;
    
    
    wire signed [31:0]wx0[31:1];
    wire signed [31:0]wx1[31:1];
    wire signed [31:0]wy0[31:1];
    wire signed [31:0]wy1[31:1];
    wire signed [31:0]wz0[31:1];
    wire signed [31:0]wz1[31:1];
    
    RCA RCDA(D1, 32'b00000001_000000000000000000000000, wx0[1]);
    RCA RCDS(D1, 32'b11111111_000000000000000000000000, wy0[1]);
    
//    assign wx0[1] = D1 + 32'b00000001_000000000000000000000000;
    assign wx1[1] = 32'd0;

//    assign wy0[1] = D1 - 32'b00000001_000000000000000000000000;
    assign wy1[1] = 32'd0;
    assign wz0[1] = 32'd0;
    assign wz1[1] = 32'd0;
    
    genvar i;
    generate
    for (i=1; i < 32; i=i+1)
    begin: xyz
        wire z_sign;
//        wire signed [31:0] ysign;
        wire [31:0] atanh;
        wire signed [31:0] x_shr0, y_shr0, x_shr1, y_shr1;
        wire signed [31:0] x_xor0, y_xor0, x_xor1, y_xor1, z_xor0;
        wire signed [31:0]x_rs, y_rs, z_rs;
//        assign ysign = wy0[i]+wy0[i];
        assign z_sign = !y_rs[31];
        
        tanh atanh123(i, atanh);
        
        assign x_shr0 = wx0[i] >>> i;
        assign x_shr1 = wx1[i] >>> i;
        
        assign y_shr0 = wy0[i] >>> i;
        assign y_shr1 = wy1[i] >>> i;
        
        
        xor32 X1(x_shr0, z_sign, x_xor0);
        xor32 X2(x_shr1, z_sign, x_xor1);
        
        xor32 Y1(y_shr0, z_sign, y_xor0);
        xor32 Y2(y_shr1, z_sign, y_xor1);
        
        xor32 Z1(atanh, !z_sign, z_xor0);
//        xor32 Z2(z_shr1, !zsign, z_xor1);

        CT CTX(wx0[i], wx1[i], y_xor0, y_xor1, wx0[i+1], wx1[i+1]);
        CT CTY(wy0[i], wy1[i], x_xor0, x_xor1, wy0[i+1], wy1[i+1]);
        CT CTZ(wz0[i], wz1[i], z_xor0,  32'd0, wz0[i+1], wz1[i+1]);
        
        RCA RCX(wx0[i], wx1[i], x_rs);
        RCA RCY(wy0[i], wy1[i], y_rs);
        RCA RCZ(wz0[i], wz1[i], z_rs);
        
//        assign x_rs = wx0[i] + wx1[i];
//        assign y_rs = wy0[i] + wy1[i];
//        assign z_rs = wz0[i] + wz1[i];
//        assign outx = x_rs;
//        assign outy = y_rs;
//        assign outz = z_rs;
    end
    endgenerate
    
    RCA RCX(wx0[31], wx1[31], outx);
    RCA RCY(wy0[31], wy1[31], outy);
    RCA RCZ(wz0[31], wz1[31], outz);
    
//    assign outx = wx0[31]+wx1[31];
//    assign outy = wy0[31]+wy1[31];
//    assign outz = wz0[31]+wz1[31];
    
endmodule

