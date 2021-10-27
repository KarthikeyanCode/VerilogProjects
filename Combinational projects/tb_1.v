module tb_1();

reg [7:0]pwm_on;
reg clk,reset;
wire pwm_out;

initial begin
    #100 $finish;
end


//clock 
initial begin
    forever 
    #2 clk <= ~clk;
end

initial begin
    clk <= 0;
    reset <= 1;
end

initial begin
    forever 
    #10 pwm_on <= $random;
end

initial begin
    forever begin
    #10 reset = ~reset;
    #1 reset = ~reset;
    end
end

endmodule 

