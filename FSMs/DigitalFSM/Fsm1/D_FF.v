//D Flip Flop

module D_FF(input in, clk, reset, output reg Q);

always @(posedge clk)
begin
    if(!reset) Q <= 0;
    else Q <= in;
end

endmodule