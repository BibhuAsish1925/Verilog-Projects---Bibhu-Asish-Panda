//project Digital Lock

module lock ( input clk,reset,b0,b1, output unlock );
  parameter S_RESET = 0; 
  parameter S_0 = 1;
  parameter S_01 = 2;
  parameter S_010 = 3;
  parameter S_0101 = 4;
  parameter S_01011 = 5;
  reg [2:0] state, next_state;
  always @(*) begin
    
    if (reset) next_state = S_RESET;
    else case (state)
      S_RESET: next_state = b0 ? S_0 : b1 ? S_RESET : state;
      S_0: next_state= b0 ? S_0 : b1 ? S_01 : state;         
      S_01: next_state = b0 ? S_010 : b1 ? S_RESET : state;
      S_010: next_state = b0 ? S_0 : b1 ? S_0101 : state;
      S_0101: next_state = b0 ? S_010 : b1 ? S_01011 : state;
      S_01011: next_state = b0 ? S_0 : b1 ? S_RESET : state;
      default: next_state = S_RESET; // handle unused states
    endcase
  end

  always @(posedge clk) 
    state <= next_state ;  
  assign unlock = state == S_01011 ? 1 : 0;  
endmodule