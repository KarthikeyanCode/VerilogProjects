module T_FF(
    input T, clk, reset,
    output reg Q
);

always @(posedge clk)
begin

    if(!reset) Q <= 0;
    else Q <= (~T & Q) | (T & ~Q);

end

endmodule