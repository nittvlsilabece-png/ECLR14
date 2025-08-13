
module gray_counter(
    input  wire clk,
    input  wire rst,        // Active high reset
    output reg [3:0] gray
);

    reg [3:0] count;        // Normal binary counter

    always @(posedge clk or posedge rst) begin
        if (rst)
            count <= 4'b0000;
        else
            count <= count + 1;
    end

    // Combinational logic to convert binary -> Gray code
    always @(*) begin
        gray = count ^ (count >> 1);
    end

endmodule
