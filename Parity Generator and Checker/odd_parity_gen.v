// Odd Parity Generator (4-bit example)
module odd_parity_gen (
    input  [3:0] data,
    output parity
);
    assign parity = ~(^data);
endmodule
