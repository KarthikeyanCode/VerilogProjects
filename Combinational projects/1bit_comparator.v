module comparator_1bit(
    input A,
    input B,
    output [1:0]out
);

wire net1,net2,net3,net4;

not(net1, A);
not(net3, B);
and(net2, net1, B);
and(net4, net3, A);
begin
    if(net2)
        assign out = 2'b10;//B>A
    else if(net4)
        assign out = 2'b01;//A>B
    else
        assign out = 2'b00;//A==B
end 
endmodule 
