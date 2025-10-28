`timescale 1ns / 1ps

module RAM_4x4_tb();
    
    reg clk ;
    reg [3:0]data_in;
    reg[1:0]address;
    reg R_W,en;
    wire [3:0]data_out;
    
 RAM_4x4 uut (.clk(clk), .data_in(data_in), .address(address), .R_W(R_W), .en(en), .data_out(data_out));
 
 initial begin 
 clk = 0 ;
 forever #5 clk = ~clk;
 end    
 initial begin 
 $monitor("t=%0t, clk=%b, data_in=%d, address=%d, R_W=%b, en=%b, data_out=%d",
           $time, clk, data_in, address, R_W, en, data_out);
           
  en = 0; data_in =4'd0; address = 2'd0; R_W = 0; #10;
  en = 1; #10;
  
  R_W = 1; data_in = 4'd15; address = 2'd0; #10;
  R_W = 1; data_in = 4'd12; address = 2'd1; #10;
  R_W = 1; data_in = 4'd10; address = 2'd2; #10;
  R_W = 1; data_in = 4'd09; address = 2'd3; #10; data_in = 4'd0;
  
  R_W = 0;  address = 2'd0; #10;
  R_W = 0;  address = 2'd1; #10;
  R_W = 0;  address = 2'd2; #10;
  R_W = 0;  address = 2'd3; #10;
  
  $finish;
          
 end 
endmodule
