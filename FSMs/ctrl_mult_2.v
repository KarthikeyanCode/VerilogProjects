//control system for seq binary multiplier using one FF per state method
module control_multiplier_2(
    input start,zero,Q0,//inputs
    input clk,reset,
    output ready,decr_p,shift_regs,//moore outputs
    output load_regs, add_regs//melay outputs
);

wire [15:0]net;//bunch of nets
reg [2:0]state;
//combinational part of fsm
and(net[0], ~start, state[0]);
and(net[1], zero, state[2]);
or(net[2], net[1], net[0]);

and(net[3], state[0], start);
and(net[4], ~zero, state[2]);
or(net[5], net[3], net[4]);

buf(net[6], state[1]);

//sequential part of fsm
always @(posedge clk) begin
    if(~reset) state <= 3'b000;
    else begin
        state[0] <= net[2];
        state[1] <= net[5];
        state[2] <= net[6];
    end
end

//output logic of fsm - control logic
//moore type outputs
//depends on present state only 
assign ready = state[0];
assign decr_p = state[1];
assign shift_regs = state[2];

//melay type outputs
//depends on present state and input 
and(load_regs, state[0], start);
and(add_regs, state[1], Q0);

endmodule 