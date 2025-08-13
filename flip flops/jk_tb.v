module JK_FF_tb;
    reg J, K, clk, rst_n;
    wire Q, Qbar;
    JK_FF dut(.J(J), .K(K), .clk(clk), .rst_n(rst_n), .Q(Q), .Qbar(Qbar));
    initial begin clk = 0; forever #5 clk = ~clk; end
    initial begin
        rst_n = 0; J=0; K=0; #12;
        rst_n = 1;
        J=0; K=0; #10;
        J=1; K=0; #10;
        J=0; K=1; #10;
        J=1; K=1; #20;
        $finish;
    end
endmodule
