//4 bit binary multiplier 
module bin_multiplier(
    input [3:0] A, B,
    output [7:0] out,
);

wire [6:0] storage1;
wire [6:0] storage2;
wire [6:0] storage3;
wire [6:0] storage4;

wire [6:0] temp1;
wire [6:0] temp2;

assign storage1 = {3'b000, B[0] & A[0], B[0] & A[1], B[0] & A[2], B[0] & A[3]};
assign storage2 = {2'b00, B[1] & A[0], B[1] & A[1], B[1] & A[2], B[1] & A[3], 1'b0};
assign storage3 = {1'b0, B[2] & A[0], B[2] & A[1], B[2] & A[2], B[2] & A[3], 2'b00};
assign storage4 = {B[3] & A[0], B[3] & A[1], B[3] & A[2], B[3] & A[3], 3'b000};

/*
module adder_7bit(
    input [6:0]A,B,
    output [7:0]out
);
*/

adder_7bit a0(
    .A(storage1), .B(storage2),
    .out(temp1)
);

adder_7bit a1(
    .A(temp1), .B(storage3),
    .out(temp2)
);

adder_7bit a3(
    .A(temp2), .B(storage4),
    .out(out)
);

endmodule 






