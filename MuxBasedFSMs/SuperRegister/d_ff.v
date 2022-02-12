module D_FF(input d, input clk, output reg q);

always@(posedge clk)
begin
    q <= d;
end

endmodule