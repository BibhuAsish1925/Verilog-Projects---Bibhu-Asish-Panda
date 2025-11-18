`timescale 1ns / 1ps

module Single_port_Memory #(
    parameter Depth = 1024,
    parameter Width = 16,
    parameter Addr_width = $clog2(Depth)
)(
    input clk,reset,WR,valid,                        
    input [Width-1:0] data_in,                     
    input [Addr_width-1:0]addr,      
    output reg [Width-1:0]data_out,       
    output reg ready                      
);
    reg [Width-1:0] memory [0:Depth-1];
    integer i;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            data_out <= 0;
            ready    <= 0;
            for (i = 0; i < Depth; i = i + 1)
                memory[i] <= 0;
        end 
        else begin
            if (valid) begin
                ready <= 1;
                if (WR)
                    memory[addr] <= data_in;       // Write
                else
                    data_out <= memory[addr];      // Read
            end 
            else begin
                ready <= 0;
            end
        end
    end
endmodule
