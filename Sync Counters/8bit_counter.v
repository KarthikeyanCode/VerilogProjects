module threemultiples(input clk, reset, output Q)
reg [7:0]Q=0;
reg [7:0]present=0;
always @(posedge clk) begin
    present <= Q;
    Q[0] <= ~present[0];
    if(present[0] == 1'b0)
        Q[1] = ~present[1];
    else
        Q[1] = present[1];
    if()
end

