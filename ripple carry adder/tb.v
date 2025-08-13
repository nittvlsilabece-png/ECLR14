
module RIPPLE_CARRY_ADDER4_tb;
  
    reg [3:0] A;
    reg [3:0] B;
    reg Cin_in;
    wire [3:0] S;
    wire Cout_out;
    // Instantiate the Device Under Test (DUT)
    RIPPLE_CARRY_ADDER4 dut ( .A(A),    .B(B),  .Cin_in(Cin_in),  .S(S), .Cout_out(Cout_out) );
 
    initial begin
        A = 4'b0000; B = 4'b0000; Cin_in = 1'b0; #10;
        A = 4'b0001; B = 4'b0010; Cin_in = 1'b0; #10; 
        A = 4'b0011; B = 4'b0100; Cin_in = 1'b0; #10; 
        A = 4'b0101; B = 4'b0010; Cin_in = 1'b0; #10;
        A = 4'b0111; B = 4'b0001; Cin_in = 1'b0; #10; 
        A = 4'b1001; B = 4'b0100; Cin_in = 1'b0; #10; 
        A = 4'b1111; B = 4'b0000; Cin_in = 1'b0; #10; 
        A = 4'b1111; B = 4'b0001; Cin_in = 1'b0; #10; 
    
        $finish;
    end
endmodule
