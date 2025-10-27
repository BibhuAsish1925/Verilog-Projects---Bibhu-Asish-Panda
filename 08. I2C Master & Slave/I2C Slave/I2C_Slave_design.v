`timescale 1ns / 1ps

module I2C_Slave(
    input  wire clk,reset,scl,sda,       
    output reg [7:0] data_out, 
    output reg valid           
);

    reg [2:0] bit_count;
    reg [7:0] shift_reg;
    reg scl_d, sda_d;

    always @(posedge clk) begin
        scl_d <= scl;
        sda_d <= sda;
    end

    wire scl_rise = (scl & ~scl_d);

    assign sda = 1'bz;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            bit_count <= 0;
            shift_reg <= 0;
            data_out <= 0;
            valid <= 0;
        end else begin
            valid <= 0; 

            if (scl_rise) begin
                shift_reg <= {shift_reg[6:0], sda}; 
                bit_count <= bit_count + 1;

                if (bit_count == 7) begin
                    data_out <= {shift_reg[6:0], sda}; 
                    valid <= 1;                        
                    bit_count <= 0;                     
                end
            end
        end
    end

endmodule


