`timescale 1ns / 1ps

module ROM_4x4_tb();
  
  reg clk,en;
  reg [1:0]address;
  wire [3:0]data_out;
  
  ROM_4x4 uut (.clk(clk), .en(en), .address(address), .data_out(data_out));
  
  initial begin 
  clk = 0;
  forever #5 clk = ~clk;
  end 
  
  initial begin 
  $monitor("t=%0t, clk=%b, en=%b, address=%b, data_out=%b", $time, clk, en, address, data_out);
 
  en = 0; address = 2'dz; #10;
  en = 1;
 
  address = 2'd0; #10;
  address = 2'd1; #10;
  address = 2'd2; #10;
  address = 2'd3; #10;
  
 $finish; 
  end 
endmodule
