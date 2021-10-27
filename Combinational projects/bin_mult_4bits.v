//executing in terms of a FSM
module bin_mult_4bits(
    input [3:0] A,
    input [3:0] B,
    input clk,reset,
    output [7:0] out//4 + 3(due to one position shift) + 1 final carry = 8bits
);

reg acc[8:0];//accumulator 
reg [3:0]state <= 0;

always @(posedge clk) begin
    if(~reset)
        acc <= 0;
        state <= 0;
        out <= 0;
    else if(state == 0) begin
        acc[8:4] <= 5'b00000;
        acc[3:0] <= A;
        state <= state + 1;
    end
    else if(state == 9) begin
        state <= 0;
        out <= acc[7:0];//first 8 bits are assigned to out
        acc <= 0;//acc is reset
    end
    else if(state%2 == 1) begin//for odd states 
        if(acc[0] == 1'b0)//if the considering bit of A is 0 then right shift
            acc <= {1'b0, acc[8:1]};
            state <= state + 2;//adding 2 so that state stays in odd number
        else//if the considering bit of A is 1 then add B
            acc[8:4] <= {1'b0,acc[7:4]} + B;//can also give a 4bit binary adder module
            state <= state + 1;//state is shifted to even indorder to right shift 
    end 
    else begin//for even states for shifting the bits towards right
        acc <= {1'b0,acc[8:1]};
        state <= state + 1;
    end
end

endmodule 





