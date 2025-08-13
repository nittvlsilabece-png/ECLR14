`timescale 1ns/1ps
module tb_piso;
    reg clk, reset, load;
    reg [3:0] parallel_in;
    wire serial_out;

    piso #(.N(4)) uut (.clk(clk), .reset(reset), .load(load), .parallel_in(parallel_in), .serial_out(serial_out));

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; load = 0; parallel_in = 4'b1011;
        #10 reset = 0;

        // Load parallel data
        load = 1; #10;
        load = 0;

        // Shift out serially
        #40;

        $finish;
    end
endmodule

