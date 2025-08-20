`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 19:18:33
// Design Name: 
// Module Name: tb_seq1011
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module tb_seq1011;
    reg clk, reset, x;
    wire z;

    // Change DUT here for different versions
    seq1011_moore_overlap dut (.clk(clk), .reset(reset), .x(x), .z(z));

    // Clock gen
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Stimulus
    initial begin
        reset = 1; x = 0;
        #12 reset = 0;

        // Input sequence: 1011011 (contains overlapping "1011")
        #10 x=1; #10 x=0; #10 x=1; #10 x=1;
        #10 x=0; #10 x=1; #10 x=1;

        #30 $finish;
    end

    // Monitor
    initial begin
        $monitor("Time=%0t, x=%b, z=%b", $time, x, z);
    end
endmodule
