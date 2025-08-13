`timescale 1ns/1ps
module tb_pipo;
    reg clk, reset;
    reg [3:0] parallel_in;
    wire [3:0] parallel_out;

    pipo #(.N(4)) uut (.clk(clk), .reset(reset), .parallel_in(parallel_in), .parallel_out(parallel_out));

    always #5 clk = ~clk;

    initial begin
        clk = 0; reset = 1; parallel_in = 4'b0000;
        #10 reset = 0;

        parallel_in = 4'b1101; #10;
        parallel_in = 4'b1010; #10;

        $finish;
    end
endmodule

