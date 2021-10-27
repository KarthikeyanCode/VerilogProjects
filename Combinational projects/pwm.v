//a simple pulse width modulator
module pwm_generation(input [7:0]pwm_on, input clk,reset, output reg pwm_out);

wire count;

counter_8bit C0(clk,reset,count);

//modulating the pulse width
always @(posedge clk) begin
    if(pwm_on > count)
        pwm_out <= 1;
    else
        pwm_out <= 0;
end

endmodule 

