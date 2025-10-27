module traffic_control_tb;
  reg clk;
  reg rst_a;
  wire [2:0] n_light, s_light, e_light, w_light;

  // Instantiate the traffic control module
  traffic_control uut (
    .n_light(n_light),
    .s_light(s_light),
    .e_light(e_light),
    .w_light(w_light),
    .clk(clk),
    .rst_a(rst_a)
  );

  initial begin
    $dumpfile("dump.vcd"); $dumpvars;
    clk = 0;
    forever #1 clk = ~clk;
  end

  initial begin
    rst_a = 1;
    #5;  
    rst_a = 0;
    
    $display("Time=%0d  Starting simulation with defined timing for each direction...",$time);

    // North Direction
    #16;  
    if (n_light == 3'b001 && s_light == 3'b000 && e_light == 3'b000 && w_light == 3'b000) 
      $display("Time=%0d  N: Green - PASS",$time);
    else
      $display("Time=%0d  N: Green - FAIL",$time);

    #8;   
    if (n_light == 3'b010)
      $display("Time=%0d  N: Yellow - PASS",$time);
    else
      $display("Time=%0d  N: Yellow - FAIL",$time);

    // South Direction
    #16;  
    if (s_light == 3'b001 && n_light == 3'b000 && e_light == 3'b000 && w_light == 3'b000)
      $display("Time=%0d  S: Green - PASS",$time);
    else
      $display("Time=%0d  S: Green - FAIL",$time);

    #8;   
    if (s_light == 3'b010)
      $display("Time=%0d  S: Yellow - PASS",$time);
    else
      $display("Time=%0d  S: Yellow - FAIL",$time);

    // East Direction
    #16;  
    if (e_light == 3'b001 && n_light == 3'b000 && s_light == 3'b000 && w_light == 3'b000)
      $display("Time=%0d  E: Green - PASS",$time);
    else
      $display("Time=%0d  E: Green - FAIL",$time);

    #8;   
    if (e_light == 3'b010)
      $display("Time=%0d  E: Yellow - PASS",$time);
    else
      $display("Time=%0d  E: Yellow - FAIL",$time);

    // West Direction
    #16;  
    if (w_light == 3'b001 && n_light == 3'b000 && s_light == 3'b000 && e_light == 3'b000)
      $display("Time=%0d  W: Green - PASS",$time);
    else
      $display("Time=%0d  W: Green - FAIL",$time);

    #8;   
    if (w_light == 3'b010)
      $display("Time=%0d  W: Yellow - PASS",$time);
    else
      $display("Time=%0d  W: Yellow - FAIL",$time);

    $display("Time=%0d  Simulation complete",$time);
    $stop;
  end
endmodule