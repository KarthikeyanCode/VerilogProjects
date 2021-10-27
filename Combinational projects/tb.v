module tb();

reg [3:0]a, b;
reg cin;
wire [4:0]sum;
wire cout;


carry_look_ahead v(
    .a(a), .b(b), 
    .cin(cin),
    .sum(sum), 
    .cout(cout)
);

initial begin
    a <= 0;
    b <= 0;
    cin <= 0;
    #500 $finish;
end

initial begin
    forever begin
        #5 a <= $random; 
        #5 b <= $random;
    end
end

endmodule 
