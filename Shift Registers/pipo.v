module pipo #(parameter N = 4) (
    input  clk, reset,
    input  [N-1:0] parallel_in,
    output reg [N-1:0] parallel_out
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            parallel_out <= 0;
        else
            parallel_out <= parallel_in;
    end
endmodule

