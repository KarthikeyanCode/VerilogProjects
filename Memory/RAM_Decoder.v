//decoder used to choose the appropriate word using address input
module RAM_decoder(
    input [1:0] address,
    input memory_en,
    output [3:0]word
);

wire net1,nete,net3,net4,net5;
assign net1 = address[0];
assign net2 = address[1];
assign net3 = ~address[0];
assign net4 = ~address[1];

and(word[0],net3,net4,memory_en);//00
and(word[1],net3,net1,memory_en);//01
and(word[2],net2,net3,memory_en);//10
and(word[3],net2,net1,memory_en);//11

endmodule
