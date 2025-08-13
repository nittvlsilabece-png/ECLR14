// Half Subtractor

module half_subtractor (
    input  a, b,
    output diff, borrow
);
    assign diff   = a ^ b;     // XOR for difference
    assign borrow = (~a) & b;  // NOT A AND B
endmodule