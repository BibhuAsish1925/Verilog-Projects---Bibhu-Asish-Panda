`timescale 1ns / 1ps

module UART_Tx(
  input clk, reset, start,
  input [7:0] data,
  output reg tx
);
  reg [3:0] count;
  reg sending;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      tx <= 1;          // idle high
      count <= 0;
      sending <= 0;
    end
    else if (start && !sending) begin
      sending <= 1;
      count <= 0;
    end
    else if (sending) begin
      case(count)
        0: tx <= 0;             // start bit
        1: tx <= data[0];
        2: tx <= data[1];
        3: tx <= data[2];
        4: tx <= data[3];
        5: tx <= data[4];
        6: tx <= data[5];
        7: tx <= data[6];
        8: tx <= data[7];
        9: tx <= 1;             // stop bit
      endcase

      count <= count + 1;
      if (count == 9) sending <= 0;
    end
  end
endmodule

