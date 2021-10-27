//a async up counter using any FF
module counter_8bit(input clk,reset, output reg [7:0]count = 8'b00000000);

always @(posedge clk) begin
    if(~reset)
        count <= 0;
    else
        count <= count + 1'b1; 
end

endmodule 