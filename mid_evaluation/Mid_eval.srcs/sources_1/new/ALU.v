`timescale 1ns / 1ps
`include "Operators.v"
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/21/2025 08:36:23 PM
// Design Name: 
// Module Name: Function_selector
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
module dec1x17(
    input  x,
    input [4:0] sel,
    output a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,ua1,ua2,
    output [16:0] ans
);

assign a1 =x &(sel[0])&(~sel[1])&(~sel[2])&(~sel[3]);
assign ua1 =x &(sel[0])&(~sel[1])&(~sel[2])&(~sel[3])&(sel[4]);
assign a2 =x &(~sel[0])&(sel[1])&(~sel[2])&(~sel[3]);
assign ua2 =x &(~sel[0])&(sel[1])&(~sel[2])&(~sel[3])&(sel[4]);
assign a3 =x &(sel[0])&(sel[1])&(~sel[2])&(~sel[3]);
assign a4 =x &(~sel[0])&(~sel[1])&(sel[2])&(~sel[3]);
assign a5 =x &(sel[0])&(~sel[1])&(sel[2])&(~sel[3]);
assign a6 =x &(~sel[0])&(sel[1])&(sel[2])&(~sel[3]);
assign a7 =x &(sel[0])&(sel[1])&(sel[2])&(~sel[3]);
assign a8 =x &(~sel[0])&(~sel[1])&(~sel[2])&(sel[3]);
assign a9 =x &(sel[0])&(~sel[1])&(~sel[2])&(sel[3]);
assign a10 =x &(~sel[0])&(sel[1])&(~sel[2])&(sel[3]);
assign a11 =x &(sel[0])&(sel[1])&(~sel[2])&(sel[3]);
assign a12 =x &(sel[0])&(sel[1])&(sel[2])&(sel[3]);
assign a13 =x &(sel[0])&(~sel[1])&(sel[2])&(sel[3]);
assign a14 =x &(~sel[0])&(sel[1])&(sel[2])&(sel[3]);
assign a15 =x &(sel[0])&(sel[1])&(sel[2])&(sel[3]);
assign ans[0] = (sel[0])&(~sel[1])&(~sel[2])&(~sel[3]);
assign ans[1] =(~sel[0])&(sel[1])&(~sel[2])&(~sel[3]);
assign ans[2] =(sel[0])&(sel[1])&(~sel[2])&(~sel[3]);
assign ans[3] =(~sel[0])&(~sel[1])&(sel[2])&(~sel[3]);
assign ans[4] =(sel[0])&(~sel[1])&(sel[2])&(~sel[3]);
assign ans[5] =(~sel[0])&(sel[1])&(sel[2])&(~sel[3]);
assign ans[6] =(sel[0])&(sel[1])&(sel[2])&(~sel[3]);
assign ans[7] =(~sel[0])&(~sel[1])&(~sel[2])&(sel[3]);
assign ans[8] =(sel[0])&(~sel[1])&(~sel[2])&(sel[3]);
assign ans[9] =(~sel[0])&(sel[1])&(~sel[2])&(sel[3]);
assign ans[10] =(sel[0])&(sel[1])&(~sel[2])&(sel[3]);
assign ans[11] =(~sel[0])&(~sel[1])&(sel[2])&(sel[3]);
assign ans[12] =(sel[0])&(~sel[1])&(sel[2])&(sel[3]);
assign ans[13] =(~sel[0])&(sel[1])&(sel[2])&(sel[3]);
assign ans[14] =(sel[0])&(sel[1])&(sel[2])&(sel[3]);
assign ans[15] =(sel[0])&(~sel[1])&(~sel[2])&(~sel[3])&(sel[4]);
assign ans[16] =(sel[0])&(~sel[1])&(~sel[2])&(~sel[3])&(sel[4]);

endmodule




module functionselector_8bit(
    input signed [7:0] x,
    input [4:0] sel,// select lines
    output [7:0] a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,ua1,ua2,
    output [16:0] ans
    );
    

