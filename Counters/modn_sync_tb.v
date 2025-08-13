`timescale 1ns/1ps

module tb_modN_counter;

    // Parameters for simulation
    parameter N = 5;
    parameter WIDTH = $clog2(N);

    // Testbench signals
    reg clk;
    reg reset;
    reg enable;
    wire [WIDTH-1:0] count;
    wire tc;

    // Instantiate DUT
    modN_counter #(.N(N), .WIDTH(WIDTH)) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count),
        .tc(tc)
    );

    // Clock generation: 10ns period
    initial clk = 0;
    always #5 clk = ~clk;

    // Stimulus
    initial begin
        $display("Time\tReset\tEnable\tCount\tTC");
        $monitor("%0t\t%b\t%b\t%0d\t%b", $time, reset, enable, count, tc);

        // Initial values
        reset = 1;
        enable = 0;

        // Apply reset
        #10 reset = 0;
        enable = 1;

        // Run for a few cycles
        #100;

        // Disable counting
        enable = 0;
        #20;

        // Enable again
        enable = 1;
        #50;

        // Finish simulation
        $finish;
    end
endmodule
