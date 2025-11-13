`timescale 1ns / 1ps

module UART_Rx(
  input clk, reset, rx,
  output reg [7:0] data_out,
  output reg done
);
  reg [3:0] count;
  reg receiving;

  always @(posedge clk or posedge reset) begin
    if (reset) begin
      count <= 0;
      receiving <= 0;
      done <= 0;
    end
    else if (!receiving && rx == 0) begin
      receiving <= 1;    // start bit detected
      count <= 0;
      done <= 0;
    end
    else if (receiving) begin
      count <= count + 1;
      case(count)
        1: data_out[0] <= rx;
        2: data_out[1] <= rx;
        3: data_out[2] <= rx;
        4: data_out[3] <= rx;
        5: data_out[4] <= rx;
        6: data_out[5] <= rx;
        7: data_out[6] <= rx;
        8: data_out[7] <= rx;
        9: begin done <= 1; receiving <= 0; end // stop bit
      endcase
    end
  end
endmodule

