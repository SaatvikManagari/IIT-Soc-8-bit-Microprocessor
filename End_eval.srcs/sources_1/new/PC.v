`timescale 1ns / 1ps
`include "pc_modules.v"
`include "source.v"

module program_counter(
    input [7:0] data_raw,
    input clk, clk_not,
    input [7:0] jump_address_in,
    output [7:0] counter_out,
    output [7:0] instruction_alu, address_alu,instruction_lsu, address_lsu
    );
    
    // wire for instruction
    wire [7:0] instruction_wire;
    wire [7:0] address_wire;
    wire [7:0] data = data_raw & {8{(clk | clk_not)}};
    
    register_8bit instruction_register(.D(data),.clk(clk),.Q(instruction_wire));
    register_8bit address_register(.D(data),.clk(clk_not),.Q(address_wire));
    
    // connections required for jump statements 
    
    wire jump_flag_unconditional, jump_flag_conditional, jump_flag_conditional_status;
    wire [7:0] jump_address = jump_address_in &{8{jump_flag_conditional}}| address_wire & {8{jump_flag_unconditional}} ;
    
    counter count(.clk(clk),.clk_not(clk_not),.jump_flag_unconditional(jump_flag_unconditional),.jump_flag_conditional(jump_flag_conditional),.jump_flag_conditional_status(jump_flag_conditional_status),.jump_address(jump_address),.counter_out(counter_out));
    
    jump_code jc(.instr_set(instruction_wire),.addr_set(address_wire),.uncon_jump_enable(jump_flag_unconditional),.con_jump_enable(jump_flag_conditional));
    
    program_sorter ps(.instr_set(instruction_wire),.addr_set(address_wire),.alu_loc(instruction_alu),.alu_addr(address_alu),.lsu_loc(instruction_lsu),.lsu_addr(address_lsu),.clk_not(clk_not));
    
            
endmodule