`timescale 1ns / 1ps

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
    input [7:0] d1,d2,d3,d4,
    //input [7:0] in,
    output [7:0] out,
    input [1:0] sel,
    input clk
);

wire [7:0] q1,q2,q3,q4,q5,q6,q7,q8,r1,r2,r3,r4,r5,r6,r7,r8;

register_8bit reg1(.D(d1),.clk(clk),.Q(q1),.reset(r1));
register_8bit reg2(.D(d2),.clk(clk),.Q(q2),.reset(r2));
register_8bit reg3(.D(d3),.clk(clk),.Q(q3),.reset(r3));
register_8bit reg4(.D(d4),.clk(clk),.Q(q4),.reset(r4));

mux32x8 out_put1(.d1(q1),.d2(q2),.d3(q3),.d4(q4), .s1(sel[0]),.s2(sel[1]),.out(out));


endmodule
