// Project-3 Traffic Signal

module traffic_control(n_light, s_light, e_light, w_light, clk, rst_a);
  output reg[2:0] n_light, s_light, e_light, w_light;
  input clk;
  input rst_a;
  reg[2:0] state;

  parameter[2:0] north   = 3'b000;
  parameter[2:0] north_y = 3'b001;
  parameter[2:0] south   = 3'b010;
  parameter[2:0] south_y = 3'b011;
  parameter[2:0] east    = 3'b100;
  parameter[2:0] east_y  = 3'b101;
  parameter[2:0] west    = 3'b110;
  parameter[2:0] west_y  = 3'b111;
  
  reg[2:0] count;

  always @(posedge clk, posedge rst_a)
  begin
    if (rst_a)
    begin
      state = north;
      count = 3'b000;
    end 
    else 
    begin
      case (state)
      
        // North Green Light State
        north:
        begin
          n_light = 3'b001;  // Green for north
          s_light = 3'b000;  // Red for south
          e_light = 3'b000;  // Red for east
          w_light = 3'b000;  // Red for west
          
          if (count == 3'b111)
          begin
            count = 3'b000;
            state = north_y;
          end
          else
          begin
            count = count + 3'b001;
          end
        end
        
        // North Yellow Light State
        north_y:
        begin
          n_light = 3'b010;  // Yellow for north
          if (count == 3'b011)
          begin
            count = 3'b000;
            state = south;
          end
          else
          begin
            count = count + 3'b001;
          end
        end
        
        // South Green Light State
        south:
        begin
          s_light = 3'b001;  // Green for south
          n_light = 3'b000;  // Red for north
          e_light = 3'b000;  // Red for east
          w_light = 3'b000;  // Red for west
          
          if (count == 3'b111)
          begin
            count = 3'b000;
            state = south_y;
          end
          else
          begin
            count = count + 3'b001;
          end
        end
        
        // South Yellow Light State
        south_y:
        begin
          s_light = 3'b010;  // Yellow for south
          if (count == 3'b011)
          begin
            count = 3'b000;
            state = east;
          end
          else
          begin
            count = count + 3'b001;
          end
        end

        // East Green Light State
        east:
        begin
          e_light = 3'b001;  // Green for east
          n_light = 3'b000;  // Red for north
          s_light = 3'b000;  // Red for south
          w_light = 3'b000;  // Red for west
          
          if (count == 3'b111)
          begin
            count = 3'b000;
            state = east_y;
          end
          else
          begin
            count = count + 3'b001;
          end
        end
        
        // East Yellow Light State
        east_y:
        begin
          e_light = 3'b010;  // Yellow for east
          if (count == 3'b011)
          begin
            count = 3'b000;
            state = west;
          end
          else
          begin
            count = count + 3'b001;
          end
        end

        // West Green Light State
        west:
        begin
          w_light = 3'b001;  // Green for west
          n_light = 3'b000;  // Red for north
          s_light = 3'b000;  // Red for south
          e_light = 3'b000;  // Red for east
          
          if (count == 3'b111)
          begin
            count = 3'b000;
            state = west_y;
          end
          else
          begin
            count = count + 3'b001;
          end
        end
        
        // West Yellow Light State
        west_y:
        begin
          w_light = 3'b010;  // Yellow for west
          if (count == 3'b011)
          begin
            count = 3'b000;
            state = north;
          end
          else
          begin
            count = count + 3'b001;
          end
        end
        
        default: state = north;

      endcase
    end
  end

endmodule
