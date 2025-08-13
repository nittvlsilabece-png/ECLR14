`timescale 1ns/1ps
module tb_universal;
    reg clk, reset;
    reg [1:0] mode; // 00 hold, 01 shift right, 10 shift left, 11 load
    reg serial_in_left, serial_in_right;
    reg [3:0] parallel_in;
    wire [3:0] q;

    universal_shift_reg #(.N(4)) uut (
        .clk(clk), .reset(reset), .mode(mode),
        .serial_in_left(serial_in_left), .serial_in_right(serial_in_right),
        .parallel_in(parallel_in), .q(q)
    );

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; mode = 2'b00;
        serial_in_left = 0; serial_in_right = 0;
        parallel_in = 4'b1010;
        #10 reset = 0;

        // Parallel load
        mode = 2'b11; #10;

        // Shift right twice
        mode = 2'b01; serial_in_left = 1; #10;
        serial_in_left = 0; #10;

        // Shift left twice
        mode = 2'b10; serial_in_right = 1; #10;
        serial_in_right = 0; #10;

        // Hold
        mode = 2'b00; #10;

        $finish;
    end
endmodule

