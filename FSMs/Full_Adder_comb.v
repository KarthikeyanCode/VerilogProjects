module combinational_FA(
    input a,b,cin,
    output sum, cout
);

wire net1,net2,net3,net4;

xor(net1,a,b);
and(net2,a,b);
and(net3,net1,cin);
or(cout,net2,net3);
xor(sum,net1,cin);

endmodule 


