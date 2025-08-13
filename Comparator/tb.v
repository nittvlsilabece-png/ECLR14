`timescale 1ns/1ps

module tb_Comparator_4bit;

  reg [3:0] A, B;
  wire A_gt_B, A_lt_B, A_eq_B;

  // Instantiate the comparator module
  Comparator_4bit uut (
    .A(A),
    .B(B),
    .A_gt_B(A_gt_B),
    .A_lt_B(A_lt_B),
    .A_eq_B(A_eq_B)
  );

  initial begin
    // Test cases
    A = 4'h0; B = 4'h8; #10;
    A = 4'h8; B = 4'h10; #10;
    A = 4'h5; B = 4'h5; #10;
    A = 4'h2; B = 4'h1; #10;
    A = 4'h1; B = 4'h0; #10;

    $finish;
  end

endmodule
