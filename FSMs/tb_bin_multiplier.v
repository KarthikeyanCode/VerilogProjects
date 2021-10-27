module tb_seq_bin_multiplier();

/*
module seq_bin_multiplier(
    input [3:0]A, B;
    input clk,
    output [7:0]product,
    output [2:0]counter//  
);
*/

reg [3:0]A, B;
reg clk;
wire [7:0] product;
wire [2:0] counter;

assign counter = 3'b000;

seq_bin_multiplier S(
    .A(A), .B(B), .clk(clk),
    .product(product),
    .counter(counter)
);

initial begin
    #500
    $finish;
end

initial forever begin
    #1 clk = ~clk;
end

initial begin
    clk <= 0
    A <= 0;
    B <= 0;
    forever begin
        #5 A <= $random;
        #5 B <= $random;
    end
end

endmodule 







