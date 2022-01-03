//Binary Cell module - holds/operates 1 bit of information
module Binary_Cell(
    input in,//input data used for write function
    input read_write,//1 -> read, 0 -> write
    input select,//if select is high(1'b1) then the binary_call can be used to read/write
    output out//final output of binary cell 
);

wire net1,net2,net3,net4;
begin
    and(net1, in, ~read_write, select);
    and(net2, ~in, ~read_write, select);
    SR_Latch v(net1, net2, net3);
    and(out, select, read_write, net3);
end

endmodule 


//SR Latch module 
module SR_Latch(
    input S,R,
    output reg Q = 1'b0//initialization
);

always @(S or R) begin
    if(S & R == 1)//ambiguity state SR != 1 
        Q <= Q;
    else
        Q <= S + (~R & Q);//next state logic
end

endmodule 

