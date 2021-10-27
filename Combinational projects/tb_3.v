module tb();

reg clk;
reg out;
reg reset;
reg [3:0]A, B;
wire [8:0] out;

bin_mult_4bits v(A,B,clk,reset,out);

initial begin
    clk <= 0;
    reset <= 1;//reset is active low
    A <= 0;
    B <= 0;
    #100 $finish;
end

//setting the clk
initial begin
    forever 
    #1 clk <= ~clk;
end

initial begin
    forever 
    #20 A = $random;
    #1 B = $random;
end

always #80 reset = ~reset;

endmodule 




