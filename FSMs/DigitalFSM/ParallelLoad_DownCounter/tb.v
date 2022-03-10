module tb();

reg [3:0]load;
reg clk, reset, select;
wire [3:0]out;
wire cmpltd;

AR register(.in(load), .select(select), .clk(clk), .reset(reset), .out(out), .cmpltd(cmpltd));

initial 
begin

    #100 $finish;   

end

initial
begin

    //initalize input variables
    load = 4'b0000;
    clk = 0; select = 0;
    
    //reset the FFs
    reset = 0;
    #2 reset = 1;

    //load values
    load = 4'b1111;
    select = 1; //load the value

    #2;

    //start down counting
    select = 0;
    
    #50;
    
    //load the value 
    //since it is T_FF, we have to reset and load
    //This makes sure that T_FFs are loaded with the input value
    //as if we dont reset, they will toggle some random bits

    //reset
    reset = 0;
    
    #2;

    reset = 1;
    load = 4'b1010;
    select = 1;
    
    #2;
    
    //start downcounting again from loaded value
    select = 0;

end

always #1 clk = ~clk; //clock

endmodule