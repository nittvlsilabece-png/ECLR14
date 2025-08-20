`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2025 19:25:30
// Design Name: 
// Module Name: seq1011_mealy_overlap
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


module seq1011_mealy_overlap (
    input clk, reset, x,
    output reg z
);
    parameter S0= 3'b000, S1= 3'b001, S10=3'b010, S101= 3'b011;
    reg [2:0] state, next_state;

    always @(*) begin
        z = 0;
        case(state)
            S0:   next_state = x ? S1    : S0;
            S1:   next_state = x ? S1    : S10;
            S10:  next_state = x ? S101  : S0;
            S101: begin
                     if(x) begin
                        z = 1; // sequence 1011 detected
                        next_state = S1; // overlap allowed
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

