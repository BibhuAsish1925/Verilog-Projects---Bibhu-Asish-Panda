`timescale 1ns / 1ps

module ROM_4x4(

    input wire clk,en,
    input [1:0]address,
    output reg [3:0]data_out
    );
    
    reg [3:0]register[3:0];
    
    initial begin 
    
    register[0] = 4'd0;
    register[1] = 4'd5;
    register[2] = 4'd10;
    register[3] = 4'd15;
    data_out = 4'd0;
    end 
    
    always @ (posedge clk) begin 
    
    if (en)
     data_out = register[address];  
     else 
     data_out = 4'dz;
    end
    
endmodule
