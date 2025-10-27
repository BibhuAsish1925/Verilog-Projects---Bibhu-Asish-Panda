//project Vending Machine

module vending_machine(can_despatch,clk,coin,rst);
  output can_despatch;
  input [1:0] coin;
  input clk,rst;
  reg [1:0] state;
  reg [1:0] next_state;
  parameter s0=0;
  parameter s5=1;
  parameter s10=2;
  parameter s15=3;
  always @(posedge clk)
    begin
      if (rst)
        state=s0;
      else
        state=next_state;
    end
  always @(state,coin)
    begin
      case (state)
        s0: begin
          if (coin==2'b00)
            next_state=s0;
          else if (coin==2'b01)
            next_state=s5;
          else if (coin==2'b10)
            next_state=s10;
        end

        s5: begin         
          if (coin==2'b00)
            next_state=s5;
          else if (coin==2'b01)
              next_state=s10;
          else if (coin==2'b10)
              next_state=s15;
        end

        s10: begin
          if (coin==2'b00)
            next_state=s10;
          else if (coin==2'b01)
            next_state=s15;
          else if (coin==2'b10)
            next_state=s15; 
        end

        s15: begin
          if (coin==2'b00)
            next_state=s0;
          else if (coin==2'b01)
            next_state=s5;
          else if (coin==2'b10)
            next_state=s10; 
        end 

        default : next_state=s0; 
      endcase // case (state)
    end // always @
  assign can_despatch = (state==s15) ? 1 : 0; 
endmodule