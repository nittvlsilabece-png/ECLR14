module SR_FF (
    input  wire S,
    input  wire R,
    input  wire clk,
    input  wire rst_n,  // active-low reset
    output reg  Q,
    output wire Qbar
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Q <= 1'b0;
        else begin
            case ({S,R})
                2'b00: Q <= Q;       // hold
                2'b01: Q <= 1'b0;    // reset
                2'b10: Q <= 1'b1;    // set
                2'b11: Q <= 1'bx;    // invalid
            endcase
        end
    end
    assign Qbar = ~Q;
endmodule
