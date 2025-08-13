`timescale 1ns/1ps

module tb_modN_async_counter;

    parameter N = 6;
    parameter WIDTH = $clog2(N);

    reg clk;
    reg reset;
    reg enable;
    wire [WIDTH-1:0] count;
    wire tc;

    modN_async_counter #(.N(N), .WIDTH(WIDTH)) uut (
        .clk(clk),
        .reset(reset),
        .enable(enable),
        .count(count),
        .tc(tc)
    );

    // Clock generator
    initial clk = 0;
    always #5 clk = ~clk;

    initial begin
        $display("Time\tReset\tEnable\tCount\tTC");
        $monitor("%0t\t%b\t%b\t%0d\t%b", $time, reset, enable, count, tc);

        reset = 1; enable = 0; #10;
        reset = 0; enable = 1; #100;
        enable = 0; #20; enable = 1; #50;
        reset = 1; #10; reset = 0; #50;

        $finish;
    end

endmodule
