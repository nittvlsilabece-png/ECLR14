module Comparator_4bit (
    input [3:0] A,
    input [3:0] B,
    output A_gt_B,
    output A_lt_B,
    output A_eq_B
);

// Using logic expressions
assign A_gt_B = (A > B);
assign A_lt_B = (A < B);
assign A_eq_B = (A == B);

endmodule

