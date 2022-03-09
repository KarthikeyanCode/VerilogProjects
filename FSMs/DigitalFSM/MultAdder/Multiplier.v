//Four bit down counter with parallel input 
//The input value will be given and the counter will count down from it to 0000

module AR(
    input [3:0]in, //Mux external load inputs
    input select, clk, reset,
    output [3:0]out,
    output cmpltd
);

wire FF0_in, FF1_in, FF2_in, FF3_in; //output from Muxes
wire M0_Count_in, M1_Count_in, M2_Count_in, M3_Count_in; //count input to the Muxes 

//Mux counter inputs
assign M0_Count_in = 1;
assign M1_Count_in = ~out[0];
assign M2_Count_in = ~(out[0] | out[1]);
assign M3_Count_in = ~(out[0] | out[1] | out[2]);

//Mux external load inputs: [3:0]in

//The Mux and the Flip Flops of the register
Mux  M0(.extn_in(in[0]), .count_in(M0_Count_in), .select(select), .FF_in(FF0_in));
T_FF T0(.T(FF0_in), .clk(clk), .reset(reset), .Q(out[0]));

Mux  M1(.extn_in(in[1]), .count_in(M1_Count_in), .select(select), .FF_in(FF1_in));
T_FF T1(.T(FF1_in), .clk(clk), .reset(reset), .Q(out[1]));

Mux  M2(.extn_in(in[2]), .count_in(M2_Count_in), .select(select), .FF_in(FF2_in));
T_FF T2(.T(FF2_in), .clk(clk), .reset(reset), .Q(out[2]));

Mux  M3(.extn_in(in[3]), .count_in(M3_Count_in), .select(select), .FF_in(FF3_in));
T_FF T3(.T(FF3_in), .clk(clk), .reset(reset), .Q(out[3]));

//Detect if the counter has completed the down counting i.e reached 0000
ZeroDetection Detect(.in(out), .out(cmpltd));

endmodule