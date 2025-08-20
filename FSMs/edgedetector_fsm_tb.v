`timescale 1ns/1ps

module EdgeDetectorFSM_tb;

    reg clk;
    reg rst_n;
    reg signal_in;
    wire edge_out;

    EdgeDetectorFSM uut (
        .clk(clk),
        .rst_n(rst_n),
        .signal_in(signal_in),
        .edge_out(edge_out)
    );

    // Clock generation
    always #5 clk = ~clk;
    initial begin
        clk = 0;
        rst_n = 0;
        signal_in = 0;
        #10 rst_n = 1;

        // Input pattern with rising edges at 15ns, 45ns, 75ns
        #5  signal_in = 0;
        #10 signal_in = 1;  // rising edge → edge_out = 1
        #10 signal_in = 1;
        #10 signal_in = 0;
        #10 signal_in = 1;  // rising edge → edge_out = 1
        #10 signal_in = 0;
        #10 signal_in = 1;  // rising edge → edge_out = 1
        #10 signal_in = 1;
        #10 signal_in = 0;

        #20 $finish;
    end

endmodule
