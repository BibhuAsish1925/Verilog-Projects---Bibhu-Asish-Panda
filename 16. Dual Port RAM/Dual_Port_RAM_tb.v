`timescale 1ns / 1ps

module Dual_port_RAM_tb();

reg clk, R_W_A, R_W_B;
reg [1:0] address_A, address_B;
reg [3:0] data_in_A, data_in_B;
wire collision;
wire [3:0] data_out_A, data_out_B;

Dual_port_RAM uut (.clk(clk), .R_W_A(R_W_A), .R_W_B(R_W_B),.address_A(address_A), .address_B(address_B),.data_in_A(data_in_A), .data_in_B(data_in_B), .collision(collision),.data_out_A(data_out_A), .data_out_B(data_out_B) );

initial begin 
    clk = 0; 
    forever #5 clk = ~clk;
end     
             
initial begin 
    $monitor("t=%0t | clk=%b | R_W_A=%b addr_A=%0d din_A=%0d dout_A=%0d | R_W_B=%b addr_B=%0d din_B=%0d dout_B=%0d",
              $time, clk, R_W_A, address_A, data_in_A, data_out_A,R_W_B, address_B, data_in_B, data_out_B);                          
end
initial begin
    data_in_A = 4'd0; data_in_B = 4'd0; 
    address_A = 2'd0; address_B = 2'd0; 
    R_W_A = 0; R_W_B = 0;

    R_W_A = 1; address_A = 2'd0; data_in_A = 4'd0; #10;
    R_W_A = 1; address_A = 2'd1; data_in_A = 4'd3; #10;
    R_W_A = 1; address_A = 2'd2; data_in_A = 4'd6; #10;
    R_W_A = 1; address_A = 2'd3; data_in_A = 4'd9; #10;

    R_W_B = 1; address_B = 2'd0; data_in_B = 4'd0; #10;
    R_W_B = 1; address_B = 2'd1; data_in_B = 4'd5; #10;
    R_W_B = 1; address_B = 2'd2; data_in_B = 4'd10; #10;
    R_W_B = 1; address_B = 2'd3; data_in_B = 4'd15; #10;

    R_W_A = 0; address_A = 2'd0; #10;
    R_W_A = 0; address_A = 2'd1; #10;
    R_W_A = 0; address_A = 2'd2; #10;
    R_W_A = 0; address_A = 2'd3; #10;

    R_W_B = 0; address_B = 2'd0; #10;
    R_W_B = 0; address_B = 2'd1; #10;
    R_W_B = 0; address_B = 2'd2; #10;
    R_W_B = 0; address_B = 2'd3; #10;   

    // Case 1: Port A writes, Port B reads SAME address
    R_W_A = 1; address_A = 2'd1; data_in_A = 4'd7;
    R_W_B = 0; address_B = 2'd1; #10;

    // Case 2: Port A writes addr=2, Port B writes addr=3 (different addresses same cycle)
    R_W_A = 1; address_A = 2'd2; data_in_A = 4'd8;
    R_W_B = 1; address_B = 2'd3; data_in_B = 4'd12; #10;

    // Case 3: Both ports write SAME address at the same time
    R_W_A = 1; address_A = 2'd0; data_in_A = 4'd4;
    R_W_B = 1; address_B = 2'd0; data_in_B = 4'd11; #10;

    // Read final values
    R_W_A = 0; address_A = 2'd0; #10;
    R_W_A = 0; address_A = 2'd1; #10;
    R_W_A = 0; address_A = 2'd2; #10;
    R_W_A = 0; address_A = 2'd3; #10;

    $finish;          
end 

endmodule
