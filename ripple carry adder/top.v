// 1-bit Full Adder module
module FULL_ADDER (
    input A, B, Cin,  // Inputs: two bits to add, and carry-in
    output Sum,       // Output: sum bit
    output Cout       // Output: carry-out bit
);

    assign Sum = A ^ B ^ Cin;
    assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule

// 4-bit Ripple Carry Adder module
module RIPPLE_CARRY_ADDER4 (
    input [3:0] A,    // 4-bit input A
    input [3:0] B,    // 4-bit input B
    input Cin_in,     // Global Carry-in for the LSB
    output [3:0] S,   // 4-bit Sum output
    output Cout_out   // Final Carry-out
);

    // Internal wires for carry propagation between full adders
    wire c1, c2, c3;

    // Instantiate four 1-bit Full Adders
    FULL_ADDER fa0 (.A(A[0]),.B(B[0]),.Cin(Cin_in),.Sum(S[0]),.Cout(c1) );

    FULL_ADDER fa1 (  .A(A[1]), .B(B[1]),.Cin(c1),  .Sum(S[1]),.Cout(c2) );

    FULL_ADDER fa2 (   .A(A[2]),  .B(B[2]), .Cin(c2),  .Sum(S[2]),.Cout(c3) );

    FULL_ADDER fa3 (  .A(A[3]),  .B(B[3]),   .Cin(c3),   .Sum(S[3]), .Cout(Cout_out) 
    );

endmodule
