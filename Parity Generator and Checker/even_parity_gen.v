module even_parity_gen (
    input  [3:0] data,
    output parity
);
    assign parity = ^data;  // XOR reduction operator
endmodule
