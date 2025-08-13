module SR_FF_tb;
    reg S, R, clk, rst_n;
    wire Q, Qbar;
    SR_FF dut(.S(S), .R(R), .clk(clk), .rst_n(rst_n), .Q(Q), .Qbar(Qbar));
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin
        rst_n = 0; S=0; R=0; #12;
        rst_n = 1;
        S=0; R=0; #10;
        S=1; R=0; #10;
        S=0; R=1; #10;
        S=1; R=1; #10;
        S=0; R=0; #10;
        $finish;
    end
endmodule
