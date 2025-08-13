`timescale 1ns/1ps
module tb_ring_counter;

    reg clk;
    reg rst;
    wire [3:0] q;

    // Instantiate the DUT
    ring_counter uut (
        .clk(clk),
        .rst(rst),
        .q(q)
    );

    // Clock generation: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initial values
        clk = 0;
        rst = 1;

        // Hold reset for 15ns
        #15 rst = 0;

        // Run for 100ns
        #100;

        $finish;
    end

endmodule
