//Multiplexer module

module Mux(
    input extn_in, count_in, select,//mux inputs
    output reg FF_in //FF input
);

always @(extn_in or count_in or select)
begin
    case (select)

        1'b0: FF_in <= count_in;
        1'b1: FF_in <= extn_in;
        default: FF_in <= 0;

    endcase
end

endmodule 