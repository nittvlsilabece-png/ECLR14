module EdgeDetectorFSM (
    input clk,
    input rst_n,
    input signal_in,
    output reg edge_out
);

    // State encoding
    parameter LOW  = 1'b0;
    parameter HIGH = 1'b1;

    reg current_state, next_state;

    // State register
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            current_state <= LOW;
        else
            current_state <= next_state;
    end

    // Next state logic
    always @(*) begin
        case (current_state)
            LOW:  next_state = signal_in ? HIGH : LOW;
            HIGH: next_state = signal_in ? HIGH : LOW;
            default: next_state = LOW;
        endcase
    end

    // Output logic (registered Mealy style)
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            edge_out <= 1'b0;
        else begin
            if (current_state == LOW && signal_in == 1'b1)
                edge_out <= 1'b1;  // rising edge
            else
                edge_out <= 1'b0;
        end
    end

endmodule
