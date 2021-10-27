//latest used for parking_sys_adv
`define delay 500 
module tb_parking();

reg clk,reset;
reg [3:0]pass;
reg sensor;


wire [63:0] counter_wait;
wire out;

parking_sys_adv v(
    .clk(clk),
    .reset(reset),
    .pass(pass),
    .sensor(sensor),
    .out(out),
    .counter_wait(counter_wait)
);

initial begin
    #`delay $finish;
end

initial begin
    clk <= 0;
    sensor <= 0;
    reset <= 1;
    pass <= 4'b0000;
    main;
end

task main;
begin
    fork
        clock_task;
        sensor_task;
        reset_task;   
    join
end
endtask

//setting the clock
task clock_task;
begin
    forever begin
        #1 clk <= ~clk;
    end
end
endtask

//sensor input
task sensor_task; 
begin
    sensor <= 1;
    #200
    sensor <= 0;
    #100
    sensor <= 1;
end
endtask

//setting reset
task reset_task; 
begin
    #300 reset <= ~reset;
    #5 reset <= ~reset;
end
endtask

//password input
always #20 pass[3] <= ~pass[3];
always #15 pass[2] <= ~pass[2];
always #10 pass[1] <= ~pass[1];
always #5  pass[0] <= ~pass[0];

endmodule 

