`timescale 1ns / 1ps

module SPI_Master_Slave_tb();

    reg clk, reset, start;
    reg [7:0] master_data;
    wire [7:0] master_out;
    wire done;
    wire sclk, mosi, miso, ss;

    reg [7:0] slave_data;
    wire [7:0] slave_out;
    wire slave_done;

    // Master
    SPI_Master master_inst (.clk(clk),.reset(reset),.start(start),.data_in(master_data),.data_out(master_out),.done(done),.sclk(sclk),.mosi(mosi),.miso(miso),.ss(ss));

    // Slave
    SPI_Slave slave_inst (.sclk(sclk),.reset(reset),.ss(ss),.mosi(mosi),.miso(miso),.data_in(slave_data),.data_out(slave_out),.done(slave_done));

    // Clock
    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; start = 0;
        master_data = 8'hA5; // Master will send A5
        slave_data  = 8'h3C; // Slave will send 3C
        #20 reset = 0;

        #20 start = 1;   // Start transfer
        #200 start = 0;

        #200 $finish;
    end
endmodule
