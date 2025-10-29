`timescale 1ns / 1ps

module Barrel_Shifter(

    input [3:0] data_in,
    input [1:0] shift_amt, 
    input dir,            
    output reg [3:0] data_out
);

    always @(*) begin
        case (dir)
            1'b0:  // Logical Left Shift
                case (shift_amt)
                    2'd0: data_out = data_in;
                    2'd1: data_out = {data_in[2:0], 1'b0};
                    2'd2: data_out = {data_in[1:0], 2'b00};
                    2'd3: data_out = {data_in[0], 3'b000};
                endcase
            1'b1:  // Logical Right Shift
                case (shift_amt)
                    2'd0: data_out = data_in;
                    2'd1: data_out = {1'b0, data_in[3:1]};
                    2'd2: data_out = {2'b00, data_in[3:2]};
                    2'd3: data_out = {3'b000, data_in[3]};
                endcase
        endcase
    end

endmodule

