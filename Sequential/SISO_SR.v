module siso_sr(input Din,clk, output [3:0]bits,output out);

D_FF D0(Din,clk,bits[0]);
D_FF D1(bits[0],clk,bits[1]);
D_FF D2(bits[1],clk,bits[2]);
D_FF D3(bits[2],clk,bits[3]);

assign out = bits[3];

endmodule 







