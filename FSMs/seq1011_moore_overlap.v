`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 18:11:00
// Design Name: 
// Module Name: seq1011_moore_overlap
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module seq1011_moore_overlap (
    input clk, reset, x,
    output reg z
);
    // State encoding
    parameter S0 = 3'b000, S1=3'b001, S10=3'b010, S101=3'b011, S1011=3'b100 ;
    reg [2:0] state, next_state;

    // Next state logic
    always @(*) begin
        case(state)
            S0:   next_state = x ? S1    : S0;
            S1:   next_state = x ? S1    : S10;
            S10:  next_state = x ? S101  : S0;
            S101: next_state = x ? S1011 : S10;
            S1011:next_state = x ? S1    : S10; // overlap allowed
            default: next_state = S0;
        endcase
    end

    // State register
    always @(posedge clk or posedge reset) begin
        if(reset) state <= S0;
        else state <= next_state;
    end

    // Output logic (Moore ? depends only on state)
    always @(*) begin
        z = (state == S1011);
    end
endmodule

