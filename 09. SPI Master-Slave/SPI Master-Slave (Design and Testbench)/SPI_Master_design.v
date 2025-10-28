`timescale 1ns / 1ps

module SPI_Master(
    input clk,                       // System clock
    input reset,                     // Reset
    input start,                     // Start transmission
    input [7:0] data_in,             // Data to send
    output reg [7:0] data_out,       // Data received
    output reg done,                 // Transfer complete

    // SPI lines
    output reg sclk,                 // SPI clock
    output reg mosi,                 // Master Out
    input miso,                      // Master In
    output reg ss                    // Slave Select (active low)
);

    reg [2:0] bit_cnt;
    reg [7:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            ss <= 1'b1;
            sclk <= 1'b0;
            mosi <= 1'b0;
            data_out <= 8'd0;
            done <= 1'b0;
            bit_cnt <= 3'd0;
            shift_reg <= 8'd0;
        end
        else begin
            if (start && !done) begin
                ss <= 1'b0;  // Select slave
                sclk <= ~sclk;  // Toggle SPI clk

                if (sclk == 1'b0) begin
                    mosi <= data_in[7 - bit_cnt];      // On falling edge: put data on MOSI
                end else begin
                    shift_reg[7 - bit_cnt] <= miso;    // On rising edge: read data from MISO
                    bit_cnt <= bit_cnt + 1'b1;
                end

                if (bit_cnt == 3'd7 && sclk == 1'b1) begin
                    data_out <= shift_reg;
                    done <= 1'b1;
                    ss <= 1'b1; // Deselect slave
                end
            end
            else if (done) begin
                // Hold after transfer
                sclk <= 1'b0;
            end
        end
    end
endmodule

