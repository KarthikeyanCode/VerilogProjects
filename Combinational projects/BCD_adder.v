//working on bcd adder
module BCD_adder(
    input [3:0] A,
    input [3:0] B,
    output [3:0] C//final sum
);
wire carry_in;
wire carry_out;
wire [3:0]carry;
wire [3:0]sum_1;
wire [3:0]in;//the 0110 bcd - 6 that we shld add if binary value of sum is 
//greater than 9 or carry_out is obtained as 1
begin
assign carry_in = 0;//carry in is 0
FullAdder F0(A[0],B[0],carry_in,sum_1[0],carry[0]);
FullAdder F1(A[1],B[1],carry[0],sum_1[1],carry[1]);
FullAdder F2(A[2],B[2],carry[1],sum_1[2],carry[2]);
FullAdder F3(A[3],B[3],carry[2],sum_1[3],carry[3]);

assign carry_out = carry[3];

//computing whether to add 6 or not.., i.e number is greater than 9 or not
assign in[0] = 1'b0;
assign in[1] = carry_out | (sum_1[3] & sum_1[2]) | (sum_1[3] & sum_1[1]);
assign in[2] = carry_out | (sum_1[3] & sum_1[2]) | (sum_1[3] & sum_1[1]);
assign in[3] = 1'b0;


FullAdder F_0(sum_1[0],in[0],carry_in,C[0],carry[0]);
FullAdder F_1(sum_1[1],in[1],carry[0],C[1],carry[1]);
FullAdder F_2(sum_1[2],in[2],carry[1],C[2],carry[2]);
FullAdder F_3(sum_1[3],in[3],carry[2],C[3],carry[3]);

assign carry_out = carry[3];
end

endmodule 



