module tb_1();

reg [3:0] D;//input to the FFs 
reg reset;//reset
reg clk;//clk
reg en;//to choose between load and shift
wire [3:0] out;

cyclic_sr_pi v(D,reset,clk,en,out);

initial begin
    #100 $finish;
end

initial begin
    //initialising all the variables
    D <= 0;
    clk <= 0;
    en <= 0;
    reset <= 1;
    forever begin
        #2 clk <= ~clk;
    end
end

always #4 D <= $random;
always #25 en <= ~en;
always #70 reset <= ~reset;

endmodule 
