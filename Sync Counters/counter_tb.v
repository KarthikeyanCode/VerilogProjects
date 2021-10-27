module tb();

reg clk,reset;
wire [4:0]Q;
multiplesofthree_5bits v1(clk, reset, Q);

initial begin
    clk <= 0;
    reset <= 0;
    
    repeat(40) begin
        #5 clk = ~clk;
    end
end

endmodule 