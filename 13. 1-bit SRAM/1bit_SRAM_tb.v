`timescale 1ns / 1ps

module SRAM_1bit_tb();
 reg  clk,data_in,read_write,address;
 wire data_out ;
 SRAM_1bit uut (.clk(clk),.data_in(data_in),.read_write(read_write),.address(address), .data_out(data_out)   );
  
  initial begin 
  clk = 0;
  forever #5 clk = ~clk;
  end 
                
  initial begin 
  
  $monitor("t=0%b,clk=%b,data_in=%b,read_write=%b,address=%b,data_out=%b", $time,clk,data_in,read_write,address,data_out);
  address = 0; read_write = 0; data_in = 0; #10;
  #10;
  address = 1; read_write = 1; data_in = 1; #10;
  #10;
   read_write = 0; address = 1; data_in = 0;
  #10;
  address = 1; read_write = 1; data_in = 0; #10;
  #10;
  read_write = 0 ; address = 1;
  #10;
  address = 0;
   $finish;
  end 
endmodule
