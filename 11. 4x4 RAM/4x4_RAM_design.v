`timescale 1ns / 1ps

module RAM_4x4(

    input clk,
    input [3:0]data_in,
    input [1:0]address,
    input R_W,en,
    output reg [3:0]data_out
    );
    
   integer i ;
   reg [3:0]register[3:0];
   initial begin 
    data_out = 4'd0;  
    for (i = 0 ; i < 4 ; i = i + 1) begin
     register[i] = 4'd0;
    
    end 
   end 
   
   always @ (posedge clk) begin 
     if (en) begin 
       if (R_W)  begin  
       register[address] = data_in;
       data_out = 4'dz;
     end end
     end
  
   always @ (*) begin 
    if (en) begin 
     if (!R_W) begin 
       data_out = register[address];
       end else 
       data_out = 4'dz;
      
    end 
   end
endmodule
