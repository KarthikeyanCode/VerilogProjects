module comparator_4bit( 
    input [3:0] A;
    input [3:0] B;
    output [1:0]out //01 - A>B, 00 - A=B, 10 - A<B.
);
wire [3:0]res[1:0];

//comparing the MSB first then comparing other bits till LSB
comparator_1bit C3(A[3],B[3],res[3]);
comparator_1bit C2(A[2],B[2],res[2]);
comparator_1bit C1(A[1],B[1],res[1]);
comparator_1bit C0(A[0],B[0],res[0]);

//checking priority from MSB to LSB
for(integer i=3;i>=0;i=i-1)
    begin
        if(res[i] == 2'b01)
            assign out = 2'b01;
        else if(res[i] == 2'b10)
            assign out = 2'b10;
        else
            assign out = 2'b00;
    end

endmodule 