module word(
    input [3:0]in,
    input select,
    input read_write,
    output [3:0]out
);
//in our ram each word contains 4 Binary_Cells
Binary_Cell B3(.in(in[3]),
    .select(select),
    .read_write(read_write),
    .out(out[3])
);

Binary_Cell B2(.in(in[2]),
    .select(select),
    .read_write(read_write),
    .out(out[2])
);

Binary_Cell B1(.in(in[1]),
    .select(select),
    .read_write(read_write),
    .out(out[1])
);

Binary_Cell B0(.in(in[0]),
    .select(select),
    .read_write(read_write),
    .out(out[0])
);

endmodule 

