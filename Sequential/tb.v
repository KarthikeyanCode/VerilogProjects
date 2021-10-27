module tb();

reg [3:0]Din;
reg clk;
//reg en;//enable bit to choose between load and 
reg reset;
wire [3:0]bits;
wire data_out;
pipo_sr v(Din,clk,reset,bits);

initial begin
    #100 $finish;
end

initial begin
    Din <= 0;
    clk <= 0;
    //en <= 0;
    reset <= 1;
    forever begin
        #2 clk <= ~clk;
    end
end

always #5 Din <= $random;
//always #25 en <= ~en;
always #75 reset <= ~reset;

endmodule 