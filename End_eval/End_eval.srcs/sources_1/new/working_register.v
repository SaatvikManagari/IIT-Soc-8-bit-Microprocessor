`timescale 1ns / 1ps
`include "source.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 11:09:52 AM
// Design Name: 
// Module Name: working_register
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

module working_register(
    input [7:0] data,// d1,d2,d3,d4,d5,d6,d7,d8,
    input [7:0] wr_select_datadropper,
    output [7:0] out1,out2,
    input [2:0] sel1,sel2,
    input clk
);

wire [7:0] q1,q2,q3,q4,q5,q6,q7,q8,r1,r2,r3,r4,r5,r6,r7,r8;
wire [7:0] x = {8{clk}} & wr_select_datadropper;

register_8bit reg1(.D(data),.clk(x[0]),.Q(q1),.reset(r1));
register_8bit reg2(.D(data),.clk(x[1]),.Q(q2),.reset(r2));
register_8bit reg3(.D(data),.clk(x[2]),.Q(q3),.reset(r3));
register_8bit reg4(.D(data),.clk(x[3]),.Q(q4),.reset(r4));
register_8bit reg5(.D(data),.clk(x[4]),.Q(q5),.reset(r5));
register_8bit reg6(.D(data),.clk(x[5]),.Q(q6),.reset(r6));
register_8bit reg7(.D(data),.clk(x[6]),.Q(q7),.reset(r7));
register_8bit reg8(.D(data),.clk(x[7]),.Q(q8),.reset(r8));

//mux64x8 out_put1(.d1(q1),.d2(q2),.d3(q3),.d4(q4),.d5(q5),.d6(q6),.d7(q7),.d8(q8), .s1(sel1[0]),.s2(sel1[1]),.s3(sel1[2]),.out(out1));
//mux64x8 out_put2(.d1(q1),.d2(q2),.d3(q3),.d4(q4),.d5(q5),.d6(q6),.d7(q7),.d8(q8), .s1(sel2[0]),.s2(sel2[1]),.s3(sel2[3]),.out(out2));

mux64x16 out(.q1(q1),.q2(q2),.q3(q3),.q4(q4),.q5(q5),.q6(q6),.q7(q7),.q8(q8), .sel1(sel1),.sel2(sel2),.out2(out2),.out1(out1));
endmodule