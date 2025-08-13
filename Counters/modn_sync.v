`timescale 1ns/1ps

module modN_counter #(
    parameter N = 10,            // Modulus
    parameter WIDTH = $clog2(N)  // Counter width in bits
)(
    input  wire clk,             // Clock input
    input  wire reset,           // Active-high synchronous reset
    input  wire enable,          // Count enable
    output reg  [WIDTH-1:0] count, // Current counter value
    output wire tc               // Terminal count flag (high at N-1)
);

    // Terminal count condition
    assign tc = (count == N-1);

    always @(posedge clk) begin
        if (reset) begin
            count <= 0;
        end
        else if (enable) begin
            if (tc)
                count <= 0;      // Wrap around when N-1 reached
            else
                count <= count + 1;
        end
    end
endmodule
