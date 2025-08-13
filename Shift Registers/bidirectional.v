module bidir_shift_reg #(parameter N = 4) (
    input  clk, reset, dir, // dir=0 -> right, dir=1 -> left
    input  serial_in,
    output reg [N-1:0] q
);
    always @(posedge clk or posedge reset) begin
        if (reset)
            q <= 0;
        else if (dir == 1'b0)
            q <= {serial_in, q[N-1:1]}; // shift right
        else
            q <= {q[N-2:0], serial_in}; // shift left
    end
endmodule

