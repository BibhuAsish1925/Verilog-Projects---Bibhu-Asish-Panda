`timescale 1ns / 1ps

module Dual_port_RAM(
    input clk,R_W_A,R_W_B,
    input [1:0]address_A,address_B,
    input [3:0]data_in_A,data_in_B,
    output reg [3:0]data_out_A,data_out_B,
    output reg collision
    );
    
    reg [3:0]register[3:0];
    integer i;
    initial begin 
     data_out_A = 4'dz;
     data_out_B = 4'dz;
     collision = 0;
     for (i = 0;  i < 4; i = i + 1) begin 
     register[i] = 2'b0;
     end
    end
    
  always @ (posedge clk) begin
    if (R_W_A) begin 
    register[address_A] <= data_in_A ;
    data_out_A <= 4'dz;
    end
    else 
    data_out_A <= register[address_A];
  end 
  
  always @ (posedge clk) begin 
   if (R_W_B) begin 
   register[address_B] <= data_in_B ;
   data_out_B <= 4'dz; end
   else
   data_out_B <= register[address_B];
  end
  
always @(posedge clk) begin
  collision <= 1'b0;
  if (R_W_A && R_W_B && (address_A == address_B)) begin
    collision <= 1'b1;
  end else begin
    if (R_W_A) register[address_A] <= data_in_A;
    if (R_W_B) register[address_B] <= data_in_B;
  end
end
  
endmodule

