module parking_sys(
    input sensor,
    input clk,reset,
    input [3:0]pass,
    output reg out//0 - not allowed,1 - allowed (to enter)
);
reg [3:0]original_pass= 4'b1101; 
always @(posedge clk) begin
    if(~reset)
        out <= 0;
    else if(sensor) begin
        if(pass == original_pass)
            out <= 1;
        else
            out <= 0; 
    end
    else
        out <= 0;
end

endmodule 