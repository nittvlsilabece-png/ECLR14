module ring_counter(
    input  wire clk,
    input  wire rst,      // Active high reset
    output reg  [3:0] q
);

    always @(posedge clk or posedge rst) begin
        if (rst)
            q <= 4'b0001;            // Start from 0001
        else
            q <= {q[2:0], q[3]};     // Rotate left
    end

endmodule
