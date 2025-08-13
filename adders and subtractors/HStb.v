`timescale 1ns/1ps

module tb_half_subtractor;
    reg a, b;
    wire diff, borrow;

    half_subtractor uut (.a(a), .b(b), .diff(diff), .borrow(borrow));

    initial begin
        $display("A  B  | DIFF  BORROW");
        $display("--------------------");
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;
        $finish;
    end
endmodule