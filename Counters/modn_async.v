`timescale 1ns/1ps

module modN_async_counter #(
    parameter N = 10,               // Modulus
    parameter WIDTH = $clog2(N)     // Counter bit width
)(
    input  wire clk,                // Clock to LSB flip-flop
    input  wire reset,              // Asynchronous reset (active high)
    input  wire enable,             // Enable counting
    output reg [WIDTH-1:0] count,   // Counter value
    output wire tc                  // Terminal count
);

    assign tc = (count == N-1);     // High when last count reached

    always @(posedge clk or posedge reset) begin
        if (reset)
            count <= 0;
        else if (enable)
            count <= count + 1;
    end

    // Wrap-around for Mod-N
    always @(posedge clk) begin
        if (count >= N)
            count <= 0;
    end

endmodule
