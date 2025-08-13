module D_FF_tb;
    reg D, clk, rst_n;
    wire Q, Qbar;
    D_FF dut(.D(D), .clk(clk), .rst_n(rst_n), .Q(Q), .Qbar(Qbar));
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin
        rst_n = 0; D = 0; #12;
        rst_n = 1;
        D = 1; #10;
        D = 0; #10;
        D = 1; #10;
        $finish;
    end
endmodule

