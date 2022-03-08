module tb();

reg x, y, clk, reset;
wire [1:0]Q; //state of the machine

Fsm1 fsm(.x(x), .y(y), .clk(clk), .reset(reset), .Q(Q));

initial 
begin
    #200 $finish;
end 

initial
begin
    x = 0; y = 0; clk = 0; 
    
    //reset the flip flops
    reset = 0;
    #2 reset = 1;
    
end

always #1 clk = ~clk;
always #10 x = ~x;
always #20 y = ~y;

endmodule