//dec1x17 bit0 (x[0],sel,a1[0],a2[0],a3[0],a4[0],a5[0],a6[0],a7[0],a8[0],a9[0],a10[0],a11[0]);
    dec1x17 bit1(.x(x[0]),.sel(sel),.a1(a1[0]),.a2(a2[0]),.a3(a3[0]),.a4(a4[0]),.a5(a5[0]),.a6(a6[0]),.a7(a7[0]),.a8(a8[0]),.a9(a9[0]),.a10(a10[0]),.a11(a11[0]),.a12(a12[0]),.a13(a13[0]),.a14(a14[0]),.a15(a15[0]),.ua1(ua1[0]),.ua2(ua2[0]));
    dec1x17 bit2(.x(x[1]),.sel(sel),.a1(a1[1]),.a2(a2[1]),.a3(a3[1]),.a4(a4[1]),.a5(a5[1]),.a6(a6[1]),.a7(a7[1]),.a8(a8[1]),.a9(a9[1]),.a10(a10[1]),.a11(a11[1]),.a12(a12[1]),.a13(a13[1]),.a14(a14[1]),.a15(a15[1]),.ua1(ua1[1]),.ua2(ua2[1]));
    dec1x17 bit3(.x(x[2]),.sel(sel),.a1(a1[2]),.a2(a2[2]),.a3(a3[2]),.a4(a4[2]),.a5(a5[2]),.a6(a6[2]),.a7(a7[2]),.a8(a8[2]),.a9(a9[2]),.a10(a10[2]),.a11(a11[2]),.a12(a12[2]),.a13(a13[2]),.a14(a14[2]),.a15(a15[2]),.ua1(ua1[2]),.ua2(ua2[2]));
    dec1x17 bit4(.x(x[3]),.sel(sel),.a1(a1[3]),.a2(a2[3]),.a3(a3[3]),.a4(a4[3]),.a5(a5[3]),.a6(a6[3]),.a7(a7[3]),.a8(a8[3]),.a9(a9[3]),.a10(a10[3]),.a11(a11[3]),.a12(a12[3]),.a13(a13[3]),.a14(a14[3]),.a15(a15[3]),.ua1(ua1[3]),.ua2(ua2[3]));
    dec1x17 bit5(.x(x[4]),.sel(sel),.a1(a1[4]),.a2(a2[4]),.a3(a3[4]),.a4(a4[4]),.a5(a5[4]),.a6(a6[4]),.a7(a7[4]),.a8(a8[4]),.a9(a9[4]),.a10(a10[4]),.a11(a11[4]),.a12(a12[4]),.a13(a13[4]),.a14(a14[4]),.a15(a15[4]),.ua1(ua1[4]),.ua2(ua2[4]));
    dec1x17 bit6(.x(x[5]),.sel(sel),.a1(a1[5]),.a2(a2[5]),.a3(a3[5]),.a4(a4[5]),.a5(a5[5]),.a6(a6[5]),.a7(a7[5]),.a8(a8[5]),.a9(a9[5]),.a10(a10[5]),.a11(a11[5]),.a12(a12[5]),.a13(a13[5]),.a14(a14[5]),.a15(a15[5]),.ua1(ua1[5]),.ua2(ua2[5]));
    dec1x17 bit7(.x(x[6]),.sel(sel),.a1(a1[6]),.a2(a2[6]),.a3(a3[6]),.a4(a4[6]),.a5(a5[6]),.a6(a6[6]),.a7(a7[6]),.a8(a8[6]),.a9(a9[6]),.a10(a10[6]),.a11(a11[6]),.a12(a12[6]),.a13(a13[6]),.a14(a14[6]),.a15(a15[6]),.ua1(ua1[6]),.ua2(ua2[6]));
    dec1x17 bit8(.x(x[7]),.sel(sel),.a1(a1[7]),.a2(a2[7]),.a3(a3[7]),.a4(a4[7]),.a5(a5[7]),.a6(a6[7]),.a7(a7[7]),.a8(a8[7]),.a9(a9[7]),.a10(a10[7]),.a11(a11[7]),.a12(a12[7]),.a13(a13[7]),.a14(a14[7]),.a15(a15[7]),.ua1(ua1[7]),.ua2(ua2[7]));
endmodule

module and_8bit
(
    input [7:0] in,
    input x,
    output [7:0] out
);

assign out[0] = in[0] &x;
assign out[1] = in[1] &x;
assign out[2] = in[2] &x;
assign out[3] = in[3] &x;
assign out[4] = in[4] &x;
assign out[5] = in[5] &x;
assign out[6] = in[6] &x;
assign out[7] = in[7] &x;

