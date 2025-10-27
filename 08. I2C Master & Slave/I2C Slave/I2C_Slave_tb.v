`timescale 1ns / 1ps

module I2C_Slave_tb;

    reg clk, reset,scl,sda_in;
    wire sda;
    wire [7:0] data_out;
    wire valid;

    assign sda = sda_in;

    I2C_Slave uut(.clk(clk),.reset(reset),.scl(scl),.sda(sda),.data_out(data_out),.valid(valid));
    
    initial clk = 0;
    always #5 clk = ~clk; 

    initial begin
 
        reset = 1; scl = 1; sda_in = 1;
        #20;
        reset = 0;
        #20;

        send_byte(8'hA5);

        #100;
        $display("Slave received: %h, valid = %b", data_out, valid);
        $finish;
    end

    task send_byte(input [7:0] byte);
        integer i;
        begin
            for (i = 7; i >= 0; i = i - 1) begin
                sda_in = byte[i];   
                scl = 0; #50;       
                scl = 1; #50;       
            end
        end
    endtask

endmodule
