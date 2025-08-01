`timescale 1ns / 1ps
`include "source.v"
`include "PC.v"
`include "working_register.v"
`include "drop_register.v"
`include "ALU.v"
`include "LSU.v"


//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 11:09:52 AM
// Design Name: 
// Module Name: processor
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


module processor(
            input [7:0] data,
            input clk,clk_not,
            input [7:0] memory_read,
            output [7:0] memory_request,memory_write,memory_write_address,counter_out,
            output [1:0] memory_function
    );
    
    // connection between LSU and WR
    wire [7:0] wr_write,wr_write_address;
    
    // connection between WR and ALU
    wire [7:0] alu_processing_1,alu_processing_2;
    wire [2:0] sel1,sel2;
    // ALU to DR
    wire [7:0] alu_output;
    wire [3:0] dr_sel;
    // DR to LSU
    wire [7:0] dr_read;
    wire [1:0] sel_dr;
    wire [7:0] instruction_alu,address_alu,instruction_lsu,address_lsu;    
    wire [7:0] jump_address;
    
    //program_counter pc(.data_raw(data),.clk(clk),.clk_not(clk_not),.jump_address_in(jump_address),.counter_out(counter_out),.instruction_alu(instruction_alu),.address_alu(address_alu),.instruction_lsu(instruction_lsu),.address_lsu(address_lsu));
       program_counter uut (
        .data_raw(data),
        .clk(clk),
        .clk_not(clk_not),
        .jump_address_in(jump_address),
        .counter_out(counter_out),
        .instruction_alu(instruction_alu),
        .address_alu(address_alu),
        .instruction_lsu(instruction_lsu),
        .address_lsu(address_lsu)
);    
    

    working_register wr(.data(wr_write),.wr_select_datadropper(wr_write_address),.out1(alu_processing_1),.out2(alu_processing_2),.sel1(sel1),.sel2(sel2),.clk(clk));
    
    wire [7:0] instruction_alu1,address_alu1,instruction_lsu1,address_lsu1;
    
    pipeline alu3(.data(instruction_alu),.clk(clk),.clk_not(clk_not),.out(instruction_alu1));
    pipeline alu2(.data(address_alu),.clk(clk),.clk_not(clk_not),.out(address_alu1));
    pipeline lsu1(.data(instruction_lsu),.clk(clk),.clk_not(clk_not),.out(instruction_lsu1));
    pipeline lsu2(.data(address_lsu),.clk(clk),.clk_not(clk_not),.out(address_lsu1));
    
    
    
    alu_selector alu1(.instruct(instruction_alu1),.address(address_alu1),.data1(alu_processing_1),.data2(alu_processing_2),.wr1(sel1),.wr2(sel2),.ans(alu_output),.dr(dr_sel));
    
    drop_register dr(.data(alu_output),.out(dr_read),.sel(sel_dr),.clk(clk_not),.dr_selector(dr_sel));
    
    LSU lsu(.instruction(instruction_lsu1),.address(address_lsu1),.dr_data(dr_read),.wr_write(wr_write),.wr_address(wr_write_address),.sel_dr(sel_dr),.memory_request(memory_request),.memory_write(memory_write),.jump_address(jump_address),.memory_write_address(memory_write_address),.jump_flag(jump_flag),.memory_function_type(memory_function),.clk_not(clk_not));
    

endmodule