endmodule

module final_out
(   
    input [7:0] a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12,a13,a14,a15,ua1,ua2,
    input [16:0] sel,
    output [7:0] out
);
    wire [7:0] a1_,a2_,a3_,a4_,a5_,a6_,a7_,a8_,a9_,a10_,a11_,a12_,a13_a14_,a15_,ua1_,ua2_ ;
and_8bit b1(.in(a1),.x(sel[0]),.out(a1_));
and_8bit b2(.in(a2),.x(sel[1]),.out(a2_));
and_8bit b3(.in(a3),.x(sel[2]),.out(a3_));
and_8bit b4(.in(a4),.x(sel[3]),.out(a4_));
and_8bit b5(.in(a5),.x(sel[4]),.out(a5_));
and_8bit b6(.in(a6),.x(sel[5]),.out(a6_));
and_8bit b7(.in(a7),.x(sel[6]),.out(a7_));
and_8bit b8(.in(a8),.x(sel[7]),.out(a8_));
and_8bit b9(.in(a9),.x(sel[8]),.out(a9_));
and_8bit b10(.in(a10),.x(sel[9]),.out(a10_));
and_8bit b11(.in(a11),.x(sel[10]),.out(a11_));
and_8bit b12(.in(a12),.x(sel[11]),.out(a12_));
and_8bit b13(.in(a13),.x(sel[12]),.out(a13_));
and_8bit b14(.in(a14),.x(sel[13]),.out(a14_));
and_8bit b15(.in(a15),.x(sel[14]),.out(a15_));
and_8bit b16(.in(ua1),.x(sel[15]),.out(ua1_));
and_8bit b17(.in(ua2),.x(sel[16]),.out(ua2_));

assign out = a1_ | a2_ | a3_ | a4_ | a5_ | a6_ | a7_ | a8_ | a9_ | a10_ | a11_| a12_| a13_| a14_| a15_| ua1_| ua2_;



endmodule






module alu_selector
(
    input [7:0] instruct, address,
    input [7:0] data1,data2,
   //inout signed [7:0] ans_add,ans_sub,ans_mul,ans_div,ans_comp,ans_equal,ans_right,ans_left,ans_and,ans_or,ans_not,
    output [7:0] ans,
   output [2:0] wr1,wr2,
   output [1:0] dr
    );

assign wr1 = address[7:5];
assign wr2 = address[4:2];
assign dr = address [1:0];

wire [3:0] sel;
assign sel[0] = instruct[0];
assign sel[1] = instruct[1];
assign sel[2] = instruct[2];
assign sel[3] = instruct[3];
wire [7:0] data2_and, data2_process;
wire constant,constant_not;
assign constant = instruct[6];
assign constant_not = ~instruct[6];
assign data2_and[0] = data2[0] & constant_not;
assign data2_and[1] = data2[1] & constant_not;
assign data2_and[2] = data2[2] & constant_not;
assign data2_and[3] = data2[3] & constant_not;
assign data2_and[4] = data2[4] & constant_not;
assign data2_and[5] = data2[5] & constant_not;
assign data2_and[6] = data2[6] & constant_not;
assign data2_and[7] = data2[7] & constant_not;


wire [7:0] address_checker;
assign address_checker[0] = address[0] & constant;
assign address_checker[1] = address[1] & constant;
assign address_checker[2] = address[2] & constant;
assign address_checker[3] = address[3] & constant;
assign address_checker[4] = address[4] & constant;
assign address_checker[5] = address[5] & constant;
assign address_checker[6] = address[6] & constant;
assign address_checker[7] = address[7] & constant;
assign data2_process = data2_and | address_checker;

    wire [7:0] add1,sub1,mul1,div1,comp1,eq1,bar1,bal1,i1,d1,bo1,ba1,bn1,blr1,bll1,uadd1,usub1,add2,sub2,mul2,div2,comp2,eq2,bar2,bal2,i2,d2bo2,ba2,blr2,bll2,uadd2,usub2;
    wire [16:0] ans_sel;
