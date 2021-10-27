module clock_freq_divider(
    input clk,
    input reset,
    output [2:0]out
);

begin
T_FF T0(.clk(clk),.in(1'b1),.reset(reset),.Q(out[0]));
T_FF T1(.clk(out[0]),.in(1'b1),.reset(reset),.Q(out[1]));
T_FF T2(.clk(out[1]),.in(1'b1),.reset(reset),.Q(out[2]));
end

endmodule



