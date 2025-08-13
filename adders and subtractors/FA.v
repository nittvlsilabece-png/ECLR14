// Full Adder 

module full_adder (
    input  a, b, cin,
    output sum, carry
);
    assign sum   = a ^ b ^ cin; 
    assign carry = (a & b) | (cin & (a ^ b));
endmodule
