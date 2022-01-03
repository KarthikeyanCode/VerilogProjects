module RAM(
    input [1:0]adress,
    input memory_en,
    input read_write,
    input [3:0]in,
    output [3:0]out
);

wire net1,net2,net3,net4,net5;
wire [3:0]select_word;//selecting word
wire [3:0]word0_out,[3:0]word1_out,[3:0]word2_out,[3:0]word3_out;

wire net1,nete,net3,net4,net5;
assign net1 = address[0];
assign net2 = address[1];
assign net3 = ~address[0];
assign net4 = ~address[1];

/*
begin
    if(~memory_en)
        select_word <= 0;
    else begin//choosing the desire word
        and(select_word[0],net3,net4);//00
        and(select_word[1],net3,net1);//01
        and(select_word[2],net2,net3);//10
        and(select_word[3],net2,net1);//11
    end
end
*/
RAM_decoder v0(.address(address),
    .memory_en(memory_en),
    .word(select_word));
word w0(in.(in)
    .select(select_word[0]),
    .read_write(read_write),
    .out(word0_out)
);
word w1(in.(in)
    .select(select_word[1]),
    .read_write(read_write),
    .out(word1_out)
);
word w2(in.(in)
    .select(select_word[2]),
    .read_write(read_write),
    .out(word2_out)
);
word w3(in.(in)
    .select(select_word[3]),
    .read_write(read_write),
    .out(word3_out)
);

four_or_gates g(
    .word0_out(word0_out),
    .word1_out(word1_out),
    .word2_out(word2_out),
    .word3_out(word3_out),
    .out(out)
);

endmodule 

