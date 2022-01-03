module tb_memory();

reg read_write;
reg memory_en;
reg [1:0]address;
reg [3:0]in;
wire [3:0]out;

module RAM(
    .read_write(read_write),
    .memory_en(memory_en),
    .address(address),
    .in(in),
    .out(out)
);

initial begin
    #500 $finish;
end

initial begin
    read_write <= 0;
    memory_en <= 0;
    address <= 0;
    in <= 0;
    main;
end

task main;

begin
    fork 
        read_write_task;
        memory_en_task;
        address_task;
        in_task;
    join
end

endtask 

task read_write_task;
begin
    forever begin 
        #50 read_write = ~read_write;
    end
end
endtask

task memory_en_task;
begin
    forever begin
        #25 memory_en = ~memory_en;
    end
end
endtask

task address_task;
begin
    forever begin
        #5 address[0] <= ~address[0];
        #10 address[1] <= ~address[1];
    end
end
endtask

task in_task;
begin
    forever begin
        #1 in[0] <= ~in[0];
        #2 in[1] <= ~in[1];
        #3 in[2] <= ~in[2];
        #4 in[3] <= ~in[3];
    end
end
endtask
endmodule 



