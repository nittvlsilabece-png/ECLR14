module sipo #(parameter N = 4) (
    input  clk, reset, serial_in,
    output [N-1:0] parallel_out
);
    reg [N-1:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 0;
        else
            shift_reg <= {shift_reg[N-2:0], serial_in};
    end

    assign parallel_out = shift_reg;
endmodule

