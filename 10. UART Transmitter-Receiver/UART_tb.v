`timescale 1ns / 1ps

module UART_tb();
  reg clk = 0, reset, start;
  reg [7:0] data;
  wire tx;
  wire [7:0] rx_data;
  wire done;

  UART_Tx TX(clk, reset, start, data, tx);
  UART_Rx RX(clk, reset, tx, rx_data, done);

  always #5 clk = ~clk; // clock

  initial begin
    
    reset = 1; start = 0; data = 8'h00;
    #10 reset = 0;

    #10 data = 8'hA5; start = 1; #10 start = 0; // send 0xA5
    wait(done);
    $display("Received: %h", rx_data);
    #20 $finish;
  end
endmodule

