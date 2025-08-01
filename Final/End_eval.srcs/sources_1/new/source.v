`timescale 1ns / 1ps

module d_flip_flop(
    input D,clk,
    output Q,Q_not

    );
    
wire w1,w2,D_not;
not(D_not,D);
nand(w1,D,clk);
nand(w2,D_not,clk);
nand(Q,Q_not,w1);
nand(Q_not,w2,Q);

endmodule

// Register module 8-bits

module register_8bit
(
    input [7:0] D,
    input clk,
    output [7:0] reset,
    output [7:0] Q
);

//
    d_flip_flop bit1(.D(D[0]),.clk(clk),.Q(Q[0]),.Q_not(reset[0]));
    d_flip_flop bit2(.D(D[1]),.clk(clk),.Q(Q[1]),.Q_not(reset[1]));
    d_flip_flop bit3(.D(D[2]),.clk(clk),.Q(Q[2]),.Q_not(reset[2]));
    d_flip_flop bit4(.D(D[3]),.clk(clk),.Q(Q[3]),.Q_not(reset[3]));
    d_flip_flop bit5(.D(D[4]),.clk(clk),.Q(Q[4]),.Q_not(reset[4]));
    d_flip_flop bit6(.D(D[5]),.clk(clk),.Q(Q[5]),.Q_not(reset[5]));
    d_flip_flop bit7(.D(D[6]),.clk(clk),.Q(Q[6]),.Q_not(reset[6]));
    d_flip_flop bit8(.D(D[7]),.clk(clk),.Q(Q[7]),.Q_not(reset[7]));

endmodule

//Multiplexers 4 into 1

module mux4x1
(
    input a1,a2,a3,a4,
    input s1,s2,
    output out
);

//intermediate wires
wire w1,w2,w3,w4;
wire ns1,ns2;

//operations
not(ns1,s1);
not(ns2,s2);
and(w1,ns1,ns2,a1);
and(w2,ns1,s2,a2);
and(w3,s1,ns2,a3);
and(w4,s1,s2,a4);
or(out,w1,w2,w3,w4);

endmodule

// Multiplexers 8 into 1
module mux8x1
(
    input a1,a2,a3,a4,a5,a6,a7,a8,
    input s1,s2,s3,
    output out
);

wire w1,w2,w3,w4,w5,w6,w7,w8;
wire ns1,ns2,ns3;
not(ns1,s1);
not(ns2,s2);
not(ns3,s3);
and(w1,ns1,ns2,ns3,a1);
and(w2,ns1,ns2,s3,a2);
and(w3,ns1,s2,ns3,a3);
and(w4,ns1,s2,s3,a4);
and(w5,s1,ns2,ns3,a5);
and(w6,s1,ns2,s3,a6);
and(w7,s1,s2,ns3,a7);
and(w8,s1,s2,s3,a8);
or(out,w1,w2,w3,w4,w5,w6,w7,w8);

endmodule

module mux32x8
(
    input [7:0] d1,d2,d3,d4,
    output [7:0] out,
    input s1,s2
);

mux4x1 bit1(.a1(d1[0]),.a2(d2[0]),.a3(d3[0]),.a4(d4[0]),.s1(s1),.s2(s2),.out(out[0]));
mux4x1 bit2(.a1(d1[1]),.a2(d2[1]),.a3(d3[1]),.a4(d4[1]),.s1(s1),.s2(s2),.out(out[1]));
mux4x1 bit3(.a1(d1[2]),.a2(d2[2]),.a3(d3[2]),.a4(d4[2]),.s1(s1),.s2(s2),.out(out[2]));
mux4x1 bit4(.a1(d1[3]),.a2(d2[3]),.a3(d3[3]),.a4(d4[3]),.s1(s1),.s2(s2),.out(out[3]));
mux4x1 bit5(.a1(d1[4]),.a2(d2[4]),.a3(d3[4]),.a4(d4[4]),.s1(s1),.s2(s2),.out(out[4]));
mux4x1 bit6(.a1(d1[5]),.a2(d2[5]),.a3(d3[5]),.a4(d4[5]),.s1(s1),.s2(s2),.out(out[5]));
mux4x1 bit7(.a1(d1[6]),.a2(d2[6]),.a3(d3[6]),.a4(d4[6]),.s1(s1),.s2(s2),.out(out[6]));
mux4x1 bit8(.a1(d1[7]),.a2(d2[7]),.a3(d3[7]),.a4(d4[7]),.s1(s1),.s2(s2),.out(out[7]));

endmodule 


module mux64x8
(
    input [7:0] d1,d2,d3,d4,d5,d6,d7,d8,
    output [7:0] out,
    input s1,s2,s3
);

mux8x1 bit1(.a1(d1[0]),.a2(d2[0]),.a3(d3[0]),.a4(d4[0]),.a5(d5[0]),.a6(d6[0]),.a7(d7[0]),.a8(d8[0]),.s1(s1),.s2(s2),.s3(s3),.out(out[0]));
mux8x1 bit2(.a1(d1[1]),.a2(d2[1]),.a3(d3[1]),.a4(d4[1]),.a5(d5[1]),.a6(d6[1]),.a7(d7[1]),.a8(d8[1]),.s1(s1),.s2(s2),.s3(s3),.out(out[1]));
mux8x1 bit3(.a1(d1[2]),.a2(d2[2]),.a3(d3[2]),.a4(d4[2]),.a5(d5[2]),.a6(d6[2]),.a7(d7[2]),.a8(d8[2]),.s1(s1),.s2(s2),.s3(s3),.out(out[2]));
mux8x1 bit4(.a1(d1[3]),.a2(d2[3]),.a3(d3[3]),.a4(d4[3]),.a5(d5[3]),.a6(d6[3]),.a7(d7[3]),.a8(d8[3]),.s1(s1),.s2(s2),.s3(s3),.out(out[3]));
mux8x1 bit5(.a1(d1[4]),.a2(d2[4]),.a3(d3[4]),.a4(d4[4]),.a5(d5[4]),.a6(d6[4]),.a7(d7[4]),.a8(d8[4]),.s1(s1),.s2(s2),.s3(s3),.out(out[4]));
mux8x1 bit6(.a1(d1[5]),.a2(d2[5]),.a3(d3[5]),.a4(d4[5]),.a5(d5[5]),.a6(d6[5]),.a7(d7[5]),.a8(d8[5]),.s1(s1),.s2(s2),.s3(s3),.out(out[5]));
mux8x1 bit7(.a1(d1[6]),.a2(d2[6]),.a3(d3[6]),.a4(d4[6]),.a5(d5[6]),.a6(d6[6]),.a7(d7[6]),.a8(d8[6]),.s1(s1),.s2(s2),.s3(s3),.out(out[6]));
mux8x1 bit8(.a1(d1[7]),.a2(d2[7]),.a3(d3[7]),.a4(d4[7]),.a5(d5[7]),.a6(d6[7]),.a7(d7[7]),.a8(d8[7]),.s1(s1),.s2(s2),.s3(s3),.out(out[7]));

endmodule

module mux64x16
(
    input wire [7:0] q1,q2,q3,q4,q5,q6,q7,q8,
    input [2:0] sel1,sel2,
    output [7:0] out1,out2
);
mux64x8 out_put1(.d1(q1),.d2(q2),.d3(q3),.d4(q4),.d5(q5),.d6(q6),.d7(q7),.d8(q8), .s1(sel1[0]),.s2(sel1[1]),.s3(sel1[2]),.out(out1));
mux64x8 out_put2(.d1(q1),.d2(q2),.d3(q3),.d4(q4),.d5(q5),.d6(q6),.d7(q7),.d8(q8), .s1(sel2[0]),.s2(sel2[1]),.s3(sel2[2]),.out(out2));

endmodule 


module pipeline
(
 input [7:0] data,
 output [7:0] out,
 input clk,clk_not   
);

wire [7:0] data_transfer;
register_8bit first(.D(data),.Q(data_transfer),.clk(clk_not));
register_8bit second(.D(data_transfer),.Q(out),.clk(clk));
endmodule