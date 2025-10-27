`timescale 1ns / 1ps

module I2C_Master (
    input  wire       clk,        // System clock
    input  wire       reset,      // Reset signal
    input  wire       start,      // Start transfer
    input  wire [6:0] slave_addr, // 7-bit I2C slave address
    input  wire [7:0] data_in,    // Data to write
    output reg        scl,        // I2C clock
    inout  wire       sda,        // I2C data line (bidirectional)
    output reg        done        // Transfer complete flag
);

    // I2C states (Verilog style)
    localparam IDLE  = 3'b000,
               START = 3'b001,
               ADDR  = 3'b010,
               DATA  = 3'b011,
               STOP  = 3'b100;

    reg [2:0] state;
    reg [3:0] bit_cnt;
    reg sda_out;
    reg sda_oe; // output enable for SDA

    assign sda = sda_oe ? sda_out : 1'bz;  // Tri-state SDA

    // Generate SCL clock (simple divider)
    reg [7:0] clk_div;
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            clk_div <= 0;
            scl <= 1;
        end else begin
            clk_div <= clk_div + 1;
            if (clk_div == 100) begin
                scl <= ~scl;
                clk_div <= 0;
            end
        end
    end

    // FSM
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            state <= IDLE;
            done <= 0;
            bit_cnt <= 0;
            sda_out <= 1;
            sda_oe <= 0;
        end else begin
            case (state)
                IDLE: begin
                    done <= 0;
                    if (start) begin
                        state <= START;
                        sda_out <= 0;  // START condition
                        sda_oe <= 1;
                    end
                end

                START: begin
                    bit_cnt <= 7;
                    state <= ADDR;
                end

                ADDR: begin
                    sda_out <= slave_addr[bit_cnt];
                    sda_oe <= 1;
                    if (scl) begin
                        if (bit_cnt == 0)
                            state <= DATA;
                        else
                            bit_cnt <= bit_cnt - 1;
                    end
                end

                DATA: begin
                    sda_out <= data_in[bit_cnt];
                    sda_oe <= 1;
                    if (scl) begin
                        if (bit_cnt == 0)
                            state <= STOP;
                        else
                            bit_cnt <= bit_cnt - 1;
                    end
                end

                STOP: begin
                    sda_out <= 0;
                    sda_oe <= 1;
                    if (scl) begin
                        sda_out <= 1;  // STOP condition
                        done <= 1;
                        state <= IDLE;
                    end
                end
            endcase
        end
    end
endmodule
