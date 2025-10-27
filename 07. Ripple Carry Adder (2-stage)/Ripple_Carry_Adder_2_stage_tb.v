`timescale 1ns / 1ps

module Ripple_carry_adder_2_stage_tb();
  reg clk;
  reg [3:0] a,b;
  reg cin;
  wire [3:0] sum; 
  wire cout;

  Ripple_carry_adder_2_stage DUT (.clk(clk),.a(a),.b(b),.cin(cin),.sum(sum),.cout(cout));

  initial begin
    clk = 0;
    forever #5 clk = ~clk;
  end

  initial begin

    a = 4'd0;  b = 4'd0;  cin = 1'b0;  #10; // apply at t=0..10
    $display("t=%0t a=%0d b=%0d cin=%b -> sum=%0d cout=%b", $time, a, b, cin, sum, cout);

    a = 4'd1;  b = 4'd1;  cin = 1'b1;  #10;
    $display("t=%0t a=%0d b=%0d cin=%b -> sum=%0d cout=%b", $time, a, b, cin, sum, cout);

    a = 4'd11; b = 4'd1;  cin = 1'b1;  #10;
    $display("t=%0t a=%0d b=%0d cin=%b -> sum=%0d cout=%b", $time, a, b, cin, sum, cout);

    a = 4'd14; b = 4'd5;  cin = 1'b1;  #10;
    $display("t=%0t a=%0d b=%0d cin=%b -> sum=%0d cout=%b", $time, a, b, cin, sum, cout);

    a = 4'd14; b = 4'd5;  cin = 1'b0;  #10;
    $display("t=%0t a=%0d b=%0d cin=%b -> sum=%0d cout=%b", $time, a, b, cin, sum, cout);

    #50;
    $finish;
  end
endmodule
