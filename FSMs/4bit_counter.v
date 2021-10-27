module four_bit_counter(
    input in, clk, reset,
    output [3:0]count
);

T_FF T0(
    .in(in),
    .clk(clk),
    .reset(reset),
    .Q1(count[0])
);

T_FF T1(
    .in(in),
    .clk(~count[0]),
    .reset(reset),
    .Q1(count[1])
);

T_FF T2(
    .in(in),
    .clk(~count[1]),
    .reset(reset),
    .Q1(count[2])
);

T_FF T3(
    .in(in),
    .clk(~count[2]),
    .reset(reset),
    .Q1(count[3])
);

//TFF(input in,clk,reset output reg Q1);

endmodule
