module FullAdder(input a,b,c, output sum, output carry);
//a,b,c are input bits(with c being carry) 
//sum and carry are correspoding outputs of Full adder

assign sum = ((c ^ a) ^ b);
assign carry = (c & a) | (b & (c ^ a));

endmodule 


