module seven_bit_adder_subtractor(input reg [6:0]A,B, input reg carry_in, output [6:0]sum);
wire carry_out = 1'b0;
wire [6:0]carry = 7'b0000000;
reg [6:0] B_;
/*passing the respective bits of the two numbers along with the carry in to get
the carry out*/
begin
    /*making the circuit function as a subtracter when carry_in is 1 */
    xor (B_[0],B[0],carry_in);
    xor (B_[1],B[1],carry_in);
    xor (B_[2],B[2],carry_in);
    xor (B_[3],B[3],carry_in);
    xor (B_[4],B[4],carry_in);
    xor (B_[5],B[5],carry_in);
    xor (B_[6],B[6],carry_in);

    /*Each the inputs are passed into the full adders and outputs 
    are obtained from full adders*/
    FullAdder FA1(A[0],B_[0],carry[0],sum[0],carry[1]);
    FullAdder FA2(A[1],B_[1],carry[1],sum[1],carry[2]);
    FullAdder FA3(A[2],B_[2],carry[2],sum[2],carry[3]);
    FullAdder FA4(A[3],B_[3],carry[3],sum[3],carry[4]);
    FullAdder FA5(A[4],B_[4],carry[4],sum[4],carry[5]);
    FullAdder FA6(A[5],B_[5],carry[5],sum[5],carry[6]);
    FullAdder FA7(A[6],B_[6],carry[6],sum[6],carry_out);
end

endmodule 

