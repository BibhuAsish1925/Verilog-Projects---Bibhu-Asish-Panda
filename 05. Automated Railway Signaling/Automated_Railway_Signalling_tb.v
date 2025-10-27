module automatic_signaling_tb;

  reg clk;
  reg clr;
  reg x;
  wire [1:0] a, b, c, d;

  automatic_signaling dut (.a(a),.b(b),.c(c),.d(d),.x(x),.clk(clk),.clr(clr));

  initial clk = 0;
  always #5 clk = ~clk;

  initial begin
    $display("starting automatic_signaling testbench...");
    $monitor("time=%0t | state: a=%b b=%b c=%b d=%b | x=%b clr=%b", $time, a, b, c, d, x, clr);

    // initialise
    clr = 1; x = 0;
    #20 clr = 0; // release reset

    // trigger train arrival
    #30 x = 1;

    #300 x = 0; // train gone

    // wait for fsm to return to start
    #100;

    $finish;
  end

endmodule