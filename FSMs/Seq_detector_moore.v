`timescale 1ns / 1ps


module seq1011_moore_nooverlap (
    input clk, reset, x,
    output reg z
);
    parameter  S0 = 3'b000, S1 = 3'b001, S10 = 3'b010, S101 = 3'b011, S1011= 3'b100;
    reg [2:0] state, next_state;

    always @(*) begin
        case(state)
            S0:   next_state = x ? S1    : S0;
            S1:   next_state = x ? S1    : S10;
            S10:  next_state = x ? S101  : S0;
            S101: next_state = x ? S1011 : S10;
            S1011:next_state = S0; // non-overlap ? reset after detection
            default: next_state = S0;
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if(reset) state <= S0;
        else state <= next_state;
    end

    always @(*) begin
        z = (state == S1011);
    end
endmodule


