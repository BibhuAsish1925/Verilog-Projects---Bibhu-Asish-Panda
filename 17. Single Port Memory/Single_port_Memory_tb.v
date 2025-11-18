`timescale 1ns / 1ps

module Single_port_Memory_tb();
    reg clk, reset, WR, valid;
    reg [15:0] data_in;
    reg [9:0] addr;
    wire [15:0] data_out;
    wire ready;

    Single_port_Memory uut (.clk(clk),.reset(reset),.WR(WR),.data_in(data_in),.valid(valid),.addr(addr),.data_out(data_out),.ready(ready));

    always #5 clk = ~clk;

    initial begin
        clk = 0;
        reset = 1;
        valid = 0;
        WR = 0;
        addr = 0;
        data_in = 0;
        #10 reset = 0;

        // Write 
        @(posedge clk);
        valid = 1; WR = 1;
        addr = 10'd5; data_in = $random; #10;
        addr = 10'd35; data_in = $random; #10;
        addr = 10'd25; data_in = $random; #10;
        addr = 10'd51; data_in = $random; #10;
        
        @(posedge clk);
        valid = 0;
        #20;
        // Read 
        @(posedge clk);
        valid = 1; WR = 0; addr = 10'd5; #10;
        addr = 10'd5; #10;
        addr = 10'd35; #10;
        addr = 10'd25; #10;
        addr = 10'd51; #10;
        @(posedge clk);
        valid = 0;

        #20 $finish;
    end

endmodule
