`timescale 1ns / 1ps

module Electronic_Voting_machine(
    input clk,reset,
    input [3:0] vote,        // candidate number : 0-9
    output reg [7:0] count0,count1,count2,count3,count4,count5,count6,count7,count8,count9
);

always @(posedge clk or posedge reset) begin
    if(reset) begin
        count0 <= 0; 
        count1 <= 0; 
        count2 <= 0; 
        count3 <= 0; 
        count4 <= 0;
        count5 <= 0; 
        count6 <= 0; 
        count7 <= 0; 
        count8 <= 0; 
        count9 <= 0;
    end
    else begin
        case(vote)
            4'd0: count0 <= count0 + 1;
            4'd1: count1 <= count1 + 1;
            4'd2: count2 <= count2 + 1;
            4'd3: count3 <= count3 + 1;
            4'd4: count4 <= count4 + 1;
            4'd5: count5 <= count5 + 1;
            4'd6: count6 <= count6 + 1;
            4'd7: count7 <= count7 + 1;
            4'd8: count8 <= count8 + 1;
            4'd9: count9 <= count9 + 1;
        endcase
    end
end

endmodule

