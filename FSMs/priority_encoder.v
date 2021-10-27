module priority_enc(
    input Tx, T-x, Ty, T-y,
    output reg [1:0]out
);

always @(Tx | T-x | Ty | T-y) begin
    if(T-y) out <= 2'b11;
    else if(Ty) out <= 2'b10;
    else if(T-x) out <= 2'b01;
    else out <= 2'b00;
end

endmodule 