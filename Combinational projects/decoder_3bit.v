//active high 3 to 8 line decoder
module decoder_3bit(
    input A,B,C;//A is LSB and C is MSB i.e number is CBA.
    output [7:0]D;//8 bits
);

wire A_,B_,C_;


//assigning the compliments - not gate
not(A_,A);
not(B_,B);
not(C_,C);


and(D[0],A_,B_,C_);
and(D[1],A,B_,C_);
and(D[2],A_,B,C_);
and(D[3],A,B,C_);
and(D[4],A_,B_,C);
and(D[5],A,B_,C);
and(D[6],A_,B,C);
and(D[7],A,B,C);

endmodule 