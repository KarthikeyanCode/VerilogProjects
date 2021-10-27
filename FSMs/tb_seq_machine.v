module tb_seq_machine();



/*
module sync_seq_machine(
    input Qa,Qb,Qc,
    input in,clk,reset,
    output out//final output
);
*/

reg Qa=1'b0,Qb=1'b0,Qc=1'b0;
reg in,clk,reset;

wire out;

sync_seq_machine S0(
    .Qa(Qa), .Qb(Qb), .Qc(Qc),
    .in(in), .reset(reset), .clk(clk),
    .out(out) // final output 
);

initial begin 
    #500
    $finish;
end

initial begin
    in <= 0;
    clk <= 0;
    reset <= 1;//reset is active low
    main;
end

task main;
fork
    input_task;
    reset_task;
    clk_task;
join
endtask

task input_task;
forever begin
    #5 in <= ~in;
end
endtask

task reset_task;
forever begin
    #150 reset <= ~reset;
end
endtask

task clk_task;
forever begin
    #1 clk <= ~clk;
end
endtask

endmodule 
