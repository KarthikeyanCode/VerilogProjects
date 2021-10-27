//building a cyclic shift register with parallel input
module cyclic_sr_pi(
    input [3:0]D,
    input reset,
    input clk,
    input en,
    output reg [3:0]out = 4'b0000
);

always @(posedge clk) begin
    if(~reset)//reset - active low
        out <= 0;
    else if(~en)//enable - (0 - load) and (1 - shift) so load
        out <= D;//at posedge clk , the input will be processed to output and will
        //also be stored in the FFs
    else//shift
        out <= {out[2:0],out[3]};//rearranging the bits
end


endmodule 


