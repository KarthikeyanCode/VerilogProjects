module async_tb();

reg x1,x2; // inputs

wire y1,y2,z1; // outputs

assign y1 = 0;
assign y2 = 0;
assign z1 = 0;

async_seq v(
    .x1(x1),
    .x2(x2),
    .y1(y1),
    .y2(y2),
    .z1(z1)
);

initial begin
    #500 $stop;
end

initial begin
    x1 = 0;
    x2 = 0;
    main;
end

task main;
forever begin
    fork
        input_task;
    join
end
endtask

task input_task;
begin
    #1 x1 <= ~x1;
    #2 x2 <= ~x2;
end
endtask

endmodule 

