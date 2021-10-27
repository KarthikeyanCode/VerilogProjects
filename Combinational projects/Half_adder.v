//binary half adder
module Half_Adder(
    input a,
    input b,
    output reg out,
    output reg carry_out
);

xor(out, a, b);//output 
and(carry_out, a, b);//carry

endmodule 
