//1 bit adder .. i.e adds 3 bits 
module fpga_adder_1bit(
    input A,
    input B,
    input C,
    output sum,carry
);

wire net1,net2,net3;

xor(net1, A, B);
and(net2, A, B);
xor(sum, C, net1);
and(net3, net1, C);
or(carry, net3, net2);

endmodule 

