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


module working_register(
    input [7:0] d1,d2,d3,d4,d5,d6,d7,d8,
    output [7:0] out,
    input s1,s2,s3,
    input clk
);

wire [7:0] q1,q2,q3,q4,q5,q6,q7,q8,r1,r2,r3,r4,r5,r6,r7,r8;

register_8bit reg1(.D(d1),.clk(clk),.Q(q1),.reset(r1));
register_8bit reg2(.D(d2),.clk(clk),.Q(q2),.reset(r2));
register_8bit reg3(.D(d3),.clk(clk),.Q(q3),.reset(r3));
register_8bit reg4(.D(d4),.clk(clk),.Q(q4),.reset(r4));
register_8bit reg5(.D(d5),.clk(clk),.Q(q5),.reset(r5));
register_8bit reg6(.D(d6),.clk(clk),.Q(q6),.reset(r6));
register_8bit reg7(.D(d7),.clk(clk),.Q(q7),.reset(r7));
register_8bit reg8(.D(d8),.clk(clk),.Q(q8),.reset(r8));

mux64x8 out_put(.d1(q1),.d2(q2),.d3(q3),.d4(q4),.d5(q5),.d6(q6),.d7(q7),.d8(q8), .s1(s1),.s2(s2),.s3(s3),.out(out));

endmodule
