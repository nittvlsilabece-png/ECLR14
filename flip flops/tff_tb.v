module T_FF_tb;
    reg T, clk, rst_n;
    wire Q, Qbar;
    T_FF dut(.T(T), .clk(clk), .rst_n(rst_n), .Q(Q), .Qbar(Qbar));
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin
        rst_n = 0; T=0; #12;
        rst_n = 1;
        T = 0; #10;
        T = 1; #10;
        T = 1; #10;
        T = 0; #10;
        $finish;
    end
endmodule
