module Fourbit_Tffs(input clk, reset, output Q);

reg [3:0]Q=0;//initialising to start the counter
reg [3:0]present;
always @(posedge clk) begin
    present <= Q;//copying to present state
    /*assiging the next state from present state
    through expressions calculated from FF inputs
    */
    Q[0] <= ~present[0];
    Q[1] <= (present[1] & ~present[2]) | (present[1] & ~present[0] & ~present[2]) | (~present[1] & present[0]) | (~present[1] | present[2]);
    Q[2] <= (present[0] & ~present[2]);
    Q[3] <= (~present[3] & present[2] & present[1]) | (~present[2] & present[3]) | (~present[1] & present[3]); 
end

endmodule