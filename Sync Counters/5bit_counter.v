module multiplesofthree_5bits(input clk, reset, output Q);
reg [4:0]Q=0;//initialising to start the count process
/*assigning all the bits seperatelly in parallel*/

always @(posedge clk) begin
    if(Q==5'b11110)
        Q[0] <= 1'b0;
    else
        Q[0] <= ~Q[0];
end

always @(posedge clk) begin
    if(Q==5'b11110)
        Q[1] <= 1'b0;
    else if(Q[0] == 1'b0)
        Q[1] <= ~Q[1];
    else
        Q[1] <= Q[1];
end

always @(posedge clk) begin
    if(Q==5'b11110)
        Q[2] <= 1'b0;
    else if(Q[1] | Q[0])
        Q[2] <= ~Q[2];
    else 
        Q[2] <= Q[2];
end

always @(posedge clk) begin
    if(Q==5'b11110)
        Q[3] <= 1'b0;
    else if(Q[2] & (Q[1] | Q[0]))
        Q[3] <= ~Q[3];
    else
        Q[3] <= Q[3];
end

always @(posedge clk) begin
    if(Q==5'b11110)
        Q[4] <= 1'b0;
    else if(Q[3] & Q[2] & Q[1] & Q[0])
        Q[4] = ~Q[4];
    else 
        Q[4] <= Q[4];
end

endmodule 