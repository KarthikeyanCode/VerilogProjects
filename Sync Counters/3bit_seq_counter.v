module threebitsample(input clk, reset, output Q);
reg [2:0]Q=0;
always @(posedge clk) begin
    
    if(reset)
        Q <= 0;

    else
        /*assigning the next state values
        as a expression of present states */
    
end

endmodule