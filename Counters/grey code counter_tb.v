`timescale 1ns/1ps
module tb_gray_counter;

    reg clk;
    reg rst;
    wire [3:0] gray;

    // Instantiate DUT
    gray_counter uut (
        .clk(clk),
        .rst(rst),
        .gray(gray)
    );

    // Generate clock with 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        // Apply reset
        rst = 1;
        #12 rst = 0;

        // Run for 200ns
        #200;
        $stop;
    end
endmodule
