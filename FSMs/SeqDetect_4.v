//1011101 7-bit sequence detector sequential Circuit/FSM
module SeqDetect_7bit(
input in, 
input clk, 
output reg[2:0]state=0, 
output reg Q=0;


//next state logic
always @(posedge clk) begin//LSB T FF
    if((state[0] & state[1]) | (~state[2] & in & state[1]) | (state[0] & ~state[2] & ~in) | (state[0] & state[2] & in))
        state[0] <= ~state[0]; 
end

always @(posedge clk) begin//B bit T FF
    if((state[0] & state[1]) | (state[2] & ~in) | (~state[2] & in & state[1]) | state[0] & ~state[2] & ~in)
        state[1] <= ~state[1];
end

always @(posedge clk) begin//MSB T FF
    if((state[1] & state[2]) | (state[0] & ~state[2]) | (~state[1] & ~state[2] & in))
        state[2] <= ~state[2];
end

//output logic
always @(posedge clk) begin//Output Logic
    Q = state[0] & state[1] & in;
end

endmodule 