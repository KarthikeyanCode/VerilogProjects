module seq_bin_multiplier(
    input [3:0]A, B;
    input clk,
    output [7:0]product,
    output [2:0]counter//  
);

reg [3:0] R1, R1_;
reg [8:0] R2;//final one bit for carry

always @(posedge clk) begin
    counter <= counter + 1;
end

always @(posedge clk) 
repeat(4) begin
    if(counter == 3'b000) begin//loading
        R1 <= A;
        [3:0]R2 <= B;
    end
    else if(counter == 3'b100) begin
        product <= [7:0]R2;
        counter <= 3'b000;
    end
    else
        if(R2[0] == 1'b1) begin
            R1_ = [7:4]R2;
            [8:4]R2 = summation;
            R2 >> 1; 
        end
        else
            R2 >> 1;
        counter = counter + 1;//incrementing counter
end
endmodule 

task summation;
begin
    combinational_FA F0(
        .a(R1[0]), .b(R1_[0]), .cin(1'b0),
        .sum(R2[4]), .cout(internal_carry[0])
    );

    combinational_FA F1(
        .a(R1[1]), .b(R1_[1]), .cin(internal_carry[0]),
        .sum(R2[5]), .cout(internal_carry[1])
    );

    combinational_FA F2(
        .a(R1[2]), .b(R1_[2]), .cin(internal_carry[1]),
        .sum(R2[6]), .cout(internal_carry[2])
    );

    combinational_FA F3(
        .a(R1[3]), .b(R1_[3]), .cin(internal_carry[2]),
        .sum(R2[7]), .cout(R2[8])
    );
end
endtask