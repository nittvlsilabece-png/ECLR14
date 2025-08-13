`timescale 1ns/1ps
module tb_sync_up_counter_jk;
    reg clk, reset;
    wire [3:0] q;

    // Instantiate counter
    sync_up_counter_jk uut (
        .clk(clk),
        .reset(reset),
        .q(q)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 ns period
    end

    // Stimulus
    initial begin

        reset = 1;
        #12 reset = 0;  // release reset

        #200; // run for some time
        $finish;
    end
endmodule

