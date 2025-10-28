`timescale 1ns / 1ps

module SPI_Master_Slave;

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

   
endmodule
