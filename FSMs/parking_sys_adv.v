module parking_sys_adv(
    input clk,reset,sensor,
    input [3:0]pass,//4bit password
    output reg out,
    output reg [63:0]counter_wait=0
);

reg [1:0] present_state=2'b00;
reg [1:0] next_state;;
reg [3:0] original_pass = 4'b1001;


//assigning the next state to present state during active edge of clk
//also tasking care of reset
always @(posedge clk) begin
    if(~reset)
        out <= 0;
    else begin
        present_state = next_state;
        //moore fsm, so o/p depends only on present_state
        if(present_state == 2'b11) begin
            out <= 1;
            counter_wait <= 0;
        end
        else if(present_state == 2'b01) begin//counter_Waiting
            counter_wait <= counter_wait + 1;
            out <= 0;
        end
        else begin
            counter_wait <= 0;
            out <= 0;
        end
    end
end

//AKA next state logic
always @(*) begin//calculating the next 
    case (present_state)

    2'b00:
    begin
        if(sensor == 1'b0)
            next_state <= 2'b00;
        else
            next_state <= 2'b01;
    end

    2'b01:
    begin
        if(pass == original_pass)//correct password
            next_state <= 2'b11;
        else if(sensor == 1'b0)
            next_state <= 2'b00;
        else//wrong password
            next_state <= 2'b01;
    end

    2'b11:
    begin
        if(sensor == 1'b1)
            next_state <= 2'b01;
        else
            next_state <= 2'b00;
    end

    default:
        next_state <= 2'b00;
    endcase
end

endmodule 
