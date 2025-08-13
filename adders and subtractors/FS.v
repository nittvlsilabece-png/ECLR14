// Full Subtractor 

module full_subtractor (
    input  a, b, bin,
    output diff, borrow
);
    assign diff   = a ^ b ^ bin; 
    assign borrow = (~a & b) | (bin & (~(a ^ b)));
endmodule