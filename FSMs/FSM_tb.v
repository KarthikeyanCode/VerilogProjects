//test bench module for all FSMs
//latest modification for 7bit seq detector 1011101
module tb();

reg C;//C is the input
reg clk;//clock
//inputs
wire [2:0]state;
wire Q;
//present state and output

SeqDetect_7bit v(.in(C), .clk(clk), .state(state), .Q(Q));

initial begin
    forever 
    #5 clk = ~clk;
end

initial begin
    C <= 0;
    clk <= 0;
    #400 $finish;
end

initial begin
    forever begin
        #8 C <= ~C;//assigning random values to the input
    end
end

endmodule 