`timescale 1ns/1ps

module tb_half_adder;
    reg a, b;
    wire sum, carry;

    // Instantiate the Unit Under Test (UUT)
    half_adder uut (.a(a), .b(b), .sum(sum), .carry(carry));

    initial begin
        $display("A  B  | SUM  CARRY");
        $display("-------------------");
        a=0; b=0; #10;
        a=0; b=1; #10;
        a=1; b=0; #10;
        a=1; b=1; #10;
        $finish;
    end
endmodule