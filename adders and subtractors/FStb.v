`timescale 1ns/1ps

module tb_full_subtractor;
    reg a, b, bin;
    wire diff, borrow;

    full_subtractor uut (.a(a), .b(b), .bin(bin), .diff(diff), .borrow(borrow));

    initial begin
        $display("A  B  Bin  | DIFF  BORROW");
        $display("-------------------------");
        a=0; b=0; bin=0; #10;
        a=0; b=0; bin=1; #10;
        a=0; b=1; bin=0; #10;
        a=0; b=1; bin=1; #10;
        a=1; b=0; bin=0; #10;
        a=1; b=0; bin=1; #10;
        a=1; b=1; bin=0; #10;
        a=1; b=1; bin=1; #10;
        $finish;
    end
endmodule
