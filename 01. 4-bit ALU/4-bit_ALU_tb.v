`timescale 1ns / 1ps
module ALU_4_bit_tb;

    reg [3:0] a,b;
    reg [2:0] s;
    wire [3:0] y;
    wire carry,zero;

    ALU_4_bit uut (.a(a), .b(b),.s(s),.y(y),.carry(carry),.zero(zero));

    initial begin
        // Initial
        a = 4'b1010; 
        b = 4'b0101;

        s = 3'b000; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        s = 3'b001; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        s = 3'b010; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        s = 3'b011; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        s = 3'b100; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        s = 3'b101; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        s = 3'b110; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        s = 3'b111; #10;
        $display("t=%0t, s=%b, y=%b, carry=%b, zero=%b", $time, s, y, carry, zero);

        $finish;
    end
endmodule
