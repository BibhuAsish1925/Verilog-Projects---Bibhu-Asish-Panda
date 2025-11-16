`timescale 1ns / 1ps

module Electronic_Voting_machine_tb();

reg clk, reset;
reg [3:0] vote;
wire [7:0] count0, count1, count2, count3, count4, count5, count6, count7, count8, count9;

Electronic_Voting_machine uut(.clk(clk), .reset(reset), .vote(vote),.count0(count0), .count1(count1), .count2(count2), .count3(count3), .count4(count4), .count5(count5),.count6(count6), .count7(count7), .count8(count8),.count9(count9));

always #5 clk = ~clk;

initial begin
    clk = 0;
    reset = 1; vote = 0;

    #10 reset = 0;

    #10 vote = 4;
    #10 vote = 2;
    #10 vote = 2;
    #10 vote = 9;
    #10 vote = 4;
    #10 vote = 1;
    #10 vote = 9;
    #10 vote = 7;
    #10 vote = 2;
    #10 vote = 9;
    #10 vote = 4;
    #10 vote = 8;
    #10 vote = 8;
    #10 vote = 8;
    #10 vote = 4;
    #10 vote = 9;
    #10 vote = 2;
    #10 vote = 9;
    #10 vote = 3;
    #10 vote = 5;
    #10 vote = 6;
    #10 vote = 0;
    #10 vote = 3;
    #10 vote = 5;
    #10 vote = 6;
    #10 vote = 1;
    #10 vote = 2;
    #10 vote = 4;
    #10 vote = 4;
    #10 vote = 7;
    #10 vote = 1;
    #10 vote = 3;
    #10 vote = 4;
    #10 vote = 7;
    #10 vote = 5;
    #10 vote = 9;
    #10 vote = 9;
    #10 vote = 8;
    #10 vote = 7;
    #10 vote = 6;
    #10 vote = 5;
    #10 vote = 3;
    #10 vote = 2;
    #10 vote = 1;
    #10 vote = 0;
    #10 vote = 2;
    #10 vote = 4;
    #10 vote = 6;
    #10 vote = 8;


    #30;
    $display("C0 votes = %d", count0);
    $display("C1 votes = %d", count1);
    $display("C2 votes = %d", count2);
    $display("C3 votes = %d", count3);
    $display("C4 votes = %d", count4);
    $display("C5 votes = %d", count5);
    $display("C6 votes = %d", count6);
    $display("C7 votes = %d", count7);
    $display("C8 votes = %d", count8);
    $display("C9 votes = %d", count9);

    $finish;
end

endmodule

