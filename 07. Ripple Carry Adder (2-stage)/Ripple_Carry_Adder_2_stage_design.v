`timescale 1ns / 1ps

module Ripple_carry_adder_2_stage(
  input clk,
  input  wire [3:0]  a,b,
  input cin,
  output reg  [3:0]sum,   
  output reg cout   
);

  // stage0 combinational wires
  wire s0_w, s1_w;
  wire c0_w, c1_w;

  // pipeline registers between stage0 and stage1
  reg a2_reg, b2_reg, a3_reg, b3_reg;
  reg c1_reg;
  reg s0_reg, s1_reg;

  // stage1 combinational wires (operate on registered inputs)
  wire s2_w, s3_w;
  wire c2_w, c3_w;

  // --- stage0: LSB half (combinational) ---
  full_adder FA0 (.a(a[0]), .b(b[0]), .cin(cin), .sum(s0_w), .cout(c0_w));
  full_adder FA1 (.a(a[1]), .b(b[1]), .cin(c0_w), .sum(s1_w), .cout(c1_w));

  // --- stage1: MSB half (combinational, using registered inputs) ---
  full_adder FA2 (.a(a2_reg), .b(b2_reg), .cin(c1_reg), .sum(s2_w), .cout(c2_w));
  full_adder FA3 (.a(a3_reg), .b(b3_reg), .cin(c2_w), .sum(s3_w), .cout(c3_w));

  // pipeline regs and o/p regs
  always @(posedge clk) begin
    // register stage0 outputs and carry to feed stage1 next cycle
    s0_reg   <= s0_w;
    s1_reg   <= s1_w;
    c1_reg   <= c1_w;

    // register the higher operand bits to be used in stage1
    a2_reg <= a[2];
    b2_reg <= b[2];
    a3_reg <= a[3];
    b3_reg <= b[3];

    // register final results computed from stage1
    sum[0] <= s0_reg;   
    sum[1] <= s1_reg;
    sum[2] <= s2_w;     
    sum[3] <= s3_w;
    cout     <= c3_w;
  end

endmodule



module full_adder (
  input a,b,cin,
  output sum,cout
);
  assign sum  = a ^ b ^ cin;
  assign cout = (a & b) | (b & cin) | (cin & a);
endmodule
