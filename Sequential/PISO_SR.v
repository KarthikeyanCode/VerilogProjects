module piso_sr(
    input [3:0] D,
    input en,
    input clk,
    input reset,
    output [3:0] bits
    output data_out;
);

always @(posedge clk) begin
    if(~reset)
        bits <= 0;
    else if(~en)
        bits <= D;
    else
        data_out <= bits[3];
        bits <= {bits[2:0],1'b0};//upon posedge clk, the shift happens to 1 bit to the right
        //and a 1'b0 is given as input to the LSB FF
end

endmodule 



