//1101 4-bit sequence detector, sequential circuit/FSM
module SeqDetect_4bit(input C,clk, output reg [1:0]state=0, output reg Q=0);//C is the input
//Q is output and state refers to present state
reg T1=1'b0,T2=1'b0;
//TFF v( .in(T1), .clk(clk), .Q(state[0]));
//TFF v1(.in(T2), .clk(clk), .Q(state[1]));
//Designing using T Flip Flop
//we use non blocking assignments ("<=") so that 
//we can calculate next state logic efficiently 
//First bit Flip Flop 
always @(posedge clk) begin
    if((state[0] & ~state[1]) | (~state[0] & state[1] & C))
        state[0] = ~state[0];
end
//second bit Flip Flop 
always @(posedge clk) begin
    if((~state[0] & ~state[1] & C) | (state[1] & ~C))
        state[1] = ~state[1];
end
//final output of the sequence detector FSM
always @(posedge clk) begin//output logic 
    if(state[0] & ~state[1] & C)
        Q <= 1; 
    else
        Q <= 0;
end

endmodule 