// Odd Parity Checker (4-bit example)
module odd_parity_check (
    input  [3:0] data,
    input  parity,
    output error
);
    assign error = ~^{data, parity}; // 0 means correct, 1 means error
endmodule
