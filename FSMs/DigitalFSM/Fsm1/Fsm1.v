module Fsm1(
    input x, y, clk, reset, 
    output [1:0]Q
);

wire D1in, D0in; //input to FFs

assign D1in = (~Q[1] & Q[0]) | (Q[0] & x);
assign D0in = (x & y) | (~Q[1] & Q[0] & y) | (~Q[1] & ~Q[0] & x);

D_FF D1(.in(D1in), .clk(clk), .reset(reset), .Q(Q[1]));
D_FF D0(.in(D0in), .clk(clk), .reset(reset), .Q(Q[0]));


endmodule 