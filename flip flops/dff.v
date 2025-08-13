module D_FF (
    input  wire D,
    input  wire clk,
    input  wire rst_n,
    output reg  Q,
    output wire Qbar
);
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            Q <= 1'b0;
        else
            Q <= D;
    end
    assign Qbar = ~Q;
endmodule

