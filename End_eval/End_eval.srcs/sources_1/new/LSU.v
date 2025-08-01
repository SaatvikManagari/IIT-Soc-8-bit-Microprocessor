`timescale 1ns / 1ps
`include "lsu_modules.v"
`include "source.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07/23/2025 07:23:48 PM
// Design Name: 
// Module Name: LSU
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


module LSU
(
    input [7:0] instruction,address,
    input [7:0] dr_data,
    input [7:0] memory_read,
    output [7:0] memory_request, wr_write, memory_write, jump_address, wr_address, memory_write_address,
    output jump_flag,
    output [1:0] sel_dr
//    output [7:0] memory_raw, dr_raw,iv_raw,
//    output [7:0] memory_selected,dr_selected,iv_selected,
//    output [7:0] ins
);
// select lines
wire [1:0] sel_dr1,sel_dr2;
wire [2:0] sel_wr_mtw,sel_wr_dtw,sel_wr_iv;
// creating different instruction lines based on the type of instruction if it is a data transfer(dt) or a instruction transfer(it) based instruciton
wire [7:0] instruction_dt = {8{(~instruction[6])}}& instruction;
wire [7:0] instruction_it = {8{instruction[6]}}& instruction;

// differentiation of tasks based on address lines 
wire [7:0] instruction_mtw,instruction_dtm,instruction_dtw,instruction_iv;
wire [7:0] address_mtw,address_dtm,address_dtw,address_iv;
wire [2:0] task_selector = instruction[5:3];
wire [3:0] task_finalizer;
assign task_finalizer[0] = ((task_selector[0])&(~task_selector[1])&(~task_selector[2]));
assign task_finalizer[1] = ((~task_selector[0])&(task_selector[1])&(~task_selector[2]));
assign task_finalizer[2] = ((task_selector[0])&(task_selector[1])&(~task_selector[2]));
assign task_finalizer[3] = ((~task_selector[0])&(~task_selector[1])&(task_selector[2]));

assign instruction_mtw = {8{task_finalizer[0]}} & instruction_dt;
assign instruction_dtm = {8{task_finalizer[1]}} & instruction_dt;
assign instruction_dtw = {8{task_finalizer[2]}} & instruction_dt;
assign instruction_iv = {8{task_finalizer[3]}} & instruction_dt;

assign address_mtw = {8{task_finalizer[0]}} & address;
assign address_dtm = {8{task_finalizer[1]}} & address;
assign address_dtw = {8{task_finalizer[2]}} & address;
assign address_iv = {8{task_finalizer[3]}} & address;
// initializing temporary wire to hold the data
wire [7:0] memory_raw, dr_raw,iv_raw; // raw data from the registers, memory and initialization value which require logic analysis before sending the data to the designated WR


// initializing the modules
memory_to_wr mtw(.instruction(instruction_mtw),.address(address_mtw),.memory_data(memory_read),.memory_request(memory_request),.wr_write(memory_raw),.sel_wr(sel_wr_mtw));
dr_to_memory dtm(.instruction(instruction_dtm),.address(address_dtm),.dr_data(dr_data),.sel_dr(sel_dr1),.address_memory(memory_write_address),.memory_data(memory_write) );
dr_to_wr dtw(.instruction(instruction_dtw),.address(address_dtw),.dr_data(dr_data),.wr_write(dr_raw),.dr_sel(sel_dr2),.wr_sel(sel_wr_dtw));
initialize_value iv(.instruction(instruction_iv),.address(address_iv),.sel(sel_wr_iv),.wr_write(iv_raw));

wire [2:0] function_sel = (~instruction[4:3]);

assign sel_dr = {2{task_finalizer[1]}}&sel_dr1| {2{task_finalizer[2]}}&sel_dr2;

// logic for mtw vs dtw vs iv
raw_to_proper rtp(.dtw(dr_raw),.mtw(memory_raw),.iv(iv_raw),.sel_dtw(sel_wr_dtw),.sel_mtw(sel_wr_mtw),.sel_iv(sel_wr_iv),.wr_address(wr_address),.wr_write(wr_write),.function_selection(function_sel));
// jump instructions

// checking if the given command is conditional or unconditional
wire [7:0] instruction_cj; // ucj stands for uncondtional jump and cj means conditional jump

assign instruction_cj = instruction_it & {8{(instruction[3])&(~instruction[2])}};

// jump modules
//unconditional_jump ucj(.instruction(instruction_ucj),.address(address),.move_address(jump_address),.jump_flag(jump_flag));
conditional_jump cj(.instruction(instruction_cj),.address(address),.move_address(jump_address),.jump_flag(jump_flag),.sel(sel_dra));



endmodule