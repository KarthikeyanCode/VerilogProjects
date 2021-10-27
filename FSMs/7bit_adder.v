module adder_7bit(
    input [6:0]A,B,
    output [7:0]out
);
wire net1,net2,net3,net4,net5,net6,net7;
wire net0;
assign net0 = 1'b0;
/*
module combinational_FA(
    input a,b,cin,
    output sum, cout
);
*/
combinational_FA F0(
    .a(A[0]), .b(B[0]), net0,
    out[0], net1
);

combinational_FA F1(
    .a(A[1]), .b(B[1]), net1,
    out[1], net2
);

combinational_FA F2(
    .a(A[2]), .b(B[2]), net2,
    out[2], net3
);

combinational_FA F3(
    .a(A[3]), .b(B[3]), net3,
    out[3], net4
);

combinational_FA F4(
    .a(A[4]), .b(B[4]), net4,
    out[4], net5
);

combinational_FA F5(
    .a(A[5]), .b(B[5]), net5,
    out[5], net6
);

combinational_FA F6(
    .a(A[6]), .b(B[6]), net6,
    out[6], out[7]
);

endmodule 







