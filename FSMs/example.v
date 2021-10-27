module count_ones(
    input bits,clk1,clk2,
    input reset,
    output reg [3:0]count//
);
wire net1,net2,net3;
reg state 1'b0;

and(net1, 1, bits);

/*
module D_FF(
    input D,clk,reset,
    output reg Q
);

always @(posedge clk) begin
    if(~reset)
        Q <= 0 
    else if(D==1'b1)
        Q <= 1;
    else 
        Q <= 0;
end

endmodule 
*/

D_FF D(
    .D(net1), .clk(clk1), .reset(reset),
    .Q(net2)
);

and(net3, clk2, net2);

/*
module four_bit_counter(
    input in, clk, reset,
    output [3:0]count
);
*/

four_bit_counter F(
    .in(1), .clk(net3), .reset(reset),
    .count(count)
);

endmodule 