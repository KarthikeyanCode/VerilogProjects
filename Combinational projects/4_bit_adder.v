module Adder_4bit(
    input [6:0]A;
    input [6:0]B;
    output [4:0] out;//one more bit including the carry
);
wire carry_in;
wire [3:0] carry_out;
assign carry_out = 4'b0000;
assign carry_in = 1'b0;

FullAdder F0(A[0],B[0],carry_in,out[0],carry_out[0]);
FullAdder F0(A[1],B[0],carry_in,out[0],carry_out[0]);
FullAdder F0(A[0],B[0],carry_in,out[0],carry_out[0]);
FullAdder F0(A[0],B[0],carry_in,out[0],carry_out[0]);


