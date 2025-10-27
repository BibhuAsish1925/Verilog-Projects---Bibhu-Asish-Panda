module Digital_Lock_tb;
  reg clk, b0,b1, reset;
  wire unlock;
  integer i;
  reg[4:0] data;  
  always #10 clk= ~clk;  
  lock u0 (clk, reset, b0, b1, unlock);  
  initial begin
    $monitor("i=%0d, Time=%0d, reset=%b, b0=%b, b1=%b,unlock=%b",i, $time, reset, b0, b1, unlock);
    
    $dumpfile("tb.vcd");
    $dumpvars(1, tb);
    clk= 0;
    reset = 1;
    #50 reset = 0;   
    data = 5'b01011;
    i=0;
    #130     $finish; 
  end  

  always  @ (posedge clk) begin
    b0 = data[5-i] ? 0 : 1;
    b1 = data[5-i] ? 1 : 0;
    i= i+1;
  end    
endmodule