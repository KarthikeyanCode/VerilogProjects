module T_FF(
    input in,
    input clk,
    input reset,
    output Q//arguements
);

reg Q=1'b0;

always @(posedge clk) begin
    if(~reset)
        out <= 0;
    else if(in == 1)
        Q <= ~Q;
    else
        Q <= Q; 
end

endmodule 



