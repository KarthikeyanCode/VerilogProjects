module debounce_switch(
    input D,clk,reset,
    output out//the final output result of the button pushed
);
wire out1,out2;//outputs of the 2 D_FFs
begin
    D_FF D0(D,clk,reset,out1);
    D_FF D1(out1,clk,reset,out2);
    and(out,out1,~out2);
end
endmodule 