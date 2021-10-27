module Full_Adder_FSM(
    input a,b,cin,
    input clk,reset,
    output out,cout
);

begin
    assign out = a ^ b ^ cin;
    assign cout = (a & b) | ((a ^ b) & cin);

    always @(posedge clk or negedge reset) begin
        cin <= cout;
    end
end


endmodule 