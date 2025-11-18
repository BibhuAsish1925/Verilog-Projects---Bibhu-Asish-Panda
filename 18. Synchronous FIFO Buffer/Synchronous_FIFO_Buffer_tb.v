`timescale 1ns / 1ps

 module Synchronous_FIFO_tb();

    parameter width = 4;
    parameter depth = 8;

    reg [width-1:0] data_in;
    reg w_in, r_in, clk, rst;

    wire [width-1:0] data_out;
    wire fifo_empty, fifo_full;

    Synchronous_FIFO uut (.data_in(data_in),.w_in(w_in),.r_in(r_in),.clk(clk),.rst(rst),.fifo_empty(fifo_empty),.fifo_full(fifo_full),.data_out(data_out));

    initial begin
         clk = 0;
         forever #5 clk = ~clk;
    end

    initial begin
    // Reset sequence
    rst = 1;
    w_in = 0;
    r_in = 0;
    data_in = 0;
    #10 rst = 0;
    #10 rst = 1;

    // Write Test
    w_in = 1;
    data_in = 4'd5; #10;
    data_in = 4'd7; #10;
    data_in = 4'd0; #10;
    data_in = 4'd2; #10;
    data_in = 4'd3; #10;
    w_in = 0;

    // Read Test
    #20;
    r_in = 1; #10;
    r_in = 1; #10;
    r_in = 1; #10;
    r_in = 0;

    #20;
    w_in = 1;
    data_in = 4'd0; #10;
    data_in = 4'd1; #10;
    data_in = 4'd2; #10;
    data_in = 4'd3; #10;
    data_in = 4'd4; #10;
    data_in = 4'd5; #10;
    data_in = 4'd6; #10;
    data_in = 4'd7; #10;
    data_in = 4'd3; #10;
    data_in = 4'd2; #10;
    w_in = 0;

    #20;
    r_in = 1;
    repeat (12) #10;
    r_in = 0;

    // Read + Write 
    #20;
    w_in = 1; r_in = 0; data_in = 4'd0; #10;
    data_in = 4'd1; #10; r_in = 1; #10;
    data_in = 4'd2; #10; r_in = 0;
    data_in = 4'd3; #10; r_in = 1; #10;
    r_in = 0; data_in = 4'd4; #10;
    data_in = 4'd5; #10; r_in = 1; #10;
    r_in = 0; data_in = 4'd6; #10;
    data_in = 4'd7; #10; r_in = 1; #10;
    r_in = 0; data_in = 4'd6; #10;
    data_in = 4'd5; #10; r_in = 1; #10;
    r_in = 0; data_in = 4'd4; #10;
    data_in = 4'd3; #10; r_in = 1; #10;
    r_in = 0; data_in = 4'd2; #10;
    data_in = 4'd1; #10; r_in = 1; #10;
    r_in = 0; data_in = 4'd0; #10;
    data_in = 4'd1; #10; r_in = 1; #10;

    #20;
    $finish;
end

initial begin
    $monitor("time: %0t | rst: %b | data_in: %d | r_in: %b | w_in: %b | data_out: %d | full: %b | empty: %b",$time, rst, data_in, r_in, w_in, data_out, fifo_full, fifo_empty);
end

endmodule
