module T_FF (
    input  wire T,
    input  wire clk,
    input  wire rst_n,
    output reg  Q,
    output wire Qbar
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
        else
            Q <= Q; // hold
    end
    assign Qbar = ~Q;
endmodule
