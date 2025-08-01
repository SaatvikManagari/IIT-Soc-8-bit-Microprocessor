`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/01/2025 12:07:32 PM
// Design Name: 
// Module Name: testbench
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


module testbench;
reg [7:0] memory [255:0];
reg [7:0] data_raw;
reg [7:0] memory_read;
wire [7:0] memory_request,memory_write,memory_write_address,counter_out;
reg clk,clk_not;


processor test(.data(data_raw),.memory_read(memory_read),.memory_request(memory_request),.memory_write(memory_write),.memory_write_address(memory_write_address),.counter_out(counter_out));

always begin #2.5 clk = ~clk;end
    
    
always @(negedge clk) begin
        #0.02 clk_not =1;
        # 2.46 clk_not =0;
    end
    
    
initial begin
    $readmemb("memory.mem",memory);
end

always @(posedge clk) data_raw <= memory[counter_out];

always @(posedge clk_not) data_raw <= memory[counter_out];

    

endmodule
