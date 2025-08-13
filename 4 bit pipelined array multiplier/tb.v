// Testbench for Signed Pipelined Multiplier
module tbcsmsignpipe;

reg signed [3:0] a, b;
reg clk1, clk2;
wire signed [7:0] y;

// Instantiate the Unit Under Test (UUT)
csmsignedpipe uut (
    .a(a),
    .b(b),
    .clk1(clk1),
    .clk2(clk2),
    .y(y)
);

// Apply input test cases
initial begin
    // Apply test vectors at delays
    #4   a =  4;  b = -2;  // 4 * -2 = -8
    #20  a = -8;  b =  7;  // -8 * 7 = -56
    #20  a =  4;  b =  4;  // 4 * 4 = 16
    #20  a =  5;  b = -4;  // 5 * -4 = -20
    #20  a =  3;  b = -2;  // 3 * -2 = -6
    #20  a =  7;  b =  7;  // 7 * 7 = 49

    #60  $finish;          // End simulation
end

// Clock generation for clk1 and clk2
initial begin
    clk1 = 0;
    clk2 = 0;

    repeat (20) begin
        #5  clk1 = 1;  #5  clk1 = 0;
        #5  clk2 = 1;  #5  clk2 = 0;
    end
end

endmodule