//wire signed [7:0] ans_add,ans_sub,ans_mul,ans_div,and_comp,ans_equal,ans_right,ans_left,ans_and,ans_or,ans_not;
    wire [7:0] ans_add,ans_sub,ans_mul,ans_div,ans_comp,ans_equal,ans_aright,ans_aleft,ans_i,ans_d,ans_and,ans_or,ans_not,ans_lright,ans_lleft,ans_uadd,ans_usub;
    functionselector_8bit data_1(.x(data1),.sel(sel),.a1(add1),.a2(sub1),.a3(mul1),.a4(div1),.a5(comp1),.a6(eq1),.a7(bar1),.a8(bal1),.a9(i1),.a10(d1),.a11(bo1),.a12(ba1),.a13(bn1),.a14(blr1),.a15(bll1),.ua1(uadd1),.ua2(usub1),.ans(ans_sel));
    functionselector_8bit data_2(.x(data2_process),.sel(sel),.a1(add2),.a2(sub2),.a3(mul2),.a4(div2),.a5(comp2),.a6(eq2),.a7(bar2),.a8(bal2),.a9(i2),.a10(d2),.a11(bo2),.a12(ba2),.a14(blr2),.a15(bll2),.ua1(uadd2),.ua2(usub2));



adder_subtractor_8bit add(.A(add1),.B(add2),.S(ans_add),.mode(0));
adder_subtractor_8bit sub(.A(sub1),.B(sub2),.S(ans_sub),.mode(1));
    adder_8bit uadd(.A(uadd1),.B(uadd2),.S(ans_uadd));
    sub_8bit usub(.A(usub1),.B(usub2),.S(ans_usub));
    incrementer_8bit i(.A(i1),.B(i2),.S(ans_i));
    decrement_8bit d(.A(d1),.B(d2),.S(ans_d));
multiplier mul(.a(mul1),.b(mul2),.product(ans_mul));
divider div(.dividend(div1),.divisor(div2),.quotient(ans_div));
comp comparision(.a(comp1),.b(comp2),.ans(ans_comp));
eq equalto(.a(eq1),.b(eq2),.ans(ans_equal));
and_op and_op1(.a(ba1),.b(ba2),.ans(ans_and));
or_op opor(.a(bo1),.b(bo2),.ans(ans_or));
not_op opnot(.a(bn1),.ans(ans_not));
    logical_left_shift lls(.a(bll1),.b(bll2),.product(ans_lleft));
    logical_right_shift lrs(.a(blr1),.b(blr2),.product(ans_lright));
    arithmetic_left_shift als(.a(bal1),.b(bal2),.product(ans_aleft));
    arithmetic_right_shift ars(.a(bar1),.b(bar2),.product(ans_aright));



    final_out out_8bit(.a1(ans_add),.a2(ans_sub),.a3(ans_mul),.a4(ans_div),.a5(ans_comp),.a6(ans_equal),.a7(ans_aright),.a8(ans_aleft),.a9(ans_i),.a10(ans_d),.a11(ans_or),.a12(ans_and),.a13(ans_not),.a14(ans_lright),.a15(ans_lleft),.ua1(ans_uadd),.ua2(ans_usub),.sel(ans_sel),.out(ans));


//wire signed [7:0] ans_add_selected,ans_sub_selected;//,ans_mul_selected,ans_div_selected,and_comp_selected,ans_equal_selected,ans_right_selected,ans_left_selected,ans_and_selected,ans_or_selected,ans_not_selected;
//assign ans_add_selected = ans_add & {8{ans_sel[0]}};
//assign ans_sub_selected = ans_sub & {8{ans_sel[1]}};
////assign ans_mul_selected = ans_mul & {8{ans_sel[2]}};
////assign ans_div_selected = ans_div & {8{ans_sel[3]}};
////assign ans_comp_selected = ans_comp & {8{ans_sel[4]}};
////assign ans_eq_selected = ans_equal & {8{ans_sel[5]}};
////assign ans_br_selected = ans_right & {8{ans_sel[6]}};
////assign ans_bl_selected = ans_left & {8{ans_sel[7]}};
////assign ans_or_selected = ans_or & {8{ans_sel[8]}};
////assign ans_and_selected = ans_and & {8{ans_sel[9]}};
////assign ans_not_selected = ans_not & {8{ans_sel[10]}};

//assign ans = ans_add_selected|ans_sub_selected;//|ans_and_selected|ans_or_selected|ans_bl_selected|ans_br_selected|ans_eq_selected|ans_comp_selected|ans_div_selected|ans_mul_selected|ans_sub_selected;

endmodule





