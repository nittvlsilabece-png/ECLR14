`timescale 1ns/1ps
module tb_siso;
    reg clk, reset, serial_in;
    wire serial_out;

    siso #(.N(4)) uut (.clk(clk), .reset(reset), .serial_in(serial_in), .serial_out(serial_out));

    always #5 clk = ~clk; // 100 MHz clock

    initial begin
        clk = 0; reset = 1; serial_in = 0;
        #10 reset = 0;

        serial_in = 1; #10;
        serial_in = 0; #10;
        serial_in = 1; #10;
        serial_in = 1; #10;
        serial_in = 0; #10;

        $finish;
    end
endmodule

