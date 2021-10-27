//2:1 multiplexer
module mux(input in1,in2,en, output out);

begin
    if(en == 1'b0)
        out <= in1;
    else
        out <= in2;
end

endmodule 