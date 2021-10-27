module carry_look_ahead(
    input [3:0]a, b, 
    input cin,
    output [4:0]sum, 
    output cout//final carry
);

wire p0,p1,p2,p3;//first 2 bit addition sum
wire g0,g1,g2,g3;//first two bit addition carry

wire c1,c2,c3;//along with cin and cout are all the carries required

and(g0, a[0], b[0]);
and(g1, a[1], b[1]);
and(g2, a[2], b[2]);
and(g3, a[3], b[3]);

xor(p0, a[0], b[0]);
xor(p1, a[1], b[1]);
xor(p2, a[2], b[2]);
xor(p3, a[3], b[3]);

//carry look ahead combinational operations

assign c1 = g0 | (p0 & cin);
assign c2 = g1 | (p1 & g0) | (p1 & p0 & cin);
assign c3 = g2 | (p2 & g1) | (p2 & p1 & g0) + (p2 & p1 & p0 & cin);
assign cout =  g3 | (p3 & g2) | (p3 & p2 & g1) | (p3 & p2 & p1 & g0) | (p3 & p2 & p1 & p0 & cin);

xor(sum[0], p0, cin);
xor(sum[1], p1, c1);
xor(sum[2], p2, c2);
xor(sum[3], p3, c3);
buf(sum[4], cout);
endmodule 