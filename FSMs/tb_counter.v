module tb_counter();

reg in,clk,reset;
wire [3:0]count;

four_bit_counter v(
    .in(in),
    .clk(clk),
    .reset(reset),
    .count(count)
);

/*
module four_bit_counter(
    input Din, clk, reset,
    output [3:0]count
);
*/

initial begin
    #500 $finish;
end

initial begin
    in <= 1;
    clk <= 0;
    reset <= 0;
    main;
end

task main;
fork 
    clk_task;
    reset_task;
join
endtask

task clk_task;
forever begin
    #1 clk <= ~clk;
end
endtask

task reset_task;
forever begin
    #100 reset <= ~reset;
end
endtask

endmodule 