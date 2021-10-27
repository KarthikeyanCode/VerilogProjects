module T_FF(input in,clk,reset output reg Q1);
//The FF only works at positive edge of clk
always @(posedge clk) begin
    if(~reset)
        Q1 <= 0;
    else begin
        if(in == 1)
            Q1 <= ~Q1;
        else
            Q1 <= Q1;
    end
end

endmodule 