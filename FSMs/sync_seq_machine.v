module sync_seq_machine(
    input in,clk,reset,
    output out//final output
);

wire net1,net2,net3;
// wire state[2:0];
// assign state[0] = 1'b0;
// assign state[1] = 1'b0;
// assign state[2] = 1'b0;
wire Qa,Qb,Qc;
assign Qa = 1'b0;
assign Qb = 1'b0;
assign Qc = 1'b0;
/*
module D_FF(
    input D,clk,reset,
    output reg Q
);
inputs to FF are:
net4,net6,net7
*/

//combinational part - next state logic
assign net1 = Qa;
assign net2 = (~Qc & in) | (Qa & Qb & in);
assign net3 = Qb | ~(Qb | in);

//sequential part - state is noted
D_FF Da(
    .D(net1),
    .clk(clk),
    .reset(reset),
    .Q(Qa)
);

D_FF Db(
    .D(net2),
    .clk(clk),
    .reset(reset),
    .Q(Qb)
);

D_FF Dc(
    .D(net3),
    .clk(clk),
    .reset(reset),
    .Q(Qc)
);

//output logic 
assign out = Qa;

/*calculating the present state 
assign Qa = state[2];
assign Qb = state[1];
assign Qc = state[0];
*/

endmodule 