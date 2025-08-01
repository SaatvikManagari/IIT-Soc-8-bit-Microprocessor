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
reg [7:0] memory_data [255:0];
reg [7:0] data_raw;
reg [7:0] memory_read;
wire [7:0] memory_request,memory_write,memory_write_address,counter_out;
reg clk =1 ,clk_not =1;
wire [1:0] memory_write_status;

processor test(.data(data_raw),.memory_read(memory_read),.memory_request(memory_request),.memory_write(memory_write),.memory_write_address(memory_write_address),.counter_out(counter_out),.clk(clk),.clk_not(clk_not),.memory_function(memory_write_status));

always begin #2.5 clk = ~clk;end
    
    
always @(negedge clk) begin
        #0.02 clk_not =1;
        # 2.46 clk_not =0;
    end
    
    
initial begin
    $readmemb("memory.mem",memory);
end

always @(negedge clk_not) begin 
    $readmemb("memory_data.mem",memory_data);
end

always @(posedge clk) begin data_raw <= memory[counter_out]; end

always @(negedge clk) begin 
data_raw <= memory[counter_out]; 
end

always @(posedge clk_not) begin
    if (memory_write_status) begin
        memory_data[memory_write_address] = memory_write; 
    end
end

always @(posedge clk_not) begin
    if (memory_write_status == 2'b01) begin
        memory_read = memory_data[memory_request]; 
    end 
    else if (memory_write_status == 2'b10) begin
        memory_data[memory_write_address] = memory_write; 
    end 
end 

endmodule