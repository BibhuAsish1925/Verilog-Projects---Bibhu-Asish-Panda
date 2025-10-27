module automatic_signaling(a, b, c, d, x, clk, clr);
  output reg [1:0] a, b, c, d;
  input x;
  input clk, clr;

  // signal encodings
  parameter r  = 2'd0; // red
  parameter y  = 2'd1; // yellow
  parameter yy = 2'd2; // double yellow
  parameter g  = 2'd3; // green

  // fsm states
  parameter s0 = 3'd0;
  parameter s1 = 3'd1;
  parameter s2 = 3'd2;
  parameter s3 = 3'd3;
  parameter s4 = 3'd4;
  parameter s5 = 3'd5;
  parameter s6 = 3'd6;

  // delay constants (in clock cycles)
  integer g2rdelay  = 10;
  integer r2yydelay = 10;
  integer yy2ydelay = 10;
  integer y2gdelay  = 20;

  reg [2:0] state;
  reg [2:0] next_state;

  // state transition logic
  always @(posedge clk) begin
    if (clr)
      state <= s0;
    else
      state <= next_state;
  end

  // output logic based on current state
  always @(state) begin
    a = g; b = g; c = g; d = g; // default values

    case (state)
      s0: begin
        a = g; b = g; c = g; d = g;
      end
      s1: begin
        a = r;
      end
      s2: begin
        a = yy; b = r;
      end
      s3: begin
        a = y; b = yy; c = r;
      end
      s4: begin
        a = g; b = y; c = yy; d = r;
      end
      s5: begin
        b = g; c = y; d = yy;
      end
      s6: begin
        c = g; d = y;
      end
    endcase
  end

  // next state logic with delays
  always @(state or x) begin
    case (state)
      s0: begin
        if (x)
          next_state = s1;
        else
          next_state = s0;
      end
      s1: begin
        repeat (g2rdelay) @(posedge clk);
        next_state = s2;
      end
      s2: begin
        repeat (r2yydelay) @(posedge clk);
        next_state = s3;
      end
      s3: begin
        repeat (yy2ydelay) @(posedge clk);
        next_state = s4;
      end
      s4: begin
        repeat (y2gdelay) @(posedge clk);
        next_state = s5;
      end
      s5: begin
        repeat (g2rdelay) @(posedge clk);
        next_state = s6;
      end
      s6: begin
        if (x)
          next_state = s6;
        else
          next_state = s0;
      end
      default: next_state = s0;
    endcase
  end
endmodule