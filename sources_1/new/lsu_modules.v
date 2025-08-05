`timescale 1ns / 1ps
`include "source.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/14/2025 04:44:11 PM
// Design Name: 
// Module Name: Jump
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

// the below two modules are jump modules and handle jump statements.

module conditional_jump
(
    
    input [7:0] instruction,address,
    input [7:0] drop_data,
    output [7:0] move_address, 
    output jump_flag,
    output [1:0] sel
);

    assign sel = instruction [1:0];
    assign move_address = address;  
    assign jump_flag = drop_data[0] & instruction[2]& (instruction[6]); 

endmodule

// all of the modules below included just interconnecting wire without any expensive or excessive logic involved
// the modules have thier respective logic involved in the main LSU unit
module memory_to_wr
(
input [7:0] instruction, address,
input [7:0] memory_data,
output reg [7:0] memory_request,
output reg [7:0] wr_write,
output reg [2:0] sel_wr ,
input clk_not
);
always @(posedge clk_not) begin
 sel_wr = instruction [2:0];
 memory_request = address;
 wr_write = memory_data; 
end

endmodule

// in wr module
//module wr_selector
//(
//    input x,
//    input [2:0] sel,
//    output [7:0] a
    
//);

//assign a[0] = (~sel[0])&(~sel[1])&(~sel[2]);
//assign a[1] = (sel[0])&(~sel[1])&(~sel[2]);
//assign a[2] = (~sel[0])&(sel[1])&(~sel[2]);
//assign a[3] = (sel[0])&(sel[1])&(~sel[2]);
//assign a[4] = (~sel[0])&(~sel[1])&(sel[2]);
//assign a[5] = (~sel[0])&(~sel[1])&(sel[2]);
//assign a[6] = (sel[0])&(sel[1])&(sel[2]);
//assign a[7] = (~sel[0])&(sel[1])&(sel[2]);

//endmodule


//module decoder8x64
//(
//input [7:0] working_resigter_write,
//input [7:0] wr_activator_code,
//output [7:0]data
//);



//endmodule


module dr_to_memory
(
    input [7:0] instruction, address,
    input [7:0] dr_data,
    output reg [1:0] sel_dr,
    output reg [7:0] address_memory, memory_data,
    input clk_not
);

always @(posedge clk_not) begin

 address_memory = address;
 sel_dr = instruction[1:0];
 memory_data = dr_data;
end

endmodule

module dr_to_wr
(
    input[7:0] instruction,address,
    input [7:0] dr_data,
    output reg [7:0] wr_write,
    output reg [1:0] dr_sel ,
    output reg [2:0] wr_sel,
    input clk_not
);
always @(posedge clk_not) begin
 wr_write= dr_data;
 dr_sel = instruction[1:0];
 wr_sel = address[7:5];
end

endmodule

module initialize_value
(
    input [7:0] instruction, address,
    output reg [2:0] sel,
    output reg [7:0] wr_write,
    input clk_not
);

always @(posedge clk_not) begin

 sel = instruction[2:0];
 wr_write = address;

end
endmodule

module raw_to_proper
(
    input [7:0] dtw,mtw,iv,
    input [2:0] sel_dtw,sel_mtw,sel_iv,
    input [1:0] function_selection,
    output [7:0] wr_write, wr_address
);

wire [2:0] function_type;

assign function_type[0] = (function_selection[0])&(~function_selection[1]); 
assign function_type[1] = (~function_selection[0])&(function_selection[1]); 
assign function_type[2] = (function_selection[0])&(function_selection[1]); 

assign wr_write = (dtw&{8{function_type[0]}})|(mtw&{8{function_type[1]}})|(iv&{8{function_type[2]}});

wire [2:0] sel = (sel_dtw&{8{function_type[0]}})|(sel_mtw&{8{function_type[1]}})|(sel_iv&{8{function_type[2]}});

assign wr_address[0] = (~sel[0])&(~sel[1])&(~sel[2]);
assign wr_address[1] = (sel[0])&(~sel[1])&(~sel[2]);
assign wr_address[2] = (~sel[0])&(sel[1])&(~sel[2]);
assign wr_address[3] = (sel[0])&(sel[1])&(~sel[2]);
assign wr_address[4] = (~sel[0])&(~sel[1])&(sel[2]);
assign wr_address[5] = (sel[0])&(~sel[1])&(sel[2]);
assign wr_address[6] = (~sel[0])&(sel[1])&(sel[2]);
assign wr_address[7] = (sel[0])&(sel[1])&(sel[2]);


endmodule

