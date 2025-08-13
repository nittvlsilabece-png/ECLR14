module piso #(parameter N = 4) (
    input  clk, reset, load,
    input  [N-1:0] parallel_in,
    output serial_out
);
    reg [N-1:0] shift_reg;

    always @(posedge clk or posedge reset) begin
        if (reset)
            shift_reg <= 0;
        else if (load)
            shift_reg <= parallel_in;
        else
            shift_reg <= {1'b0, shift_reg[N-1:1]};
    end

    assign serial_out = shift_reg[0];
endmodule

