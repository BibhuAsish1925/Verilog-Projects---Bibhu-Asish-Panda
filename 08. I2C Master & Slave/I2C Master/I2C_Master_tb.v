`timescale 1ns / 1ps

module I2C_Master_tb();

    reg clk,reset,start;
    reg [6:0] slave_addr; 
    reg [7:0] data_in;
    wire scl,sda,done;

    tri1 sda_pull = sda;  

    I2C_Master uut (.clk(clk),.reset(reset),.start(start),.slave_addr(slave_addr),.data_in(data_in),.scl(scl),.sda(sda),.done(done));

    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 100MHz → can adjust
    end

    initial begin
    
        reset = 1;
        start = 0;
        slave_addr = 7'b1010000; 
        data_in = 8'hA5; 

        #20;
        reset = 0;

        #50;
        start = 1;  
        #10;
        start = 0;

        wait(done);

        #200;
        $stop;
    end

endmodule
