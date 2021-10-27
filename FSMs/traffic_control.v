module traffic_light_control(
    input sensor,
    input clk,
    input reset,
    output reg [2:0]highway,farm//traffic light output of farmroad/highway
    //LSB -> red, Middle -> yellow, MSB -> green.
);

parameter highwaygreen_farmred = 2'b00,
    highwayyellow_farmred = 2'b01,
    highwayred_farmgreen = 2'b10,
    highwayred_farmyellow = 2'b11;

reg [1:0]state = 2'b00;
reg [1:0]next_state = 2'b00;
reg farm_yellow_count=1'b0,highway_yellow_count=1'b0,highway_green_count=1'b0,farm_green_count=1'b0;
reg long_timer=1'b0,short_timer=1'b0;
reg [32:0]delay=0;

//assinging the state
always @(posedge clk or negedge reset) begin
    if(~reset)
        state <= 2'b00;
    else//with the active clock pulse the calculated next_state is assigned to state
        state <= next_state; 
end

//calculating the state
always @(*) begin//calculation of state part
case(state)
highwaygreen_farmred:
begin
    highway<=3'b100;
    farm<=3'b001;
    highway_green_count<=1;
    farm_green_count<=0;
    highway_yellow_count<=0;
    farm_yellow_count<=0;
    if(sensor && long_timer)//vehicle in farm road
        next_state <= highwayyellow_farmred;
    else
        next_state <= highwaygreen_farmred;
end
highwayyellow_farmred:
begin
    highway<=3'b010;
    farm<=3'b001;
    highway_green_count<=0;
    farm_green_count<=0;
    highway_yellow_count<=1;
    farm_yellow_count<=0;
    if(short_timer)
        next_state <= highwayred_farmgreen;
    else
        next_state <= highwayyellow_farmred;
end
highwayred_farmgreen:
begin
    highway<=3'b001;
    farm<=3'b100;
    highway_green_count<=0;
    farm_green_count<=1;
    highway_yellow_count<=0;
    farm_yellow_count<=0;
    if(long_timer || ~sensor)
        next_state <= highwayred_farmyellow;
    else
        next_state <= highwayred_farmgreen;
end
highwayred_farmyellow:
begin
    highway<=3'b001;
    farm<=3'b010;
    highway_green_count<=0;
    farm_green_count<=0;
    highway_yellow_count<=0;
    farm_yellow_count<=1;
    if(short_timer)
        next_state <= highwaygreen_farmred;
    else
        next_state <= highwayred_farmyellow;
end
endcase
end

//calculating the delay
always @(posedge clk) begin
    delay <= delay + 1;
    if(highway_green_count && sensor) begin//long_timer
        if(delay >= 10) begin
            long_timer<=1'b1;
            delay<=0;
        end
        else
            long_timer<=1'b0;
    end
    else if(highway_yellow_count) begin//short_timer
        if(delay >= 5) begin
            short_timer<=1'b1;
            delay<=0;
        end
        else
            short_timer<=1'b0;
    end
    else if(farm_green_count) begin//long_timer
        if(delay >= 10) begin
            long_timer<=1'b1;
            delay<=0;
        end
        else
            long_timer<=1'b0;
    end
    else begin//short_timer - farm_yellow_count
        if(delay >= 5) begin
            short_timer<=1'b1;
            delay<=0;
        end
        else
            short_timer<=1'b0;
    end
end

endmodule 



