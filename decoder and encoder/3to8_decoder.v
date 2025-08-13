module decoder3to8 (
    input  [2:0] in,
    output reg [7:0] out
);
    always @(*) begin
        out = 8'b00000000;   // default all outputs 0
        out[in] = 1'b1;      // set selected output high
    end
endmodule
