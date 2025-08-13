module tb_priority_encoder8to3;
    reg  [7:0] in;
    wire [2:0] out;
    wire valid;

    priority_encoder8to3 uut (.in(in), .out(out), .valid(valid));

    initial begin
        $display("In         | Out | Valid");
        $display("-------------------------");

        in = 8'b00000001; #10; // only bit0 high
        in = 8'b00000101; #10; // bits 0 & 2 high -> priority to bit2
        in = 8'b01000010; #10; // bits 1 & 6 high -> priority to bit6
        in = 8'b10000000; #10; // only bit7 high
        in = 8'b00000000; #10; // no bits high

        $finish;
    end
endmodule
