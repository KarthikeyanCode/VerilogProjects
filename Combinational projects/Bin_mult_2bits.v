//two bit binary multiplier
module bin_multiplier(
    input [1:0] A,
    input [1:0] B,
    output [3:0] out;//output is 7bits because 4 + 3(shifts in one position
    //for successive bits from lsb to msb) + 1(final carry) = 8.
);

wire net1,net2,net3,net4;
assign out[0] = (A[0] & B[0]);
assign net1 = A[0] & B[1];
assign net2 = A[1] & B[0];
Half_Adder H0(net1,net2,out[1],net3);
assign net4 = A[1] & B[1];
Half_Adder H1(net3, net4, out[2], out[3]);

endmodule 


