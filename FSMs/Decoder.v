module decoder(
    input [1:0] state,
    output state_idle, state_add, state_shift
);
assign state_idle = 1'b0;
assign state_add = 1'b0;
assign state_shift = 1'b0;

assign state_idle = ~state[1] & ~state[0];
assign state_add = ~state[1] & state[0];
assign state_shift = state[1] & state[0];

endmodule 