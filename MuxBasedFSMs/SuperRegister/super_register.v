module superRegister(input [2:0]s, input [3:0]load, input rsi, input lsi, input clk, output [3:0]q);

wire [3:0]mux_out, mux_in;
    
MUX8_1 mux0(load[0],~mux_in[0],~mux_in[0],1,0,mux_in[1],lsi,mux_in[0],s,mux_out[0]);
MUX8_1 mux1(load[1],~(mux_in[0]^mux_in[1]),mux_in[0]^mux_in[1],1,0,mux_in[2],mux_in[0],mux_in[1],s,mux_out[1]);
MUX8_1 mux2(load[2],~((mux_in[0]|mux_in[1])^mux_in[2]),(mux_in[0]&mux_in[1])^mux_in[2],1,0,mux_in[3],mux_in[1],mux_in[2],s,mux_out[2]);
MUX8_1 mux3(load[3],~((mux_in[0]|mux_in[1]|mux_in[2])^mux_in[3]),(mux_in[0]&mux_in[1]&mux_in[2])^mux_in[3],1,0,rsi,mux_in[2],mux_in[3],s,mux_out[3]);

D_FF ff0(mux_out[0], clk, q[0]);
D_FF ff1(mux_out[1], clk, q[1]);
D_FF ff2(mux_out[2], clk, q[2]);
D_FF ff3(mux_out[3], clk, q[3]);

assign mux_in=q;

endmodule
