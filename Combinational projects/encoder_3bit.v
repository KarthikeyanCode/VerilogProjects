module encoder_3bit(
    input [7:0]D;
    output [2:0]bin;
);

//assigning the values
begin
    or(bin[0], D[1], D[3], D[5], D[7]);
    or(bin[1], D[2], D[3], D[6], D[7]);
    or(bin[2], D[4], D[5], D[6], D[7]);
end

endmodule 
