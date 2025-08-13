module JK_FF (
    input  wire J,
    input  wire K,
    input  wire clk,
    input  wire rst_n,
    output reg  Q,
    output wire Qbar
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Q <= 1'b0;
        else begin
            case ({J,K})
                2'b00: Q <= Q;       // hold
                2'b01: Q <= 1'b0;    // reset
                2'b10: Q <= 1'b1;    // set
                2'b11: Q <= ~Q;      // toggle
            endcase
        end
    end
    assign Qbar = ~Q;
endmodule
