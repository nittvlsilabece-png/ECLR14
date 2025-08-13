`timescale 1ns/1ps
module tb_bidir;
    reg clk, reset, dir, serial_in;
    wire [3:0] q;

    bidir_shift_reg #(.N(4)) uut (.clk(clk), .reset(reset), .dir(dir), .serial_in(serial_in), .q(q));

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; dir = 0; serial_in = 0;
        #10 reset = 0;

        // Shift right
        dir = 0; serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;

        // Shift left
        dir = 1; serial_in = 1; #10;
        serial_in = 0; #10;

        $finish;
    end
endmodule

