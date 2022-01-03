module four_or_gates(
    input [3:0]word0_out,word1_out,word2_out,word3_out,
    output [3:0]out
);

or(out[0], word0_out[0], word1_out[0], word2_out[0], word3_out[0]);
or(out[1], word0_out[1], word1_out[1], word2_out[1], word3_out[1]);
or(out[2], word0_out[2], word1_out[2], word2_out[2], word3_out[2]);
or(out[3], word0_out[3], word1_out[3], word2_out[3], word3_out[3]);

endmodule 