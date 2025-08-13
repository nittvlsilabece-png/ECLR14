module universal_shift_reg #(parameter N = 4) (
    input  clk, reset,
    input  [1:0] mode,       // 00: hold, 01: shift right, 10: shift left, 11: parallel load
    input  serial_in_left, serial_in_right,
    input  [N-1:0] parallel_in,
    output reg [N-1:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else begin
            case (mode)
                2'b00: q <= q; // hold
                2'b01: q <= {serial_in_left, q[N-1:1]}; // shift right
                2'b10: q <= {q[N-2:0], serial_in_right}; // shift left
                2'b11: q <= parallel_in; // parallel load
                default: q <= q;
            endcase
        end
    end
endmodule

