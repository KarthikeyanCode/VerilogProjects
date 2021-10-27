module tb_debounce();

reg D,clk,reset;
wire out;

debounce_switch v(D,clk,reset,out);

initial begin
    D <= 0;
    clk <= 0;
    reset <= 1;
end

initial begin
    #500 $finish;
end

initial begin
    forever
    #1 clk <= ~clk;
end

always #25 D <= ~D;

initial begin
    #250 reset <= ~reset;
    #5 reset <= ~reset;
end

endmodule 