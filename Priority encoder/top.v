module priority_encoder8to3 (
    input  [7:0] in,
    output reg [2:0] out,
    output reg valid
);
    always @(*) begin
        valid = 1'b1; // assume at least one is high
        casex (in)
            8'b1xxxxxxx: out = 3'b111; // in[7]
            8'b01xxxxxx: out = 3'b110; // in[6]
            8'b001xxxxx: out = 3'b101; // in[5]
            8'b0001xxxx: out = 3'b100; // in[4]
            8'b00001xxx: out = 3'b011; // in[3]
            8'b000001xx: out = 3'b010; // in[2]
            8'b0000001x: out = 3'b001; // in[1]
            8'b00000001: out = 3'b000; // in[0]
            default: begin
                out   = 3'b000;
                valid = 1'b0; // no input active
            end
        endcase
    end
endmodule
