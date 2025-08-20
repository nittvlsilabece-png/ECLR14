`timescale 1ns / 1ps

module seq1011_mealy_nooverlap (
    input clk, reset, x,
    output reg z
);
   parameter  S0= 3'b000, S1 = 3'b001, S10 = 3'b010, S101= 3'b011 ;
    reg [2:0] state, next_state;

    always @(*) begin
        z = 0;
        case(state)
            S0:   next_state = x ? S1    : S0;
            S1:   next_state = x ? S1    : S10;
            S10:  next_state = x ? S101  : S0;
            S101: begin
                     if(x) begin
                        z = 1; // detection
                        next_state = S0; // non-overlap
                     end
                     else next_state = S10;
                   end
            default: next_state = S0;
        endcase
    end

    always @(posedge clk or posedge reset) begin
        if(reset) state <= S0;
        else state <= next_state;
    end
endmodule



