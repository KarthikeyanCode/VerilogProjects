module async_seq(
    input x1,x2,
    output y1,y2,z1
);

wire net1,net2,net3;
assign net1 = 0;
assign net2 = 0;
assign net3 = 0;

or(net1, ~x2, y2);
or(net2, y1, x2);
or(net3, x2, ~y1);

and(y1, x1, net1, net2);
and(y2, x1, net1, net3);
and(z1, x2, ~y2);


endmodule 