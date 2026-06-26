`timescale 1ns / 1ps
`include "source.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/20/2025 07:06:41 PM
// Design Name: 
// Module Name: workingregister
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


module drop_register(
    input [7:0] data,
    //input [7:0] in,
    output [7:0] out,
    input [1:0] sel,
    input clk,
    input [1:0] dr_selector
    //output [7:0] q1,q2,q3,q4
);

wire [7:0] r1,r2,r3,r4,q1,q2,q3,q4;
wire [3:0] x = {8{clk}}& dr_selector;

register_8bit reg1(.D(data),.clk(x[0]),.Q(q1),.reset(r1));
register_8bit reg2(.D(data),.clk(x[1]),.Q(q2),.reset(r2));
register_8bit reg3(.D(data),.clk(x[2]),.Q(q3),.reset(r3));
register_8bit reg4(.D(data),.clk(x[3]),.Q(q4),.reset(r4));

mux32x8 out1(.d1(q1),.d2(q2),.d3(q3),.d4(q4),.s1(sel[0]),.s2(sel[1]),.out(out));


endmodule   