// JK Flip-Flop Module
module jk_ff (
    input clk, reset, j, k,
    output reg q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else begin
            case ({j, k})
                2'b00: q <= q;      // No change
                2'b01: q <= 0;      // Reset
                2'b10: q <= 1;      // Set
                2'b11: q <= ~q;     // Toggle
            endcase
        end
    end
endmodule

// 4-bit Synchronous Up Counter using JK FF
module sync_up_counter_jk (
    input clk, reset,
    output [3:0] q
);
    wire j0, k0, j1, k1, j2, k2, j3, k3;

    // In synchronous counter, all flip-flops share same clock
    assign j0 = 1;  
    assign k0 = 1;
    assign j1 = q[0];  
    assign k1 = q[0];
    assign j2 = q[0] & q[1];  
    assign k2 = q[0] & q[1];
    assign j3 = q[0] & q[1] & q[2];  
    assign k3 = q[0] & q[1] & q[2];

    jk_ff ff0 (.clk(clk), .reset(reset), .j(j0), .k(k0), .q(q[0]));
    jk_ff ff1 (.clk(clk), .reset(reset), .j(j1), .k(k1), .q(q[1]));
    jk_ff ff2 (.clk(clk), .reset(reset), .j(j2), .k(k2), .q(q[2]));
    jk_ff ff3 (.clk(clk), .reset(reset), .j(j3), .k(k3), .q(q[3]));
endmodule

