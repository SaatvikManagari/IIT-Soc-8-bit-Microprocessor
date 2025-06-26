`timescale 1ns / 1ps
`include "working_registers.v"
`include "drop_register.v"
`include "ALU.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/26/2025 07:23:24 PM
// Design Name: 
// Module Name: Mid_eval
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


module mid_eval(
    input [7:0] instruction, address,d1,d2,d3,d4,d5,d6,d7,d8,
    input [1:0] drop_check,
    input clk,
    output [7:0] data
    );
    wire signed [7:0] selection_into_alu1,selection_into_alu2;
    wire [2:0] wr_sel1,wr_sel2;
    wire [1:0] dr_sel;
    wire [7:0] alu_output;
    wire [7:0] dr1,dr2,dr3,dr4;
    
    working_register wr(.d1(d1),.d2(d2),.d3(d3),.d4(d4),.d5(d5),.d6(d6),.d7(d7),.d8(d8),.out1(selection_into_alu1),.out2(selection_into_alu2),.sel1(wr_sel1),.sel2(wr_sel2),.clk(clk));
    alu_selector alu(.instruct(instruction),.address(address),.data1(selection_into_alu1),.data2(selection_into_alu2),.ans(alu_output),.wr1(wr_sel1),.wr2(wr_sel2),.dr(dr_sel));
    decoder8x32 dropper(.in(alu_output),.sel(dr_sel),.a1(dr1),.a2(dr2),.a3(dr3),.a4(dr4));
    drop_register (.d1(dr1),.d2(dr2),.d3(dr3),.d4(dr4),.out(data),.sel(drop_check),.clk(clk));
    
    
endmodule
