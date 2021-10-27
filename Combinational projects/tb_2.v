module tb_2();

reg [7:0]D;
wire [2:0]out;

encoder_3bit v(D, out);

initial begin
    D <= 0;
    #100 $finish;
end

initial begin
    forever begin
        #2 D <= $random; //assigning random numbers to D
    end
end

endmodule 





