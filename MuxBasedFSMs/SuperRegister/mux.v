module MUX8_1(input in7,in6,in5,in4,in3,in2,in1,in0, input [2:0]s, output reg o);

always@(in7,in6,in5,in4,in3,in2,in1,in0,s)//in bits are the inputs and s is the select bits ([2:0]s)
begin
    case(s)
        3'b000: o=in0;
        3'b001: o=in1;
        3'b010: o=in2;
        3'b011: o=in3;
        3'b100: o=in4;
        3'b101: o=in5;
        3'b110: o=in6;
        3'b111: o=in7;
    endcase
end
    
endmodule