`timescale 1ns / 1ps

module counter
(   
    input clk,clk_not,jump_flag_unconditional, jump_flag_conditional, jump_flag_conditional_status,
    input [7:0] jump_address, 
    output reg [7:0] counter_out
);
    
    wire jump_flag = jump_flag_unconditional |jump_flag_conditional;
    initial begin
    counter_out = 8'b00000000;
    end
    
    always @(posedge clk) begin
        
        if (~jump_flag) begin
            counter_out = counter_out + 8'b00000001;
        end
        
            
    end
    
    always @(posedge clk_not) begin
        if (~jump_flag) begin
            counter_out = counter_out + 8'b00000001;
        end
        else if (jump_flag & jump_flag_unconditional) begin
            counter_out = counter_out + 8'b00000001;
            
            counter_out = jump_address;
        end
        
    end
     always @(posedge clk_not) begin
     
       if (jump_flag & jump_flag_conditional&jump_flag_conditional_status) begin
            counter_out = jump_address;
            
       end
       else if (jump_flag & jump_flag_conditional&(~jump_flag_conditional_status)) begin
            counter_out = counter_out + 8'b00000001;
       end
       
        
    end
endmodule


module jump_code(
    input [7:0] instr_set,
    input [7:0] addr_set,
    output reg jump_enable,
    output reg uncon_jump_enable,
    output reg con_jump_enable
   
);

    wire [1:0] jump_id = instr_set[7:6];
    wire [1:0] con_uncon_id = instr_set[3:2];

    always @(*) begin
       
        jump_enable = 0;
        uncon_jump_enable = 0;
        con_jump_enable = 0;
       
       
        if ((jump_id == 2'b11) && (con_uncon_id == 2'b10)) begin
            #0.05;
            jump_enable = 1;
            uncon_jump_enable = 1;
            
        end

       
        else if ((jump_id == 2'b11) && (con_uncon_id == 3'b01)) begin
            #0.05;
            jump_enable = 1;
            con_jump_enable = 1;
            
        end
    end

endmodule

module program_sorter
(
input[7:0] instr_set,
input[7:0] addr_set,
output lsu_enable,
output alu_enable,
output reg [7:0] alu_loc,
output reg [7:0] lsu_loc,
output reg [7:0] alu_addr,
output reg [7:0] lsu_addr,
input clk_not
);

wire opcode;
assign opcode= instr_set[7];

wire [7:0] clk = {8{clk_not}};

always @(posedge clk_not) begin

alu_loc = instr_set&{8{(~opcode)}};
alu_addr = addr_set&{8{(~opcode)}};
lsu_loc = instr_set&{8{(opcode)}};
lsu_addr = addr_set&{8{(opcode)}};

end

endmodule
