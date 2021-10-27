module check_tb();

/*
module control_unit(
    input start,Q0,zero, //external inputs
    input clk,reset, //other inputs
    output ready,decr_pointer,shift_regs, //moore type outputs
    output load_regs,add_regs //melay type outputs
);
reg start, Q0, zero;
reg clk,reset;
wire ready,decr_pointer,shift_regs;
wire load_regs,add_regs;

control_multiplier_2 C(
    .start(start), .Q0(Q0), .zero(zero),
    .clk(clk), .reset(reset),
    .ready(ready), .decr_pointer(decr_pointer), .shift_regs(shift_regs),
    .load_regs(load_regs), .add_regs(add_regs)
);

initial begin
    #500
    $finish;
end

initial begin
    start = 1'b0;
    Q0 = 1'b0;
    zero = 1'b0;
    clk = 1'b0;
    reset = 1'b1;//active low
    main;
end

task main;
forever fork
    start_task;
    Q0_task;
    zero_task;
    clk_task;
join
endtask

task start_task;
forever #10 start = ~start;
endtask

task Q0_task;
forever #25 Q0 = ~Q0;
endtask

task zero_task;
forever #150 zero = ~zero;
endtask;

task clk_task;
forever #1 clk = ~clk;
endtask

endmodule 
*/

/*
module count_ones(
    input bits,clk1,clk2,
    input reset,
    output reg [3:0]count//
);
*/
reg bits = 1'b0;
reg clk1, clk2 = 1'b0;
reg reset = 1'b1;//active low

wire [3:0] count = 4'b0000;;

count_ones C(
    .bits(bits), .clk1(clk1), .clk2(clk2),
    .reset(reset), 
    .count(count) 
);

initial begin
    #100 $finish;
end

initial forever begin
    #1 clk1 <= ~clk1;
    #2 clk2 <= ~clk2;
    #10 bits <= $random;
end

endmodule 

