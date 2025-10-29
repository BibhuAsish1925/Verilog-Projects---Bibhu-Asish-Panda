`timescale 1ns / 1ps

module ALU_4_bit(
    input  [3:0] a,b,
    input  [2:0] s,
    output reg [3:0] y,
    output reg carry,zero
);
    always @(*) begin
        carry = 0;
        case (s)
            3'b000 : {carry, y} = a + b;      // Add
            3'b001 : {carry, y} = a - b;      // Sub
            3'b010 : y = a & b;               // AND
            3'b011 : y = a | b;               // OR
            3'b100 : y = a ^ b;               // XOR
            3'b101 : y = ~a;                  // NOT(on a)
            3'b110 : y = a << b;              // Shift Left
            3'b111 : y = a >> b;              // Shift Right
            default: y = 4'b0000;             // Default 
        endcase

        zero = (y == 4'b0000) ? 1'b1 : 1'b0;
    end
endmodule
