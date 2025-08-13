module johnson_counter(
    input  wire clk,
    input  wire rst,       // Active high reset
    output reg  [3:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0000;             // Start from 0000
        else
            q <= {~q[0], q[3:1]};     // Shift right, MSB gets inverted LSB
    end

endmodule
