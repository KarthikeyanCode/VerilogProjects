//parallel in parallel out shift register
module pipo_sr(
    input [3:0]D,
    input clk,
    input reset,
    output reg [3:0]out = 4'b0000
);

always @(posedge clk) begin
    for(int i=0;i<=3;i=i+1)//here is a example use of for loop
        out[i] <= D[i];
end

endmodule 