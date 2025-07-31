`timescale 1ns / 1ps

module program_counter_tb;
    reg [7:0] mem [15:0];
    reg clk = 0;
    reg clk_not = 1;
    reg [7:0] data;
    reg [7:0] jump_address_in;
    reg [7:0] counter_out_i;
    wire [7:0] counter_out;
    wire [7:0] instruction_alu, address_alu, instruction_lsu, address_lsu;
    wire [7:0] instruction,address;

    // Instantiate the program_counter
    program_counter uut (
        .data_raw(data),
        .clk(clk),
        .clk_not(clk_not),
        .jump_address_in(jump_address_in),
        .counter_out(counter_out),
        .instruction_alu(instruction_alu),
        .address_alu(address_alu),
        .instruction_lsu(instruction_lsu),
        .address_lsu(address_lsu),
        .instruction_wire(instruction),
        .address_wire(address)
    );

    // Clock generation
    always #5 begin  clk = ~clk;end
    
    
    always @(negedge clk) begin
        #0.02 clk_not =1;
        # 4.96 clk_not =0;
    end
    
     initial begin
    $readmemb("memory.mem",mem);
    
    end
//    initial begin
//        $display("Time\tPC\tInstr_ALU\tAddr_ALU\tInstr_LSU\tAddr_LSU");
//        $monitor("%g\t%h\t%h\t%h\t%h\t%h", $time, counter_out, instruction_alu, address_alu, instruction_lsu, address_lsu);

//        // Reset everything
//        data = 8'b00000000;
//        jump_address_in = 8'b00000000;

//        // Normal instruction: ALU (MSB = 0)
//        #5 data = 8'b00011001; // Example ALU instruction
//        #5 data = 8'b10101010; // Corresponding address

//        // LSU instruction: (MSB = 1)
//        #5 data = 8'b10010001;
//        #5 data = 8'b11110000;

//        // Unconditional jump instruction: jump_id=2'b11, con_uncon_id=3'b010
//        #5 data = 8'b11010000; // Instr triggers uncon_jump
//        #5 data = 8'b00001111; // Jump address
//        jump_address_in = 8'b00001111;

//        // Conditional jump with success: jump_id=2'b11, con_uncon_id=3'b001
//        #5 data = 8'b11001000;
//        #5 data = 8'b11110000;
//        jump_address_in = 8'b11110000;

//        // Conditional jump with failure: just for test
//        // [Assume condition signal handled internally, just test address load]
//        #5 data = 8'b11001000;
//        #5 data = 8'b00000011;
//        jump_address_in = 8'b00000011;

//        // Finish simulation
//        #100 $finish;
//    end

    always @(posedge clk) begin
        
        data <= mem[counter_out];
    end
    
    always @(posedge clk_not) begin
        
        data <= mem[counter_out];
    end
       
//    initial begin
//        #30 $finish;
//    end
       
       
endmodule

