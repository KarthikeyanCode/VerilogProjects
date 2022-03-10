//Zero detection circuit for the multiplier
//This is to detect when the multiplier has reached 0000 after downcounting
//this module is combinational

module ZeroDetection(
    input [3:0]in,
    output out
);

assign out = ~(((in[0] | in[1]) | in[2]) | in[3]);

endmodule





