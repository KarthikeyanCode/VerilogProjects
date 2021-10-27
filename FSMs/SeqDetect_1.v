//001 3-bit sequence detector sequential circuit
module seqDetect_1(input C,clk, output state,D);
reg [1:0]state=0;//reg variable stores value
//so we use it to store the value of the present state
//so that we can determine the next state using the 
//next state logic we have derived
reg D=0;
//next state logic, using T Flip flops
//all the always blocks run in parallel
always @(posedge clk) begin
    if((state[1] & ~C) | state[0])
        state[0] <=  ~state[0];
end

always @(posedge clk) begin
    if(~(state[1] | C) | (state[1] & C))
        state[1] <= ~state[1];

always @(posedge clk)
    if(state[0] & C)//output logic
        D <= 1;
    else
        D <= 0;
end

endmodule 