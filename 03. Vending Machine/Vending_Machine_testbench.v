module Vending_Machine_tb;
  reg clk, rst;
  wire can_despatch;
  integer i;
  reg [1:0] coin_stack [0:5] , coin; 
  always #10 clk = ~clk; 
  
  vending_machine u0(can_despatch,clk,coin,rst); 

  initial begin
    $monitor("i=%0d  Time=%0d  reset=%b  coin=%b  can-despatched=%b",i, $time, rst, coin, can_despatch);
    $dumpfile("dump.vcd");
    $dumpvars;
    
    clk = 0;
    rst = 1;
    #50 rst = 0; 
    coin_stack[0]=2'b00; // 0 rupee
    coin_stack[1]=2'b01; // 5 rupee
    coin_stack[2]=2'b10; //10 rupee
    coin_stack[3]=2'b01; // 5 rupee
    coin_stack[4]=2'b10; //10 rupee
    coin_stack[5]=2'b00; // 0 rupee
    i=0;
    #130 $finish; 
  end 
  always @ (posedge clk) begin
    coin = coin_stack[i];
    i = i+1;
  end 
endmodule