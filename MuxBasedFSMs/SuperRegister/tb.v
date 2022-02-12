module testBench();
reg clk,lsi,rsi;
reg [2:0]s;
reg [3:0]load;
wire [3:0]q;

superRegister sr(.s(s), .load(load), .rsi(rsi), .lsi(lsi), .clk(clk), .q(q));

initial
begin

    clk=0;
    repeat(256)
    begin
        #1 clk=~clk;
    end
    
end

initial
begin

    s=3'b011; //rst
    #32 s=3'b100; //set
    #32 s=3'b101; //upcount
    #32 s=3'b110; //downcount
    #32 s=3'b111; 
    load=4'b0000; //load
    
    repeat(15)
    begin
        #2 load=load+4'b0001;
    end
    
    #6 s=3'b000; //holdstate
    #2 s=3'b001; lsi=0; //shiftleft
    #8 lsi=1;
    #8 s=3'b010; rsi=0; //shiftright
    #8 rsi=1;#8
    $stop;
    
end
    
endmodule