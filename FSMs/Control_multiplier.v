module control_unit(
    input start,Q0,zero, //external inputs
    input clk,reset, //other inputs
    output ready,decr_pointer,shift_regs, //moore type outputs
    output load_regs,add_regs //melay type outputs
);
wire net1,net2,net3,net4,net5;
wire idle_net, add_net, shift_net;
wire [1:0]state;

assign idle_net = 1'b0;
assign shift_net = 1'b0;
assign add_net = 1'b0;

and(net1, state[0], ~state[1], start);
and(net2, ~state[0], ~start, state[1]);
or(net3, net1, net2);

/*
module D_FF(
    input D,clk,reset,
    output reg Q
);
*/

D_FF D0(
    .D(net3), .clk(clk), .reset(reset),
    .Q(state[0])
);

D_FF D1(
    .D(add_net), .clk(clk), .reset(reset),
    .Q(state[1])
);

/*
decoder - decodes the output of flip flops into 
induvidual wires that represent each state of the control
fsm
/*

module decoder(
    input [1:0] state,
    output State_idle, state_add, state_shift
);
*/

decoder D(
    .state(state),
    .State_idle(idle_net),
    .state_add(add_net),
    .state_shift(shift_net)
);

/*
Outputs of the control system - control outputs
*/

//moore outputs
assign ready = idle_net;
assign decr_pointer = add_net;
assign shift_regs = shift_net;

//melay outputs
and(load_regs, start, idle_net);
and(add_regs, add_net, Q0);

endmodule 



