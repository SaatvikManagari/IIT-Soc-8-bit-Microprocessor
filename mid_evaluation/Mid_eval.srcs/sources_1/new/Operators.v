`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/25/2025 09:15:19 PM
// Design Name: 
// Module Name: Operators
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

// Divider Ciruit

module divider (
    input  wire signed [7:0] dividend,
    input  wire signed [7:0] divisor,
    output wire signed [7:0] quotient,
    output wire signed [7:0] remainder
);
    assign quotient  = (divisor != 0) ? (dividend / divisor) : 8'sd0;
    assign remainder = (divisor != 0) ? (dividend % divisor) : 8'sd0;
endmodule


// ADDER AND SUBTRACTER
module cla4 (
    input  [3:0] A, B,
    input        C0,
    output [3:0] S,
    output       C4
);
    wire [3:0] G, P;
    wire       C1, C2, C3;

    assign G = A & B;        // Generate
    assign P = A ^ B;        // Propagate

    assign C1 = G[0] | (P[0] & C0);
    assign C2 = G[1] | (P[1] & C1);
    assign C3 = G[2] | (P[2] & C2);
    assign C4 = G[3] | (P[3] & C3);

    assign S[0] = P[0] ^ C0;
    assign S[1] = P[1] ^ C1;
    assign S[2] = P[2] ^ C2;
    assign S[3] = P[3] ^ C3;
endmodule

module adder_subtractor_8bit (
    input  [7:0] A,
    input  [7:0] B,
    input        mode, // 0 for addition, 1 for subtraction
    output [7:0] S,
    output       Cout,
    output       Overflow
);
    wire [7:0] B_in;
    wire       C4;

    // XOR B with mode to invert B if mode is 1 (for subtraction)
    assign B_in = B ^ {8{mode}};

    // Lower 4-bit CLA
    wire [3:0] S1;
    wire       C1;
    cla4 cla_lower (
        .A(A[3:0]),
        .B(B_in[3:0]),
        .C0(mode), // Initial carry-in is mode
        .S(S1),
        .C4(C1)
    );

    // Upper 4-bit CLA
    wire [3:0] S2;
    cla4 cla_upper (
        .A(A[7:4]),
        .B(B_in[7:4]),
        .C0(C1),
        .S(S2),
        .C4(C4)
    );

    assign S = {S2, S1};
    assign Cout = C4;

    // Overflow detection for signed numbers
    assign Overflow = (A[7] ^ B_in[7] ^ mode) & ~(A[7] ^ S[7]);
endmodule
//Multiplier

module multiplier (
    input  signed [7:0] a,
    input  signed [7:0] b,
    output signed [7:0] product,
    output              overflow
);
    wire signed [15:0] full_product = a * b;

    assign product = full_product[7:0];

    // Correct signed overflow detection
    assign overflow = (full_product > 127) || (full_product < -128);
endmodule

// Compare >


module comp (
    input  signed [7:0] a,
    input  signed [7:0] b,
    output signed [7:0] ans
);
    
    assign ans = (a>b);
    
endmodule


module eq (
    input  signed [7:0] a,
    input  signed [7:0] b,
    output signed [7:0] ans
);
   
   
    assign ans= (a==b);
endmodule



module and_op (
    input  signed [7:0] a,
    input  signed [7:0] b,
    output signed [7:0] ans
);
   
    
    assign ans = (a&b);
    
endmodule


module or_op (
    input  signed [7:0] a,
    input  signed [7:0] b,
    output signed [7:0] ans
);
   
    assign ans = (a|b);
endmodule


module not_op (
    input  signed [7:0] a,
    
    output signed [7:0] ans
);
   
    assign ans =( ~a);
endmodule


