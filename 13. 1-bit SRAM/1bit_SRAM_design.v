`timescale 1ns / 1ps

module SRAM_1bit(
    input wire clk,data_in,read_write,address,
    output reg data_out
    );
    
    reg data; //storage element
    
    always @(posedge clk) begin
        if ( read_write && address) begin
            data <= data_in;       // Write operation
        end
    end

    always @(*) begin
        if (!read_write && address) begin
            data_out = data;       // Read operation
        end else begin
            data_out = 1'bz;      // High impedance when not selected
        end
    end

endmodule

