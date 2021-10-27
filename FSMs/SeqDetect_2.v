//110 3-bit sequence detector sequential circuit
module SeqDetect_2(input C,clk, output state,Q);
reg [1:0] state=0;
reg Q=0;
reg temp_1=0,temp_2=0;
always @(posedge clk) begin
    temp_1 = state[0] ^ C;
    if(state[1] & temp_1)
        state[0] <= ~state[0];
end

always @(posedge clk) begin
    temp_2 = state[1] ^ C;
    if(temp_2)
        state[1] <= ~state[1];
end

always @(posedge clk) begin
    if(state[0] & ~C)
        Q <= 1;
    else
        Q <= 0; 
end

endmodule 