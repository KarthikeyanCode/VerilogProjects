//testbench module for traffic light control

`define delay 300

module tb_traffic();

reg sensor;
reg clk;
reg reset;//shld be active low
wire [2:0]highway,farm;

traffic_light_control v(
    .sensor(sensor),
    .clk(clk),
    .reset(reset),
    .highway(highway),
    .farm(farm)
);

initial begin
    #`delay $finish;
end

initial begin
    sensor <= 0;
    clk <= 0;
    reset <= 1;//active low
    main;
end

task main;//we use fork-join in main so that everything will run in parallel.
fork
    clock;
    reset_task;
    sensor_task;
join
endtask

task clock;
begin
    forever begin
        #1 clk <= ~clk;
    end
end
endtask

task reset_task;
begin
    forever 
    #100 reset <= ~reset;
end
endtask

task sensor_task;
begin
    forever 
    #50 sensor <= ~sensor; 
end
endtask

endmodule 