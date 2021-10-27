//PISO shift register
module shift_register(
    input [3:0] D,
    input clk,reset,
    output out//the bit which is shifted out
);

wire net1,net2,net3,net4;

//parallel loading
assign Din = D[3];
assign net1 = D[2];
assign net2 = D[1];
assign net3 = D[0];

/*
module D_FF(
    input D,clk,reset,
    output reg Q
);
*/
//shifting bits
D_FF D0(
    .D(Din), .clk(clk), .reset(reset),
    .Q(net1)
);

D_FF D1(
    .D(net1), .clk(clk), .reset(reset),
    .Q(net2)
);

D_FF D2(
    .D(net2), .clk(clk), .reset(reset),
    .Q(net3)
);

D_FF D3(
    .D(net3), .clk(clk), .reset(reset),
    .Q(out)
);

endmodule 
