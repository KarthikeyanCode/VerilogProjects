module D_FF(
    input D,clk,reset,
    output reg Q
);

always @(posedge clk) begin
    if(~reset)
        Q <= 0; 
    else if(D==1'b1)
        Q <= 1;
    else 
        Q <= 0;
end

endmodule 